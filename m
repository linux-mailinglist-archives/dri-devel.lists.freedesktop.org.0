Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4248B3C4653
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 11:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A06896DD;
	Mon, 12 Jul 2021 09:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14166896DD;
 Mon, 12 Jul 2021 09:45:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ACB4022142;
 Mon, 12 Jul 2021 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626083113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gfwhSPRIk1+SU5zNMfYFVZ/T+A7xSDs2uH693upll9k=;
 b=cCH0WnhWwxgMyqUi3AB538P3pV7PNZoCiQKbCqHz8+PnICeDkY+Nhrl7bdbiHlaQxMtOEH
 w5mhyq8u+6RLMx5kTVZhZeub7ZgVcXFQP7XxJ1XfvgfdyQY9tf3lCCvZhUDWVewIZYMuDC
 afMNyZDqJ/OWwCYdSz+yUocwnha4Eq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626083113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gfwhSPRIk1+SU5zNMfYFVZ/T+A7xSDs2uH693upll9k=;
 b=Sc8CI5XeRV6twIKVWmbSDM9JxVmlgzFnM/oDF3vmiP1rO2Enj1E6QKpL6trvKngrYiJDcP
 xkWeznEE7D0NLHBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 423A913B1D;
 Mon, 12 Jul 2021 09:45:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id veg6DykP7GAuKgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jul 2021 09:45:13 +0000
Subject: Re: [v8 1/6] drm/panel: add basic DP AUX backlight support
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rajeev Nandan <rajeevny@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-2-git-send-email-rajeevny@codeaurora.org>
 <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
Message-ID: <00e95983-c7de-1091-d295-9d544f37687c@suse.de>
Date: Mon, 12 Jul 2021 11:45:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="t9eMn3jl6KwcYz0iCxm3oll8aCOnlDRLo"
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
Cc: daniel.thompson@linaro.org, mkrishn@codeaurora.org, jani.nikula@intel.com,
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 dianders@chromium.org, a.hajda@samsung.com, thierry.reding@gmail.com,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 linux-fbdev@vger.kernel.org, kalyan_t@codeaurora.org, jingoohan1@gmail.com,
 hoegsberg@chromium.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--t9eMn3jl6KwcYz0iCxm3oll8aCOnlDRLo
Content-Type: multipart/mixed; boundary="DFHLtkuiMWmSrmqVbMA3p8REMY4RbpHUp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rajeev Nandan <rajeevny@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 robdclark@gmail.com, dianders@chromium.org, lyude@redhat.com,
 jani.nikula@intel.com, robh@kernel.org, laurent.pinchart@ideasonboard.com,
 a.hajda@samsung.com, daniel.thompson@linaro.org, hoegsberg@chromium.org,
 abhinavk@codeaurora.org, seanpaul@chromium.org, kalyan_t@codeaurora.org,
 mkrishn@codeaurora.org, lee.jones@linaro.org, jingoohan1@gmail.com,
 linux-fbdev@vger.kernel.org
Message-ID: <00e95983-c7de-1091-d295-9d544f37687c@suse.de>
Subject: Re: [v8 1/6] drm/panel: add basic DP AUX backlight support
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-2-git-send-email-rajeevny@codeaurora.org>
 <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
In-Reply-To: <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>

--DFHLtkuiMWmSrmqVbMA3p8REMY4RbpHUp
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.07.21 um 11:41 schrieb Thomas Zimmermann:
>=20
>=20
> Am 26.06.21 um 18:51 schrieb Rajeev Nandan:
>> Some panels support backlight control over DP AUX channel using
>> VESA's standard backlight control interface.
>> Using new DRM eDP backlight helpers, add support to create and
>> register a backlight for those panels in drm_panel to simplify
>> the panel drivers.
>>
>> The panel driver with access to "struct drm_dp_aux" can create and
>> register a backlight device using following code snippet in its
>> probe() function:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0err =3D drm_panel_dp_aux_backlight(panel, aux)=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0if (err)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>>
>> Then drm_panel will handle backlight_(enable|disable) calls
>> similar to the case when drm_panel_of_backlight() is used.
>>
>> Currently, we are not supporting one feature where the source
>> device can combine the backlight brightness levels set through
>> DP AUX and the BL_PWM_DIM eDP connector pin. Since it's not
>> required for the basic backlight controls, it can be added later.
>>
>> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> ---
>>
>> Changes in v5:
>> - New
>>
>> Changes in v6:
>> - Fixed ordering of memory allocation (Douglas)
>> - Updated word wrapping in a comment (Douglas)
>>
>> Changes in v8:
>> - Now using backlight_is_blank() to get the backlight blank status=20
>> (Sam Ravnborg)
>>
>> =C2=A0 drivers/gpu/drm/drm_panel.c | 108=20
>> ++++++++++++++++++++++++++++++++++++++++++++
>> =C2=A0 include/drm/drm_panel.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++++=
--
>> =C2=A0 2 files changed, 119 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c=

