Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B99796592E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 09:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087B610E844;
	Fri, 30 Aug 2024 07:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jpXZmDM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C71710E844
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 07:56:19 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-371aa511609so965793f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 00:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725004578; x=1725609378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=X1prRTYEw/dR2iNXrq6uyuvXqssAgDAZDj++lBKGGe0=;
 b=jpXZmDM7np+TltyF/Kfdgwsflg/mcOTfBKMujdGhmzJvyiBRFULRRUKl4g+KUlsicN
 68XlJnCPuLzTFauNKro9KussPyloPkqZmstJxdMOawPVGhfcAoSlkLkcxXIO/JU1+Ssx
 GwXNZoci4/RjUuh4Odb7+tB6DyZ1RiYZ/p88iyd6kLlA4S0kUmeHqZ0k6W5CHC7YotDy
 s24DVfize4P87T0hpogo3cc3XTwUtUTMlXwqtBUA0aFvJAyYzMxnn+rHCgWQ170+Cl+g
 qNxA/pZOQC2WSee5jGFwFPzptb+De4eI4I+is4JYO5mqmVfjuTNro9tMWi/31C6/Y5ET
 tZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725004578; x=1725609378;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=X1prRTYEw/dR2iNXrq6uyuvXqssAgDAZDj++lBKGGe0=;
 b=jlPq+eA86CIKQir1olImWwOMTtVwcsVFZK/dDPSkg1r7kTVkIwiJyayJFMMV2dpI0T
 otdluEboDZ8MrFTQ0YVu/BhQlcfLhg1jd+ab26g1loDfddbDgy9C+MpQWbfcOpmRvPL+
 lvRjxD59Xo/NUQb2FEOmrfr4lUm+UYWbbTHrOUDecPAnXI5T1CdyN1CTYc3WUT8YEDJE
 BpE17okAFcS4rBBPZyvmb5D9hSOAHlltRUM+wmWDeZzOGw+eZxXzUT7GBdUuaOZ+NCWL
 rHsb4ZEwsPamLTA00OTrhJZEQ6NNMi3wv1Z3LA3eBb16NPsJn1FKkEGO/u4bhBSCt/z7
 XhcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoqGB1b64Wr2nZLpgqQw++/KuDq9nOOSEJXBFVdMgoXzacFz5xaMp/VR1gOMV9bk9fEX81hRwYg5Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw61k7y/xzgFoyRcnFFvRdX6V6zZnwhwNy03dx5mNIcDqGKYmhF
 4G3ULEQudRkCSjog75IkobD9Gsa0LvtYRLNmnxor4QYDxblqxYmOd4ma0rFaeiA=
X-Google-Smtp-Source: AGHT+IHLuGOim1LCIhPMC+XHJ10NBeR3BMcRWNnP5UEmIMd+pWkdGHYUqbIKwW/TUWZLTVcfTZQ94Q==
X-Received: by 2002:adf:9bc7:0:b0:368:37d7:523f with SMTP id
 ffacd0b85a97d-374a9564aaemr888931f8f.13.1725004577010; 
 Fri, 30 Aug 2024 00:56:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5001:8e1b:dd18:1d3?
 ([2a01:e0a:982:cbb0:5001:8e1b:dd18:1d3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ef7ea62sm3249376f8f.76.2024.08.30.00.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 00:56:16 -0700 (PDT)
Message-ID: <e9f5f554-b773-4a16-97b7-331fa3c179d9@linaro.org>
Date: Fri, 30 Aug 2024 09:56:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Rename WL-355608-A8 panel
To: Ryan Walklin <ryan@testtoast.com>, Maxime Ripard <mripard@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
References: <20240828-aboriginal-vivid-goldfish-3ee4fc@houat>
 <8490347B-2729-4B79-869B-FFCE41E0A7F9@testtoast.com>
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
In-Reply-To: <8490347B-2729-4B79-869B-FFCE41E0A7F9@testtoast.com>
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

On 30/08/2024 03:43, Ryan Walklin wrote:
> 
> 
>> On 28 Aug 2024, at 7:07 PM, Maxime Ripard <mripard@kernel.org> wrote:
>>
>> ﻿On Tue, Aug 27, 2024 at 06:28:21PM GMT, Neil Armstrong wrote:
>>>> Thanks both for the further feedback, agreed logical to use the
>>>> device vendor and panel serial number, ie "anbernic,wl-355608-a8".
>>>> Will post a V2 with a comment to that effect.
>>>
>>> Well in this case we can keep "wl-355608-a8", because the panel vendor
>>> _is not_ anbernic.
>>
>> And it's not a generic or ubiquitous device either. We've been over
>> this already, anbernic is the best we have.
> 
> I don’t have a strong preference either way but agree the anbernic vendor string is the best compromise.

The only valid compatible with anbernic would be to use the exact device in use and not a wildcard,
so you said the 3 devices using this panel are:
  anbernic,rg35xx-2024
  anbernic,rg35xx-plus
  anbernic,rg35xx-h
you should introduce 3 compatibles:
  anbernic,rg35xx-2024-panel
  anbernic,rg35xx-plus-panel
  anbernic,rg35xx-h-panel

but it's duplicating for nothing, to you should use fallbacks for 2 of them to have in DT :

  anbernic,rg35xx-2024-panel
  anbernic,rg35xx-plus-panel, anbernic,rg35xx-2024-panel
  anbernic,rg35xx-h-panel, anbernic,rg35xx-2024-panel

and only use anbernic,rg35xx-2024-panel in the driver.

In this case bindings should be like:
   properties:
     compatible:
       oneOf:
         - const: anbernic,rg35xx-2024-panel
         - items:
             - enum:
                 - anbernic,rg35xx-plus-panel
                 - anbernic,rg35xx-h-panel
             - const: anbernic,rg35xx-2024-panel

(of course I selected rg35xx-2024 as the primary one, it could be another, usually the older one)

Neil

> 
> Regards,
> 
> Ryan

