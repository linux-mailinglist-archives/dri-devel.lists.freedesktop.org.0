Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBTNG0e8c2kmyQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 19:21:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C97982C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 19:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FA510E2E5;
	Fri, 23 Jan 2026 18:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SvidBkv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BA110E2E4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 18:21:54 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-352f60d6c2fso1806298a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 10:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769192514; cv=none;
 d=google.com; s=arc-20240605;
 b=WyPEI1+icVzfpEyCYLbpzufRTV8DQ56V+1K/DDQFb9v0Qq/pdvDtByPasn2nmvz3ow
 GgubvxkA50fJRW5wDklPz/bOGGtoTEtjv5uiL/D5xMmXO4c/H5vJcjlJfohYs+Kmw5iw
 n8MMGClenjiZ3HBBaxZcwltU2FwO0dMVzOZX8OrR4t50MtbyX5QPBJrQkhQXU/bsM8Fi
 +5H4qd42/MdudDYPPacgUcGzjzR/sXTUzJoyH73i4ZBlQiG91cZE94Seg6UfpHoRojtL
 myX0LqT4Xvcke4+Ku4LM4SY51R8B2sVT+Mb80iBCck7JPYDIFHr+sPOWZ7eJE4+1kR0C
 lmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yCV0rABcHHLAJwar86UEQL7DmpIVuCp1PbvDYYKyGWE=;
 fh=QEs8PfewDVq20MZwyJD30rGqoiNNw3TSh8MZYY+PDZc=;
 b=MCuoLr3hzg7Y9+vzQ9fdLjBC2bLSRKkoqcuFioJsPpiO4auiesf/esMiCd4c/32yoA
 dmZY4GQabcYKGvVNuhmk0XmkgjTzOkv0/ysUA6hDAdT7kgc3bQCh57jsZPw6ybtUk0It
 rbaJajf1t35ZpOZCsvQIuu5QzwfvFU9rm8GKWPHazyFmCjQJEM9Z0OUSvPlEZU2O9+3P
 Oqhs7jlbZqIpZ7xWHTDIBp2tXmngUzejluYW1sMqoZr6miWig3fjogNiLzZzZ/ZrefqR
 DSvnJXJMfwL1lQ7JHpZrcUrMLr+BHB9fmJdzDOuTb7Myb5QX/evrzHa/e4VNgyh6F+Qi
 u/Yg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769192514; x=1769797314; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCV0rABcHHLAJwar86UEQL7DmpIVuCp1PbvDYYKyGWE=;
 b=SvidBkv9R0NvniV0IeaXTXxeWINDtlLvxLQ59whYHbCBU6ZNKrCe0YqW9qT3auMk4m
 wMpjUWahpkM++RpnkiDt8tRyzj81FjBzB48QWgunDs8aTd5AR8bS7dWoDMIQXcMLw1Sp
 F/xpUy09p67f5X59BsqaSi6r0FfHUvjvLB7MMY5DlTPShPpkZ6XDqtXrQtzCDQuIrA3w
 UZSEy+CQJIydfjjEd7UIK6Ynasn8ovjeWXoxxd2vYkMogGtWCW1fbcFr3k6ax5basqHU
 odxMF5GsGN7bs/TjOseLPcKhiTqEAdCWzNtzepSlYRjk6v98GLFC5zqtYDJXKUbKUH4/
 0wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769192514; x=1769797314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yCV0rABcHHLAJwar86UEQL7DmpIVuCp1PbvDYYKyGWE=;
 b=w7TFZ2vfsiOl0Wph9ZZYSAjr4cYp7CVYW6DupLQrKRqY0GZjPfBjnqNWf8Ku2QP1MX
 R7jMf7n7jZLG8kgdNljneLq6ktqK2X17mQjOS27qB6ADGsFLJqZYZ1MdSd5bUnNesmZO
 PPk+RZalOYslS2nGy3aZqxuEvW2zPnB0fcg37zdbdvePA25itm5sbVVWfwpf5iBUTDBI
 qPapLa4BWW6WDpmTx+0LD4gwtkiUxzlqx/TIVboWnvTR0g1/VUsPk4jxCpmWYA5L7IOL
 QAsE+8gMkBH9iPFqF9NFkTmvx51Gq+65JK3xQ+jWj52tfx5ZwDpeaVY5ZVaUqrkiJoxy
 rZ2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLErKftpqiTGxei2rKnz5wSY11E/psQ7t/pgxzHs+N4LRfdK38EFz2RadQvuG44mfaqJtQUb7Esqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwFOggdLO9peyzsd3uiuLaLFD2JlQSo+HNKUHt6on++m8jtzK3
 /c9fBfYLKZohBUZbHYkfiLobuYqMFas97dXj/sPhUNJW/mvymD+gbjiFEI8hh8NgV0ZOUUeNmok
 0Kd/sczV0J8L/FrjNz8um+KvXo7D2q9o=
