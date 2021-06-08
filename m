Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2677F39EF9E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E4D6EADA;
	Tue,  8 Jun 2021 07:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C196EAD5;
 Tue,  8 Jun 2021 07:34:10 +0000 (UTC)
IronPort-SDR: 1Zx8i+gIdI1SXpRhGR7JJI0HeOCvqnuTErut13tKfVQsywLO+TmkGUwmEkpl1OZPYvl+49QeYP
 Qds5Hgz76R7w==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="290419633"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="290419633"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:34:09 -0700
IronPort-SDR: OpfMSLGOC7YQZ5t73h/jw8uailJeftPv4TLgKf9BkY4zpaTt+5/jMv+7DJMGtAE+e8a8wTlok5
 8NW8ot4yePAg==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="634985455"
Received: from delmer-mobl.ger.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 00:34:08 -0700
Message-ID: <c35d9094ea1baf3d6993944451850658f550fce2.camel@linux.intel.com>
Subject: Re: [PATCH 5/6] drm/i915/ttm: switch over to ttm_buddy_man
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 08 Jun 2021 09:34:05 +0200
In-Reply-To: <20210607182210.99036-6-matthew.auld@intel.com>
References: <20210607182210.99036-1-matthew.auld@intel.com>
 <20210607182210.99036-6-matthew.auld@intel.com>
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

On Mon, 2021-06-07 at 19:22 +0100, Matthew Auld wrote:
> Move back to the buddy allocator for managing device local memory,
> and
> restore the lost mock selftests. Keep around the range manager
> related
> bits, since we likely need this for managing stolen at some point.
> For
> stolen we also don't need to reserve anything so no need to support a
> generic reserve interface.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

lgtm.
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


