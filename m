Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF2727D320
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 17:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667746E50E;
	Tue, 29 Sep 2020 15:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2671B6E50E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 15:51:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s12so5944492wrw.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 08:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CIidPobKB61q0lmPNR+WPMpdsLuntHQgM0xeIC12jwE=;
 b=Y2cYPSvVuWn8VpT21UzufLTedZpEgkG95oUglGhyfGsWvf1k3NIqFcYYmNYvjXWiHx
 Yohqp7/OHj2jaokNTWEHv4wwNBwr7QTNWk90mruhX6R+wnrC7G6KlXVTEAhQ/GdgK0nf
 HCUTiDL/s1glZS08KyQulujF6e+8U7yzFVAo7Z4ZIt9gEWYCFVhRk4Pg4XlUZRGaXW4c
 0k5ueqdrTbWyRM10phvIHCF7z3zOmcTVQBTsnvBUmvXR3HSbKhc20Voy6abQEw7VBzs5
 t+JLhb7sSzVQNtWchq7MsMntzm7GGWNzJjOHvgQSgMhjSJ9Z3OrIlpcnE4xEdOJX37uP
 K1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CIidPobKB61q0lmPNR+WPMpdsLuntHQgM0xeIC12jwE=;
 b=LaUe0PZI8+jVJ8MeSlLqCovOgfFFTSLEzVHCUDLcyctccBpX7noUFfdiGTxhyZmxyB
 3FUJK44Wy7cSXYt6UW42zPlAZ6kqBBz1AuxQGkAaAXgOh6zedM6x+Ynz+Y0hB3l+LP6Q
 nIXfjDxvBU5wonDlNf2bgydf/J1HZ+LUmQAhCdP27968G0LlGA5/JZtR2ZagUBGomn0G
 mJbQjNxsMXSR9YsCmfnIq30NmWvVLWo1zmk3HJoTe9/4UX9B45PusZFRjL/tjwfDWr9f
 F+gou+gFw/cfNSra9SkSOOcu+R8c7lybj5BxV+2vtzV9FC8EhbpngFeSYB67kiiKMYYg
 kqmA==
X-Gm-Message-State: AOAM532FxZZfIJeduFpF6cJKfyHnJ4bYfP8//dMarLkI1Cz0z8km5GME
 wxx/x7AOhT9PO+qmUrN/Bgw=
X-Google-Smtp-Source: ABdhPJw0dWKcT46WtlqMuY/uSI5WjgUJpayQNWKncbaOPh2TOLcI5FHGmhqrzjGV7EITbVCIFShYzg==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr5065693wrt.196.1601394691866; 
 Tue, 29 Sep 2020 08:51:31 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id w14sm6406453wrk.95.2020.09.29.08.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 08:51:31 -0700 (PDT)
Date: Tue, 29 Sep 2020 12:51:24 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: update todo.rst
Message-ID: <20200929155124.f5hcurcrhoxdp7be@smtp.gmail.com>
References: <20200929150333.3441576-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929150333.3441576-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/29, Daniel Vetter wrote:
> - debugfs cleanup has moved forward thanks to the cleanup Wambui has
>   done
> 
> Cc: Wambui Karuga <wambui.karugax@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/todo.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 3751ac976c3e..700637e25ecd 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -515,9 +515,6 @@ There's a bunch of issues with it:
>    this (together with the drm_minor->drm_device move) would allow us to remove
>    debugfs_init.
>  
> -- Drop the return code and error checking from all debugfs functions. Greg KH is
> -  working on this already.
> -
>  Contact: Daniel Vetter
>  
>  Level: Intermediate
> -- 
> 2.28.0
>
Acked-by: Melissa Wen <melissa.srw@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
