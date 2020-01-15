Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1844713C238
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 14:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DCA89DC0;
	Wed, 15 Jan 2020 13:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0148489DC0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579093450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpyInUgk4xmThkqKcuu8EEK88ntJNtXCgXJQyiJXbs4=;
 b=B5EsIJ6N+DBf1a+pqzPTb972O/f+aIwJ47Mpr5WP/jOMeSYTCYeMgKgctXLYZSWFCrOOcB
 Y3anZvhftRizZpog1vgFktIAvHOA5mbE8w+T5zVNDJCacBoOG+Q3kw8vNQUOP/qUa3VeT2
 ARqNTGIeRwZ/Ak0D0r1AAKikK5EarZc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-qVKuSjJyNmCPxleVNaD7uA-1; Wed, 15 Jan 2020 08:04:09 -0500
Received: by mail-wm1-f70.google.com with SMTP id o24so2448409wmh.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 05:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mpyInUgk4xmThkqKcuu8EEK88ntJNtXCgXJQyiJXbs4=;
 b=ki8AJ1BPpzpsbZVp7GJKZHD7rYV6a6ghaQAmQL6UPXtlfIhZFtvVQvlbhrdT85Q7S9
 mPyAxKzNfYXoXKdS5xrYMcgvoAmwPgzU+0GjbDZQ9jjcmjbg0e6ps37TwmMT5xnYSLCd
 Li40gpLCnmuH74LEjcLSbGaUrwX9YS+TDlL2W33+sIQH6CuVoDMdsNylfo2sutfM6bl9
 RU/a2+KTVflnKEVKWS+woloCn6hvVhzfSB0PWn3/iEkjN/46EQQ13bFS1tJFw4dscdAH
 IpMYH6zDcU4CwpmMGbpuKJnHZid3gWab41BzPNtKNwMMBJjX9lU7JAw5WtAzJIF1fWF4
 CCGg==
X-Gm-Message-State: APjAAAWF1E9oYUmiKfq26a0lWGSP0nxdDKRpxZNFGPlGdt0sqt/0+VbA
 AojLnP9JEbtvSVGh0oydpAeOytRnpMVVvsK12zmyRjx59ZRcpKh5v4HNKlYxG+dqEZV7DGRXnmt
 tcN0EBokM3F6WXCJOxOtgPIXoDomH
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr35642417wmk.42.1579093448406; 
 Wed, 15 Jan 2020 05:04:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNc3UH/JZrFdOQ0n0slHlGFi13fSa9Le8xaSC3jQ78spxTvbop6nGuqW1/hkGMIAJTiMuYcw==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr35642387wmk.42.1579093448204; 
 Wed, 15 Jan 2020 05:04:08 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id n1sm23434301wrw.52.2020.01.15.05.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 05:04:07 -0800 (PST)
Subject: Re: [PATCH v2 0/4] Use no_vblank property for drivers without VBLANK
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, david@lechnology.com, noralf@tronnes.org,
 sean@poorly.run, oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
References: <20200115125226.13843-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <91623f34-cc25-5045-0214-db18ecf29c61@redhat.com>
Date: Wed, 15 Jan 2020 14:04:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200115125226.13843-1-tzimmermann@suse.de>
Content-Language: en-US
X-MC-Unique: qVKuSjJyNmCPxleVNaD7uA-1
X-Mimecast-Spam-Score: 0
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
Cc: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 15-01-2020 13:52, Thomas Zimmermann wrote:
> (Resending because I did not cc dri-devel properly.)
> 
> Instead of faking VBLANK events by themselves, drivers without VBLANK
> support can enable drm_crtc_vblank.no_vblank and let DRM do the rest.
> The patchset makes this official and converts over several drivers.
> 
> Ast already uses the functionality and just needs a cleanup. Cirrus can
> be converted easily by setting the field in the check() callback and
> removing the existing VBLANK code. For most other simple-KMS drivers
> without enable_vblank() and check(), simple-KMS helpers can enable the
> faked VBLANK by default. The only exception is Xen, which comes with
> its own VBLANK logic and should rather to disable no_vblank.
> 
> v2:
> 	* document functionality (Daniel)
> 	* cleanup ast (Daniel)
> 	* let simple-kms handle no_vblank where possible

Entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> Thomas Zimmermann (4):
>    drm: Document struct drm_crtc_state.no_vblank for faking VBLANK events
>    drm/ast: Set struct drm_crtc_state.no_vblank in atomic_check()
>    drm/cirrus: Let DRM core send VBLANK events
>    drm/simple-kms: Let DRM core send VBLANK events by default
> 
>   drivers/gpu/drm/ast/ast_mode.c          |  4 ++--
>   drivers/gpu/drm/bochs/bochs_kms.c       |  9 ---------
>   drivers/gpu/drm/cirrus/cirrus.c         | 10 ++--------
>   drivers/gpu/drm/drm_atomic_helper.c     |  4 +++-
>   drivers/gpu/drm/drm_mipi_dbi.c          |  9 ---------
>   drivers/gpu/drm/drm_simple_kms_helper.c | 19 +++++++++++++++----
>   drivers/gpu/drm/tiny/gm12u320.c         |  9 ---------
>   drivers/gpu/drm/tiny/ili9225.c          |  9 ---------
>   drivers/gpu/drm/tiny/repaper.c          |  9 ---------
>   drivers/gpu/drm/tiny/st7586.c           |  9 ---------
>   drivers/gpu/drm/udl/udl_modeset.c       | 11 -----------
>   drivers/gpu/drm/xen/xen_drm_front_kms.c | 13 +++++++++++++
>   include/drm/drm_crtc.h                  |  9 +++++++--
>   include/drm/drm_simple_kms_helper.h     |  7 +++++--
>   14 files changed, 47 insertions(+), 84 deletions(-)
> 
> --
> 2.24.1
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
