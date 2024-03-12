Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B142879203
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 11:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E48910E9CD;
	Tue, 12 Mar 2024 10:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wB2MbKhJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7589E10E9CD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:29:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-41333bb74f2so2815815e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 03:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710239342; x=1710844142;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5d4B/pAoZQB5tS1BWWn28qe/xI29Jo7qr/wZ2JnyTFg=;
 b=wB2MbKhJ690UVlGHnIw+z+tZCxC9n+E3o9mXdQWt/UCsPnuCqoJbF7f1pbzJk57V0w
 ZT1CqY05FPZijx5RGDX+Ti4dpnkso2TNDOSjXsfGcwBfBuEuDZjqdWM6g2QMpjSkt+oo
 cfxx+nP6UnnNeAjKbAzQ6WyWKzVXl9Q2vxzeoMvUHHQAJYupXQXwkxPtxOwBhkFl8eLD
 tO7KpRwoXssvzllAffA8edX8T8HsgnNWWO76U1U7QajFb7VKMYpozQjnbxyy92MMG/eu
 PnqZxgnOUsqjndIzVEDfviwjj4bysmfGCo7fiCDDgBJ4YvpCNyEHpXJHVgXatD3ANQ88
 bbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710239342; x=1710844142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5d4B/pAoZQB5tS1BWWn28qe/xI29Jo7qr/wZ2JnyTFg=;
 b=BaxlKADNl/T88g4BqpHQfw4v0D4Yr4AYXXeqmMG4/TRPeM/r8iyjh35I/6oI2dO/Q6
 YNm1ENcCAaqMLICKFwuY3Gu2SR889sQF62Yh9z05okkAM6xbQaffxcT9jIzY3R97vSRy
 Fo/a9Y7w3SFZ6PmzMIGV1zDq5Iq1zzTjDtj304rnq/K6ZN3DMUQYaeji3JNzifrc3HiR
 sWgAPbTh6uuLXcBtwO0pnCI1GVQ4znAcbyUgtyXzqDLwUMF8/+SrfvW7HZOHvmKYt0ws
 xL9OdY1zVYXDJFL+FZp5J6Ir5w62isfQgfnJQxsoYsxwqyMHUM8CVn+HoEMVQlGnetH5
 gvqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxqENYeIs0qBPTZUnRnoVCH2/niFYsYZD79jtZiYQ9fzzrnUWJHTUpeNj5g0xPR9QD/KB4BmqxwuDicXcSBEESyNdP6BGVt+v0lUg4YW4V
X-Gm-Message-State: AOJu0YxW3tWphlusB6O7l4uTYgx8MTcgUX+Q01PZC2mueXXfzCyBYiCT
 PH5qkzub2SdvOH0ObLjLckpXFFTK/gvVjaR0ZCB1z61UKmCANrcu1CTL378GFtI=
X-Google-Smtp-Source: AGHT+IEtUTnilAGbJcn+GRXMX4RNIS078U7C8s6e6rzHKdm5WSpVA53oIuu5hDIUApB8xtk4QdMhSg==
X-Received: by 2002:a05:600c:5101:b0:413:2966:4bfb with SMTP id
 o1-20020a05600c510100b0041329664bfbmr4277240wms.1.1710239341697; 
 Tue, 12 Mar 2024 03:29:01 -0700 (PDT)
Received: from [10.3.5.130]
 (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b00412f428aedasm18656971wmp.46.2024.03.12.03.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 03:29:01 -0700 (PDT)
Message-ID: <88856abb-f5f8-4dbf-9b26-30915bfaee7a@baylibre.com>
Date: Tue, 12 Mar 2024 11:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] net: ethernet: ti: am65-cpsw: Add minimal XDP
 support
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v2-2-01c6caacabb6@baylibre.com>
 <356f4dd4-eb0e-49fa-a9eb-4dffbe5c7e7c@lunn.ch>
 <3a5f3950-e47f-409a-b881-0c8545778b91@baylibre.com>
 <be16d069-062e-489d-b8e9-19ef3ef90029@lunn.ch>
 <f0a9524a-08cd-4ec2-89f8-4dff9dd3e09e@baylibre.com>
 <ff4ba8c9-8a34-41c3-92ed-910e46e1ca99@lunn.ch>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <ff4ba8c9-8a34-41c3-92ed-910e46e1ca99@lunn.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/5/24 17:43, Andrew Lunn wrote:
>> 3) From 2), am65_cpsw_alloc_skb() function removed and replaced by
>> netdev_alloc_skb_ip_align(), as used by the driver before -> res = 506
>> Conclusion: Here is where the loss comes from.
>> IOW, My am65_cpsw_alloc_skb() function is not good.
>>
>> Initially, I mainly created this 'custom' am65_cpsw_alloc_skb() function
>> because I thought that none of XDP memory models could be used along
>> with netdev_alloc_skb_ip_align() function. Was I wrong ?
>> By creating this custom am65_cpsw_alloc_skb(), I also wanted to handle
>> the way headroom is reserved differently.
> What is special about your device? Why would
> netdev_alloc_skb_ip_align() not work?
>
> 	Andrew

Nothing special about my device, I just misunderstood.

Regarding page pool, I now have better performance.
Two things were missing:
- I did not call skb_mark_for_recycle(), so pages were freed instead of
being recycled !
- In page_pool_params, that's better when I specify the "napi" parameter.

Performance improvement is not that impressive, but it's better:
505 Mbits/sec (with page pool) instead of 495 Mbits/sec (without).
There is a ~ 5 Mbits/sec loss due to additional processing in the path, for XDP stuffs.
So, the difference in favor of page pool using is ~ 15 Mbits/sec.

I'll send a v4 soon.

Julien

