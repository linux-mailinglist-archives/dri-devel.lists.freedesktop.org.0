Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3476C80A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D78F10E51C;
	Wed,  2 Aug 2023 08:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E9810E51B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 08:10:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe24b794e5so23124115e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 01:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690963799; x=1691568599;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=l08T2Ya4che/Jgmf1RiO3c/9qzvBKrqZzRNZJZQ5jTU=;
 b=AP2qrRCgodOJfi7wTNlea2flPWh207CAO3pXkgc1g8404I1UE1CoRjyaOS+EblkIuE
 DpQB/8QP5NaZkF/HtoQL9n33+iXAcaXsNpWXB7oFgjYMS45TMLXEDblJLjQOQSzaACG1
 gMaIB0tOoqQrF9Gaq71DeNj4JHZzCoSv5OO8Nv6B7w3BV94gN3QK9+vOzHGV0G1mp23M
 ucQ7R/fhPIQ+D0rnprAp3zxOeIX3rj880oiipBNRIr88pU+CpBRICYv7ldNYb9a83d6/
 l6sgOdOS2RqZWBVLeeB5g92/lAEkFEw0ejPGFJIGnVw35/RRE14s8dP0qwWQbLBE1TL+
 keVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690963799; x=1691568599;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l08T2Ya4che/Jgmf1RiO3c/9qzvBKrqZzRNZJZQ5jTU=;
 b=WamsdGPBaGfybWB/HbJWS6OaEnLKKAnGZvnE0empyhBJWwvg3Tmi8E/ysGwWLC7ahJ
 laodaJWoRv9veJ5+dFJoDNOyltJrTg3DqQDWLQ3LQOUpVIvW9Esbjnn+ecHenvTnGk3X
 vz+Re6oeZr17pC31hBGheImEmksWwvNaGU/DBkQTUCJ7qbsNmNp+8SOHDdOtfUfL0Cz7
 SSyykREnUErgDXgRIhiuYiD92xdkwkJypLIr2ydTJwHpLz9tkMVIA14JRMdV/t76XJRD
 hGSdET4wfz7z4XAcKlHwS0WcUxGy0n58q5xcTjtgHwXCc6DlB889+NDWE+Cu5QuaJItn
 wV1Q==
X-Gm-Message-State: ABy/qLYvj96dq/XoV2kCM0xzFKa+jpvy+DRuA3uvUrQUJ6Tix2D7WAsF
 Ovh5lmbsVQT9jNY6nKpOBVNyqw==
X-Google-Smtp-Source: APBJJlGjbDNLICZHsNDUhuaFTQa5+aL0NsgoSmAxDGgml7L+5MgZ10kVZ8MHdakUQEAQi/Ju98oVIw==
X-Received: by 2002:a05:600c:40c:b0:3f9:70f:8b99 with SMTP id
 q12-20020a05600c040c00b003f9070f8b99mr4209647wmb.7.1690963799559; 
 Wed, 02 Aug 2023 01:09:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 l18-20020adfe9d2000000b003112f836d4esm18210540wrn.85.2023.08.02.01.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 01:09:58 -0700 (PDT)
Message-ID: <64b816c0-b83a-b182-90a8-b7f289d11b7e@linaro.org>
Date: Wed, 2 Aug 2023 10:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] drm/display: add transparent bridge helper
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
 <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
 <9caeb91f-1277-3645-cbbb-7be538d80e2a@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <9caeb91f-1277-3645-cbbb-7be538d80e2a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/08/2023 10:08, Neil Armstrong wrote:
> Hi Dmitry,
> 
> On 02/08/2023 03:18, Dmitry Baryshkov wrote:
>> Define a helper for creating simple transparent bridges which serve the
>> only purpose of linking devices into the bridge chain up to the last
>> bridge representing the connector. This is especially useful for
>> DP/USB-C bridge chains, which can span across several devices, but do
>> not require any additional functionality from the intermediate bridges.
> 
> Can you CC me on the whole patchset ?

Oops I am... sorry for the noise...

> 
> Thanks,
> Neil
> 
> 
> <snip>
> 

