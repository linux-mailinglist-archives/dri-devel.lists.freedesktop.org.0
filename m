Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E6EA134AE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCCE10E8D8;
	Thu, 16 Jan 2025 08:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B38NlQ3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D090710E86B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:46:52 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53e384d00f4so64227e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736992011; x=1737596811; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8PoeOsoXnkcQ1O7xfrGNP7/yyYzidTgWWnK8gVG9bI=;
 b=B38NlQ3zk0Ph7xf+UpHpXQy/uMyL2/CUr1yWe79EFSWU3UoGusdo5OIcQ30mmdhEd7
 lINo3Il/cv6GVKTKdtIGM2iLApcguZxMUsqVfSetvwb+gNwardbJaZNSSPUGpHezJYnJ
 QYtmIKDRcObnw7vC0xtjMZCmAbqsg03H492h7kHq1e9WVieawyPWZKYkSI8MCIUw6pZq
 x49RrZMQCrpwOwuWweLgaL6PcK/TSlVPoNalR5LxVyUNNianB/orrnDD0h+vujvNLKAU
 M1B7qWk+6sk3v7ZNqnBtUx4N3XVlxY05OEBt/S1qsBUIMiFCiP/2BsJmLgRd7JvHDZZK
 EOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736992011; x=1737596811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X8PoeOsoXnkcQ1O7xfrGNP7/yyYzidTgWWnK8gVG9bI=;
 b=Ko64+ID2DsDHPXgYXNnnju5sEy1TwA9o8SqSVKfli71YVbyOYgTdqSgaZ8ToTdYSbn
 kyIvTkxzMhQBnx+yCUMKW8eQTtzysaJHHF+/5Nu8l1//xdRIhwFPa+JTwHsixjP8t5RN
 +ft7rszGe84S5+gco1qHpf80b6eCwpA4NKgKFWzU8RObOrN02kkdC4UIZCsLUzuFpyTU
 UXp5SujsnddNkO5EwxRnGoI/rDu1m7acuXrOkQmbHaltvBhcAjB8zd4owMXFBE58ePab
 C2D2dLT4/Flio1/3B2HE1WW2wm4HeovEvnztyha6JjWHAyHTwcA3Lq2YwOU+UAJfeHYt
 fznA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKIgQKNLKJhBCbb8VWwuU1XVIauK7hFUcTwc6HWMR3BQ32+B9bGFmouSH3/vWQINOAnIviIV6oCpE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuEWO0UTqAfC3B+JJKy5QL0NvM6Vh+gdFs03kCVJm4DMfJjtRM
 X9Y9hMEWWBgCpwks2lxp1Prs5Tr16Ph1TqIK5jgkZXmWjeBOTrbp5Mtz1m59viWcY7x6CI2un4B
 FIuz90Bi1SJJgQddExAW96/SVIbdckQ==
X-Gm-Gg: ASbGncut73oE+LW8pApG+PxFrL5XoiTBVPnbr5zFqT0Z+Wqp8nAiriAAHp+wQZaagw/
 B53JPgb5rOCEfULELsuWRs8Mp+ERHPOA9331cxbc=
X-Google-Smtp-Source: AGHT+IHnNLWeeqpj57WGvJejzaCSapO0If0R+l2iOTzev4nPKnL5beC7psjCRroxUhM+vE5Xk3YyT2D3LaljS2es8/s=
X-Received: by 2002:a2e:a54b:0:b0:2ff:c3d2:b0a0 with SMTP id
 38308e7fff4ca-305f45591d2mr37589001fa.5.1736992010959; Wed, 15 Jan 2025
 17:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20250115061805.3495048-1-zhaoyang.huang@unisoc.com>
 <bfd19718-e7dc-45c4-8f86-34205e733916@amd.com>
In-Reply-To: <bfd19718-e7dc-45c4-8f86-34205e733916@amd.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Thu, 16 Jan 2025 09:46:39 +0800
X-Gm-Features: AbW1kvZMIDWkIbbFDGe-0Zd-xPI-J2w2DbOKu3HU-iaXKLtJhuUsl6jRHJUc_ds
Message-ID: <CAGWkznFPpU6uHQbgYrdwwWO8L-ct5nJoYnmdfqewxgNtMu2Qqg@mail.gmail.com>
Subject: Re: [RFC PATCH] driver: dma-buf: use vmf_insert_page for
 cma_heap_vm_fault
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>, 
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 16 Jan 2025 08:07:59 +0000
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

