Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D136CAFB39
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 11:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C12F10E504;
	Tue,  9 Dec 2025 10:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k54kGDbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C04810E504;
 Tue,  9 Dec 2025 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765277757; x=1796813757;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=M9bbmFgZkc8S0DNcL/KplCM1YEckeT2rBelfi6r5VxE=;
 b=k54kGDbdK4HxnOVSPFduzL6XmS6sdVvFDssjGUL4mteeBG1AnsXpM9P6
 JSOQ0OcMI3FZ6/gyb5NIDQLZ4S1u9oB+uqJYYF5T60KThIWZ0nnZH2uEe
 8f8wKh64nwsTEY6WEFbX1sOVQviCiqqoz7+3ieNCK8hHOQ/AESnkX558D
 WC/5q+8Gm9u9QTwxYXyPj2lSWpWoI2Z3tZr0tVvr1/5XbrEln2J1kfXxM
 LBmM7EkyuyUN/OJ3wTXfLoheGQ0B2pwPU6ev6MvhyvqYbeg4a2eXtljxD
 szmBpVHaCszTFHbzP3R1HUjvRwEkHtmFSdajE8H1nR8sgWhFuG01j4gXn Q==;
X-CSE-ConnectionGUID: jOEqceTNT7SMYqzPm51S/A==
X-CSE-MsgGUID: 0zbSzQ4aQNiupwsrh4xjrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67126085"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="67126085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 02:55:55 -0800
X-CSE-ConnectionGUID: B9R2JDrcRmebdiafbPB+qA==
X-CSE-MsgGUID: UA7yqdrxR2mmm3tyLVJTbA==
X-ExtLoop1: 1
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 02:55:52 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 14/19] video/vga: Add VGA_IS0_R
In-Reply-To: <20251209075549.14051-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251208182637.334-15-ville.syrjala@linux.intel.com>
 <20251209075549.14051-1-ville.syrjala@linux.intel.com>
Date: Tue, 09 Dec 2025 12:55:49 +0200
Message-ID: <7f70f53e34433e3056bf16195b009d14fb60b745@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 09 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Add a proper name for the "Input status register 0" IO address.
> Currently we have some code that does read addressed using the
> aliasing VGA_MSR_W define, making it unclear what register we're
> actually reading.
>
> v2: Remove stray '?'
>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  include/video/vga.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/video/vga.h b/include/video/vga.h
> index 468764d6727a..2f13c371800b 100644
> --- a/include/video/vga.h
> +++ b/include/video/vga.h
> @@ -46,6 +46,7 @@
>  #define VGA_MIS_R   	0x3CC	/* Misc Output Read Register */
>  #define VGA_MIS_W   	0x3C2	/* Misc Output Write Register */
>  #define VGA_FTC_R	0x3CA	/* Feature Control Read Register */
> +#define VGA_IS0_R	0x3C2	/* Input Status Register 0 */
>  #define VGA_IS1_RC  	0x3DA	/* Input Status Register 1 - color emulation =
*/
>  #define VGA_IS1_RM  	0x3BA	/* Input Status Register 1 - mono emulation */
>  #define VGA_PEL_D   	0x3C9	/* PEL Data Register */

--=20
Jani Nikula, Intel
