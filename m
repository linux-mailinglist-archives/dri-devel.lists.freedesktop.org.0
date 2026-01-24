Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB7WI3gpdWmwBQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 21:20:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6227EDB3
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 21:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074E610E15D;
	Sat, 24 Jan 2026 20:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bWX9z/gf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3155C10E15D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 20:20:04 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-432755545fcso2367353f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 12:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769286003; cv=none;
 d=google.com; s=arc-20240605;
 b=Y7LNHe92QDy2Fqp/glhrGicsgA52zBTdxhXgICvsiZMdfBf4eGF30vvedRghRlpRjT
 wr/IuXWYHXHLaj/Nff/uZX93cPvKa6lLT3B6xE4kLWgeMDH0S1JNwTdJmmNzKe2hi7b+
 Tg0lPrfT/oorkg5URpAVbgUVOOeiVN+uoyqARCfLExcUGKVaUuS/DuXwngzk/MZlL0Tk
 lSkPWIsfZCO9UJCwjMwXmpTHmtqU3HnN6o0KmJL9qz+TsmRsSvQLCqnl/4AFx439taai
 fQzTwOHwXUYjOaJluBT8zNvIEqwEtEaOaUXaW4JaqWS2sNcf7Hnpc9UZ1dm1bkq4MMPw
 jNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5IvQvVO47AehbyLG9Cg7wRdRPasY+7er+DvV1ut13R4=;
 fh=0iDPRJ4Kd3Oxwgz/3vOmHWBYSouxgZ2IC2M2Tn0Mw1s=;
 b=kxklF3cwP/9HvWDGriIGTLEAG0GHfPjU66ioAX7xKPTZRVgzNNc8wwO1osMnuArwlP
 bJWxGuLRl11meZYyjgUnYUx2CAjjMM3K75OTMZv/ygp3w1Up06tpNPZTpObWbrw9PQKc
 LmapKT2u4KiLXgGLtpBoDRIUsV7ew3SJfPGux8by6Ecdju/qthMgfDahoo4lotmZw1bh
 Bdv23kb4aTuL1s+5nlJR+0sugO8KNKRY64FMzORaPH3kGlDKIlQyjbpQ1HHumlWa+IJ1
 NDQC8LggthjRlmxD4ZOhX58SlAco0ebz5WUta1nA+bfq/QtBuz8i4e11sAZSj43x47sF
 +lzQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769286003; x=1769890803; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5IvQvVO47AehbyLG9Cg7wRdRPasY+7er+DvV1ut13R4=;
 b=bWX9z/gfaAtSjBGi7OzfM+3OrNgm65H2kA5Tl5jZsc8kfpDhOI7vRAtE1v7aZp/9V0
 iBQ6l/doL3GlwlgU525oartPCJoxE5C3yAb6rpiuDVoCX9R/kC8uv1XXB0gvcfGdrh07
 qozIsmm3vi02ndNlEuXeVVhUWoYIDFrrjrNP3kh4pDqfzrktAlvIqVW8uSOz05U7XwoS
 wW8r/Ah/3lSK60nPnfJ6Dy0LTsjwS0yhjfGT8JDbeTBwHhR09YWOy7L9pgmHXavJYQS6
 Nd52Dww8LaABxG//9OQ9Hn55R5Eq/MiPu4g7xOsWmKmifV2TZB/rYBivhJUdz3C9B3GD
 +lCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769286003; x=1769890803;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5IvQvVO47AehbyLG9Cg7wRdRPasY+7er+DvV1ut13R4=;
 b=D9K8VwlIk7t8zmpT989z+XoTVV0Ulwtm5OF1iP2r00kHgeKTTsUsO4JZorXeA8/rIa
 j0JWWJucb4IONJqPNTB0wUcO4OLWez+vHgZ46P0rgyp/a8/Fn3IuGAPpgerijYD3Iiqx
 OAkCAqP4k5VtyKg2hU4wRaH4nlrQEY2X310ZT2GwnOdbknV0bw8c58d1XKpywmomiSRK
 85pl+efeDJXwaE4jJ1zgY5VCjVTwoZc/p43FSnwwMfcvvI4g4wnDn8pbQ4/pGAE2MHm/
 JOhYHDhpPqx/tUyqoPaiQK2sw4bRECvhO8NnTAWpBWDXxQwxp8uhqnwEZ5AZGugMWaQB
 JaPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+DaxPdon9jbEdYH4sZINk+5LLZb348Sl5PFsmf8uTru2WIHCLkA9MCNTd0GJx8kXKGgfbbTh8GrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywc5curzj3135betKRN4Dx6VnjuCIoOr+H9ISdMFA/S+QN3K8yo
 CFbaKF9bS3S2er8P8FZNuRdtwQ/xAWAcEl8EP7jFj+0Y6aRU9DfQKY+jGfcnu2R4rHlc5y2qEXE
 ZbEv7IfpB8Ds/rfebS0JoS8Xs0HShTdc=
