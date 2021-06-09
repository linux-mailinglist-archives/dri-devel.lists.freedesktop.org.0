Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1153A0DF6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 09:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B366E42A;
	Wed,  9 Jun 2021 07:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9918A6E3A0;
 Wed,  9 Jun 2021 07:44:07 +0000 (UTC)
IronPort-SDR: RO7kROxoQNUfk53WoV2Mpa0+xikdbUK7Y1+0JDNg2CVOQ2zSwG6DPGsrvDv6U9s25n/huoZ47i
 pF0vixQ7Trjw==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="266177122"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="266177122"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 00:44:06 -0700
IronPort-SDR: 22Z64FUVcr6zVdgRm6BZFbJ72kZ9j/NdifXGNgT3fFWuY2Gfbbw8nOi+xIfd/tD3nf9yCRlUcE
 tBDiEfZoDAcA==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="419195869"
Received: from gbwalsh-mobl6.ger.corp.intel.com (HELO [10.252.10.147])
 ([10.252.10.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 00:44:05 -0700
Subject: Re: [PATCH v2 4/9] drm/i915/gt: Add an insert_entry for gen8_ppgtt
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
 <20210609063436.284332-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <e75712c3-af00-e0be-6ee1-3203e7242065@intel.com>
Date: Wed, 9 Jun 2021 08:44:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609063436.284332-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2021 07:34, Thomas Hellström wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> In the next patch, we will want to write a PTE for an explicit
> dma address, outside of the usual vma.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
