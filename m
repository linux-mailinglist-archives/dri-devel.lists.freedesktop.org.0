Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEE053B8CF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 14:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D423D10EA8F;
	Thu,  2 Jun 2022 12:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20A110EA8F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 12:11:33 +0000 (UTC)
Received: from mail-yb1-f180.google.com ([209.85.219.180]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MXHBo-1oIEWb2Ksg-00YgsC for <dri-devel@lists.freedesktop.org>; Thu, 02
 Jun 2022 14:11:31 +0200
Received: by mail-yb1-f180.google.com with SMTP id w2so7933470ybi.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 05:11:31 -0700 (PDT)
X-Gm-Message-State: AOAM531SkaVRFhx9Ya3Vq6dxLM5eX6BzSh79xItmpkoyF9JlVRQ3vo72
 buTNEodQTbbB5MtSajP0glVjAlAgt5IWRPKmtN4=
X-Google-Smtp-Source: ABdhPJxdzkEsdk/cr6/xiJljnwPhNiCbf+6LHxcrbl85hSAm1vRzepzJQWXT9pLy21Z0VxV9G2hS1yUr8gN67lDPmso=
X-Received: by 2002:a25:db8a:0:b0:65c:b04a:f612 with SMTP id
 g132-20020a25db8a000000b0065cb04af612mr4808103ybf.106.1654171890125; Thu, 02
 Jun 2022 05:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
 <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
 <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
 <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr>
 <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
 <CAK8P3a1m80u+eVnoSJ-APihjNQ1se9=FG+E6tKBb-hRJx5FAVg@mail.gmail.com>
 <74bed19a-713f-1a25-8142-cf32984beada@I-love.SAKURA.ne.jp>
In-Reply-To: <74bed19a-713f-1a25-8142-cf32984beada@I-love.SAKURA.ne.jp>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Jun 2022 14:11:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a02fpOPkXSEEd2eDoryVN2zZcRvzJ2qRceAQmCqB8ghag@mail.gmail.com>
Message-ID: <CAK8P3a02fpOPkXSEEd2eDoryVN2zZcRvzJ2qRceAQmCqB8ghag@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dbEwKl4pWnmihYgYg41TayBRKilyUtCB7zi+OU3c9KhYHEGPHFr
 q0diTw9i4ArT7cdH5mqWANmHgvfb/5vG53AgeKu015u3Eg9Y5KKI0SLJFaaMqVAjNsSuESc
 erncvCrRazEJc/4h90ifnuNtL4MB2f5i1IpZEHr7Zd0s4Kx2GaDm9hXGQEEtmfHOgwsZPjG
 WJPMpx+P22BVv9gVqrbkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZKWlkqty+m0=:sEWSlj0n9++PESWNNYtqaY
 gderFzTVWbvHizxzv81qqL5SO3aUy9h4sHw6mip4DcPYnmtGOH6/1pfLQdNaY/IBnzN/YqcAz
 pxefj9/MREH3OpFWvVeo2hSwHys62wmEQ/hOl/OzrH3930C2YjN6dTgiYeenpvtJ9gW3OW2GQ
 L0EoJ7g2NN5qvTXCgI/OgSV7lpAWulfTB2eBv6M0EkACHi+zbE8rV7t6Aju3Ukz2AwBLMO+eV
 /n88wcNxUISYWYx3LFsEVp+3Gl7CrZStC1SKaU3fq0kWj/A+o2g82FV9uwgIkzD1zg/IVZh9K
 ZD2HLubtVcTsRhqojlUd/YRQT6cD4vH1FWvV1i0khOUe7iPRa8IW6DI2WxjyHlNTG9XMmNceR
 ke/WuEVW0fw//oKum6CQ/m0Zswqtsx4E1QmcgH6qwQ7LjMhABgL6npV4Ru3N3BhfZwAcGl/n5
 Qa3kHgVNoU3R0j5hkc9GV+Ob9esLVkKOTQJybk3U8aoiN5Akp7vVecUAIQIL9OGrJ8oH6oPqj
 G5H1d5S2oL+wvcqFzNAk0dV70gXCGtwPLHKtg14gL0CfxXLnqZLIki8aw9VQwR6ht61Ut/Zgj
 yFlF1ciRXa55cnHobIE8cThIeMNZIWjE/srXTWsA06lKWU6ZvTO2kz5caDEt+59RrmWEJmaHN
 PF4BbOqOhgdOCqtCCdUsF4p735m5keXUns/7sbAXGmhlnLJzEvPgV3T/drr2CfvDm6E1yhQR3
 YMA+0kT+f/zJg3dmDTd+0nm8DwRKzTm3FLBdDz7XNpD/LABrOZwyThNkX+ElNEF0F+2iUGYeG
 USmRLP3U1dZMHuw++YWc29l6vgKh9QLaH40K74+rM7FVwBSwu3hnGM+7KN/u0ltqe0A/YdOYx
 vN9Zqnf5YtZV7IJRrX4w==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ayush Sawal <ayush.sawal@chelsio.com>, Kentaro Takeda <takedakn@nttdata.co.jp>,
 Keisuke Nishimura <keisuke.nishimura@inria.fr>,
 Rohit Maheshwari <rohitm@chelsio.com>, Viresh Kumar <vireshk@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 2, 2022 at 1:21 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2022/06/02 16:38, Arnd Bergmann wrote:
> >> But let's cc the tomoyo and chelsio people.
> >
> > I think both of them work because the structures are always
> > embedded inside of larger structures that have at least word
> > alignment. This is the thing I was looking for, and the
> > __packed attribute was added in error, most likely copied
> > from somewhere else.
>
> The __packed in "struct tomoyo_shared_acl_head" is to embed next
> naturally-aligned member of a larger struct into the bytes that
> would have been wasted if __packed is not specified. For example,
>
> struct tomoyo_shared_acl_head {
>         struct list_head list;
>         atomic_t users;
> } __packed;
>
> struct tomoyo_condition {
>         struct tomoyo_shared_acl_head head;
>         u32 size; /* Memory size allocated for this entry. */
>         (...snipped...)
> };
>
> saves 4 bytes on 64 bits build.
>
> If the next naturally-aligned member of a larger struct is larger than
> the bytes that was saved by __packed, the saved bytes will be unused.

Ok, got it. I think as gcc should still be able to always figure out the
alignment when accessing the atomic, without ever falling back
to byte access on an atomic_get() or atomic_set().

To be on the safe side, I would still either move the __packed attribute
to the 'list' member, or make the structure '__aligned(4)'.

       Arnd
