Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5AA13AB34
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 14:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704746E3C4;
	Tue, 14 Jan 2020 13:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105A06E3C4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 13:38:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 05:38:20 -0800
X-IronPort-AV: E=Sophos;i="5.69,432,1571727600"; d="scan'208";a="217743953"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 05:38:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Harry Wentland <hwentlan@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [PATCH v2] drm/dp: Add function to parse EDID descriptors for
 adaptive sync limits
In-Reply-To: <5d1ef8d1-4ef2-6b85-2893-d1c2276e4b70@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200108003208.18706-1-manasi.d.navare@intel.com>
 <87y2ugodox.fsf@intel.com> <20200110224338.GA16729@intel.com>
 <5d1ef8d1-4ef2-6b85-2893-d1c2276e4b70@amd.com>
Date: Tue, 14 Jan 2020 15:38:15 +0200
Message-ID: <87imlekvjs.fsf@intel.com>
MIME-Version: 1.0
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
Cc: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jan 2020, Harry Wentland <hwentlan@amd.com> wrote:
> Fixing Nick's email.
>
> On 2020-01-10 5:43 p.m., Manasi Navare wrote:
>> On Thu, Jan 09, 2020 at 05:24:30PM +0200, Jani Nikula wrote:
>>> On Tue, 07 Jan 2020, Manasi Navare <manasi.d.navare@intel.com> wrote:
>>>> +EXPORT_SYMBOL(drm_get_adaptive_sync_limits);
>>>
>>> Why the export? Rather, why is this not static?
>>>
>> 
>> I could make it static but since the way AMDGPU code is written right now they
>> would be calling this function explicitly to populate the vmin and vmax in their local
>> structs but I can make it static and with some minor refactoring they should be able to
>> use thsi infor directly from drm_display_info
>> 
>
> Calling this through drm_add_edid_modes should be sufficient for us.
> We'll just need to move amdgpu_dm_update_freesync_caps to our get_modes
> function.
>
> Dropping the export here seems to be the right thing to do.

Thanks; this should help unify the behaviour across drivers.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
