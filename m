Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD54B970601
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BC910E23C;
	Sun,  8 Sep 2024 09:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="GCj7k49T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D3710E23C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1725786702; x=1726391502; i=markus.elfring@web.de;
 bh=WCMJWEieh/sXV2CRivFT84rsK/t+kM3zpH1slTwVITk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=GCj7k49Tx/Lbx9BOMox0uWwLn5BevksJ8proerqSJxEF6ETIuNFBL1hyXbXX+ouh
 aQbtsnnttRHBarnvr0TNcVdsl0CAgCFLdNlNKHIiwlawR0yur6FWW08S2rKrjhnde
 JAnPiL661yKYygz6Rn/Xst4cVb4suSX1FzZSTlTGf8/ZDsS6CwUIjDOKaqi/38WUl
 BcyiqCI+BTCiOmjEa509/AHQmp1ZqUgu7tLtyZfyiSGexn5XPhff1Za5+2TZdZvlP
 yWmmcdsiBWlsOBGjuVOZxKJ4LoW+Ww2hc0uDsv0HcJ6ovt0nKiDRUO70v30iL9Tif
 StwdfmPS1INWbIgq/Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mf3uS-1s87a02mnC-00mEdG; Sun, 08
 Sep 2024 11:11:42 +0200
Message-ID: <ab8a17d0-9505-4e81-b5ec-4a3025c48245@web.de>
Date: Sun, 8 Sep 2024 11:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Algea Cao <algea.cao@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Yan <andy.yan@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH v5 2/4] drm/bridge: synopsys: Add DW HDMI QP TX Controller
 support library
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240831-b4-rk3588-bridge-upstream-v5-2-9503bece0136@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PJluZpNkDXlZ3wkBX5/Gqh/OwUEU3EH/o63oMUDBKTJGS5rOy8l
 tLwTiwnKIsd0JwYJGqrZj40eP3l+rSCYh1XNNEcr3iyt0ouyCKinmqYbQhMRzBCstjxX4Hh
 CodzD4RfYB1DsHm1q1+vztQUEr8oK+KWPwJUzVHsCsEsRCcFyiq22MOdN8/XyNoeqbCxw09
 /7R1YQdoLWnNnrbOautug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RoHr7exywYI=;VDzCZb0+H1eula7sqILN1mFZDuw
 rzBqr//2R5GEMKkyiriv5zyZqUaS4/00MPyIZtZaMkHm+a2lDmymIwCLE2DbX2qd+5tBczgE8
 0BXJ1VpSKZhFwLLld6/yzGqWvmZ0wI5KGRTqyLd+AEcgn2aCEYePFeb51ACMkJFA3isHDBCzF
 pZG+jq8WWdMFEHop9PPBy/bQRzHqrXdMAjpIkzsPfSRg72vwQM0xQjItM1ePNPde0jbH/oDTd
 LflTRZxkbj4lZ0jc7tljIUwoPZOA4bRWPSEgXTubzuH3O9cLmN7TqBkP8Ar77kdnfBm3fdx5r
 WIE+uHxOq+DhETnKm4fFrlEPWtz1uvQ/K6a2t3LtvKM59ifQJZaQONxH3rSUS3sVSnt7/T6FS
 ldO0wJ0IhAlhP1ziHsqmmz8bv4laJ2jb/s42l0icSfIKr6rxc73SHfLy1pxFiRbknZjDXWIlg
 a2Lzdd0KP07/Rgq/E4/VFXCc2HgM6jEsTlvYxDZNXZZXuyECOetT/Ut9ms8Iatvi/vYAl6Dja
 y5BAqbzCh+clapxDa8Ek62E6cD6CK4e8u40h8L94gdIDrPBj7zfELurEC03KupzyMn2PTDae0
 6GSATlihwoboef7AvG1ExMmOYjBMkfK3uwscUD+u8037oMEMY0iWpOuQie20EswoN9rPzp5lz
 5Qjglihp0gwyi51kRHGbHoLX2tViqVCmwZ/agCygCpaU7O3KAXJoYZUrCZ3GL3PLBGMaUVogh
 ho8PJXJBeZGS8ltsLuAepk+W0+zRMaAxebaZsrjmcYx89pRbpRnVjmmeeoINdELpxtnpZX4Uo
 1yk6rGl8IIOCh1xgQ01u+2Sw==
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

=E2=80=A6
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -0,0 +1,708 @@
=E2=80=A6
> +static int dw_hdmi_qp_i2c_xfer(struct i2c_adapter *adap,
> +			       struct i2c_msg *msgs, int num)
> +{
=E2=80=A6
> +	mutex_lock(&i2c->lock);
=E2=80=A6
> +	dw_hdmi_qp_mod(hdmi, 0, I2CM_OP_DONE_MASK_N | I2CM_NACK_RCVD_MASK_N,
> +		       MAINUNIT_1_INT_MASK_N);
> +
> +	mutex_unlock(&i2c->lock);
> +
> +	return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&i2c->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc6/source/include/linux/mutex.h#L1=
96

Regards,
Markus
