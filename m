Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4266F9127
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 12:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2A410E237;
	Sat,  6 May 2023 10:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B11810E5C8;
 Fri,  5 May 2023 11:12:56 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3063433fa66so1097560f8f.3; 
 Fri, 05 May 2023 04:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683285175; x=1685877175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1ijXnLFs/E46BZ9vNzrvv52u6Szz+pPucPk3iNgQDX0=;
 b=ktYmbTRAlaZPDQsuTHy/0W24MvI1iC67ZUpDtDkZ9YSlqzbJBWP+0kFoH8q3O4qUut
 VM98hi2uHsFbz/a0TfWfO7KvfyYzl17T7JQzv6CKZmpSJ0F1+rUE3+8BcLPCasHpRYBh
 w3+xRL+jvzEaqldrTuZFIITUxQJF8VKhNY10/FJ3qtw7usjlZkbrZUAEo1vviX7GohaY
 5KKPw12O6XNmC6HTyUrMnlnnG+8ZbqEy6bBgQvW67d6vp4NcGNVms7IDdScdHK7wbMIz
 1yO76Y4+hDmJbQFYJkb/AMHKBQEFiuadthz9Nyn15POXLgi9VcW19GgSdXDTnt49g9KG
 6fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683285175; x=1685877175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ijXnLFs/E46BZ9vNzrvv52u6Szz+pPucPk3iNgQDX0=;
 b=fVQIVA01y1VpYMa598pSmUuw3Jm0VlrTV/Ac4AmpSOq33Fc++Alb6Z75SVx4wiLANv
 4zbHE0OxZbP2ml/vZ6sBS+EsxMze/DISAUHoVTM8fXYP4qeQ8/wcE6VARLJwPDoRLB9S
 yHILX2rclfE5rVaPW8F6/+lCF7pCYgDc4OZiOLkciYdyH+SRMm792tvbzC4/G30PzEKb
 XVrsaN2l/imTAYEldi1yuHzvZALGLCLxLVLIBfj09xzbtsuKjCG0kvCKmGrjUVduhlE8
 5gcEiF1ivw8+BBFh1Z0+jYTtaZ7JSFnPFXR516/Td7b/Ic2S8BMh1/4PcE9wpK+rusa4
 LCgg==
X-Gm-Message-State: AC+VfDzsQEYNv/6tERW+6J9eQHM7HYVzXlEpIcD0cVc6bSU8d6ILFa1U
 kiM7rKTpsT0/nt0R8NqfYv0=
X-Google-Smtp-Source: ACHHUZ7VBqUiJxZux5Zvw1CbWJkUScVvhwDiZ8l56Xhc08qtgy5n+5w+8QOylGPS6kQyJv2SQvxZfw==
X-Received: by 2002:adf:f188:0:b0:306:37ac:ef8e with SMTP id
 h8-20020adff188000000b0030637acef8emr1077455wro.56.1683285174620; 
 Fri, 05 May 2023 04:12:54 -0700 (PDT)
Received: from localhost (host86-156-84-164.range86-156.btcentralplus.com.
 [86.156.84.164]) by smtp.gmail.com with ESMTPSA id
 g11-20020adff40b000000b002c8476dde7asm2054187wro.114.2023.05.05.04.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 04:12:53 -0700 (PDT)
Date: Fri, 5 May 2023 12:12:52 +0100
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 145e5cddfe8b4bf607510b2dcf630d95f4db420f
Message-ID: <1c8aade0-5859-40f3-b6af-5211d1f6a941@lucifer.local>
References: <20230505024758.umVTa%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505024758.umVTa%lkp@intel.com>
X-Mailman-Approved-At: Sat, 06 May 2023 10:33:25 +0000
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
Cc: linux-bluetooth@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 10:47:58AM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 145e5cddfe8b4bf607510b2dcf630d95f4db420f  Add linux-next specific files for 20230504
>
> Error/Warning reports:
>
> https://lore.kernel.org/oe-kbuild-all/202304102354.Q4VOXGTE-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202304220119.94Pw6YsD-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202304230014.YbScpx20-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202304250419.YtCLtUhG-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202305042329.Gyk53keD-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202305050237.1cQ4fBKs-lkp@intel.com
>
> Error/Warning: (recently discovered and may have been fixed)
>
> arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No such file or directory
> drivers/accel/habanalabs/gaudi/gaudi.c:117:19: warning: unused variable 'gaudi_irq_name' [-Wunused-const-variable]
> drivers/base/regmap/regcache-maple.c:113:23: warning: 'lower_index' is used uninitialized [-Wuninitialized]
> drivers/base/regmap/regcache-maple.c:113:36: warning: 'lower_last' is used uninitialized [-Wuninitialized]
> drivers/bluetooth/btnxpuart.c:1332:34: warning: unused variable 'nxpuart_of_match_table' [-Wunused-const-variable]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6339:6: warning: no previous prototype for 'amdgpu_dm_connector_funcs_force' [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6395:21: warning: variable 'count' set but not used [-Wunused-but-set-variable]
> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:494:13: warning: variable 'j' set but not used [-Wunused-but-set-variable]
> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:48:38: warning: unused variable 'golden_settings_gc_9_4_3' [-Wunused-const-variable]
> drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:62: warning: wrong kernel-doc identifier on line:
> drivers/gpu/drm/i915/i915_pmu.h:41: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> drivers/gpu/drm/i915/i915_request.h:176: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> drivers/gpu/drm/i915/i915_vma.h:145: warning: expecting prototype for i915_vma_offset(). Prototype was for i915_vma_size() instead
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
> mm/gup.c:2813:14: error: implicit declaration of function 'folio_fast_pin_allowed'; did you mean 'folio_test_pinned'? [-Werror=implicit-function-declaration]
> mm/gup.c:2813:7: error: call to undeclared function 'folio_fast_pin_allowed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]

The folio_fast_pin_allowed() declaration should be fixed in v9 of the series that introduced it [1].

[1]:https://lore.kernel.org/all/cover.1683235180.git.lstoakes@gmail.com/

> phy-mtk-hdmi-mt8195.c:(.text+0x186): undefined reference to `__floatundidf'
> riscv64-linux-ld: phy-mtk-hdmi-mt8195.c:(.text+0x198): undefined reference to `__ltdf2'
> riscv64-linux-ld: phy-mtk-hdmi-mt8195.c:(.text+0x1b8): undefined reference to `__gedf2'

[snip]