X-Gm-Gg: AZuq6aLppNlqkFYoOUnWM+19CBdKIcSAh3HVDSgfP7Jf/4/rVHHYcIOBmvnsEV4kddU
 XHJbuCVSSCZKsyYsTNycqZEU45LcJct+8fy0O8U7fOaNxHTrg+3IbZQY/L1OWYfwphUMpG4tdhu
 C4O1NhkGs+DFK8V0REf9xzEvswluShBaa+KNkZB/0zTW2axhMbgIDjjhdFz+8UyghYbLsmC+eHE
 S3XWcZ22Vj+sgqNvYdJ/hZ9Sm7ktgaL6JOLQjLLbHeIZuZFaVXCDXkF/stUA1CDJw+I93I7xzdZ
 K2fof2dI45Ti/zopxTPkY2rm80qZAw==
X-Received: by 2002:a17:90b:5190:b0:34c:2db6:578f with SMTP id
 98e67ed59e1d1-3536885694cmr3448666a91.19.1769192514010; Fri, 23 Jan 2026
 10:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
 <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
In-Reply-To: <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 02:21:42 +0800
X-Gm-Features: AZwV_QiUVgt6zT7LCvtUzjgnH_aqDOORlzA2yXQGNZS9mCONN_by2qCehnk_F_w
Message-ID: <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AD4C97982C
X-Rspamd-Action: no action

Hi Dmitry,
Thanks for your review.
linux/cleanup.h is included in linux/of.h.
So it should be included already.

Best regards,
Feix Gu

On Sat, Jan 24, 2026 at 1:58=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
> > In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> > While there was a manual of_node_put() at the end of the
> > common path, several early error returns would bypass this call,
> > resulting in a reference leak.
> > Fix this by using the __free(device_node) cleanup handler to
> > release the reference when the variable goes out of scope.
> >
> > Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 2129d230a92b..0bc518d9fd65 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
> >       struct msm_drm_private *priv =3D dev->dev_private;
> >       struct platform_device *pdev =3D priv->gpu_pdev;
> >       struct adreno_platform_config *config =3D pdev->dev.platform_data=
;
> > -     struct device_node *node;
> >       struct a6xx_gpu *a6xx_gpu;
> >       struct adreno_gpu *adreno_gpu;
> >       struct msm_gpu *gpu;
> > @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
> >       adreno_gpu->registers =3D NULL;
> >
> >       /* Check if there is a GMU phandle and set it up */
> > -     node =3D of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> > +     struct device_node *node __free(device_node) =3D
> > +             of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>
> Missing include for cleanup.h.
>
> >       /* FIXME: How do we gracefully handle this? */
> >       BUG_ON(!node);
> >
> > @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
> >               ret =3D a6xx_gmu_wrapper_init(a6xx_gpu, node);
> >       else
> >               ret =3D a6xx_gmu_init(a6xx_gpu, node);
> > -     of_node_put(node);
> >       if (ret) {
> >               a6xx_destroy(&(a6xx_gpu->base.base));
> >               return ERR_PTR(ret);
> >
> > ---
> > base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> > change-id: 20260123-a6xx_gpu-cbc095dbe423
> >
> > Best regards,
> > --
> > Felix Gu <ustc.gu@gmail.com>
> >
>
> --
> With best wishes
> Dmitry
