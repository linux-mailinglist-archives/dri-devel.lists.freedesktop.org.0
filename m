Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4592B9FDE33
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 10:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDFF10E291;
	Sun, 29 Dec 2024 09:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=edgeble-ai.20230601.gappssmtp.com header.i=@edgeble-ai.20230601.gappssmtp.com header.b="K0eo51bB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1675410E265
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 13:21:05 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2ee86a1a92dso7058139a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 05:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735305604; x=1735910404;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8AKGn7nMK9/Ut/Y6UeXKdpxBcWZLRuzCPMCeYqx6bNk=;
 b=K0eo51bBN9JXybk9ZWalFKwPZ+egXzWBFi+prunB9/mm2/nmAPya35tGmuNR4DGTQo
 hFswAHcUcwSNISJ7dKzCsB05hsdFPJBkTrkNKPdKrSEjQMnW7iTdTYQ4/DQuO2lR/tQ2
 MSY56ksJmu8/p02UhhLwoZ4b8Mg5Lj7resTKgH3D2b1OIFROqiGIOSwLoIdR2UJ8WjW0
 mIwgYD93de9uy0mxdyo0tfhgTx1pBUUP4pZaKkqmmh7r65xObeV3DtuLb53ANdfZU8YS
 HwM6t0sZz+stqj09t/IJ7JkeJhM/wHL9WrvZuwfWT3OQ4ym0VexdCOYHCZwHENv+XJqN
 XMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735305604; x=1735910404;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8AKGn7nMK9/Ut/Y6UeXKdpxBcWZLRuzCPMCeYqx6bNk=;
 b=ipxzVdjlN6puJ+AW2wIhdq7R+EQxUxtKZIOv1F3rdQWXB7bDRLgBPE3kr0dSvKi8Kn
 EnhQTGRLyr+uhhV5egyizJAnEp04+MtmCvdLECP0gSxlo8xUekmTVyPjEoLNjasQxz7w
 415PkQlEjLK8xpfgp3E8JKllt72IUykHmqmBQY9JNKGYD8+MXGq0LEP2MA41VWaNDkYu
 ikD4yj7JCPYuctXgj177w6duO0SZoGxk29rO10sq6xd8sGEAZbc3zO1fLdVMJTzO1IH6
 y7MojJmidcpDx0YmO2R+tR/s1A3rkmZo43NV1YfABjqNQO/yPYh8wcIFNG9Lm85eqKb4
 g/gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdiV+x7tPc7qR/KvAL5IHxKJh7hH8h29iz01DiA67q+FD95HzVUwkdDamsCvpwdslby2dI1jmaqjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSRmMZqWTyG/LMqWMX725qy9sdY5guYOSUFt4pP47baf5z7RFd
 UWvNtUzNYW03+Ciahhb8C1LCpo6eUdJTzdCNTfPYZU6Mm0vUGvKgfSXE1bK2Sc50wRR0w/Ec+8W
 en11EHMkTbpozaeFQwGkg7Qo+e2PXzsvyNb7kig==
X-Gm-Gg: ASbGncurch50hQ8HB/hAjgl998uJKblHVCZUHa+mNye7U3luJaXUe/wTwctn4guVdEj
 Tw3pArViURUdV6QAKJyM/Ifn520YX2/lguf29
X-Google-Smtp-Source: AGHT+IEGt6OfQFeUdl2dnCUTbJna90fZoStffuKdb/amHUvkirE0mXYEtS1dYZ+9PMXG96Ot/QPVwvp+ateTGZX9k4o=
X-Received: by 2002:a17:90b:54c6:b0:2f4:434d:c7f0 with SMTP id
 98e67ed59e1d1-2f452e22c43mr49131562a91.12.1735305604727; Fri, 27 Dec 2024
 05:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
 <20241211-rk3588-hdmi1-v2-3-02cdca22ff68@collabora.com>
In-Reply-To: <20241211-rk3588-hdmi1-v2-3-02cdca22ff68@collabora.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Fri, 27 Dec 2024 18:49:53 +0530
Message-ID: <CA+VMnFxFBxMXBCiTfJHuMxB1U-zAqBRxeBxMRQWWCE7drr9MgA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: rockchip: Add HDMI1 node on RK3588
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 29 Dec 2024 09:27:47 +0000
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

On Wed, 11 Dec 2024 at 04:37, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Add support for the second HDMI TX port found on RK3588 SoC.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Tested-by: Jagan Teki <jagan@edgeble.ai> # edgeble-6tops-modules
