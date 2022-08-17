Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F45968A8
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 07:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414A810E9F2;
	Wed, 17 Aug 2022 05:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3887110E58C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 05:38:56 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id s9so12555749ljs.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 22:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=hJQ+G2q+PJJ817bdNue0It6aaQL/wDQ9FFpmsAzXz+Q=;
 b=uZy1DBbbXN5ca20xZqyHR2gSmBrAxZIVSQ7csB8vRh27lanpLSsTLO/mUURLSIXyNY
 9UeZxHZ4UJUIA13jkjfMHxAPuN5TacXJHUEWCxFqzffVOEvxuoZnNO8jk3j70lifjLKW
 HHHpCwkK1E/ncIUJGib/X0NDr8oKhQl+JTnZ6/x18GHovyT6ROv7pMJGmFa3ejbunUud
 IMPmzRrDQNLxYoFySnCkMSF/x7eqsL02j+ncSUXkUwT2auKbFqD8VBqASbFNC+ROcI3g
 uCNkMrXXMEY3iLskRwJ7aGVAMzrbBourAt8gRJlzFcCq2dIMSqVDoZADbrJhA3C/jX5r
 BKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=hJQ+G2q+PJJ817bdNue0It6aaQL/wDQ9FFpmsAzXz+Q=;
 b=QKbpTySqQvX0MsH7DWRifO2pFemeNbGXddFdMNLPNKPkczbzU2ytA48FO6fnEXNMeI
 oE3AtMpZbVH/qQDwu3F6VGqLS59HuwwbHqPKPiQYMoUlN5g+vp01enlH0Kl86ztzi7c/
 x1eIJteWMzcFAq11J59vqS2stBVADN2j5M9wpc4OuZJbzqiXddHO738UIZwrYDPPy/OR
 qGfvFgRsyX1CjA04DvDUVCeCnpO20lEf81h0o0O6wv8dsQudYldlfCZK3u1qj084KQiG
 eKCKadU6Rf5cVb7DzckDYrOISbD+zZQyU9JTNymrVE1kI5thjLDHxIzBnTGFhwChluLk
 uedA==
X-Gm-Message-State: ACgBeo1Da5I/j2Wol+tY/eqVcGi3BavZDecyecc6V477FjqHyCZZxzRD
 p7JatOdFdJUj5nYvZczD1CNJeQ==
X-Google-Smtp-Source: AA6agR5kleeXG5u5qS+dHTDKcUqrs/ENiHZgNcFjVkFeGy1twEIyQXzvp6EXjBPPCOGBlEkn2Iue6g==
X-Received: by 2002:a2e:8181:0:b0:25f:e028:a67 with SMTP id
 e1-20020a2e8181000000b0025fe0280a67mr7713765ljg.89.1660714733871; 
 Tue, 16 Aug 2022 22:38:53 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76?
 (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a05651203a400b0048b17ecee71sm1562918lfp.302.2022.08.16.22.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 22:38:53 -0700 (PDT)
Message-ID: <8d0c0326-c0df-efa4-5962-cd1282b33f43@linaro.org>
Date: Wed, 17 Aug 2022 08:38:51 +0300
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
 <3f755d24-969b-1804-7979-880a9fe10cba@linaro.org>
 <9eba0937-b4cb-4c62-e339-8ff33aebdbde@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9eba0937-b4cb-4c62-e339-8ff33aebdbde@quicinc.com>
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

On 16/08/2022 21:22, Jeffrey Hugo wrote:
>>>>> +	if (datapath_polling) {
>>>>> +		poll_datapath = true;
>>>>> +		pr_info("qaic: driver initializing in datapath polling mode\n");
>>>>
>>>> No pr() in normal path of init/exit.
>>>
>>> This is not the normal path.  datapath_polling is a module parameter.
>>> This is something the user can enable, and so it would be good to have
>>> the user informed that the option took effect.
>>
>> No, not really. User always can check via sysfs and there is no point in
>> polluting dmesg on module load. It might be printed (if someone has such
>> modprobe setting) on every system, even without the actual device.
> 
> So, I guess this is limited to platform devices?
> I see GIC, IOMMU, and PCI doing the same
> I guess, will remove.

None of regular drivers should print anything during init/exit. If one
is printing, I think a patch removing it will be accepted.

However you mention platform devices, so a "device" implies probe, not
init. This is a different case.

Best regards,
Krzysztof
