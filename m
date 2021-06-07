Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005EB39DE2A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 15:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3636E507;
	Mon,  7 Jun 2021 13:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87C56E507
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 13:58:01 +0000 (UTC)
Received: from mail-ot1-f41.google.com ([209.85.210.41]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MPGBR-1m0W5a30tZ-00Pard for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun
 2021 15:57:59 +0200
Received: by mail-ot1-f41.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so15699110otu.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 06:57:59 -0700 (PDT)
X-Gm-Message-State: AOAM532Jg0aF0oyE2KGPIPlbyxY4iOdNBNLH/Fd1DJYfH2MTUYr/Z0yq
 G6hVlXE3Sqj7NwqRyvM3Egf/v6P8vugI5IFF7o4=
X-Google-Smtp-Source: ABdhPJydOeOtoQqFpT/fRufwtUr7e1TKinNi8QFaK44JSPLHq7mHKgvKVkKJVcpFiP70MOJfu3Lh+UrlwI7IH0InKDo=
X-Received: by 2002:a9d:6acb:: with SMTP id m11mr10400045otq.246.1623074278174; 
 Mon, 07 Jun 2021 06:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210527124356.22367-1-will@kernel.org>
 <CGME20210602132541eucas1p17127696041c26c00d1d2f50bef9cfaf0@eucas1p1.samsung.com>
 <4d0c8318-bad8-2be7-e292-fc8f70c198de@samsung.com>
 <20210602135123.GD12753@C02TD0UTHF1T.local>
 <130ce34f-460a-0046-f722-00144f2d5502@samsung.com>
 <20210604100114.GC64162@C02TD0UTHF1T.local>
 <0d10411d-49fe-fbca-0479-e2983af16aa8@samsung.com>
 <20210607120118.GC97489@C02TD0UTHF1T.local>
 <20210607130859.GD97489@C02TD0UTHF1T.local>
 <20210607133953.GB7330@willie-the-truck>
In-Reply-To: <20210607133953.GB7330@willie-the-truck>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Jun 2021 15:57:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0sj0qtC0VpQv4+Ah-C8jyZaGgfqsx326mChuW+e5mvrQ@mail.gmail.com>
Message-ID: <CAK8P3a0sj0qtC0VpQv4+Ah-C8jyZaGgfqsx326mChuW+e5mvrQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xScahNPjcRIljAPJeTsxjzdF4OvPdhRsihaKvFBPpTQuyiuxzWl
 gIPXtnPfWu6NQ44j3+LvHLf+/vJQucvRFDMz76RN4N8AEkWfsMC+zsuq4tECd90D6NOcM69
 5mAZOrtgHya8Vq2TG5Ys20yGfcpAvyk301KhHczT+kclppUhyowyPFZGx0yt5oiPXXFUoZr
 WR09iftzj3C+vbJKz+SEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ywYq+XlEfCY=:Joodvx0RB5xI2T6zvYA5sQ
 ZiGvePEeFib+XVUu3DjkqiG1zxn8v0JMZfptmKNlYsLYiBffospGtvjzKQ4q5pXuuzTL5th1H
 DPwnLQmb6sHRg4/dEt4vl0Eoy5McT+hucS9G7HSJIrQCz8wBeHGguMhiH1Ygwc9cXPyKWYp1l
 qRx5J5Zyk2wJyBYalfg6a0R+HfB+wA979UxBqPWvlA+AgWc5YxDDhxfWSHCQs2Q0pQ96yMAJ5
 XiiXb/W/n/QhHgwj3/f/f3OFYs+HW+768V+RNRCZ12lACqyZcITa8mqifNOutjaHy5b7VLljv
 KfAtikce91pM1Ksy5OMF9ziozDX6X5WMIGbubR6XZtxPZ5kxSyO1YVdJ70CqX7l2Qj3iVvlTx
 74NefXy9ocgDtg9Ex9J7tkbT8ISq0oQknghgI7nIbUcQc/G1qgLSCoqd5FMQ4OAkuv23wytlj
 yLPwnOcuo5L8UX33hiJFuArBW9k4NA8EQWdw6a/Edchxxiw/pTSgJmsCVLTk7TWNFb7fFPaoY
 C9/LwZPpzbFf67vUFyAfFB/QbEwpCWW8w+/tMT1VeEkkaS3p6Yc34ArP+p9DqiOXGIELlu1dD
 uwOhu+MTx1WLN64+wnByD1egJQlBC+iuuWykUWpBd+TgJcwshNd0e9AJUXrmkFZZNqjoQvWbV
 SySA=
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
Cc: Mark Rutland <mark.rutland@arm.com>, emma@anholt.net,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-team@android.com,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 7, 2021 at 3:39 PM Will Deacon <will@kernel.org> wrote:
>
> [Adding VC4 folks -- please see the KASAN splat below!]
>
> Background here is that reducing ARCH_DMA_MINALIGN to 64 on arm64 (queued in
> -next) is causing vc4 to hang on Rpi3b due to a probable driver bug.

The great news for the patch that caused it is that this has nothing to
do with DMA alignment.

> On Mon, Jun 07, 2021 at 02:08:59PM +0100, Mark Rutland wrote:
> > On Mon, Jun 07, 2021 at 01:01:18PM +0100, Mark Rutland wrote:
> > > On Mon, Jun 07, 2021 at 11:58:32AM +0200, Marek Szyprowski wrote:

> > [    3.728042] BUG: KASAN: slab-out-of-bounds in vc4_atomic_commit_tail+0x1cc/0x910
> > [    3.728123] Read of size 8 at addr ffff000007360440 by task kworker/u8:0/7

This is offset 0x40 into struct vc4_hvs_state, which is the
'pending_commit' pointer
for the array index 4, i.e. one after the end of the structure.

> > [    3.728495]  kasan_report+0x1dc/0x240
> > [    3.728529]  __asan_load8+0x98/0xd4
> > [    3.728565]  vc4_atomic_commit_tail+0x1cc/0x910

It seems to be this loop:

        for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
                struct vc4_crtc_state *vc4_crtc_state =
                        to_vc4_crtc_state(old_crtc_state);
                unsigned int channel = vc4_crtc_state->assigned_channel;
                int ret;

                if (channel == VC4_HVS_CHANNEL_DISABLED)
                        continue;

                if (!old_hvs_state->fifo_state[channel].in_use)
                        continue;

                ret =
drm_crtc_commit_wait(old_hvs_state->fifo_state[i].pending_commit);
                if (ret)
                        drm_err(dev, "Timed out waiting for commit\n");
        }

I notice that it checks index 'fifos_state[channel].in_use', but then
uses a different index 'i' for looking at the 'pending_commit' field
beyond the end of the array.

This code was introduced by Maxime Ripard in commit 9ec03d7f1ed3
 ("drm/vc4: kms: Wait on previous FIFO users before a commit").

    Arnd
