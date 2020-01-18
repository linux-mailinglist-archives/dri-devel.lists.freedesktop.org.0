Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E127141526
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 01:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABA16F977;
	Sat, 18 Jan 2020 00:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080146F977
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 00:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579306744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkMRlosfOBwcGR259WMKcKORYoc0cAsdlRRPRABPESI=;
 b=REIXZSGUpP+pFCIgxrTF2r4ugRrr9ndOOEpiJ2PrXomVEBrUMPlS6jsOgx/2VYA8va4Po1
 M1pIyPxlPq87GJ+7J155S8CQK0khQjUGM/yM0qaPG4mOK5oYXIurJktU5odgwERernadOD
 2EuvkWTuZlwwIn4QfzW/FDcd0PnHSaU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-ooie6Tv5MVe3OYJLvuhzVg-1; Fri, 17 Jan 2020 19:19:02 -0500
Received: by mail-qv1-f71.google.com with SMTP id n11so16714403qvp.15
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 16:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=nkMRlosfOBwcGR259WMKcKORYoc0cAsdlRRPRABPESI=;
 b=HRCwx8cqVnJN9S3fq3xf3N8XBZlX2OaT0u5uU25ijrKP7mTE15M3UnEuA002rTMscr
 AjpfaOdjP0ujFNwz97/5tDvkUZ7b1UxLT3d/TBVPu0Xd49d44hxjx8RoxXwAQrODaIub
 KiQ4B1qjcwNUfFNCb6XYd/sW3SPXXSGk1owIQjepKtxEu1o9QhXGXfzNlOiqjC1XLmck
 2dWkTBIK8UW5jtQDm5+89A9MCvBxj5zhywFjn+rwv5PJKOp6QRiwc5Qhj1ETWS8Z6G1r
 m1MXQpCCmX0HjoQoDaJax/XVhYr8OW6vxEOH4yiZZbijU4PnrYU3ZEim2N0SvT8KCxyw
 kqhw==
X-Gm-Message-State: APjAAAVQXCXccpqDdQTL4W1gE8zBTXLjmyk2yUFbFYpv2r/nyNBm/2ZY
 RFPVvQ4HjNf+WEp+5/NBNeZV3wNC/aRN1HCkQFjqlwHwy/JFZxMPhwu84qaAB5q1P2DOK67ikTr
 R1F0hmHharfWfYRg5Rc3YhPAEpFbS
X-Received: by 2002:a0c:e58e:: with SMTP id t14mr10162449qvm.131.1579306742079; 
 Fri, 17 Jan 2020 16:19:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNTy3Zp7IZPvd77D4uDVi5088sphWrG/dsjizjp3pS33LcWWWKx4ZUjCa0TdoqrXJ1spKRQQ==
X-Received: by 2002:a0c:e58e:: with SMTP id t14mr10162421qvm.131.1579306741879; 
 Fri, 17 Jan 2020 16:19:01 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id r28sm14155261qtr.3.2020.01.17.16.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 16:19:01 -0800 (PST)
Message-ID: <c99174eefb65688c3db3fc25ddec819a58dccc6a.camel@redhat.com>
Subject: Re: [PATCH -next] drm/nouveau/kms/nv50: remove set but not unused
 variable 'nv_connector'
From: Lyude Paul <lyude@redhat.com>
To: YueHaibing <yuehaibing@huawei.com>, bskeggs@redhat.com,
 airlied@linux.ie,  daniel@ffwll.ch, alexander.deucher@amd.com,
 sam@ravnborg.org
Date: Fri, 17 Jan 2020 19:19:00 -0500
In-Reply-To: <20200117033642.50656-1-yuehaibing@huawei.com>
References: <20200117033642.50656-1-yuehaibing@huawei.com>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: ooie6Tv5MVe3OYJLvuhzVg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2020-01-17 at 11:36 +0800, YueHaibing wrote:
> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function nv50_pior_enable:
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1672:28: warning:
>  variable nv_connector set but not used [-Wunused-but-set-variable]
> 
> commit ac2d9275f371 ("drm/nouveau/kms/nv50-: Store the
> bpc we're using in nv50_head_atom") left behind this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 5fabe2b..a82b354 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1669,7 +1669,6 @@ nv50_pior_enable(struct drm_encoder *encoder)
>  {
>  	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>  	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
> -	struct nouveau_connector *nv_connector;
>  	struct nv50_head_atom *asyh = nv50_head_atom(nv_crtc->base.state);
>  	struct nv50_core *core = nv50_disp(encoder->dev)->core;
>  	u8 owner = 1 << nv_crtc->index;
> @@ -1677,7 +1676,6 @@ nv50_pior_enable(struct drm_encoder *encoder)
>  
>  	nv50_outp_acquire(nv_encoder);
>  
> -	nv_connector = nouveau_encoder_connector_get(nv_encoder);
>  	switch (asyh->or.bpc) {
>  	case 10: asyh->or.depth = 0x6; break;
>  	case  8: asyh->or.depth = 0x5; break;
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
