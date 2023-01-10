Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA21A664280
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 14:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CCE10E5C8;
	Tue, 10 Jan 2023 13:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDC910E118;
 Tue, 10 Jan 2023 13:54:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CBEF2B81674;
 Tue, 10 Jan 2023 13:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4B6C433F1;
 Tue, 10 Jan 2023 13:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673358858;
 bh=8athQYKzItHrIfysk/XYefpT73/HmLvECDAebZyDEbE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F4bUWcF5Om3rHbT5VQh1MbkQav/lohmxw/q6U0CPwebeUqgb8TFfZ+ygbWpVb478H
 GoITDNrceooz9LIpciEmsu4LjAiI/Xn+V+SUTl3KyfwmDfQtaO1ubyB1GOW1Wn39tS
 zGMgIad4wHD6LFkKPLT8dHMk1t2dTGDaNz7F0aWsGJhKZqrBgUXKeig6nkL8QII4aP
 QwD5T0TJMJqmiAPrxlsWpHrAkHCU39gNktjyAoWcoGtkhFhGYjYpMYMnXeX5GywtUX
 ZFR/SJGZA82BPCTFki57S+GCE5aHBDe1Ffj2i55wz6MCUfBluNVI6uwlQN1UxvUb+3
 HjN/17j90EY4g==
Received: by mail-vs1-f53.google.com with SMTP id n190so8415725vsc.11;
 Tue, 10 Jan 2023 05:54:18 -0800 (PST)
X-Gm-Message-State: AFqh2kopB6RDEDqiwsMQzwrPMyWbQyrsLzEix+aplMR2pUFct6X+Lut9
 8WS3RXRN0yFGHrYix2eY+0MQxtp79EAuHhrrCQ==
X-Google-Smtp-Source: AMrXdXvA82g7mwi9IXWmKma4CVZ2hlSkTz0TzYJNaUZEOJlNGxfJo6dNGgiRuG9PLb1REzByty3ZTlUETswh9b5Ge+Q=
X-Received: by 2002:a05:6102:1594:b0:3b1:4b76:5b44 with SMTP id
 g20-20020a056102159400b003b14b765b44mr8655767vsv.53.1673358857070; Tue, 10
 Jan 2023 05:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v3-3-660c3bcb127f@linaro.org>
 <167327376817.61320.5444570222214850129.robh@kernel.org>
In-Reply-To: <167327376817.61320.5444570222214850129.robh@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 10 Jan 2023 07:54:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLEOREcgDcDvT2CSJuAMro_ayJxVt46+ZBritAOGSTQ6A@mail.gmail.com>
Message-ID: <CAL_JsqLEOREcgDcDvT2CSJuAMro_ayJxVt46+ZBritAOGSTQ6A@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: display/msm: document MDSS on SM8550
To: Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 9, 2023 at 8:30 AM Rob Herring <robh@kernel.org> wrote:
>
>
> On Mon, 09 Jan 2023 11:15:19 +0100, Neil Armstrong wrote:
> > Document the MDSS hardware found on the Qualcomm SM8550 platform.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  .../bindings/display/msm/qcom,sm8550-mdss.yaml     | 331 +++++++++++++++++++++
> >  1 file changed, 331 insertions(+)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dts:21:18: fatal error: dt-bindings/clock/qcom,sm8550-dispcc.h: No such file or directory
>    21 |         #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1508: dt_binding_check] Error 2

Now failing in linux-next... Why was this applied before the dependency?

Rob
