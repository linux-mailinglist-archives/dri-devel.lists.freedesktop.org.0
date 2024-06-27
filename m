Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D576C91B2C1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 01:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34B210E28B;
	Thu, 27 Jun 2024 23:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="GNZ9OK/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jun 2024 23:31:32 UTC
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A28410E28B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 23:31:31 +0000 (UTC)
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719530692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICAp9hfKMLlt54zicEALRnRFEpyeGbOieXNIePqoNoE=;
 b=GNZ9OK/hjojKKCCZocw+iREmnpb37vYRkSFSXwPqL8nb7rqxSxZaUL5+xrDLqnjLif7oEY
 zEENhDMupadjyE57tmxI2vrP+bWvkynFNvw4acwo5Iw9kMwnxrWorwk0bX33aBivpgSsC3
 wpOZyH6UqPniuLxCl21BmdWyaOs+bNDppFXGe0bWbcRIBH6lvPXhPnHguWQdAEiaLG2S0Z
 3WEn6uiVuVFT4DnVCKzdZ+IX4cqAbYh8+WFglwHQfYiVbMv6xfZy2nRFvKR2oCLAcRzIPc
 9AcLPbYDkIQSlhZ2LTDXKkJ/lASwJthjy3VanlZpUsr5ERsf79cD01NzJQVhvQ==
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: andersson@kernel.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
Message-ID: <908e60e3-0922-4dd7-b28b-1d97c6191716@postmarketos.org>
Date: Fri, 28 Jun 2024 01:24:48 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] dt-bindings: panel: document Samsung AMB655X
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-1-388eecf2dff7@postmarketos.org>
 <20240627221255.GA649980-robh@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
In-Reply-To: <20240627221255.GA649980-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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



On 28/06/2024 00:12, Rob Herring wrote:
> On Mon, Jun 24, 2024 at 03:30:25AM +0200, Caleb Connolly wrote:
>> Describe the Samsung AMB655X panel. It has three supplies.
>>
>> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
>> ---
>>   .../bindings/display/panel/samsung,amb655x.yaml    | 59 ++++++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
>> new file mode 100644
>> index 000000000000..eb987d022a0d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/samsung,amb655x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung AMB655X 1080x2400 120hz AMOLED panel
>> +
>> +maintainers:
>> +  - Caleb Connolly <caleb@postmarketos.org>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: samsung,amb655x
> 
> 'x' is not a wildcard is it? Those are generally not allowed.

No, not as far as I can tell. every reference I can find refers to this 
panel as amb655x, there i haven't found anything else and I don't know 
of any variations of the panel.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    description: reset gpio, must be GPIO_ACTIVE_LOW
> 
> blank line
> 
>> +  vddio-supply: true
>> +  vdd-supply: true
>> +  avdd-supply: true
>> +  enable-gpios: true
>> +  port: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - vdd-supply
>> +  - avdd-supply
>> +  - vddio-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    spi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        panel@0 {
>> +            compatible = "samsung,ams495qa01";
>> +            reg = <0>;
>> +            reset-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
>> +            vdd-supply = <&vcc_3v3>;
>> +
>> +            port {
>> +                mipi_in_panel: endpoint {
>> +                  remote-endpoint = <&mipi_out_panel>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +...
>>
>> -- 
>> 2.45.0
>>
