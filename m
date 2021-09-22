Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C45415315
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 23:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F566E056;
	Wed, 22 Sep 2021 21:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B243F6E054;
 Wed, 22 Sep 2021 21:53:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="284723150"
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; d="scan'208";a="284723150"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 14:53:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; d="scan'208";a="557647997"
Received: from shanshug-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.252.133.169])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 14:53:20 -0700
Date: Wed, 22 Sep 2021 14:53:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 14/19] drm/i915/oprom: Basic sanitization
Message-ID: <20210922215317.pug7nyhwsqvquhvw@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-15-matthew.auld@intel.com>
 <87im3hh8sy.fsf@intel.com>
 <20210918043019.hhol5fgwbi2ogod2@ldmartin-desk2>
 <87czp3vgl9.fsf@intel.com>
 <97159e5b7e8f4ef49b773be085b886be@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <97159e5b7e8f4ef49b773be085b886be@intel.com>
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

On Mon, Sep 20, 2021 at 08:04:32AM +0000, Gupta, Anshuman wrote:
>
>
>> -----Original Message-----
>> From: Nikula, Jani <jani.nikula@intel.com>
>> Sent: Monday, September 20, 2021 1:12 PM
>> To: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Cc: Auld, Matthew <matthew.auld@intel.com>; intel-gfx@lists.freedesktop.org;
>> dri-devel@lists.freedesktop.org; Gupta, Anshuman
>> <anshuman.gupta@intel.com>
>> Subject: Re: [Intel-gfx] [PATCH 14/19] drm/i915/oprom: Basic sanitization
>>
>> On Fri, 17 Sep 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> > On Mon, May 17, 2021 at 02:57:33PM +0300, Jani Nikula wrote:
>> >>On Mon, 12 Apr 2021, Matthew Auld <matthew.auld@intel.com> wrote:
>> >>> From: Anshuman Gupta <anshuman.gupta@intel.com>
>> >>>
>> >>> Sanitize OPROM header, CPD signature and OPROM PCI version.
>> >>> OPROM_HEADER, EXPANSION_ROM_HEADER and OPROM_MEU_BLOB
>> structures and
>> >>> PCI struct offsets are provided by GSC counterparts.
>> >>> These are yet to be Documented in B.Spec.
>> >>> After successful sanitization, extract VBT from opregion image.
>> >>
>> >>So I don't understand what the point is with two consecutive patches
>> >>where the latter rewrites a lot of the former.
>> >
>> > I actually wonder what's the point of this. Getting it from spi is
>> > already the fallback and looks much more complex. Yes, it's pretty
>> > detailed and document the format pretty well, but it still looks more
>> > complex than the initial code. Do you see additional benefit in this
>> > one?
>Getting opregion image from spi is needed to get the intel_opregion and its mailboxes on discrete card.
>>
>> The commit message doesn't really explain much. Anshuman?
>I will get rework of the patches and float it again.


from this patch the only thing I see it's doing is to get the VBT from
inside opregion... it moves the read part to helper methods and
apparently it supports multiple images...?

The question here is not why we are reading from spi, but rather what
this is doing that the previous commit wasn't already.

Lucas De Marchi
