Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPMiOtnHq2mZgwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 07:38:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B86922A62D
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 07:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB19510E416;
	Sat,  7 Mar 2026 06:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iG5/fmIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FCC10E416
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 06:38:13 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-94de4f5531eso3233785241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 22:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772865492; cv=none;
 d=google.com; s=arc-20240605;
 b=CLKEsYGqHtKV+5NNy4K+7Knj7Bufl1RN5zMq67J1GW7gCOwaFNetvirG3OeB07bX36
 aIgcZp61Ub7zl03K4N0QIxl9pn5TEhlUA7YToiF/1Miw0ereLgTe4dtV3bLd7mNqxbo3
 1eBkV23MAqgSpNd/zS7wD7ahGhDYijqOAE9WMbJzN2dKXyntyFnbFYss7xxrJUsV/U6Z
 wWgeKOX/UtRjKetjDgZDGi/8rJ5qLyaeOPfCd0202eDh3mpcmNOUhDUBNvuHbVxTi0l+
 MU7TRqTjHsMxmNUEBHUpvwHAsDK04WyWb9/KsYlPyI4wKWfqxyjntxXQ+bk5+8YLugxK
 I/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EBVEj6M68804v9va0+q2jki79x2IL4Aa9REwQR+xUpI=;
 fh=9YO37rTE7TD9cVBtHcm54UGveT0dec/JPJeKLPr2AOw=;
 b=V2M5ToUy5Ouwh0z+fAxJdfggrQkaS+D4CLORtcs9D2HB/s4HJ75O9aNLSNZBuzTCR8
 RdV/mb0jebaeRa3R7ubsPPdfsn0PlxZDyxgLKLgrHPRYwEmBKnnb1QG5Jo3SPS8U/BJw
 LnS1SQX+dRv23OEGxPqoEDQ7dDnf90+neajQaa0hnVKNjNaDwtSBWN6GIygZ4j08CHZA
 AT3MhzOnuh+Tcryr6zRnPrFK/m2eyihh2gyi9M+cNeT+pu8QY1iYtbaASEk54BJqbVHu
 mkXL1fdYgIQj2epOXPSc+/UwNgADUjwDzGWfdt6IzxD+LQtOZazeamkYlB+rJYm9SPe6
 8+Lg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772865492; x=1773470292; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBVEj6M68804v9va0+q2jki79x2IL4Aa9REwQR+xUpI=;
 b=iG5/fmIhi3QVvgR1mjnK5FZrGhE6yelqKRAwIEglzWUd2zICktKFifY37PKHNTW4qa
 i7EXSPkCiQAnsC+jlmmVwQn/Je0kW8lFsKeqPe2G34Al21i//JmThZdDcYNwnrzMZJu/
 lCKlXWIzdWONxsHAM1Z52FRSo0xTkR+hpsuqf378Io2rlAUhN+NMlBSCAXuqwpLBmfjB
 Lse+CBmRu3EukXFdNWA4o7WVm2UqehIw/HzJJT7rvpED/Trn5Y/wgZ2BzmndBi3OUtTT
 gSrxcJXtlkyRRl0WGjtTg+9sHfN6IJapStsBLVEqVNivlKIkZCGMO17GjRpakw7V1QAg
 se2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772865492; x=1773470292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EBVEj6M68804v9va0+q2jki79x2IL4Aa9REwQR+xUpI=;
 b=h7OvfXSZBqcqq7J+R/b1MCqwQMti4rPCvTsKSnCEuGX83J1EpK8YCLGjdsYdSMSb4a
 fAXzN6IaYgMpjan2LVk6aEWZdVPzjhDjgZ6vRyp9FgiTtpX5wvYLYgretofAdb/9XbEP
 8bHK/HTpysLAQ41impL9Ec3190FBZaAENhGYHoaCe64B6RJoJ5I48PeEjXKu6elvhbgC
 xtBM8YaoC77FoJE4fFIdnkm2QmuMcqiaiuJQ8suHgn5cvEyfU4xoEdEsOI14lWWytNga
 PasRNCix75jYJJqrft9yGGgtUfElDdmt11da0hrN9kvGfTwuFd4UFOQlKD1XakE8Vh/1
 /TxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKN32A6stn1tVXDpcVJrCnfPAeVpzBg7dFGaBJHIzwsp6dh4rUbwHSt91qIjvxwcrhxSLVnX4UNfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAqmk1gaI0kzTFd1b1uL6fAUE6UEEqg87nYLsnSkNrF7U78uZh
 gmBxiTkkQgUx7yp/UN/wtIol0B4nI27UqYVdYk+gdfEYWhJuXNgpJG1I/QZy6jj9WBqhe9ej6qc
 yh80Ay8IRnsxBLCi9U60d+mYL1xRqdGU=
