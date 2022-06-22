Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 276ED55534D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 20:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC35D10E34E;
	Wed, 22 Jun 2022 18:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4B210E34E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 18:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655922866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omiNqvORIjG9NgssZYHaS4WVLfu2J9JUn3+DxvoKIzU=;
 b=Q5sq590dsTNPSZNWrMzWbDiEO3hVSGbsGLb3ZB4HdrdNu3agWK5/1yjpH06Ba1kqUEmM3S
 CJTYxzG6fuj8Kc8b46h/UaWnSu4+mAT9rL4tqqQRf930W5Dcx+T1a6HXUhvCmYtBV9bH0m
 CXsLXpLpVVyBbWQzQ+X0HkeX2YaaVqg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-y0AzmFD4Noai00BTzuIOYQ-1; Wed, 22 Jun 2022 14:34:22 -0400
X-MC-Unique: y0AzmFD4Noai00BTzuIOYQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 lx15-20020a0562145f0f00b0047052731d81so5500916qvb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 11:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=omiNqvORIjG9NgssZYHaS4WVLfu2J9JUn3+DxvoKIzU=;
 b=Di5qJha5gmU9V+NHUkr9r1hqeB+foq7S/OGrFRByH6OSPADK1PPCZKJ8jiArV7dWs0
 HN/K37GSrTHyGVbB3zOXtMTnTBFol9BUCVCwwQOanrzt9dG73u2qdfgkGsp7CPyjvSPG
 +CuJkBeJMhD4GsuISdoe9olsvPy/oNygzNUqEkSNDtd2qCd4cs+Tv6GJjg6fN9os5qCY
 tNYp64JJjaeN20sWoH1M8ZirTIwWDBWRgPEYZbJ5TrkA3Y2NKYk49+xGbD0R0zriCl7o
 0MFGtRPN4+eZtn4pI23Q/L6AhDTtYlsk0jwWRd3fIYFn5iE6iqE0lXViI2/sgPLgVPth
 tozw==
X-Gm-Message-State: AJIora998m6UBD3LGReADTD5EPp3FW2//xDGJYpigVjLiP/yBBIiGlg5
 PmlciYeJLs/0vsJjXlKb/EE0+h8kZ9s9iKKuu2lKUODAp+6ms1leTesmhQffcmix+uAwn0FVjqX
 pSXMq2uYAOQ15ysvnpQAszYAeA4W+
X-Received: by 2002:a05:620a:f89:b0:6ae:d418:f478 with SMTP id
 b9-20020a05620a0f8900b006aed418f478mr3456648qkn.344.1655922861775; 
 Wed, 22 Jun 2022 11:34:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sLdOpvVvGa9rukdo6gfWMtRMEU54NEu1QoSLfKHFZABy3SvdCJ7y4K3NMewQy37mKcWf65Jw==
X-Received: by 2002:a05:620a:f89:b0:6ae:d418:f478 with SMTP id
 b9-20020a05620a0f8900b006aed418f478mr3456630qkn.344.1655922861472; 
 Wed, 22 Jun 2022 11:34:21 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05622a034800b00304e4bbc369sm15355256qtw.10.2022.06.22.11.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 11:34:20 -0700 (PDT)
Message-ID: <8a6048576c440f1653121bb7be8583e9fee0c79a.camel@redhat.com>
Subject: Re: [PATCH] drm/ast: Fix black screen when getting out of suspend
From: Lyude Paul <lyude@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org, 
 tzimmermann@suse.de, kuohsiang_chou@aspeedtech.com
Date: Wed, 22 Jun 2022 14:34:19 -0400
In-Reply-To: <20220622124815.356035-1-jfalempe@redhat.com>
References: <20220622124815.356035-1-jfalempe@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
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
Cc: michel@daenzer.net, hungju_huang@aspeedtech.com,
 Venkat Tadikonda <venkateswara.rao@intel.com>, charles_kuan@aspeedtech.com,
 luke_chen@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some small nitpicks:

On Wed, 2022-06-22 at 14:48 +0200, Jocelyn Falempe wrote:
> With an AST2600, the screen is garbage when going out of suspend.
> This is because color settings are lost, and not restored on resume.
> Force the color settings on DPMS_ON, to make sure the settings are correct.
> 
> I didn't write this code, it comes from the out-of-tree aspeed driver v1.13
> https://www.aspeedtech.com/support_driver/
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Tested-by: Venkat Tadikonda <venkateswara.rao@intel.com>

Should have a Cc: to stable imho, `dim` can do this for you:

https://drm.pages.freedesktop.org/maintainer-tools/dim.html

> ---
>  drivers/gpu/drm/ast/ast_mode.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 3eb9afecd9d4..cdddcb5c4439 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -990,6 +990,9 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int
> mode)
>  {
>         struct ast_private *ast = to_ast_private(crtc->dev);
>         u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
> +       struct ast_crtc_state *ast_state;
> +       const struct drm_format_info *format;
> +       struct ast_vbios_mode_info *vbios_mode_info;
>  
>         /* TODO: Maybe control display signal generation with
>          *       Sync Enable (bit CR17.7).
> @@ -1007,6 +1010,16 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int
> mode)
>                         ast_dp_set_on_off(crtc->dev, 1);
>                 }
>  
> +               ast_state = to_ast_crtc_state(crtc->state);
> +               format = ast_state->format;
> +
> +               if (format){

Should be a space between ')' and '{'.

With that fixed, this is: Reviewed-by: Lyude Paul <lyude@redhat.com>

> +                       vbios_mode_info = &ast_state->vbios_mode_info;
> +
> +                       ast_set_color_reg(ast, format);
> +                       ast_set_vbios_color_reg(ast, format,
> vbios_mode_info);
> +               }
> +
>                 ast_crtc_load_lut(ast, crtc);
>                 break;
>         case DRM_MODE_DPMS_STANDBY:

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

