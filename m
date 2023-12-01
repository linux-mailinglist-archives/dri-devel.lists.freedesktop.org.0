Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F9800DD1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 16:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D179410E121;
	Fri,  1 Dec 2023 15:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF29510E8E1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701442868; x=1732978868;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=neT4Hf+obtBf9p4YDRJKGw0EfyhXIRhgDs2UETBnJqQ=;
 b=alojJozc6TlZRDo8HA7SHBqiWfV4dX6WCzAMm/1hao5e0xFMncvdX/LE
 DXaHYlO3NCArMd/BJM6qzWkqoA3XrmdZlAj0AzzIoVoAGdDyoj0U2/RbC
 pW+8PuQ7/JpvtYu16C7N90RfX3JtD2nCWojCLu3U+7Mt3yIWt3xoZZo/p
 S0IK7XJAbjwsnVzgmzDLqgO0Ct8e9rBtQtEiE2mRMOYcFHiMGHsKCpOSX
 OxcCgc1uqZe3vkeJ97M5JuHrwewKwhaWDH/vA+AMWfbA2HvABpfkCILJ5
 B20AInC7XCsb47EpWwVLYJbm6PGz8eK7odismiuxojZ3/SeE7KHXwKiZa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="383903040"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="383903040"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="763166038"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="763166038"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 01 Dec 2023 07:00:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 01 Dec 2023 17:00:32 +0200
Date: Fri, 1 Dec 2023 17:00:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <ZWn1EC04wBSN9hu2@intel.com>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231130200740.53454-1-andrealmeid@igalia.com>
X-Patchwork-Hint: comment
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 05:07:40PM -0300, André Almeida wrote:
> From: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> Specify how the atomic state is maintained between userspace and
> kernel, plus the special case for async flips.
> 
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> 
> This is a standalone patch from the following serie, the other patches are
> already merged:
> https://lore.kernel.org/lkml/20231122161941.320564-1-andrealmeid@igalia.com/
> 
>  Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 370d820be248..d0693f902a5c 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -570,3 +570,50 @@ dma-buf interoperability
>  
>  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>  information on how dma-buf is integrated and exposed within DRM.
> +
> +KMS atomic state
> +================
> +
> +An atomic commit can change multiple KMS properties in an atomic fashion,
> +without ever applying intermediate or partial state changes.  Either the whole
> +commit succeeds or fails, and it will never be applied partially. This is the
> +fundamental improvement of the atomic API over the older non-atomic API which is
> +referred to as the "legacy API".  Applying intermediate state could unexpectedly
> +fail, cause visible glitches, or delay reaching the final state.
> +
> +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which means the
> +complete state change is validated but not applied.  Userspace should use this
> +flag to validate any state change before asking to apply it. If validation fails
> +for any reason, userspace should attempt to fall back to another, perhaps
> +simpler, final state.  This allows userspace to probe for various configurations
> +without causing visible glitches on screen and without the need to undo a
> +probing change.
> +
> +The changes recorded in an atomic commit apply on top the current KMS state in
> +the kernel. Hence, the complete new KMS state is the complete old KMS state with
> +the committed property settings done on top. The kernel will try to avoid
> +no-operation changes,

Not how things work. The driver may try to avoid some really
expensive operations, but generally it will just blindly blast
the full state to the hardware.

IIRC this was discussed long ago when atomic was being designed
and the general concensus was that the kernel shouldn't generally
do this kind of stuff, and instead we just leave it to userspace
to generate optimal commits.

> so it is safe for userspace to send redundant property
> +settings.

Safe but not optimal. Any object included in the state will cause said
object to be part of the commit, and side effects will also need to be
observed.

So if you add an extra crtc (either directly or indirectly) it will
have a new commit inserted into the queue and thus and any subsequent
commit will either block or be rejected with -EBUSY. Also for directly
added crtcs an event will be emitted once the commit is done.

Any plane added will also need to observe side effects even if the FB
doesn't change, such as invalidating any internal compressed version
of the old FB contents, PSR/DSI command mode/etc. will need to upload
the frame to the display, etc. I suppose we could specify that if no
FB is specified at all then these kind of side effects could be ignored,
but that is certainly not how things are implemented right now.

So for optimal behaviour userspace should be minimizing the commits.

-- 
Ville Syrjälä
Intel
