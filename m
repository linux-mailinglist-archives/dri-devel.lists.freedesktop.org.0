Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B8CAD0796
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 19:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9106110E154;
	Fri,  6 Jun 2025 17:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Po6U04pH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C4E10E3BD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 17:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749231484; x=1749836284; i=deller@gmx.de;
 bh=+6YGvoKQf4oeStUWvV9zuORljSBSt5TvFPu4n2X7VNc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Po6U04pHeuuGXTDeVaw4QX0BU+YpaVicRqN99pD3LgRCiDFenifJtVs/G4xRuL0j
 8Whpyy/w2H41nQ5aihHDXdE6JdiINYTQTtk1Sni0iBLktYvKUg7W0YLoO9cfmqjVb
 9LG1ekNLxwz78wkwcN2xZ6S+INbu54HljZiDUzYa9CKDr12+TWo9v7UO+JWgmmh6p
 VlR8T18V6ZZGUznnBol1f7pRjmBtm55THh5g9ozel/omG5s7p6ozEhYXGb83fUb+V
 FJ287P3RJf3wFkEw227NaxYqA59SzMO9gVsFGOJAscmEhZfOkw3aUl39IzhkMXuwK
 eWRXqXEjjRJWpuScdA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.142.109.28] ([88.198.112.222]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1uDEaw185G-00PPYr; Fri, 06
 Jun 2025 19:38:04 +0200
Message-ID: <0ef3325f-d6cb-4595-a8c5-1c732689e670@gmx.de>
Date: Fri, 6 Jun 2025 21:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvidiafb: fix build on 32-bit ARCH=um
To: Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Antonino Daplas <adaplas@gmail.com>,
 Johannes Berg <johannes.berg@intel.com>, Arnd Bergmann <arnd@arndb.de>
References: <20250606090218.15826-2-johannes@sipsolutions.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250606090218.15826-2-johannes@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qL+qlUnob8wBTLLl2pp3HRtcyqHq6rl5cQGWiPc07UW0/GjVZUF
 N0Z0SKw7AmHq8TYv+4Bgch11uHukwehp2lmSkh4HxWb51OPFdZqE/mYWWhODLX0HPeh4aBV
 5C8OseXjYc6ZOo6PHnA8QWC919+/ZKgJiAatQw8tDGFYhClXxrsiN5NPGp28pDaS3hgYlqE
 ZYYr1lEmj/A1+bd/tmDxA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+D+12hhHE9c=;6KSQx0azSLOgtwJGVGBu5+LnSaS
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

On 6/6/25 11:02, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
>=20
> Now that ARCH=3Dum no longer has IO port accesses, this driver
> can no longer build as-is. Make the IO port calls not just
> conditional on i386 but also !UML.
>=20
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> ---
>   drivers/video/fbdev/nvidia/nv_local.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Applied to fbdev git tree.

Thanks!
Helge
