Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3674E54DAC8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E6E113B4D;
	Thu, 16 Jun 2022 06:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD19113B4D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 06:37:22 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id y29so442643ljd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 23:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=Fj5okI0OHrTUL7u0PrVtz/qzUyxfkepK38a37myhwyc=;
 b=aTyyr4VKiJKH9w58xGNjupT0b/Lpr30fhhgRJH9+kUuKwIiMjjQeOSG6AYnJveLS7f
 oDF0edb6MfIs5YoC2CWDX01cWww6laAge4ohmVCqzvQbwthKVfFEf15eNTiYBSB+fMPs
 Ya16w31vG9XIYFo0QZhmFeUzyg8TbrnTbezcOJgBWzvAqqZ4DEWqwjsN6rrhdTZG/sdc
 lsn62CtbqfbbPKMtTj1rqlAoN8ybv4wq0tBkPfSIKGBm7wdCRW+TF5nwEx6BFSTpKVrm
 biCfSElD/javNfglf2DV2nur026xsEJnAPa+xvhXHllcR6E6/pjuMuBnMbc/jyXjcDUG
 BCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Fj5okI0OHrTUL7u0PrVtz/qzUyxfkepK38a37myhwyc=;
 b=kyVIgvq+8C9gxenxaOIbG+8Uf1O+VKrNjNzvr5orxOaK1CJGwNhF8B4546Gdjs5Z7R
 gplDuVpd1oqQUktaPYEn/fyebhRTXvFUXJAUpTH6kcuE9mid+YTgtRaFAAnPYAxEhq41
 fbUE2OIoE8819SIqnJbFuHWnNhq5OtuaCuBH7QDgnq/o1ueU0ljkqEI++KlP28ToGj19
 JHtj6zVb3PODDWmAYdnXvvAaInWdEjIxaUc2l9vSb4bDHjtxNw7SkJBmSKRkRhN1TCRg
 GtGTY+Vb+FQRpbtXcqWWkEctL3yvzFt/JdZdGqOB8F6mNOvSOqSMVsvRHl+Gn9vEwkqf
 gXjA==
X-Gm-Message-State: AJIora/Bb31I63sXvllXEfp2frUXwNW9U4pn+OjJ+MGG7MBgr9LYxV0z
 b1xIUBh9tg+i5GVxa725jqNOqw/+XfHyk6eK
X-Google-Smtp-Source: AGRyM1soQk1JX8qiRdMNy0XE89vDn++uDALWeQbt+IbFR4FqlwAjVbSPM5Vxp4wAzGxwiCkBe0EAKw==
X-Received: by 2002:a2e:8404:0:b0:250:cde7:e9e3 with SMTP id
 z4-20020a2e8404000000b00250cde7e9e3mr1759936ljg.289.1655361440862; 
 Wed, 15 Jun 2022 23:37:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a199149000000b0047db8b30670sm110207lfj.136.2022.06.15.23.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 23:37:20 -0700 (PDT)
Message-ID: <532dcb6a-db67-947b-3260-ac801b07f349@linaro.org>
Date: Thu, 16 Jun 2022 09:37:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 06/14] drm/msm/hdmi: drop unused GPIO support
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
 <20220609122350.3157529-7-dmitry.baryshkov@linaro.org>
 <CAE-0n51vKmQ683TTnYm8VxSquqYqL2_3=Ku750r--0GV4JcW8Q@mail.gmail.com>
 <492bbe98-e395-3adb-34e3-eadccd59d849@linaro.org>
In-Reply-To: <492bbe98-e395-3adb-34e3-eadccd59d849@linaro.org>
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
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/06/2022 23:47, Dmitry Baryshkov wrote:
> On 10/06/2022 23:46, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2022-06-09 05:23:42)
>>> The HDMI driver has code to configure extra GPIOs, which predates
>>> pinctrl support. Nowadays all platforms should use pinctrl instead.
>>> Neither of upstreamed Qualcomm platforms uses these properties, so it's
>>> safe to drop them.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> One question
>>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> index 7267167d5ef1..6d79f1b910a5 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> @@ -233,6 +233,20 @@ static struct hdmi *msm_hdmi_init(struct 
>>> platform_device *pdev)
>>>                  hdmi->pwr_clks[i] = clk;
>>>          }
>>>
>>> +       hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", 
>>> GPIOD_IN);
>>> +       /* This will catch e.g. -EPROBE_DEFER */
>>> +       if (IS_ERR(hdmi->hpd_gpiod)) {
>>> +               ret = PTR_ERR(hdmi->hpd_gpiod);
>>> +               DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: 
>>> (%d)\n", ret);
>>
>> Did you want to print an error with eprobe defer in it?
> 
> True. We should use dev_err_probe here. I'll fix it in the next revision.

As a second thought, I think I'll merge it as is for now and fix all 
error messages while moving the resource allocation to the _probe() 
function. There are few other places where we are printing the 
EPROBE_DEFER error code.

> 
>>
>>> +               goto fail;
>>> +       }
>>> +
>>> +       if (!hdmi->hpd_gpiod)
>>> +               DBG("failed to get HPD gpio");
>>> +
>>> +       if (hdmi->hpd_gpiod)
>>> +               gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>>> +
>>>          pm_runtime_enable(&pdev->dev);
>>>
>>>          hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
> 
> 


-- 
With best wishes
Dmitry
