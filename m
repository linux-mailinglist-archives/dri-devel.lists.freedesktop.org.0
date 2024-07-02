Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FB59241E8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 17:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D4510E618;
	Tue,  2 Jul 2024 15:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g9ubsTnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE9010E62C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 15:08:42 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42565670e20so32273735e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 08:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719932920; x=1720537720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x3fdPNVgQgZKaJpq3dIGlColijB/tubuUQxMWr4wkDU=;
 b=g9ubsTnq/w0WCyPfPs/EYqW94qi9AI7nTmXA68Ujj3iPMOT5+oVdsTylzqcZDm2ZOF
 m5hIV8q2UYCjXegZxB/7I83c0W/yYq/979sKJAnQZS96UqKzaWvj8lsaF75DHB/EC0FY
 zOzFwL98/s562pEJ87c292lDzDygAaIgEZqIRW9uf7ktwA3Of3SVVg7oUCmIiA9aJjJY
 KKh4vkZqiG2RchVsDGJaEUfIYl6X4H2C7rLhYhi8GLUJXquQBzAHZGXrikKZAKUi6KIc
 IXh9EFDKRFfx/txYL9t6m8RW61ZP7R0ZJs4v1TIOFp25ooZuDdzpiClmsUujotUNoYNJ
 gtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719932920; x=1720537720;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x3fdPNVgQgZKaJpq3dIGlColijB/tubuUQxMWr4wkDU=;
 b=O+/vSuKzUtaJZcXrkqAMl1CeMloDa79jKFeiT8aVNBC3hiArxwJv+nqqZwssCnXXNo
 5aKF1DaOufYJooVYxLk3hpBcgZq9WJa147bsvRUDDE0FbTxDBcQ99aUnySLQlen4Gxop
 X42vbUW4r7EcbTvn/jsQ8sMYtp49lP5isacin18a3QcChc0u3j6Uj9ubeeyJCmR2YnWX
 MKjHfoxdaD0hrYKzW51yrxq34h03mzahi2j73XdQ8FJsNXSQbPojtrrdSlxMYlwfzL38
 09gxFl4kmUlxJJIMxCfEVkdo410qb1P9xa0wXjG20eLYTZmoaJODx7cuIhFXkkBOuWE5
 1hSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKZzGBoKIZxIZfmcvjnDoLMLUtxpfyVeTDnIELRiIVVeXTQK+oMh5iqJCwxtxvTNBjDWYk29RhcpIEFKGTr6/X+QWTtigi1CtU2LilRr7r
X-Gm-Message-State: AOJu0Yxxt9Ei+0VGoZWzSrioYi3mZiegRljH36jLUL/zIvGCDyt8PQ9s
 Gcy6vmwUnQan4pBN27PdHAxSAoDd2YJcvXuZZblEqdUL8jM4GN1L
X-Google-Smtp-Source: AGHT+IEEc+o+yax4KgqPy6+aEAG5lUW7O4Rfq7d891iyb9LsSMrtwrUsX04P4jtPpPwhNv+S8YJcjA==
X-Received: by 2002:a05:600c:41c6:b0:424:7895:dd45 with SMTP id
 5b1f17b1804b1-425798ad8bemr77214565e9.17.1719932920360; 
 Tue, 02 Jul 2024 08:08:40 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at.
 [84.115.213.37]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e12fcsm13456402f8f.48.2024.07.02.08.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 08:08:39 -0700 (PDT)
Message-ID: <ba408a65-9179-4868-a1ac-44b936ee778f@gmail.com>
Date: Tue, 2 Jul 2024 17:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: ipu-v3: Removal of of_node_put with __free for auto
 cleanup
To: Abhinav Jain <jain.abhinav177@gmail.com>, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org
References: <20240702144836.1001916-1-jain.abhinav177@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240702144836.1001916-1-jain.abhinav177@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2024 16:48, Abhinav Jain wrote:
> Remove of_node_put from device node of_node.
> Move declaration to initialization for ensuring scope sanity.
> 
> Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
> ---
>  drivers/gpu/ipu-v3/ipu-common.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
> index 71ec1e7f657a..f8cc3f721d2a 100644
> --- a/drivers/gpu/ipu-v3/ipu-common.c
> +++ b/drivers/gpu/ipu-v3/ipu-common.c
> @@ -1150,10 +1150,10 @@ static int ipu_add_client_devices(struct ipu_soc *ipu, unsigned long ipu_base)
>  	for (i = 0; i < ARRAY_SIZE(client_reg); i++) {
>  		struct ipu_platform_reg *reg = &client_reg[i];
>  		struct platform_device *pdev;
> -		struct device_node *of_node;
> -
>  		/* Associate subdevice with the corresponding port node */
> -		of_node = of_graph_get_port_by_id(dev->of_node, i);
> +		struct device_node *of_node __free(device_node) =
> +			of_graph_get_port_by_id(dev->of_node, i);
> +
>  		if (!of_node) {
>  			dev_info(dev,
>  				 "no port@%d node in %pOF, not using %s%d\n",


Hi Abhinav,

1. You sent this patch twice.
2. The __free() macro removes the need for of_node_put(), but you kept
the calls to that function.
3. If you are aiming for a code refactoring, do not apply the __free()
macro to a single device_node, leaving the rest untouched.

Best regards,
Javier Carrasco
