Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EC43A8330
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 16:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5782A6E30D;
	Tue, 15 Jun 2021 14:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2701289FBC;
 Tue, 15 Jun 2021 14:48:13 +0000 (UTC)
IronPort-SDR: E6+qWxeHb/bxAKy8pTbjEgX2/Ha5UhKlIDK4YJ5dpJlGlSh91UFHRbSOeL23KVimv2j+VqhdkR
 IQWyCVL2iXDg==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="204173720"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="204173720"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 07:47:56 -0700
IronPort-SDR: e8+kqsKwLKIxsLFc7WTEhE3mFMjlO00GcNJW50i+JGbTnXy8mB8BrcQ0vG2suNZq8VcDZnU/Bl
 26TRNu+Cv8FA==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="451990177"
Received: from vlernihx-mobl3.ger.corp.intel.com (HELO [10.252.12.108])
 ([10.252.12.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 07:47:55 -0700
Subject: Re: [PATCH v3 08/12] drm/i915/gt: Pipelined clear
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210614162612.294869-1-thomas.hellstrom@linux.intel.com>
 <20210614162612.294869-9-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ff95d026-e1ee-179f-f444-368b382f899a@intel.com>
Date: Tue, 15 Jun 2021 15:47:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614162612.294869-9-thomas.hellstrom@linux.intel.com>
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

On 14/06/2021 17:26, Thomas Hellström wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Update the PTE and emit a clear within a single unpreemptible packet
> such that we can schedule and pipeline clears.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

