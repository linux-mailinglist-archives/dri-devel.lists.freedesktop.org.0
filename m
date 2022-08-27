Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C675A3426
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 05:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF0C10EBC1;
	Sat, 27 Aug 2022 03:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C6A10EBC1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 03:31:33 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A96E6841B4;
 Sat, 27 Aug 2022 05:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1661571091;
 bh=AgUbJoM9txIIKO9AOK0HFIwVzngwaZecx5l/f0oA32A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gvYv3jP3L0RKEFOmqg9jvs6ns6i4AXlYwN727oSNt4imIXWsIu0APq9+j3xGCf0Jr
 WfENNL2rj95jLjom/JnAsAVQMJL2wXhUrI83bCsLBbCRGE4b4NHXxHyt4/jR+ZHmOd
 8Nju/vTxTjmpQseQk9uSMPuvmsr8AYF2tu5ssHZpaylWgxpqHVhop1hg9kuVCjG3oX
 YVLBp/kvhCTxjpc20Ghd20k6bZ5mqyC2sRwRBSDbo3ObzA4hWmSNhlncJoAdfz0HrV
 aRh10O03hhb/D7AbRFcddyGi2aWztEZSroo/cH1rTl/nYPxuoDi4RGZ7fuzt5N8A4H
 ZT7Ue6B//icJg==
Message-ID: <2ac85972-8f41-64a5-0fbe-938f4594c8ed@denx.de>
Date: Sat, 27 Aug 2022 05:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/panel: simple: Fix innolux_g121i1_l01 bus_format
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>, sam@ravnborg.org
References: <20220826165021.1592532-1-festevam@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220826165021.1592532-1-festevam@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: hs@denx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/26/22 18:50, Fabio Estevam wrote:
> From: Heiko Schocher <hs@denx.de>
> 
> innolux_g121i1_l01 sets bpc to 6, so use the corresponding bus format:
> MEDIA_BUS_FMT_RGB666_1X7X3_SPWG.
> 
> Fixes: 4ae13e486866 ("drm/panel: simple: Add more properties to Innolux G121I1-L01")
> Signed-off-by: Heiko Schocher <hs@denx.de>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Marek Vasut <marex@denx.de>
