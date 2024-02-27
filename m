Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C2868E0A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834CA10E0A5;
	Tue, 27 Feb 2024 10:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3DE3410E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:52:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 910EC1476
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 02:52:53 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0437C3F6C4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 02:52:14 -0800 (PST)
Date: Tue, 27 Feb 2024 10:52:12 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Faiz Abbas <faiz.abbas@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 0/3] Fixes for the komeda driver
Message-ID: <Zd2-3EawUuxv2k78@e110455-lin.cambridge.arm.com>
References: <20240219100915.192475-1-faiz.abbas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240219100915.192475-1-faiz.abbas@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Faiz,

On Mon, Feb 19, 2024 at 03:39:12PM +0530, Faiz Abbas wrote:
> The following patches add fixes to the komeda DPU driver.
> 
> Patch 1 fixes an issue where the crtc always expects both pipelines to
> always have remote nodes populated.
> 
> Patch 2 is a cosmetic fix that ensures komeda does not print verbose
> pipeline information unless the entire pipeline is actually up.
> 
> Patch 3 adds a 40 bit DMA mask for each pipeline.

Sorry for the delay in replying, I was on holiday last week.

Patch series looks good, I will push it into drm-misc-next-fixes at the end
of the week.

Best regards,
Liviu


> 
> Amjad Ouled-Ameur (1):
>   drm/arm/komeda: update DMA mask to 40 bits
> 
> Faiz Abbas (2):
>   drm/arm/komeda: Fix komeda probe failing if there are no links in the
>     secondary pipeline
>   drm/arm/komeda: Move pipeline prints to after the entire pipeline has
>     been enabled
> 
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 45 ++++++++++++++-----
>  .../gpu/drm/arm/display/komeda/komeda_drv.c   |  4 ++
>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  1 +
>  .../drm/arm/display/komeda/komeda_pipeline.c  |  4 +-
>  4 files changed, 41 insertions(+), 13 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
