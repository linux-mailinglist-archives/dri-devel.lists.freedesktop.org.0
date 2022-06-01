Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE7353B4A1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1EF112A81;
	Thu,  2 Jun 2022 07:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Wed, 01 Jun 2022 22:35:39 UTC
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F5210FCA4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 22:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AkDE+5ZI+IK3BHuS7N7ViWTtDYvZB4rptzcmh8eb1n8=;
 b=ciO8DIRhw86/ODL5KXlAbuCIsWdUVr65CDTHtk2tDoP9AoVAH7qNtfnF
 KU+mwi2rgZ6Cf64GqsKh3HgBkBJMfS2VQbVTEcVT4U7O3d2xR7VeMOmDI
 2ZKs9XO4RK+y56oP0BgJpCEo8Qpz091wtL7m22O6JPphXLTN2WA5VzsxQ Y=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,269,1647298800"; d="scan'208";a="39079992"
Received: from eth-east-parth2-46-193-69-7.wb.wifirst.net (HELO
 [10.188.210.33]) ([46.193.69.7])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 00:28:28 +0200
Message-ID: <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr>
Date: Thu, 2 Jun 2022 07:28:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
 <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
 <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
In-Reply-To: <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 02 Jun 2022 07:54:05 +0000
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 Viresh Kumar <vireshk@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, David Airlie <airlied@linux.ie>,
 SoC Team <soc@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022/06/01 1:41, Linus Torvalds wrote:
> On Tue, May 31, 2022 at 1:04 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> As an experiment: what kind of results would we get when looking
>> for packed structures and unions that contain any of these:
> 

> I don't think we have that. Not only because it would already cause
> breakage, but simply because the kinds of structures that people pack
> aren't generally the kind that contain these kinds of things.
> 
> That said, you might have a struct that is packed, but that
> intentionally aligns parts of itself, so it *could* be valid.
> 
> But it would probably not be a bad idea to check that packed
> structures/unions don't have atomic types or locks in them. I _think_
> we're all good, but who knows..


I am Julia's student at INRIA and I heard from her that there is an 
opportunity to use Coccinelle to find specific types in packed struct or
enum.

I found 13 definitions of packed structure that contains:
 > - spinlock_t
 > - atomic_t
 > - dma_addr_t
 > - phys_addr_t
 > - size_t

 > - struct mutex
 > - struct device

- raw_spinlock_t

== Results ==
security/tomoyo/common.h: atomic_t in tomoyo_shared_acl_head
drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls.h: spinlock_t in 
key_map
include/linux/ti-emif-sram.h: phys_addr_t in ti_emif_pm_data
drivers/scsi/wd719x.h: dma_addr_t in wd719x_scb
drivers/net/wireless/intel/ipw2x00/ipw2200.h: dma_addr_t in clx2_queue
drivers/infiniband/hw/irdma/osdep.h: dma_addr_t in irdma_dma_mem
drivers/infiniband/core/mad_priv.h: size_t in ib_mad_private
drivers/crypto/qat/qat_common/qat_asym_algs.c:
- dma_addr_t in qat_rsa_ctx
- dma_addr_t in qat_dh_ctx
drivers/atm/idt77252.h: dma_addr_t in idt77252_skb_prv
arch/s390/include/asm/kvm_host.h: atomic_t in kvm_s390_sie_block

drivers/net/wireless/ath/ath10k/core.h: dma_addr_t in ath10k_skb_cb
drivers/net/wireless/ath/ath11k/core.h: dma_addr_t in ath10k_skb_cb
drivers/crypto/ccp/ccp-dev.h: dma_addr_t in ccp_dma_info

The last 3 structures have a dma_adddr_t member defined as the first 
member variable. Most of the others also seems valid.

I used this SmPL script to find them:

@e1@
type T;
identifier i;
position p;
attribute name __packed;
@@
  T@p  {
   ...
(
   atomic_t i;
|
   raw_spinlock_t i;
|
   struct mutex i;
|
   spinlock_t i;
|
   dma_addr_t i;
|
   phys_addr_t i;
|
   size_t i;
|
  struct device i;
)
   ...
  }
  __packed;

@e2@
type T;
identifier i;
position p;
@@
  T@p  {
   ...
(
   atomic_t i;
|
   raw_spinlock_t i;
|
   struct mutex i;
|
   spinlock_t i;
|
   dma_addr_t i;
|
   phys_addr_t i;
|
   size_t i;
|
  struct device i;
)
   ...
  }
    __attribute__((
(
  pack
|
  __pack__
)
  ,... ));

@script:python@
ps <<e1.p;
@@
for p in ps:
   print p.file, p.line
@script:python@
ps <<e2.p;
@@
for p in ps:
   print p.file, p.line


Keisuke
