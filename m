Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E1519886
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 09:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0E010EE03;
	Wed,  4 May 2022 07:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C361110FACC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:31:28 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id k27so19654249edk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 05:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8YM2dc3Lj2iqFmnWMin0ar9E2yzV5t6KJp8upB+s4PM=;
 b=oxm5Dbh7bnrEcep/5H5IbdiNiqPOec5bdXe+GKf8c6LL0zS/nrqHVxNgh+yCSbGdzU
 WGCzuwY1oXA6zsoLzYgZspCQKJcxclHsOgfU494LpsHGGeEVCDG2KcmXoHZY3yi/WslV
 Q9I+RpAlbkWs8/jAkY7lOBpb1rX/1g68NAyzG7B3eRSCQIZD6K8LGQU65MZL2MCQ6tac
 A7j1rA5VfHj/YQ02dzBquSIAwGjigNJ3ZJ9ii/60hollhY6yFD/o3DX5UQGOCkgOXrR+
 arUg+HJvdhbCSGlGZcvt5m8QmdL7tNeeflxuISuKa+w/z025KGCi70TGqSRLd2lKcxmE
 istw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8YM2dc3Lj2iqFmnWMin0ar9E2yzV5t6KJp8upB+s4PM=;
 b=O77SAePZ/qSKHLKaVjRmO14nV+F/1CHlOSf36NJPbxgEu9fenHLi/SN2bFXVUgykrI
 SNfwAyDAeqfJoGpUotj4SED4pp/+u70Xc37uMtDRW2NL6Iiyb3h5q78tkfITqKDXqHVW
 nAGUpVLuQjJrVQFkPdWIorf6pukB8RZ2eQ4Pjs8nIpzU1LCCzS5Wp2rtdJ0SVKFtKNCG
 6AzVhZSp5qrV54VcTxWo4Y6ntEgXjfdLbyoWtxOb7GH/1a/N38A6RK/fu9pjcdQ2KMGl
 LYn33/uTzCdLJL+oHhuucpKxkxEPpuQrZyttir1Ua12xgj8xqSitqDdjASWuZK6BU2kQ
 ZQqQ==
X-Gm-Message-State: AOAM532tfG59Zkmx0WlmZEUJl7kGalBRkI4sLB/w3NmmdUXX2f//upFZ
 EK6F8nyJMc8O1w7T9vXjyrw=
X-Google-Smtp-Source: ABdhPJwL01DktolWLuTqjgKLl4GybEuGnHg3PPyHsnp4FL0NxG7V9tWDzk7OuCu6uK3vQXkjHD+4Lg==
X-Received: by 2002:a05:6402:3711:b0:425:d3d6:2b65 with SMTP id
 ek17-20020a056402371100b00425d3d62b65mr18102385edb.328.1651581087167; 
 Tue, 03 May 2022 05:31:27 -0700 (PDT)
Received: from anparri (host-79-49-65-106.retail.telecomitalia.it.
 [79.49.65.106]) by smtp.gmail.com with ESMTPSA id
 dq9-20020a170907734900b006f3ef214de3sm4571504ejc.73.2022.05.03.05.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 05:31:26 -0700 (PDT)
Date: Tue, 3 May 2022 14:30:46 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Michael Kelley <mikelley@microsoft.com>
Subject: Re: [PATCH 0/4] Remove support for Hyper-V 2008 and 2008R2/Win7
Message-ID: <20220503123046.GA448894@anparri>
References: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
X-Mailman-Approved-At: Wed, 04 May 2022 07:45:57 +0000
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
Cc: wei.liu@kernel.org, sthemmin@microsoft.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, airlied@linux.ie, haiyangz@microsoft.com,
 decui@microsoft.com, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 drawat.floss@gmail.com, linux-fbdev@vger.kernel.org, deller@gmx.de,
 vkuznets@redhat.com, kys@microsoft.com, jejb@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 09:36:27AM -0700, Michael Kelley wrote:
> Linux code for running as a Hyper-V guest includes special cases for the
> first released versions of Hyper-V: 2008 and 2008R2/Windows 7. These
> versions were very thinly used for running Linux guests when first
> released more than 12 years ago, and they are now out of support
> (except for extended security updates). As initial versions, they
> lack the performance features needed for effective production usage
> of Linux guests. In total, there's no need to continue to support
> the latest Linux kernels on these versions of Hyper-V.
> 
> Simplify the code for running on Hyper-V by removing the special
> cases. This includes removing the negotiation of the VMbus protocol
> versions for 2008 and 2008R2, and the special case code based on
> those VMbus protocol versions. Changes are in the core VMbus code and
> several drivers for synthetic VMbus devices.
> 
> Some drivers have driver-specific protocols with the Hyper-V host and
> may have versions of those protocols that are limited to 2008 and
> 2008R2. This patch set does the clean-up only for the top-level
> VMbus protocol versions, and not the driver-specific protocols.
> Cleaning up the driver-specific protocols can be done with
> follow-on patches.
> 
> There's no specific urgency to removing the special case code for
> 2008 and 2008R2, so if the broader Linux kernel community surfaces
> a reason why this clean-up should not be done now, we can wait.
> But I think we want to eventually stop carrying around this extra
> baggage, and based on discussions with the Hyper-V team within
> Microsoft, we're already past the point that it has any value.
> 
> Michael Kelley (4):
>   Drivers: hv: vmbus: Remove support for Hyper-V 2008 and Hyper-V
>     2008R2/Win7
>   scsi: storvsc: Remove support for Hyper-V 2008 and 2008R2/Win7
>   video: hyperv_fb: Remove support for Hyper-V 2008 and 2008R2/Win7
>   drm/hyperv: Remove support for Hyper-V 2008 and 2008R2/Win7

For the series,

Reviewed-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>

Thanks,
  Andrea


>  drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 23 ++++--------
>  drivers/hv/channel_mgmt.c                 | 29 ++++++---------
>  drivers/hv/connection.c                   |  6 ++--
>  drivers/hv/vmbus_drv.c                    | 60 +++++++------------------------
>  drivers/scsi/storvsc_drv.c                | 36 +++++--------------
>  drivers/video/fbdev/hyperv_fb.c           | 23 ++----------
>  include/linux/hyperv.h                    | 10 ++++--
>  7 files changed, 52 insertions(+), 135 deletions(-)
> 
> -- 
> 1.8.3.1
> 
