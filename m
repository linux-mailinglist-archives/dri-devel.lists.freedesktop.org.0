Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A260C16E0D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6614010E1B7;
	Tue, 28 Oct 2025 21:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="YIcOmOI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6CE10E1B7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761685777; x=1762290577; i=deller@gmx.de;
 bh=mXzZuh8Ci4Sad5DM6kYYcgYdoUQ4ayIhpY8364PZVCg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=YIcOmOI6Zb9m8ezJyhWol0Rf346JQQPJNERa+f2SCkb73BHFHA3vNfzDdR89dzYE
 peHh0VHll1/HbqNvLdgOZ9gGpvvz7/Z7NeNtC3JmvfeCfzxZJOvr8Ck0tAVawuggF
 btg9EBZnbNYiogkqk5lWXSTI2R38I+CtXYAxFqb03suze/teUUvGnRleRqP0zkJgZ
 D3L2oBqVdWYXGjM1ecVeYzDXcMAIRb6h+lsm0IGUGP24w3buXKgOUopmaEs+ha0Rz
 mGVLuY0/hk8031jM1N9cBExQcmsfn/CcWmGcuvxXfOXp1Tsm6MGU3r2UAkd+tcdAB
 YYpKUXBwZOTuEtjAXA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.74]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEV3C-1vTlG721He-00HRzw; Tue, 28
 Oct 2025 22:09:37 +0100
Message-ID: <f9998d60-e532-48ae-8e03-d867cc0ec847@gmx.de>
Date: Tue, 28 Oct 2025 22:09:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: vga16fb: Request memory region.
To: Javier Garcia <rampxxxx@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
References: <6c565f4c-ef05-45f2-9a82-cbba4a11cc07@gmx.de>
 <20251028191615.2765711-1-rampxxxx@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251028191615.2765711-1-rampxxxx@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MJTFjlkzfgvaBkOudtcHyp+eqTG2LBy0ruUXH0Wg0AxclVf7HD3
 2s8wqvFmfrE3dbrEabHVui7NpLfRu2+OuEYgxa6w4sqbjqkaoEFnfX2EVtIdqu/rGd6irAn
 q5uHvKcop6tjedRKoTboj9DOY45wQ+BLVYr5OOUYdavCtfvxVssy6sNxBwWviNtZA/E3iej
 qqAa5ztQvxaSdEY3MNJjA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TgEknmSZpU4=;AZPWzMVxuRUec7rg/4BRPCkWLYR
 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
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

On 10/28/25 20:16, Javier Garcia wrote:
> This patch reserve and release VGA memory region.
>=20
> This align with Documentation/drm/todo.rst
> "Request memory regions in all fbdev drivers"
>=20
> I've tested with 32bits kernel and qemu.
>=20
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
> v1 -> v2:
>        * Add release in vga16fb_remove , thanks Helge Deller.
>        * v1 https://lore.kernel.org/lkml/20251016171845.1397153-1-rampxx=
xx@gmail.com/
>=20
>   drivers/video/fbdev/vga16fb.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

applied.

Thanks!
Helge
