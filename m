Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EE3120893
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 15:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51FA6E5A9;
	Mon, 16 Dec 2019 14:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665726E5A1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576506494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=noMkUix3jvf1eemRUtfdt9onAMruxoWmSHOOhy4r3RM=;
 b=aGSyxsPjpVajNejciLcJlPPQNe1iQ+d86WiPkSMv9ARBIAvazeqdyyKS6dDbxWbTf3G9Im
 ZfaLtdZ3HABLV9+8ZczN8T8ZE9HXVzji1jTr8jJS6rOgkX6WvjEOuH8SDIbx+dKhlyc6Ew
 hBvBidVXXqEzkB7U9uZj7vNLV6iiAA0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-kiD25XfNM7-_Qr2fNaAWgQ-1; Mon, 16 Dec 2019 09:28:12 -0500
Received: by mail-wr1-f72.google.com with SMTP id f17so3804027wrt.19
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 06:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mqnAaSxh0pSKzbiLQ7KvpBpDD8sO/UPH/8UcK0z/vf8=;
 b=DuJeAf2Uk6fRpFabzEf1oSDRxq6oQDtYZrY0KBONmZJPpVGubbK15CYWtwwTd7wSQK
 Vdm3SLeEJ+fNhrS2nHHP3VZczNN5ckUrGpHmsCoTn79WS6WRWF+wnOqEp6TWT0Kf1rF4
 Iyg2a7f+Hv9VHNEv7vgFnuHnuBIOyBwI0K7ipwSsTldYAyKwmhOJkvVmq4utZ+ihjDDt
 P4k1wsXDm4MYoHk5dI6wa0DiLq5y+ESYHkafvnI/x4qONlQ8aY9VyAUK+GP0mpVOj5RF
 y63hy04cNsQfSACG78MHOw93UKiI7IvdI4YPbC3c/m4hhuy5zp8N1XAzpSqZ1kWa9Qf/
 eRqA==
X-Gm-Message-State: APjAAAXKwdWsbzgcd0h+JX+lITveruAMC8j1KPQ2VbS45RY8P09sr9UU
 Zes0kzil7fWf6gR5TIDO2/6h8XReLMDmj79uWMSQIXB9oVIHxspQCVpu4OtUiKhkkW9K7T/0Dv5
 +eFzDnq9oOZGzaLrNJoZTl9deC39X
X-Received: by 2002:a7b:c216:: with SMTP id x22mr29355325wmi.51.1576506491406; 
 Mon, 16 Dec 2019 06:28:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1cdzONxv/4mP1xQlKXrsuF/DPqXX835uoZSpIhEWRShDwrAJ8iqhJqjAy/Yiqp/DSLPbvfQ==
X-Received: by 2002:a7b:c216:: with SMTP id x22mr29355302wmi.51.1576506491081; 
 Mon, 16 Dec 2019 06:28:11 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id r68sm16146106wmr.43.2019.12.16.06.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 06:28:10 -0800 (PST)
