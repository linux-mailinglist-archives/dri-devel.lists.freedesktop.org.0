Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3147F6CF5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 08:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9BF10E06D;
	Fri, 24 Nov 2023 07:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5139D10E06D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 07:37:55 +0000 (UTC)
Message-ID: <a2a9b649-04fc-4e75-94b0-d5df137a833a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700811473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VjMI1MPtpwadsFtx6psItLhcfNdYPfIwh32yRRxk1iA=;
 b=aZfn3DXEU/+dBvXPclrLyl6Hx8KjxjmSAFh8Y3ztc1cJZArVhIbvUeG8i/ul499cTF2lhc
 g8mZK19ZZlXa1FUkB35IVN794seOOPWr/j+CWkRaHBkJ6sbKJeH7ruG8GJqPt6r95+PYdM
 vZjKD1ktjKkWyCLe1my5XGaEg6dC5nA=
Date: Fri, 24 Nov 2023 15:37:45 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v5 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove
 I2C_CLASS_DDC support
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>
References: <20231123094040.592-1-hkallweit1@gmail.com>
 <20231123094040.592-9-hkallweit1@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231123094040.592-9-hkallweit1@gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/11/23 17:40, Heiner Kallweit wrote:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
>
> Preferably this series should be applied via the i2c tree.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

Thanks.

