Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB99LolGnWmoOAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 07:34:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFE6182783
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 07:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BCA10E4B9;
	Tue, 24 Feb 2026 06:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k/XBPJGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E80F10E4B7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:34:45 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-567404384b7so3694680e0c.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:34:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771914884; cv=none;
 d=google.com; s=arc-20240605;
 b=kZlkx5CFTCuVlJdmlEJCVzaQ/v1KkyKN812W3TililNWq6q7hp4A6nQTXkzhrV8meg
 oGcUAcRSg785huAdiOLcXKcHiDqNK+DUGwB2VP+jyH06OZrk2kaSVkJDKaDqUniq5RPc
 xATsI32CuIKFNJSMU/FkRs8g6guFfcJ0y8U/JX4X1qZ43cWJzFsRfl2JKhHFHE5TYpMw
 POlC8OZOf+xMakJJ7MxlGf5Dt6SYP1a5R0k78TLjSMaXjMdzj2H/fcxAyk0aDvkAhEVb
 oFMnl6/+vwL/jklZuAtkrJ+hA93ivMHzxVPtMfeIzq/3XiXWxd6l7ATkLefvl62ZB75I
 M52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=d2CPXZMwBEzuRIcw3U3ix9zDLQTmW++Pgz7opdGg5e4=;
 fh=eE6tb/u3JtAA6iPnBJhIOXnTqz49cOcQE2cXkWuNMOg=;
 b=M2tnKm0iwlKkZUEfU4pI0dtDDnXRyfzpIbkqAPVSLriEOnty8R18iXP4lGeZsfQ6TG
 SuvHHvY1Boy6Xg/+lXuaI5gVnx+aS7Ev0pG/zHvDHQYgpQCdo1cWMzsOgp5kieEbeWOn
 dkRQ1goTT5Al5W5qaJzojl6jGnhz0luGSlMS/MCtWIk5tEbQvvnGe6OJ8fEoqjzeXhWm
 PD3sjRawksGKoR1mVAfh/TpZSv9/pWJ77uIqjSoWP1nztUuigxU0bX90AQd0S7UOgmJR
 Y9FCp3LAxXXLIk88XXs1Ntcy9v9XgHBa3y8aXuvxvjwNJajp1i2rjEuRy2lsTJ8FVnMu
 qq8Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771914884; x=1772519684; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2CPXZMwBEzuRIcw3U3ix9zDLQTmW++Pgz7opdGg5e4=;
 b=k/XBPJGZTkzV8bC51epwE9oNEg1kXQeAD+utA/Wb2bXeqBssfaae8/blNPGLrOIsTO
 nnaOJe4S5kBJnf5lUiSztLquCnlvZwmFBg9BFOYfueIfCtGuZrBrXucsI/HdOG/eAulP
 cFFG8/cs8x6BYhFdQEYFx+GZl0dDOD0d2Li1l5LdQXbT395B+IL7s3qdk3z8wbDYUsgv
 I7KJ4Fqngsir5Sn8YE4pAz+InJKp5YWBWPw+tLRAdhaw2bcYXio/Nuw71B4cU8BW+Yci
 qpcXKJlbv1gkpLZTW6oeJVyqZtdSd/liugOWA5Q0EW9QRLYUuANRlx8hBWo6ibEfFs3O
 xyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771914884; x=1772519684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d2CPXZMwBEzuRIcw3U3ix9zDLQTmW++Pgz7opdGg5e4=;
 b=Crbz2/kybPvljx8CB7EuieIQfBSTR1SeCdbifmR5FWrv1dhOMJEfprGnAzuCy6oQnp
 bOqC+9ShJgNNwcCGM83idz5Atg29mLeHYxuo2sl1okwvvx6x7l/gQXUUIV2o1UdiX+xN
 TRsfZRHP/D0Gp3ns5ieOEYu9LE8IKqPGlIPe7kGP+gHww/FbCm9y39b4zNbfkXpoG0X7
 q9DKG2cpazzxNl5cG3zghir3jpAXNuf4x+W9tF2ThumepEfLsbsZzNK78/3xPTMSKp8V
 gMw6UzK4+gbENPvsLekuoLTjQiP2M7yQta2jleEUBAo+p+cy56QRotMT4RZ6M0l2ePn2
 x4EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP7e4jqKZCnkNs0WExPjTfXnRErlZeM3zLKkhqniOOyUEKo/czwkwd3UMoT7yOi2/f/RvxcIBuMfk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywoqm2xwZ8TKjhhTWnQW2Rl8vQ3o7H5ZGDYUVdipq0pcbJZ8MII
 o89mE8Nph3Cz56S8g4xgrvVRRgMliMwT5b76rB0vmfy6PfrggSOSgPAhqylGTtpZRSMeYCrIlnO
 Gi9GQ3OsgdZWqyJcCAzGcQCa+oHvEe2Q=
