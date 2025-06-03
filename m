Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF30ACCAF2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 18:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F274C8989E;
	Tue,  3 Jun 2025 16:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="TJ9BwzEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9798890B2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1748966918; x=1749571718; i=deller@gmx.de;
 bh=3SQgvJRGqK6JyqWPMBgnv5wYYk3CPIhUSCf0kymitMM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=TJ9BwzEFwrnKruR12vPUYQUIwJlOFjy1CCqpp3JYvJXRziV4x8wGo4HzfJSWhjxI
 jc15OCy5FsAreBFn3r8WesNdQVg5oazEsXocJyH9gJNLovvRQhHxMCtUV3DkgvPiJ
 HGr3He0EZw4nUDN+uA3g1heI50cZmJgaCSRa+4T8/f1vHnTiFOtyU7ksvXob25VQy
 UOwUgBU8c6hGKIQAx9C8axd9dqUiFiMhchEEfzTRD10r91MZPvEO7ZZJlk4Bqv6OO
 8t/TaNsM/vwagpP5mgf/mu3ydarNvdDlDjk+C9CzaQB+XP0sbr/u7gOFl93NhBbt+
 cFDZCtCpdNip3oUwIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjjCF-1uk1Rl1Xbv-00n5u5; Tue, 03
 Jun 2025 18:08:38 +0200
Message-ID: <d0422fc6-2da2-4224-91ef-3aa06fb20773@gmx.de>
Date: Tue, 3 Jun 2025 18:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] video: Make CONFIG_FIRMWARE_EDID generally available
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250602075537.137759-1-tzimmermann@suse.de>
 <20250602075537.137759-2-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250602075537.137759-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6WFepPZUVi/m0yNuA09GktDcMkk0xT/cXPr7iy2zQhCX/JWRWFi
 BTyfjUPL5O/FFjnTMBV6kaQ6hydGfjRk5UXFwgWtVosLCm3Tqc4lGsShXKVXBUC2SjrGzBo
 sKMfj6fNnbcn3jQTS/7M9unhPpd/NBXRQYYgwjMxVIzd7U9QWqG6onLaGDK9bZqGCKlj1YQ
 BPGUl0syz/hMAPYj5wbEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:i2rqAMFSTOs=;i5CrLkFemDC8v68TGg4FvuPZYf5
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

On 6/2/25 09:51, Thomas Zimmermann wrote:
> DRM drivers such as efidrm and vesadrm can export firmware EDID
> data to userspace. Make the related option CONFIG_FIRMWARE_EDID
> available without CONFIG_FB. Make it depend on X86, which is
> currently the only architecture providing EDID information.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/Kconfig            | 18 +++++++++++++++++-
>   drivers/video/fbdev/core/Kconfig | 15 ---------------
>   drivers/video/fbdev/core/fbmon.c |  3 +--
>   3 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Helge Deller <deller@gmx.de>

