Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A811430FF1A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 22:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A2B6EE47;
	Thu,  4 Feb 2021 21:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DCE6EE47
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 21:12:20 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601c63330000>; Thu, 04 Feb 2021 13:12:19 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 21:12:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 4 Feb 2021 21:12:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chYJcFaCcuNwHyBK3lSmCxB4m+e1q0k/Bs9SPomHxnKTzpwVsCalBtoozZ7mSrttohaTJE9u2OKiCUoHC+AQv/1PfsLth2tVMYAvq/D9p4q6bRqKuiTMF9vxCY6mx1jrmRDdOHCoGoCuroUJ85LFhlPwY7VPSGZISWi4T7AuovDtdeJvXRIRuYZmMXtNKt+PrskNUhoe+L3H6pqSvA13CjaC4Qe352XFswtFmVVEuAQ7m1byFj1wMnnQjfUmaPkZ7emOgNRJWy9INiCRjkYJ22z93IaZpwbnIwBe3E0su8kip5Ag5jyBfwmYhJIuRJejiwGSlOMgw46+Ll5FM40RSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZMiQkLEMbPCt7LjIxhHSSyVBmHq4W3d6kXjAuE2Ozo=;
 b=aZMNnL3A0aY0zrKWRXo0ohrKUAh2WmJAU3CCmW3EK1Q0eEBVF3i/xEqML7TT+UYFq5LZqgM0gx8ZtMnokd+bqDe+BsmHM+OmcVXBzfA3AjBnYk2H2g5jvtymZS3fGhJJYy35yx/edu7/2C9OX+lSt8ReBfMLsyZNrkg36aieBUVSRh6Et4Y5HF5wiJxyvPSG1uaxdFvubD1aO2b1N8SkRqPzGhUlCtaksvu2SgzSYw/LyYMUosM03nTwMENTukJegniyu1bYraWHpP4rumoA6BcZnTeRaPJ5riZUSg9HGsquC2z+jjvHW/a3SQCvPCV+bdnfsxEKbvZyPCm9lVa1rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB2584.namprd12.prod.outlook.com (2603:10b6:4:b0::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 4 Feb
 2021 21:12:12 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::d6b:736:fa28:5e4]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::d6b:736:fa28:5e4%7]) with mapi id 15.20.3805.033; Thu, 4 Feb 2021
 21:12:12 +0000
Date: Thu, 4 Feb 2021 17:12:10 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH rdma-core 3/3] configure: Add check for the presence of
 DRM headers
Message-ID: <20210204211210.GQ4247@nvidia.com>
References: <1612464651-54073-1-git-send-email-jianxin.xiong@intel.com>
 <1612464651-54073-4-git-send-email-jianxin.xiong@intel.com>
