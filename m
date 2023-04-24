Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D216ED348
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 19:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F317510E4C7;
	Mon, 24 Apr 2023 17:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D6010E3F1;
 Mon, 24 Apr 2023 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682356382; x=1713892382;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=f00bfTfqcLFN3iXNjVAD0Fff+Vhc8RGA6+P4ZM64hpc=;
 b=YO8aLF6RSLpeFZ3y9/Heku3HTvOl5vlE+RFnocOb55CzgALfXMwlP+3C
 ZqNfttPnq+J6twB3KbzWFIyPRGHRZPMQzI9inB+tJ3pk3Ld0OzWuhc4oA
 ckgS8fKRw/WclYcixlI3VCavtshi0Ngw8h5ZhxIoOoGZE4Ds6v5L6KioY
 2N/0O6g39XDAfPaueDWwrGF+xyDDsVa64GgcOeVzTPAuLy/tz8zEG4D9B
 Hy0A3DfPHmY36bYeCTH9WrKkKLn36FnNzuZvBpYeQ3qCJDXWb8v+TUPPS
 Y+JE1HhugEvylGA9ZpaLGnEhrJ1J0Uw8JCORIjhP903h2a28V5SrVkSmP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="326824403"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="326824403"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 10:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="686934399"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="686934399"
Received: from rmanna-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.209.73.193])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 10:13:00 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5d0e2cf4-a487-1a1e-dae9-4fbe8c2fe649@linux.intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-9-fei.yang@intel.com>
 <ZEEkV3XOdmtYWnMv@ashyti-mobl2.lan>
 <471addf7-1670-32cd-9d2e-3f94d6825eab@linux.intel.com>
 <BYAPR11MB2567A1A450448AE17B38ED1C9A639@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168211012988.392286.16107510619704913123@jljusten-skl>
 <BYAPR11MB2567F03AD43D7E2DE2628D5D9A669@BYAPR11MB2567.namprd11.prod.outlook.com>
 <168232538771.392286.3227368099155268955@jljusten-skl>
 <5d0e2cf4-a487-1a1e-dae9-4fbe8c2fe649@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 8/8] drm/i915: Allow user to set cache at BO
 creation
From: Jordan Justen <jordan.l.justen@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Yang,
 Fei" <fei.yang@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Mon, 24 Apr 2023 10:13:00 -0700
Message-ID: <168235638024.392286.14697291321034695564@jljusten-skl>
User-Agent: alot/0.10
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Intel-gfx@lists.freedesktop.org, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-24 02:08:43, Tvrtko Ursulin wrote:
>=20
> Being able to "list" supported extensions sounds like a reasonable
> principle, albeit a departure from the design direction to date.
> Which means there are probably no quick solutions. Also, AFAIU, only
> PXP context create is the problematic one, right? Everything else is
> pretty much instant or delayed allocation so super cheap to probe by
> attempting to use.
>=20
> If I got that right and given this series is about
> drm_i915_gem_create_ext I don't think this side discussion should be
> blocking it.

This still leaves the issue of no reasonable detection mechanism for
the extension. If the discussion gets too complicated, then can we add
a GET_PARAM for the SET_PAT extension? I'm hoping we could either come
up with something better reasonably quickly, or i915/Xe can add a new
param for each new extensions until a better approach is available.

> Furthermore the PXP context create story is even more complicated,
> in a way that it is not just about querying whether the extension is
> supported, but the expensive check is something more complicated.
>=20
> Going back to implementation details for this proposed new feature,
> one alternative to query could be something like:
>=20
>    drm_i915_gem_create_ext.flags |=3D I915_GEM_CREATE_EXT_FLAG_PROBE_EXTE=
NSIONS;
>=20
> That would be somewhat more light weight to implement that the
> i915_query route. And it appears it would work for all ioctls which
> support extensions apart for i915_context_param_engines.

This seems little better than the "try it, and if it works then it's
supported".

I'm not suggesting that userspace should be able to check that
scenario x+y+z will work, but more a list of extensions that
conceivably could work. Normally this should just a matter of the
kernel unconditionally adding the newly implemented extension to the
list returned in the query call.

If a GET_PARAM can be made for the PXP case, then it seems like a
query item returning CONTEXT_CREATE extensions could conditionally
omit that extension just as easily as implementing the proposed new
GET_PARAM.

-Jordan
