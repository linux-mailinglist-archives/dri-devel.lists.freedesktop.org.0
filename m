Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55A46F11D4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 08:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCF110E106;
	Fri, 28 Apr 2023 06:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04BA10E106
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 06:37:42 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso54055525e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 23:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682663860; x=1685255860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2hPJfkHwOMglypRlLa17iuea4E8kZcEfHcM/mkMmTk=;
 b=S50jWmRywWZJV1Ldix3O2ItgZ3RhzCpFP9Q94+60hOU+i6QcysdVe5I2RBCaUOd2zd
 fzk5db0CFe7L0e8rdBFsa1geH9bOyaCbzM4fE1c99XwOEO6QOGuPRVi6JRjtOkKYhVPD
 Q0Nndp7rm3gdlRHZakCo293FF2iA9nCG89jBItTnlUpk6xP0droMjJOKhfcKf0iKCcSU
 7w/X0mGaJNhA8RjLJAzz0J68OQxlChjqs376k0vfLiIXjGG8Lp7V0nS5MVBXPCTIPOKz
 eQ24o3MrOgr6EhPjE0uht3Kp1GPE5P2fQmivrgw6lqi7pVUnQ5SVkU5QZzqT7lowzCz7
 MaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682663860; x=1685255860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2hPJfkHwOMglypRlLa17iuea4E8kZcEfHcM/mkMmTk=;
 b=cTj5hTUpfQOF8C+5MG4bQoG+shKUyilYAA2VB86ztCtfkPulOq+fDaJ0Bz5tbwR6F+
 PACfYNG8snoEgGZzkNvw+ith/t1Ei4bYyZ3C6Kfgn++7JEsEKh0Ub+/Ny12O79y3kk0y
 TZNqWrOEmvgU3Naw04reU5xOItawliCHJGV7JoWAF+ygAg2DB9SRknv1rIAXIzUm4vqC
 y+BSdNqvMvQXnLKF68cFV93cFkv21ITLh1a3BNIQrv+3mAck5+zGq7aSfpcKccJNpc9I
 ZT5x7ucrqAPzMIDo8Y/MsPI8oKXcRmOGsv4EpnCwgI9q9UnP6aQnQ3OxSE1HoCJ+oOSU
 I7eQ==
X-Gm-Message-State: AC+VfDwxSmP1RTmU0W9JN7xKw1TqxigqT3o69X2mErrfiKaUZ4m2PXVK
 MSwZqdTp1R9EvpQRaLgu0qE=
X-Google-Smtp-Source: ACHHUZ5wsHZpnVtwfiLHJxTt4l3u1glDD10pDMjsYggSlppqbtWEe4VE4xpX50ekINIV6eiaOxaLmQ==
X-Received: by 2002:a05:6000:1250:b0:2f4:d4a3:c252 with SMTP id
 j16-20020a056000125000b002f4d4a3c252mr2898009wrx.3.1682663860404; 
 Thu, 27 Apr 2023 23:37:40 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 g18-20020adff3d2000000b002fb2782219esm20462965wrp.3.2023.04.27.23.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 23:37:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Beranek <me@crly.cz>, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 3/7] arm64: dts: allwinner: a64: assign PLL_MIPI to
 CLK_TCON0
Date: Fri, 28 Apr 2023 08:37:38 +0200
Message-ID: <5667905.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <4o243jwhbdfw32s5gzsbn4nhinicliugo4gqhh55lwxbfxkvkh@2jofbkdavewn>
References: <20230427091611.99044-1-me@crly.cz>
 <20230427091611.99044-4-me@crly.cz>
 <4o243jwhbdfw32s5gzsbn4nhinicliugo4gqhh55lwxbfxkvkh@2jofbkdavewn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Samuel Holland <samuel@sholland.org>, Frank Oltmanns <frank@oltmanns.dev>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megi@xff.cz>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne =C4=8Detrtek, 27. april 2023 ob 11:27:11 CEST je Maxime Ripard napisal(=
a):
> On Thu, Apr 27, 2023 at 11:16:07AM +0200, Roman Beranek wrote:
> > Assign pll-mipi parent to tcon0's source clock via 'assigned-clocks'.
> >=20
> > Signed-off-by: Roman Beranek <me@crly.cz>
>=20
> Again, you should be doing it in the driver, not the device tree.

Agreed, fixing this in driver instead of DT is better as it allows kernel t=
o=20
work with older DTs and still have proper DSI output.

Best regards,
Jernej

>=20
> Maxime




