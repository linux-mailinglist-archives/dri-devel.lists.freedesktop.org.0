Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E543BAE58C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 20:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57A510E188;
	Tue, 30 Sep 2025 18:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Y+ne/4yR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 310 seconds by postgrey-1.36 at gabe;
 Tue, 30 Sep 2025 18:48:58 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3D910E188
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 18:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759258136; x=1759862936; i=deller@gmx.de;
 bh=z+MD5MfXq8YCBZXDVMD/omJDpL7SFMOeLEcnFA3o/Eo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Y+ne/4yRLGk8ZqZdWnfrNf4dhtj2hQZurBBQjlNIfrlA0fKGXkV5JbhSUAOtIpTU
 ir40VRF7ZoID0eP8yGk00R8CbKcmWeFMTnfJcxykbXfQbW2/CQqJBycCdB4sSfeos
 u8ZEm455okKTPL0F6dJWMoVYXmIxh1gmjHCFpMzWptiLx6kIlzW/+UfaX27TD2rVI
 n/66uPmFSEXlDmFG+keXiEQyPMH+7iQrrpoyTHItpQIGl8QPWMga/vX32RpNPkZvP
 EQpi6gtPZhBxvYytdJbYCgjijYIKVxrsyRJAudt/LXH0ErTYUStQzDJxrUhfZPGgD
 IMA8OvCZvE19WsAHyQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.4]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0FxV-1u8PpY3X9z-00sUpK; Tue, 30
 Sep 2025 20:43:35 +0200
Message-ID: <3c974071-0ba7-4d24-aa8c-4a1d77c4150b@gmx.de>
Date: Tue, 30 Sep 2025 20:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: mb862xxfb: Use int type to store negative error
 codes
To: Qianfeng Rong <rongqianfeng@vivo.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250830124703.73732-1-rongqianfeng@vivo.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250830124703.73732-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OV+N4b2HkAWrzAUCVnQn+ZUWnLPqoW1btOQ4grWIw8JQ2SrfBey
 qzpomnnbmpMCqwS/E/4uhieUniBda9tNivAzkqKgEiCzqzk4nJtjcYJXfeC0e+fV9nQtOZ2
 WmvPg2G1MX4Zr5YqG01Tkd9rvTiiIcniVncp86DwYitwWh7HBV4ZliFiKLPZhhwpGtrnxZG
 AkGFo32OAjHipz4axoE/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZnESLUM3mHI=;FD0TgZ4MBh3j1/riIYi/AIbdnlQ
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

On 8/30/25 14:47, Qianfeng Rong wrote:
> Change the 'ret' variable in of_platform_mb862xx_probe() from unsigned l=
ong
> to int, as it needs to store either negative error codes or zero.
>=20
> Storing the negative error codes in unsigned type, doesn't cause an issu=
e
> at runtime but can be confusing. Additionally, assigning negative error
> codes to unsigned type may trigger a GCC warning when the -Wsign-convers=
ion
> flag is enabled.
>=20
> No effect on runtime.
>=20
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.

Thanks!
Helge
