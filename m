Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGLlLyfOeWnEzgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 09:51:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C249E739
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 09:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60D010E28E;
	Wed, 28 Jan 2026 08:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QtYy3W/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B51610E625
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 08:51:47 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4806d23e9f1so7049475e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 00:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769590306; x=1770195106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KkssKX9UZLI3a5TYO9ENZYAnlkONRgQSKBvfWG/TLA4=;
 b=QtYy3W/hBciQGOI8MXGoLhMefOObyBc+RJJbgXEvcn0sXgkQ6w2furN39NoFwHSZEW
 /u2RQV/bOf6Zor5N0gZkNZXN684W5lhrda0Ea2Hc08fSUGm9Us/fuhl5PImDOY30K2gS
 o8U8ZA5YpIARezk4Q/qt+fkO3zp8MVyOzzs2psrsTx0h/oxvCfQbzUVLNv9Xj49WlWQQ
 lBSFjhnI8tZOIWu4Ra09f3GKxL0qj7phSjzz4RZmXGExHPvRsYRjpIfFtKMNDPLPkF+i
 TbgRE1OSucEivGx84N257L1hIKTS4ckUWxknVUBnRY73W7n35Uk271/QxOCuxWY949Nm
 V2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769590306; x=1770195106;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkssKX9UZLI3a5TYO9ENZYAnlkONRgQSKBvfWG/TLA4=;
 b=tIlydGEvDC8LKPqmgtZ8o1IxLvf4ZcXUjNpWT2QoTjUXBQmTVd3gS0JN9jkQGE9Qhb
 /La61EUHvpzUxnW2pQ+edxKzvBVfQCDd9rrp2SKcIX/9Mh8rOJzpXGFn9lvpKjBTraKM
 u5ZTdy4nR5jav81X+z8DxaDV0tZnsxS+STAOfrQPaHxEr7uzWC9RJKiwtmWzirz8E6Bp
 3xZfhvA3q7TCKpnCjP5kcPmjXh5SyYte6YZxvFlj+iBCOG7IA7q750OcXIbUqluuRu4y
 9Ljb5eI5qR6IluGyyvlfoj/e37fHE4dLKz3yHTgrdVHnzE3tooXOamkztCRJZUqd2Xer
 7o5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFewRFqFMaB7thFMlUCBodTpf9Pu3r/BMd9p5rIf2ZDQ8CyvcVkR4wF6mJvrdLtrlGCEYljl3ti/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjhL0YX1uib8BBqBrCHY4WiLvQ/TIH3KoyRBNyxD8sCg9QraZM
 65Z4sbF8KCaJko3K3Xq482VN6wj6kNSbNRPYQLWMiaiQkr7MmNsLuJjeb7ItS++7pL4=
X-Gm-Gg: AZuq6aLLvILGPyjHZn+0v3O70AKDDZfAwNQmfq9b61cT4ydsv9+vttGi0X0vT7VUZB+
 NZlu/a3ry1Xm06z2oZ/MLMER7Jy9346zoQ9o6ETa9ey+nhI4sYaKx39HFHOlV51aYBwFmqyR71e
 O9FOZf3BauT69siKVfCNImGZUx8dff66FLt9J/7gVm2JqTs0azNpODacnGWMzeVkY/teZ1uPVkV
 0nEVsRl2PMRN4k/HG3GUHgvTnOgiUsF7izdtb5tWeG+nMGf+DIx3Xtw5QhCUDPmL0IX0TPWLUiG
 fDHMRw/AX8JLk25IxAkPyZxSecE1nZKMUtqRgttJJ1e5d1wdzxMJ7oKzUzhCJmlgC7OMvP/1Ayy
 TiwVU1BKRsMBjpzhzckUuzGJxYQ7sokTzMtYPakPQ0JQ18FB1xXa4VcyGM8rl5fDgCCuoudhXLe
 ssu3OPJfaPrpBkYaaZDwSpnwv/0Lc8F8qPlBmx69dLeTbuWTif3K1YpbFNPYn0Qfg=
X-Received: by 2002:a05:600c:4592:b0:477:1af2:f40a with SMTP id
 5b1f17b1804b1-48069c5b97cmr56776605e9.17.1769590305903; 
 Wed, 28 Jan 2026 00:51:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:7745:d752:5f0b:2b68?
 ([2a01:e0a:3d9:2080:7745:d752:5f0b:2b68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cddffe9sm66744915e9.4.2026.01.28.00.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 00:51:45 -0800 (PST)
Message-ID: <c3b678ea-fca2-47ff-bc39-72ad498c8641@linaro.org>
Date: Wed, 28 Jan 2026 09:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Manivannan Sadhasivam <mani@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
 <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
 <0104896e-44d0-485a-a44e-694864c819b7@linaro.org>
 <33bbb3ec-5659-4d50-a5ff-dafa44e291dd@rock-chips.com>
 <ppe6w2h32vx2jh73bcv7ip7ubr2wgwjsz4ooruplpx7gx5s4rv@qfasjbocku4r>
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
In-Reply-To: <ppe6w2h32vx2jh73bcv7ip7ubr2wgwjsz4ooruplpx7gx5s4rv@qfasjbocku4r>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:shawn.lin@rock-chips.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:replyto,linaro.org:dkim,linaro.org:mid];
	DKIM_TRACE(0.00)[linaro.org:+];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 75C249E739
X-Rspamd-Action: no action

On 1/28/26 08:57, Manivannan Sadhasivam wrote:
> On Wed, Jan 28, 2026 at 02:22:50PM +0800, Shawn Lin wrote:
>> 在 2026/01/28 星期三 5:53, Neil Armstrong 写道:
>>> On 1/27/26 16:53, Manivannan Sadhasivam wrote:
>>>> On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
>>>>> Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host
>>>>> Controller
>>>>> power control which connects over PCIe and requires specific
>>>>> power supplies
>>>>> to start up.
>>>>>
>>>>
>>>> This driver only handles the supplies. So why can't you use the existing
>>>> pwrctrl-slot driver as a fallback?
>>>
>>> It would fit with no change, but the name "slot" doesn't match the goal
>>> here,
>>> it's not a slot at all, it's an actual pcie IC.
>>>
>>
>> How about renaming slot.cto something like pci-pwrctrl-simple.c, especially
>> if most power sequences fit into this category? This would follow the naming
>> example seen in other subsystems, such as drivers/mmc/core/pwrseq_simple.c.
>>
> 
> Yes. There is no point in duplicating the drivers just for a different name.
> Slot driver is relatively new. So I don't think there would be issues in
> renaming the module name.
> 
> I'd prefer for 'pci-pwrctrl-generic.ko' for module name and 'generic.c' for
> driver name.

Will do

Thanks,
Neil

> 
> - Mani
> 

