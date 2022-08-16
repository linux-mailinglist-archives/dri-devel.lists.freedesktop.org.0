Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB35961B3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 20:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1F210E7B1;
	Tue, 16 Aug 2022 18:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F1410EA84
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 18:00:10 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id j3so11331825ljo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=jb2YCmtzStrf7oPaQDp5CORzVrMt6QsLXaku2/2alHw=;
 b=TXGV7d4y/nyORgZvCClAmPDsHxHFE+Iw8br/AFi3XE91TMuUOyIfAsfhM61WMj9Qa1
 I5zjtH0mBDtQeb0BVqCUdQ7o1uVZ61a8PvW+pTtTWMKTAq70/VliLez+g6a49Z40Hq5S
 kHoJ/f5XsvRKX1z98aaH8gGCQhyOw9hlnxJc0AQcGq5msKiUqW88Vs0QebsvNrke0gzY
 m6zIWXZ6M1XPkk5XX71u7GBk7S2r6jmzLfdHPg2OTulpRufdap6UqtSWZuWnCO+pCYQa
 kJ+wFqoefxVAXXGZyeMJZ3BCJIlpXrnKtbRUqGx7vZbdWnH9UsB48TfbcnbIidY7GduP
 /E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jb2YCmtzStrf7oPaQDp5CORzVrMt6QsLXaku2/2alHw=;
 b=WIgiJO9GXhxpkgyRi9GRJpGAQ+Mxj2t+4801p+tqhdpBFaNutvFnYmEXD1Ei6DrXOI
 hL4vAvwcsTDVtgAmlLaAvVDQR2Jn/00K/OHZ73BQL4IQvOgp1ZtIlvG40OJvJyF6bKyQ
 69fvlg9D63Fy2wN7bOruTiBKaGxaFsBPr6iknzbD4vWW0PEYwDfJyNNhXBVcU2iqBqke
 HVJOAWCnoaIHYlgkDLIdYxffphFCWThpQSr9Lo9NDazbxCV+jT3uuAMFmjaso1g/9gQ1
 Z+2TtdpTlkbx0sYoP++fZ+7ip3iPZHpUgCv3ZHkFRuhmFhXFmtogV7gxJdUtmsvQ7sjC
 iv7g==
X-Gm-Message-State: ACgBeo2yiF7UxZJbH+i5gXXeVTKnkwtD63+37rt7WxRZe9KJ6y2TFbK8
 vC9rBxwTWArT7kYhACWFsnzm+A==
X-Google-Smtp-Source: AA6agR49/8LpwUjHkR0YA8dRHfC2fMxyKVR0zEGU/v61rAa06vW2HgPTJv99wXh3/r33rKkoJL73Iw==
X-Received: by 2002:a05:651c:2003:b0:25e:5c53:8915 with SMTP id
 s3-20020a05651c200300b0025e5c538915mr7330297ljo.88.1660672808624; 
 Tue, 16 Aug 2022 11:00:08 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:633f:dc22:d8ba:e2cf?
 (d15l5445-7tvqvr3c58-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:633f:dc22:d8ba:e2cf])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a05651c010900b0025e2c6b15e6sm1870773ljb.72.2022.08.16.11.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 11:00:07 -0700 (PDT)
Message-ID: <3f755d24-969b-1804-7979-880a9fe10cba@linaro.org>
Date: Tue, 16 Aug 2022 21:00:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH 02/14] drm/qaic: Add uapi and core driver file
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, airlied@linux.ie, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
References: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
 <1660588956-24027-3-git-send-email-quic_jhugo@quicinc.com>
 <10ad6023-703d-65cf-6b00-2caa658c49e9@linaro.org>
 <e9786447-edd4-90e0-25a9-b35e96adbfc2@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e9786447-edd4-90e0-25a9-b35e96adbfc2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/08/2022 20:47, Jeffrey Hugo wrote:
