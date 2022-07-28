Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6519E584090
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B5110FB47;
	Thu, 28 Jul 2022 14:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EBF10FAF1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:07:45 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d17so2982316lfa.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 07:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XURwmQrh3pi3kMw2kzj18VPxjyFA7fJIbFKY450RC7I=;
 b=qRGvHVeB02lb7PCsFuzh7wZCEHah7TU2JwUE6V6ElvhENbjDki89kU8OEIUZ9iWGFC
 BUuOdg76Z4r7uFqKrGaPCwzWTmcBvk9XDMcEiDZ0uVVWX9bHcw3Qws+QNr2wb/a8Cvmn
 xgGzp/9b0Gaqfbf4COE+OfjCye3EM3WZhCfiOyFKtXbfdtTnmEjhQLik0UXkLFeoWW2O
 A1IAF/qiguMdPPIsVAfRHk4l8yeTSxQFg4Lbt9nbrWBNCa4tVyi20KDydOuAFbqmHr7h
 9Kqvwe0Lab0ngMkz08xS302Z5j2hEzgP/FNAccSHtTZhfQYWgPFv/q8i+SRHJwldY3qv
 XKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XURwmQrh3pi3kMw2kzj18VPxjyFA7fJIbFKY450RC7I=;
 b=b0dz+CotNazbqC0YHmEzumv3SzjVpADsC/MRykOV5dVCyRuBeQitkt4/KCCpkiCBKa
 avH7mADCJbwlovavRFxdLWvgmPx+5YF+CrH/YNRilJlG/sSBB2knBkUgNX+wSFnULnad
 /fWBBN9I85KDer1cRBdjZeEAo4tpUD0VhcREqSncmv38Eji7Ek8qI2izGSI51GMtbSMH
 6sgAP/zdrYiER8I488e4kS5Qoi857R/IxLoowmnYY4nynGFhIe6w3M96PasREwM7QH/b
 2B6B1DuIElEkkqsBsyLRZYaHvFeJZo29UuSmW0fQY6mLn5+b/sshhmAfNZBezGru8rzt
 PSRQ==
X-Gm-Message-State: AJIora8vNNuVy5JXvPnqx31HYc3mvFXLdyX5Fyikj2q1geNrqw+wnkxR
 iLH0ynFYhMMn7ErjHtO6yf6tGQ==
X-Google-Smtp-Source: AGRyM1sfj4KYcQ5fKo9HTWhxAnNgSyXWMVlNIWukceO//mHIgTAQ3IqTgcBO/4pGY1LTDh/sHPwfgQ==
X-Received: by 2002:a19:710b:0:b0:48a:cf83:7551 with SMTP id
 m11-20020a19710b000000b0048acf837551mr334407lfc.137.1659017264043; 
 Thu, 28 Jul 2022 07:07:44 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no.
 [78.26.46.173]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05651c231200b0025e119e9276sm158570ljb.99.2022.07.28.07.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 07:07:43 -0700 (PDT)
Message-ID: <24964892-d421-6104-c72a-187b484f99c6@linaro.org>
Date: Thu, 28 Jul 2022 16:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 2/2] drm: panel: Add novatek nt35596s panel driver
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220728023555.8952-1-mollysophia379@gmail.com>
 <20220728023555.8952-3-mollysophia379@gmail.com>
 <1685ecd6-cfe7-c2f1-add5-6bfff055fa06@linaro.org>
 <YuKUNeazoho6LPTJ@ravnborg.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YuKUNeazoho6LPTJ@ravnborg.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Molly Sophia <mollysophia379@gmail.com>,
 phone-devel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2022 15:50, Sam Ravnborg wrote:
> Hi Krzysztof
> On Thu, Jul 28, 2022 at 02:17:29PM +0200, Krzysztof Kozlowski wrote:
>> On 28/07/2022 04:35, Molly Sophia wrote:
>>> Novatek NT35596s is a generic DSI IC that drives command and video mode
>>> panels. Add the driver for it. Currently add support for the LCD panel
>>> from JDI connected with this IC, as found on Xiaomi Mi Mix2s phones.
>>>
>>> Changes in v4:
>>> - No change.
>>>
>>> Changes in v3:
>>> - Embed the support into existing driver (panel-novatek-nt36672a), as
>>>   these two IC are similar with different initialization commands.
>>>
>>
>> This does not go to commit msg (---).
> It depends...
> 
> In the drm sub-system the general rule is if someone cares to write it,
> then it deserves to be added to the commit message.
> So for drm patches it is perfectly fine to have the history part
> included in the commit message.
> 
> These sub-system differences does not makes it easier - I know.

OK, but I find it weird to store "No change" in commit log :)


Best regards,
Krzysztof
