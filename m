Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 913E117742B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 11:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD486E985;
	Tue,  3 Mar 2020 10:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447326E985
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 10:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583231363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7LonTbHRfu/iEussk108tQbvN47ixgC6EqOHMQZOyM=;
 b=X0HPtiMxuP0ygdDtpV1x7IlmP2t83mljoBtUTtMPLTtxPeHl2SpxCicDVgslHfoAdGkIxr
 Ca+dtZ/KPseiTwLVrK5hbP8i0+CTj2ixJEVFiUKowoAvGgX2pAPTomKlcaNOHCaGcR97VH
 Fsc77/MBIB6uBtJbDJj8nPUGtrct0Bo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-e-qMgLqIP7GttuGkPT4xjg-1; Tue, 03 Mar 2020 05:29:21 -0500
X-MC-Unique: e-qMgLqIP7GttuGkPT4xjg-1
Received: by mail-wr1-f70.google.com with SMTP id j32so1015539wre.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 02:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D7LonTbHRfu/iEussk108tQbvN47ixgC6EqOHMQZOyM=;
 b=mulkDJK7ewm6g7V8lpLHDTCi4ZS28fBK70fHwvgnJEdEhHuilDL1h+/zson093wN6Q
 s+AJXzQR2TtJZJbP+a3rU/E6qeGM5/ptteRJijQTyBs2sJiyEqJQqnTpBBuH3Yn+NSX3
 0q+bvKE5XnYQRwYF4mhdx5ZtM88pJuMPPht59mouI2h3JZMe2WkrmPWbORUwo+gSBOzB
 lZbBMxJrWk6vrpjvGg31tOTKolXCo9P1CfHvjP44JWY4ndpjTNdhj5McUicNFGwh2t5k
 mhyY0B02MVEUXCEIYMNm17ExMW9Iuf+VXXcAZnNFppaAkgVefBdeoGiT9YUhc+B06PbJ
 92vQ==
X-Gm-Message-State: ANhLgQ2YNUbLvc+8QgL4dwHvDR+rAEVR/zWdNlnINSV5S7dV5sq4LbM1
 Gndl3F5SXUFe9yN/PICA/vJuAS+MgriOLXtWVJs44bw4+wZK7parH8iG2Hp3JKBYIk3fDeuzHRC
 WsIRlJnt0NQZcSPFA8UI4PUUsByhI
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr4864626wrw.177.1583231360074; 
 Tue, 03 Mar 2020 02:29:20 -0800 (PST)
X-Google-Smtp-Source: ADFU+vu280QWlbg52i23RBsHDqyzIhk+UcfLhici1HhxNugz5brs1zrAU1ZpjHgHlbygNmoTxscxZg==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr4864605wrw.177.1583231359799; 
 Tue, 03 Mar 2020 02:29:19 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id d63sm3036976wmd.44.2020.03.03.02.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 02:29:19 -0800 (PST)
Subject: Re: [PATCH resend 1/2] drm/i915: panel: Use
 intel_panel_compute_brightness() from pwm_setup_backlight()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200221172927.510027-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <895e4a40-2c3f-b964-102d-13eff5b3c268@redhat.com>
Date: Tue, 3 Mar 2020 11:29:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221172927.510027-1-hdegoede@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

On 2/21/20 6:29 PM, Hans de Goede wrote:
> Use intel_panel_compute_brightness() from pwm_setup_backlight() so that
> we correctly take i915_modparams.invert_brightness and/or
> QUIRK_INVERT_BRIGHTNESS into account when setting + getting the initial
> brightness value.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

ping? Any chance I can get a review from someone on this series?

Both patches are pretty trivial really...

Regards,

Hans



> ---
>   drivers/gpu/drm/i915/display/intel_panel.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
> index 7b3ec6eb3382..9ebee7d93414 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -1843,6 +1843,7 @@ static int pwm_setup_backlight(struct intel_connector *connector,
>   	struct drm_i915_private *dev_priv = to_i915(dev);
>   	struct intel_panel *panel = &connector->panel;
>   	const char *desc;
> +	u32 level, ns;
>   	int retval;
>   
>   	/* Get the right PWM chip for DSI backlight according to VBT */
> @@ -1866,8 +1867,12 @@ static int pwm_setup_backlight(struct intel_connector *connector,
>   	 */
>   	pwm_apply_args(panel->backlight.pwm);
>   
> -	retval = pwm_config(panel->backlight.pwm, CRC_PMIC_PWM_PERIOD_NS,
> -			    CRC_PMIC_PWM_PERIOD_NS);
> +	panel->backlight.min = 0; /* 0% */
> +	panel->backlight.max = 100; /* 100% */
> +	level = intel_panel_compute_brightness(connector, 100);
> +	ns = DIV_ROUND_UP(level * CRC_PMIC_PWM_PERIOD_NS, 100);
> +
> +	retval = pwm_config(panel->backlight.pwm, ns, CRC_PMIC_PWM_PERIOD_NS);
>   	if (retval < 0) {
>   		DRM_ERROR("Failed to configure the pwm chip\n");
>   		pwm_put(panel->backlight.pwm);
> @@ -1875,11 +1880,10 @@ static int pwm_setup_backlight(struct intel_connector *connector,
>   		return retval;
>   	}
>   
> -	panel->backlight.min = 0; /* 0% */
> -	panel->backlight.max = 100; /* 100% */
> -	panel->backlight.level = DIV_ROUND_UP(
> -				 pwm_get_duty_cycle(panel->backlight.pwm) * 100,
> -				 CRC_PMIC_PWM_PERIOD_NS);
> +	level = DIV_ROUND_UP(pwm_get_duty_cycle(panel->backlight.pwm) * 100,
> +			     CRC_PMIC_PWM_PERIOD_NS);
> +	panel->backlight.level =
> +		intel_panel_compute_brightness(connector, level);
>   	panel->backlight.enabled = panel->backlight.level != 0;
>   
>   	DRM_INFO("Using %s PWM for LCD backlight control\n", desc);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
