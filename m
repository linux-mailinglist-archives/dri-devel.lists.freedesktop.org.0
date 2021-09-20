Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ED441105F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 09:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E0A6E406;
	Mon, 20 Sep 2021 07:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93966E406;
 Mon, 20 Sep 2021 07:42:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="223126102"
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="223126102"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 00:42:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="548604539"
Received: from svandens-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.216.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 00:41:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [Intel-gfx] [PATCH 14/19] drm/i915/oprom: Basic sanitization
In-Reply-To: <20210918043019.hhol5fgwbi2ogod2@ldmartin-desk2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-15-matthew.auld@intel.com> <87im3hh8sy.fsf@intel.com>
 <20210918043019.hhol5fgwbi2ogod2@ldmartin-desk2>
Date: Mon, 20 Sep 2021 10:41:54 +0300
Message-ID: <87czp3vgl9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 17 Sep 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, May 17, 2021 at 02:57:33PM +0300, Jani Nikula wrote:
>>On Mon, 12 Apr 2021, Matthew Auld <matthew.auld@intel.com> wrote:
>>> From: Anshuman Gupta <anshuman.gupta@intel.com>
>>>
>>> Sanitize OPROM header, CPD signature and OPROM PCI version.
>>> OPROM_HEADER, EXPANSION_ROM_HEADER and OPROM_MEU_BLOB structures
>>> and PCI struct offsets are provided by GSC counterparts.
>>> These are yet to be Documented in B.Spec.
>>> After successful sanitization, extract VBT from opregion
>>> image.
>>
>>So I don't understand what the point is with two consecutive patches
>>where the latter rewrites a lot of the former.
>
> I actually wonder what's the point of this. Getting it from spi is
> already the fallback and looks much more complex. Yes, it's pretty
> detailed and document the format pretty well, but it still looks more
> complex than the initial code. Do you see additional benefit in this
> one?

The commit message doesn't really explain much. Anshuman?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
