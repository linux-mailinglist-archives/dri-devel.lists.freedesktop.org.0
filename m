Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0CD16F383
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 00:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7276289A5D;
	Tue, 25 Feb 2020 23:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CED89295;
 Tue, 25 Feb 2020 23:35:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 15:35:11 -0800
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; d="scan'208";a="226519250"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 15:35:10 -0800
Date: Tue, 25 Feb 2020 15:36:12 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 7/7] docs: gpu: i915.rst: fix warnings due to file renames
Message-ID: <20200225233612.GB347826@intel.com>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <ab08b73be87b66700f244a4e41db8a5e7e768916.1582361738.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab08b73be87b66700f244a4e41db8a5e7e768916.1582361738.git.mchehab+huawei@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 22, 2020 at 10:00:07AM +0100, Mauro Carvalho Chehab wrote:
> Fix two warnings due to file rename:
> 
> 	WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -function csr support for dmc ./drivers/gpu/drm/i915/intel_csr.c' failed with return code 1
> 	WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -internal ./drivers/gpu/drm/i915/intel_csr.c' failed with return code 2
> 
> Fixes: 06d3ff6e7451 ("drm/i915: move intel_csr.[ch] under display/")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  Documentation/gpu/i915.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index e539c42a3e78..cc74e24ca3b5 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -207,10 +207,10 @@ DPIO
>  CSR firmware support for DMC
>  ----------------------------
>  
> -.. kernel-doc:: drivers/gpu/drm/i915/intel_csr.c
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_csr.c
>     :doc: csr support for dmc
>  
> -.. kernel-doc:: drivers/gpu/drm/i915/intel_csr.c
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_csr.c
>     :internal:
>  
>  Video BIOS Table (VBT)
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