X-Gm-Gg: ATEYQzyvLjSGM9vPUQ9biCK0vU14xMbNXSAscHGLX6Pjbf0rt0d7O1Mi4t/hAqWyLyJ
 Gk2o8kKXEmjE6QMTR6HEoY5ZtR41anhUQCXynwx6RZNswAR9rb4Ywe1PEWQCXFGRxE47Miw0VF9
 0yAkJGQR7tWHjIJ55XXao1xYjWofYnxH4548TKUiAXBIbMggMq71BGpX2gxSQx7ERa5oAkLKtGZ
 AM4tMmLILxN+kGZp4GZHhxzpwJCOAU1uqmVBozhm0uD6cRKYHDFzgilcrmpIfJJ2yxqOxwAJY7p
 F1bZgtyb
X-Received: by 2002:a05:6102:3a0b:b0:5f5:40ab:2d65 with SMTP id
 ada2fe7eead31-5ffe614cb63mr1619980137.22.1772865492332; Fri, 06 Mar 2026
 22:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20260306092518.37849-1-mitltlatltl@gmail.com>
 <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
 <CAAjZPThsEGKFY_z+w9p+c1_L4CZOhkba=hz2kmAyVoMUiXMVPQ@mail.gmail.com>
In-Reply-To: <CAAjZPThsEGKFY_z+w9p+c1_L4CZOhkba=hz2kmAyVoMUiXMVPQ@mail.gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 7 Mar 2026 14:37:51 +0800
X-Gm-Features: AaiRm51z5Jl0rIbfj9Qhdy98oqHJyd1EH7rdlZU1JRZ1VO1ldASebfgwROZoW5I
Message-ID: <CAH2e8h6zQRi5XKLpb5bnQAdamc9qp06PvUU=AqVbtOq-g4OTyA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
To: =?UTF-8?B?0JXQstCz0LXQvdC40Lkg0JvQtdC/0YjQuNC5?= <fekz115@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Danila Tikhonov <danila@jiaxyga.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
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
X-Rspamd-Queue-Id: 9B86922A62D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fekz115@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:danila@jiaxyga.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,jiaxyga.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Sat, Mar 7, 2026 at 4:20=E2=80=AFAM =D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=
=D0=B9 =D0=9B=D0=B5=D0=BF=D1=88=D0=B8=D0=B9 <fekz115@gmail.com> wrote:
>
> Hi,
>
> I have a concern regarding this patch. The Nothing Phone (1)
> (sm7325-nothing-spacewar), which is already supported in mainline,
> utilizes a panel with bpc=3D10 and bpp=3D8 (DSC) [1].
>
> Currently, this configuration works properly. While I have encountered
> minor graphical artifacts during brightness changes, the display
> output is otherwise reliable across all supported refresh rates
> (60/90/120 Hz).
>
> Since this panel is already upstreamed, this patch might cause regression=
s.
>
> [1] https://github.com/NothingOSS/android_kernel_devicetree_nothing_sm732=
5/blob/6f027f0440e3dce8a674d9cbd2f6ad944120e209/msm-extra/display-devicetre=
e/display/dsi-panel-rm692e5-visionox-fhd-plus-120hz-cmd.dtsi#L483-L484
>


Oh, I see. I messed up bpc, it is fine now. Recently, encoders have
supported src bpc > 8, dsi don't support dst bpc > 8. But the nothing
phone panel does not require dsi to support it.

Since the panel is a 8-bit panel, and src bpc !=3D dst bpc. Although they
are equal on some devices(they are, on my 8-bit or 10-bit devices).

i.e. qcom,mdss-dsc-bit-per-component !=3D qcom,mdss-dsi-bpp / 3

Please ignore this patch.

Best wishes,
Pengyu

> Best regards,
> Eugene Lepshy
>
> =D0=BF=D1=82, 6 =D0=BC=D0=B0=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:47, Dm=
itry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com>:
> >
> > On Fri, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:
> > > In upstream the msm, for bpc greater than 8 are not supported yet,
> > > although the hardware block supports this. Remove them until we
> > > support them.
> > >
> > > Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits=
 per component")
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >
> > I hope Marijn, Danila or Eugeny can comment. The patch series with this
> > patchset added 10 bpc panel and used it for one of the phones.
> >
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
> > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm=
/dsi/dsi_host.c
> > > index e8e83ee61e..b60b26ddb0 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_=
dsi_host *msm_host, struct drm_dsc
> > >
> > >       switch (dsc->bits_per_component) {
> > >       case 8:
> > > -     case 10:
> > > -     case 12:
> > >               /*
> > > -              * Only 8, 10, and 12 bpc are supported for DSC 1.1 blo=
ck.
> > > -              * If additional bpc values need to be supported, updat=
e
> > > -              * this quard with the appropriate DSC version verifica=
tion.
> > > +              * In the upstream msm, only 8 bpc is supported for DSC=
 1.1/1.2
> > > +              * block.
> > >                */
> > >               break;
> > >       default:
> > > --
> > > 2.53.0
> > >
> >
> > --
> > With best wishes
> > Dmitry
