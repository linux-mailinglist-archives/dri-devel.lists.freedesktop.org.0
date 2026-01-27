Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP50MvUzeWmlvwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 22:53:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3279AD71
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 22:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5DF10E5C7;
	Tue, 27 Jan 2026 21:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vUmrEN4Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CA310E5CA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 21:53:53 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso63047115e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 13:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769550832; x=1770155632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=S6ONBdBrWL44g/dbc6EELGm2hRjj8YYj2H+Yh0hSCJs=;
 b=vUmrEN4ZZTkz+yhCmxC7kevcJaB1mes0aCkJqMtzZChOOQXElZNFMQHV3oZM+xpv16
 8adoc49/81aw5YTh4PmAK+aWVqrPWGijJe343IMisZjHn/3P8Q8dcxqhGYJuOTs6N52d
 POqlWcrPOPmMsvzgvZ7jjm2664boi2HI1dBfAa7O5usqKFSoXHEmIMA4w9VFK7aklF+5
 JM2wbBamqRZZRAdlbgRkZT92TCiTt7zfxNAd0oYzx191+gbANQQ/ZHgCc2rl03LokXCr
 iAth3VByGSLVNieMWmh86QjX/Wz6YD2w00A3H3FFsWTsZNRh4YTnx6k76ESHk5EM/GrC
 531g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769550832; x=1770155632;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S6ONBdBrWL44g/dbc6EELGm2hRjj8YYj2H+Yh0hSCJs=;
 b=pyNUljBzheDHF6W/ils1dQVcGUetKvuvRihRm9NXyx/9nA8iPdyxLivEKHbIclLoZJ
 ItGzZtz09eNPR+ciygzUmBigsB/nTZ42b9b05wKf4G1ddzgJBzKWwo06Px5SliGWKa4H
 5wmHbJwL3Mo3k/rhcas3wbP2n7m2cmB8aRG+C/H+YfEHn2PMdMD2KZ2oy6WtaejSxyLD
 uY6tMxXQSBANax4nMHC4cjhgDiaKqhhxEfYn79ZDRPZIDlMHR64g4xTUcZkbNKpC7jrD
 JAanoiKiqeVUpzSL3xBCN3Tf/XWxUH0eZJzsbqVnzbJgxL6iXKAriXGK/WeR4dGgBWvN
 RKpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDDL7+LnWGlvpnvWUnTGB8ZiGeirghBQ9V8FpwCZF35rBBXyLBF8VNIKQ4FoGW2gCFhq6QUBmw3iE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkl17KSj+f2yyDe2fWuoQm8UzH8xZXfUIj+WICePFEGf/Zrz4g
 5hdflRYu/pOBWrzd4JwO/ASIMeeWf6x2VDkZiR6i1mUqFFqaFzYtEAcM93SquovGRv8=
X-Gm-Gg: AZuq6aIlBl/JM/bAPjLxuVsiFG23hhUGe5tRV2NfCTCjDUpELR5OShoMoiBP/eRPq7m
 qtVptwHT4Elvia+OKfIvJOJg62WBgu/yrV8eNgQmccHUOIxQ6SLBXNZZMaYYSfE1dp7qF705lzd
 B7Gow7833j36kY477k0rEgqUZN6Ri03aGJtGRiNj5qyo5zU8lZPg31Qi02KFlDNY5I813nlfiyC
 CZOpktWWdQlCWRExrFTHT5GgHZlL7KZF/fdo1vSWLCVr9DoLjTDS5BmGoGGhx7/7rqI3J4NofEK
 vG/ehHUMOyVxH8/uW2QK5tuVCuq5rm9nuyliHid8UGfWs4Y8XVBmY2iefc0YMA2ws+Wg51vMEFs
 j34b/OAztv8WbO3K0B7EiUisBLdQsOrAaaIcGViogLl7tUOb5FDpx5775uTk3l+xdh6y8LPzDag
 RbfhneBZK+7ZPOECrGIeo13DrAhXw7au0swCPXQwYG5c4rhwhd7OpPLCnh5lqG/SzOAnPszbOme
 Q==
