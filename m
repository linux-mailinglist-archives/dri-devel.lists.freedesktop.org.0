Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D3DC16E83
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5519110E661;
	Tue, 28 Oct 2025 21:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="comSEmJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C2C8825E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761686217; x=1762291017; i=deller@gmx.de;
 bh=agjwSDItBCjjVU39n6Gh/m5gcfolEP3e/OyEBDQSo24=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=comSEmJBwP3P1te7cHpEXEA/OE67HYn8HWfVCEWgrZgI+bIEurXRs8E9dj/0OI2w
 kvJfaeYI2p5+b441kb0AXen1HMBSVPy3a0s6X6Oey5ccsB74cNwVYx+mg2xnkkR/p
 up+ass2Wyq8bRb6NDUCSJ9+9V2BdThjnHuZveFYwJ5miCRgCSMecusoaBhCGlvhjC
 Cx5C2hnNS4Lh7HMGTT5OBWPcsXt1ZJRwvlZfho3rPsWVH7bYsg5lUEaO2IMIOcmkF
 JSepS9Y0w+zZ3YA7Kvi1E8RaOJd5aIedknalpcFT5C3DP1VJzvhg3iJwJ4tfGNZ/k
 QHRm0kDEE7+ey+2YAA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.74]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MStCY-1vi9EF2mVy-00TSbv; Tue, 28
 Oct 2025 22:16:57 +0100
Message-ID: <62d108bd-21db-48d3-9ceb-79e533d94306@gmx.de>
Date: Tue, 28 Oct 2025 22:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/pvr2fb: Fix leftover reference to
 ONCHIP_NR_DMA_CHANNELS
To: Florian Fuchs <fuchsfl@gmail.com>, linux-fbdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251025223850.1056175-1-fuchsfl@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251025223850.1056175-1-fuchsfl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UdZlOokfHKGDpX8dXOUirwmPPyISseLEpiyhqQjxg9vXPdZ7Y7b
 AepB7Rf/UEeLr8l2q3nIdhd797LrIggBcLeIrv8qrP/H/FvIQ0vq7X7s6NDBH2n8ZwtsYFb
 Bm3+1AoRaB/59Lns80wNMZDVOb7186uVV8LCvuO+LAeaE0rJXZiz3CINgRREs/AiSXHx2Mw
 TdgWtWCzl5pFuafYEADfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T4RVxgMdMzE=;DlCtkFcG3X6C0CNhu1X/FvARNvS
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

On 10/26/25 00:38, Florian Fuchs wrote:
> Commit e24cca19babe ("sh: Kill off MAX_DMA_ADDRESS leftovers.") removed
> the define ONCHIP_NR_DMA_CHANNELS. So that the leftover reference needs
> to be replaced by CONFIG_NR_ONCHIP_DMA_CHANNELS to compile successfully
> with CONFIG_PVR2_DMA enabled.
>=20
> Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
> ---
> Note: The fix has been compiled, and tested on real Dreamcast hardware,
> with CONFIG_PVR2_DMA=3Dy.
>=20
>   drivers/video/fbdev/pvr2fb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.

Thanks!
Helge
