Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803A74830BB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 12:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA4610E1EF;
	Mon,  3 Jan 2022 11:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A14B10E1EF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 11:48:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d9so69476698wrb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 03:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BwVJFEIXJAs7cfXLTAc4v3VJtoIKYaXcasII/IPNDnA=;
 b=tQ8Pkp53R4ay08iKYAuUNUob8te8wxOiHuXxCjh9te4mjHXBD9UQp7cT0dfz3cosTc
 /8ZUBTaSgN2txppOGh6/+S3O2LHmvJqOjp9vR/k5MqFye9PNMrOf7qZUQBvZc+lH/gUw
 xrnAHNW3ioeJaQzlElLfJZu3YbIZN/ziaWFozkH/oTf8J+aQotXBhfPrDji4+SVuUd2r
 dsKp3txVKL97wU+NKW1XQoyBHSLiz/AEr9KfleHe5YBmXwh8nEyt4vcUVq04HNVF7IW/
 GzBoB4H16VSVdaoWUylEDkK7sQomC7YVyAfFGBWZ6pc/D1eDkZoBWVUJf/IQxxSYpAYN
 RWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BwVJFEIXJAs7cfXLTAc4v3VJtoIKYaXcasII/IPNDnA=;
 b=BZjb4Bgq1If3/wVZ5306PxVTTM0C5HX6UBdHz6AX/iOX+CHUddvPINk1Bm8iE6MDJM
 NYNY7KwL3rcIA0oKA6B9pOQCFSjiEXLt5wpeN0/ibDyLZizaA6QXtHOu3p6lKmiXZhxG
 rhN9xL7tShBprCnebKpNSHBWIkIW+aw6KQRKMvSFYDheqaIc19Euswb9BIx5rEnsiWTf
 dTWOyn+t9HTVIBZTaigHGJMhSW1NqtXreZTzdoyFI7EL9zN25gcz4Oce9O3yik4nUfQf
 PDenI+rRI9TlYAC+Rqn1iBV5ijn06SudkWizDgx6lj+lobC16+XclkgeJX15Gb5yIBy1
 03fA==
X-Gm-Message-State: AOAM531nnuKY4f+LzyzHx7o3uifqFjL+XwxtFeaw1fZeWCDl0doiYqi5
 cC/uY++IPxtzSSv8L+eNyw5Wcg3r/e4gVA==
X-Google-Smtp-Source: ABdhPJw7OwfN6X7S9i007ce/9msto/eRkbkgogLSdqKQSZJPOjh+OhOqu6pcu0mZNBgUNP295XhNYQ==
X-Received: by 2002:adf:f94e:: with SMTP id q14mr14845546wrr.526.1641210512248; 
 Mon, 03 Jan 2022 03:48:32 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id s189sm46137699wme.0.2022.01.03.03.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 03:48:31 -0800 (PST)
Subject: Re: [PATCH 1/3] dt-bindings: display: meson-dw-hdmi: add missing
 sound-name-prefix property
From: Neil Armstrong <narmstrong@baylibre.com>
To: Alexander Stein <alexander.stein@mailbox.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20211223122434.39378-1-alexander.stein@mailbox.org>
 <20211223122434.39378-2-alexander.stein@mailbox.org>
 <c4d5d774-6d9a-410d-b651-e452894e99eb@baylibre.com>
Organization: Baylibre
Message-ID: <8009fd8a-f872-f5e8-c13e-f4717ac9e12c@baylibre.com>
Date: Mon, 3 Jan 2022 12:48:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c4d5d774-6d9a-410d-b651-e452894e99eb@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/01/2022 12:32, Neil Armstrong wrote:
> On 23/12/2021 13:24, Alexander Stein wrote:
>> This is used in meson-gx and meson-g12. Add the property to the binding.
>> This fixes the dtschema warning:
>> hdmi-tx@c883a000: 'sound-name-prefix' does not match any of the
>> regexes: 'pinctrl-[0-9]+'
>>
>> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
>> ---
>>  .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml   | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>> index cf5a208f2f10..343598c9f473 100644
>> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>> @@ -10,6 +10,9 @@ title: Amlogic specific extensions to the Synopsys Designware HDMI Controller
>>  maintainers:
>>    - Neil Armstrong <narmstrong@baylibre.com>
>>  
>> +allOf:
>> +  - $ref: /schemas/sound/name-prefix.yaml#
>> +
>>  description: |
>>    The Amlogic Meson Synopsys Designware Integration is composed of
>>    - A Synopsys DesignWare HDMI Controller IP
>> @@ -99,6 +102,8 @@ properties:
>>    "#sound-dai-cells":
>>      const: 0
>>  
>> +  sound-name-prefix: true
>> +
>>  required:
>>    - compatible
>>    - reg
>>
> 
> Fixes: 376bf52deef5 ("dt-bindings: display: amlogic, meson-dw-hdmi: convert to yaml")
> 
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> 

Applied to drm-misc-fixes

Thanks,
Neil
