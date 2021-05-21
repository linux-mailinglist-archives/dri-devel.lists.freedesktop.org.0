Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB138C5BC
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 13:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D256F618;
	Fri, 21 May 2021 11:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5071F6F619;
 Fri, 21 May 2021 11:30:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so7213858wmk.0; 
 Fri, 21 May 2021 04:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WVCcRp42np3ehFvmyRSbrGhPdGWBOP9y4II+fscXkNw=;
 b=JhmGGigt8nfmF9e2KoSdDWRgoYAiPZBmXCHSzTq45xOfT+MqrRX5B+UJV+35h77vKC
 NqTdRkEMnViw5qfJVK12SluVycPjcokKZy4d9I8lckDXBmeEbk6bm2pIicOCyLaTXctT
 22EvKCMTwRkOT6AF24wmNTIu0HTM2VuG18EnStp3zIetV7lI2MKHmbBW9TdMC2nvRl1z
 3xAiRhjb+mGGwAS1ae5P7sTMc8U2WQUa4y1QIQFkbMi7JQokOkjETuglpmf6/TOfr9Px
 lpu0jpkxml/QjZH3v4lG3uA/TU313Q74dN75P8+9p6ki8ySr/TsomzJSK3tHB9JjqIgE
 r6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WVCcRp42np3ehFvmyRSbrGhPdGWBOP9y4II+fscXkNw=;
 b=hFvZcy7kpVUV3cb8UyDbliCdjT5LBUk+TwDgi8brseKX9nO0f/moaHT193ySS5arAR
 77Lcu8RRC8K5Y1koCRIBYukFg1rdJoBo/fBaKMl3M9Q425a5SyJT6qgpgTf6xMKBg8RP
 pZGZ560cn1J1ksJgFVGBe60WS/x2m3lGOaMDZIMQ1OtwFDFM7N5Qkzpf/1JDDMT4HXRV
 S79iogRBlccewBdRDOELCEinmhTWNAtm32Hxkxz37IYFW0ci7lbGOl6CEYs+fEnqiAfE
 cW5FieR1ZBx3h3SPIBvTtbwq7kHrLalDqgoskktd3vX6Kf5ALzcbiNLICXyhW24Gj9i/
 qtlg==
X-Gm-Message-State: AOAM532u2G2QVX9XOKmG9thpivLJGmCWpivekF2sXZCzjxfFTEHOW+2Z
 sriYrZ+LF3B6i75HW0HrtDWXKSYJ+kL7IdqR
X-Google-Smtp-Source: ABdhPJw4OPmI/1ALdRFYGzJ+Jw2NQJ4acS0lgEDxWEUzFnGQvniamMPjRgRnc96ffMAKBwsvIM2H+w==
X-Received: by 2002:a1c:402:: with SMTP id 2mr8278373wme.7.1621596604822;
 Fri, 21 May 2021 04:30:04 -0700 (PDT)
Received: from [0.0.0.0] (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.googlemail.com with ESMTPSA id r5sm6663246wmh.23.2021.05.21.04.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 04:30:04 -0700 (PDT)
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Wait for vblank before
 collecting CRC
To: Vidya Srinivas <vidya.srinivas@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org
References: <1621570131-23943-1-git-send-email-vidya.srinivas@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <f0926681-ea44-b2d2-fe8d-a443728d01c2@gmail.com>
Date: Fri, 21 May 2021 14:29:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1621570131-23943-1-git-send-email-vidya.srinivas@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Reply-To: juhapekka.heikkila@gmail.com
Cc: Charlton.Lin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vidya,

on which machines this would help? I see there's many vblanks already 
being waited. There's igt_display_commit2 which probably will block and 
even if it didn't there's igt_pipe_crc_collect_crc(..) where crc 
calculation is started after flip and then get one crc before disabling 
crc counting again.

/Juha-Pekka

On 21.5.2021 7.08, Vidya Srinivas wrote:
> Without wait for vblank, CRC mismatch is seen
> between big and small CRC on few systems
> 
> Change-Id: I3bec931aa901130997e693ac1cacf389e2a8100f
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>   tests/kms_big_fb.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index b2027b6b9d1b..7d78ff829d41 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -254,6 +254,7 @@ static void unset_lut(data_t *data)
>   static bool test_plane(data_t *data)
>   {
>   	igt_plane_t *plane = data->plane;
> +	igt_display_t *display = &data->display;
>   	struct igt_fb *small_fb = &data->small_fb;
>   	struct igt_fb *big_fb = &data->big_fb;
>   	int w = data->big_fb_width - small_fb->width;
> @@ -337,16 +338,17 @@ static bool test_plane(data_t *data)
>   		igt_display_commit2(&data->display, data->display.is_atomic ?
>   				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
>   
> -
> +		igt_wait_for_vblank(data->drm_fd, display->pipes[data->pipe].crtc_offset);
>   		igt_pipe_crc_collect_crc(data->pipe_crc, &small_crc);
>   
>   		igt_plane_set_fb(plane, big_fb);
>   		igt_fb_set_position(big_fb, plane, x, y);
>   		igt_fb_set_size(big_fb, plane, small_fb->width, small_fb->height);
> +
>   		igt_plane_set_size(plane, data->width, data->height);
>   		igt_display_commit2(&data->display, data->display.is_atomic ?
>   				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
> -
> +		igt_wait_for_vblank(data->drm_fd, display->pipes[data->pipe].crtc_offset);
>   		igt_pipe_crc_collect_crc(data->pipe_crc, &big_crc);
>   
>   		igt_plane_set_fb(plane, NULL);
> 