Subject: Re: [PATCH 5/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs on BYT
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-6-hdegoede@redhat.com>
 <20191216140427.GT1208@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <910ef405-39df-8c58-48cb-d3ee407bd60d@redhat.com>
Date: Mon, 16 Dec 2019 15:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216140427.GT1208@intel.com>
Content-Language: en-US
X-MC-Unique: kiD25XfNM7-_Qr2fNaAWgQ-1
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
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Jones <lee.jones@linaro.org>, intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 16-12-2019 15:04, Ville Syrj=E4l=E4 wrote:
> On Sun, Dec 15, 2019 at 05:38:10PM +0100, Hans de Goede wrote:
>> On Bay Trail devices the MIPI power on/off sequences for DSI LCD panels
>> do not control the LCD panel- and backlight-enable GPIOs. So far, when
>> the VBT indicates we should use the SoC for backlight control, we have
>> been relying on these GPIOs being configured as output and driven high by
>> the Video BIOS (GOP) when it initializes the panel.
>>
>> This does not work when the device is booted with a HDMI monitor connect=
ed
>> as then the GOP will initialize the HDMI instead of the panel, leaving t=
he
>> panel black, even though the i915 driver tries to output an image to it.
>>
>> Likewise on some device-models when the GOP does not initialize the DSI
>> panel it also leaves the mux of the PWM0 pin in generic GPIO mode instead
>> of muxing it to the PWM controller.
>>
>> This commit makes the DSI code control the SoC GPIOs for panel- and
>> backlight-enable on BYT, when the VBT indicates the SoC should be used
>>
>> for backlight control. It also ensures that the PWM0 pin is muxed to the
>> PWM controller in this case.
>>
>> This fixes the LCD panel not lighting up on various devices when booted
>> with a HDMI monitor connected. This has been tested to fix this on the
>> following devices:
>>
>> Peaq C1010
>> Point of View MOBII TAB-P800W
>> Point of View MOBII TAB-P1005W
>> Terra Pad 1061
>> Yours Y8W81
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dsi.h     |  3 +-
>>   drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 63 ++++++++++++++++++++
>>   2 files changed, 65 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/=
i915/display/intel_dsi.h
>> index 675771ea91aa..7481a5aa3084 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dsi.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dsi.h
>> @@ -45,8 +45,9 @@ struct intel_dsi {
>>   	struct intel_dsi_host *dsi_hosts[I915_MAX_PORTS];
>>   	intel_wakeref_t io_wakeref[I915_MAX_PORTS];
>>   =

>> -	/* GPIO Desc for CRC based Panel control */
>> +	/* GPIO Desc for panel and backlight control */
>>   	struct gpio_desc *gpio_panel;
>> +	struct gpio_desc *gpio_backlight;
>>   =

>>   	struct intel_connector *attached_connector;
>>   =

>> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/=
drm/i915/display/intel_dsi_vbt.c
>> index 847f04eec2a1..bd007d4f86e2 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> @@ -27,6 +27,8 @@
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/gpio/machine.h>
>>   #include <linux/mfd/intel_soc_pmic.h>
>> +#include <linux/pinctrl/consumer.h>
>> +#include <linux/pinctrl/machine.h>
>>   #include <linux/slab.h>
>>   =

>>   #include <asm/intel-mid.h>
>> @@ -525,11 +527,15 @@ void intel_dsi_vbt_exec_sequence(struct intel_dsi =
*intel_dsi,
>>   {
>>   	if (seq_id =3D=3D MIPI_SEQ_POWER_ON && intel_dsi->gpio_panel)
>>   		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 1);
>> +	if (seq_id =3D=3D MIPI_SEQ_BACKLIGHT_ON && intel_dsi->gpio_backlight)
>> +		gpiod_set_value_cansleep(intel_dsi->gpio_backlight, 1);
>>   =

>>   	intel_dsi_vbt_exec(intel_dsi, seq_id);
>>   =

>>   	if (seq_id =3D=3D MIPI_SEQ_POWER_OFF && intel_dsi->gpio_panel)
>>   		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 0);
>> +	if (seq_id =3D=3D MIPI_SEQ_BACKLIGHT_OFF && intel_dsi->gpio_backlight)
>> +		gpiod_set_value_cansleep(intel_dsi->gpio_backlight, 0);
>>   }
>>   =

>>   void intel_dsi_msleep(struct intel_dsi *intel_dsi, int msec)
>> @@ -688,6 +694,8 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi,=
 u16 panel_id)
>>   /*
>>    * On some BYT/CHT devs some sequences are incomplete and we need to m=
anually
>>    * control some GPIOs. We need to add a GPIO lookup table before we ge=
t these.
>> + * If the GOP did not initialize the panel (HDMI inserted) we may need =
to also
>> + * change the pinmux for the SoC's PWM0 pin from GPIO to PWM.
>>    */
>>   static struct gpiod_lookup_table pmic_panel_gpio_table =3D {
>>   	/* Intel GFX is consumer */
>> @@ -699,23 +707,68 @@ static struct gpiod_lookup_table pmic_panel_gpio_t=
able =3D {
>>   	},
>>   };
>>   =

