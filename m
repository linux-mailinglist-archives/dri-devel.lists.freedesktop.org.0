Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F933E1D66
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 22:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8126EB40;
	Thu,  5 Aug 2021 20:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9846EB40
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 20:37:48 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 m28-20020a05600c3b1cb02902b5a8c22575so4372171wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z88e2PTu699EGNWBXDBXADLwRqUTJVwIqeZ2BUPAK6Y=;
 b=rIZ9LcL9Vj8tRxEQTdutAeodqAoWHwSe9Yd+Seu42fijyVy14gbCz/0yTn8Ag0Wc8S
 qxezv7Jd170LhbEqn7KT5REe71IyHarY1rwAVgna+1I8OtMgNRJUpzvJf+zdz/Y6Yzyc
 kFWXMecB5H+ov+7NaF0sjvmIO5vqI8sCpDBVAk/yS+ztZCmbwf/beDIQXOXxA8ZiDQtf
 Mt3nbKLtvB2N+YaRUJSo1kaKM6HgKttgmlkzXTPbrcaZVGWVZy1M5Tntet9Y9oE7hyVr
 T9kH6MdeNHeBTwABFLwqYe6Ae8NI+gXVdCLqDQtHWktOKNB3PfMf+65gJ4Dpi9I2TeC4
 iQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z88e2PTu699EGNWBXDBXADLwRqUTJVwIqeZ2BUPAK6Y=;
 b=qb0MX0oU8OzgWfTnkkgIV53u/pwg9yQpHlWJGnN66p8/2Su52/H6KsnP6Iuc+4BwAI
 qN3QlfkNnLVHxWvgX9JrFlluFEkcEV1qPX320SyOvyYVs6EMTOzkhy2w4btNfMiyIczB
 1oxwMgqCuKzuutjX7egBweQwzydw0/CblNzTKRldqscHAI3pGvdtMqh2JWZOus0ohoZt
 tH40dmlQPVr6O0O7F8psq5sCox473JykYe6sLP1TbTa5/etb2Jy7YZJMCgQ9yw+21CVP
 +0YgO4sJzUlwbBTZ370ZK00arVE05rIhjPPFQOhB+eWoVyQkHwm1+GMyVob8gpqPWVWi
 czcg==
X-Gm-Message-State: AOAM5312uIAqoj4BdG5mE6J+jy4F55Vuk/UXqpDsg7p+LsGd5GwpgIT3
 jkoBRk5CZRA84we7RO+2DOg=
X-Google-Smtp-Source: ABdhPJz5z0n2u0xYOCUL1KUYREtPDXYSQXVHiOIyab3KPOc7WG6YmipEznV9l/TA/028qkJSEexFLg==
X-Received: by 2002:a05:600c:1ca7:: with SMTP id
 k39mr17582753wms.115.1628195866702; 
 Thu, 05 Aug 2021 13:37:46 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net.
 [86.58.46.198])
 by smtp.gmail.com with ESMTPSA id y4sm6547939wmi.22.2021.08.05.13.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 13:37:46 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: ple@baylibre.com, narmstrong@baylibre.com, a.hajda@samsung.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1] drm: bridge: it66121: Check drm_bridge_attach retval
Date: Thu, 05 Aug 2021 22:37:45 +0200
Message-ID: <3283765.IqGz30O6Nz@kista>
In-Reply-To: <20210805185039.402178-1-robert.foss@linaro.org>
References: <20210805185039.402178-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne =C4=8Detrtek, 05. avgust 2021 ob 20:50:39 CEST je Robert Foss napisal(a=
):
> The return value of drm_bridge_attach() is ignored during
> the it66121_bridge_attach() call, which is incorrect.
>=20
> Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


