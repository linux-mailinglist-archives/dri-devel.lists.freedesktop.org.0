Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948105AD8F8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 20:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFC810E487;
	Mon,  5 Sep 2022 18:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B0BE10E487
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 18:23:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF05D139F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:23:38 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49F193F534
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:23:32 -0700 (PDT)
Date: Mon, 5 Sep 2022 19:23:25 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH RESEND drm-misc-next 0/8] drm/arm/malidp: use drm managed
 resources
Message-ID: <YxY+nbuKB74WfSNv@e110455-lin.cambridge.arm.com>
References: <20220905151910.98279-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905151910.98279-1-dakr@redhat.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 05:19:02PM +0200, Danilo Krummrich wrote:
> Hi,

Hi Danilo,

> 
> This patch series converts the driver to use drm managed resources to prevent
> potential use-after-free issues on driver unbind/rebind and to get rid of the
> usage of deprecated APIs.

Appologies for the extended silence, I was on holiday for 3 weeks and stayed away
from mailing lists. Will review the two series this week.

Best regards,
Liviu


> 
> Danilo Krummrich (8):
>   drm/arm/malidp: use drmm_* to allocate driver structures
>   drm/arm/malidp: replace drm->dev_private with drm_to_malidp()
>   drm/arm/malidp: crtc: use drmm_crtc_init_with_planes()
>   drm/arm/malidp: plane: use drm managed resources
>   drm/arm/malidp: use drm_dev_unplug()
>   drm/arm/malidp: plane: protect device resources after removal
>   drm/arm/malidp: crtc: protect device resources after removal
>   drm/arm/malidp: drv: protect device resources after removal
> 
>  drivers/gpu/drm/arm/malidp_crtc.c   | 48 +++++++++++++++++++++---
>  drivers/gpu/drm/arm/malidp_drv.c    | 58 ++++++++++++++---------------
>  drivers/gpu/drm/arm/malidp_drv.h    |  2 +
>  drivers/gpu/drm/arm/malidp_hw.c     | 10 ++---
>  drivers/gpu/drm/arm/malidp_mw.c     |  6 +--
>  drivers/gpu/drm/arm/malidp_planes.c | 45 +++++++++++-----------
>  6 files changed, 100 insertions(+), 69 deletions(-)
> 
> 
> base-commit: 8fe444eb326869823f3788a4b4da5dca03339d10
> -- 
> 2.37.2
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
