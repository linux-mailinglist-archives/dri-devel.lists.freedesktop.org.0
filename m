Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF98B40B61
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 19:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6B910E021;
	Tue,  2 Sep 2025 17:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="idAGZWiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA6D10E021
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 17:00:00 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-328015abe0bso102400a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1756832400; x=1757437200;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6sx/eWzBaFotQQku5gjUvj/pIO8VOIElH8+WudO86yI=;
 b=idAGZWiqloo/iHyfPyWXTXd65jCZuPB+iTzDxZpeRAQYDqVnyR54lRz2dkL8X/o9bW
 moa376++QLrfsohfHdz5wSEL26F78p7J1zQdKtqKIFfkWlhM1CGKbA6pllfscbPPHXDc
 HL2J71E+vEBCfnFQuzVf9Hse/hUZFdJ1a6GKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756832400; x=1757437200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6sx/eWzBaFotQQku5gjUvj/pIO8VOIElH8+WudO86yI=;
 b=ksIjYLW77LbpUDMzSeuD2kFFgyWqdoJRscvgFpGYeHo4zsfmTJOFm4LlC1Gm+eaOIG
 LuU9MaIyRHBRxyfWbKfJLufKbWqnZV89mcG5ZsBvwvud2HX3ldHynu/Vk6ro5+kNML5O
 t6e4IDNlt0JKDlh2DQXBQsfnAujqKf7xCycP5GMlumMDTMnUTbjSSjG5vWiZXfp7K1IG
 xgXE8kFeoJru5LNYLnIQSpvZZ4IL9mMaPiNMiRr6jsQTJBZBLRoufp2uBNT6qNE6VWdV
 4nTFqImciAmXqTxZbNF7TiLy+06QDvvZVY9cCqGJc3sIpA0Dh8N+st1O8ZGjcfzQKzME
 lhKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkblZfXWk/P4OF/peV75QGRLO2OIk+hcEG2u2g43BhuG8pEPsKxx2ZLnC404XoUgXO5p7Vqm/IK/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwikOuupHWR8OR8pCSlJR5F4tqMmyLiTTAcc0bP9xOWOWJEibZs
 oO7rDlym2jMFm8bAq9dgCHAla8skxvGpHpZMlPTzios1doEoyqYfsZHuB4rKSL2xtiYWUJn0Pro
 6QnY=
X-Gm-Gg: ASbGncuT1Pxti/KYo1r1vOZkw+mSwsAqZ9Vgsz3UwgabCWtl33CXDg41eVK3K72IwuG
 ldHwqgyAtffLeQYc8Er6D7IfTRMaHu/pNE54wvjpiM+Htdikd7Qpb0Kn8KSX6AbyP0cC0cWjlF0
 whc7k7kDXjdOOCVpigHVwxyk1cmN3dAxiIl56o3yJofw5fLf3QAfE15GaAOmVVhB4+Kl+NonDRd
 Q1JJOHAGHXpg63uE/KFSrYLZu8HzEWCVLc9Eb671MOSk5jowjv62WnlsZVx7LeOAvyGj74jGhTE
 kMfBiPHHaJIdHp2gCYTGpHkFQWX1b2cqctkTCdHUEDHFL+WFkHEmBlUmHoZ5ETSYQ7GashsA4H1
 KBBO5sa8pEzel+Q+zwCJ+5wS0L5AqP0HYMzW2yizEyTmKL8RKIePCHoeoQ8gRvOWD+w==
X-Google-Smtp-Source: AGHT+IERWYxDKQ78djJQctsS7666KmgKgt8GQyOFacB1xcLASg0alABdAtHkn736faD5GmoMTN9e1A==
X-Received: by 2002:a17:90b:1dcc:b0:324:e74a:117c with SMTP id
 98e67ed59e1d1-3280d362848mr16806255a91.13.1756832399881; 
 Tue, 02 Sep 2025 09:59:59 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com.
 [209.85.215.169]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4dc245bfa6sm10594363a12.42.2025.09.02.09.59.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 09:59:59 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b4c72e4f1b6so60129a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 09:59:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWWxYNPpkH1H4DY8gGnZ/ClifdHF3Y7b74CeI9AKCkSjdlb5TTJxfD+evYDv3lLhzdYJ17yQlNz9rI=@lists.freedesktop.org
