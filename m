Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D111308DA
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2020 16:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6878987A;
	Sun,  5 Jan 2020 15:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356DA89F6F
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2020 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578239223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alExKLVeqd6bzgsM2blojQwdgRKVwTy+LtsVOW7ce9Q=;
 b=R5qu5TWMa2eV1tjPla0GwGMttqZwxH9ypZqwcHwLby0+uiyyC0dSwasjpxutqFaxmMQFhL
 qKHlOojqXgW5LV4E2CW/wXIemC4wRwYhyJcqH5zOi4GDWIdKo6l8nagzOSrxGPWcAF1QW0
 /15TKWwkIT+YO5HHNKnJvgDUM55w/SQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-aA7z2oZYP8KYWc3hxOeF-w-1; Sun, 05 Jan 2020 10:47:01 -0500
Received: by mail-wm1-f71.google.com with SMTP id t4so2094277wmf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2020 07:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=alExKLVeqd6bzgsM2blojQwdgRKVwTy+LtsVOW7ce9Q=;
 b=hgQrOvQDDScJgF20b7K6ZI1wUROR4fQ51/LwyCYK1PMf9rOGLsTlo+9d5qP5+wEbod
 0FN9DuVdhnHUi1MCvovpAgjFwJcLJH0uP41m4Bh5w0UO0N9g5Hjsy01xcQfSt8sEq0YG
 AWo3xmtvnv/ur/eNZA2QOepGKbxqY5Tq/D4shC61c6LoUVmZ12D+Z9hzSDeI5D3rgWly
 9///bSPzpHUDS26/moh/Lgids2Zg6ZlyoiuD2BD2RN8Bm13VNOpyeTHEo65EsRDQRvVS
 eTCMvtWSL+1//n9eC4G6okjD5Jys3PvpK2Ir8joYCDk01BD/EzD0QDd61Qf3pgb9Bv1t
 eklg==
X-Gm-Message-State: APjAAAVXooewU6j2oUSzu1yIvL0cT2nT78re8H9VmBr816OG1UAeT9dE
 1Tp2LWrCA+Ul6o4k0/akGD65QuGzs5peldZdJOPKefNKILJXGJN8j8ZPihGrpZT6kUp9LuqYkuL
 OTToOYhUP3txFwHjmyztfuofoAbRW
X-Received: by 2002:adf:f311:: with SMTP id i17mr98241634wro.81.1578239220355; 
 Sun, 05 Jan 2020 07:47:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwH4c8uZP28szpE3q7oOFYe7bo6EB0wGY8A83cQmcOJdNzjqTDjCk0FzvCFXWKoPM+AOD/Hbg==
X-Received: by 2002:adf:f311:: with SMTP id i17mr98241621wro.81.1578239220148; 
 Sun, 05 Jan 2020 07:47:00 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id d12sm68041734wrp.62.2020.01.05.07.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jan 2020 07:46:59 -0800 (PST)
Subject: Re: [Intel-gfx] [PATCH resend 2/2] drm/connector: Hookup the new
 drm_cmdline_mode panel_orientation member
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20191216115158.862404-1-hdegoede@redhat.com>
 <20191216115158.862404-3-hdegoede@redhat.com>
 <20200103193829.GD11904@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <b30d75a4-31ee-37c3-30c6-225a1251a652@redhat.com>
Date: Sun, 5 Jan 2020 16:46:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200103193829.GD11904@intel.com>
Content-Language: en-US
X-MC-Unique: aA7z2oZYP8KYWc3hxOeF-w-1
X-Mimecast-Spam-Score: 0
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
Cc: dri-devel@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 03-01-2020 20:38, Rodrigo Vivi wrote:
> On Mon, Dec 16, 2019 at 12:51:58PM +0100, Hans de Goede wrote:
>> If the new video=... panel_orientation option is set for a connector, honor
>> it and setup a matching "panel orientation" property on the connector.
>>
>> BugLink: https://gitlab.freedesktop.org/plymouth/plymouth/merge_requests/83
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_connector.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index f4fa5c59717d..d9d7fef26275 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -140,6 +140,13 @@ static void drm_connector_get_cmdline_mode(struct drm_connector *connector)
>>   		connector->force = mode->force;
>>   	}
>>   
>> +	if (mode->panel_orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
>> +		DRM_INFO("setting connector %s panel_orientation to %d\n",
>> +			 connector->name, mode->panel_orientation);
> 
> Since this overrides the standard behavior should this deserve a debug that
> is a bit more clear that we are forcing the mode with the cmdline?

Sure, I will send a v2 of this series with this fixed up right away.

Regards,

Hans


> 
>> +		drm_connector_set_panel_orientation(connector,
>> +						    mode->panel_orientation);
>> +	}
>> +
>>   	DRM_DEBUG_KMS("cmdline mode for connector %s %s %dx%d@%dHz%s%s%s\n",
>>   		      connector->name, mode->name,
>>   		      mode->xres, mode->yres,
>> -- 
>> 2.23.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
