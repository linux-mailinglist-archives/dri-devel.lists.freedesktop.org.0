Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2D1B19D81
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 10:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCDB10E41C;
	Mon,  4 Aug 2025 08:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=daenzer.net header.i=@daenzer.net header.b="hBrNqal8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA4F10E41C;
 Mon,  4 Aug 2025 08:20:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; t=1754295656; x=1754900456; s=webland;
 d=daenzer.net; c=relaxed/relaxed; v=1;
 bh=tVlaRrF455NeT0pqU2MICwd635g4QbHhsjdB3YKhO20=;
 h=From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References;
 b=hBrNqal8czifH5hyRyTlrX/2GTXZU+E4PwRQtWk7f8qOI0NDxYK1RWdouQcXBCE48pIxz4cIlhl60AjDq/rkXMWq+xbAw0sOU7L2ch23YTeQMd972AJsvTQMRiy8u4sK4twLhYjViUzSDAue7aFdYzROS0OSspP2ybyqTZ76nnpKpq9xA3MvZJi6ApbW1zMyaX+ObXPuLRAcxDltxSjVmVdFzY1YRJNjfQgEdCIMqt0HpFvxuyjvR5pUEdk5L9LOObBnP2y1CSkg1aU6xgBx81dSRxt3qvstdywl9ZS1XtWeKJYfcMOQ7EPZAfK7DKk78w7wUYiKRCr0Af5SmPKf+g==
Received: from [192.168.1.137] ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202508041020555526; Mon, 04 Aug 2025 10:20:55 +0200
Message-ID: <f6c82f73-cf3c-48b1-95e4-650297306636@daenzer.net>
Date: Mon, 4 Aug 2025 10:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/amd/display: Update HW_DONE_DEADLINE property
 value on modeset
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Uma Shankar <uma.shankar@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>, victoria@system76.com,
 David Turner <david.turner@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250724165220.1189129-1-michel@daenzer.net>
 <20250724165220.1189129-5-michel@daenzer.net>
 <84a221e1-5675-4aca-a068-6f9408b96e40@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Content-Language: en-CA
Autocrypt: addr=michel@daenzer.net; keydata=
 xsDiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPM0jTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD7CXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkLOwE0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpcJGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAnjICalDn2zB1
 fXqoOkGsTwElvKa5AJ9FhyKJpysFRcejfdZwrwl9xb4oOg==
In-Reply-To: <84a221e1-5675-4aca-a068-6f9408b96e40@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31.07.25 22:51, Harry Wentland wrote:
> Thanks for the series. It makes sense to me.

I'm glad to hear it, thanks for taking a look.

May I take this as R-b?


>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 0b8ac9edc070..e78249b55345 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -10021,6 +10021,21 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
>>  	drm_writeback_queue_job(wb_conn, new_con_state);
>>  }
>>  
>> +static void
>> +update_hw_done_deadline(struct dm_crtc_state *dm_new_crtc_state)
>> +{
>> +	struct dc_stream_state *stream = dm_new_crtc_state->stream;
>> +	struct dc_crtc_timing *timing = &stream->timing;
>> +	struct drm_crtc *crtc = dm_new_crtc_state->base.crtc;
>> +	uint32_t deadline_lines, deadline_us;
>> +
>> +	/* XXX: My guess, AMD display team to the rescue! */
>> +	deadline_lines = timing->v_total - timing->v_addressable - timing->v_front_porch;
> 
> This works on DCE. On DCN we'll need to take the offset into account.
> This diff on top of your changesshould do it, but it's not tested.
> The dc_stream changes probably fit in their own patch.

Thanks, I'll incorporate it.


> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 629fd21a611f..314074527216 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10082,11 +10082,19 @@ update_hw_done_deadline(struct dm_crtc_state *dm_new_crtc_state)
>         struct dc_crtc_timing *timing = &stream->timing;
>         struct drm_crtc *crtc = dm_new_crtc_state->base.crtc;
>         uint32_t deadline_lines, deadline_us;
> +       int vupdate_offset = dc_stream_get_vupdate_offset_from_vsync(stream);
> +
> +       /* note:
> +        * vupdate_offset is non-existant on DCE and function will return 0
> +        * vupdate_offset could be positive or negative on DCN
> +        * vupdate_offset depends on timing and HW bandwidth requirements
> +        */
> +       deadline_lines = timing->v_total - timing->v_addressable -
> +                        timing->v_front_porch - vupdate_offset;
Hmm, if it depends on bandwidth, we'll need to recalculate it for all CRTCs after a modeset for any of them, right?


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
