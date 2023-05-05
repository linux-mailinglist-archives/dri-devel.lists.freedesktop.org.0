Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F196F7E09
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 09:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611F510E58D;
	Fri,  5 May 2023 07:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BE010E585;
 Fri,  5 May 2023 07:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683272392; x=1714808392;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=yP2EPYBQavfSlJlwR25sz04hJWSdKYVyHD+dWhHomwI=;
 b=V7lLKqP2j7LdbG+5+PL7yhmwqle26KQKk3MqXYL06XNkjtQ07QdtnfMS
 fh/PaIM+nnx6ubJ5XWbLM5BId1HPnZpGjgnYW+gsTPnkqyb7n5k0qW5b6
 HN21j/C3rhw/mBRfQWlLp/+yGgBTs3+VCFllKi8gmtGt/8BU62i7/VWY0
 RGx5eiCXmhF0of+PAjzrHG/qJjDLAIEVFLHlvbQqwrckahzqRASbWKU3i
 KeRHKGZNkyRjSjDI6hCKsM8RPPSCcG7Lc5cDzqjB8S8tHeDuusg1b2CZ3
 91knD8ytHDn0IqHB8r47y/gUW7rsuJ4U348E8ZKqRq1ImUem9YU3HgXhi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="414686364"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="414686364"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 00:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="821563085"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="821563085"
Received: from ozore-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.209.109.127])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 00:39:51 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8888e3dff8c1c4fd1702ded911850da30330fbfa.camel@intel.com>
References: <20230427234843.2886921-1-alan.previn.teres.alexis@intel.com>
 <20230427234843.2886921-7-alan.previn.teres.alexis@intel.com>
 <8888e3dff8c1c4fd1702ded911850da30330fbfa.camel@intel.com>
Subject: Re: [PATCH v9 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for PXP
From: Jordan Justen <jordan.l.justen@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Fri, 05 May 2023 00:39:50 -0700
Message-ID: <168327239043.1096084.14316886882692698230@jljusten-skl>
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, justonli@chromium.org,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, dri-devel@lists.freedesktop.org,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-04 22:30:07, Teres Alexis, Alan Previn wrote:
> On Thu, 2023-04-27 at 16:48 -0700, Teres Alexis, Alan Previn wrote:
> > Because of the additional firmware, component-driver and
> > initialization depedencies required on MTL platform before a
> > PXP context can be created, UMD calling for PXP creation as a
> > way to get-caps can take a long time. An actual real world
> > customer stack has seen this happen in the 4-to-8 second range
> > after the kernel starts (which sees MESA's init appear in the
> > middle of this range as the compositor comes up). To avoid
> > unncessary delays experienced by the UMD for get-caps purposes,
> > add a GET_PARAM for I915_PARAM_PXP_SUPPORT.
> >=20
> alan:snip.
> Progress update on the UMD side - I'm working on patch for PR here:=20
> https://gitlab.freedesktop.org/alan_previn_intel/mesa-alan-previn-feature=
s/-/commit/fb9d4fbfbef7dfd3f41df335cd31549fd39ddb57
> but taking time to verify certain code paths

Just to confirm, if I915_PARAM_PXP_STATUS returns 2 ("will be ready
soon"), then it is basically certain that in a production environment,
then it will eventually return 1 meaning it's ready, right?

If this is correct, then I think that the change in
i915_gem_supports_protected_context() is good, and probably we can
skip the change in iris_create_hw_context().

Basically, we're timing out for multiple seconds either way. And, I'm
hoping that the kernel will eventually get the PXP init done and
create the context.

I think there's 2 cases of interest here.

First, and most likely, the application running doesn't care about
protected content. In this case we can quickly advertise the support,
but there will be no consequence because the application won't use the
feature.

Second, the application does care about protected content. In this
case we can quickly advertise the support, but if the feature is used
too quickly, then the context create might take a long time.

If I915_PARAM_PXP_STATUS returning 2 has a reasonable chance in a
production environment of eventually finding out that pxp can't work,
then perhaps more disussion is needed. I guess the worst case scenario
is no worse than today though. (Except it is still somewhat better,
because the common case would not involve protected content being
used by the application.)

Another option besides from the timeout loop in
iris_create_hw_context() might be to check I915_PARAM_PXP_STATUS after
the context create fails to tweak the debug message.

-Jordan
