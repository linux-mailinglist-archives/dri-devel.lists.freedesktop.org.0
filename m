Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF2870A32B
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 01:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C624610E002;
	Fri, 19 May 2023 23:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199A310E002
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 23:07:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso4204898e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 16:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684537672; x=1687129672;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=43YdYe7KRFyBK0w7n3EcwpxdcNN60o5/PNjdN69WLRE=;
 b=GmNtGphrlRQF1qyb6aIFbNE0RXyu00lNaH6KSnHzZt8ITVaItNteOgnXqgJ2KG14hV
 zsv+Ma8v89oMEGRcJhAn47jfVpLq89jvQJZKbyyE1MQ+2SkACYI7KBJrq8k8REEeahfo
 AqFZzLh36JrSLbVx/OUaCNSqyXGDBZ4CUEexzl1rFx6Nrh1QzLpPf/oBdMPDUDoU+6m7
 8bE0piH2mczpdA4HWVAN9x8t/rcS8wQsm1Woqg6r89AlFgIisAlw513sE1qkNBdTXJmm
 l/3OJ1lbGrtKZawCpOUgyG0dLAihFNksb+SbicA4GFi7mHWszlL6lXVJN8J0/X0pJtUo
 /vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684537672; x=1687129672;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=43YdYe7KRFyBK0w7n3EcwpxdcNN60o5/PNjdN69WLRE=;
 b=Ndqo9g11tdidyY5MIWrN20YS5eg9PTG7Y/4pnbsZbHMwDGT7/fh+vDeL0zFIHvoOEr
 gOKVT51saQbN07ZNgSwL8gDl+BkhHDVRMTXT+0rCGepdGgcM7xkYJDzicrD9CD9A/eks
 jBePDmGoY4HCyYDhWk0qok/wO59uT4YmMZoUNqZuOHHUvuFO20vT32EICKUgwVumVwBG
 wGL+VB7XG87iBtKkkH5D+ViOk7WmceTdKIJak31ZEcnvPtnOli9hMnajZCghFZkSrMAy
 RDFlpgPbm7VJGmuG7b+OomwnnAk9/Z7hUha9ilHYCS+IqBXrE3INjev18h3Ua3p7MD0a
 5a9A==
X-Gm-Message-State: AC+VfDwUPduV2DucbbfgCTebYZrEjZeoJl9Uki8sQRBnYTEk7hFZnAQ0
 39ezs61OJl6L0aZ11hobfZdWxg==
X-Google-Smtp-Source: ACHHUZ6dViGfPO87BbDBI2O8Py7xXiTQT3XUCZLFizpMLiThr7AyP+2s1numQ0Ui5WdlsxiCPqyPrg==
X-Received: by 2002:a05:6512:3742:b0:4e9:9e45:3470 with SMTP id
 a2-20020a056512374200b004e99e453470mr1154787lfs.3.1684537672142; 
 Fri, 19 May 2023 16:07:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ac2418f000000b004eed68a68efsm48130lfh.280.2023.05.19.16.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 16:07:51 -0700 (PDT)
Message-ID: <27b4bce7-2f63-9199-71e6-4ed52a96d0c1@linaro.org>
Date: Sat, 20 May 2023 02:07:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 00/10] drm/hdcp: Pull HDCP auth/exchange/check into
 helpers
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230419154321.1993419-1-markyacoub@google.com>
 <0c702f15-c842-8eab-cc95-83378236773c@linaro.org>
 <ZGfnNBRUN72IXRjy@rdvivi-mobl4>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ZGfnNBRUN72IXRjy@rdvivi-mobl4>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, suraj.kandpal@intel.com,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 freedreno@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/05/2023 00:16, Rodrigo Vivi wrote:
> On Fri, May 19, 2023 at 07:55:47PM +0300, Dmitry Baryshkov wrote:
>> On 19/04/2023 18:43, Mark Yacoub wrote:
>>> Hi all,
>>> This is v10 of the HDCP patches. The patches are authored by Sean Paul.
>>> I rebased and addressed the review comments in v6-v10.
>>>
>>> Main change in v10 is handling the kernel test bot warnings.
>>>
>>> Patches 1-4 focus on moving the common HDCP helpers to common DRM.
>>> This introduces a slight change in the original intel flow
>>> as it splits the unique driver protocol from the generic implementation.
>>>
>>> Patches 5-7 split the HDCP flow on the i915 driver to make use of the common DRM helpers.
>>>
>>> Patches 8-10 implement HDCP on MSM driver.
>>>
>>> Thanks,
>>> -Mark Yacoub
>>>
>>> Sean Paul (10):
>>>     drm/hdcp: Add drm_hdcp_atomic_check()
>>>     drm/hdcp: Avoid changing crtc state in hdcp atomic check
>>>     drm/hdcp: Update property value on content type and user changes
>>>     drm/hdcp: Expand HDCP helper library for enable/disable/check
>>>     drm/i915/hdcp: Consolidate HDCP setup/state cache
>>>     drm/i915/hdcp: Retain hdcp_capable return codes
>>>     drm/i915/hdcp: Use HDCP helpers for i915
>>>     dt-bindings: msm/dp: Add bindings for HDCP registers
>>>     arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
>>
>> Dear i915 maintainers,
>>
>> I wanted to ping you regarding this patch series. If there are no comments
>> for the series from you side, would it be possible to land Intel-specific
>> and generic patches into drm-intel tree? We will continue working on the msm
>> specific parts and merge them through the msm tree.
> 
> pushed to drm-intel-next.
> 
> should be propagated in a few weeks to drm-next on our next pull request.

Probably there is some kind of confusion here. You've pushed the DSC 
patches, while the response was sent to the HDCP series.

-- 
With best wishes
Dmitry

