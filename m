Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A111B4DB61A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 17:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3441410E611;
	Wed, 16 Mar 2022 16:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1792E10E60C;
 Wed, 16 Mar 2022 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647447984; x=1678983984;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PNSu56m4SLbujvjO0zWAXzAbkkcKFRH6a/f1wjZtyq0=;
 b=WYJIIxgXp2XsLsqaZEDzN3SE99Z1kLF5mJj53IPJ+3KQVskKW7uCAoOi
 qQQqFAFliOqIXCyHXGTY4inzDd/NaQEoDgY9sX+jgJeaOu/cy7AejK5zO
 JKhXUb9uVjGdojlpVXec0S6t7YUCa6BzlL9BTkwKfHyT4cqOMoe+nMyai A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Mar 2022 09:26:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 09:26:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 09:26:21 -0700
Received: from [10.110.116.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 16 Mar
 2022 09:26:20 -0700
Message-ID: <d65631a3-7875-a853-a655-e9d91693c550@quicinc.com>
Date: Wed, 16 Mar 2022 09:26:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 0/6] Allow drm_writeback_connector to accept pointer to
 drm_encoder
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>
References: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
 <61577b5e-9bae-9924-a195-5aa851e8453b@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <61577b5e-9bae-9924-a195-5aa851e8453b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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

Hi Dmitry

On 3/16/2022 12:40 AM, Dmitry Baryshkov wrote:
> Hi Abhinav,
> 
> On 16/03/2022 02:11, Abhinav Kumar wrote:
>> There are some vendor drivers for which the writeback encoder shares
>> hardware resources such as clocks and interrupts with the rest of the
>> display pipeline. In addition, there can be use-cases where the
>> writeback encoder could be a shared encoder between the physical display
>> path and the writeback path.
>>
>> To accommodate for such cases, change the drm_writeback_connector to
>> accept a pointer to drm_encoder.
>>
>> For existing users of drm_writeback_connector there will not be any
>> change in functionality due to this change.
>>
>> This approach was first posted by Suraj Kandpal here [1] for both
>> encoder and connector. But after discussions [2], the consensus was
>> reached to split this change for the drm_encoder first and the
>> drm_connector part can be reworked in a subsequent change later.
>>
>> Validation of this change was done using igt_writeback tests on
>> MSM based RB5 board using the changes posted here [3].
>>
>> For all other chipsets, these changes were compile-tested.
>>
>> [1] 
>> https://patchwork.kernel.org/project/dri-devel/patch/20220202081702.22119-1-suraj.kandpal@intel.com/ 
>>
>> [2] 
>> https://patchwork.kernel.org/project/dri-devel/patch/20220202085429.22261-6-suraj.kandpal@intel.com/ 
>>
>> [3] https://patchwork.freedesktop.org/series/99724/
>>
>> changes in v2:
>>      - introduce a new API drm_writeback_connector_init_with_encoder()
>>      - allow passing possible_crtcs for existing users of
>>        drm_writeback_connector_init()
>>
>> Abhinav Kumar (6):
>>    drm: allow real encoder to be passed for drm_writeback_connector
>>    drm/komeda: pass possible_crtcs as parameter for
>>      drm_writeback_connector
>>    drm/vkms: pass possible_crtcs as parameter for drm_writeback_connector
>>    drm/vc4: change vc4 driver to use
>>      drm_writeback_connector_init_with_encoder()
>>    drm/rcar_du: pass possible_crtcs as parameter for
>>      drm_writeback_connector
>>    drm/malidp: pass possible_crtcs as parameter for
>>      drm_writeback_connector
> 
> I think we expect that at each commit point the kernel should be 
> compilable. Could you please squash patches accordingly?
> 
> I'd suggest the following patch sequence:
> 
> - Add possible_crtcs to the drm_writeback_connector_init() including all 
> the driver changes (all drivers must be compilable, including vc4)
> - Add drm_writeback_connector_init_with_encoder()
> - Modify vc4 to use new API
> 
> WDYT?

Yes I also thought if each commit point should be compilable.
The way this started out was that in the original series 
https://patchwork.kernel.org/project/dri-devel/patch/20220202081702.22119-1-suraj.kandpal@intel.com/ 
every commit was separated vendor-wise even though it will not compile 
individually.

So I thought that, for ease of code-review perhaps it was alright to 
separate it that way so that individual vendors can review separately.

But if we need to make each of the commits compilable we will have to 
squash the way you have mentioned.

> 
>>
>>   .../drm/arm/display/komeda/komeda_wb_connector.c   |   3 +-
>>   drivers/gpu/drm/arm/malidp_mw.c                    |   5 +-
>>   drivers/gpu/drm/drm_writeback.c                    | 144 
>> +++++++++++++++------
>>   drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |   5 +-
>>   drivers/gpu/drm/vc4/vc4_txp.c                      |  30 ++++-
>>   drivers/gpu/drm/vkms/vkms_writeback.c              |   3 +-
>>   include/drm/drm_writeback.h                        |  27 +++-
>>   7 files changed, 161 insertions(+), 56 deletions(-)
>>
> 
> 
