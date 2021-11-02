Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DAC4429E3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 09:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478C26FF13;
	Tue,  2 Nov 2021 08:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB5A6FF10;
 Tue,  2 Nov 2021 08:52:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="231472008"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="231472008"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 01:52:28 -0700
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="728288642"
Received: from dccormac-mobl1.ger.corp.intel.com (HELO [10.252.3.196])
 ([10.252.3.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 01:52:26 -0700
Message-ID: <393737f9-5336-013c-8dc8-ab8f49f3d3f5@intel.com>
Date: Tue, 2 Nov 2021 08:52:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] drm/i915/ttm: Reorganize the ttm move code
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211101183851.291015-1-thomas.hellstrom@linux.intel.com>
 <20211101183851.291015-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211101183851.291015-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 01/11/2021 18:38, Thomas Hellström wrote:
> We are about to introduce failsafe- and asynchronous migration and
> ttm moves.
> This will add complexity and code to the TTM move code so it makes sense
> to split it out to a separate file to make the i915 TTM code easer to
> digest.
> Split the i915 TTM move code out and since we will have to change the name
> of the gpu_binds_iomem() and cpu_maps_iomem() functions anyway,
> we alter the name of gpu_binds_iomem() to i915_ttm_gtt_binds_lmem() which
> is more reflecting what it is used for.
> With this we also add some more documentation. Otherwise there should be
> no functional change.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
