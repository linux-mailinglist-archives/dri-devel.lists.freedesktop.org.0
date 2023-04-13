Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5DB6E02FA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 02:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F5C10E9E7;
	Thu, 13 Apr 2023 00:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5BC10E9DB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 00:05:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z8so18712799lfb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 17:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681344338; x=1683936338;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hqDd36Xna87Ja2uYucxlmnJMfm1J2VYsmJqSFbSPlQI=;
 b=M2ED25aGEQVOUIoOeRvJA2/4Um84MCt5oMI1eOqRhZd8MaV4+Y1TPJNHMs8KrwEY2f
 WOHVw7C8nwV27UhqErNVsyhXMCqgrcapez/Zf1h+f9z7IYby3I0/uvalUY9nrtojPuYO
 LSpCxy5Ve4IAq8jtu3D/xJEpdORhA+7dHclgVsx4MthRUReDLdPHUN6GI0yXWxESO4KU
 dg908a/VRgW5Pv8dEf2t/RRKLmoO4iu3KMWnKEE0wJAu0/aoXeC9muMdokqYdTSocjsg
 PlcI1sEJC48Epuh/H733VE60yHmlakZIdcSszVXRgS/mtkZMK60qgbEy7Z5frThxcFSO
 1NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681344338; x=1683936338;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hqDd36Xna87Ja2uYucxlmnJMfm1J2VYsmJqSFbSPlQI=;
 b=FAoRqUUQANAxhU6PoU8BnTtzhK+hOc8sC7PQ/y2yA9DfOPsKZdWLY+YrxDrBt3iroG
 0eHuvLfIgmT7DGLhwYD+3HHeEE9J71RF38NjN46lhfbAtuT8sdPfGdX3QMLfts4VKa9x
 vp9p82prebt3bX0dUQFIaFG7oNKSJFz8FbChT8SjZz07gE6eLUcuUygRGU2ez557HLIS
 /Xu/+/CPpZL/g0pBw+5ixCQgswFUQj84GEiYjCtAPBj4ZGQ101R15S+Wn99ZmyjOmcZb
 1e96eEsAG39DH0PMK5FbG9Ewem/kEkKM7qyOT5/dHvmZfvX0bsw0UZo4pMjh+wvbFZH2
 Vljw==
X-Gm-Message-State: AAQBX9fF1rPi+vY/dwHL9qe+ou8MC6krp235i0R7MTHVREUEaK7eomPH
 sMetqwMMSgkb3S7mM9ZF2lfQQw==
X-Google-Smtp-Source: AKy350aWaxxBspAXIGmezaj+Yjct61vVYleYqotsiazvOmF9AB3dmyba3DsfUjtzvzVvI0N9utag3Q==
X-Received: by 2002:ac2:4461:0:b0:4ec:84ec:db0c with SMTP id
 y1-20020ac24461000000b004ec84ecdb0cmr183251lfl.52.1681344338198; 
 Wed, 12 Apr 2023 17:05:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w7-20020ac254a7000000b004eca35798a4sm41537lfk.32.2023.04.12.17.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 17:05:37 -0700 (PDT)
Message-ID: <b1b6ddc7-a793-a1b4-8dd6-8ea69b6e5573@linaro.org>
Date: Thu, 13 Apr 2023 03:05:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 6/8] drm/msm/dsi: Add check for slice_width in
 dsi_timing_setup
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v5-6-0108401d7886@quicinc.com>
 <c829ff2f-f676-8c6d-2681-1b5da4f9ede7@linaro.org>
 <e72a1e24-72e1-aad4-bc8f-f23dc84780dc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e72a1e24-72e1-aad4-bc8f-f23dc84780dc@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/04/2023 01:40, Abhinav Kumar wrote:
> 
> 
> On 4/12/2023 12:24 PM, Dmitry Baryshkov wrote:
>> On 12/04/2023 22:09, Jessica Zhang wrote:
>>> Add a check for valid dsc->slice_width value in dsi_timing_setup.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 508577c596ff..6a6218a9655f 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -937,6 +937,12 @@ static void dsi_timing_setup(struct msm_dsi_host 
>>> *msm_host, bool is_bonded_dsi)
>>>               return;
>>>           }
>>> +        if (!dsc->slice_width || (mode->hdisplay < dsc->slice_width)) {
>>
>> This is an erroneous condition, correct. Can we move it to a better 
>> place, where we can return an error instead of ignoring it?
>>
>> I'd say that we should validate dsc->slice_width at the 
>> dsi_host_attach(). It well might be a good idea to add a helper that 
>> validates required dsc properties (e.g. version, bpp/bpc, slice_width, 
>> slice_height, slice_count).
>>
>> As for the mode->hdisplay, we have the following code in 
>> msm_dsi_host_check_dsc() (where pic_width = mode->hdisplay):
>>
>> if (pic_width % dsc->slice_width) {...}
>>
>> This way the only way how mode->hdisplay can be less than 
>> dsc->slice_width is if mode->hdisplay is 0 (which is forbidden if I 
>> remember correctly). So the second part of the check is useless.
>>
> 
> Lets drop this from this series and come up with a better approach to 
> validate dsc params. We will take it up once dsc over dsi and dp lands.

Sure, why not.

> 
>>> +            pr_err("DSI: invalid slice width %d (pic_width: %d)\n",
>>> +                   dsc->slice_width, mode->hdisplay);
>>> +            return;
>>> +        }
>>> +
>>>           dsc->pic_width = mode->hdisplay;
>>>           dsc->pic_height = mode->vdisplay;
>>>           DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>>>
>>

-- 
With best wishes
Dmitry

