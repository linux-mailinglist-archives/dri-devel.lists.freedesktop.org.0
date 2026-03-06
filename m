Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDCZLJiGrWkC4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7CD230A82
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611F810E432;
	Sun,  8 Mar 2026 14:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ckHhBA9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592A910E3F2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 20:20:01 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-38a4118c4f7so13142401fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 12:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772828399; cv=none;
 d=google.com; s=arc-20240605;
 b=P/iD1nUI/aUN7Bx8a5AD8XTX0PmXCBOvzZylUO1Kp8E+SHtpU2Dh+/NnLpmxFVtad3
 ruZ9LaucHJC9VkA/Iab2pzr+j2E8kCFW9/aWew7/k28xTsR628L0BzlZNR2eO0GBiKQ8
 IBALp1zdY5sz3Oa6g5c6EtVgefv4Onim5UTE7RknMKj48HmCCpb9CITigUOQeKeU4uD5
 PxvAaSrI0UNFuI5V+NI1NM7IkwCmyV0xZhKY3sE6xpY8zffayegvPGHDF3Snr8tcZ7vr
 B+tGUDLmwDIsilx4NMmsWE0OR8ySxa4y3RPT7pJMKcDZgDYUf9OEi48oMGeuJ4j5gdTj
 TIng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=02UtVONLR/Mnt9XIWD7vInj0gAX1V2YD39D2ZYc0z54=;
 fh=gWtqg1b71yARfmh4/+7cbL1RtToj49JY75H/minDtJ0=;
 b=Yp0/6xr/Z0ByKyb3ynEC26YX7HcThZKnmlTtlRTlIi+GUTCSTDdWvQJckgikCCzZNk
 XUsCZXWar9PW1C3M3wLZuZr0o3M7g2TSlKu1My6+2Cn6huIoEY0sm0D65JHHvmbPmvk8
 sOODA1RqdZP8f9GAsBtVqgeSAFya+cwRLovJytzXYTmhhhRVgtQYtJE7ycCkKUe1+DDM
 lHTUp2lpHpIWDqxA8I0QOoBp0zJwBz9St0JFCMhf42v4Zj2AxpO8p+E90FL7VdWKDXfE
 c7xKLFj4sJSu53bv15Ebl/NZsKUQ1tbfLhdeohKJE+OnilxZUDw3Z7Z2HMOaFpF4rb1B
 byDg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772828399; x=1773433199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=02UtVONLR/Mnt9XIWD7vInj0gAX1V2YD39D2ZYc0z54=;
 b=ckHhBA9o/7EHqg5K+y0fgp1JjQRjz9xQmxVOqd0HrTHcIru0HgV36X3hvRaW/uIGHR
 WQxriGT/AWVE3zzEghzOs552S9dd247z//4NsleiGzhVzDVT8W3h4x9w8wUgh8Oy3SCK
 ljtmmDtKORjodwyTnUyMyJMXWresgTLFyn9E0mp8hGnnP+abGsjjhWS6T2mpYyCCKFVS
 OkLJC+jFTPv7x+mG/pDeOTm1fEG/4/JZhkZ95eiXn1oNz/tQVfOPaebwdc+Kl3WuAA8W
 L1QWKIpmQ2KGbHTXYxmXvzBMDJWV0Y6g0rfJe4Afa+jiS515cf0817HpBCKIEmK4/Azo
 Barg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772828399; x=1773433199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=02UtVONLR/Mnt9XIWD7vInj0gAX1V2YD39D2ZYc0z54=;
 b=CuSuanN+msr2ZUk500mYTuRN79DoqcfPV2TEoZ++OUna62vpfoQdI0E8fyXW/SRf3T
 YWkUJA8Jpsnqh+5+wzzVBfbX/WfQUg0mSxW516+kcmuqKdJwFy1WkbynESriN3Sz0Wz5
 SwrNX/YUb6kPja73jdJlIbhVSzE2wFc0quOzt9z0F7dFOrjhyzPb0N3IT1cE+ztgIjrq
 pkmab/1fx9P75PSpBUGeNYBsuu+pbGWWuEjPWnCxgqwJAOOsmY5MFHXqCuaHeQaU80qr
 QYm8jP6hGPim0wnw685P1sr2XY+S2wzvFQMdRynUaNVIJpiSkjS5FrQZjTfOCyuvyO3O
 RzlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjWgOKuc4ZEa4Da1iBfclukkmZONpjX7INumHFV5IsqnX5l15354xE2DGr/sOxdAkU1YLBO+k7OCM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXqWI1rUpBR3BIYqeYZw6Spgab/FNDGyuONtr+wMdPH1wJxDBi
 vZjzbVLtzxfLWoujt4VcdYHXCIUw5B5PKADLt0WJrCxM3aY6rM8zrZsztBdF3a/rs32FPCzJzwI
 dHrciKkTqwPQVGnhte6NlNUfrSm3jdNs=
