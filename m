Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2546C9C8CEC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 15:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E836D10E2BA;
	Thu, 14 Nov 2024 14:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="E+qBOLrG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9876B10E2BA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1731594915; x=1732199715; i=deller@gmx.de;
 bh=7cL1d418pCLkOQWiNQwzOKQe/skb+LIVS7TMgzPtaDQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=E+qBOLrGAS6u1sUEZqTMCosHqbdJXMwTVuuZS7YTRAshuAzxGNZiKgAFBXlEJW2A
 8gwo17gdxuq/d0dHVZU+hchMdZMQxaL+9NkadmZ3VAFpEfqhtB6nKbYdiw71GfT3R
 nehKe4HZ8WEcpc8eom7eHR68SBarvdrSAIz85dsnS/rU0LvuZ7tDLawp5bLyUBykj
 BGEDQIFeV92A5ixRIf402r70v1PbREjqTf1QghGfL9Ve8WoGeHLGfNBpbelrq12Gw
 /98fhqiNqWoQVAbdWKGKzWtjaqLZ1SGK64OuuUczjZg64e/XH1wClFGJQLHJmLnil
 /naHNhdgE92PczkYXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeU0k-1tjplG3M5E-00pKcW; Thu, 14
 Nov 2024 15:35:14 +0100
Message-ID: <00edb739-458e-4ed0-a76c-4c6ceb4cbc3e@gmx.de>
Date: Thu, 14 Nov 2024 15:35:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: omapfb: Remove some deadcode
To: linux@treblig.org, u.kleine-koenig@baylibre.com, linux-omap@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241026220133.93956-1-linux@treblig.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241026220133.93956-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pEWBPUavsm7cxfKaowBGPWSvRP1x9pkmKjPqUW2Bf1916up1DWy
 cwBOOut9ZLa/poGj9F4J3FseU5DECw0WtI7dJwWrshJkUbFroGUDE9ya6Z5Q/3/OHiN1Asx
 2+jvUIhW45QiXRt5lwQfiYv9Htej3vJDoay4lJK5MinPWDoelGynVNwt8VdR6LMtQomNgxn
 9lgE5TknsZiEQYMDaxSlA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cGRXIVaS8Vc=;9av0evoZdcdWSn5Ee3L4RxQbIZz
 l+6uYoZX4xhBb/5z73HYO1J7ypc8rV7Dq52Y/pIzKIxmJx/2sntzg3PO7kXyLxl18/JWg8hOz
 JSgo0APgJyIEvwHVfob1OXpXBWR8V1CEqFHvGE7NaoZ8sA72ap9uYsvHFeR7n66Jz8PyW76Sf
 TaaJOcfmGSi/LqwkmcGtpmZgzgc0f4f7ZlOlcWszvlz/34c0hZ/Tl7AWY8ZavDTLLhwOze8wG
 j6WsrSNA0bZhlt+xGqf9PuPTBumRC3mA++zvR8JbMglQePOkAISjZGriyNH4JJmdBnpbygt6q
 wuRlkTwP0kGIwDUuLsKeFPyx95H24TuXYjThp4xoh5ltQUIgOlV10BWwCuuaGCh1eAUz6NAR4
 L780PCz8vww4yUe4wTwZz3fuHoTiHwqniwcr9OIo7osqkkBs54ivNabXOhTx/DUnMdAdR6LSP
 aX7Z8+E2yw89shXuuR+Iqdzg++Ks1eJU6dX2+fMoI0g2iATwT6aDTBUe84uXDvRSHoxYI3uAu
 4u4tpumvk2pzea/QGcjBU8JvGR1CG/JMBH/pZm9ZaW1E+l1QCkgG7RrT/nASiccyqRBQ59zTO
 /NNofE1K+/WLDkO88cm14CxzQL2cK/jX1gpp1dRPrhXXjdfeFQwlo0sCZa4rTwhfz2mbQqSG8
 eb6gmnAA+aBtL6VBCG5H/WH0a1Rqa8LJrLReP6pJ78r6MTfjXg6ATzcrdtspcVTpp2BNHnIz1
 CyclAsMIR61dXpsQWd9M1NOcfPgP3ot0Ym7W4PWUwleb81UaLtRn34KEbI349bqT7kfnuF6Jv
 d+pUzMcQI0n+VlftZnALjeYFou+YGg2D776jn84O1cpnTkndL/929PhqcWh/QsHG5+BRkk7xi
 R+RpTLRIMjWnWtyfLGqBlTXaRqsjoaeuECh5K9vToMvbiyTKSrFax9x3D
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

On 10/27/24 00:01, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> commit f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
> took a copy of the omapdrm code into omapfb, however at that point
> a couple of functions were already unused at that point.
>
> Remove dispc_mgr_get_clock_div() and dispc_enable_fifomerge() from
> the omapfb copy.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 27 --------------------
>   drivers/video/fbdev/omap2/omapfb/dss/dss.h   |  3 ---
>   2 files changed, 30 deletions(-)

applied.

Thanks!
Helge

