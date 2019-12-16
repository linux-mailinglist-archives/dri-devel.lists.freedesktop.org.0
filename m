Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DAF11FD98
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 05:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E9B6E42D;
	Mon, 16 Dec 2019 04:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3546E42D;
 Mon, 16 Dec 2019 04:28:21 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Dec 2019 20:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,320,1571727600"; d="scan'208";a="221420665"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2019 20:28:21 -0800
Date: Sun, 15 Dec 2019 20:17:10 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [RFC v2 03/12] drm/i915/svm: Implicitly migrate BOs
 upon CPU access
Message-ID: <20191216041710.GV14488@nvishwa1-DESK.sc.intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-4-niranjana.vishwanathapura@intel.com>
 <157632111528.7535.2801931080292335530@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157632111528.7535.2801931080292335530@skylake-alporthouse-com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: kenneth.w.graunke@intel.com, intel-gfx@lists.freedesktop.org,
 sanjay.k.kumar@intel.com, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, dave.hansen@intel.com, jglisse@redhat.com,
 jgg@mellanox.com, daniel.vetter@intel.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 14, 2019 at 10:58:35AM +0000, Chris Wilson wrote:
>Quoting Niranjana Vishwanathapura (2019-12-13 21:56:05)
>> +int i915_gem_object_migrate_region(struct drm_i915_gem_object *obj,
>> +                                  u32 *regions, int size)
>> +{
>> +       struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
>> +       struct intel_context *ce = dev_priv->engine[BCS0]->kernel_context;
>> +       int i, ret;
>> +
>>         mutex_lock(&dev_priv->drm.struct_mutex);
>>         ret = i915_gem_object_prepare_move(obj);
>
>You appear to be based on a very broken code base. I'd recommend not
>doing that.

Yah, this patch is dependent on the object migration support posted in LMEM
patch series. I only included this for RFC to give a full picture.

Niranjana

>-Chris

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
