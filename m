Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1865235D2
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 16:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF58D10FB55;
	Wed, 11 May 2022 14:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B785910FB55
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 14:42:07 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id m1so3305029wrb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 07:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wWjzqUVJD0Jte80wOSD+g8/wcFURTJpU9/E2wgFugws=;
 b=EPyn9RyzNP206qq1VFXXLnBdUHCshs2RQrcydqE2pcRVNIFG37ZPmq1mrS4xr3cP7J
 jF7um1TNS5ajm7cW4K5JajQLAnmCn/LqJHVbf/rS1PFGZUeTn7se+TUls9Yc5/f6Nc0G
 z35hYulmL60kNfZxvMeBHYY2CE58MTQQjvHULcljN8903vQIvCCRFv3oPbfG762xU3+u
 f3Dg2OCuoIJWESK6YUP+UQTUS2RdBSEfKeFqWxVz4zKzCRGaTsc08+vkweJe09rsa7VJ
 dXH8gJw9trdejMQZc6vcP0F/qc2i2+9gaLW0CcrvnxodvhJ8cc/108KKc7obFzQuv3Bb
 /A9w==
X-Gm-Message-State: AOAM5339md1ZjoLAzRPpyizbje5I9nqiTIsVoRptTLasqM387xVjUX36
 GrImhH33hBXkj7uTNnO6pgc=
X-Google-Smtp-Source: ABdhPJyJHl0yysMgUBB0X0fbIv9vHIIwvc08c3iHw4pfVSZWejdHpsGKKrKasDCwPGrEq2VYeEJO7A==
X-Received: by 2002:a05:6000:1c02:b0:20c:7d20:cad6 with SMTP id
 ba2-20020a0560001c0200b0020c7d20cad6mr23036511wrb.373.1652280126132; 
 Wed, 11 May 2022 07:42:06 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a7bc0ca000000b003942a244f34sm23407wmh.13.2022.05.11.07.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:42:05 -0700 (PDT)
Date: Wed, 11 May 2022 14:42:04 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Michael Kelley <mikelley@microsoft.com>
Subject: Re: [PATCH 0/4] Remove support for Hyper-V 2008 and 2008R2/Win7
Message-ID: <20220511144204.ilpsk2oiyknh7cys@liuwe-devbox-debian-v2>
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
> Michael Kelley (4):
>   Drivers: hv: vmbus: Remove support for Hyper-V 2008 and Hyper-V
>     2008R2/Win7
>   scsi: storvsc: Remove support for Hyper-V 2008 and 2008R2/Win7
>   video: hyperv_fb: Remove support for Hyper-V 2008 and 2008R2/Win7
>   drm/hyperv: Remove support for Hyper-V 2008 and 2008R2/Win7

Applied to hyperv-next.
