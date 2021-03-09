Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F417332CF4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 18:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F24889D4B;
	Tue,  9 Mar 2021 17:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE4A89D4B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 17:13:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id f12so17152449wrx.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Mar 2021 09:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=4E4B2xlaHTkAbKCLQY2tzB0M/UIewZVxgvZlKvBiH3c=;
 b=RVsnzzQTkYEgUiAsEVrcRaREJuZFvSe4TRwZIDnUXyIkpZK49/ZplAaPJC7OfFBVq2
 Z2IMQVsOZmxMf4GKRU0ZhAyP1m4Xw6WaNYixtf9mTvY5XNqsgc8Lyf2skbyUga2Tazxj
 5cbaY85hQ+NFkOLU9Cs8W0y0s5OWQnAQrGXWxk3gYfPV/4fUE55OFJ8LFWTDid1Zn2Cb
 aMr22NDluvqyYBd1hEjx6/o7l5yXk5pYNZhW2l/RXHx9iHo3Thpwt78EyVxuxkTRRtF6
 wgXEBShh1YZvfuzOgf7m22JRcpvybK7LcVtUYJ78S0Gki1CNNvnftxipXzzMg4na1rvK
 DQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=4E4B2xlaHTkAbKCLQY2tzB0M/UIewZVxgvZlKvBiH3c=;
 b=eIhh222JD2/toYFQ+6cw+EykiqIfeTi0KGpN+0KnyrTJ2nlHb9yrskNh7NBzH1M23Z
 tGCBgTirHMnE2u8wxDMDN5Dn0nkIXz0OMIFznBbvjTddlEa+y/faQeqK0Mij/6T1N3EX
 x94Y4uNgkvsTcT43Ly1iLuOscYSrOUVSXYe7ww2k/u9i8z2Oj8a7I/m3hs7IuXxxj1ZU
 5Nf38Yl3tBkyVkMLUOoo8t/p+T1FHa/xGhvcvwq/3/xYbTS+3/1Bmbe5yVtEqTTC0dXF
 XTz3KTNKsAIDKn0x3Mey/GbQYB0002bJfH3s1HUQmKwOYaDQKgUghDJql08lhzMS8teQ
 +pLg==
X-Gm-Message-State: AOAM531YJVQ02c6tTIHFGNu4jIBoxjuY7QPKXFeOkjDOPxgYwFtVhWBT
 CDFGf0rp0voTfkw47LNHSnOhTQ==
X-Google-Smtp-Source: ABdhPJzCiTPqXsdBsijJuz9fKcjPAaAFMc1RGe6N/8X9SFcamHDYHh/oNSfb6gjkDrGMgryfSvxGJQ==
X-Received: by 2002:a5d:548c:: with SMTP id h12mr29519223wrv.46.1615310002233; 
 Tue, 09 Mar 2021 09:13:22 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id f7sm4751268wmh.39.2021.03.09.09.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:13:21 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Artem Lapkin
 <email2tema@gmail.com>
Subject: Re: [PATCH] drm: meson_drv add shutdown function
In-Reply-To: <e033540e-3a4f-3dd7-a1b0-d5a0241e845a@baylibre.com>
References: <20210302042202.3728113-1-art@khadas.com>
 <e033540e-3a4f-3dd7-a1b0-d5a0241e845a@baylibre.com>
Date: Tue, 09 Mar 2021 09:13:18 -0800
Message-ID: <7h35x42qtt.fsf@baylibre.com>
MIME-Version: 1.0
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
Cc: gouwa@khadas.com, martin.blumenstingl@googlemail.com,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 02/03/2021 05:22, Artem Lapkin wrote:
>> Problem: random stucks on reboot stage about 1/20 stuck/reboots
>> // debug kernel log
>> [    4.496660] reboot: kernel restart prepare CMD:(null)
>> [    4.498114] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
>> [    4.503949] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
>> ...STUCK...
>> 
>> Solution: add shutdown function to meson_drm driver 
>> // debug kernel log
>> [    5.231896] reboot: kernel restart prepare CMD:(null)
>> [    5.246135] [drm:meson_drv_shutdown]
>> ...
>> [    5.259271] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
>> [    5.274688] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
>> [    5.338331] reboot: Restarting system
>> [    5.358293] psci: PSCI_0_2_FN_SYSTEM_RESET reboot_mode:0 cmd:(null)
>> bl31 reboot reason: 0xd
>> bl31 reboot reason: 0x0
>> system cmd  1.
>> ...REBOOT...
>> 
>> Tested: on VIM1 VIM2 VIM3 VIM3L khadas sbcs - 1000+ successful reboots
>> and Odroid boards, WeTek Play2 (GXBB)
>> 
>> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
>> Signed-off-by: Artem Lapkin <art@khadas.com>
>> 
>> ---
>>  drivers/gpu/drm/meson/meson_drv.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index 42c5d3246..693bb1293 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -482,6 +482,16 @@ static int meson_probe_remote(struct platform_device *pdev,
>>  	return count;
>>  }
>>  
>> +static void meson_drv_shutdown(struct platform_device *pdev)
>> +{
>> +	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
>> +	struct drm_device *drm = priv->drm;
>> +
>> +	DRM_DEBUG_DRIVER("\n");
>> +	drm_kms_helper_poll_fini(drm);
>> +	drm_atomic_helper_shutdown(drm);
>> +}
>> +
>>  static int meson_drv_probe(struct platform_device *pdev)
>>  {
>>  	struct component_match *match = NULL;
>> @@ -553,6 +563,7 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
>>  
>>  static struct platform_driver meson_drm_platform_driver = {
>>  	.probe      = meson_drv_probe,
>> +	.shutdown   = meson_drv_shutdown,
>>  	.driver     = {
>>  		.name	= "meson-drm",
>>  		.of_match_table = dt_match,
>> 
>
> Applied to drm-misc-fixes,

Could you submit this as a fix to stable (v5.10+) also?

Thanks,

Kevin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
