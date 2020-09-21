Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2C273209
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 20:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26F46E51B;
	Mon, 21 Sep 2020 18:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4D26E51B;
 Mon, 21 Sep 2020 18:36:58 +0000 (UTC)
IronPort-SDR: bP5QqbiV9m+rMyjaiB0op6xK1CQ22kOB0fChymd2Vp2I9B5MoX/N0i5bODgPOlxTEwNPC1SOxi
 HMPBfCaDBsPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="178517692"
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="178517692"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 11:36:57 -0700
IronPort-SDR: PZPhsDQwnvhVcFDhIj6wilJWtSKNVSKzzNYy8jsIkjvgIcO5hk0n55ikIai0tXzfEvxA5KYsmx
 rIBHyWF7FmJA==
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="485606928"
Received: from pamcglyn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.84.51])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 11:36:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/dp: start using more of the extended receiver caps
In-Reply-To: <3df7f6ec13348537bec5e0736563616e9ed05c28.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200901123226.4177-1-jani.nikula@intel.com>
 <c4b9aa428ccfa90cb29845f622eba8923eeb2e38.camel@redhat.com>
 <87d0354bqi.fsf@intel.com>
 <3df7f6ec13348537bec5e0736563616e9ed05c28.camel@redhat.com>
Date: Mon, 21 Sep 2020 21:37:06 +0300
Message-ID: <87v9g7q8ml.fsf@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Sep 2020, Lyude Paul <lyude@redhat.com> wrote:
> On Tue, 2020-09-01 at 21:01 +0300, Jani Nikula wrote:
>> I guess we can try without the change, and fix later if we hit issues.
>
> I'm fine with the change if it doesn't break things btw - just as long as
> we're making sure that we don't zero things out by accident

My conclusion was to go without, it's a trivial change to add
afterwards as needed.

BR,
Jani.




-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
