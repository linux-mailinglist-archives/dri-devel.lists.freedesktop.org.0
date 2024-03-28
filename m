Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BBE88FF12
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 13:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9C810F5CC;
	Thu, 28 Mar 2024 12:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="p6mhDEu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606610F5CC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 12:34:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41549a9dcbaso1843905e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 05:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711629262; x=1712234062;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qWn4vKf6jmo6u/KAkidvDYA7hMTdnPHRFemGgPWSlIk=;
 b=p6mhDEu8TxASRqSuJgfT03ZOIG87HzioENIxAAYgRBgu+TOLVFI1qpD28d7cVS+Ta6
 L2KcUhk301V23dJYSDXzDmxMLUDklFzE4GkbXXQY7vzc8Jq2nWODUfJ84mJPYvuuAAlh
 dZPSviiBcHrpXpanMqVBUnrLgQ26BtTBFZrPlxKPNWFtmutW8ayOVUAz0MPorAmz32ou
 mjl3cLmuy+Esdjj5Tw3gBqR0OTH5PsI1i4DTvAyFFd36q9wDWfj0a2EZe0S7SdL46YTD
 bM747sPf0fblhudrlJdkuUleXYAOnUl9flpYRFDLzE7qgFp05x1eaAeERNcPeOcWEnPv
 tUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711629262; x=1712234062;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qWn4vKf6jmo6u/KAkidvDYA7hMTdnPHRFemGgPWSlIk=;
 b=n9A7zq7E/gRmCG+g/X0iBscW5rZzZVaaRqCVXZ/lQKwKkgTo6LjykYjrRnvUsCRZJe
 BzHPwkXg6gg9CHBGQKEEpqWw9dI/1o5GHRfUrEYodoy1Mg9Hctv2Hc292+cJcoEDtt3R
 py/PK/BOCnDlI3sh2d2KuZTi/pvOaOebj0OQ9uqsqovh2TH/neGgq/7sPdAYsCUtVeQw
 9sQMuYP1JN4YNn21ekwpqwPyvA6yAeCp2lVtNBUcPdYxBlOHfOYWMZ1U8udiz6+nBv7+
 hZVdqvGdXMfWB0tMXaP7CZAbqqqMK1mfjYis4VUeH1LxGT13H4cgMOIgGgFeKeBJkWdi
 eVmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWruhNWIF1CWPgeWJF2ef90s406CtsAbka49mvahhoWfy1zeoPZGJgLY6EohirJeIJ4pcd/qpcxlKwBQaPdB0xB+ICeE/6Ur+RtDvp+FLen
X-Gm-Message-State: AOJu0Ywd8jfJ6nRkX4Vl/VIK5YuQSdx4si/e6897KhT4LjM6LJMG8+f1
 i4xGkh8aiETDG9LdMufWadIs0KqCZXzwhSPKzChy+ZB2ocChHM+h8IXCu+GfGWI=
X-Google-Smtp-Source: AGHT+IFLB/cUHJWkbnWrK10eduOa8rRtXuIj5s2I8YXRQ+IvMFyMnMJuaj5WaCt6J4TWoyPiuBZHlA==
X-Received: by 2002:a05:600c:45ca:b0:414:8948:621c with SMTP id
 s10-20020a05600c45ca00b004148948621cmr2473201wmo.8.1711629262250; 
 Thu, 28 Mar 2024 05:34:22 -0700 (PDT)
Received: from [10.1.5.112]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b004154399fbd9sm2287689wmb.45.2024.03.28.05.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 05:34:22 -0700 (PDT)
Message-ID: <34f9a771-08dd-4db6-9790-cc5f70f707c7@baylibre.com>
Date: Thu, 28 Mar 2024 13:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 3/3] net: ethernet: ti: am65-cpsw: Add minimal
 XDP support
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v5-3-bc1739170bc6@baylibre.com>
 <20240328114245.GA1560669@maili.marvell.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240328114245.GA1560669@maili.marvell.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/28/24 12:42, Ratheesh Kannoth wrote:
> On 2024-03-28 at 14:56:42, Julien Panis (jpanis@baylibre.com) wrote:
>> This patch adds XDP (eXpress Data Path) support to TI AM65 CPSW
>> Ethernet driver. The following features are implemented:
>> - NETDEV_XDP_ACT_BASIC (XDP_PASS, XDP_TX, XDP_DROP, XDP_ABORTED)
>> - NETDEV_XDP_ACT_REDIRECT (XDP_REDIRECT)
>> - NETDEV_XDP_ACT_NDO_XMIT (ndo_xdp_xmit callback)
>>
>> The page pool memory model is used to get better performance.
>> Below are benchmark results obtained for the receiver with iperf3 default
>> parameters:
>> - Without page pool: 495 Mbits/sec
>> - With page pool: 505 Mbits/sec (actually 510 Mbits/sec, with a 5 Mbits/sec
>> loss due to extra processing in the hot path to handle XDP).
>>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>> ---

[...]

>> +static struct sk_buff *am65_cpsw_alloc_skb(struct am65_cpsw_rx_chn *rx_chn,
>> +					   struct net_device *ndev,
>> +					   unsigned int len,
>> +					   int desc_idx)
>> +{
>> +	struct sk_buff *skb;
>> +	struct page *page;
>> +
>> +	page = page_pool_dev_alloc_pages(rx_chn->page_pool);
>> +	if (unlikely(!page))
>> +		return NULL;
>> +
>> +	len += AM65_CPSW_HEADROOM;
>> +
>> +	skb = build_skb(page_address(page), len);
>> +	if (unlikely(!skb)) {
>> +		page_pool_put_full_page(rx_chn->page_pool, page, ndev);
> Is it compiling ? third argument should be a bool.

Thank you for the time you spent on this patch.

Yes, it is compiling.
This was intentional but it may be unclear indeed.
I'll make the bool using more explicit in next version.

