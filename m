Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB37C6628AB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC00D10E05C;
	Mon,  9 Jan 2023 14:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4B310E05C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 14:38:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39ED061175
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 14:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A97EC433EF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673275110;
 bh=dOeSwMKGvRNuz4WJuRYWtXnG3/9WM48jAqD2wl4VfkQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Aj0vHOGgvle1zCfahAhr7spS9NcDdXwTm9CYuz/BwCs10p4bGGy5+i9/n734juKs+
 1P3ZyUSvpZx4yRKaa+zZX0HJuTcdOKL/G/6MPDkj+J8EoJnCSCAgnZKiy2WY/bXcbb
 GZGV4LQMzU5b53Nhr+p/KsW8x8OvEF8tN0QANWAR8tor7aiIZAe7n3f0pLlowZx/Ur
 10DktQIHm41mtvwMavyrKF+uCH4vrZqHYrrvg26gE7DQN7xhEKWb1CW82LeZ/3XYKm
 q4XxXfOhlPZFn8Txy6xAf2JVlzmTBi6qEpvQzCz4iZaVHhjbR3N5u+qtPTfE6MdF3S
 JuWl5DFRVuvEw==
Received: by mail-lf1-f44.google.com with SMTP id f34so13245343lfv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 06:38:30 -0800 (PST)
X-Gm-Message-State: AFqh2ko9sOzmvyFCwyN1e52A1I94mCxtuQxrKOcBJlnvI8v2o92JknEo
 avv93RzsjLBHSqu1BAIJZCgE/nEKqi0uRn5QmWM=
X-Google-Smtp-Source: AMrXdXubWmp42AOnDDbvW893PnJh//psRIvKXySJgdZx2yOjMVMItn35U11hxuSFGhah+kWcS/UtCIYYozqISObsYwk=
X-Received: by 2002:ac2:5e65:0:b0:4a2:740b:5b02 with SMTP id
 a5-20020ac25e65000000b004a2740b5b02mr2602735lfr.122.1673275108696; Mon, 09
 Jan 2023 06:38:28 -0800 (PST)
MIME-Version: 1.0
References: <63bc16ce.IBWX7dhtPEB7dLIq%lkp@intel.com>
In-Reply-To: <63bc16ce.IBWX7dhtPEB7dLIq%lkp@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 9 Jan 2023 15:38:17 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGAf7ikEU5jLoik0xrOde0xBg0yJkOo5=PtEtNXoUxMXA@mail.gmail.com>
Message-ID: <CAMj1kXGAf7ikEU5jLoik0xrOde0xBg0yJkOo5=PtEtNXoUxMXA@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 543b9b2fe10b2e12b8d773af65314d322f91e479
To: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 speakup@linux-speakup.org, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Jan 2023 at 14:31, kernel test robot <lkp@intel.com> wrote:
>
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 543b9b2fe10b2e12b8d773af65314d322f91e479  Add linux-next specific files for 20230109
>
> Error/Warning: (recently discovered and may have been fixed)
>
> aarch64-linux-ld: ID map text too big or misaligned

This is caused by linker veneers ('stubs') that are emitted into the
ID map text section:

 *(.idmap.text)
 .idmap.text    0xffffffc018c04000       0x38 arch/arm64/kernel/hyp-stub.o
 .idmap.text    0xffffffc018c04038       0x28 arch/arm64/kernel/sleep.o
                0xffffffc018c04038                cpu_resume
 .idmap.text    0xffffffc018c04060       0x38 arch/arm64/kernel/cpu-reset.o
                0xffffffc018c04060                cpu_soft_restart
 .idmap.text    0xffffffc018c04098      0x468 arch/arm64/kernel/head.o
                0xffffffc018c04098                init_kernel_el
                0xffffffc018c04290                secondary_holding_pen
                0xffffffc018c042c8                secondary_entry
                0xffffffc018c043c4                __enable_mmu
                0xffffffc018c0440c                __cpu_secondary_check52bitva
 .idmap.text    0xffffffc018c04500      0x3c4 arch/arm64/mm/proc.o
                0xffffffc018c04500                cpu_do_resume
                0xffffffc018c045a8                idmap_cpu_replace_ttbr1
                0xffffffc018c045d4                idmap_kpti_install_ng_mappings
                0xffffffc018c047bc                __cpu_setup
 *fill*         0xffffffc018c048c4        0x4
 .idmap.text.stub
                0xffffffc018c048c8     0xf7c8 linker stubs
                0xffffffc018c1c8c8                __idmap_text_end = .

It seems unlikely that the entire .idmap.text.stub section is
dedicated to veneers for code in .idmap.text, and the linker probably
dumps them here because the next output section is non-executable.

I have patches on the list that move the ID map out of the .text
section altogether (among other things) and this seems like a suitable
workaround for this issue as well.

https://lore.kernel.org/all/20221129161418.1968319-3-ardb@kernel.org/
