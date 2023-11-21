Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCFF7F2AEC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 11:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D5910E256;
	Tue, 21 Nov 2023 10:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A84110E256
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 10:46:12 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-332ce3fa438so225700f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 02:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700563571; x=1701168371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9YQ9oHc/Z7VmSRjGiVHn+TQLl6XB6fBGVSa6lAReK2Q=;
 b=Ag9W4qKRkXIjiIvtMd86dkxGzGNT6jVFXvZrrT22tAQzne9uFY3Ad35gz1ZAoD9BXI
 E8DwQ8HOOzT+A8CggsQahAKmWcsKiQMqu+WMAHOrc/HfDNKPb0TxTLHhn0aUIZdjCD9R
 oAwQfpQZgE/qt07+AjGWCWHxurh7PR4y0DZqb+LEr8rBnlUzH2CHcK89D/rduvKVF81l
 csLjh+b6uwlufh8uCMaU61TZHN+Dg8LWVwdf0WSV9IK8pq6q7qPN30lr8RnOBukMxPTd
 CclKfhlsJBTfnAp6E90XoCTv8swDom7EcES4W0hYfKLrAUVPd6m1boI12npBH+CPVPAA
 9T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700563571; x=1701168371;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9YQ9oHc/Z7VmSRjGiVHn+TQLl6XB6fBGVSa6lAReK2Q=;
 b=Co4jZ6rmpjf59OgdSLYHruDra0d+af/ZrLKV2DTaI9YvJA2xQbzsFUcaKJ+BMo53s+
 4Sk+4kEF7d0buUaPEqcPdYSUdPVWx0O2NotGLbJPmaAAm3fsLZeHM6Waaf/O1CLHEhuY
 EpVQOvcYQ9MoGHs/klHbuxmNMgm57hSpLoWRb8pmwcrjb6kERn8FguYfXXpaFjCL4jH9
 Kb4415D9vMezIfcqz2YtRooPhwjgAKaXDGKPpABUbdqazrZNqDF+GuNk4dOinGXrsnoF
 booUdkim4ZC6Nx2gv3Xc5w7e1YLFUI2JZ/6mI2OzdyqYgPbqjBsOrPGKQ3UEHBlve6YP
 7jWA==
X-Gm-Message-State: AOJu0YycX+q0LHdzcr6Tl0cQEaqbTiUUk08Tg6P45t8A5ZgWL4X4yZdC
 M5isPjO2x154/SZXFbbVx386Eg==
X-Google-Smtp-Source: AGHT+IEeZ8W+Q8V/otGe4qIWbM9OBl6X7yXc7iTRxrT4SgTPAzPVtLB58IlgIl50TaKNv0wMDaLYNA==
X-Received: by 2002:a05:6000:18ae:b0:332:c789:4bed with SMTP id
 b14-20020a05600018ae00b00332c7894bedmr1937246wri.23.1700563571319; 
 Tue, 21 Nov 2023 02:46:11 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
 by smtp.gmail.com with ESMTPSA id
 q15-20020adff94f000000b0033169676e83sm14261662wrr.13.2023.11.21.02.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 02:46:10 -0800 (PST)
Message-ID: <e67c00fd-37f2-4ede-983f-c8c46bf847f1@linaro.org>
Date: Tue, 21 Nov 2023 10:46:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] usb: typec: qcom-pmic-typec: switch to
 DRM_AUX_HPD_BRIDGE
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
 <20231103230414.1483428-7-dmitry.baryshkov@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231103230414.1483428-7-dmitry.baryshkov@linaro.org>
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/11/2023 23:03, Dmitry Baryshkov wrote:
> Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
> same functionality for the DRM bridge chain termination.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> +	if (IS_ERR(bridge_dev))
> +		return PTR_ERR(bridge_dev);
> +

What is the effect if we never attach any bridged devices ?

We make an aux device that just hangs around and eventually get cleaned 
up on release ? That's the way I read this code anyway.

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
