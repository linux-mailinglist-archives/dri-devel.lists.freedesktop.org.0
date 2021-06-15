Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF4A3A7558
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 05:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B3B6E1F6;
	Tue, 15 Jun 2021 03:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F24C6E1F6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 03:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623728641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aHGbJbj0ebE6QT9Ys/qhv9gUQ2vgyk5k0OjPBMHdeRg=;
 b=Kkfv5hng7EIRy8SgK2v0nzyy63XDc8Cuuw1W+ctL2e+45s+cLEcAS6DmV0ZugZuX+MITIn
 KfzuVtUMhMuk/0t0mrnqyeNE2MtsqtUhJQsxRYtLS/DLAsJXU41BL6bti5ycpzWyv+ZBT2
 TBaMHOkBHGCD5pELyo2duAwsbgfudCs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-UPoB3bKQNamwuY-rQCPDiw-1; Mon, 14 Jun 2021 23:43:59 -0400
X-MC-Unique: UPoB3bKQNamwuY-rQCPDiw-1
Received: by mail-qk1-f200.google.com with SMTP id
 a193-20020a3766ca0000b02903a9be00d619so27333979qkc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 20:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=aHGbJbj0ebE6QT9Ys/qhv9gUQ2vgyk5k0OjPBMHdeRg=;
 b=cE9Fw7qa3JxTC6Dyv/R5yyq2itQgHM0zSKU7QJkS2zESWJK2tTenPfTydfBLjJANOi
 ZZ1kYA1RHYFceHJl63RaSklU9ZifJ6g6sphJKm9rc5t6DZ1mNkNuVShk/iAB0ANTEjxL
 vgtR8W//YgU7dRjgR54Br1U03BOMeeUk/5aRH+47OCkoToYLPNpJ+NxaYgENCuyWCiPz
 1TPCEJlEHWgPcsRhyxefOo1/nOIlZbahIIuEWimHbxdVEozsr/QM3v7nVo495FR2P+OL
 ypNhVAoaZHBsauIdM9VIF86PzawWJuV7nNHhTGTKhWhPqjdHJTb0bcFqF9oblcDvqRRS
 ha1w==
X-Gm-Message-State: AOAM532RT4JhMQWi23XYR8LqWBPMzkBw8amtyyJhk3Sm4LPfRnsjGqw/
 6z6pePBgv/kkiqqbCxQco6VaEpKOyyg0TeCqYDeA5j8ZNvW9WXw6vkG1pU+58D2YjD5y/ZQXoP5
 +P4KCJKBUnskuvzVAzI9y9DS+V0Sz
X-Received: by 2002:a05:6214:321:: with SMTP id
 j1mr2711525qvu.38.1623728639310; 
 Mon, 14 Jun 2021 20:43:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuw2F0Hwmy8HsE3YZyb+Uzm7Uyn8BYHYIjsreErLv1PghnFw3ohtOSlSt4INE1txfNq/9atw==
X-Received: by 2002:a05:6214:321:: with SMTP id
 j1mr2711504qvu.38.1623728639099; 
 Mon, 14 Jun 2021 20:43:59 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id p3sm11128331qti.31.2021.06.14.20.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 20:43:58 -0700 (PDT)
Message-ID: <f3824dfa4b4d40d66e0ab56713ba168fc7952e0d.camel@redhat.com>
Subject: Re: [PATCH] drm: nouveau: fix nouveau_backlight compiling error
From: Lyude Paul <lyude@redhat.com>
To: Chen Jiahao <chenjiahao16@huawei.com>, bskeggs@redhat.com,
 airlied@linux.ie,  daniel@ffwll.ch, airlied@redhat.com,
 nikola.cornij@amd.com,  ville.syrjala@linux.intel.com,
 dri-devel@lists.freedesktop.org,  nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Jun 2021 23:43:57 -0400
In-Reply-To: <20210615031658.176218-1-chenjiahao16@huawei.com>
References: <20210615031658.176218-1-chenjiahao16@huawei.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: heying24@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This needs a fixes tag:

	Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")

with that fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2021-06-15 at 11:16 +0800, Chen Jiahao wrote:
> There is a compiling error in disp.c while not selecting
> CONFIG_DRM_NOUVEAU_BACKLIGHT:
> 
> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function
> ‘nv50_sor_atomic_disable’:
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:52: error:
> ‘struct nouveau_connector’ has no member named ‘backlight’
>  1665 |  struct nouveau_backlight *backlight = nv_connector->backlight;
>       |                                                    ^~
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:28: error: dereferencing
> pointer
> to incomplete type ‘struct nouveau_backlight’
>  1670 |  if (backlight && backlight->uses_dpcd) {
>       |                            ^~
> 
> The problem is solved by adding the CONFIG_DRM_NOUVEAU_BACKLIGHT dependency
> where struct nouveau_backlight is used.
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 093e1f7163b3..d266b7721e29 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1662,17 +1662,21 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder,
> struct drm_atomic_state *st
>         struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>         struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
>         struct nouveau_connector *nv_connector =
> nv50_outp_get_old_connector(state, nv_encoder);
> +#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
>         struct nouveau_backlight *backlight = nv_connector->backlight;
> +#endif
>         struct drm_dp_aux *aux = &nv_connector->aux;
>         int ret;
>         u8 pwr;
>  
> +#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
>         if (backlight && backlight->uses_dpcd) {
>                 ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
>                 if (ret < 0)
>                         NV_ERROR(drm, "Failed to disable backlight on
> [CONNECTOR:%d:%s]: %d\n",
>                                  nv_connector->base.base.id, nv_connector-
> >base.name, ret);
>         }
> +#endif
>  
>         if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
>                 int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

