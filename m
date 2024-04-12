Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35E8A2FFB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 15:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944D610F666;
	Fri, 12 Apr 2024 13:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Lm8eiVdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E6310F677
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 13:56:44 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-417db45fe01so6622455e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712930203; x=1713535003;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zrjbXKaxgzuudx1KFjcy8ipDh+5BgoB+83OYFc6KOZE=;
 b=Lm8eiVdK7oq/zNAzaefU1ydRYCO347oMOB/qAF9CgvtDN4j+n0g998y+5wDCciLeFb
 CmFVU8YQ0MtcKGhKbidXP12c8/0RKgNysBUX6Wga4FpyHql05Kwk9ncetzVGRQ48z/st
 C2ZbZfD5OXmHZdhg7Mqzj2MyJq5Z7OH3xn8Eksjhhuj+4h+rNAaUbiGkeFIeoW7cSUjQ
 Y7KrL+1M7xPd/cg4b+IWt8BuFqEnrvbi6TaogFR3WKmw/9jX3GGB2qBxsTdQvaJrR0kC
 lBmEpmOE/mbZemTjF5HjQhMRbb/rRiOK983bQ4dGubI23ItuYIvb3T9BrHHc595ENym2
 S+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712930203; x=1713535003;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zrjbXKaxgzuudx1KFjcy8ipDh+5BgoB+83OYFc6KOZE=;
 b=u4GekhMGHhXk7S4dzlsMG9YexUVON7K4dOPE+RvvWs7RGoGdPLwTPhe+5pBu25jwrc
 p14IIk+tzh2R6PIgd7LL6G6jcrE7208TiMeVsGkbKvTF0srgQOHHp+6SewMNgxxY4Quv
 PliIKeoZzWHZF1MHgnkV6Am+hqfHHXQgoxmVeTKZzMxI4Ec6H7qvdQH1kspTAJlOm+DS
 zfuFVQsuz/vn7QiiPGlgRfNVm3wsPsUXdydtPdixvt57vyBER9YBnTSmX3O5Sg6z/F/n
 ItGa3hqVcUgruWNaIAp1sMTWFwkp9rahxDVZ8yjeqCQracvKuR2TUfQlVwgYBBkIpCX6
 GjrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0G20uT6/IqHCXXgQvhz2TvXFtvkNacmP0B0idbovcE1pxxBiR9JSn8rKNjrWYm24cb8aoJck8gCu1qKUBjNRbxluOzHvURIgUWV8/H9m8
X-Gm-Message-State: AOJu0Yx2gh82nk4N+MQLx2HmpIzJQRIoZILzVOx84sATzaXj4C81w1SZ
 fCnlR/q19AHn/bilITIanQ7N1fuN8hDVMMVYDOj0xP/pKYnBwDdqxqioiYH6xy8=
X-Google-Smtp-Source: AGHT+IE1aY0YK7X0UJIUMl5mWoMpDtrMWQ0+qMn5m3POIXuadH+CZf6hfbFKu6ceJnAKhtbnKRpYGQ==
X-Received: by 2002:a05:600c:3d0f:b0:417:e6e6:a314 with SMTP id
 bh15-20020a05600c3d0f00b00417e6e6a314mr2197591wmb.14.1712930202832; 
 Fri, 12 Apr 2024 06:56:42 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.74])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c1d9300b00417fd9c2d01sm2183249wms.3.2024.04.12.06.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 06:56:42 -0700 (PDT)
Message-ID: <16790d82-e134-4a3b-b67e-d56c041362c0@baylibre.com>
Date: Fri, 12 Apr 2024 15:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 3/3] net: ethernet: ti: am65-cpsw: Add minimal
 XDP support
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Naveen Mamindlapalli <naveenm@marvell.com>, danishanwar@ti.com,
 yuehaibing@huawei.com, rogerq@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v8-3-f3421b58da09@baylibre.com>
 <20240409174928.58a7c3f0@kernel.org>
 <9cb903df-3e83-409a-aa4b-218742804cc6@baylibre.com>
 <20240410080225.2e024f7c@kernel.org>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240410080225.2e024f7c@kernel.org>
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

On 4/10/24 17:02, Jakub Kicinski wrote:
> On Wed, 10 Apr 2024 16:02:00 +0200 Julien Panis wrote:
>>> You shouldn't build the skb upfront any more. Give the page to the HW,
>>> once HW sends you a completion - build the skbs. If build fails
>>> (allocation failure) just give the page back to HW. If it succeeds,
>>> however, you'll get a skb which is far more likely to be cache hot.
>> Not sure I get this point.
>>
>> "Give the page to the HW" = Do you mean that I should dma_map_single()
>> a full page (|PAGE_SIZE|) in am65_cpsw_nuss_rx_push() ?
> Yes, I think so. I think that's what you effectively do now anyway,
> you just limit the len and wrap it in an skb. But
> am65_cpsw_nuss_rx_push() will effectively get that page back from
> skb->data and map it.

That's much better indeed, with the implementation you suggest: 600 Mbits/sec
instead of 500. I did not expect such improvement.
I'll send a new version when I finish retesting.