>>> +static int qaic_pci_probe(struct pci_dev *pdev,
>>> +			  const struct pci_device_id *id)
>>> +{
>>> +	int ret;
>>> +	int i;
>>> +	int mhi_irq;
>>> +	struct qaic_device *qdev;
>>> +
>>> +	qdev = kzalloc(sizeof(*qdev), GFP_KERNEL);
>>> +	if (!qdev) {
>>
>> return -ENOMEM;
> 
> So, no centralized exit per the coding style?  Ok.

Centralized exit except for cases where it is simply return.

> 
>>
>>> +		ret = -ENOMEM;
>>> +		goto qdev_fail;
>>> +	}
>>> +
>>> +	if (id->device == PCI_DEV_AIC100) {
>>> +		qdev->num_dbc = 16;
>>> +		qdev->dbc = kcalloc(qdev->num_dbc, sizeof(*qdev->dbc),
>>> +				    GFP_KERNEL);
>>
>> Why not devm?
> 
> We were having issues with devm and the PCI stuff.  Looking at this 
> again, I think we can apply that here.
> 
>>
>>> +		if (!qdev->dbc) {
>>> +			ret = -ENOMEM;
>>> +			goto device_id_fail;
>>> +		}
>>> +	} else {
>>> +		pci_dbg(pdev, "%s: No matching device found for device id %d\n",
>>> +			__func__, id->device);
>>
>> How this can happen?
> 
> Badly functioning hardware.  That hardware has been removed from 
> circulation.  Given that this is an init path and not performance 
> critical, having this handle the scenario in a sane way instead of 
> having the driver blow up in a weird way much later on makes me feel better.

How badly functioning hardware can bind and then report some different
ID? If it reports different ID, it cannot bind...

(...)

>>> +static int __init qaic_init(void)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (datapath_polling) {
>>> +		poll_datapath = true;
>>> +		pr_info("qaic: driver initializing in datapath polling mode\n");
>>
>> No pr() in normal path of init/exit.
> 
> This is not the normal path.  datapath_polling is a module parameter. 
> This is something the user can enable, and so it would be good to have 
> the user informed that the option took effect.

No, not really. User always can check via sysfs and there is no point in
polluting dmesg on module load. It might be printed (if someone has such
modprobe setting) on every system, even without the actual device.

> 
>>
>>> +	}
>>> +
>>> +	qaic_logging_register();
>>> +
>>> +	ret = mhi_driver_register(&qaic_mhi_driver);
>>> +	if (ret) {
>>> +		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
>>> +		goto free_class;
>>> +	}
>>> +
>>> +	ret = pci_register_driver(&qaic_pci_driver);
>>> +
>>
>> No need for such blank lines.
> 
> Agreed.
> 
>>
>>> +	if (ret) {
>>> +		pr_debug("qaic: pci_register_driver failed %d\n", ret);
>>> +		goto free_mhi;
>>> +	}
>>> +
>>> +	qaic_telemetry_register();
>>> +	qaic_ras_register();
>>> +	qaic_ssr_register();
>>> +	goto out;
>>
>> return 0.
> 
> Ok.
> 
>>
>>> +
>>> +free_mhi:
>>> +	mhi_driver_unregister(&qaic_mhi_driver);
>>> +free_class:
>>> +out:
>>> +	if (ret)
>>> +		qaic_logging_unregister();
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void __exit qaic_exit(void)
>>> +{
>>> +	pr_debug("qaic: exit\n");
>>
>> No pr() in normal path of init/exit.
> 
> Sure.
> 
>>
>>> +	link_up = true;
>>
>> This is confusing...
> 
> Will add a comment.  This ties into MHI, and how it can tear down in two 
> different ways, usually based on the link state.

Shouldn't this be link_up=false?

> 
> In this case, we are doing a clean tear down where the link is still up, 
> and so we should have MHI do the extra tear down that leaves the device 
> in a good state, in the event the driver gets added again.
> 
>>



Best regards,
Krzysztof
