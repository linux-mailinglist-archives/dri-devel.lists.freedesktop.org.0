Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2BF6F08C0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 17:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC9D10EB87;
	Thu, 27 Apr 2023 15:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8259C10EB8F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 15:51:41 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94f32588c13so1301196966b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610699; x=1685202699;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+mQKmq64IzU6gA8PRckyzZWN74UV32uV9BZ4pCPB8Xo=;
 b=xbTzydXiB45GZBhngRv9S410dndV58uP5gC9rdhXPKrndvnxbL+k28jY43oMktxKAH
 yKLyof3MzTW8rcY8vgU9OAYUlS5a5ROJhrN15lIC+m+AgukMJ6QBKMwqIhogtEAgrqQl
 OXVmWpMpvfnRllkqid0hO6D8KHGC+xfpPs5H6GlHWN7OxOl12tzyE1z2C9lxCCKVPyw0
 yWRRUsrIfmDTyK5VJtfgdaLTmi5kGgf5uIVzTHOr6xFutLkt4WN9iM29tAnyhrZfo262
 W1YSPIzrE9K/I1Bpi/M21+wiJTBnztVXIinGeGApXNdk2c8g3RFHavcZYvoEXEOwFIms
 pYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610699; x=1685202699;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+mQKmq64IzU6gA8PRckyzZWN74UV32uV9BZ4pCPB8Xo=;
 b=VF3aykWBxf08kDW1N50VMRK3eZKEdnO6YKycckuV5J4tqHAIfF0oWsErh0VMdaJ+mh
 zcY4pEKRWhKS7CDfJ45BeCQZy5mq9a/E0uF+YaRWxwNqGCJ+pAQzFp9dAS69fHhcmiYZ
 jPERqtONxvZ2904YEhg4lHsNQHIYYfO7zI8w7nJPjMG8GDLMR9YU5rmY8phdJU8kkj8k
 6ljclx+YzOHaSm2zXUz/AuazPMGllHEOryzahI5J/8YCwjMJk2V5LO37hErP8pyws0Oi
 zQhfMzrpJyknocq6m7DzaAHqsvvHwiXfd7FfOFlLC9LJj6AasLb6voMzLoTf8Nl+ekXd
 jHoQ==
X-Gm-Message-State: AC+VfDyTUuDUgijJeeitWczyBjPwG7G47+7T09n05GEEBQv1GXt3A2Xp
 IiR3CdBSOWQIahtEH9F+y8em5w==
X-Google-Smtp-Source: ACHHUZ6tPpIadoFIIjyJbIU0huYg0xNoVftC3qhHAqzwK9pzp5KjXzd5PNdYvyZnKKgA0LDbvtYy8A==
X-Received: by 2002:a17:907:1629:b0:94e:6b12:caab with SMTP id
 hb41-20020a170907162900b0094e6b12caabmr2587483ejc.51.1682610699440; 
 Thu, 27 Apr 2023 08:51:39 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170906710300b0094f2f0c9ed9sm9709424ejj.167.2023.04.27.08.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 08:51:38 -0700 (PDT)
Message-ID: <30f8e69f-b1f1-a9c5-e2ee-1be021a11393@linaro.org>
Date: Thu, 27 Apr 2023 18:51:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 00/10] drm/hdcp: Pull HDCP auth/exchange/check into
 helpers
Content-Language: en-GB
To: Doug Anderson <dianders@chromium.org>,
 Mark Yacoub <markyacoub@chromium.org>
