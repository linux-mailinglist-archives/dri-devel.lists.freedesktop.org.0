Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C706360C43F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 08:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D3E10E13A;
	Tue, 25 Oct 2022 06:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FA310E801
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 14:52:54 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id y1so9168847pfr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3RFUYnxkZfbGB4sUYeSVCHGTolA3bNrSoJ5VxM9ll30=;
 b=T8fZhnkSRW0EcYMeVwli0zShE13H8FMRgyv42sjmdyBdRt1iAKhbeWLluKgnHZxlQ5
 UI1vATreT4jIvGzHcmSm9NXP5o7zwk1z5/KuCy+w8rLSUALYMmvI1pgiDwCN7zdufSfe
 Rpwce8lZ2PXeUAv/dvtoN0dWQXnR6V+PyiDujRVKOEu/BBUs4S0zGFEwnpDw1EsXlo4v
 fJNcBGY8H5iiBy/SMSoBEhREubwsu7ivvui4kSZtRxAiePHjCG3I7uyfqibtFyBEvS/I
 frTwfcEEXLFrbgV1lgFay1OJVoH2Jg1HL43V4wJXkDQaJiBGEhgBDDBGVLlCKY9Yl6SH
 4UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3RFUYnxkZfbGB4sUYeSVCHGTolA3bNrSoJ5VxM9ll30=;
 b=YyKHSZz/PhQA/AZRUU2voxZdO/erth/YWyiM9BkW9f9x0vxWBCFXJYdvceljKSCBDy
 ONpyXvjJymIiK6m2n7Mdbft8xR3SBofvEAOAFHUksG4YSrrsrMBiW5+Nj17EGfuujBFN
 aU4PIZXEsbd7mWgWaA5toKD1Q7qp23vGLg4qm8TFhGfzKtDfY+StcPoGPGGp5gJty0tc
 xODcI8mi1XqTlnhj5wUlXu7OUbv4S2EJ1kYNlf3FyjqZZq/i59Dhgkw+D9gotYbmuNAG
 NVZxibhsTDCooy47+9i/Ewt+cuAl8oqwu6aMdhgsrSb01q4GS/GdThKuLy+8JOTS50Af
 iEIg==
X-Gm-Message-State: ACrzQf0YywpAQ1/+hIgmt76UEvBdXRoPyWTkHXHHt0Uh+iww097oP5A5
 Md/viuiLm+wIAQoB/XMyBydPNA==
X-Google-Smtp-Source: AMsMyM7MkD2jDxUhY+Ie+vHsovp22ZlwLzRWnn+eqHGHGwHdaJH1e1WLV2xJ8hBG+s3N0GsXto7nlA==
X-Received: by 2002:a63:450c:0:b0:443:94a1:3703 with SMTP id
 s12-20020a63450c000000b0044394a13703mr27735849pga.565.1666623173978; 
 Mon, 24 Oct 2022 07:52:53 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 oc12-20020a17090b1c0c00b00212735c8898sm4126456pjb.30.2022.10.24.07.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:52:53 -0700 (PDT)
Message-ID: <37ec64ac-9e08-dd41-4b20-8701bf9413fb@daynix.com>
Date: Mon, 24 Oct 2022 23:52:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] ACPI: video: Fix missing native backlight on
 Chromebooks
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sean Paul <seanpaul@chromium.org>
References: <20221024141210.67784-1-dmitry.osipenko@collabora.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20221024141210.67784-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:02 +0000
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
Cc: linux-acpi@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/10/24 23:12, Dmitry Osipenko wrote:
> Chromebooks don't have backlight in ACPI table, they suppose to use
> native backlight in this case. Check presence of the CrOS embedded
> controller ACPI device and prefer the native backlight if EC found.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Fixes: 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native() helper")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
> 
> Changelog:
> 
> v2: - Added explanatory comment to the code and added check for the
>        native backlight presence, like was requested by Hans de Goede.
> 
>   drivers/acpi/video_detect.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> index 0d9064a9804c..9cd8797d12bb 100644
> --- a/drivers/acpi/video_detect.c
> +++ b/drivers/acpi/video_detect.c
> @@ -668,6 +668,11 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>   	{ },
>   };
>   
> +static bool google_cros_ec_present(void)
> +{
> +	return acpi_dev_found("GOOG0004");
> +}
> +
>   /*
>    * Determine which type of backlight interface to use on this system,
>    * First check cmdline, then dmi quirks, then do autodetect.
> @@ -730,6 +735,13 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>   			return acpi_backlight_video;
>   	}
>   
> +	/*
> +	 * Chromebooks that don't have backlight handle in ACPI table
> +	 * are supposed to use native backlight if it's available.
> +	 */
> +	if (google_cros_ec_present() && native_available)
> +		return acpi_backlight_native;
> +
>   	/* No ACPI video (old hw), use vendor specific fw methods. */
>   	return acpi_backlight_vendor;
>   }

Hi,

The native_available check does not prevent duplicate registration if 
vendor backlight registers first. It was enough for the combination of 
ACPI video and native because ACPI video delays its registration, but it 
is not the case for vendor/native combination.

Regards,
Akihiko Odaki
