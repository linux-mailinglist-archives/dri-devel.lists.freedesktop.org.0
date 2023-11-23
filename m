Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 262987F5F93
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 13:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328CD10E736;
	Thu, 23 Nov 2023 12:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D47B10E736
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 12:54:34 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a00cbb83c80so118546966b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 04:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700744072; x=1701348872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XMiAmI0N+zA2Zy2MN+Me1gO6TWzNpKzUKMz67wciuHU=;
 b=Unh6UKqR4yrplzailgnkV/U/D8mPkprvWTaYwFCpZ+ytLOQo5S39A+ukrATfU+rZlq
 A+OpSAC6PrghuNNtY6AnEysbzpzpCW0LcxWuQij0lwV8PuOva5FiEBgwb/7svAnf/cT+
 RMXyM7rMF3JBlfrBzIDT9TH9TcmOnCj5KOqVjtL4TmvwhOdCX6hBxIfbkdfzSYj04eAe
 EePo6G2xsA9hOzowjSgNs2eJmMeD+6k+ve1oQgjoBObY15NqN+D7yj1vF6uqzWgkbac+
 iwG0ZDcTofj9SOhlDCNF9SAut8Ml5bCUa4jhOyy4e7V2qw8JIz5Whl9mi31t3JNaDYLy
 Vbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700744072; x=1701348872;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XMiAmI0N+zA2Zy2MN+Me1gO6TWzNpKzUKMz67wciuHU=;
 b=xRQAzWW/lMRbiVk8jmNDtBdB9qCtylJIL8hF7cdOXjlE7sQBC81qOrjEEX3rpmW0yf
 4bDQ4Gq31co3Oh/F3mfk7ke89LOYEWdHb6oRM0ZXPhEQ0bRz5GEOlnVIhyI/Dvf+l/G1
 lq/EMXbytOWKStccAG74UdbK3IcNjxo9h0VekyyMRI3Kz9FtCLjb9KXyAxWDmuPoWUg1
 whPHJGVSyAxSzxK29lpmH9crMofoZuxDLYvksBmv8rZ5fCSA8IPlClrhKEUgyZRCtdVS
 wOM/Q+/fdQ1C+ag4fcW30YOgWQC0h555MXboxQNrC/Uhx76QWSBYDKhpJD/ik31jVuk2
 /Y+A==
X-Gm-Message-State: AOJu0Yx3cEzS6bjBlknGXKYPG/BIN55VDMaYkjC6x1IOnSa9aTz848ZI
 YzePIciqvKOzR+JJS0wiqXY=
X-Google-Smtp-Source: AGHT+IEfMsMMK3PTkgT5L3rE44Um/aejWIC8WA6lrcJ5UFXUyEvyxQe0w2kXnraoQtMQXn9QN0dt4A==
X-Received: by 2002:a17:906:73c9:b0:a01:d2db:205d with SMTP id
 n9-20020a17090673c900b00a01d2db205dmr3770078ejl.4.1700744072019; 
 Thu, 23 Nov 2023 04:54:32 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 lb16-20020a170907785000b009fda665860csm752780ejc.22.2023.11.23.04.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 04:54:30 -0800 (PST)
Message-ID: <bff69815-1185-c74f-82ab-5b8f7faccfac@gmail.com>
Date: Thu, 23 Nov 2023 13:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 3/4] drm/rockchip: rk3066_hdmi: Remove useless output
 format
To: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com
References: <cda574be-4f33-b66d-eb14-92c2b31d241e@gmail.com>
 <bb5cac77-a705-738e-13ae-667ea87f1cb1@gmail.com> <4308014.ejJDZkT8p0@phil>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <4308014.ejJDZkT8p0@phil>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/20/23 18:06, Heiko Stuebner wrote:
> Hi Johan,
> 
> Am Donnerstag, 2. November 2023, 14:42:19 CET schrieb Johan Jonker:
>> The Rk3066 hdmi output format is hard coded to RGB. Remove
>> all useless code related to colorimetry and enc_out_format.
>>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> 

> I guess my first question is, is the hardcoding happening just because
> of missing functionality in the driver, or does the hardware only
> support RGB?

This driver can do so much more..., but is crippled by various causes.
If in need for a full functional rk3066 driver a little bit help/advise/action from other people is needed.

1:
Missing rk3066 TRM HDMI register info.
Could Rockchip (= Sandy Huang) disclose this info to the open source community?

