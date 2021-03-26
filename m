Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3B834A27B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 08:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CFF6EEB6;
	Fri, 26 Mar 2021 07:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196A66EEB6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:24:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF79461A45;
 Fri, 26 Mar 2021 07:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616743456;
 bh=lX/80uGLe0JABuz9/Sat3RiOhg6CKPQU9KB49SC6miw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=d23ZYfGT5UX9TzKMtS6DUY2KYWYQAJMujFbiJ+qpW44CTZArzt0Qz5DcAYAIeWp08
 TqY98yTzlwp+zV4+jShzCmLFvPnGVHd/BUoL20dzgVBLucz/eV/soaxYDBXeUfhpCm
 vkOktUzatMBKtDtOu+zNse9tfjMGYiFKUDnRJPrnl98fSMbEYSfMnby3jtnU2/adho
 tdXpKxHQawaVpVNPYMo/Jaj417myX58FUCm+cg4qEgLn4FA2XVL07ziFGvwEDK9kij
 hKpJSI7+6V0VwWpdIH2M+ZouvR6+oq+xBr+0B7kWRPUx2G2oBO5SxodAtVAKu72XV+
 eP8XT8GSi3Q+Q==
Subject: Re: [PATCH v2] drm/omap: dsi: Add missing IRQF_ONESHOT
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Yang Li <yang.lee@linux.alibaba.com>
References: <1616492093-68237-1-git-send-email-yang.lee@linux.alibaba.com>
 <20210323111539.5wi3ldwfvxvzmio7@earth.universe>
From: Tomi Valkeinen <tomba@kernel.org>
Message-ID: <84621ac3-a4b6-cd95-1c7a-00cb971f23c7@kernel.org>
Date: Fri, 26 Mar 2021 09:24:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323111539.5wi3ldwfvxvzmio7@earth.universe>
Content-Language: en-US
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/03/2021 13:15, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Mar 23, 2021 at 05:34:53PM +0800, Yang Li wrote:
>> fixed the following coccicheck:
>> ./drivers/gpu/drm/omapdrm/dss/dsi.c:4329:7-27: ERROR: Threaded IRQ with
>> no primary handler requested without IRQF_ONESHOT
>>
>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>> ---
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Also maybe add this, so that it is properly backported. OTOH old code did
> not have IRQF_ONESHOT either.
> 
> Fixes: 4c1b935fea54 ("drm/omap: dsi: move TE GPIO handling into core")

Thanks, I have applied this.

  Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
