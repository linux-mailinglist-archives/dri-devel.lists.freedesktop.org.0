Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF25B0B39
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 19:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A514610E4D7;
	Wed,  7 Sep 2022 17:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB8110E4D7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 17:12:06 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bj14so8214525wrb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=eD0xuiNX3wD0z20Pv3fc/gF3yUZHFmC8co6RhSNzbeM=;
 b=Ty1nlULRqbTYBzI09R0J4LKQcvXHU/02T1na/x0/OIdZ4mCSxDvbQw8bszgJ1Nrj8S
 wkfomwVX9GKnQI0I1HtYHmiwbND0BjBJYwRtTzBwOX29jlE3wBO6T4qt4Ndur9Q/r1Uq
 YhJT//FBrJfpbo3yzb4cV/AECiS2b8mr1/WWNK2HlBiRz442F92imzd2MqjAvm16b0EA
 dqqd4x+SJ032c/pDqngfap36L3eDySgXyuirLZ6gL4OuM532yl2VajguRBKBYp9jZTzy
 0SRIKUEE+swjeGipV125CsqX3AO+fAbkWZbDS5BDZLmroWB03aOBsSEJ0NnST3rJ6is+
 eKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=eD0xuiNX3wD0z20Pv3fc/gF3yUZHFmC8co6RhSNzbeM=;
 b=ndzwYNAqNmGDGxQpVWb6NL7IdAFSlom/rxMp4eeDf4IAIefpA/ej+RB4mxQWHtLTrp
 Mycik9t8eJO3pW1UhUD4NH/WRLNTPe7kznOgBAgD9zzcN9ETpbzfKZNgYs9GY9UgMdHf
 8DK6KYgxUr49HXeqnFrD2CjAbsc/gzi9kb1lVXVbTcoM1i6QzFX3KLCOYMpqt5/UXYT9
 i5CxhD2n7dfGMbM0wM97Isw/ykeAicnqKpgxJL65hlv7tlaV7MTUwSB4qKluh2WY6lkn
 4Bbf6mYpo3buh19T2h9d+RPw8x4cqC74N5WP5DIUJWc2G8194yfARjBSLDE6+ufBxB9u
 cjHA==
X-Gm-Message-State: ACgBeo0rVRZdMXRZNTwBAq54c9N7LmypD9pqq8mfS74sK5DQVqWtz1h6
 gORa+K4rW7e/qIN7drcxU/w=
X-Google-Smtp-Source: AA6agR5yxLsnkcrpy3PeMKRCbpBup3SUjSmpp6SprsnF9G8/bK7OpI4Fjn1G7+fCIKMBDSvGQrflbA==
X-Received: by 2002:a5d:5b17:0:b0:226:da70:619e with SMTP id
 bx23-20020a5d5b17000000b00226da70619emr2793441wrb.434.1662570724639; 
 Wed, 07 Sep 2022 10:12:04 -0700 (PDT)
Received: from elementary ([94.73.32.249]) by smtp.gmail.com with ESMTPSA id
 r1-20020a5d4e41000000b00228bf773b1fsm10548737wrt.7.2022.09.07.10.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 10:12:03 -0700 (PDT)
Date: Wed, 7 Sep 2022 19:12:01 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/doc: Custom Kconfig for KUnit is no longer needed
Message-ID: <20220907171201.GA4529@elementary>
References: <20220905184711.391022-1-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905184711.391022-1-michal.winiarski@intel.com>
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
Cc: David Gow <davidgow@google.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michał,

On Mon, Sep 05, 2022 at 08:47:11PM +0200, Michał Winiarski wrote:
> When built for UML, KUnit provides virtio/PCI, which means that the
> DMA/IOMEM UML emulation needed by DRM is already present and does not
> need to be manually added with --kconfig_add.
> 
> References: commit 6fc3a8636a7b ("kunit: tool: Enable virtio/PCI by default on UML")
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  Documentation/gpu/drm-internals.rst | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index 5fd20a306718..c264a9587d21 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -228,16 +228,11 @@ follows:
>  
>  .. code-block:: bash
>  
> -	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests \
> -		--kconfig_add CONFIG_VIRTIO_UML=y \
> -		--kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> +	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests
>  
>  .. note::
>  	The configuration included in ``.kunitconfig`` should be as generic as
>  	possible.
> -	``CONFIG_VIRTIO_UML`` and ``CONFIG_UML_PCI_OVER_VIRTIO`` are not
> -	included in it because they are only required for User Mode Linux.
> -
>  
>  Legacy Support Code
>  ===================
> -- 
> 2.37.3
> 

Thanks for the patch. This was in my ToDo list and I was waiting until
6fc3a8636a7b was merged in the DRM tree, but since you already fixed it
I can mark it as done.

Thanks!
