Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C71ECE6C02
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 13:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8014310E44A;
	Mon, 29 Dec 2025 12:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="t+oOXEZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Mon, 29 Dec 2025 12:46:16 UTC
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBE410E44A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1767012370; x=1767617170; i=markus.elfring@web.de;
 bh=08ohrbmiz8m/6ojSTO13eB7/5w86v8RC2xeb2tvnc5k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=t+oOXEZQo/S4U04k+Y+XkYuBDzm7JxAstaiQnuu2bAclBqWobXqIjWdLSw4WHZm1
 s/XvdMbWGO/+iF7Wzo2rHfx3WW65zDCLA7fkOy1hVOveya1r32/zJxXoldlcJRhG8
 qU/vM8v3Esr4Wp/2CPoz3Brpd8i4ihtabro//7seZMqlUg1hVlM+BqKBpQUgdkCw5
 yBaIe2lzNcwxIFQlagLu5J3d7X3rRVC0Bd6B1qjc0vw1UJZsFw4dKAehJdGChIYqB
 jUCgcZOYGJGWOvid1n7EO5vfZzedl1ZA9oXHVvlvSM2JnxgP38plRMRfZX/sPH+4l
 9MMwCXhsmL60rbjbMA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.231]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N3Xjb-1w0MEH02aZ-00xn58; Mon, 29
 Dec 2025 13:40:14 +0100
Message-ID: <91290a53-8f59-4138-9899-4523d25e1cff@web.de>
Date: Mon, 29 Dec 2025 13:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Prahlad Valluru <vvalluru@qti.qualcomm.com>,
 Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 syyang@lontium.com, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Prahlad Valluru <prahlad.valluru@oss.qualcomm.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20251228-lt8713sx-bridge-driver-v3-2-9169fbef0e5b@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: add support for lontium lt8713sx
 bridge driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251228-lt8713sx-bridge-driver-v3-2-9169fbef0e5b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QRnbIfcvK9jI5v49kIcSmcY1v74/KlhO1B5vBgotHSZptlL8JM9
 4yR4j1ZYUL44+oRDO9PbXV+R7I4vsFnF1QB+RltJXtmUwj4HMoX04ZVXxK6nbFXKq9M9Ovh
 zq1WbDPgsc4cIL3SQKXeR8IxIQLTSoQMcmkztrs/tj0P+3l6m9RjuWd49s8lluFppDGxMs6
 rOVHhj3E98/9Y/BTYNCCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Vh+CFhE3PAc=;liTUFcewX7OviGnapk6TO25ykBI
 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
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
> +++ b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
> @@ -0,0 +1,682 @@
=E2=80=A6
> +static int lt8713sx_firmware_update(struct lt8713sx *lt8713sx)
> +{
> +	int ret =3D 0;
> +
> +	mutex_lock(&lt8713sx->ocm_lock);
> +	lt8713sx_i2c_enable(lt8713sx);
=E2=80=A6
> +	mutex_unlock(&lt8713sx->ocm_lock);
> +
> +	return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&lt8713sx->ocm_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.19-rc2/source/include/linux/mutex.h#L2=
53

Regards,
Markus
