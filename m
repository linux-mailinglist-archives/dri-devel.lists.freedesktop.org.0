Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C7B8C8155
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 09:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E7910EDF8;
	Fri, 17 May 2024 07:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AKSLf18m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5CC10EE05
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 07:23:07 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so333976066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 00:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715930585; x=1716535385; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=x/XVqZNav4jeDccL5yKKaBFZcarnd4dPclOkrq6OyOY=;
 b=AKSLf18mZIRgUMV5iw6/d5iTPvEkMUSA3lQ35jcgGMiThWUdQ01afYZdIOemZs2tzl
 FC2aJ5pBnoqyyRuSZE6RtvSNhu6pFCAWppHlc3GtjIFWmmXQVVtBbYMadBKDAv4Xxk0U
 ztNln2hL2qLDO9EcXJ59zGVJcafnCelEiR/cqxT4bMpPqOOcTpfCKGKucj1f+RZTYajq
 dScfRSzrTeVfssxMdnhJXk1I7d7x18H5VIVdkFboytjpH0QAstwF0/7nSsuwaoBgSVhs
 QbegQrg+8vIuAWyJkdqj/KODZUweJ2Rw3GCg5PsPtVoG3x0eWdNySuDSN1Roz8ZkA5uj
 Yzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715930585; x=1716535385;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=x/XVqZNav4jeDccL5yKKaBFZcarnd4dPclOkrq6OyOY=;
 b=ajDav90H5CoF9reoo451JS+F6fleySbvSrSZUxKkY2yYJGOMNeLwIVPO59UOvyvA6e
 YI5mclDHKKEqFaXvYRmJgFI8AVQl4XfUTB5NX4uQ2+GX/eYRP5Gu50hWqnPMF+75Jg0y
 AdOoDgLkxfWf5UBzaC3FuPkZ9GxIt0Bh8On68RUfb3watb31zBHOyAMBTkiUuzVHLXCV
 QwOvfm6+x//qN7SC4WqqTfsJffHK9LC3PKwzIO3a9054MLiwMVkYjhJUlOzCtuUOxqOv
 H1Nuj7fGfXUFtpGpXmEdJcoCGlRy/wrhPAGCaUzAW1gxhyqD0gr+OTxqw+4V6EOAn+t/
 arkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpHyfF6J9Wnh2mce4L00grudN4uXUiO1QG8eiqWGGwX4xMH1cN9+C+crDkAxy7BTqI0CAKbGJB7njDjrXiKRpzWyJzdPzPycbcr/7sI/Fh
X-Gm-Message-State: AOJu0YwxfQO8Nh7Zcr9CduGCGIT1exV5gSkZawZ1BwXTP6QdZzqTg5SV
 80aCsrJ96QasAtd5AqY42z1d9BO3juCNOguP7rG7Zl6IfybETH6pG/cAkjioDws=
X-Google-Smtp-Source: AGHT+IGevcFSUYvf1bUw8ixrHIf9cut7/bdOTveY3eTYS2It7gi7T93mcyQrJSe5Mtp5z+Tw/6Q5Iw==
X-Received: by 2002:a17:906:3512:b0:a59:a282:5dbd with SMTP id
 a640c23a62f3a-a5a2d676474mr2051833166b.66.1715930585310; 
 Fri, 17 May 2024 00:23:05 -0700 (PDT)
Received: from [10.91.0.73] ([149.14.240.163])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d4b2sm1070364066b.27.2024.05.17.00.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 00:23:04 -0700 (PDT)
Message-ID: <244ceca4-0863-436e-bf9e-335ab74d1e67@linaro.org>
Date: Fri, 17 May 2024 09:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v8 0/6] Break out as separate driver and add BOE
 nv110wum-l60 IVO t109nw41 MIPI-DSI panel
To: Doug Anderson <dianders@chromium.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 dmitry.baryshkov@linaro.org
Cc: sam@ravnborg.org, daniel@ffwll.ch, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com
References: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WNgF7X2=Q-yujVfbTpir3-5nN85Gc+hV+xXY6ZOWSwSA@mail.gmail.com>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <CAD=FV=WNgF7X2=Q-yujVfbTpir3-5nN85Gc+hV+xXY6ZOWSwSA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2024 15:31, Doug Anderson wrote:
> Hi,
> 
> On Thu, May 16, 2024 at 12:21 AM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
>>
>> Discussion with Doug and Linus in V1, we need a
>> separate driver to enable the hx83102 controller.
>>
>> So this series this series mainly Break out as separate driver
>> for Starry-himax83102-j02 panels from boe tv101wum driver.
>>
>> Then add BOE nv110wum-l60 and IVO t109nw41 in himax-hx83102 driver.
>>
>> Add compatible for BOE nv110wum-l60 and IVO t109nw41
>> in dt-bindings
>>
>> Note:this series depend Dous'series [1]
>> [1]: https://lore.kernel.org/all/20240501154251.3302887-1-dianders@chromium.org/
>>
>> Changes in v8:
>> - Neil think need sent separately to ARM SoC maintainer with "arm64: defconfig: Enable HIMAX_HX83102 panel patch ", so remove it.
>> - PATCH 1/6: No change.
>> - PATCH 2/6: Fix Doug comment "return ret" change to "goto poweroff".
>> - PATCH 3/6: No change.
>> - PATCH 4/6: No change.
>> - PATCH 5/6: No change.
>> - PATCH 6/6: No change.
>> - Link to v7:https://lore.kernel.org/all/20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com/
> 
> This all looks good to me now.
> 
> Neil: do you want to apply this series plus Dmitry's [1] atop it, or
> would you like me to? Dmitry's series has a fix in it but I don't
> think it's critical enough to warrant the merge conflict that would
> come with putting it through drm-misc-fixes.


Yes, it's not critical enough, I'll apply this one now and switch to Dmitry's one.

Thanks,
Neil

> 
> [1] https://lore.kernel.org/r/20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org/