X-Gm-Gg: ATEYQzx42yDMyabvzF50wpaD9J4oPOk4t1AL/YGSXpv+M6go18DfWBGf+FUCbezioaQ
 xfrb+MqGlfDN0kqBABYChw23Iy6+hloIVIHKyYXUElpGx+ghWkU1NlQKSdbimERv1Q5UxFbEKfX
 Oj4DdLxYh98Yh0h0qWDcLaFGWJNAzYHULAm5W4dxXowfolUfym6eaGrjGj7iRpCg0926dQ+RJ/4
 YU7jiuJHPpkP0KFE6qMmrX8y7frb6FfkTjp5qA2rmOyO5/qbmaSLEhpA0lD+3C5lHxtzvs/fNiJ
 OhBbB2mjPw+HpNXRVg==
X-Received: by 2002:a05:6102:2921:b0:5ef:a9fb:f1f3 with SMTP id
 ada2fe7eead31-5feb2eeabbbmr6024557137.11.1771914883670; Mon, 23 Feb 2026
 22:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20260214105145.105308-1-mitltlatltl@gmail.com>
 <wou62ifuvwru3mu3m5msuuolvou2ivkxbqjz4efy625cnnxagu@s3ofi33zqveq>
In-Reply-To: <wou62ifuvwru3mu3m5msuuolvou2ivkxbqjz4efy625cnnxagu@s3ofi33zqveq>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 24 Feb 2026 14:34:28 +0800
X-Gm-Features: AaiRm51R8L3iou4npU1vpdD5DZL9EpRpSawFc34RE0Bv8lB-h8L2KEIydo9ihY0
Message-ID: <CAH2e8h5_iBk5eiOpBi8yTa24LGNCxutA3HX72dKazKGo=XK61w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming
 dsi registers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6AFE6182783
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 7:35=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Feb 14, 2026 at 06:51:28PM +0800, Pengyu Luo wrote:
> > Recently, the hdisplay calculation is working for 3:1 compressed ratio
> > only. If we have a video panel with DSC BPP =3D 8, and BPC =3D 10, we s=
till
> > use the default bits_per_pclk =3D 24, then we get the wrong hdisplay. W=
e
> > can draw the conclusion by cross-comparing the calculation with the
> > calculation in dsi_adjust_pclk_for_compression().
> >
> > Since CMD mode does not use this, we can remove
> > !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.
> >
> > Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> Could you please point out, which platform / device are you using to
> test this code?
>
Hi, Dmitry.

I was using Lenovo Yoga Tab Plus(sm8650), it is equipped with a
native 10-bit panel, the resolution is 2944 x 1840.

I am using Lenovo Legion Y700 Gen4(sm8750), it is equipped with a
native 10-bit panel too, the resolution is 1904 x 3040.

I witnessed that the DSI_ACTIVE_H_END bits in REG_DSI_ACTIVE_H are wrong.
For Y700 (panel in 8 dsc bpp and 10 bpc mode)
Upstream: 0x015e0020
0x015e - 0x0020 =3D 318 =3D DIV_ROUND_UP(1904 / 2 * 8,  24)
Downstream: 0x011e0020
0x011e - 0x0020 =3D 254 =3D DIV_ROUND_UP(1904 / 2 * 8,  30)

dsi_adjust_pclk_for_compression() did:
new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
                            dsc->bits_per_component * 3);
new_hdisplay will be halved later for bonded dsi.

Original calculation must be wrong, though it is unused. We can refer
to the downstream too.

Addition: To support 10-bit for dsi, more fixes are required. e.g.
programming VID_DST_FORMAT_RGB101010 into REG_DSI_VID_CFG0
adding MIPI_DSI_FMT_RGB101010 and bpp conversion into drm mipi dsi
fixing DSC RC parameters? Recently DRM_DSC_1_1_PRE_SCR is hardcoded
etc.

I just brought up the panel in 8 dsc bpp and 8 bpc mode. I will try
8 dsc bpp and 10 bpc mode after a while.

Best wishes,
Pengyu