>> +static struct gpiod_lookup_table soc_panel_gpio_table =3D {
>> +	.dev_id =3D "0000:00:02.0",
>> +	.table =3D {
>> +	  GPIO_LOOKUP("INT33FC:01", 10, "backlight", GPIO_ACTIVE_HIGH),
>> +	  GPIO_LOOKUP("INT33FC:01", 11, "panel", GPIO_ACTIVE_HIGH),
>> +	  { },
> =

> Some kind of indent fail here.

Yeah, this was intentional in the previous revision because of the
80 char limit, but this indent hack is no longer necessary, fixed for
the v2 of this set which I'm preparing.

>> +	},
>> +};
>> +
>> +static const struct pinctrl_map soc_pwm_pinctrl_map[] =3D {
>> +	PIN_MAP_MUX_GROUP("0000:00:02.0", "soc_pwm0", "INT33FC:00",
>> +			  "pwm0_grp", "pwm"),
>> +};
>> +
>>   void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_i=
s_on)
>>   {
>>   	struct drm_device *dev =3D intel_dsi->base.base.dev;
>>   	struct drm_i915_private *dev_priv =3D to_i915(dev);
>>   	struct mipi_config *mipi_config =3D dev_priv->vbt.dsi.config;
>>   	enum gpiod_flags flags =3D panel_is_on ? GPIOD_OUT_HIGH : GPIOD_OUT_L=
OW;
>> +	bool want_backlight_gpio =3D false;
>> +	bool want_panel_gpio =3D false;
>> +	struct pinctrl *pinctrl;
>> +	int ret;
>>   =

>>   	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>>   	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC)) {
>>   		gpiod_add_lookup_table(&pmic_panel_gpio_table);
>> +		want_panel_gpio =3D true;
>> +	}
>> +
>> +	if (IS_VALLEYVIEW(dev_priv) && mipi_config->pwm_blc =3D=3D PPS_BLC_SOC=
) {
>> +		gpiod_add_lookup_table(&soc_panel_gpio_table);
>> +		want_panel_gpio =3D true;
>> +		want_backlight_gpio =3D true;
>>   =

>> +		/* Ensure PWM0 pin is muxed as PWM instead of GPIO */
>> +		ret =3D pinctrl_register_mappings(soc_pwm_pinctrl_map, 1);
> =

> ARRAY_SIZE()?

Ack, will fix for v2.


> =

>> +		if (ret)
>> +			DRM_ERROR("Failed to register pwm0 pinmux mapping\n");
>> +
>> +		pinctrl =3D devm_pinctrl_get_select(dev->dev, "soc_pwm0");
>> +		if (IS_ERR(pinctrl))
>> +			DRM_ERROR("Failed to set pinmux to PWM\n");
>> +	}
>> +
>> +	if (want_panel_gpio) {
>>   		intel_dsi->gpio_panel =3D gpiod_get(dev->dev, "panel", flags);
>>   		if (IS_ERR(intel_dsi->gpio_panel)) {
>>   			DRM_ERROR("Failed to own gpio for panel control\n");
>>   			intel_dsi->gpio_panel =3D NULL;
>>   		}
>>   	}
>> +
>> +	if (want_backlight_gpio) {
>> +		intel_dsi->gpio_backlight =3D
>> +			gpiod_get(dev->dev, "backlight", flags);
>> +		if (IS_ERR(intel_dsi->gpio_backlight)) {
>> +			DRM_ERROR("Failed to own gpio for backlight control\n");
>> +			intel_dsi->gpio_backlight =3D NULL;
>> +		}
>> +	}
>>   }
>>   =

>>   void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
>> @@ -729,7 +782,17 @@ void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *i=
ntel_dsi)
>>   		intel_dsi->gpio_panel =3D NULL;
>>   	}
>>   =

>> +	if (intel_dsi->gpio_backlight) {
>> +		gpiod_put(intel_dsi->gpio_backlight);
>> +		intel_dsi->gpio_backlight =3D NULL;
>> +	}
>> +
>>   	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>>   	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC))
>>   		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
>> +
>> +	if (IS_VALLEYVIEW(dev_priv) && mipi_config->pwm_blc =3D=3D PPS_BLC_SOC=
) {
> =

> Slightly annoying to have these checks duplicated. Might be cleaner to
> have a few helpers that return the correct tables and just use those in
> both init and cleanup. OTOH those want_*_gpio flags and the pwm stuff is
> would still be a sticking point I suppose. So maybe not cleaner in the
> end after all.

So I tried adding a helper for the if condition, since as you mention
just returning the right table is not really helpful:

static bool intel_dsi_vbt_use_pmic_backlight_ctl(struct intel_dsi *intel_ds=
i)
{
        struct drm_device *dev =3D intel_dsi->base.base.dev;
        struct drm_i915_private *dev_priv =3D to_i915(dev);
        struct mipi_config *mipi_config =3D dev_priv->vbt.dsi.config;

        if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
            (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC)) {
        return (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
               mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC;
}

And copy and paste that for the PPS_BLC_SOC case. The result does not
look a lot better then the original, worse actually IMHO, so I'm going
to keep this as is for v2.

> Looks all right to me:
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Thanks.

Regards,

Hans




> =

> =

>> +		pinctrl_unregister_mappings(soc_pwm_pinctrl_map);
>> +		gpiod_remove_lookup_table(&soc_panel_gpio_table);
>> +	}
>>   }
>> -- =

>> 2.23.0
> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
