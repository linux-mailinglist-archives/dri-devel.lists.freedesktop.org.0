Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC853833680
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 22:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EB510E384;
	Sat, 20 Jan 2024 21:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F101E10E384
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 21:29:35 +0000 (UTC)
Message-ID: <f41bc98a-cb8f-4e75-9445-f24e3c55b69f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1705786144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlHEkjnDL7XJG4VOR/IFoEjkeW4wnEIGrUp6hqnHKHY=;
 b=dC3lbNFrc4hsAMjzbICeUQVcU1Yfb4XRVDU/jITsIwdYpfbCMpYgQLXomC+YdlDw3SZfKG
 6c0uOtBWAkwjyUE2WhW0xq0A4C+IBFR4ADqHV272krP9EGkWwlOeVvaKvPWE3eMgY9TiJH
 ExGVo2pjmxTC2MG8MFZ3Ul/7GmcaFp4=
Date: Sun, 21 Jan 2024 05:28:57 +0800
MIME-Version: 1.0
Subject: Re: drm/loongson: Error out if no VRAM detected
Content-Language: en-US
To: Katyusha <KatyushaScarlet@Outlook.com>,
 Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
 <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
 <TYCP286MB29897A1BAEC60654F6AC3D13AA772@TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui JIngfeng <sui.jingfeng@linux.dev>
In-Reply-To: <TYCP286MB29897A1BAEC60654F6AC3D13AA772@TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2024/1/20 20:01, Katyusha wrote:
>
> Hi,
>
> This patch works fine with my Loongson 3A5000M laptop (L71), which has 
> a 7A1000 chipset without VRAM.
>
>

Can you give more details about the hardware configuration about this laptop?
For example, by using 'lspci | grep VGA' command. I want to make sure if the
integrated display controller are there.


Normally, the integrated graphics should not be used if there is no dedicated
VRAM equipped. And the platform BIOS should disable it.

