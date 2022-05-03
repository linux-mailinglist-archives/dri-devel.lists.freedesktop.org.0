Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C47518330
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 13:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A938310ED5A;
	Tue,  3 May 2022 11:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5505710ED5A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 11:22:05 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so1087940wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 04:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YiY0dGoIC8096MJoLsSBb1qNLHmagfKwvPsd98SImSg=;
 b=rNBj7ZLTEOoOP5JEgMe/j4t957zOOwIDBShGEY6v+9bFr+//sXdyO3UpOWLE0Eg2bQ
 9JJeZ+05XhW9OdsL1ua0YEcmf3gVx0kuwophSJJAZlR9kYBjs/LKfAh5/PRxnqPyQQ4z
 3A8GLKf9EUyGifdPAZjXBAXEBAtJxuCFUkSExkctxVwh5HJqY2iLs9Sz7kGFrx2J/YrQ
 w896u33qyfXEM49QZozRr2RJaGA4nxSPoU/bOB5+penYy8/O4/vl0WtWRR49hMNubFxA
 OzasskoIDGspV39XpFEFV7NagU6byXicO+R0v5GK0GcI+0bGDTTQomFPXktvJnfMZ67r
 dadQ==
X-Gm-Message-State: AOAM532oKgSZicubNvlFy0R/kRZ82y+hTjZg3ZWSS2592asKKaXo7XKF
 /Vtb56e09k+nyRD0KvZkoJI=
X-Google-Smtp-Source: ABdhPJxm1zYhvfWARYcqdPYfX+WBZx31HBYYbX9BTSG4b89PfKyAhJee2ZJz/esokNnR95scu5noYQ==
X-Received: by 2002:a05:600c:3b14:b0:394:1f06:37eb with SMTP id
 m20-20020a05600c3b1400b003941f0637ebmr2920891wms.193.1651576923857; 
 Tue, 03 May 2022 04:22:03 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 bd10-20020a05600c1f0a00b003942a244ec6sm1465936wmb.11.2022.05.03.04.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 04:22:03 -0700 (PDT)
Date: Tue, 3 May 2022 11:22:01 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Michael Kelley <mikelley@microsoft.com>
Subject: Re: [PATCH 0/4] Remove support for Hyper-V 2008 and 2008R2/Win7
Message-ID: <20220503112201.hwzenitojimrgz3f@liuwe-devbox-debian-v2>
References: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
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

I will wait for a week for people to voice their opinions. If I hear no
objection I will apply this series to hyperv-next.

Thanks,
Wei.

> Michael Kelley (4):
>   Drivers: hv: vmbus: Remove support for Hyper-V 2008 and Hyper-V
>     2008R2/Win7
>   scsi: storvsc: Remove support for Hyper-V 2008 and 2008R2/Win7
>   video: hyperv_fb: Remove support for Hyper-V 2008 and 2008R2/Win7
>   drm/hyperv: Remove support for Hyper-V 2008 and 2008R2/Win7
> 
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