As a way around we can look at older driver code and port to mainline.
More info gives better results.
rk30_hdmi_config_csc() function:
https://github.com/RockchipOpensourceCommunity/px2-android-kernel-3.0/blob/master/drivers/video/rockchip/hdmi/chips/rkpx2/rkpx2_hdmi_hw.c#L315

2:
Could DRM people show us examples for:
- How to advertise to the VOP driver what data formats (RGB, YCBCR) it can send to the HDMI driver or any other Rockchip DRM sub driver other then RGB.
- Advertise EDID data monitor modes RGB444, YCBCR444 and YCBCR422 to the HDMI driver.

https://github.com/RockchipOpensourceCommunity/px2-android-kernel-3.0/blob/master/drivers/video/rockchip/hdmi/rk_hdmi_edid.c#L217C1-L218C41

3:
Advise when what Infoframe is needed for only RGB vs. the rest according to the specification.
https://engineering.purdue.edu/ece477/Archive/2012/Spring/S12-Grp10/Datasheets/CEC_HDMI_Specification.pdf

rk3066 currently only sends avi info. Does it need vsi as well? Can anyone give some clarity here?
inno_hdime sends avi and vsi info.

4:
rk3066_hdmi and inno_hdmi are HDMI 1.4a drivers for DVI and HDMI.
Validated by drm_match_cea_mode() this function only gives us both HDMI + HDMI2 focus, but nothing for old DVI monitors.
How to improve?

5:
Sound support was submitted:
Re: [PATCH v6 2/5] drm: rockchip: add sound support to rk3066 hdmi driver
https://lore.kernel.org/linux-rockchip/48dbe9b7-0aa0-f459-301f-f380e2b7f2f8@gmail.com/

No reply was given (by Heiko or others) on why it wasn't applied or what needs to be improved.

Without reply no improvement.

Johan


> 
> 
>> ---
>>  drivers/gpu/drm/rockchip/rk3066_hdmi.c | 20 +-------------------
>>  1 file changed, 1 insertion(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> index 0e7aae341960..f2b1b2faa096 100644
>> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> @@ -23,8 +23,6 @@
>>
>>  struct hdmi_data_info {
>>  	int vic; /* The CEA Video ID (VIC) of the current drm display mode. */
>> -	unsigned int enc_out_format;
>> -	unsigned int colorimetry;
>>  };
>>
>>  struct rk3066_hdmi_i2c {
>> @@ -200,14 +198,7 @@ static int rk3066_hdmi_config_avi(struct rk3066_hdmi *hdmi,
>>  	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
>>  						      &hdmi->connector, mode);
>>
>> -	if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV444)
>> -		frame.avi.colorspace = HDMI_COLORSPACE_YUV444;
>> -	else if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV422)
>> -		frame.avi.colorspace = HDMI_COLORSPACE_YUV422;
>> -	else
>> -		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
>> -
>> -	frame.avi.colorimetry = hdmi->hdmi_data.colorimetry;
>> +	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
>>  	frame.avi.scan_mode = HDMI_SCAN_MODE_NONE;
>>
>>  	return rk3066_hdmi_upload_frame(hdmi, rc, &frame,
>> @@ -329,15 +320,6 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
>>  	struct drm_display_info *display = &hdmi->connector.display_info;
>>
>>  	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);
>> -	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
>> -
>> -	if (hdmi->hdmi_data.vic == 6 || hdmi->hdmi_data.vic == 7 ||
>> -	    hdmi->hdmi_data.vic == 21 || hdmi->hdmi_data.vic == 22 ||
>> -	    hdmi->hdmi_data.vic == 2 || hdmi->hdmi_data.vic == 3 ||
>> -	    hdmi->hdmi_data.vic == 17 || hdmi->hdmi_data.vic == 18)
>> -		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_601;
>> -	else
>> -		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_709;
> 

> while I can understand the RGB output format, why does the colorimetry
> also get removed? This looks like it is dependent on the mode itself
> and not the output format?

From the old driver these conditions apply whether csc is needed.
https://github.com/RockchipOpensourceCommunity/px2-android-kernel-3.0/blob/master/drivers/video/rockchip/hdmi/chips/rkpx2/rkpx2_hdmi_hw.c#L320C1-L324C3

	if( ((vpara->input_color == VIDEO_INPUT_COLOR_RGB) && (vpara->output_color == VIDEO_OUTPUT_RGB444)) ||
		((vpara->input_color == VIDEO_INPUT_COLOR_YCBCR) && (vpara->output_color != VIDEO_OUTPUT_RGB444) ))
	{
		return;
	}

> 
> Thanks
> Heiko
> 
> 
