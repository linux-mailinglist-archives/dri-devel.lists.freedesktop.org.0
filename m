Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1C39F681
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 14:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B096E270;
	Tue,  8 Jun 2021 12:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A7B6E270;
 Tue,  8 Jun 2021 12:25:28 +0000 (UTC)
IronPort-SDR: GZGDE5ec6G2bWo7Faa5N2hnB3AySIs3yKtB28MuybSo64Oqg+mNyziSXziUcF4dQuJ0mOBmAZj
 oyGfwECtwy/Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="201812209"
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; d="scan'208";a="201812209"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 05:25:23 -0700
IronPort-SDR: fL2z5j/mpwBU3+gEKQ9nBh6YSL4Ul0rPcQr1myqsJ4jkVjW3nvCICV5wggktbUGPoxHXvOlxnH
 jeumqi0vpA8Q==
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; d="scan'208";a="485195612"
Received: from skallurr-mobl.ger.corp.intel.com (HELO [10.249.254.100])
 ([10.249.254.100])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 05:25:21 -0700
Message-ID: <d86d0a9749fe71aa91e80c8c83db65eebae6fe2b.camel@linux.intel.com>
Subject: Re: [PATCH v3 5/7] drm/i915/ttm: remove node usage in our naming
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 08 Jun 2021 14:25:18 +0200
In-Reply-To: <20210608110254.169357-6-matthew.auld@intel.com>
References: <20210608110254.169357-1-matthew.auld@intel.com>
 <20210608110254.169357-6-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-06-08 at 12:02 +0100, Matthew Auld wrote:
> Now that ttm_resource_manager just returns a generic ttm_resource we
> don't need to reference the mm_node stuff anymore which mostly only
> makes sense for drm_mm_node. In the next few patches we want switch
> over
> to the ttm_buddy_man which is just another type of ttm_resource so
> reflect that in the naming.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>




