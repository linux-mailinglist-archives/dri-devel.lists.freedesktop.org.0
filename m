Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A96B8986151
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 16:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E53410EA29;
	Wed, 25 Sep 2024 14:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80ECD10EA2A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 14:45:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91824150C;
 Wed, 25 Sep 2024 07:46:23 -0700 (PDT)
Received: from [10.57.78.226] (unknown [10.57.78.226])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C21C3F64C;
 Wed, 25 Sep 2024 07:45:52 -0700 (PDT)
Message-ID: <127aae99-c2c6-47e6-adba-66953e23f94e@arm.com>
Date: Wed, 25 Sep 2024 15:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm/panthor: Expose realtime group priority and
 allowed priorites to userspace
To: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com
References: <20240909064820.34982-2-mary.guillemard@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240909064820.34982-2-mary.guillemard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 09/09/2024 07:48, Mary Guillemard wrote:
> This patch series adds support for realtime group priority and exposes
> allowed priorities info with a new dev query.
> 
> Those changes are required to implement EGL_IMG_context_priority and
> EGL_NV_context_priority_realtime extensions properly.
> 
> This patch series assumes that [1] is applied. (found in drm-misc-fixes)
> 
> The Mesa MR using this series is available here [2].

Pushed to drm-misc-next

> 
> v2:
> - Add Steven Price r-b on the first patch
> - Remove drm_panthor_group_allow_priority_flags definition and document
>   that allowed_mask is a bitmask of drm_panthor_group_priority on the
>   second patch
> 
> v3:
> - Use BIT macro in panthor_query_group_priorities_info
> - Add r-b from Steven Price and Boris Brezillon
> 
> [1]https://lore.kernel.org/all/20240903144955.144278-2-mary.guillemard@collabora.com/
> [2]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30991
> 
> Mary Guillemard (2):
>   drm/panthor: Add PANTHOR_GROUP_PRIORITY_REALTIME group priority
>   drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query
> 
>  drivers/gpu/drm/panthor/panthor_drv.c   | 61 +++++++++++++++++--------
>  drivers/gpu/drm/panthor/panthor_sched.c |  2 -
>  include/uapi/drm/panthor_drm.h          | 29 ++++++++++++
>  3 files changed, 71 insertions(+), 21 deletions(-)
> 

