Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B4E99F609
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B4610E103;
	Tue, 15 Oct 2024 18:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="MC+ozjnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5089E10E103
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1729018269; x=1729623069; i=deller@gmx.de;
 bh=9jaQnEjymFY3oxOxnvMn1q08An0kyg3ycazGUlE2w4Y=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MC+ozjnYCodS1EJ0Jv4hpnQM7VCHIB5SXkONEUhNHuAOnVlfFVPVIIs7VLPy2PtZ
 o9vBYGYylfNDj/5P23G9x7Pu6dolQAsb8h8utLkcwMEHaagBj4JO3uSPxoUiN6xDt
 OAGKl09queEsN/xtOniVe9DxH8dtbOLPGKOi+A+oNce44ed8bgTmDW450AVXVEy0O
 lgF8ouPYMEZxLpCkg+ItHAnPABawQtjB30yb2RSIYwELsgQ7IymtseNP24ZAz30KS
 kuw7SNpseL1dXniyaKJ3y9Sn6CKLHqo5qnkn941bWO/GzjI/Si9vOCDT2vqNb3vst
 w1MSBMBmZxSHwmtPSQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7i8O-1u46wB0nD8-00zMgp; Tue, 15
 Oct 2024 20:51:09 +0200
Message-ID: <cc055b74-f424-45a9-a4ae-d8881dd985a0@gmx.de>
Date: Tue, 15 Oct 2024 20:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/9] fbdev: omapfb: use new of_graph functions
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <87ldyyrqv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <87ldyyrqv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EdVI0VSYeL3LEOEJi+jbSkms2cqQAE1hN0i+/9ZcCXcEGnmNG0n
 gj0Dp1Xb0FLCEB1Pmha36fyLEIHmAUNJHUnVUOXn/XYf+iwVVsIDWvqJuByBOfLs91Bk1se
 o7WoInpOefGGHfmvdjloogyUuWi7FcB2xNXLcOOFyyNv1Z5QQzIG9OHBEqHjDEG0N40k5yZ
 2gzcyvmMsR2CUL+wYCTfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zPouFLlPz0M=;gnMXag3WKBn0uZpYW3G8t8VVrpZ
 afPUrS5i7P6iHoOeiY3ybTUI1T9MIwvF4UP+R3whEtLqyxOfU/o8tGlZyLpnfWDEz5KONemre
 IAENelYowMsZgNUbMnEEK0IjNezITScNNToEpsfISMUl3xd0XuNTSzCaODbbE9TKGHesY62NE
 J6vxs5qX2NQyciPX1SAMJxDJNiy9lk3SjiZY0CE9LL6+IYrkD2V20vF5Inr684DjOTlkS2S40
 z/XcBtCaIk6krvXzWoNLjAfB2A1qNbX0kQ6oOrj17nAyaLtjbaSMRaFP+LL/cPI8WcREpJP1B
 QkTPCdBmlRzMhXYls+moSajojWqQCjYk4G1jOkOvkft/QdIxKLwwOUc3KcOkgvu6mpV3TX9PG
 syqwv4QFGASh0gEJk3i09GnQ+x9Sc4jgYjJ9WaSHjLT+HmE/RgNF9ZBAM1dXi+V187aK9Jbec
 Pvd/8jAOx26pFr0qbpEA3HNx9FteXYf4s8ngCLSPyq6HqYWhbMHdzSSTmyvXX7Jr59Dmc+jQh
 JNyEouHIE4zTWJLxZ8kRXw4hwWcgBGdyl40hZchV1i7NcjY8jz90g9jnECs4H/HtlCfc6uNEe
 MeXUZT2Yn7yLdqp+5/7a6wp0ypiLcPhadiQ6Bv9Ka6C6X7bphQ4gMWIZ7iYsSw4ZOmBE3PaAH
 F2CF18RMFVSrmRI/8qEfoQKXJ7d5v87K5AiBPaAb+fymm5RxHTInVDHm6Fg1/JdwzD2gBl8qm
 e67vOz3BEHpTKxuDIdollUZSzQPjCdAJ3hWXPYRhGO9abUozXJRMLToc65DOOIJFw85lh4lIC
 C0cnFw0CMCHBNbG8fF+Z92OQ==
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

On 10/9/24 03:45, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Helge Deller <deller@gmx.de>

> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  3 +-
>   drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 66 -------------------
>   drivers/video/fbdev/omap2/omapfb/dss/dss.c    | 20 +++---
>   drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  3 +-
>   include/video/omapfb_dss.h                    |  8 ---
>   5 files changed, 13 insertions(+), 87 deletions(-)

