Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DAD82A54F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 01:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CE510E06B;
	Thu, 11 Jan 2024 00:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0140510E06B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 00:46:07 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d9b1589a75so2376347b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 16:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1704933967; x=1705538767;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gueNhZrbsNiJzCN2gb4yLrjECQBWf6cwwXnoTcfXIT4=;
 b=ScQa2nTJKMEMkGmKJ7w2yZt6/xVo2WNPEBGcfv65bGmg/bMJj3hXiL67ZQjAuTjT0v
 t2UOT4zOWClyKIesPC8SSitsi685+HjOxkqh80XoaAIFBHEyipLW7n43rYAui/ulmN+y
 9P8f6lnrHAk6jZmWbec12DqxmU44TC3t4SI8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704933967; x=1705538767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gueNhZrbsNiJzCN2gb4yLrjECQBWf6cwwXnoTcfXIT4=;
 b=N6PuO3VSAqtX27SAJlpS/GTYPY5OkFkcy5mTEpc7U4cnrasTWHyPC1Ncgt7v7GviVP
 KKhpRWsqQB484VIuWMksNXj6GFdna9SIicUCV6Ha7ZilAb8hN/cb/hJ9TZ5FKA4AmebS
 oTh6htv5k4o7sQwCPpbcj1UwUPTRhwQpmmsLjk16RGi5Ni6dqEYHACcPtbiu9Xl8Wf8t
 gA65QSd1wGSwqmteB+19bX/DcH0c9FCJAjc7OFeOwB90aPn4tGVnDHv0ddwcNh3exMCT
 Om9fJzRfrY70TAkG1UxJfBxjUg2MIPdeGFp24HUxY68Yazf8/3/hHXzU2Neb7DXPwMzK
 AxrA==
X-Gm-Message-State: AOJu0YzXF5fp2hyAl/2+WAFNv8vMZpB8P0A5Go6HQGNvc7YxCAoGhVWz
 MPtKBXgmTbVXNdnkLoWFsM5sdI3BGKPl4vBYBxG8pFeAaSC5
X-Google-Smtp-Source: AGHT+IGkiZ1hknB2+0UC/gxIH8jrVZxWAA/1vUWxP929828CA6Qm4M9e8Oxn46aJ8qOxkFFVf4GTPg==
X-Received: by 2002:aa7:90d3:0:b0:6d9:a64c:c5d1 with SMTP id
 k19-20020aa790d3000000b006d9a64cc5d1mr504196pfk.26.1704933967538; 
 Wed, 10 Jan 2024 16:46:07 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 y2-20020a62b502000000b006dac91d6da5sm4071344pfe.68.2024.01.10.16.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 16:46:06 -0800 (PST)
Date: Wed, 10 Jan 2024 16:46:06 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 0/3] Update LLVM Phabricator and Bugzilla links
Message-ID: <202401101645.ED161519BA@keescook>
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
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
Cc: linux-efi@vger.kernel.org, kvm@vger.kernel.org, llvm@lists.linux.dev,
 ast@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, mykolal@fb.com,
 daniel@iogearbox.net, andrii@kernel.org, amd-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org, bridge@lists.linux.dev,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, patches@lists.linux.dev,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 03:16:28PM -0700, Nathan Chancellor wrote:
> This series updates all instances of LLVM Phabricator and Bugzilla links
> to point to GitHub commits directly and LLVM's Bugzilla to GitHub issue
> shortlinks respectively.
> 
> I split up the Phabricator patch into BPF selftests and the rest of the
> kernel in case the BPF folks want to take it separately from the rest of
> the series, there are obviously no dependency issues in that case. The
> Bugzilla change was mechanical enough and should have no conflicts.
> 
> I am aiming this at Andrew and CC'ing other lists, in case maintainers
> want to chime in, but I think this is pretty uncontroversial (famous
> last words...).
> 
> ---
> Nathan Chancellor (3):
>       selftests/bpf: Update LLVM Phabricator links
>       arch and include: Update LLVM Phabricator links
>       treewide: Update LLVM Bugzilla links
> 
>  arch/arm64/Kconfig                                 |  4 +--
>  arch/powerpc/Makefile                              |  4 +--
>  arch/powerpc/kvm/book3s_hv_nested.c                |  2 +-
>  arch/riscv/Kconfig                                 |  2 +-
>  arch/riscv/include/asm/ftrace.h                    |  2 +-
>  arch/s390/include/asm/ftrace.h                     |  2 +-
>  arch/x86/power/Makefile                            |  2 +-
>  crypto/blake2b_generic.c                           |  2 +-
>  drivers/firmware/efi/libstub/Makefile              |  2 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  2 +-
>  drivers/media/test-drivers/vicodec/codec-fwht.c    |  2 +-
>  drivers/regulator/Kconfig                          |  2 +-
>  include/asm-generic/vmlinux.lds.h                  |  2 +-
>  include/linux/compiler-clang.h                     |  2 +-
>  lib/Kconfig.kasan                                  |  2 +-
>  lib/raid6/Makefile                                 |  2 +-
>  lib/stackinit_kunit.c                              |  2 +-
>  mm/slab_common.c                                   |  2 +-
>  net/bridge/br_multicast.c                          |  2 +-
>  security/Kconfig                                   |  2 +-
>  tools/testing/selftests/bpf/README.rst             | 32 +++++++++++-----------
>  tools/testing/selftests/bpf/prog_tests/xdpwall.c   |  2 +-
>  .../selftests/bpf/progs/test_core_reloc_type_id.c  |  2 +-
>  23 files changed, 40 insertions(+), 40 deletions(-)
> ---
> base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> change-id: 20240109-update-llvm-links-d03f9d649e1e
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 

Excellent! Thanks for doing this. I spot checked a handful I was
familiar with and everything looks good to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
