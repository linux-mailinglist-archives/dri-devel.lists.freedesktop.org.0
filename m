Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF75AD7D92
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 23:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044D910E200;
	Thu, 12 Jun 2025 21:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="SILPwaIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A7D10E200
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 21:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749763741; x=1750368541; i=deller@gmx.de;
 bh=D3wAlL3rClJArNKY7dwL3CJWFcnP+41qAJyHrkbbqDQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SILPwaIfd3SONcXuEFl4umcRfjO8BwuQAXDgW4cdmgCMcBKR8ykG/WBLvm0PQtWF
 cusMk1o8plfizVj6jJ8rMaNI6R4DvqWxCIzncTqLqKH61uxpXeWouU9cGrbWrNqnw
 cyS6fcioUbkXhnd3z7PVeYs5a99/+Z1UozZwR49irl3OL1+5BDwz8V32wmcvcw5Xl
 biXpuGH3VxsKF+lrE0/kvFDfJB2uGFniYv+NXQB1mH0yBxoYZM8qFoIxtNTunGyLV
 7hwpgWGBFLnNXpTVPQc0xNDidnN8yLzizYHk9vQt8dfFYH3W1Eki+rMqlGEdIq2zp
 0yDu8l3adsRTWi8lag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUowb-1uGipJ3SjZ-00JBdA; Thu, 12
 Jun 2025 23:29:00 +0200
Message-ID: <cafbf5b3-6e14-4343-812b-689bf84eb83c@gmx.de>
Date: Thu, 12 Jun 2025 23:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] fbdev/viafb: Do not include <linux/export.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250612081738.197826-1-tzimmermann@suse.de>
 <20250612081738.197826-15-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250612081738.197826-15-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pv7peLBNHzfUMM5Zc1ggDGmOG3hd7308yQXDTizf7zN9D5R4sc7
 Z/fsKbK4Noen30yTYPWnEFfdfgD9u0PqGeh9UiCZJCErvkvKGIJanFjxspuMJHODKZAaJgb
 w+cdlZF2tnPn8Nn/dtG7MzRH0QU95FKEpWUvarnVr0PUUdV1Y45FefOoDi6S4Spsz73Ak0T
 ZlRxiYCmlGXBI/sFSYuJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p+d26shIIPo=;FTMI4hxKW+8GOTPZxZ/dD6edQct
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

On 6/12/25 10:16, Thomas Zimmermann wrote:
> Fix the compile-time warning
>=20
>    drivers/video/fbdev/via/via-gpio.c: warning: EXPORT_SYMBOL() is not u=
sed, but #include <linux/export.h> is present
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/via/via-gpio.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Helge Deller <deller@gmx.de>
