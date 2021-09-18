Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13414103A1
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 06:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41A06F3AE;
	Sat, 18 Sep 2021 04:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA316F3AE;
 Sat, 18 Sep 2021 04:30:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="222962845"
X-IronPort-AV: E=Sophos;i="5.85,303,1624345200"; d="scan'208";a="222962845"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 21:30:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,303,1624345200"; d="scan'208";a="701554795"
Received: from yseah-mobl.gar.corp.intel.com (HELO ldmartin-desk2)
 ([10.252.130.247])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 21:30:19 -0700
Date: Fri, 17 Sep 2021 21:30:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 14/19] drm/i915/oprom: Basic sanitization
Message-ID: <20210918043019.hhol5fgwbi2ogod2@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-15-matthew.auld@intel.com>
 <87im3hh8sy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87im3hh8sy.fsf@intel.com>
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

On Mon, May 17, 2021 at 02:57:33PM +0300, Jani Nikula wrote:
>On Mon, 12 Apr 2021, Matthew Auld <matthew.auld@intel.com> wrote:
>> From: Anshuman Gupta <anshuman.gupta@intel.com>
>>
>> Sanitize OPROM header, CPD signature and OPROM PCI version.
>> OPROM_HEADER, EXPANSION_ROM_HEADER and OPROM_MEU_BLOB structures
>> and PCI struct offsets are provided by GSC counterparts.
>> These are yet to be Documented in B.Spec.
>> After successful sanitization, extract VBT from opregion
>> image.
>
>So I don't understand what the point is with two consecutive patches
>where the latter rewrites a lot of the former.

I actually wonder what's the point of this. Getting it from spi is
already the fallback and looks much more complex. Yes, it's pretty
detailed and document the format pretty well, but it still looks more
complex than the initial code. Do you see additional benefit in this
one?

Lucas De Marchi
