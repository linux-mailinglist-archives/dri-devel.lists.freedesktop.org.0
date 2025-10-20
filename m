Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFED8BF065F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22BD10E398;
	Mon, 20 Oct 2025 10:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDh59/Xr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA05B10E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:05:16 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-427091cd4fdso1761799f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 03:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760954715; x=1761559515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmRi35y6N5WRRBxahDavUEXtA6gcUuvhGuS8xAmEQp0=;
 b=gDh59/XrloRMxbe/m8xm8igCzsZ8fbt0tPQJVxrL2MMgIqfkqAR7P4VKk6FMAJvhiD
 eQ/PCqi+99FbWnrL95l/UlNJnflMLG5bhDqb1BV6P+ZeCLnGqTCfMzxWVkhoNj/TBQ7C
 q3PpXgX7Iz43XMzmUQLdyud4im8WpltdgrfQsog/fBT73+km/cJ7qcvlfIqINHSAy7V1
 FY/8NFwtVcbrz0sc2sG0wMeDReY7kcYqGZjwSry6cErPSjJFFriYU7soxFg7sNUuJlBl
 7nZMSu7eQk4mkmvyoC7AHisAtBXTrvKfBzZIezFEGdWiF7Ycb7PFZwxm8ofPNi+BxDNJ
 Byzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760954715; x=1761559515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmRi35y6N5WRRBxahDavUEXtA6gcUuvhGuS8xAmEQp0=;
 b=Ot1s8UbtSZ53oZctsfGb2rAyt+CJEEtpp4Sj0aeQ8ahDCmZ75SWsQu35tWkRd1qMSs
 8To644mLrZWWNcdBrUDKRfGN/xf9m+olMn5cTe3nPcZTk/lDXa7417vIeXU/h94avEyo
 8bB6Zx03lBdQlMcsY6GgC/XPlP8HVyulg96gZ5SiGjaLOgbCPB1U8CJWsz0rrhIb2rB8
 kcBGlkDtMFWOVm2dcH5kHjN2CYbKSA+pmPR0efGNS06Pc5yQVdQZCVmQqFBup7VeQZt/
 QaeEblsqHKya9Iopa4rrZwcl/cdzW8o3WJH9/EjJEUUS1iAJPcSbHLUqqGgjpzhYypRY
 81Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT6MxYml3aMKq1haRD+xDJw9iG1xifDICF66/EkIHUCxHxARLvATEgA5+3JWOW8yrW7mixO2BwtXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHQCDhqMpOjU/Sf4h1tolpzfv8C8wbJGul/I+4rwzAv18w/4VS
 9ehRQ1dngeiMX3AnosKmZH3kHa6jujjuexHILdibRPLgeeHqWXNfg35C
X-Gm-Gg: ASbGncskXOqxiFjeM4n4YvRIFz6q8efEJ0O0rS5vTrW6BRt8DjeMtn/CrnBjogyBhs9
 Ie+YL2sIqt4mrrvaFM98+jpfb5lpxupM4DyYixpzvWxcq+/9kJ79OIK2XF5RITnbUpjdTqpcAXR
 MFnr23Pggwcbf+bmJmjzS1erbOonNbSe8WAdt5B7UPu4lIJl0iQ1jfT5vt6LsOlovBQJ92NHL/m
 AbHkAC5eAIPcdOJMuNWU5u642rT9MvEjSXCpaAjrWNeOFfE2OmnLRShhhHSuw9Wp7OJLsAUkSiy
 QpCf/jlh5cVq07pVhNnSiWQETmMn8fu1mkFPxc4+67/8kNzHQd/6GdtHttqfdDf1tS0wWjBWQW5
 TWZGX7x7OjEPQK+uBOUidfF2HxxHIaBfrzyb6oLOab9ZuyPqU6U139UxLTl6cVmN6oEMu7NZIo6
 rHWXyhPC/Ret/Q0V8HWksbA2J2BwfaV/xv9qD2bUH2aV4mYjltrI+H
X-Google-Smtp-Source: AGHT+IFIwYtaN8vVGOKJnzPfzSNFBFhGVp3hgUQ/fiHsNQ1iCinDla5G+0DyDEO1L7XTYHNYpfyOFA==
X-Received: by 2002:a05:6000:144a:b0:427:e1bf:13bd with SMTP id
 ffacd0b85a97d-427e1bf1a74mr5180978f8f.52.1760954715031; 
 Mon, 20 Oct 2025 03:05:15 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5bab52sm14419230f8f.22.2025.10.20.03.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 03:05:14 -0700 (PDT)
Date: Mon, 20 Oct 2025 11:05:13 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Neph <ryanneph@google.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, "Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/xe/configfs: fix clang warnings for missing
 parameter name
Message-ID: <20251020110513.48d18788@pumpkin>
In-Reply-To: <20251017-rn-cfi-v1-2-bf66e6ad4fcd@google.com>
References: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
 <20251017-rn-cfi-v1-2-bf66e6ad4fcd@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 17 Oct 2025 12:46:26 -0700
Ryan Neph <ryanneph@google.com> wrote:

> Fixes warning from clang-17 that look like:
> 
> drivers/gpu/drm/xe/xe_configfs.h:35:97: error: omitting the parameter name in a function definition is a C2x extension [-Werror,-Wc2x-extensions]
>    35 | static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,

Why did that become invalid?
It has pretty much always been used - and can be used to avoid -Wshadow warnings.
This looks like a clang bug.
And you'd want a specific -W 'knob' for it as well.

At a guess the C2x extension lets the name be omitted in the function body for
an unused parameter (the same as C++).
I think that is the 'definition' and the ones being changed here are the 'declaration'.
But I might be wrong.

	David

> 
> Signed-off-by: Ryan Neph <ryanneph@google.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index fed57be0b90e146d57d966bab0e55e1723513997..a0d614b37efd54b89390f04a238aef1a8d4df4e2 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -21,9 +21,9 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class class,
>  				       const u32 **cs);
> -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class class,
>  					const u32 **cs);
>  #ifdef CONFIG_PCI_IOV
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> @@ -37,9 +37,11 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
>  static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> -static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> +static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +						     enum xe_engine_class class,
>  						     const u32 **cs) { return 0; }
> -static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +						      enum xe_engine_class class,
>  						      const u32 **cs) { return 0; }
>  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
>  #endif
> 

