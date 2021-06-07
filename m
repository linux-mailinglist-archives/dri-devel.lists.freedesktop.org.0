Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E3339E16C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 18:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B876E8F9;
	Mon,  7 Jun 2021 16:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Mon, 07 Jun 2021 16:03:59 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD236E8F9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 16:03:59 +0000 (UTC)
Received: from mail-oi1-f175.google.com ([209.85.167.175]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M9nEJ-1ll4zp3vkb-005sdN for <dri-devel@lists.freedesktop.org>; Mon, 07
 Jun 2021 17:51:17 +0200
Received: by mail-oi1-f175.google.com with SMTP id x196so18115073oif.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 08:51:16 -0700 (PDT)
X-Gm-Message-State: AOAM533ElLua8uSKqRzEuX4WKtcq2qd87733TEFZUtFGhbb1gQEAKjTv
 clsm4BEUli8k9ET8DKug5j+W6dnBH2HAwTObNA0=
X-Google-Smtp-Source: ABdhPJyU28MUc419KzJydOMfdzznPlQh8ffCqalDqllLyg0iivlfhCzoNCNXDd3vaH1TKdPw9LvQge+oMq5Zr+WsFPI=
X-Received: by 2002:a05:6808:6c8:: with SMTP id
 m8mr12752528oih.11.1623081075778; 
 Mon, 07 Jun 2021 08:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210602132541eucas1p17127696041c26c00d1d2f50bef9cfaf0@eucas1p1.samsung.com>
 <4d0c8318-bad8-2be7-e292-fc8f70c198de@samsung.com>
 <20210602135123.GD12753@C02TD0UTHF1T.local>
 <130ce34f-460a-0046-f722-00144f2d5502@samsung.com>
 <20210604100114.GC64162@C02TD0UTHF1T.local>
 <0d10411d-49fe-fbca-0479-e2983af16aa8@samsung.com>
 <20210607120118.GC97489@C02TD0UTHF1T.local>
 <20210607130859.GD97489@C02TD0UTHF1T.local>
 <20210607133953.GB7330@willie-the-truck>
 <CAK8P3a0sj0qtC0VpQv4+Ah-C8jyZaGgfqsx326mChuW+e5mvrQ@mail.gmail.com>
 <20210607151740.moncryl5zv3ahq4s@gilmour>
In-Reply-To: <20210607151740.moncryl5zv3ahq4s@gilmour>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Jun 2021 17:50:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3h=gOBFB6dRpg93jC7iZOo0f+FxYe0=QsY03fadVPq7Q@mail.gmail.com>
Message-ID: <CAK8P3a3h=gOBFB6dRpg93jC7iZOo0f+FxYe0=QsY03fadVPq7Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bMipKT5hHVF/IE8Mc26vSh/TTHF4T+9C/FP9kGZVBcTOlBQTnWB
 0odxtPZcb09NTsf6AvCgB2tzWqq0la9pqkJfoxMgY04MDlMyV4wFYzQCumjJBEBbQBsxnYe
 n/K4DvBgMgq0pM/aEqgBZ/nQTWkqeOW1xCA4X3z4Hq67SeNhGEF9LRGCGqbKErqp28LtsNp
 1He2s1NPezzXuDr28OTpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UyIPmub/z3A=:CWVo3P2IoU/hl8274uzkpA
 jZOELICWAcjwhmRHqW5INYVRcBG6AD+Xv6H5/s4f/AZDyDfVUdIJVVKmdFRKg1t7r6tehsbX5
 BfZpVOVkhhvqxO+g/UWb7POgv7t0FsMjWgwiZ32Bo0zafWxHXUzAob41Do7GnfRhalUlnZaf/
 QkoxgUAlYb6neaVW227mn7DAWzP+sGcr845X+9cZ6IeRCOgOPST5QSjSw0J2hgssthvS2hCst
 cjBU3+Dk+cc5L6b+gsau+YhaZDnbtC/bd31wQmC409JUrPmvDYrWvvFc8u5gKcNgeSWy0y14Q
 yb/XIMfQ7Ln5sNXQqAmW85QXq2PGPioVpy532ZKG7QgDFfTqkU0zqKDYXhPf6b6IyS+2OJ90M
 Ar2QD0/zJOGWAbwI2j5BH1BwjgZZPPyyuDgKaoIEn7T0Bd6FAyYg8Xv/anbTTj2IibbqhqEpe
 WjlmBhXcMux0lbyaNdx7iQZ3d5kKXiSwhl9vVLC7gRZB7OuQyAGi0UTucwyFYcKESFOJx9ey1
 BGFxOtrAHLTVfZTvvZkJjc=
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
 Will Deacon <will@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Catalin Marinas <catalin.marinas@arm.com>, kernel-team@android.com,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 7, 2021 at 5:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Mon, Jun 07, 2021 at 03:57:41PM +0200, Arnd Bergmann wrote:
> > On Mon, Jun 7, 2021 at 3:39 PM Will Deacon <will@kernel.org> wrote:
> > > On Mon, Jun 07, 2021 at 02:08:59PM +0100, Mark Rutland wrote:
> > > > On Mon, Jun 07, 2021 at 01:01:18PM +0100, Mark Rutland wrote:
> > > > > On Mon, Jun 07, 2021 at 11:58:32AM +0200, Marek Szyprowski wrote:
> > I notice that it checks index 'fifos_state[channel].in_use', but then
> > uses a different index 'i' for looking at the 'pending_commit' field
> > beyond the end of the array.
> >
> > This code was introduced by Maxime Ripard in commit 9ec03d7f1ed3
> >  ("drm/vc4: kms: Wait on previous FIFO users before a commit").
>
> Awesome, I tried to find out that bug a few weeks ago but couldn't
> reproduce the KASAN spat. You're right, it should be channel here
> instead of i. Since you did the whole work, do you want to send the
> patch?

Marek and Mark did most of the work finding the problem, I just looked
in the right place a few times (and a bit in the wrong place). I'd suggest
you send that patch with the corresponding Reported-by/Analyzed-by/
Tested-by tags.

        Arnd
