Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOMsDzkohmmLKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B288710141E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB1F10E1D3;
	Fri,  6 Feb 2026 17:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VbY1E/bG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925DF10E3A1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 07:24:03 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a7bced39cfso19426535ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 23:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770362643; x=1770967443; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GlI/MBV6xozWTc1OM4u2SGSvVebdjrM1lCT9WkwRC+M=;
 b=VbY1E/bGCAlQY/tMIfItwvE7t+59NbdbvZQS+dnFu/8rhQBVP8vjr6oEcW06JY5OLH
 Varkt47zekJtmDeCj1MVhjywFAkfVKR0wLSnFHArMZXKaQAPMnze8z3wR6WWPvGWd4Gk
 b2avjWZyk7bEsU9dnEiIH929p7iVldli9dAX8LQdylT8ciIn5t9lL8QvoKVBJ7Pked9a
 H0rsuSOXlRx83lvOrHHapK145SUY98qmU+9EZoQ3r1i4iuirmxPtPTW90iIW12Wjz7xl
 BEntjFVh3KhSxqSAYIr/cZI2qbGnIh24nYFATy2YuAUYAIc3WlIjI6M6NCJ2XwgO2oGU
 YOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770362643; x=1770967443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GlI/MBV6xozWTc1OM4u2SGSvVebdjrM1lCT9WkwRC+M=;
 b=HuRLVaYTyaPe2h5aVNliyLzI0E77A+xTP8iwLPPexeanPIih2VFChvXrJuhx20ihzP
 Ht+Wk/JAtvMRpfTNioLTpfc1IsdHVgFPou4yi5gulp3L3Ew0sp6rtxfWfEakO8lKzWIB
 DNurSrCMklXgiH1xRApV5deuI39CyX2MHeYtUN0v5zZSvnS/+9X06wEPrUh5pSxSa3Ft
 pljQmg5Q0HZ5vVZfc/ydOnv2T6DMFFeSGthVDj8xYvAjXQ2szuBTY9I+9EoN/HgqxthC
 8cUFhT+3fCeZ3jPZwjmNTndRhIJzPUGCx0F6G4LBu3748+PTRMN575tJ4tNi/0TMLwmW
 fH1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnazm6lmky+wPS2qh/S63YPn9bfRNGwryA7MKcL3PPQI4rqIY59+gzAESTb3idy997ql91d1yrHe8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIjjRxREYBO5ZlbIgf0SFvzhOBhSg6DYDinCGmxmmCp7C8BBWC
 n6W/pLSytKohzt5VMI2fmYmctjDpbBLbEyDlPfS0TT93X8OcoOTwkzR+
X-Gm-Gg: AZuq6aKwMatI24GmJZYRjC0P7q8NBgKl8RLoWWhmQwCPUqIcxtJE77IVZdfob1GETwt
 FswsFvRUWPWou/+lLL3TlmIzp8lH2AyARsavqUcKU/UuTZyjLJEgNEgAC1XucYakN0sIqkXMvrZ
 4TXvFjnLTyjzSWJ3yx6YVQRiRbhhMZfVJZE88+GTOpeq1l/cauIo0CaCKhabjt7ORDxoec7Wgws
 mwwElUUWwYtZ17pMFKg2+B6cvjR9ec33Kof0ttBkTYDeVZyPvOP89HDgZ9HzduqMUOV/AOB+hKa
 qqe/txC2rjMIeuW3MAE3lrwUdJc1vMsTcU06kzdpsSDgbuB1nrI5ur2BHVSkF36ymneFueZEhJd
 0NbxuKgPUtsjkwbVtCe3oOIc+1ZEmk3nScUX4nuEOBwvPwL8/udEETsMO9FwweyJiRKKMv7ml9a
 kLTlhHsnhRAQIoobGRYbtIFIFowd9HdvrICJHWKXji95BGcRSGMGX+/AyT+5pVap6l
X-Received: by 2002:a17:903:ad0:b0:2a8:fbfa:e825 with SMTP id
 d9443c01a7336-2a95194693emr18851275ad.37.1770362643089; 
 Thu, 05 Feb 2026 23:24:03 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a951c50206sm14481175ad.19.2026.02.05.23.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 23:24:02 -0800 (PST)
Message-ID: <0a1a8f92-860f-4f4e-aad0-f743f099efc1@gmail.com>
Date: Fri, 6 Feb 2026 15:23:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/nuvoton: add MA35D1 display controller driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-4-a0987203069@gmail.com>
 <20260205-classic-innocent-angelfish-5c3cd2@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260205-classic-innocent-angelfish-5c3cd2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Feb 2026 17:43:15 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nuvoton.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B288710141E
X-Rspamd-Action: no action