References: <20230419154321.1993419-1-markyacoub@google.com>
 <CAD=FV=V1+PMH3YGOcnvziOC7-_NY1yO4w=b4q2RLCdtEtETB3Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=V1+PMH3YGOcnvziOC7-_NY1yO4w=b4q2RLCdtEtETB3Q@mail.gmail.com>
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
Cc: suraj.kandpal@intel.com, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, seanpaul@chromium.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/04/2023 19:29, Doug Anderson wrote:
> Hi,
> 
> On Wed, Apr 19, 2023 at 8:43 AM Mark Yacoub <markyacoub@chromium.org> wrote:
>>
>> Hi all,
>> This is v10 of the HDCP patches. The patches are authored by Sean Paul.
>> I rebased and addressed the review comments in v6-v10.
>>
>> Main change in v10 is handling the kernel test bot warnings.
>>
>> Patches 1-4 focus on moving the common HDCP helpers to common DRM.
>> This introduces a slight change in the original intel flow
>> as it splits the unique driver protocol from the generic implementation.
>>
>> Patches 5-7 split the HDCP flow on the i915 driver to make use of the common DRM helpers.
>>
>> Patches 8-10 implement HDCP on MSM driver.
>>
>> Thanks,
>> -Mark Yacoub
>>
>> Sean Paul (10):
>>    drm/hdcp: Add drm_hdcp_atomic_check()
>>    drm/hdcp: Avoid changing crtc state in hdcp atomic check
>>    drm/hdcp: Update property value on content type and user changes
>>    drm/hdcp: Expand HDCP helper library for enable/disable/check
>>    drm/i915/hdcp: Consolidate HDCP setup/state cache
>>    drm/i915/hdcp: Retain hdcp_capable return codes
>>    drm/i915/hdcp: Use HDCP helpers for i915
>>    dt-bindings: msm/dp: Add bindings for HDCP registers
>>    arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
>>    drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
>>
>>   .../bindings/display/msm/dp-controller.yaml   |    7 +-
>>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |    8 +
>>   drivers/gpu/drm/display/drm_hdcp_helper.c     | 1224 +++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_atomic.c   |    8 +-
>>   drivers/gpu/drm/i915/display/intel_ddi.c      |   32 +-
>>   .../drm/i915/display/intel_display_debugfs.c  |   12 +-
>>   .../drm/i915/display/intel_display_types.h    |   51 +-
>>   drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  352 ++---
>>   drivers/gpu/drm/i915/display/intel_dp_mst.c   |   16 +-
>>   drivers/gpu/drm/i915/display/intel_hdcp.c     | 1060 +++-----------
>>   drivers/gpu/drm/i915/display/intel_hdcp.h     |   48 +-
>>   drivers/gpu/drm/i915/display/intel_hdmi.c     |  267 ++--
>>   drivers/gpu/drm/msm/Kconfig                   |    1 +
>>   drivers/gpu/drm/msm/Makefile                  |    1 +
>>   drivers/gpu/drm/msm/dp/dp_catalog.c           |  156 +++
>>   drivers/gpu/drm/msm/dp/dp_catalog.h           |   18 +
>>   drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
>>   drivers/gpu/drm/msm/dp/dp_debug.h             |   11 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c           |   39 +-
>>   drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
>>   drivers/gpu/drm/msm/dp/dp_drm.c               |   39 +-
>>   drivers/gpu/drm/msm/dp/dp_drm.h               |    7 +
>>   drivers/gpu/drm/msm/dp/dp_hdcp.c              |  389 ++++++
>>   drivers/gpu/drm/msm/dp/dp_hdcp.h              |   33 +
>>   drivers/gpu/drm/msm/dp/dp_parser.c            |   14 +
>>   drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h               |   30 +-
>>   drivers/gpu/drm/msm/msm_atomic.c              |   19 +
>>   include/drm/display/drm_hdcp.h                |  296 ++++
>>   include/drm/display/drm_hdcp_helper.h         |   23 +
>>   30 files changed, 2867 insertions(+), 1349 deletions(-)
> 
> Mark asked me if I had any advice for getting this patch series
> landed. I haven't been following the patch series super closely, but
> as I understand it:
> 
> 1. The first several patches (the generic ones) seem fairly well
> reviewed and haven't changed in any significant ways in a while. The
> ideal place to land these would be drm-misc, I think.
> 
> 2. The i915 patches also seem OK to land. The ideal place would be the
> Intel DRM tree, I think.
> 
> 3. The msm patches are not fully baked yet. Not only is there a kernel
> bot complaint on patch #10, but Mark also said that comments from v6
> haven't yet fully been addressed and he's talked with Dmitry on IRC
> about this and has a plan to move forward.
> 
> 
> The question becomes: can/should we land the generic and maybe the
> i915 patches now while the msm patches are reworked. Do folks have an
> opinion here? If we're OK landing some of the patches, I guess we have
> a few options:
> 
> a) Just land the generic patches to drm-misc and put the i915 ones on
> the backburner until drm-misc has made it to somewhere that the
> drm-intel tree is based on. If we want to go this route and nobody
> objects, I don't mind being the person who does the gruntwork of
> actually landing them on drm-misc-next, though I certainly wouldn't
> rush to make sure that nobody is unhappy with this idea.
> 
> b) Land the generic patches in some type of immutable branch so they
> can be pulled into drm-misc and the Intel DRM tree. Someone more
> senior to me would need to help with this, but if we really want to go
> this way I can poke folks on IRC.
> 
> c) Land the generic and Intel patches in the Intel tree. The msm
> patches would not be able to land until these trickled up the chain,
> but the msm patches aren't fully ready yet anyway so maybe this is OK.
> 
> d) Land the generic and Intel patches in the drm-misc tree. If folks
> are OK with this I can be the person to pull the trigger, but I'd want
> to be very sure that Intel DRM folks are on board. :-)
> 
> 
> My preference would be c), then d), then a), then b). ...this is all
> assuming, of course, that nobody on this thread objects to landing the
> generic/i195 patches now.

I'd also vote for c) I think it would be the best if the relevan patches 
can be taken in the drm-intel after the -rc1. Once the msm patches are 
finalized, we can back-merge drm-next and apply our part on top of that.

> 
> 
> -Doug

-- 
With best wishes
Dmitry

