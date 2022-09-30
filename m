Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2978E5F09ED
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 13:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B9D10EC87;
	Fri, 30 Sep 2022 11:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813DD10EC87
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 11:20:53 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z4so6395325lft.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 04:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=tSS0OwapmGCYXAOpgg6xlNApn7RpwyeG1gXGqydrbJ4=;
 b=RnNLp5XOC5FP1l1QOpxkRAxm3SlY4+bFuwv0pJvVxm9o2BmI7JrUaMTpc0m30QGvQG
 d1Z+Dk2GdC95Rwi8IFxxd2jGsY0fNMHD5rwNXWrvw/HOyxMGCYhj8XhlnOqerGM3QkIP
 gKm+aRIpScjhv4OapLjH9oPyK+vtEVwNy+8dUrcrWMPeWtYXiJLJ5zVeGeJaUwHJpYIo
 cggQFA664pyFL5A46dvED+9oxamy1IrFZaziE2EoKL93Cbh8a8GD8leRWDV56UED7sIN
 +/EsrEDdSojmlNWOTBRHXMKkoKVTroqXqpOmYJhh1L0otqOa6iiMr9otpnOz+UYMlhpJ
 ZUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=tSS0OwapmGCYXAOpgg6xlNApn7RpwyeG1gXGqydrbJ4=;
 b=Si6iTnODst1zauIS7N0Zhgnr+jnLDiKCFGUs6tJGZCvVZKptJ2qLE1Sz7OCVhW0iA5
 C7SaXte5zL1iqvxsSqNwxb6tdWAU5rURrZD8p9d/OUULsMSBSjkUhBUFJMp+AMiQLqQ9
 UTsDW1aIMwMs6LDXSKNnzGm093Uxi9JrtMTZCuuhwzGzBZgvN6brfUXEAfCw/XGKHoQu
 hgoH+nhnEAGxyU8Xkm2QV4wSeSwypIjiYQ3rtwhMN7rYLHkWcUyNaf5dKRLmucvMYTJf
 DBNaJBlVZzw44qumjXaF0UoDZmTsS2W5KHgbo+Q+Zc4lXX4G0VKF6dFUjT3YX8MbWnwZ
 7jIw==
X-Gm-Message-State: ACrzQf3IXclMBsJ2jpq85J33okmF4QkzhzabUibv2KtcydReaWWvAkm4
 gYkc35IX8cR9VpESi9Yu9YZtAQ==
X-Google-Smtp-Source: AMsMyM5+Br4pooYTCe1wcBue2LneLOWrbvkc2W5kR2lwYUem3rqWngE6Go7DjWuEqVmBFTIhyvEK3g==
X-Received: by 2002:a05:6512:3503:b0:496:55d:a186 with SMTP id
 h3-20020a056512350300b00496055da186mr3040836lfs.340.1664536851811; 
 Fri, 30 Sep 2022 04:20:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 j22-20020a056512109600b0048af397c827sm258553lfg.218.2022.09.30.04.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 04:20:51 -0700 (PDT)
Message-ID: <a0254559-a76d-de87-3458-e7dc148a8daf@linaro.org>
Date: Fri, 30 Sep 2022 13:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 4/4] arm64: dts: smaug: Add display panel node
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
 <23bc38b8-ed67-d243-9739-f07b7411be3a@linaro.org> <YzbPz8mL0Yo+vgSS@orome>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YzbPz8mL0Yo+vgSS@orome>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/09/2022 13:15, Thierry Reding wrote:
> On Fri, Sep 30, 2022 at 12:51:07PM +0200, Krzysztof Kozlowski wrote:
>> On 29/09/2022 19:05, Diogo Ivo wrote:
>>> The Google Pixel C has a JDI LPM102A188A display panel. Add a
>>> DT node for it. Tested on Pixel C.
>>>
>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>> ---
>>>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 72 +++++++++++++++++++
>>>  1 file changed, 72 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>>> index 20d092812984..271ef70747f1 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
>>> @@ -31,6 +31,39 @@ memory {
>>>  	};
>>>  
>>>  	host1x@50000000 {
>>> +		dc@54200000 {
>>> +			status = "okay";
>>
>> You should override by labels, not by full path.
> 
> Why exactly is that? I've always stayed away from that (and asked others
> not to do so, at least on Tegra) because I find it impossible to parse
> for my human brain. Replicating the original full hierarchy makes it
> much more obvious to me where the changes are happening than the
> spaghetti-like mess that you get from overriding by label reference.

Sure, it's entirely up to you. I forgot your preference.

But it is a really nice way to have duplicated nodes and mistakes (which
happen from time to time).

Best regards,
Krzysztof

