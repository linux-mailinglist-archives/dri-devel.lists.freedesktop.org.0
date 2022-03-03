Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF04CB913
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825E410EF3C;
	Thu,  3 Mar 2022 08:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BC610E411;
 Thu,  3 Mar 2022 07:27:22 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id q11so3741042pln.11;
 Wed, 02 Mar 2022 23:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=;
 b=FXSRJXcZ2cyaSSh+RFzgN891/0EsPjQQYnYlHyt7Q6au+u55Yhw9CQjtuc/Xh+IxeA
 jmfOE8xDuyw6aNjCCweSWK23ooxkZ+FDp1vmELSXGe87/BlE9lQAJ5VCHRxCoJXheQ6e
 z0ZjBk6ntNVuChDJjKVkipnrg4PFzEOabNhKEpFBHr+LTEWxBydNvmRMp4x1CJuZdUwr
 yIPtetuwCR4pZCzLE6nNdjkyjeKTi+kDUarqoW7jVGs3qBeY6IJUgMC1jfObzr57dlqg
 9D3LdaczFYPoymDULVGPmDhvRiVgHdjXQ/LS1xahv5fAEYKipZZ05ntIAVBo2UMKI5ki
 Sw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=;
 b=deYoYYzC79aylWHFUCH0cT6ZYT8gNeiq7hdGSdx36j9rXjArS+kM9LtFDm93Uq2Od9
 XQpKO2zEMtkC5uCmYA80Af21yydxtdQZQk9cdxMBIWYBr7VIFmt6DXURctDddY3Bgpdl
 NfL6hloQTAQ0EtLNxkhJZGZD+HNsOTHsLch8cC3VKKX4G14em8m2IOhPOrTSTrG5UiqA
 JzV9HPS/K8SWz/vApH0zz96qT/wOUY102ADUYICdV1vUPG4nkLR3vErQjUgDgW2u6mNW
 yvRh1yUzYkqsCqu0dQ8Ox8BG+HnB7um6u6X6MmfkPgU/c/uDO88ux8SUjPjqqHM7w4sb
 cVMQ==
X-Gm-Message-State: AOAM532rUtGk9VRkMLiIKgxfL1HQrIeHqoumg9RvstE7yhbISpJBLlzZ
 W1wZc006TmAD7wSlSRG2zug=
X-Google-Smtp-Source: ABdhPJxXZq8uo59Ohm7FMpyCTbKfTT1earKguyYxXh9VkI02LjxK1/LHoatHqlibGa3Ordge+YwobQ==
X-Received: by 2002:a17:902:9687:b0:151:7b31:9a57 with SMTP id
 n7-20020a170902968700b001517b319a57mr13723244plp.146.1646292442145; 
 Wed, 02 Mar 2022 23:27:22 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 nu18-20020a17090b1b1200b001bbef4d9049sm1302089pjb.23.2022.03.02.23.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 23:27:21 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: david.laight@aculab.com
Subject: RE: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Date: Thu,  3 Mar 2022 15:26:57 +0800
Message-Id: <20220303072657.11124-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
References: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:33:09 +0000
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, gustavo@embeddedor.com,
 linux-iio@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org, c.giuffrida@vu.nl,
 amd-gfx@lists.freedesktop.org, torvalds@linux-foundation.org,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, h.j.bos@vu.nl, jgg@ziepe.ca,
 intel-wired-lan@lists.osuosl.org, nouveau@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, dan.carpenter@oracle.com,
 linux-media@vger.kernel.org, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 bjohannesmeyer@gmail.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 jakobkoschel@gmail.com, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-sgx@vger.kernel.org, nathan@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 xiam0nd.tong@gmail.com, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, christian.koenig@amd.com, rppt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Mar 2022 04:58:23 +0000, David Laight wrote:
> on 3 Mar 2022 10:27:29 +0800, Xiaomeng Tong wrote:
> > The problem is the mis-use of iterator outside the loop on exit, and
> > the iterator will be the HEAD's container_of pointer which pointers
> > to a type-confused struct. Sidenote: The *mis-use* here refers to
> > mistakely access to other members of the struct, instead of the
> > list_head member which acutally is the valid HEAD.
>
> The problem is that the HEAD's container_of pointer should never
> be calculated at all.
> This is what is fundamentally broken about the current definition.

Yes, the rule is "the HEAD's container_of pointer should never be
calculated at all outside the loop", but how do you make sure everyone
follows this rule?
Everyone makes mistakes, but we can eliminate them all from the beginning
with the help of compiler which can catch such use-after-loop things.

> > IOW, you would dereference a (NULL + offset_of_member) address here.
>
>Where?

In the case where a developer do not follows the above rule, and mistakely
access a non-list-head member of the HEAD's container_of pointer outside
the loop. For example:
    struct req{
      int a;
      struct list_head h;
    }
    struct req *r;
    list_for_each_entry(r, HEAD, h) {
      if (r->a == 0x10)
        break;
    }
    // the developer made a mistake: he didn't take this situation into
    // account where all entries in the list are *r->a != 0x10*, and now
    // the r is the HEAD's container_of pointer. 
    r->a = 0x20;
Thus the "r->a = 0x20" would dereference a (NULL + offset_of_member)
address here.

> > Please remind me if i missed something, thanks.
> >
> > Can you share your "alternative definitions" details? thanks!
>
> The loop should probably use as extra variable that points
> to the 'list node' in the next structure.
> Something like:
> 	for (xxx *iter = head->next;
> 		iter == &head ? ((item = NULL),0) : ((item = list_item(iter),1));
> 		iter = item->member->next) {
> 	   ...
> With a bit of casting you can use 'item' to hold 'iter'.

you still can not make sure everyone follows this rule: 
"do not use iterator outside the loop" without the help of compiler,
because item is declared outside the loop.

BTW, to avoid ambiguity，the "alternative definitions" here i asked is
something from you in this context:
"OTOH there may be alternative definitions that can be used to get
the compiler (or other compiler-like tools) to detect broken code.
Even if the definition can't possibly generate a working kerrnel."

> > 
> > > OTOH there may be alternative definitions that can be used to get
> > > the compiler (or other compiler-like tools) to detect broken code.
> > > Even if the definition can't possibly generate a working kerrnel.
> > 
> > The "list_for_each_entry_inside(pos, type, head, member)" way makes
> > the iterator invisiable outside the loop, and would be catched by
> > compiler if use-after-loop things happened.

> It is also a compete PITA for anything doing a search.

You mean it would be a burden on search? can you show me some examples?

Or you mean it is too long the list_for_each_entry_inside* string to live
in one single line, and should spilt into two line? If it is the case, there
are 2 way to mitigate it.
1. pass a shorter t as struct type to the macro
2. after all list_for_each_entry macros be replaced with
list_for_each_entry_inside, remove the list_for_each_entry implementations
and rename all list_for_each_entry_inside use back to the origin
list_for_each_entry in a single patch.

For me, it is acceptable and not a such big problem.

--
Xiaomeng Tong
