Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A72A0008
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776B36ED09;
	Fri, 30 Oct 2020 08:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D11B6ED09
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 08:32:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c16so2134947wmd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BITkCuC500ODL0JuP2zuzkod4jXg6I7qRZoNH9poNhI=;
 b=zYJXgTzijAJG74A0uh7COJBsHV4eLlN9MgjOixTTGOFM9aFNSI+0YAe2uMxjw+T2DA
 3Zx0oXc6el4rAYrDCAh2OJA7RbcemuFcl02RTwDpfKmXT/MBLoz1zcrs0hahY+rZE87r
 Jmd9mwTC8LvLsdHJh7qLYjNsbN0L3jRFdbJyICdtJj3lYcxz4xRH//ESMkgTnmbj7/0R
 Ynb2j5ziPoS7hGb5C5PbRfyj4Ia6YgRW8oXkjPfTVEsZaIsmycWbJcH8KWwlZowJ9jNK
 i+90oYS2+aL4Cqsvws9eWbQyY/PsHk5HLVDvzeASsL/dNZRgraKBNx27rw4kwHUjp95b
 +ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BITkCuC500ODL0JuP2zuzkod4jXg6I7qRZoNH9poNhI=;
 b=MSx2n8qEjT6bDhweEsC29lLLtm3WDFn/9rAGYDcpfz7/KgtyiYLBBwxtafflo5TkTh
 zdUsndQoKZAYJ6oIYLU8y2DWg6jd+viGGEYrY9acS0HMTymI4hi+sDBSiyNZOJqyXIIX
 6V2wqTV3KGJVStqmmWTixaNk+4KepgkzR0NVQNF+B4SRLWg9qtaYHGfxl5WgdGF0Xx58
 8tY8xh3CRMVY5vIJnEtEZPAlkQS5pMsJsrCLHDgYg7RHS7XO7BOX5vu+h8qtRwHuOQ30
 9pyZiF4TqkxFhqaJtNIWrttP9tOMsMTMtYMBDJUzlodmMaavnRrwwbPiEBqjNuf3+5Iv
 t/tQ==
X-Gm-Message-State: AOAM532jbhBzslBlGyqZTaFZ4euyhxrg29oGA3fNY4gpqs/cqfOP3I3t
 dstwTVuBISy1fjmRyC4Q/zgIF7Ie9Co8DQ==
X-Google-Smtp-Source: ABdhPJxzvlf91k/wDaPdEbEN9fcm+qAlvu8eKpNZHpHZUZmNz2cK7hhoQiC6eF2h7P8TByQkbBNdoA==
X-Received: by 2002:a1c:f209:: with SMTP id s9mr1237516wmc.115.1604046762834; 
 Fri, 30 Oct 2020 01:32:42 -0700 (PDT)
Received: from [172.20.10.7] ([37.166.148.232])
 by smtp.gmail.com with ESMTPSA id s9sm11129286wrf.90.2020.10.30.01.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 01:32:41 -0700 (PDT)
Subject: Re: [PATCH v10 2/6] dt-bindings: display: bridge: Intel KeemBay DSI
To: Sam Ravnborg <sam@ravnborg.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604006877-20092-3-git-send-email-anitha.chrisanthus@intel.com>
 <20201029222225.GB904738@ravnborg.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <8e19356f-1394-45ed-1a20-95c1c9fd740f@baylibre.com>
Date: Fri, 30 Oct 2020 09:32:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029222225.GB904738@ravnborg.org>
Content-Language: en-US
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/10/2020 23:22, Sam Ravnborg wrote:
> Hi Anitha.
> 
> On Thu, Oct 29, 2020 at 02:27:53PM -0700, Anitha Chrisanthus wrote:
>> This patch adds bindings for Intel KeemBay MIPI DSI
>>
>> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
> 
> This again matches my understanding of the HW - good.
> 
> One small nit below, with that addressed:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Same, this one is good, Thanks.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>


> 
>> ---
>>  .../bindings/display/bridge/intel,keembay-dsi.yaml | 101 +++++++++++++++++++++
>>  1 file changed, 101 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
>> new file mode 100644
>> index 0000000..4cef64e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
>> @@ -0,0 +1,101 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/intel,keembay-dsi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Devicetree bindings for Intel Keem Bay mipi dsi controller
>> +
>> +maintainers:
>> +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>> +  - Edmond J Dea <edmund.j.dea@intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: intel,keembay-dsi
>> +
>> +  reg:
>> +    items:
>> +      - description: MIPI registers range
>> +
>> +  reg-names:
>> +    items:
>> +      - const: mipi
>> +
>> +  clocks:
>> +    items:
>> +      - description: MIPI DSI clock
>> +      - description: MIPI DSI econfig clock
>> +      - description: MIPI DSI config clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: clk_mipi
>> +      - const: clk_mipi_ecfg
>> +      - const: clk_mipi_cfg
>> +
>> +  ports:
>> +    type: object
>> +
>> +    properties:
>> +      '#address-cells':
>> +       const: 1
>> +
>> +      '#size-cells':
>> +       const: 0
>> +
>> +      port@0:
>> +        type: object
>> +        description: MIPI DSI input port.
>> +
>> +      port@1:
>> +        type: object
>> +        description: DSI output port to adv7535.
> Drop the mention of adv7535 - the DT decide what the port is connected
> to.
> 
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    mipi-dsi@20900000 {
>> +        compatible = "intel,keembay-dsi";
>> +        reg = <0x20900000 0x4000>;
>> +        reg-names = "mipi";
>> +        clocks = <&scmi_clk 0x86>,
>> +                 <&scmi_clk 0x88>,
>> +                 <&scmi_clk 0x89>;
>> +        clock-names = "clk_mipi", "clk_mipi_ecfg",
>> +                      "clk_mipi_cfg";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                dsi_in: endpoint {
>> +                    remote-endpoint = <&disp_out>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                dsi_out: endpoint {
>> +                    remote-endpoint = <&adv7535_input>;
>> +                };
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.7.4
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
