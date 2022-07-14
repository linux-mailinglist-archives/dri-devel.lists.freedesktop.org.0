Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00E1574ACA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 12:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C484A4636;
	Thu, 14 Jul 2022 10:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE5CA4634
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 10:37:22 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t25so2085822lfg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uaEFO5hsaLFOuZUt6jv+BOAU4jn79YFWKdkb/288PyQ=;
 b=R2ZI+qVyNbDDND0je3vBpsX+whHW04w068WNIxvhb21zT9Yl6mNklU1yX6mnEzRuQe
 D9rZ0fWwMQut75SIEgZK31MGeW1Gnn5WW71LRvZd1a6sJXpOIEMvX3j8T9u4ZZGcJ0rD
 XP5QV366XN1eMvJwp1NdjgUmeE6l0tizHxphnC6ZkaHzcolt19mdkvqoNL70EF3zXIxR
 kgUWNfgzv4A+AjVhScdW7KjxCvDeu/bg/V0DTTCQlY1dx7kd8EAvxT2BrqQGoB9TUzvO
 4oyWa2EpxzY93k/um3j6qRzPCCnRTBctTNBmFj3wOHKV+8w+ziaPxRxJ+TkPvHIZ2EMT
 cUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uaEFO5hsaLFOuZUt6jv+BOAU4jn79YFWKdkb/288PyQ=;
 b=0VdFE8Iy30zA2rrg3BxSxdxNr0xmgy94vju93DMI8mcXSwuqryQ81LiZqOjEo11A4n
 W6mh7fy/TQy0jnFMH4FdEY/BjJjYDaGdiByo4SfwtRssKBbKyA36WJjKQQEkcomYEA0k
 I4V00pOtrGftFegC5FOhhxFVB9xnNE8CdB68+4FNdMN2MU7L8llpCjNaXpEBH2D6IcNz
 eirJIwnfe3ft559+RXYWtWMn35st8dD71gZ00uwS8NhTvmKSjOY4I15oAP+5kD51lAO6
 SMVZq79EM5v13WR/7WIA/aOkjjwsx11gs9IC4KNs8KwoIlCv4XLkvvRB1pIdDGv12Jwe
 XwDg==
X-Gm-Message-State: AJIora9OdMoeby6FlGjL8Bm59FlehNDM0LpGY2Y1yrCVylCQd0MZiwIB
 QLHha0V5mm5+INg4J4r9A6y0Sw==
X-Google-Smtp-Source: AGRyM1utxf3jocJYTmp4lOuPbooaWLQuu8+R22i2G4eb4lV2hNEFPxG8ZtPUZxVm2Iolc9dcifvbbw==
X-Received: by 2002:a05:6512:3503:b0:481:4470:4134 with SMTP id
 h3-20020a056512350300b0048144704134mr4704424lfs.42.1657795040467; 
 Thu, 14 Jul 2022 03:37:20 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 be6-20020a056512250600b00478f174c598sm288201lfb.95.2022.07.14.03.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 03:37:20 -0700 (PDT)
Message-ID: <8d31e36d-5cdb-fd5b-b807-a31e65e57d8f@linaro.org>
Date: Thu, 14 Jul 2022 12:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/9] dt-bindings: msm/dp: mark vdda supplies as
 deprecated
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
 <bd84ef20-e6e1-74e5-5681-7aa273d5255c@linaro.org>
 <35cbf2d1-f851-fb6b-309a-8d7499b4abb3@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <35cbf2d1-f851-fb6b-309a-8d7499b4abb3@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/07/2022 12:15, Dmitry Baryshkov wrote:
> On 14/07/2022 12:38, Krzysztof Kozlowski wrote:
>> On 10/07/2022 10:41, Dmitry Baryshkov wrote:
>>> The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
>>> functions from eDP/DP controller") removed support for VDDA supplies
>>
>> No such commit exists in next. Do not reference unpublished commits. If
>> this is your tree, be sure that it is in next.
> 
> Excuse me. It might have changed at some point. I will update the patch 
> description in the next revision. The commit in question is 7516351bebc1 
> ("drm/msm/dp: delete vdda regulator related functions from eDP/DP 
> controller")
> 
>>
>>> from the DP controller driver. These supplies are now handled by the eDP
>>> or QMP PHYs. Mark these properties as deprecated and drop them from the
>>> example.
>>
>> Right now I cannot judge whether this is correct or not. I don't know
>> what's in that commit, but in general driver implementation changes do
>> not warrant changes in the binding.
> 
> The vdda supplies were initially made a part of DP controller binding, 
> however lately they were moved to be a part of eDP/DP PHY binding (as 
> this better reflects the hardware). DP driver dropped support for these 
> supplies too. Thus I wanted to mark these supplies as deprecated to 
> discourage using them in the DTS files.

OK. Just better to reference the commit which adds them to PHY binding.

Best regards,
Krzysztof