X-Gm-Gg: AZuq6aLjDkn3QNfyaBVGL5mjT/gSeEObA7FmqCNaW2B6ppdFCXGi6604Inhtsr3yfjb
 6yXG4tR2+/Hut3C2PbisfzIQT5JHhHTPJZHTImiSNNJ/r32x9fT/OS2HHiPXc32DqOicjPCFy1y
 XnvPkO4rSDU95A9n9jSm/UrG5SN/bKaj4XuoOHiuVU8Ghp8l2oZxnkWsp2RaE7Qd0GQUBD/C4AL
 6LNa2/G/cFfP8WT2lXNGZe6Cd5plDEAceZkeGAc++XE1/ljEH7HhwLHNN9nqDe21MBMbi+x
X-Received: by 2002:a05:6000:288e:b0:431:752:672b with SMTP id
 ffacd0b85a97d-435b159556dmr11734663f8f.14.1769286002389; Sat, 24 Jan 2026
 12:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20251204061703.5579-1-clamor95@gmail.com>
 <20251204061703.5579-3-clamor95@gmail.com>
 <7012249.lOV4Wx5bFT@senjougahara>
 <CAPVz0n3JEHtUOq4qaZbqPu97NXdYxx_=5im4rxoEWi8EbKmKEw@mail.gmail.com>
In-Reply-To: <CAPVz0n3JEHtUOq4qaZbqPu97NXdYxx_=5im4rxoEWi8EbKmKEw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 24 Jan 2026 22:19:51 +0200
X-Gm-Features: AZwV_QiGF7B_Re4bWRTdgXNS-XzkdDJdBkm2AnW07YovL950WfU-W10tVO3KO9M
Message-ID: <CAPVz0n2PZRSLyKNBAA+nfH66ujbvmQVQbG=6Ai_5sBe3U_dyPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4 RESEND] gpu/drm: tegra: dsi: move prepare function
 to the top of encoder enable
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mperttunen@nvidia.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:treding@nvidia.com,m:jonathanh@nvidia.com,m:pgaikwad@nvidia.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:digetx@gmail.com,m:charan.pedumuru@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,m:charanpedumuru@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nvidia.com,baylibre.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CA6227EDB3
X-Rspamd-Action: no action

=D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 09:49 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=87=D1=82, 15 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 07:54 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thursday, December 4, 2025 3:17=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > The tegra_dsi_prepare function performs hardware setup and should be
> > > called before any register readings or there will be a risk of device
> > > hangup on register access. To avoid this situation, tegra_dsi_prepare=
 must
> > > be called at the beginning of tegra_dsi_encoder_enable.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/gpu/drm/tegra/dsi.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.=
c
> > > index 278bf2c85524..8e80c7efe8b4 100644
> > > --- a/drivers/gpu/drm/tegra/dsi.c
> > > +++ b/drivers/gpu/drm/tegra/dsi.c
> > > @@ -914,6 +914,12 @@ static void tegra_dsi_encoder_enable(struct drm_=
encoder *encoder)
> > >       u32 value;
> > >       int err;
> > >
> > > +     err =3D tegra_dsi_prepare(dsi);
> > > +     if (err < 0) {
> > > +             dev_err(dsi->dev, "failed to prepare: %d\n", err);
> > > +             return;
> > > +     }
> > > +
> > >       /* If the bootloader enabled DSI it needs to be disabled
> > >        * in order for the panel initialization commands to be
> > >        * properly sent.
> > > @@ -923,12 +929,6 @@ static void tegra_dsi_encoder_enable(struct drm_=
encoder *encoder)
> > >       if (value & DSI_POWER_CONTROL_ENABLE)
> > >               tegra_dsi_disable(dsi);
> > >
> > > -     err =3D tegra_dsi_prepare(dsi);
> > > -     if (err < 0) {
> > > -             dev_err(dsi->dev, "failed to prepare: %d\n", err);
> > > -             return;
> > > -     }
> > > -
> > >       state =3D tegra_dsi_get_state(dsi);
> > >
> > >       tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
> > >
> >
> > The section of code before the tegra_dsi_prepare call was removed in 'R=
evert "drm/tegra: dsi: Clear enable register if powered by bootloader"', so=
 this patch should no longer be necessary.
> >
> > Mikko
> >
>
> You are correct. I have found this when rebasing onto v6.18 which was
> much later then this series was resent. Obviously, this patch would be
> dropped on the next resend/v3. Sorry for inconvenience.
>

Actually, "Revert "drm/tegra: dsi: Clear enable register if powered by
bootloader"" causes a  regression for me (DSI on Tegra20 device,
Motorola Atrix 4G). DSI initiated by bootloader will be stuck if not
disabled pre reconfiguration, Dmitry was right by bringing that
change, but he did not take into account that if DSI is accessed from
cold state (not configured by bootloader), device will hang. This
patch addresses this behavior of Dmitry's patch and prevents
regression introduced by reverting it.

> >
> >