>> index f634371..4fa1e3b 100644
>> --- a/drivers/gpu/drm/drm_panel.c
>> +++ b/drivers/gpu/drm/drm_panel.c
>> @@ -26,12 +26,20 @@
>> =C2=A0 #include <linux/module.h>
>> =C2=A0 #include <drm/drm_crtc.h>
>> +#include <drm/drm_dp_helper.h>
>> =C2=A0 #include <drm/drm_panel.h>
>> =C2=A0 #include <drm/drm_print.h>
>> =C2=A0 static DEFINE_MUTEX(panel_lock);
>> =C2=A0 static LIST_HEAD(panel_list);
>> +struct dp_aux_backlight {
>> +=C2=A0=C2=A0=C2=A0 struct backlight_device *base;
>> +=C2=A0=C2=A0=C2=A0 struct drm_dp_aux *aux;
>> +=C2=A0=C2=A0=C2=A0 struct drm_edp_backlight_info info;
>> +=C2=A0=C2=A0=C2=A0 bool enabled;
>> +};
>> +
>> =C2=A0 /**
>> =C2=A0=C2=A0 * DOC: drm panel
>> =C2=A0=C2=A0 *
>> @@ -342,6 +350,106 @@ int drm_panel_of_backlight(struct drm_panel *pan=
el)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> =C2=A0 EXPORT_SYMBOL(drm_panel_of_backlight);
>> +
>> +static int dp_aux_backlight_update_status(struct backlight_device *bd=
)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct dp_aux_backlight *bl =3D bl_get_data(bd);
>> +=C2=A0=C2=A0=C2=A0 u16 brightness =3D backlight_get_brightness(bd);
>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!backlight_is_blank(bd)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!bl->enabled) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dr=
m_edp_backlight_enable(bl->aux, &bl->info, brightness);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bl=
->enabled =3D true;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn 0;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_edp_backlight_=
set_level(bl->aux, &bl->info,=20
>> brightness);
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bl->enabled) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dr=
m_edp_backlight_disable(bl->aux, &bl->info);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bl=
->enabled =3D false;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +static const struct backlight_ops dp_aux_bl_ops =3D {
>> +=C2=A0=C2=A0=C2=A0 .update_status =3D dp_aux_backlight_update_status,=

>> +};
>> +
>> +/**
>> + * drm_panel_dp_aux_backlight - create and use DP AUX backlight
>> + * @panel: DRM panel
>> + * @aux: The DP AUX channel to use
>> + *
>> + * Use this function to create and handle backlight if your panel
>> + * supports backlight control over DP AUX channel using DPCD
>> + * registers as per VESA's standard backlight control interface.
>> + *
>> + * When the panel is enabled backlight will be enabled after a
>> + * successful call to &drm_panel_funcs.enable()
>> + *
>> + * When the panel is disabled backlight will be disabled before the
>> + * call to &drm_panel_funcs.disable().
>> + *
>> + * A typical implementation for a panel driver supporting backlight
>> + * control over DP AUX will call this function at probe time.
>> + * Backlight will then be handled transparently without requiring
>> + * any intervention from the driver.
>> + *
>> + * drm_panel_dp_aux_backlight() must be called after the call to=20
>> drm_panel_init().
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct=20
>> drm_dp_aux *aux)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct dp_aux_backlight *bl;
>> +=C2=A0=C2=A0=C2=A0 struct backlight_properties props =3D { 0 };
>> +=C2=A0=C2=A0=C2=A0 u16 current_level;
>> +=C2=A0=C2=A0=C2=A0 u8 current_mode;
>> +=C2=A0=C2=A0=C2=A0 u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!panel || !panel->dev || !aux)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp=
_dpcd,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EDP_DISPLAY_CTL_CAP_SIZE);
>=20
> This creates a cyclic dependency between drm_kms_helper-ko and drm.ko. =

> drm_panel.c is in the latter, while drm_dp_dpcd_read() in=20
> drm_dp_helper.c is in the former. Please fix.

FYI, build DRM as modules and the error shows up during make module_insta=
ll.

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--DFHLtkuiMWmSrmqVbMA3p8REMY4RbpHUp--

--t9eMn3jl6KwcYz0iCxm3oll8aCOnlDRLo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDsDygFAwAAAAAACgkQlh/E3EQov+AU
kw//R7KbArU8YSyU6DQ9XelF9MKwAlhPhJXTR5BGVwrq8JiRKrc+JXxyAe1ScbUUEhIbMsgFHN3E
X/MQ/qxycEc8A/Ud5hAOzGLdA+06WsDvDsN5TPBNmbJ/gTBIqnkj9nPWXNAhyVIm6pPjSJi7kwDZ
j6cK8dUz3Np1W5ewQfMakllblTXHnYqD2q0fUGGNmsSnMSOc69rLataleWk70M3xZYBolAOMQpuG
8EaVuVOXG1KyQSka15oZgpRnRsfXbfww5XKZca6hbUKZuJI7iMQtK8UHjL6ZGyL+2fQUqKKIqaxL
Ksx6JFvA56BLDzoVokkOgx0DHw/VfqSU1w+uDIxrI7g1NtKxJaxr3wlQl94O0fVbPrzlJqp7ZxyT
NA8FXUFB7EyyxfkpkVm/0jt2lFZfXLFS+kmcdR/j0cCwxxORnDmAL5TRLsIlz++J8Sfaj6UXtvq7
5yvD56i7oQLCbgQFPUdlnCiziF4XVN0xQVkph43A6g5b0V9tDr2vHcIMuP2+oNq0eGJ1eBk0s7w5
Y5LTfeugG+uXmeLxFRmEdQXQeuxGblg65r5tW5mZhEN/lvHKy9pgEk84tfueSdTYAE4UxZHNOYl/
4xrUPztEJ8BHzL9PDSW47BgtCHht074azHLhX45a5qcMmuoFRW61OMpwSMAL+yC5vw0sN0b+7OH5
VVE=
=/HfC
-----END PGP SIGNATURE-----

--t9eMn3jl6KwcYz0iCxm3oll8aCOnlDRLo--