On Wed, Jan 15, 2025 at 7:49=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 15.01.25 um 07:18 schrieb zhaoyang.huang:
> > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >
> > When using dma-buf as memory pool for VMM. The vmf_insert_pfn will
> > apply PTE_SPECIAL on pte which have vm_normal_page report bad_pte and
> > return NULL. This commit would like to suggest to replace
> > vmf_insert_pfn by vmf_insert_page.
>
> Setting PTE_SPECIAL is completely intentional here to prevent
> get_user_pages() from working on DMA-buf mappings.
ok. May I ask the reason?
>
> So absolutely clear NAK to this patch here.
>
> What exactly are you trying to do?
I would like to have pkvm have guest kernel be faulted of its second
stage page fault(ARM64's memory virtualization method) on dma-buf
which use pin_user_pages.
>
> Regards,
> Christian.
>
> >
> > [  103.402787] kvm [5276]: gfn(ipa)=3D0x80000 hva=3D0x7d4a400000 write_=
fault=3D0
> > [  103.403822] BUG: Bad page map in process crosvm_vcpu0  pte:168000140=
000f43 pmd:8000000c1ca0003
> > [  103.405144] addr:0000007d4a400000 vm_flags:040400fb anon_vma:0000000=
000000000 mapping:ffffff8085163df0 index:0
> > [  103.406536] file:dmabuf fault:cma_heap_vm_fault [cma_heap] mmap:dma_=
buf_mmap_internal read_folio:0x0
> > [  103.407877] CPU: 3 PID: 5276 Comm: crosvm_vcpu0 Tainted: G        W =
 OE      6.6.46-android15-8-g8bab72b63c20-dirty-4k #1 1e474a12dac4553a3ebba=
3a911f3b744176a5d2d
> > [  103.409818] Hardware name: Unisoc UMS9632-base Board (DT)
> > [  103.410613] Call trace:
> > [  103.411038] dump_backtrace+0xf4/0x140
> > [  103.411641] show_stack+0x20/0x30
> > [  103.412184] dump_stack_lvl+0x60/0x84
> > [  103.412766] dump_stack+0x18/0x24
> > [  103.413304] print_bad_pte+0x1b8/0x1cc
> > [  103.413909] vm_normal_page+0xc8/0xd0
> > [  103.414491] follow_page_pte+0xb0/0x304
> > [  103.415096] follow_page_mask+0x108/0x240
> > [  103.415721] __get_user_pages+0x168/0x4ac
> > [  103.416342] __gup_longterm_locked+0x15c/0x864
> > [  103.417023] pin_user_pages+0x70/0xcc
> > [  103.417609] pkvm_mem_abort+0xf8/0x5c0
> > [  103.418207] kvm_handle_guest_abort+0x3e0/0x3e4
> > [  103.418906] handle_exit+0xac/0x33c
> > [  103.419472] kvm_arch_vcpu_ioctl_run+0x48c/0x8d8
> > [  103.420176] kvm_vcpu_ioctl+0x504/0x5bc
> > [  103.420785] __arm64_sys_ioctl+0xb0/0xec
> > [  103.421401] invoke_syscall+0x60/0x11c
> > [  103.422000] el0_svc_common+0xb4/0xe8
> > [  103.422590] do_el0_svc+0x24/0x30
> > [  103.423131] el0_svc+0x3c/0x70
> > [  103.423640] el0t_64_sync_handler+0x68/0xbc
> > [  103.424288] el0t_64_sync+0x1a8/0x1ac
> >
> > Signed-off-by: Xiwei Wang <xiwei.wang1@unisoc.com>
> > Signed-off-by: Aijun Sun <aijun.sun@unisoc.com>
> > Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> > ---
> >   drivers/dma-buf/heaps/cma_heap.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/c=
ma_heap.c
> > index c384004b918e..b301fb63f16b 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -168,7 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault=
 *vmf)
> >       if (vmf->pgoff > buffer->pagecount)
> >               return VM_FAULT_SIGBUS;
> >
> > -     return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->page=
s[vmf->pgoff]));
> > +     return vmf_insert_page(vma, vmf->address, buffer->pages[vmf->pgof=
f]);
> >   }
> >
> >   static const struct vm_operations_struct dma_heap_vm_ops =3D {
>
