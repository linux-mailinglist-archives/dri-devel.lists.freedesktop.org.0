Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1088CAD41EC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 20:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BF410E07A;
	Tue, 10 Jun 2025 18:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Q+QvoysF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B874010E07A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 18:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749580083; x=1750184883; i=deller@gmx.de;
 bh=LG+t6XbOYUSC9kRQjj8+FfJgf+7rxGiVE/x7Pcp8yfE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Q+QvoysF00gu8MuZuh3wMZaUVtuzi26IG3EzX2taF2URORBz4bVjCDJthvyhY4CS
 vyabfSgd5nT5UdqqK+AinSe+7iFqkSbzAbElD++dvDQYwYNC3suJ2JKQx3tc22fC/
 1XoPR7544WYqjNwSfeXelaEyIntDgG0G+8Rmhbpl5/1EjhhBKe2e5dRSvwQCEfk5w
 5J2Uvffp1/E7Xam+HEeg3c9DbSVWaAgYH/MBr3OSXCFDTvcFWJtsStR9qTtpeI2fc
 38pqFGvtDOpr0CkgFmBpw6o/JwCGpALYuU+50M2D12m9bcwh9kTVviGuVbf7CuOUR
 05m3DsikQB1UheNCPA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwfai-1ujSAL2Sd8-00veHc; Tue, 10
 Jun 2025 20:28:03 +0200
Message-ID: <d2271211-8ceb-4bf2-b82d-9efec26fecb5@gmx.de>
Date: Tue, 10 Jun 2025 22:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] fbdev/omap: Include <linux/export.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-8-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250610105948.384540-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4gIYYfkiHIQdYVl17ekre2jZfl4FqTS4ohHF3CVI4JLxVWCALB/
 Q1OcdEAsC2hGgm8ORa031iF4rz8esbEFx0N1AwNTUqomsfDlgxsv7j3r5dSgunhYnFKdui2
 XPy1PCsCKvQrPdDBH/ieZ2sOxLkOSQbz9g/nODzGXdpWFAcDVGJMqdrPZpHwy/sSVYSeTg1
 F/vVZCtHinrA3mVZPeaVA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nMi7Gt2Ddmo=;qwHL9GhFkkqrw2EpI2e8NL1E5EX
 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
 IKmyggUeKGTaXF9btFNok00cX
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

On 6/10/25 12:56, Thomas Zimmermann wrote:
> Fix the compile-time warnings
>=20
>    drivers/video/fbdev/omap/lcd_dma.c: warning: EXPORT_SYMBOL() is used,=
 but #include <linux/export.h> is missing
>    drivers/video/fbdev/omap/lcdc.c: warning: EXPORT_SYMBOL() is used, bu=
t #include <linux/export.h> is missing
>    drivers/video/fbdev/omap/omapfb_main.c: warning: EXPORT_SYMBOL() is u=
sed, but #include <linux/export.h> is missing
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/omap/lcd_dma.c     | 1 +
>   drivers/video/fbdev/omap/lcdc.c        | 2 ++
>   drivers/video/fbdev/omap/omapfb_main.c | 2 ++
>   3 files changed, 5 insertions(+)

Reviewed-by: Helge Deller <deller@gmx.de>
