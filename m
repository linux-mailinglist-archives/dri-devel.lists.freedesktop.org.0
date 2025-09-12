Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A89EB559BC
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 00:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B802510E05D;
	Fri, 12 Sep 2025 22:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eC/yaKD6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com
 [74.125.224.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8967F10E05D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 22:54:02 +0000 (UTC)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-60170e15cf6so1684691d50.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 15:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757717641; x=1758322441; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H/ALLDcBZ6nZwBY7ZN6L7gT+4ClMkunGI751uMEjico=;
 b=eC/yaKD6COs0bol0T/BHEiE+5wbqQGuaR3906j3rBp7OgVsDlyBA69z+gRzcsMBA02
 /rzuGdn2IXpwITJdx8+9uxgnrcRqfw7E9fZMCNXgT20hii881BdAiJuxPEnySyKIGuYv
 p+Zuj8+yE1+Cw5K38wb/zBE5MD8vsKYd565wXPG/7rhfHc8fgxV8c0//Pt10II3Alafe
 DqZmJpwggTH/urjjK7VcLxaYEaADs7a+TiX3+DYEyG6T1SRd36UKl6tn41EHD34Mgj/z
 l9bvJ9Emw2NUfsjwou/ro03rre6Caf8rNe74AX9EJ7DtgrHPcP2mUViTTGNLnKEf4UrI
 kWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757717641; x=1758322441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H/ALLDcBZ6nZwBY7ZN6L7gT+4ClMkunGI751uMEjico=;
 b=Ay5hmXi56R61gFn/gcmjb5cUotSau18KcT49i2NfkqNy0BOgE1jsLckmRpTZasx5rE
 iKs/a3lewav64A1ysDQ6+wWcEWtclpip19XhAk1p3xXiJBjVb9GgOaZRe09z9ogwx+Iy
 BGmKwmvMDaRZV4R5Tjp0nGUFTd+MkRrUFvnxvNAI4YtvtT4CqZSwONvdziFYcWpmqzvr
 o0Lhsiex7n53qrCvZ4I4hC5XAQORZWD0VLOZT03zLECcpvRK0LtS4rMIJv31Zrdu0Ano
 HNvAVWKSwv0+7pof8cteMSVojtfFkkfv/wrcdyC0RzoFmoPHSJmoTV95BJxii2MmpV6V
 D6rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+j47TbjlNSdO9PLHlq4R9QoJ+MFGTlLsxzA5yGq7L6SLjM/ZGuFD/c3Gg0XGfA0tFy/ss9Kmod7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJAkETzPrqUCtFwNu7msIio7KNpMczBKdCixH1aTlohW/+CGlq
 pIRD9+jZZtIoDcqHg9rCfdEWU30HK5AxmGkfEOOcH7ZO3mIdIf6Qkhk0tGJbPxPYJsdRtw+uHzY
 U4oNgp0ggP404NUMFNnb2Y8ZW+Ts/ixs=
X-Gm-Gg: ASbGncvc1SmSDhfxNCzr7LnaJbUZFr2DyadLqqgJfL8sfyAGoIu56DylHnrprXwbp4U
 O/Wc4FT+CWpYtkKyHrCp2yBw36YUfKlAIJrLIIQR4vv8k3ZvQHe3Wg3637NQrWgCDstjJPjkvuV
 vhEYgSZs6iR3/EejZLMTyKisWELx66Ww2JWFD8Fc+Beo+7tJ6wmFJGSU3XM98IeHK15FoLmV4rz
 BYDOAXiGhrAiO7yC89GpP4+q/X0qqsa9B/uasZ4GCAcJP10HlJNBoeQDSQLkFHD9ort+0DNRggp
 CVUqNIQ=
X-Google-Smtp-Source: AGHT+IGmrPKfHKqLuLVsedBSU1D7fMJ0SPSt1pUu9IK0SCtyHO6OiaCBaQyBDxty6OWXlqg3nf3oT3Kb2tAQnhUAUk8=
X-Received: by 2002:a53:7101:0:b0:626:842f:818c with SMTP id
 956f58d0204a3-6272297979cmr3570059d50.24.1757717641302; Fri, 12 Sep 2025
 15:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-9-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-9-779a8a3729d9@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 12 Sep 2025 15:53:50 -0700
X-Gm-Features: AS18NWAVsbHM7asbGyyRZapaZP5ufrQUasUcMY0V45b2pm9dui9MQp5I0XZOq0k
Message-ID: <CAPaKu7TEN++z8r68k_4-iCyMLMthqJBUX35pgXupAHPdfttrYg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/panthor: devfreq: add pluggable devfreq
 providers
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
<snipped>
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/=
panthor/panthor_devfreq.h
> index a891cb5fdc34636444f141e10f5d45828fc35b51..94c9768d5d038c4ba8516929e=
db565a1f13443fb 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -8,6 +8,7 @@
>
>  struct devfreq;
>  struct thermal_cooling_device;
> +struct platform_device;
>
>  struct panthor_device;
>
> @@ -43,6 +44,19 @@ struct panthor_devfreq {
>         spinlock_t lock;
>  };
>
> +struct panthor_devfreq_provider {
> +       /** @dev: device pointer to the provider device */
> +       struct device *dev;
> +       /**
> +        * @init: the provider's init callback that allocates a
> +        * &struct panthor_devfreq, adds it to panthor, and adds a devfre=
q
> +        * device to panthor. Will be called during panthor's probe.
> +        */
> +       int (*init)(struct panthor_device *ptdev, struct device *dev);
> +
> +       struct list_head node;
> +};
On mt8196, we have performance-domains to replace several other
properties: clocks, *-supply, power-domains, operating-points-v2.
There are also quirks, such as GPU_SHADER_PRESENT should be masked by
GF_REG_SHADER_PRESENT. It feels like that the scope of
panthor_devfreq_provider is more broader, and at least the naming is
not right.

Another issue is I am not sure if we need to expose panthor_device
internals to the provider. mtk_mfg accesses very few fields of
panthor_device. It seems we can make the two less coupled.

I might change my view as mtk_mfg evolves and requires tigher
integration with panthor. But as is, I might prefer for mtk_mfg to
live under drivers/soc/mediatek and provide a header for panthor to
use in soc-specific path.


> +
>
>  int panthor_devfreq_init(struct panthor_device *ptdev);
>
> @@ -57,4 +71,6 @@ int panthor_devfreq_get_dev_status(struct device *dev,
>
>  unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
>
> +int panthor_devfreq_register_provider(struct panthor_devfreq_provider *p=
rov);
> +
>  #endif /* __PANTHOR_DEVFREQ_H__ */
>
> --
> 2.51.0
>
