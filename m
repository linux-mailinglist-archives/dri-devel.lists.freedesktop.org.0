Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE8E633F36
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 15:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A25110E3FA;
	Tue, 22 Nov 2022 14:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D11F10E3FA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 14:48:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e11so12153865wru.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 06:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6VQZkRoHrqA7rpJ+k+Bc7BZuP/PY0GhLVjONMwr17o=;
 b=arkcTSSZ565+8zxaVnvMMkhBjDeyuV8uwARQodCjT/IrprezMx/J6gpGSxOsDOi6W0
 gzJQa/c/lk4i7feXnNiDgYk1VKfuckuqYMFg49LHY6zQ4i8tiic+81Kt1W8hxwAYNkGD
 XmZO2UXUf7FwmsVuEr0WLD/XKQQG94xP3axjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y6VQZkRoHrqA7rpJ+k+Bc7BZuP/PY0GhLVjONMwr17o=;
 b=Ph6vqmMKSv9zbVJZSEsvK101FMoUhi2ooUnlt/czbjr7Dpuuy8R1oWu2csFny7UXN9
 GsWfVcq9Bzv0ZYLgFG33XKQ2YhTjWBBBC3neCP6LEtmo+2FSTDhVxmIDO/+bxGUEBfbf
 SPjYOQO8fxVDY4qlmJGdTbO/naOFGZdOx9i2Bh8l8ToO8prYtaqMH15nDzyRwBVUn0Sj
 wa3I4zZLD/NAavOFb9ppAKAZFvai4UyF3RssEfbzYzcXoNnK5bEomKp8PLaWJUAuQk6w
 gYL2poKE52lKtTCoNLsGh4UUInFBp9pNhkPylm9wbK6o0Q0ou9rIPaUbsBEBz9E7sueO
 aXDA==
X-Gm-Message-State: ANoB5pmxAofvx7DWKvQULlstnsAY8OyxfOln6s4r5fNX5qoXFKCS8YCL
 lTO3oZ9qFVJtI5jISpH9Ln3sfA==
X-Google-Smtp-Source: AA0mqf74yf0WzGebkyR4zTY7KjsNMhDDBQMASADAm4iZKkPhgzAhOhyQoa4x3u5MiOZWvy6god7z9A==
X-Received: by 2002:a5d:4ccb:0:b0:236:d611:4fcf with SMTP id
 c11-20020a5d4ccb000000b00236d6114fcfmr3765675wrt.192.1669128507148; 
 Tue, 22 Nov 2022 06:48:27 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b003c5571c27a1sm21728939wmo.32.2022.11.22.06.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:48:26 -0800 (PST)
Date: Tue, 22 Nov 2022 15:48:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drm/doc: make drm-uapi igt-tests more readable
Message-ID: <Y3zhOP6enOmUmapQ@phenom.ffwll.local>
References: <20221118235137.6859-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118235137.6859-1-rdunlap@infradead.org>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 03:51:37PM -0800, Randy Dunlap wrote:
> Correct grammar and make the use of the igt-tests more readable.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jonathan Corbet <corbet@lwn.net>

Pushed to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  Documentation/gpu/drm-uapi.rst |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff -- a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -402,19 +402,19 @@ It's possible to run the IGT-tests in a
>  	1. Use IGT inside a VM
>  	2. Use IGT from the host machine and write the results in a shared directory.
>  
> -As follow, there is an example of using a VM with a shared directory with
> -the host machine to run igt-tests. As an example it's used virtme::
> +Following is an example of using a VM with a shared directory with
> +the host machine to run igt-tests. This example uses virtme::
>  
>  	$ virtme-run --rwdir /path/for/shared_dir --kdir=path/for/kernel/directory --mods=auto
>  
> -Run the igt-tests in the guest machine, as example it's ran the 'kms_flip'
> +Run the igt-tests in the guest machine. This example runs the 'kms_flip'
>  tests::
>  
>  	$ /path/for/igt-gpu-tools/scripts/run-tests.sh -p -s -t "kms_flip.*" -v
>  
> -In this example, instead of build the igt_runner, Piglit is used
> -(-p option); it's created html summary of the tests results and it's saved
> -in the folder "igt-gpu-tools/results"; it's executed only the igt-tests
> +In this example, instead of building the igt_runner, Piglit is used
> +(-p option). It creates an HTML summary of the test results and saves
> +them in the folder "igt-gpu-tools/results". It executes only the igt-tests
>  matching the -t option.
>  
>  Display CRC Support

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
