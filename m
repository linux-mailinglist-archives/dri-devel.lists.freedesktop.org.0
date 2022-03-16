Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A9E4DABEE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 08:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3211B10E644;
	Wed, 16 Mar 2022 07:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8763E10E627
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 07:40:09 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y17so1932866ljd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 00:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7369VGwkpicNIzGOZF8gZ6tMhgIpaEc7GEkTIWLuqms=;
 b=eKUuHCmAQeKJM6X2KwYmFLj2OmM0a5Z6ARedb2n2U3ufkE/z3/9UWGOYZCxJ4AhQZp
 R0ufnx+yk/eImnKCEkSTMsL2mxIiQFTNNu4iqWSi8Ko2HM8ebWaRKXfqLSWIFwktGRDw
 P7DZywuoTofA5kbEUPMcyR5sfcfgVwt0I6H8sM0+JmCrNKb86XfCKlwueo2UPA0wGgrp
 95VNF3CQPinCMUswpZB2eRhkOg0UT927EAK0tG2so5BhEfMzDbrJXSoDgnAzsRbkF312
 BCrep0zlcqbIMIio0Px/0BZwivqTq9xCS1VjFc3ZUGrLYteQ8S5I9ECb8aUEheCF2WHv
 f8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7369VGwkpicNIzGOZF8gZ6tMhgIpaEc7GEkTIWLuqms=;
 b=18FCuYZ0yV0Mkm/u3x/DyKgUjTrbEpIj4CgXFFYLWTGkiWqibI+BRV+gU1W8CY0Yiq
 MCGEsWmNzUjzeLF8XAiUFx4eUnicjWJaIpwq8fIVziJGk1FzTRd/MEzlmDYmMrl7tcfZ
 a3FTeKSVMEXSrcvnL/447eT9FU3yzUFX58TFZ0VVDCshVSMx9+SMc6+sX/CP5wlVU4rd
 xA55HORaDZuIOiQrI4pvM7ZW8O2I10uMbwmV0y4hadVd/R5EEom19FpEILixlsDKfrU+
 yWeoUy3ak2WpAY/4Uq0LarpupB2FjU3fQZeA+cxK+hMK+Px6Upi5mnTQQXC5+jW7yVBt
 4guQ==
X-Gm-Message-State: AOAM532E1LKIn/hreh+r0YLsvfDa9ZSkTaoA87KB+iOrLtMyGUC3AMLH
 5eGTdit+eJYRZIkz/eOsx+UPOQ==
X-Google-Smtp-Source: ABdhPJzjvqeQjrzNda8rUl7QZNVYr7eknYiZ03fqXhcFrOKEwNaYryM9wXXD/kARzlzK2f0Ar1gGTA==
X-Received: by 2002:a2e:b946:0:b0:244:beb1:72b2 with SMTP id
 6-20020a2eb946000000b00244beb172b2mr20118813ljs.240.1647416406578; 
 Wed, 16 Mar 2022 00:40:06 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a05651c020400b00247eb571eb1sm109247ljn.65.2022.03.16.00.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 00:40:06 -0700 (PDT)
Message-ID: <61577b5e-9bae-9924-a195-5aa851e8453b@linaro.org>
Date: Wed, 16 Mar 2022 10:40:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 0/6] Allow drm_writeback_connector to accept pointer to
 drm_encoder
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
References: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 swboyd@chromium.org, melissa.srw@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

On 16/03/2022 02:11, Abhinav Kumar wrote:
> There are some vendor drivers for which the writeback encoder shares
> hardware resources such as clocks and interrupts with the rest of the
> display pipeline. In addition, there can be use-cases where the
> writeback encoder could be a shared encoder between the physical display
> path and the writeback path.
> 
> To accommodate for such cases, change the drm_writeback_connector to
> accept a pointer to drm_encoder.
> 
> For existing users of drm_writeback_connector there will not be any
> change in functionality due to this change.
> 
> This approach was first posted by Suraj Kandpal here [1] for both
> encoder and connector. But after discussions [2], the consensus was
> reached to split this change for the drm_encoder first and the
> drm_connector part can be reworked in a subsequent change later.
> 
> Validation of this change was done using igt_writeback tests on
> MSM based RB5 board using the changes posted here [3].
> 
> For all other chipsets, these changes were compile-tested.
> 
> [1] https://patchwork.kernel.org/project/dri-devel/patch/20220202081702.22119-1-suraj.kandpal@intel.com/
> [2] https://patchwork.kernel.org/project/dri-devel/patch/20220202085429.22261-6-suraj.kandpal@intel.com/
> [3] https://patchwork.freedesktop.org/series/99724/
> 
> changes in v2:
>      - introduce a new API drm_writeback_connector_init_with_encoder()
>      - allow passing possible_crtcs for existing users of
>        drm_writeback_connector_init()
> 
> Abhinav Kumar (6):
>    drm: allow real encoder to be passed for drm_writeback_connector
>    drm/komeda: pass possible_crtcs as parameter for
>      drm_writeback_connector
>    drm/vkms: pass possible_crtcs as parameter for drm_writeback_connector
>    drm/vc4: change vc4 driver to use
>      drm_writeback_connector_init_with_encoder()
>    drm/rcar_du: pass possible_crtcs as parameter for
>      drm_writeback_connector
>    drm/malidp: pass possible_crtcs as parameter for
>      drm_writeback_connector

I think we expect that at each commit point the kernel should be 
compilable. Could you please squash patches accordingly?

I'd suggest the following patch sequence:

- Add possible_crtcs to the drm_writeback_connector_init() including all 
the driver changes (all drivers must be compilable, including vc4)
- Add drm_writeback_connector_init_with_encoder()
- Modify vc4 to use new API

WDYT?

> 
>   .../drm/arm/display/komeda/komeda_wb_connector.c   |   3 +-
>   drivers/gpu/drm/arm/malidp_mw.c                    |   5 +-
>   drivers/gpu/drm/drm_writeback.c                    | 144 +++++++++++++++------
>   drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |   5 +-
>   drivers/gpu/drm/vc4/vc4_txp.c                      |  30 ++++-
>   drivers/gpu/drm/vkms/vkms_writeback.c              |   3 +-
>   include/drm/drm_writeback.h                        |  27 +++-
>   7 files changed, 161 insertions(+), 56 deletions(-)
> 


-- 
With best wishes
Dmitry
