Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C472B345E43
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 13:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A126E8DB;
	Tue, 23 Mar 2021 12:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D066E8DB;
 Tue, 23 Mar 2021 12:37:10 +0000 (UTC)
IronPort-SDR: zZslqEfE1UpIxv42KtiIzadeG6upYDcwbtEnDMELcNktTNwguArtL4mEBTc40g9D8Zzw7jahgb
 Ix53ev3alrdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="190495471"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="190495471"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 05:37:09 -0700
IronPort-SDR: H6It05s2nSHggBAdlFDKCWl/V4oQ/Pvt07yG+K9tgT7d4wHG849mHCwOUMbpr3rHhg5BLWZAfz
 Ng38yA5LSC4g==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="374227548"
Received: from abdulla1-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.251.23.100])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 05:37:08 -0700
Date: Tue, 23 Mar 2021 08:37:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/doc: Add RFC section
Message-ID: <YFng89ujYxcyJQmN@intel.com>
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
 <20210323084453.366863-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323084453.366863-2-daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 09:44:53AM +0100, Daniel Vetter wrote:
> Motivated by the pre-review process for i915 gem/gt features, but
> probably useful in general for complex stuff.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/index.rst |  1 +
>  Documentation/gpu/rfc.rst   | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 Documentation/gpu/rfc.rst
> 
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index c9a51e3bfb5a..df58cb826d68 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -16,6 +16,7 @@ Linux GPU Driver Developer's Guide
>     vga-switcheroo
>     vgaarbiter
>     todo
> +   rfc

I understand the motivation here so I didn't commented earlier, but looking now,
I'm wondering that this section will polute the official doc...

>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/gpu/rfc.rst b/Documentation/gpu/rfc.rst
> new file mode 100644
> index 000000000000..9d0ff2921af8
> --- /dev/null
> +++ b/Documentation/gpu/rfc.rst
> @@ -0,0 +1,16 @@
> +===============
> +GPU RFC Section
> +===============
> +
> +For complex work, especially new uapi, it is often good to nail the high level
> +design issues before getting lost in the code details. This section is meant to
> +host such documentation:
> +
> +* Each RFC should be a section in this file, explaining the goal and main design
> +  considerations.
> +
> +* For uapi structures add a file to this directory with and then pull the
> +  kerneldoc in like with real uapi headers.
> +
> +* Once the code has landed move all the documentation to the right places in
> +  the main core, helper or driver sections.
> -- 
> 2.31.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
