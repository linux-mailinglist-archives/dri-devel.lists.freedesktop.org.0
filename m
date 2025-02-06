Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F3A2AE97
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 18:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E76E10E8EA;
	Thu,  6 Feb 2025 17:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="V5ezvY2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840E110E8EA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 17:13:05 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401c52000dso1206404e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738861979; x=1739466779;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2RdyVj5jOCd3ia3pc2+O1XE+ZT30tuGGwdgIs4fbdI=;
 b=V5ezvY2gsDpfIrJ2QmihjBa7CYQ23/A5ZwZ64Zfd6D/i/+0aEeSAGQj1C3N+RZD06t
 G1Ac7pA5Tq5xEUoCN+XFSZxfkuB+wZq1AxOn9+5SK6MnsKaI48VU21tOOIBTqpCdLbm8
 gx0XjBp3A+v4+6AWhYKx/r1hrD0hny0XhQp4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738861979; x=1739466779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2RdyVj5jOCd3ia3pc2+O1XE+ZT30tuGGwdgIs4fbdI=;
 b=X57x52fpCiNt4jYvffktyI4kEMK1WO/UTNlgxCV4IEcMI3TvEOJe9hmxPASRt4QpvZ
 30j+omM3T68lGTkbSeEjnouMas7rAvnWXwtuzvdnPNzOXfciVHZYcz+8/jHhDKWvlmYA
 uh3n/umCA7Vz28z8UhjzHkferkR2rIaArvefFhiuWqYfMGQpqUPmLWRScmFU+ACViGIK
 /aZoFA3YHZmTmKwnQ15fGgVJ8WgkVShp7I+GzhHzWNakEwHYFPJj6b7Dsu888D6lgy8o
 GGXU2Sws/jJJj7toMWYgBByXw1xrqlXX+DNfFwFAN5VV5On8/KNnYpFmwO+owcfxtIIu
 yiLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz70RzlRJv2zRv9nKc0FMsTRI12vSJE2D0jBwIlgadx1itQHrTnrrP4/vJhKSqImWUP1NukeDPfFQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzeg01vshzSoHq5QjU2GdBoPWQjFTFP7Hp9tcXiHYhRX4lZxSJn
 yiUT4Fa5XK+XKL+DAT6EU6Btnl3Au6oPxPRrc9C53VJ4pBWZd5rUhqlXbTrz8FaQTG7Y/xXRrqv
 KNA==
X-Gm-Gg: ASbGncuhVtsVA3UpbOJe+1La9Aq6Yr/FfoqaOGnKek5Df97joon1Y7vjzs1wvGYdZQj
 Ifh/sx+P0NIcwpBtPfI/yyT4xckRBFyn2e5zjoQsEL3YalkqyWHRZV1e15rbcxkV5D/QyS4wxWD
 PgoNnHQ0pZA7fKn79xr+ZOQPa5LTI7Py7D7wUTil3VRCWv0n6+OnOq/7aQEkE+bwE9QwmC2in0E
 71ELgBk/o741MEo0FNhzD3jY8pWntaqQ2e02xQmxRGymYFfbD5ihlWN5FkqNdLdyoVuyjgT4Z2Z
 68eNAwIAtd8ARq2q6fzWyZ+baZZzZepg7jrSIvCneKaVbEUNmglCgcw=
X-Google-Smtp-Source: AGHT+IFoV9Waf++nXxTBVw9MpHVVgfY+6D6wdIM9yGG/uBxqjMKd040lxJ+vk5kKl1SVmXLZB3ZiPg==
X-Received: by 2002:a05:6512:3989:b0:53e:368c:ac48 with SMTP id
 2adb3069b0e04-54405a02565mr2901201e87.11.1738861978736; 
 Thu, 06 Feb 2025 09:12:58 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105bf583sm180410e87.145.2025.02.06.09.12.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 09:12:57 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so1316419e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:12:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXn370CPhfPNGqNFHfypgiiqNhxjIPUPVBQXOEU6WCPtm50yd/3wSjRMHVkPUY3BdpadBesyKc3LDY=@lists.freedesktop.org
X-Received: by 2002:a05:6512:118b:b0:543:f1a0:9e88 with SMTP id
 2adb3069b0e04-54405a67331mr3046321e87.32.1738861976679; Thu, 06 Feb 2025
 09:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:12:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com>
X-Gm-Features: AWEUYZkoK-bVDmYrUZC5ORoOtjHMjmCrwad94ZOQdmJPAxCPBnzPQFDM-XcGn8w
Message-ID: <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor: add csot
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add "csot" to the Devicetree Vendor Prefix Registry.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 42d14899d584..375f1f7c79ef 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -336,6 +336,8 @@ patternProperties:
>      description: Crystalfontz America, Inc.
>    "^csky,.*":
>      description: Hangzhou C-SKY Microsystems Co., Ltd
> +  "^csot,.*":
> +    description: Guangzhou China Star Optoelectronics Technology Co., Lt=
d

Doing a `git log` on
`Documentation/devicetree/bindings/vendor-prefixes.yaml` shows that
most patches use the subject prefix `dt-bindings: vendor-prefixes`,
not `dt-bindings: vendor`. If device-tree folks care about this
difference and they don't want to fix it when applying, they might
request you to send a new version.

In any case, that's fairly minor so I'm OK with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I would assume this will go through the DT tree, not drm-misc. If this
is wrong then someone should shout.

-Doug
