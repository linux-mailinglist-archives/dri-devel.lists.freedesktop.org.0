Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5EA53B0E3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 03:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED4310E15B;
	Thu,  2 Jun 2022 01:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC96B10E1E7
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 01:08:33 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id rs12so6989937ejb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 18:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AMLk7uMNCtOe4gy9/LZgkLZRBX0ALCzfWfzDBXHnFo8=;
 b=OYbmFRcqjOukBt1QgTghY6i5XSE1P4Lt88ABmn7yr1figRBOYiE95+mswItMYHSdNG
 lviOuM27J5QIIeBwiLSJpAbPnwuY91jc54iyDcuCVAnICvUgcOifKGuJEsuhq8aGrj2A
 h1gTJ/7WWYaX/+zmQRNAu0O5nZCrZo4IJc/ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AMLk7uMNCtOe4gy9/LZgkLZRBX0ALCzfWfzDBXHnFo8=;
 b=0o7xVr8/mO8SbvsfNt9nvop+5UAq5nC/hf5RfkvsVqSnmYXFU9xsVEdiW1ZPboSBmd
 uLS3FmzSZiLQaJ028OGGP2SPc5Z9fOq38QIo8iHn6Dx1uyhR8JtGOqRoQ69usCZFQNcz
 REeFSjRkeYu/asAMBcXQx0USaFXHta1UUdqEBtzMEe0qze0wUjc/ojem7jRHq2BOx6fx
 /S+8m5hH+p94MxbYF5VaaQRzV8lagpviOyMDBqpksAabzEg9sV/b7IQt4xbBjwnS3fjb
 iAC+eRy1ta509lAcCec2OaTm0WmDqqi3s8erTHiSc90VwLUDRwqTlFuYOD8Siyayd5Vy
 Jc6Q==
X-Gm-Message-State: AOAM531YI1X6NmpiZRtLJQ7yXnoaqAMBy1vevJFvy6aeiDhxFFBwX2yk
 Si1JXw79WWFHRb1jdudQgA1LUB/B+gt6nSqk
X-Google-Smtp-Source: ABdhPJzUmnJ+eN02wXnc5YwaechYFrJQ7zT9ZtInFFjVGz450pECtBfJ6Gai0G67ZS8hdPCu/ULeAw==
X-Received: by 2002:a17:907:1b1a:b0:703:a290:98f1 with SMTP id
 mp26-20020a1709071b1a00b00703a29098f1mr2039251ejc.418.1654132112095; 
 Wed, 01 Jun 2022 18:08:32 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 w2-20020a056402268200b0042ddd08d5f8sm1870607edd.2.2022.06.01.18.08.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 18:08:30 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso1966036wmr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 18:08:29 -0700 (PDT)
X-Received: by 2002:a7b:cb91:0:b0:397:3225:244 with SMTP id
 m17-20020a7bcb91000000b0039732250244mr30980346wmi.68.1654132109585; Wed, 01
 Jun 2022 18:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
 <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
 <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
 <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr>
In-Reply-To: <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Jun 2022 18:08:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
Message-ID: <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Keisuke Nishimura <keisuke.nishimura@inria.fr>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, 
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Ayush Sawal <ayush.sawal@chelsio.com>, 
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Rohit Maheshwari <rohitm@chelsio.com>
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

On Wed, Jun 1, 2022 at 3:28 PM Keisuke Nishimura
<keisuke.nishimura@inria.fr> wrote:
>
>
> I found 13 definitions of packed structure that contains:
>  > - spinlock_t
>  > - atomic_t
>  > - dma_addr_t
>  > - phys_addr_t
>  > - size_t
>  > - struct mutex
>  > - struct device
>
> - raw_spinlock_t

Ok, so I don't think dma_addr_t/phys_addr_t/size_t are problematic,
they are just regular integers.

And 'struct device' is problematic only as it then contains any of the
atomic types (which it does)

> security/tomoyo/common.h: atomic_t in tomoyo_shared_acl_head
> drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls.h: spinlock_t in key_map
> arch/s390/include/asm/kvm_host.h: atomic_t in kvm_s390_sie_block

So these do look problematic.

I'm not actually clear on why tomoyo_shared_acl_head would be packed.
That makes no sense to me.

Same goes for key_map, it's not clear what the reason for that
__packed is, and it's clearly bogus. It might work, almost by mistake,
but it's wrong to try to pack that spinlock_t.

The s390 kvm use actually looks fine: the structure is packed, but
it's also aligned, and the spin-lock is at the beginning, so the
"packing" part is about the other members, not the first one.

The two that look wrong look like they will probably work anyway
(they'll presumably be effectively word-aligned, and that's sufficient
for spinlocks in practice).

But let's cc the tomoyo and chelsio people.

                 Linus
