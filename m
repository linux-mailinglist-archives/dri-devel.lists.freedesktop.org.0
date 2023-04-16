Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7D6E379C
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 13:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6858110E096;
	Sun, 16 Apr 2023 11:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0084710E096
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 11:02:08 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id fy21so13976770ejb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 04:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681642926; x=1684234926;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4WEBjyty9DFdqOQH0zK6dTdg5jesKwkOh/RLzzQc8K4=;
 b=aULvflOyaSYPx8ovMpRCo9pz0QX6rYvnfEFnSAcXlceTgnefx7dnaBcK1xFz6eJ9rA
 dYatYZgVtjclp3vxTgX/E//i//5qykFtkLGuVhEXsP4fgID4DNfbCo58ujyOc0wQ+v+w
 QTj7y4w+mZRGLT3VVnICZzANcECoa8BXO38YcjscZwooNhfaD4iu8tYz6ZP7B7qWapVh
 LF3wvQHG5q2q0Y3iWTET7Rbnzmz+O2K0ESry66jYtaGFPFpJh/9JNZ7jy690f7QJKuJU
 Fe7WHUi3JoQKTfVLY5YmSFZ5xPfxTB4H3lCgIGOFploepeAVuooDGBN99vEDjmoQ5h+A
 vYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681642926; x=1684234926;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4WEBjyty9DFdqOQH0zK6dTdg5jesKwkOh/RLzzQc8K4=;
 b=I3UugTrBKX8mV0UNhmREjvKlvD0FtDGhgP13WraLN5NcV+yq1+cqmha1CireuQNoWv
 LpADBN3k2VkyXbnwBcdvp9nG7PWZAWkvguhrDajaQZMo97ihzIPGm9TJHGIBkNV0cvnb
 0eaUKkuq1CTncLIRNsvhsOPssLfbt3dV7HkG9vEfgVuiXst5wT8AoO9Tyo7Wp/8wfh0z
 NeS1sVYN0ftMQK0vCS1e5x0B0pyThDbQpESY79h797JvFrYWgPEyJ3UwemLYmbhHibcT
 yHlZ3YQ0Cw1/hWqas9R+qlyB7j0F1qCK7dGvJHvWThnTCnzCFGJugO8BXZ333r1PgaSF
 xjYA==
X-Gm-Message-State: AAQBX9eE6tj3MidFei0IbkbBl/2v7PHm938Pu/XDcAAExadW2uqG4tgA
 z3TGc93vm26F9HdGlm/WiNFjYg==
X-Google-Smtp-Source: AKy350b1E+fZ7aEii7E43vI6XNJJZQzoyIgmsDvGp/Bmzgmo4kBSdXvFFXklgYoiD4Nx/4MnoxRj8Q==
X-Received: by 2002:a17:906:2b0c:b0:94f:3980:bf91 with SMTP id
 a12-20020a1709062b0c00b0094f3980bf91mr2538331ejg.19.1681642925782; 
 Sun, 16 Apr 2023 04:02:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db?
 ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
 by smtp.gmail.com with ESMTPSA id
 ca11-20020a170906a3cb00b0094f14286f86sm2122418ejb.48.2023.04.16.04.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Apr 2023 04:02:05 -0700 (PDT)
Message-ID: <3d5dbf9d-614b-7c36-3467-2e80d5a9c33f@linaro.org>
Date: Sun, 16 Apr 2023 13:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] dt-bindings: panel: Add Samsung S6D7AA0 LCD
 controller bindings
Content-Language: en-US
To: Artur Weber <aweber.kernel@gmail.com>, thierry.reding@gmail.com
References: <20230416100139.13741-1-aweber.kernel@gmail.com>
 <20230416100139.13741-2-aweber.kernel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416100139.13741-2-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2023 12:01, Artur Weber wrote:
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Missing commit msg.

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.


> ---
>  .../display/panel/samsung,s6d7aa0.yaml        | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> new file mode 100644
> index 000000000000..969cef7738b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> @@ -0,0 +1,51 @@
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
> +
> +required:
> +  - compatible

reg?

> +  - reset-gpios> +  - enable-supply
> +  - backlight

keep the same order as they appear in properties.

> +
> +additionalProperties: false
> +

Best regards,
Krzysztof

