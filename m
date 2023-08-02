Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDE376C803
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448A010E51A;
	Wed,  2 Aug 2023 08:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70D410E51A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 08:08:54 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe3b86cec1so4546642e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690963733; x=1691568533;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aOKmlxAZiu+rAy0mWvKiWQUS7YSnrxxOgJ2e0G73lbg=;
 b=tMzB48/4AsljrJvI2Ejp29/MrmRT3yKPeEX/DqlKCpOvI4twz4giC1NoKfgL72NFco
 lJufmZSDxWaWNjua3rF8eculMDKzzKA1Q/t7Lc02HGHVTNW7d+JZmfDm5LMt6mbzVLIH
 IjQ4WNxPR/FamtiRyJFqoZkzBYWgT/1I8Je5EUyg8pfGTTgGmCQ6q+N05lF2sRmuoKkf
 ggNDMLDtRdZQnnzrDIEeNv2eh7vx4LT40xMdo4z2V2zRmZmTFdFNUIQPtr7jp7bX7nOM
 6bndKwLX1CDNLsstFPiF+qs9/sUh2+sPn3CzJRUUTmdZgY24j2M83+Bo70GHRH2QksZJ
 BltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690963733; x=1691568533;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aOKmlxAZiu+rAy0mWvKiWQUS7YSnrxxOgJ2e0G73lbg=;
 b=ZHfDCK9L9OwqbA0rLGfQiE1rwkpxUAhtcoeDXX8S3pivePSSBvRYBZR8+WsiTMwW1V
 AkHM3Ughv9PlhzYmDUoQdNeBEHVKBpzkpmUB0jzT3uTlg1ljUGqSZRL3MjxRWnb0syKX
 NncnBmi8PtigL6rfrFZ0u8/i4nDvTXfy9BiXa5tgT61BUsKVAdntzU6umn5HrGjMqYQC
 nm78OytLi4tOiKnarmNGK0S9EyVjZD18j9ym3Gp1FiDPA7Or6HLMqv6TTzwaG5SMIMo+
 tGrhOAdpWt/Y00RNbo3FJIChDdywRJEztt2zuGniHA4WPKYH88B17vqi2/ySuIALGJxH
 9LzQ==
X-Gm-Message-State: ABy/qLaUrm+u6lYTVbMDrc8TYsA5G3YH1aRwj35ZC+iQHyBixPmxUWzv
 NhSXU1FEG+q64Tl8Zmg7yybYNw==
X-Google-Smtp-Source: APBJJlFG++b4mOehT6ZE3FkFUr1jz2i+ns16PIZMvzWbhnmLx8s6v/p8aB2VxEB9+qh6r9g8T5sPww==
X-Received: by 2002:a05:6512:104e:b0:4fd:fc36:68a2 with SMTP id
 c14-20020a056512104e00b004fdfc3668a2mr4674646lfb.1.1690963732826; 
 Wed, 02 Aug 2023 01:08:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcc88000000b003fbcdba1a52sm1006994wma.3.2023.08.02.01.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 01:08:52 -0700 (PDT)
Message-ID: <9caeb91f-1277-3645-cbbb-7be538d80e2a@linaro.org>
Date: Wed, 2 Aug 2023 10:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] drm/display: add transparent bridge helper
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
 <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 02/08/2023 03:18, Dmitry Baryshkov wrote:
> Define a helper for creating simple transparent bridges which serve the
> only purpose of linking devices into the bridge chain up to the last
> bridge representing the connector. This is especially useful for
> DP/USB-C bridge chains, which can span across several devices, but do
> not require any additional functionality from the intermediate bridges.

Can you CC me on the whole patchset ?

Thanks,
Neil


<snip>

