Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047D7729F3E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA2A10E6CA;
	Fri,  9 Jun 2023 15:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1EB10E6CE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 15:53:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b1a3fa2cd2so21566921fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686326016; x=1688918016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DMFU7gvOxv0Laf+NqNgw9EhezlbxvSrT/pgc5FmWwXw=;
 b=PjJpV43ObmBJdXY9mVzLFJgcKDTFzy7Xvu8J9jCCUrOFGRg/NVVze/aga7w+qOupti
 /NreS0vuK4r7YdoENnIOCpP8SqsU2g1qqPxoECWyQp/AJNP/WtZrdVWpnyvnShQ5MJSl
 JjGIEJzMeP+k/jObZmfhjq8vFp8NiLDwKvEidoaQGOLhwFvFwRcX+z1cPu6xsDiKcOyn
 J+6mJDcOs9syb0JxKuotiavaI0ISaA99Jmabk6wfyBlE2CewK6cKFntghCNd6KPZi4zs
 yhJn4n7NB4WuV7u2j9HjsyEVAPpEqSL0Je9B72ZSWq9BCFaVvrEClA+TQPok5iVtjNP7
 tECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686326016; x=1688918016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DMFU7gvOxv0Laf+NqNgw9EhezlbxvSrT/pgc5FmWwXw=;
 b=VK5J41AR4NwsWGvGZfYMp7hrg4wJ7ew1zhptL2OGvG8tj2JS0Ah4onWlza+vYazpOx
 /K1dehBBsLksiwhw4YThBMv4gbeZgBlrmba0bMsKI8DvLXl/tSjaJO+E3bWhMcr7d/+u
 8unDWbKTQEvLyyQZRJS+GHb6l1G6AyiIGjDRZcPpYgk8ima6eoJdyRf0qohOGo6XYNRt
 DoObOO6BkHjFnXAayYjHch4qEPFKIQjUSS48yIR5diUcPyDL1ZwWlAP2OdbfaTcNCuVD
 csobkezCHFd9f0Ls8NslVXel1BN3FNN9jAIueIWovVQOylhqB7BQz0N0CgxrvdlTpWNe
 mOkg==
X-Gm-Message-State: AC+VfDw+rXYPD4QMe8wZU68dDHqkV/SJGonFTfpS7iovCpIVT3AoH2bS
 HsCbbzfUj1hzhqFPkRltnb94cA==
X-Google-Smtp-Source: ACHHUZ4e7h2+3Yc1DxCts8RfOHM+dn3h/OabUHaXGBivkFeLqK63t4mxMQYCl4yBs68bnTzwhE9k9g==
X-Received: by 2002:a2e:8256:0:b0:2b1:c0d3:72cb with SMTP id
 j22-20020a2e8256000000b002b1c0d372cbmr1304978ljh.23.1686326016262; 
 Fri, 09 Jun 2023 08:53:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a170906548200b0096f5b48fe43sm1434344ejo.47.2023.06.09.08.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 08:53:35 -0700 (PDT)
Message-ID: <218bad0d-483a-5338-c140-2d0fcf280f20@linaro.org>
Date: Fri, 9 Jun 2023 17:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 01/10] dt-bindings: HID: i2c-hid: Add "panel" property
 to i2c-hid backed touchscreens
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607144931.v2.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2023 23:49, Douglas Anderson wrote:
> As talked about in the patch ("drm/panel: Add a way for other devices
> to follow panel state"), touchscreens that are connected to panels are
> generally expected to be power sequenced together with the panel
> they're attached to. Today, nothing provides information allowing you
> to find out that a touchscreen is connected to a panel. Let's add a
> phandle for this.
> 
> The proerty is added to the generic touchscreen bindings and then
> enabled in the bindings for the i2c-hid backed devices. This can and
> should be added for other touchscreens in the future, but for now
> let's start small.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2:
> - Move the description to the generic touchscreen.yaml.
> - Update the desc to make it clearer it's only for integrated devices.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

