Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA39B1311D
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 20:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A8D10E298;
	Sun, 27 Jul 2025 18:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="pdNmqNW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F177A10E298
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 18:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1753639901; x=1754244701; i=deller@gmx.de;
 bh=Exw6iUjPpcJYiqihVJyfamw8xTZxMpUnPYXzYUFycs0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pdNmqNW05kk9QTSxBmiwlvg1NXjsn8IKtXW3rPjJH+dZoY500Zw7bMSdZV3Mdom7
 crUEYQbaRZ2VqUr5m+8oYQxKoaIqwrJ3iY+LgEAjZbg11jDSE8wubBF9Vg+3seww3
 thY/DRwqw3/bksAXr+sFSy2b/SgZYmYMLCf4fbhab3IC/Q5106TTKwx9YVZRMgyvU
 8WuD405dRWYEhS+l/rXaj8Ngb7M0P9jp46TgV51Ps6mIM7rdLqHQRMgnBc63XQaUu
 IpOw95/omF/9Is/M7ojXgL3DAOMeU4nlAkW54io7TN07Mh6e3zuBnslFwG0p52ORF
 27EAqVBcPHgJUCSj2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvPJ-1v5ZBw1hiP-00W7AW; Sun, 27
 Jul 2025 20:11:41 +0200
Message-ID: <442075e2-d0e6-4ad7-bf72-4b58880fc416@gmx.de>
Date: Sun, 27 Jul 2025 20:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fbdev: remove metronomefb
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250625131511.3366522-1-arnd@kernel.org>
 <20250625131511.3366522-2-arnd@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250625131511.3366522-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TzmshtYNPx/fsdMurnY5ChnUrKt9dR6iP2ALqeDUmQSir6GPN8E
 2HKjaK0KA+sy2q8t6PC6nbhNFnFjrBJpBSHqzC4xFq4cZINpySyBiCmNtOX/9amAsCaI/L5
 /bguDsd7KrjAdzbRDDKr0VL071pYgMR8TTklKiGhhRILfkTl0KYosIRKFaMls3tkvz+hGiL
 uNcLzfTH4/07nUveHuqaw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j2QzEE7dtXI=;KdGVkPnJHP46/0cKgV33yrbtW+D
 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
 Aj0jSb+w173NFQYgwL9Q==
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

On 6/25/25 15:12, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> This driver has not worked correctly for many years, and the only in-tre=
e
> reference to it is going away as well, so remove the driver now.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   Documentation/fb/index.rst        |   1 -
>   Documentation/fb/metronomefb.rst  |  38 --
>   drivers/video/fbdev/Kconfig       |   9 -
>   drivers/video/fbdev/Makefile      |   1 -
>   drivers/video/fbdev/metronomefb.c | 724 ------------------------------
>   include/video/metronomefb.h       |  57 ---
>   6 files changed, 830 deletions(-)
>   delete mode 100644 Documentation/fb/metronomefb.rst
>   delete mode 100644 drivers/video/fbdev/metronomefb.c
>   delete mode 100644 include/video/metronomefb.h

applied.

Thanks!
Helge
