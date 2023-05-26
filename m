Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F085712F1E
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 23:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603AB10E0D3;
	Fri, 26 May 2023 21:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CAD10E83F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 21:46:36 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-625c0926741so8277506d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 14:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1685137595; x=1687729595;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pYqgVdXYfmIowi27pF4hbBK4J4uvgY6jOd1xyfeXS3M=;
 b=Mu9y4rT7Z1Lr73KR6pAKnbcY4/iW2HFmYoinUPipsiDhZDyV5dvD68FZyyqbnjxEzI
 v2B1uK7X7erYL4mkx+9+S+723WB4TFCbEe13GpeiGgEz/NpbDtG9HjhaUCXV3t/cBrk+
 n1WRlUIgqIN6wddnzC0BoQXmoQwBw0nsKO/RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685137595; x=1687729595;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pYqgVdXYfmIowi27pF4hbBK4J4uvgY6jOd1xyfeXS3M=;
 b=WKFZVwM2IlMXkotTT5474W2fn3484Gdw/zjad3AETUVjmiLHwHYXjHtoLIUDAEl92f
 e89ejlczAolH9Ihm+WhEhw19no22vvUFpFboUOR+msxBXKc7OG4O/+uBFjbs/KQpJzeD
 c8zZoiOtfIN9GXX5LIj7s7wxnXEwJZD6avDVQOFFEyrmDL8Dl9rjvSFMmHtCrOdgui5S
 WO3ikPUYcpTOHuFVSmNsdt69ILuPw64ROBaL2CXMzvlDAlfn26ZdxQs+uqZ0Y9g/jytA
 YVjTNOfcOxD/MtUtfptMBgMHMy5doB/azdAHBcP10UOnIZz6c5z5yL3iojhDmF1mHAQk
 ktBw==
X-Gm-Message-State: AC+VfDzVlGAjgboBpDP1Q9syOVdNyCMVW0ZtiKcgxCsBsSBG4EPHck0v
 EW8G9i3x2EsYxXzzG0Cm8gS4hw==
X-Google-Smtp-Source: ACHHUZ4YpFhjfwjTMTaB4BhpA42uDMWVCFllzXTJd8TXlEX58XG7NS0QutRyUjHLqY/6XVUpFBuOVA==
X-Received: by 2002:a05:6214:e4c:b0:626:cbe:3c6d with SMTP id
 o12-20020a0562140e4c00b006260cbe3c6dmr2140675qvc.22.1685137594877; 
 Fri, 26 May 2023 14:46:34 -0700 (PDT)
Received: from [10.69.71.77] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a0ce0d0000000b0062593051073sm1504220qvk.111.2023.05.26.14.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 14:46:34 -0700 (PDT)
Message-ID: <e0b4ef62-2d80-d5b2-e0b0-b15c00b75143@broadcom.com>
Date: Fri, 26 May 2023 14:46:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH net-next v5 3/6] net: bcmasp: Add support for ASP2.0
 Ethernet controller