X-Received: by 2002:a17:903:32c6:b0:249:37b2:8629 with SMTP id
 d9443c01a7336-249448d70efmr144203085ad.9.1756832398561; Tue, 02 Sep 2025
 09:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250821122341.1257286-1-mwalle@kernel.org>
 <CAD=FV=Xt-DPHRddZM=t-KTWiGouNfm_QpPps3MA6csd+j=YO+A@mail.gmail.com>
 <CAD=FV=XCOPeEgpjvCuDjT=OjEk1P8vszL6iJqkY-DcpXtpXTjA@mail.gmail.com>
 <DCH8VNHTN1LM.3068OZU8IMK3Q@kernel.org>
In-Reply-To: <DCH8VNHTN1LM.3068OZU8IMK3Q@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Sep 2025 09:59:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UmZGyd9rYP_o33wC5kmLjipKgfTpJANQSpoaHTygEBgw@mail.gmail.com>
X-Gm-Features: Ac12FXxDmRDCsG9DVPcoNOc_dFYn_Vhfyw89OEI_5qUo5EjmfZKE4uUeH5xTVKw
Message-ID: <CAD=FV=UmZGyd9rYP_o33wC5kmLjipKgfTpJANQSpoaHTygEBgw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: fix REFCLK setting
To: Michael Walle <mwalle@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>
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

Hi,

On Sun, Aug 31, 2025 at 11:20=E2=80=AFPM Michael Walle <mwalle@kernel.org> =
wrote:
>
> Hi,
>
> On Fri Aug 29, 2025 at 12:52 AM CEST, Doug Anderson wrote:
> > > On Thu, Aug 21, 2025 at 5:23=E2=80=AFAM Michael Walle <mwalle@kernel.=
org> wrote:
> > > >
> > > > The bridge has three bootstrap pins which are sampled to determine =
the
> > > > frequency of the external reference clock. The driver will also
> > > > (over)write that setting. But it seems this is racy after the bridg=
e is
> > > > enabled. It was observed that although the driver write the correct
> > > > value (by sniffing on the I2C bus), the register has the wrong valu=
e.
> > > > The datasheet states that the GPIO lines have to be stable for at l=
east
> > > > 5us after asserting the EN signal. Thus, there seems to be some log=
ic
> > > > which samples the GPIO lines and this logic appears to overwrite th=
e
> > > > register value which was set by the driver. Waiting 20us after
> > > > asserting the EN line resolves this issue.
> > > >
> > > > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > nit: officially you're supposed to move your Signed-off-by all the wa=
y
> > > at the bottom of all the other tags any time you post a patch. I don'=
t
> > > think it's important enough to re-send, though.
> > >
> > > In any case, thanks for re-posting. I guess it kinda stagnated. I'll
> > > give this another week on the list and then plan to apply to
> > > drm-misc-fixes unless there are any other comments.
> >
> > I realized that this is lacking a Fixes: tag. I went back and
> > confirmed that even in the first version of the driver, AKA commit
> > a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver"),
> > we still had no delay between these two lines:
> >
> > pm_runtime_get_sync(pdata->dev);
> >
> > /* configure bridge ref_clk */
> > ti_sn_bridge_set_refclk_freq(pdata);
> >
> > ...and the last line of the runtime resume function was turning on the
> > enable. So I believe this means that the bug has always been there.
> > Does that sound right to others? If so, I'll add that Fixes tag when
> > applying.,..
>
> Yes, that's right. Thanks for amending the patch.

Pushed to drm-misc-fixes:

[1/1] drm/bridge: ti-sn65dsi86: fix REFCLK setting
      commit: bdd5a14e660062114bdebaef9ad52adf04970a89