Content-Disposition: inline
In-Reply-To: <1612464651-54073-4-git-send-email-jianxin.xiong@intel.com>
X-ClientProxiedBy: MN2PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:208:c0::48) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 MN2PR05CA0035.namprd05.prod.outlook.com (2603:10b6:208:c0::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Thu, 4 Feb 2021 21:12:11 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1l7lv8-003cEc-Qi; Thu, 04 Feb 2021 17:12:10 -0400
X-Header: ProcessedBy-CMR-outbound
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612473139; bh=vZMiQkLEMbPCt7LjIxhHSSyVBmHq4W3d6kXjAuE2Ozo=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-Header;
 b=CgmRzWZtgfzr23n7BPXFlHfi2IeWc2V9bXs9gd72ay0XBf468qBH08KHoxNgZg6o1
 d3Bv1NbLXFi4/YeI4NLVLHnUtbwb4Nm+onRna0gZftuCbmQUDWNJFpp2l4HAj66Uav
 tR1kmloUaJB4X4PI8IdBCxLRtQK48ekQtEBCmIFEzgr6EOt8LWBNW2EyHc6Z+MyKRB
 qK9foBR1RKj8UHpp9l6AdIB7UJoR2nTbJ5VOSnAabrKakJZkE+A/PKDtQrCx/or5fR
 +kSurQhEJ6lK7mpLF8JdNgTlKqfQwvtiQxqo1WJVweqrZp+6fMGrmmIuOh2qIqzd7K
 pRHXalK5tOPVw==
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
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, Edward
 Srouji <edwards@nvidia.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Gal Pressman <galpress@amazon.com>, dri-devel@lists.freedesktop.org, Doug
 Ledford <dledford@redhat.com>, Ali Alnubani <alialnu@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 10:50:51AM -0800, Jianxin Xiong wrote:
> Compilation of pyverbs/dmabuf_alloc.c depends on a few DRM headers
> that are installed by either the kernel-header or the libdrm package.
> The installation is optional and the location is not unique.
> 
> The standard locations (such as /usr/include/drm, /usr/include/libdrm)
> are checked first. If failed, pkg-config is tried to find the include
> path of custom libdrm installation. The dmabuf allocation routines now
> return suitable error when the headers are not available. The related
> tests will recognize this error code and skip.
> 
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
>  CMakeLists.txt         |  7 +++++++
>  buildlib/Finddrm.cmake | 19 +++++++++++++++++++
>  buildlib/config.h.in   |  2 ++
>  pyverbs/dmabuf_alloc.c | 47 ++++++++++++++++++++++++++++++++++++++++++-----
>  4 files changed, 70 insertions(+), 5 deletions(-)
>  create mode 100644 buildlib/Finddrm.cmake
> 
> diff --git a/CMakeLists.txt b/CMakeLists.txt
> index 4113423..feaba3a 100644
> +++ b/CMakeLists.txt
> @@ -515,6 +515,13 @@ find_package(Systemd)
>  include_directories(${SYSTEMD_INCLUDE_DIRS})
>  RDMA_DoFixup("${SYSTEMD_FOUND}" "systemd/sd-daemon.h")
>  
> +# drm headers
> +find_package(drm)
> +if (DRM_INCLUDE_DIRS)
> +  include_directories(${DRM_INCLUDE_DIRS})
> +  set(HAVE_DRM_H 1)
> +endif()
> +
>  #-------------------------
>  # Apply fixups
>  
> diff --git a/buildlib/Finddrm.cmake b/buildlib/Finddrm.cmake
> new file mode 100644
> index 0000000..6f8e5f2
> +++ b/buildlib/Finddrm.cmake
> @@ -0,0 +1,19 @@
> +# COPYRIGHT (c) 2021 Intel Corporation.
> +# Licensed under BSD (MIT variant) or GPLv2. See COPYING.
> +
> +# Check standard locations first
> +find_path(DRM_INCLUDE_DIRS "drm.h" PATH_SUFFIXES "drm" "libdrm")
> +
> +# Check custom libdrm installation, if any
> +if (NOT DRM_INCLUDE_DIRS)
> +  execute_process(COMMAND pkg-config --cflags-only-I libdrm
> +    OUTPUT_VARIABLE _LIBDRM
> +    RESULT_VARIABLE _LIBDRM_RESULT
> +    ERROR_QUIET)
> +
> +  if (NOT _LIBDRM_RESULT)
> +    string(REGEX REPLACE "^-I" "" DRM_INCLUDE_DIRS "${_LIBDRM}")
> +  endif()
> +  unset(_LIBDRM)
> +  unset(_LIBDRM_RESULT)
> +endif()

I think this should be using pkg_check_modules() ??

Look at the NL stuff:

  pkg_check_modules(NL libnl-3.0 libnl-route-3.0 REQUIRED)
  include_directories(${NL_INCLUDE_DIRS})
  link_directories(${NL_LIBRARY_DIRS})

> +#if HAVE_DRM_H
> +

Would rather you use cmake to conditionally compile a dmabuf_alloc.c
or a dmabuf_alloc_stub.c than ifdef the entire file

Jaason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
