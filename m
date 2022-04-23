Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF7150C654
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 04:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C63010E362;
	Sat, 23 Apr 2022 02:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1254110E025
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 02:04:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1DF61839B9;
 Sat, 23 Apr 2022 04:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650679496;
 bh=zkwJV8/HpVmp0wOG+oRIzQqB5GCAkJKlAOtIo+Y+piw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oGp0D+ngR3Qv5ItJ9E1LsoCXF/w6QAa7bipsOasP3l0RBiWgxBZ4nP+mO+gsOKCAD
 ZwvUVzJu5KqjvqzE7/zeOrq8QZbWlj9+anHvROv72XMztrHY8asuVIvEpUN7gRHTig
 Vbthm9jicP0ne4xrYTCZ31eP+ZTFvzG9UnsCdxX8NZ7VHhp/nyEvHjU577YVEb6mAF
 blabnmIs2+Of7+pB/59HARPnq1YsZKAeSvIlcJv8HTBS1B2mrzuv42nTuilpFh4zCI
 ywtjzf2EkZwM8z6YHvQFvVms0JZK8ndtNbZXomMs+DhAyDb29rMtedirBXR6EK+RKr
 7Wb8N1+lqk/3g==
Message-ID: <4df26e67-2074-5642-193d-63630c94be9a@denx.de>
Date: Sat, 23 Apr 2022 04:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/4] drm: mxsfb: Wrap FIFO reset and comments into
 mxsfb_reset_block()
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220417020800.336675-1-marex@denx.de>
 <YmL2Vmpq1FhZDaV4@ravnborg.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YmL2Vmpq1FhZDaV4@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/22/22 20:39, Sam Ravnborg wrote:
> On Sun, Apr 17, 2022 at 04:07:57AM +0200, Marek Vasut wrote:
>> Wrap FIFO reset and comments into mxsfb_reset_block(), this is a clean up.
>> No functional change.
>>
>> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Robby Cai <robby.cai@nxp.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Stefan Agner <stefan@agner.ch>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

If that's OK with everyone, I will apply those soon.
