Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ED1310BBA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1B06E284;
	Fri,  5 Feb 2021 13:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844916E284
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 13:22:26 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id w11so3360505qvz.12
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 05:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jQUIp9niz/uOgL5mmbfjBwhGvI5VU8KjTGU8DMkCJHY=;
 b=axFVMjNvflN4c5MmnvPMBQOovQ410sbVVkUEoKwCzSPZ39cUveXsub7rPwEIQLdUNI
 yXXXicSW4D/9CbIEG8P/qOAqHVqPvfgTvefUOVA5H75U3lNc6hfUVH95Nnl7lhk+jm1b
 ceo0dCVL6UL3wmbTLv8yXGjd+YsA6wI7ql+8da3Ygm1xBJKpnxTjpU5amkEbNA3McUWw
 csfgtDYxuuGjUM1v52Z2Gbh9JPLNWQWjogPrn5VUN4RqElhxnN2ePgjFYp6EjAaGmP7J
 IA3+GijkY63qUHTAESC/ONI48qv65lq2JMADqTB8K7v9M/Y1XyqbhXns2bj5Zqi/5mY3
 GXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jQUIp9niz/uOgL5mmbfjBwhGvI5VU8KjTGU8DMkCJHY=;
 b=ookTG5XlIyDW53xEiA7/KJNei48tlVH0G1sXDDPXdFu5/Z9jNGDL4OsaiOVrZopdcG
 z74AB47RuoqrrKNLPnDB6AQzIScwwCk4UzB8HuRUjlRudjAtFqMyfX+mX+LNsdX6zdEV
 Z+Iq/4RU/2whliLfocXiDmXhm5wCJ1lDPfSsYaXqtTRuFA9Ejs7AHw5vrvwBVHpJL6kb
 XZaS3q7vKJLH9egRgnHgI9dTt7T2mc6np83jNVu9+21QRIhzzExHpT0mc43NlSfU7rIJ
 +OejkJzfIBivl8ppKXXkQLvydkzNyNwXfb4ZoIOAdft+GdsLxth2gF2BAAkZL7KHnJbG
 Wo9w==
X-Gm-Message-State: AOAM5301vGLK1wThOs2rdoHKKmzO9ueV5e7qoBN1Yxv4s5r+IsUNIsRs
 6YaNyeNnmlQBPFowB+QQ4vmwiw==
X-Google-Smtp-Source: ABdhPJw3RA9vBcmfXBOlbNYqYZ2+IIALUDcInGmWO9yQ0P8R/Ss6/JzAqsIz/4qywP43kMcRTS314g==
X-Received: by 2002:a05:6214:725:: with SMTP id
 c5mr4095464qvz.27.1612531345671; 
 Fri, 05 Feb 2021 05:22:25 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id k90sm6612703qtd.0.2021.02.05.05.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 05:22:25 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l8144-003pvy-Kf; Fri, 05 Feb 2021 09:22:24 -0400
Date: Fri, 5 Feb 2021 09:22:24 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH rdma-core v2 3/3] configure: Add check for the presence
 of DRM headers
Message-ID: <20210205132224.GK4718@ziepe.ca>
References: <1612484954-75514-1-git-send-email-jianxin.xiong@intel.com>
 <1612484954-75514-4-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612484954-75514-4-git-send-email-jianxin.xiong@intel.com>
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Edward Srouji <edwards@nvidia.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Gal Pressman <galpress@amazon.com>, dri-devel@lists.freedesktop.org,
 Doug Ledford <dledford@redhat.com>, Ali Alnubani <alialnu@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 04:29:14PM -0800, Jianxin Xiong wrote:
> Compilation of pyverbs/dmabuf_alloc.c depends on a few DRM headers
> that are installed by either the kernel-header or the libdrm package.
> The installation is optional and the location is not unique.
> 
> Check the presence of the headers at both the standard locations and
> any location defined by custom libdrm installation. If the headers
> are missing, the dmabuf allocation routines are replaced by stubs that
> return suitable error to allow the related tests to skip.
> 
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
>  CMakeLists.txt              | 15 +++++++++++++++
>  pyverbs/CMakeLists.txt      | 14 ++++++++++++--
>  pyverbs/dmabuf_alloc.c      |  8 ++++----
>  pyverbs/dmabuf_alloc_stub.c | 39 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 70 insertions(+), 6 deletions(-)
>  create mode 100644 pyverbs/dmabuf_alloc_stub.c
> 
> diff --git a/CMakeLists.txt b/CMakeLists.txt
> index 4113423..95aec11 100644
> +++ b/CMakeLists.txt
> @@ -515,6 +515,21 @@ find_package(Systemd)
>  include_directories(${SYSTEMD_INCLUDE_DIRS})
>  RDMA_DoFixup("${SYSTEMD_FOUND}" "systemd/sd-daemon.h")
>  
> +# drm headers
> +
> +# First check the standard locations. The headers could have been installed
> +# by either the kernle-headers package or the libdrm package.
> +find_path(DRM_INCLUDE_DIRS "drm.h" PATH_SUFFIXES "drm" "libdrm")

Is there a reason not to just always call pkg_check_modules?

> +# Then check custom installation of libdrm
> +if (NOT DRM_INCLUDE_DIRS)
> +  pkg_check_modules(DRM libdrm)
> +endif()
> +
> +if (DRM_INCLUDE_DIRS)
> +  include_directories(${DRM_INCLUDE_DIRS})
> +endif()

This needs a hunk at the end:

if (NOT DRM_INCLUDE_DIRS)
  message(STATUS " DMABUF NOT supported (disabling some tests)")
endif()

>  #-------------------------
>  # Apply fixups
>  
> diff --git a/pyverbs/CMakeLists.txt b/pyverbs/CMakeLists.txt
> index 6fd7625..922253f 100644
> +++ b/pyverbs/CMakeLists.txt
> @@ -13,8 +13,6 @@ rdma_cython_module(pyverbs ""
>    cmid.pyx
>    cq.pyx
>    device.pyx
> -  dmabuf.pyx
> -  dmabuf_alloc.c
>    enums.pyx
>    mem_alloc.pyx
>    mr.pyx
> @@ -25,6 +23,18 @@ rdma_cython_module(pyverbs ""
>    xrcd.pyx
>  )
>  
> +if (DRM_INCLUDE_DIRS)
> +rdma_cython_module(pyverbs ""
> +  dmabuf.pyx
> +  dmabuf_alloc.c
> +)
> +else()
> +rdma_cython_module(pyverbs ""
> +  dmabuf.pyx
> +  dmabuf_alloc_stub.c
> +)
> +endif()

Like this:

if (DRM_INCLUDE_DIRS)
  set(DMABUF_ALLOC dmabuf_alloc.c)
else()
  set(DMABUF_ALLOC dmabuf_alloc_stbub.c)
endif()
rdma_cython_module(pyverbs ""
  dmabuf.pyx
  $(DMABUF_ALLOC)
)

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
