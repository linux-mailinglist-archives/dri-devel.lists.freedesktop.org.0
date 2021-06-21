Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 043083AEEA1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 18:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECD089CA0;
	Mon, 21 Jun 2021 16:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C08389CA0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 16:28:27 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D25668296B;
 Mon, 21 Jun 2021 18:28:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624292904;
 bh=PpElZf2Qa89/QGkVBGeob+jaEaK3ysGrYR898TQcX1c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rxNH7Y06pLmm9UT0/iyQPt608j8+uIg4eI4tOHdRM7AZJVUlLHsm4LuI889JHE774
 SMH0Gjpu7eeCUXmLlHlP0gjtGiP3wrkjeKx9kV7MC/PJPgYLmHtLESWPRjfdBJoJte
 K2xs8orACtYq+BcCBh2xfv+IZP0xZwHk3wZS5a8Raa8+of5R3MC1MdpRkzxhysnC+u
 1E33JT7RBPeHV08B/EUqcDg28Xmg3QABlSbw8buhjk1oH6nPCePe9AWviIAl6cxqX3
 7cDEYUK0ygXHhGIcv+JQZmwkKMBsniwYXE6P9xu4LDcN6xCR9ZUE5cUMM/EuKT6C8u
 PJI4WK0+y9PUg==
Subject: Re: [PATCH] drm: mxsfb: Disable overlay plane support for
 i.MX8MM/i.MX8MN
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20210620224834.189411-1-marex@denx.de>
 <fda3b035b68f67736278b13a253448253d14fa48.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <2756a72b-11cd-2ad3-695e-171afb1490b4@denx.de>
Date: Mon, 21 Jun 2021 18:28:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fda3b035b68f67736278b13a253448253d14fa48.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, ch@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/21/21 2:10 PM, Lucas Stach wrote:
> Am Montag, dem 21.06.2021 um 00:48 +0200 schrieb Marek Vasut:
>> The iMX8MM and iMX8MN do not support the overlay plane, so they
>> are MXSFB V4. Add the compatible strings to reflect this. Note
>> that iMX8MQ does support the overlay plane, so it is MXSFB V6.
> 
> Do we need this compatible in the driver? If there are no other changes
> known at this time, shouldn't we be able to just specify "fsl,imx28-
> lcdif" as the fallback compatible in the DT, besides the imx8m*
> specific ones?

Yes, we should discard this patch and use the fallback compatible, 
although it is quite counter-intuitive.
