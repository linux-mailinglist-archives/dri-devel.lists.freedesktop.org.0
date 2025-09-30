Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FA0BAB236
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 05:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9449310E26E;
	Tue, 30 Sep 2025 03:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ch+IIanV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ED110E26E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:15:07 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4dac61ed7a5so46205371cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 20:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1759202106; x=1759806906;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKvNIqyQStmqM1bZBXJ3keviMu+G7jno5fFKkr2O1vg=;
 b=Ch+IIanV6IjiWsVqqvF1N4kT9q6667C+BYb0VdOdLkfUQnSSOqK39iaFwUKv/dZ9MA
 idRqrlYhk0CNH8KIeOnORYHUUTxjDWZiyqUny+T2cGW1LSvCx2W0m8nJu4ZgQnToVbfu
 jaJE2HdqujJsVIWB3KZ3ALdy+erJ+OUE7F8M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759202106; x=1759806906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gKvNIqyQStmqM1bZBXJ3keviMu+G7jno5fFKkr2O1vg=;
 b=YKvKrtFtDESA+q/y7jw4Gb9bCWdAQ1zUzCt4CyxA4TK271tgEhjSvSO7ogcXeTSgq2
 jKuODFI77M396tch6XMzdyKS3mnYWfWAAf/2GcSkiJHo422qN8ifaVlvu4HSHrCkcCjL
 wQ5Vnnj2LdjRLBkWQyyQofWD4YDTW/ilVXX8YtkSmuYDx/COpHur/UJs1gpMQtQ7L43+
 Nm3os8IAtsvWF/gX76ceIocuRiYkTIozGmLC8e3xc5G2xvXcAj5nhlBgiXeqF8EPtCHn
 vusKzgC+9GIZCNWEHcywTIVdRzCiE+C1a4ONtJ8zjy8J4E3yCxHMtjBLWsAz+KpD7bJi
 0HVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXepb7f1cWF3lPIN8uWxoqU/J8kS0rm2I+5uR8xhaft8HA+GIZ8V5M0fCzOYdeNdknwBdez12zceMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwntMQC2kEG/XFHdDjHF47xj7GBB5ifmYy89bE+GbDNM+CzNORb
 MreFq2CLRs45h4/+u31zJma1FFZ13nF8+vnuRJxweLlDwyvBUBPmAK7qhsR1U3LRHUjvM+QToo1
 hHIM=
X-Gm-Gg: ASbGncufMVNBx/cuWDURCEz3RPR2+eR1KjdMmUz8HKc1r67zuOsoW0+T08KH6xFNuAR
 i0rtv7D0CaH2UUQFCjjKW08cKSLkEPOama0HKMDe0Y86zSN9wD/wIjTwtFFxZtbn8IkChhuxZi+
 yxE31PldKeamUllMVKZlLS7hr8nw/vlpidmm3wmPYJux6sbNvyLqc8m+5HROP7L7DD0P2ncPKji
 ZsZ7VZNLU0YLFQdNFF61BtimXhVaqZ8irDgdGcz/kfscN9LtoWJnq99hjGd9k14teoEfokvDFWf
 pNrm9cOVnn5BsqB3aweXmEM2NnEQJC3eHQrfK5qI6n4XnefX0Rbd1/ytTSo2HXKlyhaY+YLMg3y
 rjVj0OcCqaIlnKiGEI8NMYoDTKrUfco2xVFRtQoycjlbfevbWN6XykauIRHR4zcTUZcO7wMR4dY
 2U52lQNxCF9dPpDwPOB1If
X-Google-Smtp-Source: AGHT+IEGqbSVlPseoucfWTUDA5MhiN9cdwz2H7UgJvl8HoBK4b9tzlek8QNmgczl0kKbIdznIa2uRw==
X-Received: by 2002:ac8:5852:0:b0:4be:9bd8:96f0 with SMTP id
 d75a77b69052e-4da4cd47641mr243513651cf.71.1759202105902; 
 Mon, 29 Sep 2025 20:15:05 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com.
 [209.85.219.42]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4db11cd52e5sm92410131cf.47.2025.09.29.20.15.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 20:15:05 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-81fdd5d7b59so39428086d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 20:15:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXgiArzO6YWURXOB6mZjqlqZ90pJtHQATVg9bp44blMCo5nQTz7xAthYE3AAbWFqNJYajYdJan/FHA=@lists.freedesktop.org
X-Received: by 2002:a17:902:f64b:b0:275:f932:8636 with SMTP id
 d9443c01a7336-27ed4a2d54fmr206796235ad.38.1759201634408; Mon, 29 Sep 2025
 20:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-2-clamor95@gmail.com>
In-Reply-To: <20250929142455.24883-2-clamor95@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Sep 2025 20:07:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
X-Gm-Features: AS18NWCupJdoWovR_kE0x_uWeV-e4Q15rTRpmAHzxBq1v_8sPWAFlU2cXRm8lAs
Message-ID: <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
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

On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:
>
> LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which i=
t
> clearly is not. Address this by adding the proper schema for this panel.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++++
>  .../display/panel/panel-simple-dsi.yaml       |  2 -
>  2 files changed, 60 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld=
070wx3.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.=
yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> new file mode 100644
> index 000000000000..0a82cf311452
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LG Corporation 7" WXGA TFT LCD panel
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: lg,ld070wx3-sl01
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +  vcc-supply: true
> +
> +  backlight: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - vdd-supply
> +  - vcc-supply

I suspect you'll get a NAK here because you're not preserving backward
compatibility for existing device trees. While there can sometimes be
reasons to do that, you'd need to provide a very strong justification.


It seems like instead of breaking compatibility you could just have
two supplies:

* power-supply - The name for the "dvdd" supply.
* avdd-supply - The name for the "avdd" supply.

...and then you make both of them not "required". Maybe you'd add some
documentation saying that things might not work 100% correctly if they
weren't provided but that old device trees didn't specify them?
