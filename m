Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1212A9BA7F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 00:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25A610E172;
	Thu, 24 Apr 2025 22:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="cItIbCef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC1F10E172
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 22:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1745532907; x=1746137707; i=deller@gmx.de;
 bh=r9il4+0uPvGSzMSMpJf4QPTP/vXv0B5R4fBBczgTIKw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=cItIbCef6E0U+BsIgujHPoJZx0gaR8d/mC9pAOcIisRyxuGaSrRg/snKHMFnECdt
 BAEaM6uq8qatLvTe5HRtp7vQvo/Y9vqIObhMfN1Cbjl6uSsxUgEWJrdvRNQnH8jJT
 3sl3s3fHB/lKpnnD2LtolAfj3tSkAXRPL0Cs7Ma61XKR3fgqMHadFX4WRxPGGNXE0
 N7BGX956/kMCNTyxaxsUMyQvc7eyCFdRWfBJlzkCaIY0vOJwldfSGO1VE5v8DPid2
 V3ctXlitQYiVkhfUF7JgcBXQ7DOGfTcPk5Cha5glDbeWnh2Bh50DMGjUw9+HDRAME
 32jnPUQ9CGuHngjuXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.181]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9MpY-1vD30B1h5Q-016qTF; Fri, 25
 Apr 2025 00:15:07 +0200
Message-ID: <92b09e80-c7d7-49b1-9c67-c61239f86517@gmx.de>
Date: Fri, 25 Apr 2025 00:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] atyfb: Remove unused PCI vendor ID
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250424115652.2451062-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250424115652.2451062-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/GCferr3Eh+1eGWeQvTIYJncNGqCVFXMUBRYZVWmOhSxLps5F1B
 931y/lJBqsvSIFodf8on+rgQ9DcYp9U1cXTnw6L8HLRC63FJyobik5REqk6Zz5AySnvvuvW
 FAPz2Id+BO2TA9lFJOg63Xx2kTITU3YIDPT+m3b2+e0lAIyJaTnIXssPBDCYx/shgkjgmHV
 kNSqsLz2cPCgiF+/Jyqtg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:knZtSTdx7OA=;CfCiCBYkP2KOf1M3JesePsJpCGw
 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
 A==
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

On 4/24/25 13:56, Andy Shevchenko wrote:
> The custom definition of PCI vendor ID in video/mach64.h is unused.
> Remove it. Note, that the proper one is available in pci_ids.h.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   include/video/mach64.h | 3 ---
>   1 file changed, 3 deletions(-)

applied.

Thanks!
Helge
