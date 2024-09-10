Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094ED973CBD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB1B10E86B;
	Tue, 10 Sep 2024 15:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eQguQaDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8623B10E86B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725983557;
 bh=VqVYu4N/Tf1UtM3sawFVKjYsdrOcwFFbjlE2c3Q5n6o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eQguQaDhVq678MgrPKfPcNoIMM+tkkuOFHGC4Nfix43E7Oqd4JTJqZUW3043HaUQG
 brN2zMOxEQ3YE8qsp8XT8qjaxfA0cPPhVj8mE+aPqHARpYIhuBv95ZYVNOJeN9JTIK
 8rxZ1EjcGMV0Ui7aHnw6oltLy99/yrWBpYKKvue3LZ9cTlX4TGsN0iS6ab8lG4xB+a
 45uzTdAnunuUvTjqO+unl/H+VH802SJaVkurGGZ2oB/abHUN2tctLqmN6tBxbkEzGT
 aCxBdWj+tSvxBaN3Dtj74F7fRp23DVaapGtixCj6b9zk7xbvOrmcLlm4QeLSmOuwHh
 TcOWGrZ9IzLsA==
Received: from [192.168.1.90] (unknown [188.27.55.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B9FA17E12D3;
 Tue, 10 Sep 2024 17:52:36 +0200 (CEST)
Message-ID: <ae4db880-d64c-446b-bbf8-954b7bebca83@collabora.com>
Date: Tue, 10 Sep 2024 18:52:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/bridge: synopsys: Add DW HDMI QP TX Controller
 support library
To: Markus Elfring <Markus.Elfring@web.de>,
 Algea Cao <algea.cao@rock-chips.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Andrzej Hajda <andrzej.hajda@intel.com>, Andy Yan <andy.yan@rock-chips.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Yao <markyao0591@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Alexandre Arnoud <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>
References: <20240831-b4-rk3588-bridge-upstream-v5-2-9503bece0136@collabora.com>
 <ab8a17d0-9505-4e81-b5ec-4a3025c48245@web.de>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <ab8a17d0-9505-4e81-b5ec-4a3025c48245@web.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/8/24 12:11 PM, Markus Elfring wrote:
> …
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>> @@ -0,0 +1,708 @@
> …
>> +static int dw_hdmi_qp_i2c_xfer(struct i2c_adapter *adap,
>> +			       struct i2c_msg *msgs, int num)
>> +{
> …
>> +	mutex_lock(&i2c->lock);
> …
>> +	dw_hdmi_qp_mod(hdmi, 0, I2CM_OP_DONE_MASK_N | I2CM_NACK_RCVD_MASK_N,
>> +		       MAINUNIT_1_INT_MASK_N);
>> +
>> +	mutex_unlock(&i2c->lock);
>> +
>> +	return ret;
>> +}
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&i2c->lock);”?
> https://elixir.bootlin.com/linux/v6.11-rc6/source/include/linux/mutex.h#L196

Applied for the upcoming v7.

Thanks,
Cristian
