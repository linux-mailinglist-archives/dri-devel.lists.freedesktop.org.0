Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EFB3C464F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 11:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA57F89B46;
	Mon, 12 Jul 2021 09:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E64C89856;
 Mon, 12 Jul 2021 09:41:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B55692213D;
 Mon, 12 Jul 2021 09:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626082895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kBOZ8F7mpJ8ZkKh31gjSwikxw852LG7Y+3uDu17esUw=;
 b=xsGNJTDkxke2V7x9DyC/qIo0uHMDc2zlJJY76BGJO5IQukOwgPF4Cj1x3fEYz6Bg/71Fdg
 iCp9IObGoB4J3G306GDZrxwbUnboKY7Qjl988gmgFzbzOuQ4OvF+7v4Eu5dckcoT307glo
 rf9i3g9FOdp8LdXL4LvSdIiVYg7wPTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626082895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kBOZ8F7mpJ8ZkKh31gjSwikxw852LG7Y+3uDu17esUw=;
 b=qF2GDARqdicHcQklGHl1ri+9ueQUKdDGHRRs0nb5sQkHbuyAGwmcW6RSEF4u4o/Y3yEjme
 BT4cDOAtjHVuECCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3912613B1D;
 Mon, 12 Jul 2021 09:41:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bFjKDE8O7GATKQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jul 2021 09:41:35 +0000
Subject: Re: [v8 1/6] drm/panel: add basic DP AUX backlight support
To: Rajeev Nandan <rajeevny@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-2-git-send-email-rajeevny@codeaurora.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
Date: Mon, 12 Jul 2021 11:41:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624726268-14869-2-git-send-email-rajeevny@codeaurora.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pI0bX0lZwZiRn3v4qGUBQl4ZFLgHyzkI0"
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
--pI0bX0lZwZiRn3v4qGUBQl4ZFLgHyzkI0
Content-Type: multipart/mixed; boundary="HhVIaNadSSQ6n2fzFQyF1bVjBTxK3fWU9";
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
Message-ID: <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
Subject: Re: [v8 1/6] drm/panel: add basic DP AUX backlight support
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-2-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1624726268-14869-2-git-send-email-rajeevny@codeaurora.org>

--HhVIaNadSSQ6n2fzFQyF1bVjBTxK3fWU9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 26.06.21 um 18:51 schrieb Rajeev Nandan:
> Some panels support backlight control over DP AUX channel using
> VESA's standard backlight control interface.
> Using new DRM eDP backlight helpers, add support to create and
> register a backlight for those panels in drm_panel to simplify
> the panel drivers.
>=20
> The panel driver with access to "struct drm_dp_aux" can create and
> register a backlight device using following code snippet in its
> probe() function:
>=20
> 	err =3D drm_panel_dp_aux_backlight(panel, aux);
> 	if (err)
> 		return err;
>=20
> Then drm_panel will handle backlight_(enable|disable) calls
> similar to the case when drm_panel_of_backlight() is used.
>=20
> Currently, we are not supporting one feature where the source
> device can combine the backlight brightness levels set through
> DP AUX and the BL_PWM_DIM eDP connector pin. Since it's not
> required for the basic backlight controls, it can be added later.
>=20
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
>=20
> Changes in v5:
> - New
>=20
> Changes in v6:
> - Fixed ordering of memory allocation (Douglas)
> - Updated word wrapping in a comment (Douglas)
>=20
> Changes in v8:
> - Now using backlight_is_blank() to get the backlight blank status (Sam=
 Ravnborg)
