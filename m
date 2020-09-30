Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A0027EB2B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 16:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8571489D58;
	Wed, 30 Sep 2020 14:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97E789D8A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 14:42:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c18so2095659wrm.9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 07:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=6v1rod49sRpblgnIYaytswYlCAQtFHY9+INnLpwKsRI=;
 b=cQOkFdHu0n/gK2VC6Pw53HVVFr+sMRhn6/aFzrYNCe7zizsTi+kfwlLL93pj2OdVwl
 ZvTEecxM05FWuhS8VL6yi10EmnLuVLatUgQxHjdXdPAyWlrIK+mfFFhOTLpn2J0GsJ5+
 SbO0juaAokzo/rGx78kvVzx0sykPLmcAbvJKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=6v1rod49sRpblgnIYaytswYlCAQtFHY9+INnLpwKsRI=;
 b=eZYG0JCzDN+mK+hG0GxqqcoXO9lkGxiteakQT4rKOayetVB9bYpumj/Wsa3T0w6VL7
 q30h8x6UoGyGtIK8klxDNqyoyKUrrGu07FZjuqQmyQEmmxsjP9dwFp+0tj8gqABm9eN7
 o9lnboa6B0rhXL5nnOvHh1XYyKvCD44LE2TFhb4o4NNk2oefIW51y+i/MYEOmASlWKOt
 +Mm9MN4mc0NRmVbJ8SAi3uITLtJ57ujVWZcFvN/XUBAkGTrZNidj3SGm224CseLCmab6
 XhJzdUM0TEdnVr8zVcEeV7BX/+Hxr+DsoWlMez86CwRDZw1S48whPG/IGqv+0HjCTfLi
 lIdQ==
X-Gm-Message-State: AOAM533ldOMUkA1aO61GLSGLW/wjzKFfX4E3buMKp5o9DzTyfGubOwhd
 kjSERj1S/0jQ0aXY3MRe9MENpg==
X-Google-Smtp-Source: ABdhPJz2nZa1l1VvlRHa6DFjVS+WIE6DInmcSNTyofAfBcbUicZpM6IVdQGrOIGPOy4g2tCaX7c+2g==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr3619286wrm.241.1601476957326; 
 Wed, 30 Sep 2020 07:42:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k5sm3369463wmb.19.2020.09.30.07.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 07:42:36 -0700 (PDT)
Date: Wed, 30 Sep 2020 16:42:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v4 20/52] drm: drm_dsc.h: fix a kernel-doc markup
Message-ID: <20200930144234.GB438822@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
 <3d467022325e15bba8dcb13da8fb730099303266.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d467022325e15bba8dcb13da8fb730099303266.1601467849.git.mchehab+huawei@kernel.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 03:24:43PM +0200, Mauro Carvalho Chehab wrote:
> As warned by Sphinx:
> 
> 	./Documentation/gpu/drm-kms-helpers:305: ./include/drm/drm_dsc.h:587: WARNING: Unparseable C cross-reference: 'struct'
> 	Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
> 	  struct
> 	  ------^
> 
> The markup for one struct is wrong, as struct is used twice.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied to drm-misc-fixes, thanks for your patch.
-Daniel

> ---
>  include/drm/drm_dsc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_dsc.h b/include/drm/drm_dsc.h
> index 887954cbfc60..732f32740c86 100644
> --- a/include/drm/drm_dsc.h
> +++ b/include/drm/drm_dsc.h
> @@ -588,7 +588,7 @@ struct drm_dsc_picture_parameter_set {
>   * This structure represents the DSC PPS infoframe required to send the Picture
>   * Parameter Set metadata required before enabling VESA Display Stream
>   * Compression. This is based on the DP Secondary Data Packet structure and
> - * comprises of SDP Header as defined &struct struct dp_sdp_header in drm_dp_helper.h
> + * comprises of SDP Header as defined &struct dp_sdp_header in drm_dp_helper.h
>   * and PPS payload defined in &struct drm_dsc_picture_parameter_set.
>   *
>   * @pps_header: Header for PPS as per DP SDP header format of type
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
