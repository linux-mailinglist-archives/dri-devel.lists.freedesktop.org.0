Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AC14E9DC4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEED610E6EE;
	Mon, 28 Mar 2022 17:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA4310E6EE;
 Mon, 28 Mar 2022 17:46:30 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bg10so30246466ejb.4;
 Mon, 28 Mar 2022 10:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SymjDndU9Uze0JvEagAd5eX9OKJosBWeGBfW/S+DSuM=;
 b=Z3mezvkFtrKwM2FAqMnLvQwkbmLD4frPCJzQsImS/mGIGSl/huwuVaTfUxpa5SoMnu
 EgCwTzcnuJ1osunTWbmUpQ666EVCzst6+34T3mn3yW0o91GH14iWo0OHUehJHPpxfXXR
 NgE60K0ZworKv25xuZaTmq2I9WajV23kzWvKNlRZtEGl0Ny/aWFzF7zfqcApdfyjK23D
 GGf/VvtCdsrZgNCDlG+SGyeYD9Dkl5LjawFxS2seGHqSoMI5bcrTl3VxbtVKKhM9NHF/
 g1MqNbqDDm/XNwhc+hD8rFhUFGiXM2qziiOsv7EpQXtcr7kWBK+l0GPdluH2SvqTkLlp
 pf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SymjDndU9Uze0JvEagAd5eX9OKJosBWeGBfW/S+DSuM=;
 b=DRvX27dVoH8xa89xuqFTtllRsLC6Ez2Qxcc6xA+Hseu5ea/Llt1BQNGJPScc5T6bZD
 6iibIjxfRjbRlcY2F86c1yoQKwKK+YzGtrNKk7BBkpEaNN7WWaQih0xhflMWAQdH8NPa
 omJF7WaIVncNLB0MV0E4FjTKS4Iizvc0tCJPxb3ppntni1ymAf45XbXrBV4GxyS8A7rh
 C4F2C1Xg3bZvU08p02RSolEfFPwxNzeIi6DpgGQx4w0EZkRC1o4gC+g/nETKHc+PvWCv
 3O2S3zxbGW1cpqbwSOTH8nzLpKZvZk0olMMDBcyIXVaFkJO1OSzDTFFuTL1YCcr4/Bx4
 XX0w==
X-Gm-Message-State: AOAM532z+7YrPaBTSigUNnolCdBXXCjl0R3CiK5FZAuXCQU+vYcHo2gh
 JqrmmoO7msEa5bvjQcbqcI4=
X-Google-Smtp-Source: ABdhPJxaGdkB/uFHJglSvsw95vcYxutlSaP+i+Kh24dzvA/n1NXG5rLzCDrO1Hs+2ipo/scsx2YleQ==
X-Received: by 2002:a17:907:6da6:b0:6e0:bb24:f731 with SMTP id
 sb38-20020a1709076da600b006e0bb24f731mr18461252ejc.25.1648489589063; 
 Mon, 28 Mar 2022 10:46:29 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:4276:c469:b15d:9dea?
 ([2a02:908:1252:fb60:4276:c469:b15d:9dea])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a50e68b000000b00412ec8b2180sm7324782edm.90.2022.03.28.10.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 10:46:28 -0700 (PDT)
