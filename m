Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F403A0E0A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 09:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AFC6E3F5;
	Wed,  9 Jun 2021 07:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C76C6E3F5;
 Wed,  9 Jun 2021 07:48:57 +0000 (UTC)
IronPort-SDR: LhpRjwSgmrtLEwh3bRfGL0pimIF/GRiZVtljLvRr7e6JkjlhQ9pKfY48Uu4PP6/3z93P2iNohx
 WsdnZYZU5c+g==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="203170468"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="203170468"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 00:48:56 -0700
IronPort-SDR: bNbEWc6dlQm1Pu6euELkCrFAfFxYiNA36U6WPAGtbBlvD9MoUcaZsfl1deTewYyUkshvh5u0Q7
 r1fsA+1/kw+g==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="419196825"
Received: from gbwalsh-mobl6.ger.corp.intel.com (HELO [10.252.10.147])
 ([10.252.10.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 00:48:54 -0700
Subject: Re: [PATCH v2 5/9] drm/i915/gt: Add a routine to iterate over the
 pagetables of a GTT
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
 <20210609063436.284332-6-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <90884b67-742d-cdf3-4201-fcdf27a596df@intel.com>
Date: Wed, 9 Jun 2021 08:48:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609063436.284332-6-thomas.hellstrom@linux.intel.com>
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
> In the next patch, we will want to look at the dma addresses of
> individual page tables, so add a routine to iterate over them.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
