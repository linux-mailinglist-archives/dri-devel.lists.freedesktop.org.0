Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E39875197
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 15:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D701D10F461;
	Thu,  7 Mar 2024 14:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="q6PESEZs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF5310F466
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 14:15:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F06F186FB2;
 Thu,  7 Mar 2024 15:15:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1709820951;
 bh=iyU+yHKoHMIkN2vlYwP+9k8c/FZ4v8+Y2kWk52/rpoc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q6PESEZsMbMM7CgCUdoxTcKJeUYtJSfVbY3AxzVSOJAQCe9ZvMiu8zZAx1RhbKypp
 VADET9nBOdGFoHAOKTkG3MMxzpQDFYmJrl9mWzVzS/gPmN8WfF3vF+6RiG7VtEZmmJ
 sYzXjWaFnLCgL2b/+0bxMkA15Qav5YqjwpyMGb3lIFsjz9FMc4s8bIWuj7WYJj0cUC
 xer8civsE2jKejiBizX3gAK7LeYIW9feMaYV/p5PmOQBkBLN80AFY3kdjoU0VKuh1R
 EU7FF7ge8bKrVgIo4B6to+t3+P+Hh8ck2Q+oCXAbt64xzsBHvnGVDtwXKlUBUlMdlY
 J9GeuzAr8nlBQ==
Message-ID: <62401915-4c05-4658-be01-c7281700b3ee@denx.de>
Date: Thu, 7 Mar 2024 15:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sn65dsi83: dsi burst mode
Content-Language: en-US
To: Sean Nyekjaer <sean@geanix.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <E35054BA-FBE5-4CEE-905C-1F5D20140590@geanix.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <E35054BA-FBE5-4CEE-905C-1F5D20140590@geanix.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/24 9:09 AM, Sean Nyekjaer wrote:
> Hi,

Hi,

> We are using the stm32mp1 together with the sn65dsi83 bridge.
> The ti,sn65dsi83 driver is (hard) enabling MIPI_DSI_MODE_VIDEO_BURST, then the st,stm32-dsi driver is adding +20% to the clock speed.
> 
> That means our LVDS is +20% higher than expected.
> 
> Any proposals for a fix? Could we add a devicetree option to opt out of the burst mode?

I suspect some link clock negotiation between the DSI host and DSI 
bridge have to be implemented.
