Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458C56E7FB4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B6C895CA;
	Wed, 19 Apr 2023 16:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB9B895CA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 16:33:59 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1a6ebc66ca4so1354995ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681922039; x=1684514039;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hejd87Jll0E8NOGuMljt4taTMik1yKpFSOJV8ogm+QU=;
 b=otvUaF7ejsijSly4r1bE5p0DcDAEY+dCK+KVYM+TKOnGIRDPkokhlWhv1Y4lwB+ZkJ
 J+rF08EQd1xv3uuCAYfuKfepDM3Eusu6Uzl+SkCDbVx4j8Kn6sz+XuG7ALq2caYTgvj8
 08wPhYvwIHTxLDZdYdxa2Xd5iDpIHEpZDQQLzd8+mvwCpOCz+WsrdOTTJ2/6cA9LYgzN
 7NDAmo86b0SDi1sLACOkw9YxuxQHprwevC+PiLw6AfCihrx2IR9ovUWUsBFPeUWvsix0
 FhdUPHDgv7r1UhOtdh8KkQQQN/cNQEWYyJrQZ1/9O7ON5XBMjvxAcMuAzNGWcDRBFKOz
 QhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681922039; x=1684514039;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hejd87Jll0E8NOGuMljt4taTMik1yKpFSOJV8ogm+QU=;
 b=CW8BTMKMDNeGVaCZQ+DVFTKg1G8UUBaixcUVyrkjstmNPh1hMbiQ3Ad7T5CoCQOt7z
 cu3VmySeDJdKf+7dtuX+xwaeLhYO2/+zrD4Mb5qPA/saEtsxng42WMVpgQvbhWq6Ih59
 JwANuLDP/eNAVVVdw9PKZzQJSqYD+wIM3hSO8fXqbWJvOx3QeIBOy8R/n/PHwSYpJI+v
 GNEqY8HiuQiYc3uDKoyRUpRDwmrFrB9g8g0rqoY2OnL7g6EEmWaAaaDiw4XwuvHQyORo
 BR3clPhL3gbR3gx+IUvfHu6BLY4/fZNc7ia9sToTNMv2emYC7v1a0fwDmuxvCLXq7TVR
 g5Ew==
X-Gm-Message-State: AAQBX9dQh/q1f8SRLla8DJGpayFp9vhAvAlRqpvCfgM2omLmLMtz4FQZ
 DNBot7XUxMcoQ+RFtm4aZHs=
X-Google-Smtp-Source: AKy350Yh+6NbKPw4KD+UsFvenBCaCDaUcheuDcqPn53EST9vXg5qyuw0UcOKYiNkqaXz2dPOz64XMQ==
X-Received: by 2002:a17:902:f689:b0:1a6:f5d5:b80a with SMTP id
 l9-20020a170902f68900b001a6f5d5b80amr7744678plg.38.1681922038707; 
 Wed, 19 Apr 2023 09:33:58 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 p10-20020a1709026b8a00b0019a6cce2060sm11631338plk.57.2023.04.19.09.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 09:33:58 -0700 (PDT)
Message-ID: <932bb2c6-71ce-525f-fbb2-a0a742ee8e12@gmail.com>
Date: Wed, 19 Apr 2023 09:33:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next 3/6] net: bcmasp: Add support for ASP2.0 Ethernet
 controller
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Justin Chen <justinpopo6@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, bcm-kernel-feedback-list@broadcom.com
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
 <1681863018-28006-4-git-send-email-justinpopo6@gmail.com>
 <03dadae3-3a89-cdb0-7cd1-591d62735836@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <03dadae3-3a89-cdb0-7cd1-591d62735836@gmail.com>
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 sumit.semwal@linaro.org, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/23 23:35, Heiner Kallweit wrote:
> On 19.04.2023 02:10, Justin Chen wrote:
>> Add support for the Broadcom ASP 2.0 Ethernet controller which is first
>> introduced with 72165. This controller features two distinct Ethernet
>> ports that can be independently operated.
>>
>> This patch supports:
[snip]
>> +	intf->tx_spb_index = spb_index;
>> +	intf->tx_spb_dma_valid = valid;
>> +	bcmasp_intf_tx_write(intf, intf->tx_spb_dma_valid);
>> +
>> +	if (tx_spb_ring_full(intf, MAX_SKB_FRAGS + 1))
>> +		netif_stop_queue(dev);
>> +
> 
> Here it may be better to use the new macros from include/net/netdev_queues.h.
> It seems your code (together with the related part in tx_poll) doesn't consider
> the queue restart case.
> In addition you should check whether using READ_ONCE()/WRITE_ONCE() is needed,
> e.g. in ring_full().

Thanks Heiner. Can you trim the parts you are not quoting otherwise one 
has to scroll all the way down to where you responded. Thanks!
-- 
Florian

