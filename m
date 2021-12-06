Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABEB46A040
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 17:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171DA7B07D;
	Mon,  6 Dec 2021 16:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150F17B07D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GQst4t/4LdWSVVcCrm8SH8Vn8HARUfxxGSM3TziIqtg=; b=TlbdtDbZXaqHvM5WwxDFaOJnMe
 bum/P9yHE+wMNvtWFA0vau3/uepcq6HBt5JPOESm0MIkFSvegyZQtzAPyyuRyOW6kHDf9Az7Ekuqa
 FVhvq7/lBDhcRV8BIlz9lDjTvlAXMPsiV0RfruSDiH9TXdDJxcELBf+306+OlNR5gvgp756kgkr/z
 KBbc26G+M0O5S7FGDqJas/PNYylxKOySRSygWkbteDR5XD8qJ/yt6G93pNPK/las7bTQNPerU+jAd
 HkOrEv20TiH4PYJSsrPtaHzDZI2Db7nID95jWsLUqfw/hsvXV8i6F47f9D6d+II4gxaz2knXzjK7+
 Whk8igMw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64292
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1muGRV-0007xK-E9; Mon, 06 Dec 2021 17:02:17 +0100
Message-ID: <6add71c8-3685-38dd-08a7-dd95c149d2be@tronnes.org>
Date: Mon, 6 Dec 2021 17:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/6] dt-bindings: display: sitronix,st7735r: Remove
 spi-max-frequency limit
To: David Lechner <david@lechnology.com>, robh+dt@kernel.org
References: <20211124150757.17929-1-noralf@tronnes.org>
 <20211124150757.17929-4-noralf@tronnes.org>
 <1a094ddf-2190-3586-16b9-8c610e406bc2@lechnology.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <1a094ddf-2190-3586-16b9-8c610e406bc2@lechnology.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dave.stevenson@raspberrypi.com, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 06.12.2021 16.19, skrev David Lechner:
> On 11/24/21 9:07 AM, Noralf Trønnes wrote:
>> The datasheet lists the minimum Serial clock cycle (Write) as 66ns
>> which is
> 
> Is this supposed to say "maximum" rather than "minimum"?
> 

Minimum cycle time == maximum frequency.

Noralf.

>> 15MHz. Mostly it can do much better than that and is in fact often run at
>> 32MHz. With a clever driver that runs configuration commands at a low
>> speed
>> and only the pixel data at the maximum speed the configuration can't be
>> messed up by transfer errors and the speed is only limited by the
>> amount of
>> pixel glitches that one is able to tolerate.
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> ---
> Acked-by: David Lechner <david@lechnology.com>
