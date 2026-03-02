Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFiTHqNGpWkg7AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:13:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA1F1D47E1
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7AB10E450;
	Mon,  2 Mar 2026 08:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EZuuPqLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2022C10E450
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 08:13:19 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43992e3f9b8so4301398f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 00:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772439197; cv=none;
 d=google.com; s=arc-20240605;
 b=CQhy0o8IrT/1EKeehfaNpiKiYFM9JIHMZZAgnXrUM1QvARikxV7F/FEc6EoCMVtXKi
 JAjOU/YhMX968J8ZP5cfqcB5KYvR8k+AjIUUgMs8yMFA8BjN8J3AqOs/HxiRPVkYpK6V
 uxvpLmsPoKxXuT5UVH1+042Qkhz6REuryHdRcjM7iKco+3TdSp7yfT2CnpYTGHSh9qJo
 3VBmO6ff+g2eveE+Rdf+8DRBU/eXA2A1YVufvBkQ/qq2jKfFuyE871TIQxiWrsjA4duS
 A2A15eQ3ww3D0pzCscaFGTQ7t+9hsb2ARfJwZ0JaFaR0Y7V8SI0fTo9BtEhRvmJ2J3Bm
 kK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
 fh=wt9yI6NYMIDJhWapWsyfnsfsvnFAJTjnjjvz91qLqTw=;
 b=JdgxpgDeQT0tsqlNTrGrLNr44dZts+ftsi23DovXwu+ixyIHiTkH2n0q9ZSMUpQqRm
 48YM0V0UaBbLmAIU4vZvmaeFxkc2jVGF4b4QC++Vei+8BS2kF8rYBklNOQMSqQTlEGfC
 9PJDJSVwDM0xjIEs6TtMgki5+l3ZtvoBsnmClLTLxLzLFSi3loM0bu0rchOwN9+sT7IQ
 pQpJw2bot3Mt6fETuLHNdHVuA5Kzx8ECPhYuG1DjEGm8I84O8JMkZZTPd42T7hWgQTRf
 FtiCz38ZcYlJy86LiB+gMT//zBzXpxwVlDV8NfTM+u2NnN3OeVQvO2jJsz0jn4pTsoHk
 xY/w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772439197; x=1773043997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
 b=EZuuPqLr8CU6Rq7swV1kjWqHVhBO5BOHvzFJo+DBXIyIvCJK2Kg1hRafc+xnkTJs9N
 g+yWSZTJF9cAqB1u9I6LSAMsak0eLVzR3uSuEej02HFjB8BHO6zQCo6J/bb+Bth9fTG4
 Yb6F26IW0NHJVR31xFskbRkpguuAzcziD+n9hQmgzMkoy2PHfb8CkBv8H76iIUw+8Sxl
 u1a6lt4tgkh5ypFntV6Wi0alP3myBGSzp+G3qo0zuMY4lFWuWvNV1dEBc8wN2UFg8yGm
 nl06D2STx0h1Kswjdah6ZXpkZJKOMPmiis8lYOdBSvayy1aG6MyncOtv7GxGOZ0YRalX
 1K1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772439197; x=1773043997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
 b=RsOUXS1HYBFi7VeXEO6PDRqnEP5ifBxb3B3HQBe6FYXvSOklt8i6l6yh0avLTnkY2K
 +QAaIyKV+FncUsaZXtxMH79iMMLW3/zS41Ar7/UPfBadqqyB8o4fpo0g23oBQcW+cCmS
 rHzp054sPR9yLsQw6AHTkFcO/5kqYWGxAiAr6KO7AwFpUmgqvN4EnCSMfT+Ply/+Yowo
 YwW2n29kOq55e0brookZR0hNelHhRzFmdZgz/xx12ktPq5L0FJXFXdXEahX00DLAmxLo
 9kZpQDixz/9kl3Z08MpUztAFCrSjaP1pnVYJz1NCVAnPBpAecCT74hUjSwlgkRxEWDAV
 clqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWihsEEhc2bs5D9p1yKpm60yEFqty1fYn4uQQflOgj/i/g+dCHrhbxXvPZr4iEvsbBgMDrVAmz3XDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7ZGee4GfyJCczw+zEAzizB1EsNP8flSEanPNBI13pJQu8jF1W
 T44T36HdKkpCtClfkqOiyKiB50KgeRrhq12J6tOa4GhBsG2OUgAWg9mIwSYD2eaKjh323l5Cmuc
 r/UF2tBTyxjsVBSED+vNHhciyvM6npO0=
X-Gm-Gg: ATEYQzzdHw3e6m6iEcz88GTo2FgOmz5v5LfgwQQfFMDleDliqK1luDPh7gJuoKAUjBW
 0d4l21g+zpiPylm0cpNC73fIA1hlfJt/7AJEqUfQ4tWeb7RPkGjRA/vSwD+VM0l8/7O5Tc+YU4S
 ayWwJdsGBUj1FbDjIuWICKp1ApdKPV0h6LHe/3MH2huxAIdkjlDLWlRwFrvNIthXJohW1RFdYtw
 NLlouj/W35B8hZCaLyD2x1K3qwkNQNdVQudUCs9mmvXS0pIlGKtK9M2dHdI9nDJ5B1LSOuqw0Ug
 9rQrZlbR
X-Received: by 2002:a05:6000:4011:b0:439:b922:8479 with SMTP id
 ffacd0b85a97d-439b92285dfmr2649252f8f.36.1772439197286; Mon, 02 Mar 2026
 00:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20260130124932.351328-1-clamor95@gmail.com>
 <20260130124932.351328-6-clamor95@gmail.com>
 <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com>
 <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
In-Reply-To: <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 10:13:06 +0200
X-Gm-Features: AaiRm513PJ2Vl3yAaZ9EK2Cx-_p8na7NMdLvn762xKViUHPZp6XfmHs_ZYNwew4
Message-ID: <CAPVz0n2rv3aey+7dVdtGeQfdgVpyMczp=RTKeg8V5SxNPr5-Xg@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] gpu: host1x: convert MIPI to use operation
 function pointers
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
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
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,ffwll.ch,kernel.org,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: DAA1F1D47E1
X-Rspamd-Action: no action

=D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:09 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:52 Lu=
ca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hello Svyatoslav,
> >
> > On Fri Jan 30, 2026 at 1:49 PM CET, Svyatoslav Ryhel wrote:
> > > Convert existing MIPI code to use operation function pointers, a nece=
ssary
> > > step for supporting Tegra20/Tegra30 SoCs. All common MIPI configurati=
on
> > > that is SoC-independent remains in mipi.c, while all SoC-specific cod=
e is
> > > moved to tegra114-mipi.c (The naming matches the first SoC generation=
 with
> > > a dedicated calibration block). Shared structures and function calls =
are
> > > placed into tegra-mipi-cal.h.
> > >
> > > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, paral=
lel camera
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
> >
> > I wanted to test this series on top of v7.0-rc1, but applying this patc=
h
> > fails (with b4 shazam). Can you rebase and send a new iteration?
> >
>
> kzalloc(sizeof(*mipidev), GFP_KERNEL) > kzalloc_obj(*mipidev)
>

Hello Luca!

Thank you for still being interested in this endeavor. Sorry for such
a brief answer, I was very short on time. I have rebased changes on
top of v7.0 but ATM I still have a bit of time constrains and I have
to test them on my device. I will send rebased v7 ASAP.

Best regards,
Svyatoslav R.

> > Best regards,
> > Luca
> >
> > --
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
