Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16CC9BF03E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 15:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC5310E6F5;
	Wed,  6 Nov 2024 14:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mz8ZOuqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B9210E6F5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 14:29:45 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so58643805e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 06:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730903383; x=1731508183; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5wp/RzZ8stukEUo9vqkhB7XdERuVBa+d68xrEXXOPDY=;
 b=mz8ZOuqL1xxNlbcRZvyVSyhcpGo4URwHZYXCZ0DxQNaSfYWvvSXDOyjT6u977uulwZ
 R1D7KoyPgyY/Qz5AQfNeTIRbX7xM0YhYpQWAM85X+cCBNXyCD/DatnPjJujzn33P6BEk
 aUZfpjRFBbgs+Ib9S8Fo3eHcp0F+plejbNmtFr85sC4TK0AQgG8ZfbkZjrdhWAp1iomD
 sxn6moJx+Fporhhtvd/WEDkvi9K+IP2JDBIcKyhqGMsEPywi5wycjIKFtQYrtAvLiwOk
 OYsPU4po11SWrYNwWEsZoPMqPfDN9FRghBqpOd2K0F7ByH5iej0U2ZATTEei2Dlb59Q1
 eFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730903383; x=1731508183;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5wp/RzZ8stukEUo9vqkhB7XdERuVBa+d68xrEXXOPDY=;
 b=OphoPH9Qk3S6dwYKXW7X664XeTxO8jDXzIQC39ExfxVxxtPjnnWiW7Vv5U2gT8lPxt
 YsAjkzi6pWlRnYJYWqqJV/2th3RvhaZbGqOIqUPN5+F4g8uRPgSEguLNJW/MF1tbVqop
 ui/3KZbiaqE/oEw/RYwBJMMjaekInW+53xQTHD0nGYu6osuhUE856oKyFy3r/bTuKj+P
 p5Gc9jT7tvCqqAJ6jFc6Jsbe4GHr8OPXkWRSAQ7WywTt/KIN6txSk1eN0QTPVKhhMQph
 UK4YcSJqSbTBhyUdtCHHd0lE0nu//dGJi7tY4gRWbcT9MY3fFP/oP0nu4esy+6g4T7w9
 Zaew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvAjoULg8CX6XIm7vQ5riyDgToVH0nihPgZ4nkPw4qt5GoX3qeeO4YpFtYWbAjKihM9440lxZCRWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkTsNn4yJsyW5aIPlkxR022tMaUS4dCMdEdPvarKveIrgctOj6
 HXpNPBOgz+LnqfnN32khWs0O+AC161j6uIWX9/Iqmw1oiAl8Vdr5z0ppJff1foQ=
X-Google-Smtp-Source: AGHT+IELNJgIAqVQvwG4qRFfS/gSb6bYG5A4GC+lnpGy7OGO7TJ8U5AU50yDvrEQMVx/t2tbxFlDww==
X-Received: by 2002:a05:600c:524d:b0:431:1d0a:38e2 with SMTP id
 5b1f17b1804b1-4327b6fd392mr210183985e9.21.1730903383376; 
 Wed, 06 Nov 2024 06:29:43 -0800 (PST)
Received: from [172.16.23.252] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6c655esm24752315e9.24.2024.11.06.06.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 06:29:42 -0800 (PST)
Message-ID: <f56bbe18-dee8-44f7-b168-76b8ddab584e@linaro.org>
Date: Wed, 6 Nov 2024 15:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/7] dt-bindings: display: panel: Rename rg35xx-plus-panel
 back to WL-355608-A8
To: Hironori KIKUCHI <kikuchan98@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ryan Walklin <ryan@testtoast.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241105055239.1577275-1-kikuchan98@gmail.com>
 <20241105055239.1577275-2-kikuchan98@gmail.com>
 <20241105141900.GA3110982-robh@kernel.org>
 <20241105-maybe-chamomile-7505214f737e@spud>
 <CAG40kxGhaY_i9_zX_tM4MtCGwUUC2hwpJBAT7XF4Oe6STzA1hw@mail.gmail.com>
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
In-Reply-To: <CAG40kxGhaY_i9_zX_tM4MtCGwUUC2hwpJBAT7XF4Oe6STzA1hw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/11/2024 05:56, Hironori KIKUCHI wrote:
> Ok, Thank you guys.
> 
> Could you help me how to name the new panel YLM-LBV0345001H-V2 for the recent RG35XX Plus please?
> - Use `anbernic,rg35xx-plus-panel-v2`
> - Use `anbernic,rg35xx-plus-panel-new`
> - Use `anbernic,ylm-lbv0345001h-v2`
> - Share `anbernic,rg35xx-plus-panel`

I guess you'll need to use the hw revision:
anbernic,rg35xx-plus-rev2-panel

Neil

> 
> For the last option, I need to use another GPIO to detecting a panel within a driver, but I it isn't robust (depends on the board and circuits).
> 
> Also, there is another panel YLM-LBV0400001X-V1 for RG40XX H/V:
> - `anbernic,rg40xx-panel`
> - `anbernic,ylm-lbv0400001x-v1`
> 
> Any suggestion?
> 
> Regards,
> kikuchan

