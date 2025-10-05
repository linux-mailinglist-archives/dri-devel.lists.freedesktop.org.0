Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA4ABB9CBD
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 21:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B9110E079;
	Sun,  5 Oct 2025 19:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="fiiHV27q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C39810E079
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 19:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759693906; x=1760298706; i=deller@gmx.de;
 bh=nt5tkux+e+yUs8Sl0cKCutBI53eY5AUY8ghPdaW2iMA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=fiiHV27qaeaS4g5h2l4DtxTrpMzmu/LXpvLrTK/0fFEYnBvpyUb7UtzFvtQ3+b6r
 ukTwSXkW4SfkTYT+pORYLuryW31Z6ynvu/AQR0UnfcnDsWGId3oFiscj2zUAq8uzg
 dqO6guhi1C+8hgOR3tGj8YtsgKxb9mz6ij9qIOmRA3mNerbifw9DnvZvOl/Sz4qUd
 jfcVtvGhN4c3r5s0gjn2qEFUjsbk8RUQcTARHFNYPrCWQsDmyqXYVXe0Tq5YQ/Vy2
 ui2ausOperkYr4b/80y1GyjxTabcr0+Hi38XKLLcoms+rijSow78eZi9SR4pO187A
 4BOc/d4nhJxop1IdTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.59]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJmGP-1uqIKx349Z-00Kh2t; Sun, 05
 Oct 2025 21:51:46 +0200
Message-ID: <8909158b-5175-43f6-981e-da3228e0821b@gmx.de>
Date: Sun, 5 Oct 2025 21:51:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
To: Javier Garcia <rampxxxx@gmail.com>, u.kleine-koenig@baylibre.com,
 tzimmermann@suse.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
References: <20251005173812.1169436-1-rampxxxx@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251005173812.1169436-1-rampxxxx@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6VxOeFFnIMUyMl3dAR5gAJg2y/9clbdMIP8kILB9BLNEgZoYrZP
 vm3J9tAnLgOrGIskPUdckFRcVbM3RY+m+d9DwAgGy+kr5M6zrolk1UhOAR8AwdmQJXpdLPz
 KnJ7Z5T6wauglxB879NpRZ6+c5TJiZf2rADuGcV4Q8dbZSadxjPLM+2uxL6ITyFNNhzjHez
 EimYNou3dyyy1noa0NF4Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KP5IyvZabq0=;IGSf9Y9gwk4esKworazr/+NqPLO
 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
 S71H94/EDizCED3R2IUnYDJz8g=
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

On 10/5/25 19:38, Javier Garcia wrote:
> This patch wraps the relevant code blocks with #ifdef CONFIG_FB_DEVICE,
> allowing the driver to be built and used even if CONFIG_FB_DEVICE is not=
 selected.
>=20
> The sysfs only give access to show some controller and cursor registers =
so
> it's not needed to allow driver works correctly.
>=20
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
>   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

applied.

Thanks!
Helge
