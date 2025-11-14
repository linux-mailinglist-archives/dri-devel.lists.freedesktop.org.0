Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895FFC5E6A6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 18:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9469810EAE0;
	Fri, 14 Nov 2025 17:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="pN4atnfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC3310EAD9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763139793; x=1763744593; i=deller@gmx.de;
 bh=+43su4KbAC8vUD7tD/w+cYlFfrodFmxx5WF1RHTg4qE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pN4atnfadLH6wfv+q+sbl7F5hpk9tjLWwJ3QLyQpgktyvEogE+kJMPlV2fboLhyb
 BBoendIPZfifFdiBFYwX8hnSH+0b0xQVyIzRm5A3XjJty0Tadjsntd5tslRtxmevV
 XOws8rJaIODjqNrxj7ruIVoV1gnrkCEZgRvbxzn9l3uglhnmkzkq/rQL+jQ7bXZ1x
 Mcvy32znH0BZAH0l6N0i6/k42wpNYmrkjhAvz74R9SEWZZAnajX76AiC0EWF4whaY
 XmKWMawDK5fX/PArnKCE+WoC+jurkaDFSPJweMF1RKvRzjRlte8ifiCF4BQxgvn1O
 4bdQapA0pJbZmaVX2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.147]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC30Z-1vTYey36sP-001rG1; Fri, 14
 Nov 2025 18:03:13 +0100
Message-ID: <9084e87d-6ac3-4ad7-8f1e-664a19fd73cb@gmx.de>
Date: Fri, 14 Nov 2025 18:03:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/gxt4500: Use dev_err instead printk leftover.
To: Javier Garcia <rampxxxx@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
References: <20251110165214.3076586-1-rampxxxx@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251110165214.3076586-1-rampxxxx@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oJS6W/aMbtcUPWufACsu9D0hA8RSqNU2Nbp/Y6rCNyPnqRIC3P6
 XSpbBLMia1sP5Vh5r1eYSftczehTPxjON3NCkfYppcqJrtky+M/hAjPPofICjR5BTTIebi7
 w9/Rrs/VamU8wabdwrXC9iglXbWdbNz0QdJua3l+YRiLuvjRkw+da0UcuC8McipnT6N1Qsa
 iFa+EkAHAFX9uG4zyFfwQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yYdbbarG5J0=;u1/NuwuWTP3toDCbFpS+hMjJtrF
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

On 11/10/25 17:52, Javier Garcia wrote:
> I coundn't test as not have that hw but cross compiled to check the code
> change.
>=20
> Fixes: a3d899839064 ("[PATCH] Fbdev driver for IBM GXT4500P videocards")
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
>   drivers/video/fbdev/gxt4500.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.

Thanks!
Helge
