Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC040AD7D58
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 23:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251CB10E1A7;
	Thu, 12 Jun 2025 21:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="KhTV5lWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3104110E1A7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 21:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749763368; x=1750368168; i=deller@gmx.de;
 bh=FpmYOcJtbkDpe5Zh5u4JAYQxmdIwZFosPz8awNyJh0U=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KhTV5lWSQtpBf2W6QufOsJdmhXebxWLXALF7goOHVNpB6lPSxiObwqsWW8IFjQwt
 qjDpVyocni9iA/r9Jc+9qmB0SzYl30LNoZpSJfgeEiWCVP5JFKP/BJgGhnPeVPpCs
 AO70yaan93F2ffnjg4ag8Zk/nHMja5MeUqSE8SGtQoM2HnB+3g3o2BswEOWlBK8ju
 GCWksfNLyWF7e283JQv/YumaCGDJ5cQVygWqIODfg7RIk017qzvuD1IBb1hevisAZ
 1SxeCfPMxzx2CFuEDFn4gcHYfiM0mZTzQGjYW8imqGUKsVq4Rqo4ib52jZX3aIfLC
 gyf5ZSiyMM6Z0X8Mhw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCsUC-1uYf4S1vkW-002peV; Thu, 12
 Jun 2025 23:22:48 +0200
Message-ID: <565cc873-45be-400d-a4f3-197227b24bed@gmx.de>
Date: Thu, 12 Jun 2025 23:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] fbdev/omap2: Do not include <linux/export.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250612081738.197826-1-tzimmermann@suse.de>
 <20250612081738.197826-10-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250612081738.197826-10-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:52657m/GhjwqAJe7JQufbZ2XddbabBqio4YlUEDklyjnLqifsA0
 jjJH1mYw0Kdx/2+/DhW92nsfGOd5W1TRW4vUcW0fcP9cGKeWI27t1kFPjmBV6g+LzhgppYp
 aufwx20/sweZU25jwRGQZ30cLJNMvnqDohmc8N9ED8L6f9Zxaz0lWDLPHQLXRIAXMe/xnD7
 ld5NYyja4S1p/latLrliw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HrycSnPfnaE=;5oTQ3Vsqx7pzyIOCYZq077/wTD+
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
> Fix the compile-time warnings
>=20
>    drivers/video/fbdev/omap2/omapfb/dss/dpi.c: warning: EXPORT_SYMBOL() =
is not used, but #include <linux/export.h> is present
>    drivers/video/fbdev/omap2/omapfb/dss/sdi.c: warning: EXPORT_SYMBOL() =
is not used, but #include <linux/export.h> is present
>    drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c: warning: EXPORT_SYMB=
OL() is not used, but #include <linux/export.h> is present
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dpi.c      | 1 -
>   drivers/video/fbdev/omap2/omapfb/dss/sdi.c      | 1 -
>   drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c | 1 -
>   3 files changed, 3 deletions(-)

Reviewed-by: Helge Deller <deller@gmx.de>