>=20
>   drivers/gpu/drm/drm_panel.c | 108 +++++++++++++++++++++++++++++++++++=
+++++++++
>   include/drm/drm_panel.h     |  15 ++++--
>   2 files changed, 119 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371..4fa1e3b 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -26,12 +26,20 @@
>   #include <linux/module.h>
>  =20
>   #include <drm/drm_crtc.h>
> +#include <drm/drm_dp_helper.h>
>   #include <drm/drm_panel.h>
>   #include <drm/drm_print.h>
>  =20
>   static DEFINE_MUTEX(panel_lock);
>   static LIST_HEAD(panel_list);
>  =20
> +struct dp_aux_backlight {
> +	struct backlight_device *base;
> +	struct drm_dp_aux *aux;
> +	struct drm_edp_backlight_info info;
> +	bool enabled;
> +};
> +
>   /**
>    * DOC: drm panel
>    *
> @@ -342,6 +350,106 @@ int drm_panel_of_backlight(struct drm_panel *pane=
l)
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_panel_of_backlight);
> +
> +static int dp_aux_backlight_update_status(struct backlight_device *bd)=

> +{
> +	struct dp_aux_backlight *bl =3D bl_get_data(bd);
> +	u16 brightness =3D backlight_get_brightness(bd);
> +	int ret =3D 0;
> +
> +	if (!backlight_is_blank(bd)) {
> +		if (!bl->enabled) {
> +			drm_edp_backlight_enable(bl->aux, &bl->info, brightness);
> +			bl->enabled =3D true;
> +			return 0;
> +		}
> +		ret =3D drm_edp_backlight_set_level(bl->aux, &bl->info, brightness);=

> +	} else {
> +		if (bl->enabled) {
> +			drm_edp_backlight_disable(bl->aux, &bl->info);
> +			bl->enabled =3D false;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct backlight_ops dp_aux_bl_ops =3D {
> +	.update_status =3D dp_aux_backlight_update_status,
> +};
> +
> +/**
> + * drm_panel_dp_aux_backlight - create and use DP AUX backlight
> + * @panel: DRM panel
> + * @aux: The DP AUX channel to use
> + *
> + * Use this function to create and handle backlight if your panel
> + * supports backlight control over DP AUX channel using DPCD
> + * registers as per VESA's standard backlight control interface.
> + *
> + * When the panel is enabled backlight will be enabled after a
> + * successful call to &drm_panel_funcs.enable()
> + *
> + * When the panel is disabled backlight will be disabled before the
> + * call to &drm_panel_funcs.disable().
> + *
> + * A typical implementation for a panel driver supporting backlight
> + * control over DP AUX will call this function at probe time.
> + * Backlight will then be handled transparently without requiring
> + * any intervention from the driver.
> + *
> + * drm_panel_dp_aux_backlight() must be called after the call to drm_p=
anel_init().
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_=
aux *aux)
> +{
> +	struct dp_aux_backlight *bl;
> +	struct backlight_properties props =3D { 0 };
> +	u16 current_level;
> +	u8 current_mode;
> +	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
> +	int ret;
> +
> +	if (!panel || !panel->dev || !aux)
> +		return -EINVAL;
> +
> +	ret =3D drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
> +			       EDP_DISPLAY_CTL_CAP_SIZE);

This creates a cyclic dependency between drm_kms_helper-ko and drm.ko.=20
drm_panel.c is in the latter, while drm_dp_dpcd_read() in=20
drm_dp_helper.c is in the former. Please fix.

Best regards
Thomas

> +	if (ret < 0)
> +		return ret;
> +
> +	if (!drm_edp_backlight_supported(edp_dpcd)) {
> +		DRM_DEV_INFO(panel->dev, "DP AUX backlight is not supported\n");
> +		return 0;
> +	}
> +
> +	bl =3D devm_kzalloc(panel->dev, sizeof(*bl), GFP_KERNEL);
> +	if (!bl)
> +		return -ENOMEM;
> +
> +	bl->aux =3D aux;
> +
> +	ret =3D drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
> +				     &current_level, &current_mode);
> +	if (ret < 0)
> +		return ret;
> +
> +	props.type =3D BACKLIGHT_RAW;
> +	props.brightness =3D current_level;
> +	props.max_brightness =3D bl->info.max;
> +
> +	bl->base =3D devm_backlight_device_register(panel->dev, "dp_aux_backl=
ight",
> +						  panel->dev, bl,
> +						  &dp_aux_bl_ops, &props);
> +	if (IS_ERR(bl->base))
> +		return PTR_ERR(bl->base);
> +
> +	panel->backlight =3D bl->base;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>   #endif
>  =20
>   MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 33605c3..3ebfaa6 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -32,6 +32,7 @@ struct backlight_device;
>   struct device_node;
>   struct drm_connector;
>   struct drm_device;
> +struct drm_dp_aux;
>   struct drm_panel;
>   struct display_timing;
>  =20
> @@ -64,8 +65,8 @@ enum drm_panel_orientation;
>    * the panel. This is the job of the .unprepare() function.
>    *
>    * Backlight can be handled automatically if configured using
> - * drm_panel_of_backlight(). Then the driver does not need to implemen=
t the
> - * functionality to enable/disable backlight.
> + * drm_panel_of_backlight() or drm_panel_dp_aux_backlight(). Then the =
driver
> + * does not need to implement the functionality to enable/disable back=
light.
>    */
>   struct drm_panel_funcs {
>   	/**
> @@ -144,8 +145,8 @@ struct drm_panel {
>   	 * Backlight device, used to turn on backlight after the call
>   	 * to enable(), and to turn off backlight before the call to
>   	 * disable().
> -	 * backlight is set by drm_panel_of_backlight() and drivers
> -	 * shall not assign it.
> +	 * backlight is set by drm_panel_of_backlight() or
> +	 * drm_panel_dp_aux_backlight() and drivers shall not assign it.
>   	 */
>   	struct backlight_device *backlight;
>  =20
> @@ -208,11 +209,17 @@ static inline int of_drm_get_panel_orientation(co=
nst struct device_node *np,
>   #if IS_ENABLED(CONFIG_DRM_PANEL) && (IS_BUILTIN(CONFIG_BACKLIGHT_CLAS=
S_DEVICE) || \
>   	(IS_MODULE(CONFIG_DRM) && IS_MODULE(CONFIG_BACKLIGHT_CLASS_DEVICE)))=

