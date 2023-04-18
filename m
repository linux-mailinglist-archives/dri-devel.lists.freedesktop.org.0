Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ADB6E6F02
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 00:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD9910E06A;
	Tue, 18 Apr 2023 22:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806D910E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 22:01:08 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-38de3338abeso565380b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 15:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681855266; x=1684447266;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kUZCWdrMpmE98XPzyUWaFXep+TFtMG1Cry/8zBfjR0s=;
 b=RxBBu7aiPUw3ha2NHUTEJMAZfGeWym8WoEgYa+IPQ/BoeBBpbTifsTF04k/qXKomu3
 9QzKe81Q4Ngjk6lU7MMgfnOUrFIYuArtF3vN56LUL4Bpot7CA7CB7Puzpdg+JdhZ3N2I
 sQ+eio4DUVtyzjOGvMGZOenPpYQWHTbmqQtDOgVzV/1mWMt+XLhOs3qcUKWipJEI0mGg
 BBtcuuyuUB66uxA27UlFAq3qsrETIl4NX1yhNMEawVXN072yriu5QgXoKPF/SywSF1/m
 8Z8U8nnPsHDc9wJoXOMzCfSIoMUsS6ngbIIREySBP15K73bJ2Y11wbqWk9PAzFfWLzCl
 aPvg==
X-Gm-Message-State: AAQBX9dcxMHNu87y9ocRYOo1148fOXzHszHZz6XmL0mWuYRer9YRzhVR
 fHYOMYGd4VliuhMYgEDfuAMo4IZXnA==
X-Google-Smtp-Source: AKy350bRDGYoUZLL6UJSFAz/QGM86RSeA9S9WXw1mapesHioxAxgjrNaBWUK+XbvQYlQk51Aa60Nmg==
X-Received: by 2002:a54:4f12:0:b0:389:1fcb:f327 with SMTP id
 e18-20020a544f12000000b003891fcbf327mr2042229oiy.26.1681855266449; 
 Tue, 18 Apr 2023 15:01:06 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l83-20020acabb56000000b00383ef58c15bsm6344895oif.28.2023.04.18.15.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 15:01:05 -0700 (PDT)
Received: (nullmailer pid 2401434 invoked by uid 1000);
 Tue, 18 Apr 2023 22:01:04 -0000
Date: Tue, 18 Apr 2023 17:01:04 -0500
From: Rob Herring <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: panel: Add Samsung S6D7AA0
 LCD panel controller
Message-ID: <20230418220104.GA2387740-robh@kernel.org>
References: <20230416131632.31673-1-aweber.kernel@gmail.com>
 <20230416131632.31673-2-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416131632.31673-2-aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 16, 2023 at 03:16:30PM +0200, Artur Weber wrote:
> Add bindings for the S6D7AA0 LCD panel controller, including the
> S6D7AA0-LSL080AL02 panel used in the Samsung Galaxy Tab 3 8.0 family
> of tablets.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changed in v2:
>  - Updated commit message
>  - Applied suggestions from Krzysztof Kozlowski
> Changed in v3:
>  - Correctly applied suggestions
> ---
>  .../display/panel/samsung,s6d7aa0.yaml        | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> new file mode 100644
> index 000000000000..079e2b3a9eaf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6D7AA0 MIPI-DSI LCD panel controller
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6d7aa0-lsl080al02
> +
> +  reg: true
> +  reset-gpios: true
> +  backlight: true
> +
> +  enable-supply:
> +    description: Enable supply

Comments on v1 apply here.

Rob
