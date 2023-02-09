Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CEA690A8D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8291210EACD;
	Thu,  9 Feb 2023 13:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFF610EAD2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:40:23 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id rp23so6393620ejb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 05:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G/9XwFYeUJst3WJ5sHdQjwXF4qwQvevEf5WU7yUqIXY=;
 b=OMw/A+V2/U2vAN546ixC6VrsB9usPnMiYZ1EGlPxuAOxWOMjTiKzuwiUruCmZ+0HlE
 5Sp63S1ZpYZVQTOqaN6t6gUA9o3xy9nImsCREWI5h3iMStvajaS1JjKUqPM6JkYgBpDE
 3+mnH2e1S1uHxCl553jXTY8nl0pus4Iln/TAoKk9arW14IzuDP4UvjXFPbUF/Pzn89id
 I8d/W49sVknCcIiL9D3riigh6YM0A6B/IjMwxl0l5IIhVgen/+gv8HChuEeE6vZI6rOV
 TnZmKKE8Ubb9EQcOZ1R5lTkJprUk20Ju7BsDrM92K7bamJBLiPFipfOn9InyaQ2UjivK
 IK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G/9XwFYeUJst3WJ5sHdQjwXF4qwQvevEf5WU7yUqIXY=;
 b=QOtlYQB7t+TBaWIiGacF8piYIueVMHGzs9tykNZY7uxxIjUM52FurmzfQT9CZz7EMv
 dQwCEBesR1rq/aGjJjmCpcyv6y5z5mo2kWccHfGMccxmhzDZ0xR5rMBv8OarkvUPY9uM
 6NJJMh7M1zDgATjbOOxWO1cAtUTtIFKrxM0EKWsuViK4SEOk86mKgjlvfnK9DUHCZts8
 Pz23u20FthwatM9B/jdUQn80syLCiKNYsWEAa9vtuHUn7dUPKLk2l0JOPJfo6kLHF7FJ
 Kx09mCuQODSl94RxGFkxqBJWibKtmnX0sP51aE/yEqDwBD7l1X2HLYllcmu4pOX6c2Te
 hxLg==
X-Gm-Message-State: AO0yUKV3UGLbFxvwSmXCcppe5VJw7FB++0hCF2ajOQTmsBLI4wlRKa+w
 nLIyVuvJoYr95+/zRM5h+NF0iA==
X-Google-Smtp-Source: AK7set/izK6rzb2b5i3ycv/Vv8MsWMV7WDdfIFo7kARlIFT3ylMk6KZs8PsO+wT3uFrG2bxHo8cvmw==
X-Received: by 2002:a17:906:4f99:b0:887:981:5f7c with SMTP id
 o25-20020a1709064f9900b0088709815f7cmr11967561eju.11.1675950021723; 
 Thu, 09 Feb 2023 05:40:21 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170906d10500b008784bc1dd05sm877502ejz.76.2023.02.09.05.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 05:40:20 -0800 (PST)
Message-ID: <dea3c40e-bdd8-1276-409d-3ddb35b004bc@linaro.org>
Date: Thu, 9 Feb 2023 15:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: sm8350: reorder device nodes
Content-Language: en-GB
To: Bjorn Andersson <andersson@kernel.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-5-dmitry.baryshkov@linaro.org>
 <20230209032841.ybqveepeyjqo63ql@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230209032841.ybqveepeyjqo63ql@ripper>
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2023 05:28, Bjorn Andersson wrote:
> On Mon, Feb 06, 2023 at 04:57:03PM +0200, Dmitry Baryshkov wrote:
>> Start ordering DT nodes according to agreed order. Move apps SMMU, GIC,
>> timer, apps RSC, cpufreq ADSP and cDSP nodes to the end to the proper
>> position at the end of /soc/.
>>
> 
> I think "according to agreed order" means "sorted by address", but it
> would be nice to have that expressed in the message. If nothing else for
> others to know what such agreed order might be.
> 
> 
> Unfortunately this doesn't apply to my tree, and it's not clear where it
> failed. Could you please rebase this?

Done

-- 
With best wishes
Dmitry