X-Received: by 2002:a05:600c:1e1c:b0:479:2f95:5179 with SMTP id
 5b1f17b1804b1-48069c161d3mr43220935e9.15.1769550831789; 
 Tue, 27 Jan 2026 13:53:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:7745:d752:5f0b:2b68?
 ([2a01:e0a:3d9:2080:7745:d752:5f0b:2b68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354205sm1918002f8f.41.2026.01.27.13.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 13:53:51 -0800 (PST)
Message-ID: <0104896e-44d0-485a-a44e-694864c819b7@linaro.org>
Date: Tue, 27 Jan 2026 22:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Manivannan Sadhasivam <mani@kernel.org>
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
In-Reply-To: <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 7E3279AD71
X-Rspamd-Action: no action

On 1/27/26 16:53, Manivannan Sadhasivam wrote:
> On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
>> Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
>> power control which connects over PCIe and requires specific power supplies
>> to start up.
>>
> 
> This driver only handles the supplies. So why can't you use the existing
> pwrctrl-slot driver as a fallback?

It would fit with no change, but the name "slot" doesn't match the goal here,
it's not a slot at all, it's an actual pcie IC.

Neil

> 
> - Mani
> 
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/pci/pwrctrl/Kconfig                 | 10 ++++
>>   drivers/pci/pwrctrl/Makefile                |  2 +
>>   drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c | 88 +++++++++++++++++++++++++++++
>>   3 files changed, 100 insertions(+)
>>
>> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
>> index e0f999f299bb..5a94e60d0d3e 100644
>> --- a/drivers/pci/pwrctrl/Kconfig
>> +++ b/drivers/pci/pwrctrl/Kconfig
>> @@ -11,6 +11,16 @@ config PCI_PWRCTRL_PWRSEQ
>>   	select POWER_SEQUENCING
>>   	select PCI_PWRCTRL
>>   
>> +config PCI_PWRCTRL_UPD720201
>> +	tristate "PCI Power Control driver for the UPD720201 USB3 Host Controller"
>> +	select PCI_PWRCTRL
>> +	help
>> +	  Say Y here to enable the PCI Power Control driver of the UPD720201
>> +	  USB3 Host Controller.
>> +
>> +	  The voltage regulators powering the rails of the PCI slots
>> +	  are expected to be defined in the devicetree node of the PCI device.
>> +
>>   config PCI_PWRCTRL_SLOT
>>   	tristate "PCI Power Control driver for PCI slots"
>>   	select PCI_PWRCTRL
>> diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
>> index 13b02282106c..a99f85de8a3d 100644
>> --- a/drivers/pci/pwrctrl/Makefile
>> +++ b/drivers/pci/pwrctrl/Makefile
>> @@ -5,6 +5,8 @@ pci-pwrctrl-core-y			:= core.o
>>   
>>   obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
>>   
>> +obj-$(CONFIG_PCI_PWRCTRL_UPD720201)	+= pci-pwrctrl-upd720201.o
>> +
>>   obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
>>   pci-pwrctrl-slot-y			:= slot.o
>>   
>> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
>> new file mode 100644
>> index 000000000000..db96bbb69c21
>> --- /dev/null
>> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
>> @@ -0,0 +1,88 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Based on upd720201.c:
>> + * Copyright (C) 2024 Linaro Ltd.
>> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/pci-pwrctrl.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slab.h>
>> +
>> +struct pci_pwrctrl_upd720201_data {
>> +	struct pci_pwrctrl ctx;
>> +	struct regulator_bulk_data *supplies;
>> +	int num_supplies;
>> +};
>> +
>> +static void devm_pci_pwrctrl_upd720201_power_off(void *data)
>> +{
>> +	struct pci_pwrctrl_upd720201_data *upd720201 = data;
>> +
>> +	regulator_bulk_disable(upd720201->num_supplies, upd720201->supplies);
>> +	regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
>> +}
>> +
>> +static int pci_pwrctrl_upd720201_probe(struct platform_device *pdev)
>> +{
>> +	struct pci_pwrctrl_upd720201_data *upd720201;
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	upd720201 = devm_kzalloc(dev, sizeof(*upd720201), GFP_KERNEL);
>> +	if (!upd720201)
>> +		return -ENOMEM;
>> +
>> +	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
>> +					&upd720201->supplies);
>> +	if (ret < 0) {
>> +		dev_err_probe(dev, ret, "Failed to get upd720201 regulators\n");
>> +		return ret;
>> +	}
>> +
>> +	upd720201->num_supplies = ret;
>> +	ret = regulator_bulk_enable(upd720201->num_supplies, upd720201->supplies);
>> +	if (ret < 0) {
>> +		dev_err_probe(dev, ret, "Failed to enable upd720201 regulators\n");
>> +		regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
>> +		return ret;
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_upd720201_power_off,
>> +				       upd720201);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pci_pwrctrl_init(&upd720201->ctx, dev);
>> +
>> +	ret = devm_pci_pwrctrl_device_set_ready(dev, &upd720201->ctx);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id pci_pwrctrl_upd720201_of_match[] = {
>> +	{
>> +		.compatible = "pci1912,0014",
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, pci_pwrctrl_upd720201_of_match);
>> +
>> +static struct platform_driver pci_pwrctrl_upd720201_driver = {
>> +	.driver = {
>> +		.name = "pci-pwrctrl-upd720201",
>> +		.of_match_table = pci_pwrctrl_upd720201_of_match,
>> +	},
>> +	.probe = pci_pwrctrl_upd720201_probe,
>> +};
>> +module_platform_driver(pci_pwrctrl_upd720201_driver);
>> +
>> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
>> +MODULE_DESCRIPTION("PCI Power Control driver for UPD720201 USB3 Host Controller");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>
> 

