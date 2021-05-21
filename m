Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE238CF50
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CC66F908;
	Fri, 21 May 2021 20:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1C76F908
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 20:47:27 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso19210586otn.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 13:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=dYhHh2N5/BbBDzRScwyDT6UGP42NCelTyfQOlKbNWa8=;
 b=S66NPmA5hXpPQJrbhlMt6rPjOccvyf+YXO6JPVv56ruBBJ17JtSY0raGmbyqACW3gQ
 gDJMwA4ApfKdh//eEfk7BHcDLsW2bZqTIN/OZUKZWjoJNuZnykFwEMuf6EDpDKqENRlr
 4xg5bfSiioKwSxl42LUcMavE/OA8djWui3960=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=dYhHh2N5/BbBDzRScwyDT6UGP42NCelTyfQOlKbNWa8=;
 b=WLTIUb6+9rmRcJkjNhN0DmIlFqoduwWbKrX3uQVB6VtZ49zy9IWEhJ1Rdo6VgOFUYP
 5wictEi7Nlb+aiqyoyMMkkd9qDpb0ifD+h/zeBOLPPwqNx0Hu4mB8vUu4CrsjanPDCbi
 AYgioMLUTsWhU+prHFlJfwofy9VBjWz05Z/4HGOYK+Y0pLcEjL0uPdaNR0s5VD/Cbly+
 iiSMqxxC5o3rhvaSEs4fns3Yss7CTTOfs7ktiKGgqXMb0HvzLag2xY2ipu3rHU4VU5T6
 9qcXwsN4s9pvWdghj7HQYDlzgS/BDtg0Jq3Q30ZqR4QgRHYY5Znw8ou63uBwjCvb519F
 B5OA==
X-Gm-Message-State: AOAM5324iq9sWZrAa06f3O9Kv7uJ3PeEobhJOsc2xuWvqo1s7tygF5f8
 D2OHhqYn08Wk4fd9mwnPceY2w3RpaXo6rq0VMYGbxg==
X-Google-Smtp-Source: ABdhPJz+JJOIpV6RZGO/eMKZRAblLrt35dmkVW4AwlTQKTX4/fVtOr8x4eA6TlVIEmbCop6phgIUkgO5I2bbahLV1S8=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr10150209otn.233.1621630047237; 
 Fri, 21 May 2021 13:47:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:47:26 -0700
MIME-Version: 1.0
In-Reply-To: <1621592844-6414-2-git-send-email-mkrishn@codeaurora.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-2-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 13:47:26 -0700
Message-ID: <CAE-0n52BO3VoDHvwENWQdcbWDeVjNgApdd+_i96FPVFhzeHA=g@mail.gmail.com>
Subject: Re: [PATCH v17 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 bindings
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: vinod.koul@linaro.org, dianders@chromium.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, khsieh@codeaurora.org, robh+dt@kernel.org,
 tanmay@codeaurora.org, kalyan_t@codeaurora.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-05-21 03:27:22)
> Add YAML schema for the device tree bindings for DSI
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in v1:
>     - Separate dsi controller bindings to a separate patch (Stephen Boyd)
>     - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
>       a single file (Stephen Boyd)
>     - Drop supply entries and definitions from properties (Stephen Boyd)
>     - Modify phy-names property for dsi controller (Stephen Boyd)
>     - Remove boolean from description (Stephen Boyd)
>     - Drop pinctrl properties as they are standard entries (Stephen Boyd)
>     - Modify the description for ports property and keep the reference
>       to the generic binding where this is defined (Stephen Boyd)
>     - Add description to clock names (Stephen Boyd)
>     - Correct the indendation (Stephen Boyd)
>     - Drop the label for display dt nodes and correct the node
>       name (Stephen Boyd)
>
> Changes in v2:
>     - Drop maxItems for clock (Stephen Boyd)
>     - Drop qcom,mdss-mdp-transfer-time-us as it is not used in upstream
>       dt file (Stephen Boyd)
>     - Keep child node directly under soc node (Stephen Boyd)
>     - Drop qcom,sync-dual-dsi as it is not used in upstream dt
>
> Changes in v3:
>     - Add description for register property (Stephen Boyd)
>
> Changes in v4:
>     - Add maxItems for phys property (Stephen Boyd)
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add reference for data-lanes property (Stephen Boyd)
>     - Remove soc from example (Stephen Boyd)
>
> Changes in v5:
>     - Modify title and description (Stephen Boyd)
>     - Add required properties for ports node (Stephen Boyd)
>     - Add data-lanes in the example (Stephen Boyd)
>     - Drop qcom,master-dsi property (Stephen Boyd)
>
> Changes in v6:
>     - Add required properties for port@0, port@1 and corresponding
>       endpoints (Stephen Boyd)
>     - Add address-cells and size-cells for ports (Stephen Boyd)
>     - Use additionalProperties instead of unevaluatedProperties (Stephen Boyd)
>
> Changes in v7:
>     - Add reference for ports and data-lanes (Rob Herring)
>     - Add maxItems and minItems for data-lanes (Rob Herring)
>
> Changes in v8:
>     - Drop common properties and description from ports (Rob Herring)
>     - Add reference for endpoint (Rob Herring)
>     - Add correct reference for data-lanes (Rob Herring)
>     - Drop common properties from required list for ports (Rob Herring)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