X-Gm-Gg: ATEYQzw9ICBZ88fJXcVnSBsRIQAboPcbXxHVr5wSrizDLpaQCx7P40q+WG4s1kvdpCq
 hn7+lMGxQy70wQe/nPAY5T1bonPjdAy1QCJROBZDfBTsrXn70GY1ZqGjY7rVlzxFfLtoS0TWK2/
 ithIOy6nJN7Y42f9eI7HqXfYD5XJK7qBRRnxq20a3GTO27GXpO522LaBEoM4Qe0Iiq1rga1WAca
 bB/m8TM+TBA4SUqYcjHbHvDaWlBxw/kohe9QNUYBvG779saDXN2k92ytWlOhyvwq++VQfN/dp7Z
 zIkfEpyH
X-Received: by 2002:a05:6512:39ce:b0:5a1:2738:faa1 with SMTP id
 2adb3069b0e04-5a13ccaff75mr1211409e87.17.1772828399265; Fri, 06 Mar 2026
 12:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20260306092518.37849-1-mitltlatltl@gmail.com>
 <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
In-Reply-To: <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
From: =?UTF-8?B?0JXQstCz0LXQvdC40Lkg0JvQtdC/0YjQuNC5?= <fekz115@gmail.com>
Date: Fri, 6 Mar 2026 23:19:48 +0300
X-Gm-Features: AaiRm50OyrjTonmpW7cWhh3JWqXbBdsWbzC6qs6eblkKyDIRpVR1vHGgUauyhIs
Message-ID: <CAAjZPThsEGKFY_z+w9p+c1_L4CZOhkba=hz2kmAyVoMUiXMVPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, Danila Tikhonov <danila@jiaxyga.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: ED7CD230A82
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DATE_IN_PAST(1.00)[42];
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:danila@jiaxyga.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fekz115@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fekz115@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,jiaxyga.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi,

I have a concern regarding this patch. The Nothing Phone (1)
(sm7325-nothing-spacewar), which is already supported in mainline,
utilizes a panel with bpc=3D10 and bpp=3D8 (DSC) [1].

Currently, this configuration works properly. While I have encountered
minor graphical artifacts during brightness changes, the display
output is otherwise reliable across all supported refresh rates
(60/90/120 Hz).

Since this panel is already upstreamed, this patch might cause regressions.

[1] https://github.com/NothingOSS/android_kernel_devicetree_nothing_sm7325/=
blob/6f027f0440e3dce8a674d9cbd2f6ad944120e209/msm-extra/display-devicetree/=
display/dsi-panel-rm692e5-visionox-fhd-plus-120hz-cmd.dtsi#L483-L484

Best regards,
Eugene Lepshy

=D0=BF=D1=82, 6 =D0=BC=D0=B0=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:47, Dmit=
ry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com>:
>
> On Fri, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:
> > In upstream the msm, for bpc greater than 8 are not supported yet,
> > although the hardware block supports this. Remove them until we
> > support them.
> >
> > Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits p=
er component")
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>
> I hope Marijn, Danila or Eugeny can comment. The patch series with this
> patchset added 10 bpc panel and used it for one of the phones.
>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index e8e83ee61e..b60b26ddb0 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_ds=
i_host *msm_host, struct drm_dsc
> >
> >       switch (dsc->bits_per_component) {
> >       case 8:
> > -     case 10:
> > -     case 12:
> >               /*
> > -              * Only 8, 10, and 12 bpc are supported for DSC 1.1 block=
.
> > -              * If additional bpc values need to be supported, update
> > -              * this quard with the appropriate DSC version verificati=
on.
> > +              * In the upstream msm, only 8 bpc is supported for DSC 1=
.1/1.2
> > +              * block.
> >                */
> >               break;
> >       default:
> > --
> > 2.53.0
> >
>
> --
> With best wishes
> Dmitry
