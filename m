Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795E53B1A8A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8489E6E114;
	Wed, 23 Jun 2021 12:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640096E114;
 Wed, 23 Jun 2021 12:54:54 +0000 (UTC)
IronPort-SDR: x8oNyxZFcaVLo95d/ZDi0POEWpQZx26zP0LaLpCygeTjPzIThSxNh1VuPbE/Mah0FMtjxBId60
 aAKcve+JoQCw==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="292880355"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="292880355"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 05:54:53 -0700
IronPort-SDR: 006c96UoGGBg3gLBQ2fTS0KJArGTyPmhFwPIBLlnlCtlIAPyTKSBhQVfOVpTErCsEgtb7BHUdf
 KKCQaNkSODsw==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="417716448"
Received: from asortkjx-mobl.ger.corp.intel.com (HELO [10.249.254.136])
 ([10.249.254.136])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 05:54:52 -0700
Message-ID: <a6682e3bad8e71a2e92a8e6694844e35b5133b04.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/i915: support forcing the page size with lmem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Wed, 23 Jun 2021 14:54:50 +0200
In-Reply-To: <20210623112637.266855-2-matthew.auld@intel.com>
References: <20210623112637.266855-1-matthew.auld@intel.com>
 <20210623112637.266855-2-matthew.auld@intel.com>
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

On Wed, 2021-06-23 at 12:26 +0100, Matthew Auld wrote:
> For some specialised objects we might need something larger than the
> regions min_page_size due to some hw restriction, and slightly more
> hairy is needing something smaller with the guarantee that such
> objects
> will never be inserted into any GTT, which is the case for the paging
> structures.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



