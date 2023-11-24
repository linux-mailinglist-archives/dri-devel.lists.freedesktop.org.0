Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD97F76CC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 15:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2616010E7FE;
	Fri, 24 Nov 2023 14:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972A310E7FE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 14:45:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-332e42469f0so1021294f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 06:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700837142; x=1701441942; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=+rlwjJ/KXwyxOs4bJrCX4J/yUIaSw0CZF6vSsHNTewU=;
 b=H5nBEIY2LAU0IQ1cJoj/b+yv+ucAeIjWNBLKCGbWtvqBtsATq4bld3jA5blYOzzxeY
 gyh91BJo0pdjNRhSDdCIq+KFkIwMysr+h1dQIr7SqZ8y/lo+05l1+g5y6ytWLiaVbT6a
 VTsd4Iiu4CjpvyzZgs8e2klnkgFGXzh6LMEwVD4aWL1OUtiXrO+uwJa9aJ47O8Q++7eD
 O6O8cVGuryi4XEoj8bcfoxXPp2giDW43GVhpgjyUfZtXFfR0wwWPt00diW42AE9l7gfQ
 0dtiApu3ekXPOndCh7kgw0QF+LT6DCjAtXiM/WeYqeBI2cpFwWXbWBnYntpcycz+F4rm
 xxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700837142; x=1701441942;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+rlwjJ/KXwyxOs4bJrCX4J/yUIaSw0CZF6vSsHNTewU=;
 b=C1/4VcuFtw00vCa5RWLacVwx6NseJ/HrqlmMTZ7MMIPVxchowADcxx9NHw1goEbjYJ
 9InE/6mc641JbnjTVY/1+GDBHDES+/VrERHqfiA0DuA/8BCJVFtmk7NfdK0YnXVr9BWu
 IAWk/XsZ55BheYk/+2dUe8AKpPwkXtBVygmrtcDvjqHZ+tKh3mzAdA+Xe7dC87AO9rBr
 Q/QFuq0t/Bisr8LVSG0B3cTLjlGWkDhFXw64DpexYLNhZtRomkhn2xJZvhxt2VLQZyoR
 R4WI6RausrczDZShPgupR5TWX5fRnx84SfIk+LTWt7MtuL8kXTT/VBnSAnUoWihMamZe
 GB1A==
X-Gm-Message-State: AOJu0Yy02ByK9CxFLgCMr0hijEiEiJPXH9t5UhedVbfU2yHl746JxXmW
 sMe7p8OJ1Y/pIBc0Ee0YafaUnw==
X-Google-Smtp-Source: AGHT+IGlqE3ztd4VccZrqzlaEyl8+aN4JopsoscrrQaRhl6IxnBq4wdAmomOGsmqb5zRiPTC+v5Seg==
X-Received: by 2002:a05:6000:b4c:b0:332:ca0b:578e with SMTP id
 dk12-20020a0560000b4c00b00332ca0b578emr2125621wrb.27.1700837141963; 
 Fri, 24 Nov 2023 06:45:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4?
 ([2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adffc02000000b00327de0173f6sm4511051wrr.115.2023.11.24.06.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 06:45:41 -0800 (PST)
Message-ID: <5e1479e7-a353-4ccb-93eb-a74efc4bdb17@linaro.org>
Date: Fri, 24 Nov 2023 15:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 11/12] DONOTMERGE: arm64: meson: khadas-vim3l: add DSI
 panel
Content-Language: en-US, fr
To: Maxime Ripard <mripard@kernel.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-11-95256ed139e6@linaro.org>
 <bn5tpzvohmgac4m46fruxbi6quja624tm2fefyj7f3ngo3enno@2ueiodd6qxbd>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <bn5tpzvohmgac4m46fruxbi6quja624tm2fefyj7f3ngo3enno@2ueiodd6qxbd>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Remi Pommarel <repk@triplefau.lt>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 24/11/2023 11:52, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Nov 24, 2023 at 09:41:22AM +0100, Neil Armstrong wrote:
>> This add nodes to support the Khadas TS050 panel on the
>> Khadas VIM3 & VIM3L boards.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  2 +-
>>   arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 74 ++++++++++++++++++++++
>>   .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 +-
>>   3 files changed, 76 insertions(+), 2 deletions(-)
> 
> Generally, those kind of patches still have value. Now that we are
> accepting overlays, could this be converted to one and merged maybe?

Yep I was thinking about that, I'll probably do that,
some new boards will also need overlays for DSI panels.

I'll probably switch to an overlay on v10.

Neil

> 
> Maxime