Message-ID: <426855bc-9480-ad47-c362-f2a73c0c8ce9@gmail.com>
Date: Mon, 28 Mar 2022 19:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/amd/display: detach fpu operations from
 dcn10_validate_bandwidth in calcs
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20220326202448.2046077-1-mwen@igalia.com>
 <20220326202448.2046077-2-mwen@igalia.com>
 <1586f68e-c635-482f-9399-2b027b766543@amd.com>
 <20220328171738.iu5peqfcled2psv3@mail.igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220328171738.iu5peqfcled2psv3@mail.igalia.com>
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
Cc: sunpeng.li@amd.com, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Jasdeep Dhillon <jdhillon@amd.com>,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.03.22 um 19:17 schrieb Melissa Wen:
> On 03/28, Christian König wrote:
>> Am 26.03.22 um 21:24 schrieb Melissa Wen:
>>> dcn10_validate_bandwidth is only used on dcn10 files, but is declared in
>>> dcn_calcs files. Rename dcn10_* to dcn_* in calcs, remove DC_FP_* wrapper
>>> inside DML folder and create an specific dcn10_validate_bandwidth in
>>> dcn10_resources that calls dcn_validate_bandwidth and properly wraps that
>>> FPU function with DC_FP_* macro.
>>>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>    .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  | 14 ++++++++++++++
>>>    .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |  5 +----
>>>    drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |  2 +-
>>>    3 files changed, 16 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
>>> index 4048908dd265..1587a060b55a 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
>>> @@ -1141,6 +1141,20 @@ static void dcn10_destroy_resource_pool(struct resource_pool **pool)
>>>    	*pool = NULL;
>>>    }
>>> +static bool dcn10_validate_bandwidth(
>>> +		struct dc *dc,
>>> +		struct dc_state *context,
>>> +		bool fast_validate)
>>> +{
>>> +	bool voltage_supported;
>>> +
>>> +	DC_FP_START();
>>> +	voltage_supported = dcn_validate_bandwidth(dc, context, fast_validate);
>>> +	DC_FP_END();
>>> +
>>> +	return voltage_supported;
>>> +}
>>> +
>>>    static enum dc_status dcn10_validate_plane(const struct dc_plane_state *plane_state, struct dc_caps *caps)
>>>    {
>>>    	if (plane_state->format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
>>> index e447c74be713..c25023f7d604 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
>>> @@ -764,7 +764,7 @@ static unsigned int get_highest_allowed_voltage_level(uint32_t chip_family,
>>>    	return 4;
>>>    }
>>> -bool dcn10_validate_bandwidth(
>>> +bool dcn_validate_bandwidth(
>>>    		struct dc *dc,
>>>    		struct dc_state *context,
>>>    		bool fast_validate)
>>> @@ -790,7 +790,6 @@ bool dcn10_validate_bandwidth(
>>>    		dcn_bw_sync_calcs_and_dml(dc);
>>>    	memset(v, 0, sizeof(*v));
>>> -	DC_FP_START();
>>>    	v->sr_exit_time = dc->dcn_soc->sr_exit_time;
>>>    	v->sr_enter_plus_exit_time = dc->dcn_soc->sr_enter_plus_exit_time;
>>> @@ -1323,8 +1322,6 @@ bool dcn10_validate_bandwidth(
>>>    	bw_limit = dc->dcn_soc->percent_disp_bw_limit * v->fabric_and_dram_bandwidth_vmax0p9;
>>>    	bw_limit_pass = (v->total_data_read_bandwidth / 1000.0) < bw_limit;
>>> -	DC_FP_END();
>>> -
>>>    	PERFORMANCE_TRACE_END();
>>>    	BW_VAL_TRACE_FINISH();
>>> diff --git a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
>>> index 337c0161e72d..806f3041db14 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
>>> +++ b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
>>> @@ -619,7 +619,7 @@ struct dcn_ip_params {
>>>    };
>>>    extern const struct dcn_ip_params dcn10_ip_defaults;
>>> -bool dcn10_validate_bandwidth(
>>> +bool dcn_validate_bandwidth(
>>>    		struct dc *dc,
>>>    		struct dc_state *context,
>>>    		bool fast_validate);
>> Just for the record: That's not really usual kernel coding style, but that's
>> not topic of this patch set.
> Yeah. I didn't change the code style to ease any version conflict management.
>> The series is Acked-by: Christian König <christian.koenig@amd.com>
> Thanks!
>> And it would be really nice if we could make the DC_FP_* macros somehow fail
>> in the dml folder.
> And if we include a kind of dc_assert_fp_disabled() in the dc_fpu_begin()
> (DC_FP_START) - more or less the reverse of dc_assert_fp_enabled(). Does
> it meet the `make the DC_FP_* macros somehow fail in the dml folder` ?
> It is not restricted to the dml folder, but I think it would work
> similarly... Does it make sense?

No, IIRC our display team even mentioned to me that those macros could 
potentially be used recursively.

What I mean here is that we somehow raise a compiler warning if somebody 
tries to use those defines inside the folder.

Maybe check of gcc supports hardware floating point or something like this.

Christian.

>
> Melissa
>
>> Thanks,
>> Christian.
>>
>>

