Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E536658FD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 11:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D480E10E53F;
	Wed, 11 Jan 2023 10:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F328210E53F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 10:27:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 947A6B81B82
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 10:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3B0C433EF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673432825;
 bh=h8TxIxPqDFkhpYbcLfoV6BQoG0WhTrglcCMN9K0uJt8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N6AM/R958N4u18XHrq8UNFqyP70G0+gFwMjnQ7yqMsG47nguqfl6pW+209xvjJbjo
 rbyiV1w6ouyXKlZ7pR08EkBzODxgmNUTobWEUTrURUNmsiM/RuXCO9kxLqze0HyhcR
 S6C/niQFotI+kRCFg/uXnEq6zKAWOBRw0nS0DWmyZjAkNvygext7RU932qc4NbjrQS
 KV0HgZHWYoLzmXVOUeoidM1prvbzJLc7G6Y56qtqNpZx4XmtMUCyuFD3A2CAvUgequ
 zGm3mij0lsMIAscKAhWH2v20gJAspQzMm0kSukOEDurAvSSWc71hsGMCkJQLn4kfXu
 IsWN6cuZdIQww==
Received: by mail-lf1-f53.google.com with SMTP id cf42so22838113lfb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 02:27:05 -0800 (PST)
X-Gm-Message-State: AFqh2ko1F6Im1DzIDjyc+ggoW/Zmm14QAlVpnVk1yIOhX4b5S4zAMDo9
 jYlRXFI/nHGEwnyWATwB84tsD8+VkMODCXvOfHM=
X-Google-Smtp-Source: AMrXdXsLArq0Wo9nCQp1TG2fDBNEKyKeOcVuKtJtKzZgvOKKPRl44qz6sy8RasrBp5p6S+z6L6lslWMdW/csV0WAiDQ=
X-Received: by 2002:a05:6512:15a3:b0:4bc:bdf5:f163 with SMTP id
 bp35-20020a05651215a300b004bcbdf5f163mr3731265lfb.583.1673432823315; Wed, 11
 Jan 2023 02:27:03 -0800 (PST)
MIME-Version: 1.0
References: <63bc16ce.IBWX7dhtPEB7dLIq%lkp@intel.com>
 <CAMj1kXGAf7ikEU5jLoik0xrOde0xBg0yJkOo5=PtEtNXoUxMXA@mail.gmail.com>
In-Reply-To: <CAMj1kXGAf7ikEU5jLoik0xrOde0xBg0yJkOo5=PtEtNXoUxMXA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 11 Jan 2023 11:26:52 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH1GHmhc=SZDRFV2GOpncnn1rmbr8AZhiS8iDc6u+1ATQ@mail.gmail.com>
Message-ID: <CAMj1kXH1GHmhc=SZDRFV2GOpncnn1rmbr8AZhiS8iDc6u+1ATQ@mail.gmail.com>
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

On Mon, 9 Jan 2023 at 15:38, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 9 Jan 2023 at 14:31, kernel test robot <lkp@intel.com> wrote:
> >
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > branch HEAD: 543b9b2fe10b2e12b8d773af65314d322f91e479  Add linux-next specific files for 20230109
> >
> > Error/Warning: (recently discovered and may have been fixed)
> >
> > aarch64-linux-ld: ID map text too big or misaligned
>
> This is caused by linker veneers ('stubs') that are emitted into the
> ID map text section:
>
>  *(.idmap.text)
>  .idmap.text    0xffffffc018c04000       0x38 arch/arm64/kernel/hyp-stub.o
>  .idmap.text    0xffffffc018c04038       0x28 arch/arm64/kernel/sleep.o
>                 0xffffffc018c04038                cpu_resume
>  .idmap.text    0xffffffc018c04060       0x38 arch/arm64/kernel/cpu-reset.o
>                 0xffffffc018c04060                cpu_soft_restart
>  .idmap.text    0xffffffc018c04098      0x468 arch/arm64/kernel/head.o
>                 0xffffffc018c04098                init_kernel_el
>                 0xffffffc018c04290                secondary_holding_pen
>                 0xffffffc018c042c8                secondary_entry
>                 0xffffffc018c043c4                __enable_mmu
>                 0xffffffc018c0440c                __cpu_secondary_check52bitva
>  .idmap.text    0xffffffc018c04500      0x3c4 arch/arm64/mm/proc.o
>                 0xffffffc018c04500                cpu_do_resume
>                 0xffffffc018c045a8                idmap_cpu_replace_ttbr1
>                 0xffffffc018c045d4                idmap_kpti_install_ng_mappings
>                 0xffffffc018c047bc                __cpu_setup
>  *fill*         0xffffffc018c048c4        0x4
>  .idmap.text.stub
>                 0xffffffc018c048c8     0xf7c8 linker stubs
>                 0xffffffc018c1c8c8                __idmap_text_end = .
>
> It seems unlikely that the entire .idmap.text.stub section is
> dedicated to veneers for code in .idmap.text, and the linker probably
> dumps them here because the next output section is non-executable.
>


I bisected this to

commit 5e5ff73c2e5863f93fc5fd78d178cd8f2af12464
Author: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Date:   Mon Oct 17 20:04:50 2022 +0530

    asm-generic/io: Add _RET_IP_ to MMIO trace for more accurate debug info

which seems entirely unrelated, but looks like it may be causing the
number of direct calls (and therefore the number of trampolines) to
increase, causing the ID map to blow up like it does.
