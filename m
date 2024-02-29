Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526AC86C60C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 10:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEEB10E250;
	Thu, 29 Feb 2024 09:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l39FK23T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C52E10E16D;
 Thu, 29 Feb 2024 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709200272; x=1740736272;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=P9OUq3TjFGAj7EGbVbOL7kAAVSoUr+My/iyEHR5jQ+s=;
 b=l39FK23TpOo/d1jRCjKWAXNvuIhsba88EHDD+H+dRkqjmUKEoNgHUdH8
 mqZDPFHmAnf87QDFgzfj3t9p7N7hOf4l4l7NEs9E8Els2oz2NSTHnai/H
 V2DlZpISRhQhhQDGzcUJwsB975lFfFmxNfHxZJpUB4ujNj63CI+DZVcfH
 AWqMNDa51LVg0gNoqLwI2vQj4eXjVPPc6sxzsMT3/mz54wxRVU/4hK2tu
 /L0wOY35T1MfY5TnaTT1rDa9lPacEbb0OByoVJArG32jGenDLtsuBDe9H
 /5Mi4oeHEjCASZDr/e/vGVWmYc5MjeZ/efmUHuua2Qk5iDQck3P7O9Hdz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="26122622"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="26122622"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 01:51:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8129894"
Received: from smatua-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.47.143])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 01:51:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v12 0/8] Enable Adaptive Sync SDP Support for DP
In-Reply-To: <IA1PR11MB63486AE9EC5E30EC94FE39F0B25F2@IA1PR11MB6348.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <87wmqo8vt9.fsf@intel.com>
 <IA1PR11MB63486AE9EC5E30EC94FE39F0B25F2@IA1PR11MB6348.namprd11.prod.outlook.com>
Date: Thu, 29 Feb 2024 11:51:05 +0200
Message-ID: <87ttlr8upi.fsf@intel.com>
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

On Thu, 29 Feb 2024, "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com> wrote:
>> Subject: Re: [PATCH v12 0/8] Enable Adaptive Sync SDP Support for DP
>>
>> On Wed, 28 Feb 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>> wrote:
>> > -v12:
>> > - Update cover letter
>>
>> Did you just send the entire series again within 30 minutes just to update the
>> cover letter? You could've just replied to the cover letter...
>
> Sorry, I should have used git send-email --in-reply-to, will take care from next time onwards.

I mean you can just reply to the cover letter and say what you missed,
you don't have to send the whole thing again. It's no different from any
email.

BR,
Jani.


-- 
Jani Nikula, Intel
