Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834FD74BECD
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 21:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CBC10E049;
	Sat,  8 Jul 2023 19:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B1210E049
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 19:02:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 323C38619F;
 Sat,  8 Jul 2023 21:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688842949;
 bh=5JaV0OjQeJovtxQ6RLIgyIWKQYdOvpav4u09EO/i5fs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zFXl6C6Vw3hbDa22CZDzvj6bq/9FzWBRpypFG1AHa4I4FTgdXlLGye6axcMFPY0BO
 xUII7Ih7+cAnWl3tNKdDqRNRvmAjBC9ks3STU1LEZClWXFUn2cVvLFUJnf8BTe47pV
 he25WNl6B8FYsB3PpGuq7J8Y8U5t/VOaYRzbi94FRWT5/0wO8nHW/4LxWxcTQ88NUJ
 DhQW5b+YBcpgT++CdqZWTLI/QHW44+1OFKwTFRIKwvw+BE5AA2NhNbSZga6RtnQOSK
 d3MXNk/aVC7byS/Or2ouBLDnHcVxz9QGKYpiJqy1c5pE4UIlsp6xLCAr/Dk0tZAJTf
 1I+zHvpaknMPw==
Message-ID: <149a6580-8711-ecd5-08ff-3c0753c91d0c@denx.de>
Date: Sat, 8 Jul 2023 21:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] drm: bridge: tc358767: increase PLL lock time delay
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
References: <20230602191501.4138433-1-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230602191501.4138433-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/2/23 21:15, Lucas Stach wrote:
> From: David Jander <david@protonic.nl>
> 
> The PLL often fails to lock with this delay. The new value was
> determined by trial and error increasing the delay bit by bit
> until the error did not occurr anymore even after several tries.
> Then double that value was taken as the minimum delay to be safe.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Tested-by: Marek Vasut <marex@denx.de> # TC9595
Reviewed-by: Marek Vasut <marex@denx.de>