On 2/5/2026 9:22 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 29, 2026 at 12:05:32PM +0800, Joey Lu wrote:
>> Add DRM driver support for the Display Control Unit (DCU)
>> found in Nuvoton MA35D1 SoCs.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/Kconfig                  |   1 +
>>   drivers/gpu/drm/Makefile                 |   1 +
>>   drivers/gpu/drm/nuvoton/Kconfig          |  21 +
>>   drivers/gpu/drm/nuvoton/Makefile         |   7 +
>>   drivers/gpu/drm/nuvoton/ma35_crtc.c      | 372 ++++++++++++++
>>   drivers/gpu/drm/nuvoton/ma35_crtc.h      |  67 +++
>>   drivers/gpu/drm/nuvoton/ma35_drm.c       | 371 ++++++++++++++
>>   drivers/gpu/drm/nuvoton/ma35_drm.h       |  48 ++
>>   drivers/gpu/drm/nuvoton/ma35_interface.c | 193 ++++++++
>>   drivers/gpu/drm/nuvoton/ma35_interface.h |  30 ++
>>   drivers/gpu/drm/nuvoton/ma35_plane.c     | 603 +++++++++++++++++++++++
>>   drivers/gpu/drm/nuvoton/ma35_plane.h     | 115 +++++
>>   drivers/gpu/drm/nuvoton/ma35_regs.h      |  88 ++++
> No maintainers? Why would we want to take unmaintained code?
I'll add an entry in MAINTAINERS file.
>
>> +static void ma35_mode_fini(struct ma35_drm *priv)
>> +{
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +
>> +	drm_kms_helper_poll_fini(drm_dev);
>> +}
>> +
>> +static int ma35_clocks_prepare(struct ma35_drm *priv)
>> +{
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +	struct device *dev = drm_dev->dev;
>> +	int ret;
>> +
>> +	priv->dcuclk = devm_clk_get(dev, "dcu_gate");
>> +	if (IS_ERR(priv->dcuclk)) {
>> +		dev_err(dev, "Failed to get display core clock\n");
> Don't spam logs on defers. Syntax is in entire probe path: return
> dev_err_probe
>
>> +		return PTR_ERR(priv->dcuclk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(priv->dcuclk);
> Why this cannot be devm_clk_get_enabled?
I'll fix it.
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable display core clock\n");
>> +		return ret;
>> +	}
>> +
>> +	priv->dcupclk = devm_clk_get(dev, "dcup_div");
>> +	if (IS_ERR(priv->dcupclk)) {
>> +		dev_err(dev, "Failed to get display pixel clock\n");
>> +		return PTR_ERR(priv->dcupclk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(priv->dcupclk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable display pixel clock\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35_clocks_unprepare(struct ma35_drm *priv)
>> +{
>> +	struct clk **clocks[] = {
>> +		&priv->dcuclk,
>> +		&priv->dcupclk,
>> +	};
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(clocks); i++) {
>> +		if (!*clocks[i])
>> +			continue;
>> +
>> +		clk_disable_unprepare(*clocks[i]);
>> +		*clocks[i] = NULL;
> Huh, pretty complicated and pointless code. This should be devm and bulk
> API...
I'll use memory safe helpers instead.
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35_drm_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct ma35_drm *priv;
>> +	struct drm_device *drm_dev;
>> +	void __iomem *base;
>> +	struct regmap *regmap = NULL;
>> +	int irq;
>> +	int ret;
>> +
>> +	ret = of_reserved_mem_device_init(dev);
>> +	if (ret && ret != -ENODEV) {
>> +		dev_err(dev, "Failed to get optional reserved memory: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base)) {
>> +		dev_err(dev, "Failed to map I/O base\n");
> Why aren't you using dev_err_probe?
>
>> +		ret = PTR_ERR(base);
>> +		goto error_reserved_mem;
>> +	}
>> +	regmap = devm_regmap_init_mmio(dev, base, &ma35_drm_regmap_config);
>> +	if (IS_ERR(regmap)) {
>> +		dev_err(dev, "Failed to create regmap for I/O\n");
>> +		ret = PTR_ERR(regmap);
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0) {
>> +		ret = -ENODEV;
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	priv = devm_drm_dev_alloc(dev, &ma35_drm_driver,
>> +				     struct ma35_drm, drm_dev);
>> +	if (IS_ERR(priv)) {
>> +		ret = PTR_ERR(priv);
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	drm_dev = &priv->drm_dev;
>> +	priv->regmap = regmap;
>> +	INIT_LIST_HEAD(&priv->layers_list);
>> +
>> +	ret = ma35_clocks_prepare(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to prepare clocks\n");
> Why do you print error twice? Once in the function, second time here?
>
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	ret = devm_request_irq(dev, irq, ma35_drm_irq_handler, 0,
>> +			       dev_name(dev), priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to request IRQ\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* modeset */
>> +	ret = ma35_mode_init(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to initialize KMS\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* plane */
>> +	ret = ma35_plane_init(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to initialize layers\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* crtc */
>> +	ret = ma35_crtc_init(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to initialize CRTC\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* interface */
>> +	ret = ma35_interface_init(priv);
>> +	if (ret) {
>> +		if (ret != -EPROBE_DEFER)
>> +			drm_err(drm_dev, "Failed to initialize interface\n");
>> +
>> +		goto error_clocks;
>> +	}
>> +
>> +	drm_mode_config_reset(drm_dev);
>> +
>> +	ret = drm_dev_register(drm_dev, 0);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to register DRM device\n");
>> +		goto error_mode;
>> +	}
>> +
>> +	drm_client_setup(drm_dev, NULL);
> Best regards,
> Krzysztof

I'll  return raw error codes and let probe wrap them with dev_err_probe().

Thanks for the review.

Best regards,

Joey