>   int drm_panel_of_backlight(struct drm_panel *panel);
> +int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_=
aux *aux);
>   #else
>   static inline int drm_panel_of_backlight(struct drm_panel *panel)
>   {
>   	return 0;
>   }
> +static inline int drm_panel_dp_aux_backlight(struct drm_panel *panel,
> +					     struct drm_dp_aux *aux)
> +{
> +	return 0;
> +}
>   #endif
>  =20
>   #endif
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--HhVIaNadSSQ6n2fzFQyF1bVjBTxK3fWU9--

--pI0bX0lZwZiRn3v4qGUBQl4ZFLgHyzkI0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDsDk4FAwAAAAAACgkQlh/E3EQov+DZ
dQ//dVOts02Z0+fd8xcvFtGJPdj6IouyIU93AH9R8qr37ZV9NfnSK77lksrnV+Z9H09Zz5tOOpeW
A+QjyaYvZ771vLkfYfwg4sGfjGgzhb+7LcaZ2pkJyZoLeaOwyCHQTGQQYNHWqlFaUV8f1mqh8d3Q
fbtKuqyn0m0xeYcIAFqjfTFP1Aoy+QPlYykV0UHKHSlmy797FeVBg24tiBDuBqrQoyfJyJhCaQao
x5g4e5VtqBKUHu37Lx2bYe3hHvZ24fn/Yy+YJIoeEAa6p8ZPcdao9qzMfKFlh0BddlF0ZsPSYy7i
DS0MWaMZLB3cs/+bzMrq1/lxtd+1RUdqNfXkm4kzSwiVnLHc/XzwHXWalwgs1ziyFGN9xYHwrq1/
7HkZZP25oxeEOUHRZAySHKa53wBqKysEAUQ9PRCLD/8i7I+IuhNS/Z29Awrqlnu8EOdHh8+lg+jU
WnXmyguhrUVGait99sW54Lk0bKgjFsbEg4yrJajicdn4EyrLSnREH8ddmIsRvTb/ijM9TuW7Sem3
AsC+BbZsXxkyAvuVB8DaFSjCeBbh+xzKvnY/qWnlIcLEvCzDakxjPRMs6/N+3bVaWuAwlPY0zdpL
W5hLkyi8MjX1oHm/HBOEkM01ic2b1qUWSRkR7DoeCBpbnWzdP3rv0mOQ+HbFHzHenEjdSpcemtyn
j2Y=
=2fPd
-----END PGP SIGNATURE-----

--pI0bX0lZwZiRn3v4qGUBQl4ZFLgHyzkI0--
