Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D056439F1B2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F966EB53;
	Tue,  8 Jun 2021 09:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1AF6EB53
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:09:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N5G5b-1lOwbN3k5F-011Ex5 for <dri-devel@lists.freedesktop.org>; Tue, 08
 Jun 2021 11:09:52 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so1368737wmq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 02:09:52 -0700 (PDT)
X-Gm-Message-State: AOAM531lTFWbjJHoACjMvUi+hDOwbj3PX5Ok+070guTS36th+gspoQ2v
 AXN/l7DVvtQpY9OwDJq3bvMvMKzVgnOxEVu+h2I=
X-Google-Smtp-Source: ABdhPJweH0NoDFNEsagQCwbebQZjm1ygLiKnMTWz5Pn2SQnkv8GB1qQnVdqz+Zsumft6G8Lt0mk26k1PBwGzVIU/TC4=
X-Received: by 2002:a7b:c849:: with SMTP id c9mr3166270wml.84.1623143392139;
 Tue, 08 Jun 2021 02:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210608085513.2069-1-mark.rutland@arm.com>
In-Reply-To: <20210608085513.2069-1-mark.rutland@arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Jun 2021 11:08:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a04_Xu+qv-Smtpnbw8iTkfWqiYP9+YE5pA_T+gsNGVVcw@mail.gmail.com>
Message-ID: <CAK8P3a04_Xu+qv-Smtpnbw8iTkfWqiYP9+YE5pA_T+gsNGVVcw@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: fix vc4_atomic_commit_tail() logic
To: Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PCMSxD6GaQgMMRxvABbPhenqg6ydzWf4/mhABPPMR4TPCKHASbM
 i/c/EhvnxCBiXpGY83p04qO9ISwMX9fUe9yuS1IurLC7NLPMMC7We+ItXL6Nu5A5lqmrvyR
 i7AtSoAMfXzB6NYDoJTzZaSS/euux5E78R1gmKmszVkKEJEmNbqFuf7BNleJkyPL4hBAE57
 xHZRoVOGjI8d6LuHjcL1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L8luogMRDp0=:bI58mtWywI8qV/+P8lgacf
 B7wUFtGqbnCanoN4bBhzt0UDr7N2+1gdSfl3GcbZUddQUdTVXUHovSDpTXRbz12qp4DKi0mZA
 YRmMG2O0LKI8Y44DTRm0n5WztgMH5p1BSGoLqeBPUkZhsPB4cxXJ27HrUB/DYNEb7+/ISpGhu
 TZuTrUE5Q75Gr19RCW8jyTw+P7UKRIzVzSlCJ8OdhWQlPi4I70PmLp0/jFyasB/jTKuaxJ10B
 t4NctCRAfRyZXRvUgZB8zNslB7qc8zY7CHtRbgPcGqmgcZ2K/x8GTj2kW0D1cKjz+8Jgz0uGl
 INVezi+HZkcmyfy0fkJaQSfa9Nfgv4gW5KVbMSt00FxaB6wD+46VRwy9IYIfl3W2pdcD+UAqL
 wnD/V7UnC7acYxkAAZCgKnJIMftKJoX23coPUxKC7V5HikglzP8BZF8XZKgBUqN8It0m9qyJh
 lyV6Mhpt2sDAjD59Klds1Vk4Bm27BVf7PBPlYFtGT6DAZWO5jZSP44CrbzmNFaCbop8Kfrmce
 LDmKxPJwX2EoXKHs4Rv7b3WxeBFrPcH4gcApT7qu0OmG0gMygi57pVThgKejgxq68nDQpjTjE
 uhHdkLNJ8NibraYKJmjRApCv8d/MbAx5KbhBBHPGR/69X/xnN9dJNXVqvC0CpS/yVf7ImxbEc
 JOXo=
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime@cerno.tech>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 8, 2021 at 10:56 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> In vc4_atomic_commit_tail() we iterate of the set of old CRTCs, and
> attempt to wait on any channels which are still in use. When we iterate
> over the CRTCs, we have:
>
> * `i` - the index of the CRTC
> * `channel` - the channel a CRTC is using
>
> When we check the channel state, we consult:
>
>   old_hvs_state->fifo_state[channel].in_use
>
> ... but when we wait for the channel, we erroneously wait on:
>
>   old_hvs_state->fifo_state[i].pending_commit
>
> ... rather than:
>
>    old_hvs_state->fifo_state[channel].pending_commit
>
> ... and this bogus access has been observed to result in boot-time hangs
> on some arm64 configurations, and can be detected using KASAN. FIx this
> by using the correct index.
>
> I've tested this on a Raspberry Pi 3 model B v1.2 with KASAN.
...
>
> Link: https://lore.kernel.org/r/4d0c8318-bad8-2be7-e292-fc8f70c198de@samsung.com
> Link: https://lore.kernel.org/linux-arm-kernel/20210607151740.moncryl5zv3ahq4s@gilmour
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Arnd Bergmann <arnd@arndb.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>
