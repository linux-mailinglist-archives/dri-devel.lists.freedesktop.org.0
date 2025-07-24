Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ABEB10AAD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 14:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8549410E25E;
	Thu, 24 Jul 2025 12:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E19710E25E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 12:52:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D193C1A00;
 Thu, 24 Jul 2025 05:52:04 -0700 (PDT)
Received: from [10.1.33.48] (e122027.cambridge.arm.com [10.1.33.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29D5C3F6A8;
 Thu, 24 Jul 2025 05:52:08 -0700 (PDT)
Message-ID: <78ec8bcc-0178-4c5d-9d03-0b534bdd2231@arm.com>
Date: Thu, 24 Jul 2025 13:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] panthor: print task pid and comm on gpu errors
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250718063816.1452123-1-olvaffe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250718063816.1452123-1-olvaffe@gmail.com>
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

On 18/07/2025 07:38, Chia-I Wu wrote:
> This series saves task pid and comm in panthor_group and prints task pid and
> comm on gpu errors.
> 
> v3: fix new kerneldoc warnings
> v2: save the task info in panthor_group on panthor_group_create, rather than
>     in panthor_file on panthor_open, because, when the two differ, we are more
>     interested in the task that created the group.
> 
> Chia-I Wu (3):
>   panthor: set owner field for driver fops
>   panthor: save task pid and comm in panthor_group
>   panthor: dump task pid and comm on gpu errors
> 
>  drivers/gpu/drm/panthor/panthor_drv.c   | 14 ++------
>  drivers/gpu/drm/panthor/panthor_sched.c | 43 ++++++++++++++++++++++---
>  2 files changed, 41 insertions(+), 16 deletions(-)
> 

Applied to drm-misc-next.

Thanks,
Steve

