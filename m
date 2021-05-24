Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0148238E398
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 11:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E06C89E35;
	Mon, 24 May 2021 09:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC7C89E2B;
 Mon, 24 May 2021 09:58:34 +0000 (UTC)
IronPort-SDR: GC2vqXGRS9CNM1yzDD2X0/8kUy7XRFEVABo+2AcpkG8nMKJ/fVzVl8vQdQ1owGOxXbQBGBwNWX
 RbNUMm38OyIw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="201642577"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="201642577"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 02:58:23 -0700
IronPort-SDR: dTHp+e+t4ZPyBbswo/UtVUwX1e0nazldsFQsibrjZg2XKlczBTooZE7LgKEUnB2kwTkpq6ZUa6
 /Y81midfQXlg==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="475786397"
Received: from jaherrex-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.50.169])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 02:58:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: i915 gvt broke drm-tip; Fix ASAP
In-Reply-To: <20210524030901.GC27293@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <58f039e1-225f-4542-8355-1ae91a225206@suse.de>
 <20210524030901.GC27293@zhen-hp.sh.intel.com>
Date: Mon, 24 May 2021 12:58:16 +0300
Message-ID: <87k0nocv2f.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 May 2021, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> On 2021.05.22 21:19:38 +0200, Thomas Zimmermann wrote:
>> Hi,
>> 
>> after creating drm-tip today as part of [1], building drm-tip is now broken
>> with the error message shown below.
>> 
>> Some register constants appear to be missing from the GVT code. Please fix
>> ASAP.
>>
>
> Thanks, Thomas. Looks DMC rename missed gvt part. We need to ask CI to have
> at least build test with gvt.

Indeed. This is fixed now with 273895109a04 ("drm/i915/gvt: Add missing
macro name changes").

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
