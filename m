Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0482BE94
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 11:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2961C10EAD1;
	Fri, 12 Jan 2024 10:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B78910EAD1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 10:26:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-336755f1688so5248912f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 02:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705055206; x=1705660006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=C0Lc99ilQ42af+xslRM658d3mAj5DW98oVamnjTJWVg=;
 b=pARCbTic0MHlB1V+Z9bw97S5aYzDQVaYg0G6KL0VUi10TK5fnIWhbw5ZdxJL/5/Dzx
 gqhmv0G5Uh1cIwcFQgn8cb1Ipnya9JGp9qRfzFfF+Iy/P0BfgYfQn2EdoqJxv+iBjHev
 Wjaah+FXVlRuBNc3rIo6qAZ0C7LEXjQGT5WlUQVri5aiMcIYKu0PmcceAy5R47hB2D7K
 fYIqXGX7+fW3pWSg6XIgmH6FW+jrvwBnJZGcozhCgZckxRms8c8KNFUgDlhzmiOCXcYm
 p6EdzkvIErM4C0tiXkEXlOEbd7eWhNxVCq1ZbgkgT0UTTbuUVbRGdcTvC+XBuG+iE3wr
 HikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705055206; x=1705660006;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C0Lc99ilQ42af+xslRM658d3mAj5DW98oVamnjTJWVg=;
 b=oE7900+q6Fsr8gAPfoNzzGR1+PefOYzoNmG4bpcz1ad8tz2Mxa9JKbTaq9gI524aOB
 AQPbLEqk21Jp2PUAJ62LGUzl7P+CsAWcnFiPWy97zQckgmH1K/qQrNO3/WhKaNfvJL+8
 jWszFcdMEMAVYrdSOlLpiVxBIVH2KAjjeIBzHV+LZZHcfD8MbCqfuWrxx+yTaz4mt3Sn
 xeM5cdg6No0c7XNz3m/TDlwyetZghzx6jkGP2D7MIQzp7gaoev3JqJtz5YpSZ2sdGz7H
 JgpPU9IFrjx8K9n58g3RcezpeMBoJQWNn2bw31IUAUcVZDRc3NbC7OCSO8D25Ny9ueHY
 F/xA==
X-Gm-Message-State: AOJu0Yyyc4kbDB+FeSpREvSNOdKo5sRVa6qF5xKgedr0xMozDtDoB4dg
 gDcCdJGJ6mm4Lbr6xRahTAQEcf+kIRBGig==
X-Google-Smtp-Source: AGHT+IEJ0X+IfLsBVCPTmjzGkvUhKKx4wLj7tOWDMjhPq6GtB3+I1Fs/2fvJMVmiCPfL0g/HihfoHw==
X-Received: by 2002:a05:6000:184f:b0:336:5e6c:a1f8 with SMTP id
 c15-20020a056000184f00b003365e6ca1f8mr684134wri.92.1705055206508; 
 Fri, 12 Jan 2024 02:26:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:59d5:231:f1ee:77f?
 ([2a01:e0a:982:cbb0:59d5:231:f1ee:77f])
 by smtp.gmail.com with ESMTPSA id
 h18-20020adf9cd2000000b00336a1f6ce7csm3456348wre.19.2024.01.12.02.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 02:26:46 -0800 (PST)
Message-ID: <f99d363c-d4a6-44b3-8057-3925f8dac1d5@linaro.org>
Date: Fri, 12 Jan 2024 11:26:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
Content-Language: en-US, fr
To: Linus Walleij <linus.walleij@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
 <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
 <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
 <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>
 <CYCLSCKPPBOC.1B1MP3VOOC0Q8@fairphone.com>
 <cdc18e2a-b7eb-4b54-a513-481148fb3b0d@linaro.org>
 <CYCMVXHYVDCI.HVH1TR8MWEUK@fairphone.com>
 <CACRpkdacS9ojXUuogygkz6xxCf3mMq6GG_75sze8ukUu=rxVyw@mail.gmail.com>
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
In-Reply-To: <CACRpkdacS9ojXUuogygkz6xxCf3mMq6GG_75sze8ukUu=rxVyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2024 11:23, Linus Walleij wrote:
> On Fri, Jan 12, 2024 at 10:52 AM Luca Weiss <luca.weiss@fairphone.com> wrote:
> 
>> Since there's zero indication Truly is involved in this panel in my
>> documentation - much less the number 5P65 - I'm not going to add that.

Ack

> 
> OK then, I fold, thanks for looking into it.
> Keep the Himax hx83112a file name and symbols.
> 
>> So in short this panel is the model 9A-3R063-1102B from DJN, which uses
>> a Himax HX83112A driver IC.
> 
> So compatible = "djn,9a-3r063-1102b" since the setup sequences for
> hx83112a are clearly for this one display?

Yep let's settle on that!

Thanks,
Neil

> 
> Yours,
> Linus Walleij

