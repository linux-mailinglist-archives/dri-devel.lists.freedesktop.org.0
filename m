Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EDD53B46F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D6310E1BB;
	Thu,  2 Jun 2022 07:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A9F10E1BB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 07:39:17 +0000 (UTC)
Received: from mail-yb1-f180.google.com ([209.85.219.180]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N9MlG-1nkcmV0wKq-015GnD for <dri-devel@lists.freedesktop.org>; Thu, 02
 Jun 2022 09:39:15 +0200
Received: by mail-yb1-f180.google.com with SMTP id p13so6939404ybm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 00:39:14 -0700 (PDT)
X-Gm-Message-State: AOAM531xjxaKxgjsSqAL1kzBCj75V4t7CKut3IYA/0Yv6tW8TMPPHg9e
 rWhSqu43jbiezdoKHFxULqavOVIIqJzTIDrCh8o=
X-Google-Smtp-Source: ABdhPJxVfhxEh2sV1U0/oHXedOW7Ij9SWgaqXnw+k1hmmKvq9A8gu2wmdTH5eNlILVHHm3z97S0Z2Co5/rXDXyJX6t0=
X-Received: by 2002:a25:1209:0:b0:65d:63f9:e10a with SMTP id
 9-20020a251209000000b0065d63f9e10amr3777324ybs.480.1654155553742; Thu, 02 Jun
 2022 00:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
 <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
 <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
 <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr>
 <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
In-Reply-To: <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Jun 2022 09:38:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1m80u+eVnoSJ-APihjNQ1se9=FG+E6tKBb-hRJx5FAVg@mail.gmail.com>
Message-ID: <CAK8P3a1m80u+eVnoSJ-APihjNQ1se9=FG+E6tKBb-hRJx5FAVg@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:USHdp1G/HTKRqrUuJ17Ed1jtH/95+cEiuz9Erh/7Dbc9r63Ucab
 PCVW0BiZ/OkgMUdrjAJdUbZ3qzwjmgnUS3b39eA9aSDAQgHEfFlLFPH/aDRKgrzMciwV/d7
 9u4wdIBym3Bx2IsD8VvyEWNuOrTAZ+J1cKTQocjkSZRgV687W0gisHD3WbzCr3ad/DZHbDv
 TKhJuoW6taw7wXns3I4tw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e6Q+e+5i+co=:cEl0u7hTreP6V5tw5zo4C/
 wpLjMnZhTYJO1KfHF7ZcfzaGUGeql+DVmuEjEziu85IrRxJhz5nL7tRSNKkTrIi2ZGp4L29FM
 4xBKVqoXAv7omf9av5pbZZoT6zAvxaA1Te1SO1NHxjZsNQahRlHE4xQ7gxUcObAUdR77Rc2kp
 eE5IQ6z6gCvR533adiHg745t5y2//AN9zZZ71mKPKuquYIrx+yPop+rGdeQSOs0JFO+4TVkHT
 iPCa2rxjDNQgMbFeXemNZEmcmpIcP5uoCXFnoK8AvYwF5m1nTOFRxS6LNCUdwZvekmqd532Ov
 KwFGwwYuR/sQJcfqOYjoeMNX4Yigh7PtPlmSjEJhrXW9TASTHGYB7rM5UA1O7AhEv/ZVSv7uy
 9ZudR825jkgli532MLigIBPdkHSy2PP7yGVP+kkPSGb4ZBit6pallNlMqxtKNJWDA2z//7B+1
 TO0j9iw7Fgd/CU3kkfiUkMXNN4FV76n+9EaF9Nf0rKV3WJm29IzQbQeJgfkDl7W/5qkCU8ZWK
 JBPkjVpxIbPuo5uiyIu8+aBk+9UwbrpU0uynPwh0j+GiPZCl+mhx1M/85aMMorKQnCeLxUX/Z
 uXt/yzwOgHjnCEcr2jBQzhAXRDnIn47UpnFTC2CgKC/MbDd/WECyFTVHfNyOVYztdCpTTSMe6
 CcxaCYCDE4QS8wCgu7tPlUO6wftkd64lQiHU7fSbxfEcNXdq86ucOssf0hUkdvzVo0GCcXow+
 FDMQAapqJ5PC0hSJ+4NnAXTPJ7CraZGJ8noNcnhxXxSLSJaeIrsy3Z5oAXfY0rgqnj68FI/J6
 IPDRvhZmqMNlLQJ++Pk0ZQGsEiuEcTD5V1GGPWZ4ElYmv5pF2xPId8ZbMMimvnWyTYr7Jhu5h
 E/pffZJfHd/5anXoDWDA==
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ayush Sawal <ayush.sawal@chelsio.com>, Kentaro Takeda <takedakn@nttdata.co.jp>,
 Keisuke Nishimura <keisuke.nishimura@inria.fr>,
 Rohit Maheshwari <rohitm@chelsio.com>, Viresh Kumar <vireshk@kernel.org>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 2, 2022 at 3:08 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Jun 1, 2022 at 3:28 PM Keisuke Nishimura
> <keisuke.nishimura@inria.fr> wrote:
> >
> >
> > I found 13 definitions of packed structure that contains:
> >  > - spinlock_t
> >  > - atomic_t
> >  > - dma_addr_t
> >  > - phys_addr_t
> >  > - size_t
> >  > - struct mutex
> >  > - struct device
> >
> > - raw_spinlock_t
>
> Ok, so I don't think dma_addr_t/phys_addr_t/size_t are problematic,
> they are just regular integers.
>
> And 'struct device' is problematic only as it then contains any of the
> atomic types (which it does)
is
I suggested this list because they are problematic for different reasons:

- any atomics are clearly broken here

- dma_addr_t/phys_addr_t are sometimes put into hardware data
  structures in coherent DMA allocations. This is broken because these
  types are variably-sized depending on the architecture, and annotating
  structures in uncached memory as __packed is also broken on
  architectures that have neither coherent DMA nor unaligned access
  (most 32-bit mips and armv5), where this will result in a series of
  expensive one-byte uncached load/store instructions.

- having any complex kernel data structure embedded in a __packed
  struct is a red flag, because there should not be a need to mark
  it packed for compatibility with either hardware or user space.
  If the structure is actually misaligned, passing a pointer for the
  embedded struct into an interface that expects an aligned pointer
  is undefined behavior in C, and gcc may decide to do something
  bad here even on architectures that can access unaligned
  pointers.

> > security/tomoyo/common.h: atomic_t in tomoyo_shared_acl_head
> > drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls.h: spinlock_t in key_map
> > arch/s390/include/asm/kvm_host.h: atomic_t in kvm_s390_sie_block
>
> So these do look problematic.
>
> I'm not actually clear on why tomoyo_shared_acl_head would be packed.
> That makes no sense to me.
>
> Same goes for key_map, it's not clear what the reason for that
> __packed is, and it's clearly bogus. It might work, almost by mistake,
> but it's wrong to try to pack that spinlock_t.
>
> The s390 kvm use actually looks fine: the structure is packed, but
> it's also aligned, and the spin-lock is at the beginning, so the
> "packing" part is about the other members, not the first one.

Right, I think the coccinelle script should nor report structures
that are both packed and aligned.

> The two that look wrong look like they will probably work anyway
> (they'll presumably be effectively word-aligned, and that's sufficient
> for spinlocks in practice).
>
> But let's cc the tomoyo and chelsio people.

I think both of them work because the structures are always
embedded inside of larger structures that have at least word
alignment. This is the thing I was looking for, and the
__packed attribute was added in error, most likely copied
from somewhere else.

Looking at the other ones:

include/linux/ti-emif-sram.h: phys_addr_t in ti_emif_pm_data

No misalignment because of the __aligned(8), but this
might go wrong if the emif firmware relies on the structure
layout to have a 32-bit phys_addr_t.

drivers/scsi/wd719x.h: dma_addr_t in wd719x_scb

This one is correct, as the structure has 64 bytes of
hardware data and a few members that are only accessed
by the kernel. There should still be an __aligned(8)
for efficiency.

drivers/net/wireless/intel/ipw2x00/ipw2200.h: dma_addr_t in clx2_queue

Al marked the incorrect __packed annotations in 2008,
see 83f7d57c37e8 ("ipw2200 annotations and fixes").
Mostly harmless but the __packed should just get removed here.

> drivers/infiniband/hw/irdma/osdep.h: dma_addr_t in irdma_dma_mem
> drivers/infiniband/core/mad_priv.h: size_t in ib_mad_private

Same here: harmless but __packed should be removed, possibly
while reordering members by size.

> drivers/crypto/qat/qat_common/qat_asym_algs.c:
> - dma_addr_t in qat_rsa_ctx
> - dma_addr_t in qat_dh_ctx

Probably harmless because the structure is __aligned(64), but I'm
completely puzzled by what the author was actually trying to
achieve here. There are also 'bool' members in the packed struct,
which is probably something we want to look for as well.

> drivers/atm/idt77252.h: dma_addr_t in idt77252_skb_prv

This is a bug on architectures with 64-bit dma_addr_t, it should
be an __le32, and the structure should be __aligned() as a DMA
descriptor.

> drivers/net/wireless/ath/ath10k/core.h: dma_addr_t in ath10k_skb_cb
> drivers/net/wireless/ath/ath11k/core.h: dma_addr_t in ath10k_skb_cb

Should almost certainly not be __packed, fixing these will
likely improve performance on mips32 routers using ath10k

> drivers/crypto/ccp/ccp-dev.h: dma_addr_t in ccp_dma_info

This looks ok, the "__packed __aligned(4)" here can save
a bit of stack space as intended.

I think that SmPL script worked great, almost every instance is
something that ought to be changed, as long as it stops reporting
those structures that are also __aligned(). I would extend it to
also report structures with 'bool', 'enum', or any pointer, but that
could give more false-positives. Maybe have a separate script
for those instances embedding atomics or spinlocks (very broken)
vs the other members (causes more harm than good or might
need alignment).

       Arnd