To: Jakub Kicinski <kuba@kernel.org>
References: <1684969313-35503-1-git-send-email-justin.chen@broadcom.com>
 <1684969313-35503-4-git-send-email-justin.chen@broadcom.com>
 <20230525205454.1c766852@kernel.org>
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20230525205454.1c766852@kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000c2551b05fc9fabad"
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, andrew@lunn.ch, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, edumazet@google.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, simon.horman@corigine.com,
 christian.koenig@amd.com, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000c2551b05fc9fabad
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/25/23 8:54 PM, Jakub Kicinski wrote:
> On Wed, 24 May 2023 16:01:50 -0700 Justin Chen wrote:
>> Add support for the Broadcom ASP 2.0 Ethernet controller which is first
>> introduced with 72165. This controller features two distinct Ethernet
>> ports that can be independently operated.
>>
>> This patch supports:
>>
>> - Wake-on-LAN using magic packets
>> - basic ethtool operations (link, counters, message level)
>> - MAC destination address filtering (promiscuous, ALL_MULTI, etc.)
> 
>> +static netdev_tx_t bcmasp_xmit(struct sk_buff *skb, struct net_device *dev)
>> +{
>> +	struct bcmasp_intf *intf = netdev_priv(dev);
>> +	int spb_index, nr_frags, ret, i, j;
>> +	unsigned int total_bytes, size;
>> +	struct bcmasp_tx_cb *txcb;
>> +	dma_addr_t mapping, valid;
>> +	struct bcmasp_desc *desc;
>> +	bool csum_hw = false;
>> +	struct device *kdev;
>> +	skb_frag_t *frag;
>> +
>> +	kdev = &intf->parent->pdev->dev;
>> +
>> +	spin_lock(&intf->tx_lock);
> 
> What is the tx_lock for? netdevs already have a tx lock, unless you
> declare the device as lockless.
> 

Will remove.

>> +static void bcmasp_tx_timeout(struct net_device *dev, unsigned int txqueue)
>> +{
>> +	struct bcmasp_intf *intf = netdev_priv(dev);
>> +
>> +	netif_dbg(intf, tx_err, dev, "transmit timeout!\n");
>> +
>> +	netif_trans_update(dev);
>> +	dev->stats.tx_errors++;
>> +
>> +	netif_wake_queue(dev);
> 
> If the queue is full xmit will just put it back to sleep.
> You want to try to reap completions if anything, no?
> 

I can remove the wake. As you mentioned it won't do anything here. There 
isn't anything to reap if we are in the timeout condition. If it is some 
HW stall, we could flush and restart the ring, but if that is the case I 
rather figure out why the HW is stalling. I think we can leave it as a 
"tell the user we are stalled" and leave it as that.

>> +static struct net_device_stats *bcmasp_get_stats(struct net_device *dev)
>> +{
>> +	return &dev->stats;
>> +}
> 
> you don't have to do this, core will use device stats if there's no ndo
> 
>> +	ndev = alloc_etherdev(sizeof(struct bcmasp_intf));
>> +	if (!dev) {
> 
> *blink* condition is typo'ed
> 

Oops. Good catch.

Thanks,
Justin

>> +		dev_warn(dev, "%s: unable to alloc ndev\n", ndev_dn->name);
>> +		goto err;
>> +	}
> 

--000000000000c2551b05fc9fabad
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
NhTY3E+cXCB11wty89QStajwXdhGJTYEvUgvsq1h8CwJj9w/38ldAQf5WjhPmApYeJR2ewFrBMCM
4lHkdRJ6TDc9nXoEkypUfjJkJHe7Eal06tosh6JpAgMBAAGjggHZMIIB1TAOBgNVHQ8BAf8EBAMC
BaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJlLmdsb2JhbHNp
Z24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYIKwYBBQUHMAGG
NWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwME0G
A1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxz
aWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly9j
cmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3JsMCMGA1UdEQQc
MBqBGGp1c3Rpbi5jaGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSME
GDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUIWGeYuaTsnIada5Xx8TR3cheUbgw
DQYJKoZIhvcNAQELBQADggEBAHNQlMqQOFYPYFO71A+8t+qWMmtOdd2iGswSOvpSZ/pmGlfw8ZvY
dRTkl27m37la84AxRkiVMes14JyOZJoMh/g7fbgPlU14eBc6WQWkIA6AmNkduFWTr1pRezkjpeo6
xVmdBLM4VY1TFDYj7S8H2adPuypd62uHMY/MZi+BIUys4uAFA+N3NuUBNjcVZXYPplYxxKEuIFq6
sDL+OV16G+F9CkNMN3txsym8Nnx5WAYZb6+rBUIhMGz70V05xsHQfzvo2s7f0J1tJ5BoRlPPhL0h
VOnWA3h71u9TfSsv+PXVm3P21TfOS2uc1hbzEqyENCP4i5XQ0rv0TmPW42GZ0o4xggJtMIICaQIB
ATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhH
bG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwj8BKLXNpALfemdRAwDQYJ
YIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIFl+PmxGjR3ebWGPsCEzaP2KRUiSPqjLCaDP
rSWBtqSNMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDUyNjIx
NDYzNVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATAN
BgkqhkiG9w0BAQEFAASCAQB2cQdpGNrlxd1mJzBy5RX+g5U1eCL0epKfdZFJE3cEgNZ//Oz/DV9k
l1WOcaq8OxdnOcg0aMrXhdqHDM0Xtqf7hjK7hmUjzhsH902r3WDaICw0tmeomu6o33BfsHcwR2/f
CI/IiRza7UQyhmGTYyV2uTkyyi+c1sEc723yGLl4lhe0E2zx/2/xN95c8RC20tXVV0Ri4ethKP0z
3r+KoSi1QC1DI6dyLLdz6+QmCzvY3D8W+91yiZUqK/rIXFqJr8BXU0Tl7c1XzEIRMq6jNEvekXjl
3NNbw0xQg7QNo/45dq+AWtWdar00hMI2cpze7d4R81hixCh0rYHIkiA8umNs
--000000000000c2551b05fc9fabad--
