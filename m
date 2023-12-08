Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A57080AC76
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 19:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF3D10E0A8;
	Fri,  8 Dec 2023 18:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8926410E08B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 18:50:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rBfvm-0000y8-NZ; Fri, 08 Dec 2023 19:50:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rBfvm-00ETcH-1d; Fri, 08 Dec 2023 19:50:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rBfvl-00GYOl-Ne; Fri, 08 Dec 2023 19:50:33 +0100
Date: Fri, 8 Dec 2023 19:50:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 000/115] pwm: Fix lifetime issues for pwm_chips
Message-ID: <20231208185033.e6ty2cajcfle6dgk@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <ZXM4CdJxg-XrYhkn@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mbxb7vhkvijvi64k"
Content-Disposition: inline
In-Reply-To: <ZXM4CdJxg-XrYhkn@orome.fritz.box>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mbxb7vhkvijvi64k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Fri, Dec 08, 2023 at 04:41:39PM +0100, Thierry Reding wrote:
> On Wed, Dec 06, 2023 at 12:43:14PM +0100, Uwe Kleine-K=F6nig wrote:
> > This series is based on Thierry's for-next.
> >=20
> > It starts with some cleanups that were all sent out separately already:
> >=20
> >  - "pwm: Reduce number of pointer dereferences in pwm_device_request()"
> >    https://lore.kernel.org/linux-pwm/20231130072105.966848-1-u.kleine-k=
oenig@pengutronix.de
> >  - "pwm: crc: Use consistent variable naming for driver data"
> >    https://lore.kernel.org/linux-pwm/20231130074133.969806-1-u.kleine-k=
oenig@pengutronix.de
> >  - Two leds/qcom-lpg patches
> >    https://lore.kernel.org/linux-leds/20231126095230.683204-1-u.kleine-=
koenig@pengutronix.de
> >    Lee already claimed to have taken the series already, but it's not y=
et in
> >    next.
> >  - "leds: qcom-lpg: Introduce a wrapper for getting driver data from a =
pwm chip"
> >    https://lore.kernel.org/linux-leds/20231124215208.616551-3-u.kleine-=
koenig@pengutronix.de
> >=20
> > In the following patches I changed:
> >=20
> >  - "pwm: cros-ec: Change prototype of helper to prepare further changes=
" +
> >    This was simplified in response to feedback by Tzung-Bi Shih
> >  - Make pwmchip_priv() static (and don't export it), let drivers use a =
new
> >    pwmchip_get_drvdata() instead.
> >  - For drm/ti-sn65dsi86.c and leds/qcom-lpg make use of
> >    pwmchip_set_drvdata() which makes the conversion to
> >    devm_pwmchip_alloc() much prettier.
> >  - Some cleanups here and there
> >  - Add review tags received in v3
> >    I kept all tags even though the pwmchip_alloc() patches changed
> >    slightly. Most of the time that's only
> >    s/pwmchip_priv/pwmchip_get_drvdata/ though. Still, if you object,
> >    just tell me. (This affects Paul Cercueil on patch #68, Conor Dooley
> >    on patch #76 and Greg for patch #109.)
> >=20
> > I kept the pwmchip_alloc() + pwmchip_register() approach despite Bart
> > not liking it. To balance that out I don't like Bart's alternative
> > approach. There are no technically relevant differences between the two
> > approaches and no benchmarks that show either of the two to be better
> > than the other. Conceptually the design ideas around pwmchip_alloc() +
> > pwmchip_register() are used in several other subsystems, so it's a
> > proven way to do things.
>=20
> [Trimming the recipients, keeping only Bart and the mailing lists.]
>=20
> I do think there are technically relevant differences. For one, the
> better we isolate the internal data structure, the easier this becomes
> to manage. I'm attaching a patch that I've prototyped which should
> basically get us to somewhere around patch 110 of this series but with
> something like 1/8th of the changes. It doesn't need every driver to
> change and (mostly) decouples driver code from the core code.

You don't need to touch all drivers because you didn't change struct
pwm_chip::dev yet. (If you really want, you don't need to change that,
but then you have some duplication as chip->dev holds the same value as
priv->dev.parent in the end.)

> Now, I know that you think this is all bad because it's not a single
> allocation, but I much prefer the end result because it's got the driver
> and internals much more cleanly separated. Going forward I think it
> would be easier to apply all the ref-counting on top of that because we
> only need to keep the PWM framework-internal data structure alive after
> a PWM chip has gone away.

Nearly all drivers need driver private data. Isn't it a nice service by
the pwm core to make handling this private data easier for the lowlevel
drivers?

> From 72ea79887d96850f9ccc832ce52b907ca276c940 Mon Sep 17 00:00:00 2001
> From: Thierry Reding <thierry.reding@gmail.com>
> Date: Tue, 28 Nov 2023 15:42:39 +0100
> Subject: [PATCH] pwm: Isolate internal data into a separate structure
>=20
> In order to prepare for proper reference counting of PWM chips and PWM
> devices, move the internal data from the public PWM chip to a private
> PWM chip structure. This ensures that the data that the subsystem core
> may need to reference later on can stick around beyond the lifetime of
> the driver-private data.
>=20
> Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
> ---
>  drivers/pwm/core.c            | 185 +++++++++++++++++++++-------------
>  drivers/pwm/internal.h        |  38 +++++++
>  drivers/pwm/pwm-atmel-hlcdc.c |   8 +-
>  drivers/pwm/pwm-fsl-ftm.c     |   6 +-
>  drivers/pwm/pwm-lpc18xx-sct.c |   4 +-
>  drivers/pwm/pwm-lpss.c        |  14 +--
>  drivers/pwm/pwm-pca9685.c     |   6 +-
>  drivers/pwm/pwm-samsung.c     |   6 +-
>  drivers/pwm/pwm-sifive.c      |   4 +-
>  drivers/pwm/pwm-stm32-lp.c    |   6 +-
>  drivers/pwm/pwm-stm32.c       |   6 +-
>  drivers/pwm/pwm-tiecap.c      |   6 +-
>  drivers/pwm/pwm-tiehrpwm.c    |   6 +-
>  drivers/pwm/sysfs.c           |  48 ++++-----
>  include/linux/pwm.h           |  26 +----
>  15 files changed, 228 insertions(+), 141 deletions(-)
>  create mode 100644 drivers/pwm/internal.h
>=20
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index f60b715abe62..54d57dec6dce 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -24,17 +24,19 @@
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/pwm.h>
> =20
> +#include "internal.h"
> +
>  static DEFINE_MUTEX(pwm_lookup_lock);
>  static LIST_HEAD(pwm_lookup_list);
> =20
> -/* protects access to pwmchip_idr */
> +/* protects access to pwm_chips */
>  static DEFINE_MUTEX(pwm_lock);
> =20
> -static DEFINE_IDR(pwmchip_idr);
> +static DEFINE_IDR(pwm_chips);

That's an unrelated change.

>  static struct pwm_chip *pwmchip_find_by_name(const char *name)
>  {
> -	struct pwm_chip *chip;
> +	struct pwm_chip_private *priv;
>  	unsigned long id, tmp;
> =20
>  	if (!name)
> @@ -42,12 +44,12 @@ static struct pwm_chip *pwmchip_find_by_name(const ch=
ar *name)
> =20
>  	mutex_lock(&pwm_lock);
> =20
> -	idr_for_each_entry_ul(&pwmchip_idr, chip, tmp, id) {
> -		const char *chip_name =3D dev_name(chip->dev);
> +	idr_for_each_entry_ul(&pwm_chips, priv, tmp, id) {
> +		const char *chip_name =3D dev_name(priv->chip->dev);

two pointer dereferences instead of one before.

>  		if (chip_name && strcmp(chip_name, name) =3D=3D 0) {
>  			mutex_unlock(&pwm_lock);
> -			return chip;
> +			return priv->chip;

one pointer reference instead of none before.

>  		}
>  	}
> =20
> @@ -58,23 +60,24 @@ static struct pwm_chip *pwmchip_find_by_name(const ch=
ar *name)
> =20
>  static int pwm_device_request(struct pwm_device *pwm, const char *label)
>  {
> +	struct pwm_chip *chip =3D pwm->priv->chip;

With my approach getting the chip of a struct pwm_device is only one
pointer dereference away. You need two.

>  	int err;
> =20
>  	if (test_bit(PWMF_REQUESTED, &pwm->flags))
>  		return -EBUSY;
> =20
> -	if (!try_module_get(pwm->chip->owner))
> +	if (!try_module_get(pwm->priv->owner))
>  		return -ENODEV;
> =20
> -	if (pwm->chip->ops->request) {
> -		err =3D pwm->chip->ops->request(pwm->chip, pwm);
> +	if (chip->ops->request) {
> +		err =3D chip->ops->request(chip, pwm);

You seem to have reimplemented half of
https://lore.kernel.org/linux-pwm/20231130072105.966848-1-u.kleine-koenig@p=
engutronix.de
here.

>  		if (err) {
> -			module_put(pwm->chip->owner);
> +			module_put(pwm->priv->owner);
>  			return err;
>  		}
>  	}
> =20
> -	if (pwm->chip->ops->get_state) {
> +	if (chip->ops->get_state) {
>  		/*
>  		 * Zero-initialize state because most drivers are unaware of
>  		 * .usage_power. The other members of state are supposed to be
> @@ -84,7 +87,7 @@ static int pwm_device_request(struct pwm_device *pwm, c=
onst char *label)
>  		 */
>  		struct pwm_state state =3D { 0, };
> =20
> -		err =3D pwm->chip->ops->get_state(pwm->chip, pwm, &state);
> +		err =3D chip->ops->get_state(chip, pwm, &state);
>  		trace_pwm_get(pwm, &state, err);
> =20
>  		if (!err)
> @@ -196,6 +199,64 @@ static bool pwm_ops_check(const struct pwm_chip *chi=
p)
>  	return true;
>  }
> =20
> +static struct pwm_chip_private *pwmchip_alloc(struct pwm_chip *chip,
> +					      struct module *owner)
> +{
> +	struct pwm_chip_private *priv;
> +	struct pwm_device *pwm;
> +	unsigned int i;
> +	int err;
> +
> +	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return ERR_PTR(-ENOMEM);
> +
> +	priv->pwms =3D kcalloc(chip->npwm, sizeof(*pwm), GFP_KERNEL);
> +	if (!priv->pwms) {
> +		err =3D -ENOMEM;
> +		goto free;
> +	}

Oh, so you don't use one additional allocation but two.

> +	priv->owner =3D owner;
> +	priv->chip =3D chip;
> +
> +	for (i =3D 0; i < chip->npwm; i++) {
> +		struct pwm_device *pwm =3D &priv->pwms[i];
> +
> +		pwm->priv =3D priv;
> +		pwm->hwpwm =3D i;
> +	}
> +
> +	mutex_lock(&pwm_lock);
> +
> +	err =3D idr_alloc(&pwm_chips, priv, 0, 0, GFP_KERNEL);
> +	if (err < 0) {
> +		mutex_unlock(&pwm_lock);
> +		goto free;
> +	}
> +
> +	mutex_unlock(&pwm_lock);
> +
> +	priv->id =3D err;
> +
> +	return priv;
> +
> +free:
> +	kfree(priv->pwms);
> +	kfree(priv);
> +	return ERR_PTR(err);
> +}
> +
> +static void pwmchip_free(struct pwm_chip_private *priv)
> +{
> +	mutex_lock(&pwm_lock);
> +	idr_remove(&pwm_chips, priv->id);
> +	mutex_unlock(&pwm_lock);
> +
> +	kfree(priv->pwms);
> +	kfree(priv);
> +}
> +
>  /**
>   * __pwmchip_add() - register a new PWM chip
>   * @chip: the PWM chip to add
> @@ -208,8 +269,7 @@ static bool pwm_ops_check(const struct pwm_chip *chip)
>   */
>  int __pwmchip_add(struct pwm_chip *chip, struct module *owner)
>  {
> -	unsigned int i;
> -	int ret;
> +	struct pwm_chip_private *priv;
> =20
>  	if (!chip || !chip->dev || !chip->ops || !chip->npwm)
>  		return -EINVAL;
> @@ -217,36 +277,16 @@ int __pwmchip_add(struct pwm_chip *chip, struct mod=
ule *owner)
>  	if (!pwm_ops_check(chip))
>  		return -EINVAL;
> =20
> -	chip->owner =3D owner;
> -
> -	chip->pwms =3D kcalloc(chip->npwm, sizeof(*chip->pwms), GFP_KERNEL);
> -	if (!chip->pwms)
> +	priv =3D pwmchip_alloc(chip, owner);
> +	if (!priv)
>  		return -ENOMEM;
> =20
> -	mutex_lock(&pwm_lock);
> -
> -	ret =3D idr_alloc(&pwmchip_idr, chip, 0, 0, GFP_KERNEL);
> -	if (ret < 0) {
> -		mutex_unlock(&pwm_lock);
> -		kfree(chip->pwms);
> -		return ret;
> -	}
> -
> -	chip->id =3D ret;
> -
> -	for (i =3D 0; i < chip->npwm; i++) {
> -		struct pwm_device *pwm =3D &chip->pwms[i];
> -
> -		pwm->chip =3D chip;
> -		pwm->hwpwm =3D i;
> -	}
> -
> -	mutex_unlock(&pwm_lock);
> +	chip->priv =3D priv;
> =20
>  	if (IS_ENABLED(CONFIG_OF))
>  		of_pwmchip_add(chip);
> =20
> -	pwmchip_sysfs_export(chip);
> +	pwmchip_sysfs_export(priv);
> =20
>  	return 0;
>  }
> @@ -260,18 +300,14 @@ EXPORT_SYMBOL_GPL(__pwmchip_add);
>   */
>  void pwmchip_remove(struct pwm_chip *chip)
>  {
> -	pwmchip_sysfs_unexport(chip);
> -
> -	if (IS_ENABLED(CONFIG_OF))
> -		of_pwmchip_remove(chip);
> -
>  	mutex_lock(&pwm_lock);
> =20
> -	idr_remove(&pwmchip_idr, chip->id);
> +	pwmchip_sysfs_unexport(chip->priv);
> =20
> -	mutex_unlock(&pwm_lock);
> +	if (IS_ENABLED(CONFIG_OF))
> +		of_pwmchip_remove(chip);
> =20
> -	kfree(chip->pwms);
> +	pwmchip_free(chip->priv);
>  }
>  EXPORT_SYMBOL_GPL(pwmchip_remove);
> =20
> @@ -315,7 +351,7 @@ struct pwm_device *pwm_request_from_chip(struct pwm_c=
hip *chip,
>  		return ERR_PTR(-EINVAL);
> =20
>  	mutex_lock(&pwm_lock);
> -	pwm =3D &chip->pwms[index];
> +	pwm =3D &chip->priv->pwms[index];

two pointer dereferences instead of one before.

>  	err =3D pwm_device_request(pwm, label);
>  	if (err < 0)
> @@ -329,9 +365,9 @@ EXPORT_SYMBOL_GPL(pwm_request_from_chip);
>  static void pwm_apply_state_debug(struct pwm_device *pwm,
>  				  const struct pwm_state *state)
>  {
> -	struct pwm_state *last =3D &pwm->last;
> -	struct pwm_chip *chip =3D pwm->chip;
> +	struct pwm_chip *chip =3D pwm->priv->chip;
>  	struct pwm_state s1 =3D { 0 }, s2 =3D { 0 };
> +	struct pwm_state *last =3D &pwm->last;
>  	int err;
> =20
>  	if (!IS_ENABLED(CONFIG_PWM_DEBUG))
> @@ -439,7 +475,6 @@ static void pwm_apply_state_debug(struct pwm_device *=
pwm,
>   */
>  int pwm_apply_state(struct pwm_device *pwm, const struct pwm_state *stat=
e)
>  {
> -	struct pwm_chip *chip;
>  	int err;
> =20
>  	/*
> @@ -455,8 +490,6 @@ int pwm_apply_state(struct pwm_device *pwm, const str=
uct pwm_state *state)
>  	    state->duty_cycle > state->period)
>  		return -EINVAL;
> =20
> -	chip =3D pwm->chip;
> -
>  	if (state->period =3D=3D pwm->state.period &&
>  	    state->duty_cycle =3D=3D pwm->state.duty_cycle &&
>  	    state->polarity =3D=3D pwm->state.polarity &&
> @@ -464,7 +497,7 @@ int pwm_apply_state(struct pwm_device *pwm, const str=
uct pwm_state *state)
>  	    state->usage_power =3D=3D pwm->state.usage_power)
>  		return 0;
> =20
> -	err =3D chip->ops->apply(chip, pwm, state);
> +	err =3D pwm->priv->chip->ops->apply(pwm->priv->chip, pwm, state);

four pointer dereferences instead of two before.

>  	trace_pwm_apply(pwm, state, err);
>  	if (err)
>  		return err;
> @@ -492,16 +525,19 @@ EXPORT_SYMBOL_GPL(pwm_apply_state);
>  int pwm_capture(struct pwm_device *pwm, struct pwm_capture *result,
>  		unsigned long timeout)
>  {
> +	struct pwm_chip *chip;
>  	int err;
> =20
> -	if (!pwm || !pwm->chip->ops)
> +	if (!pwm)
>  		return -EINVAL;
> =20
> -	if (!pwm->chip->ops->capture)
> +	chip =3D pwm->priv->chip;

One pointer deference more than before (assuming sensible compilation).

> +	if (!chip || !chip->ops || !chip->ops->capture)
>  		return -ENOSYS;

Changing the return code for !chip->ops isn't intended, is it?

>  	mutex_lock(&pwm_lock);
> -	err =3D pwm->chip->ops->capture(pwm->chip, pwm, result, timeout);
> +	err =3D chip->ops->capture(chip, pwm, result, timeout);
>  	mutex_unlock(&pwm_lock);
> =20
>  	return err;
> @@ -566,16 +602,19 @@ EXPORT_SYMBOL_GPL(pwm_adjust_config);
> =20
>  static struct pwm_chip *fwnode_to_pwmchip(struct fwnode_handle *fwnode)
>  {
> -	struct pwm_chip *chip;
> +	struct pwm_chip_private *priv;
>  	unsigned long id, tmp;
> =20
>  	mutex_lock(&pwm_lock);
> =20
> -	idr_for_each_entry_ul(&pwmchip_idr, chip, tmp, id)
> +	idr_for_each_entry_ul(&pwm_chips, priv, tmp, id) {
> +		struct pwm_chip *chip =3D priv->chip;
> +

One pointer dereference more per iteration than before.

>  		if (chip->dev && device_match_fwnode(chip->dev, fwnode)) {
>  			mutex_unlock(&pwm_lock);
>  			return chip;
>  		}
> +	}
> =20
>  	mutex_unlock(&pwm_lock);
> =20
> @@ -585,6 +624,7 @@ static struct pwm_chip *fwnode_to_pwmchip(struct fwno=
de_handle *fwnode)
>  static struct device_link *pwm_device_link_add(struct device *dev,
>  					       struct pwm_device *pwm)
>  {
> +	struct pwm_chip *chip =3D pwm->priv->chip;
>  	struct device_link *dl;
> =20
>  	if (!dev) {
> @@ -593,15 +633,15 @@ static struct device_link *pwm_device_link_add(stru=
ct device *dev,
>  		 * impact the PM sequence ordering: the PWM supplier may get
>  		 * suspended before the consumer.
>  		 */
> -		dev_warn(pwm->chip->dev,
> +		dev_warn(chip->dev,

One pointer deference more than before (assuming sensible compilation).

>  			 "No consumer device specified to create a link to\n");
>  		return NULL;
>  	}
> =20
> -	dl =3D device_link_add(dev, pwm->chip->dev, DL_FLAG_AUTOREMOVE_CONSUMER=
);
> +	dl =3D device_link_add(dev, chip->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
>  	if (!dl) {
>  		dev_err(dev, "failed to create device link to %s\n",
> -			dev_name(pwm->chip->dev));
> +			dev_name(chip->dev));
>  		return ERR_PTR(-EINVAL);
>  	}
> =20
> @@ -918,12 +958,12 @@ void pwm_put(struct pwm_device *pwm)
>  		goto out;
>  	}
> =20
> -	if (pwm->chip->ops->free)
> -		pwm->chip->ops->free(pwm->chip, pwm);
> +	if (pwm->priv->chip->ops->free)
> +		pwm->priv->chip->ops->free(pwm->priv->chip, pwm);

One pointer deference more than before (assuming sensible compilation).

>  	pwm->label =3D NULL;
> =20
> -	module_put(pwm->chip->owner);
> +	module_put(pwm->priv->owner);
>  out:
>  	mutex_unlock(&pwm_lock);
>  }
> @@ -997,12 +1037,12 @@ struct pwm_device *devm_fwnode_pwm_get(struct devi=
ce *dev,
>  EXPORT_SYMBOL_GPL(devm_fwnode_pwm_get);
> =20
>  #ifdef CONFIG_DEBUG_FS
> -static void pwm_dbg_show(struct pwm_chip *chip, struct seq_file *s)
> +static void pwm_dbg_show(struct pwm_chip_private *priv, struct seq_file =
*s)
>  {
>  	unsigned int i;
> =20
> -	for (i =3D 0; i < chip->npwm; i++) {
> -		struct pwm_device *pwm =3D &chip->pwms[i];
> +	for (i =3D 0; i < priv->chip->npwm; i++) {
> +		struct pwm_device *pwm =3D &priv->pwms[i];
>  		struct pwm_state state;
> =20
>  		pwm_get_state(pwm, &state);
> @@ -1035,7 +1075,7 @@ static void *pwm_seq_start(struct seq_file *s, loff=
_t *pos)
>  	mutex_lock(&pwm_lock);
>  	s->private =3D "";
> =20
> -	ret =3D idr_get_next_ul(&pwmchip_idr, &id);
> +	ret =3D idr_get_next_ul(&pwm_chips, &id);
>  	*pos =3D id;
>  	return ret;
>  }
> @@ -1047,7 +1087,7 @@ static void *pwm_seq_next(struct seq_file *s, void =
*v, loff_t *pos)
> =20
>  	s->private =3D "\n";
> =20
> -	ret =3D idr_get_next_ul(&pwmchip_idr, &id);
> +	ret =3D idr_get_next_ul(&pwm_chips, &id);
>  	*pos =3D id;
>  	return ret;
>  }
> @@ -1059,15 +1099,16 @@ static void pwm_seq_stop(struct seq_file *s, void=
 *v)
> =20
>  static int pwm_seq_show(struct seq_file *s, void *v)
>  {
> -	struct pwm_chip *chip =3D v;
> +	struct pwm_chip_private *priv =3D v;
> +	struct pwm_chip *chip =3D priv->chip;

And another additional pointer dereference.

>  	seq_printf(s, "%s%d: %s/%s, %d PWM device%s\n",
> -		   (char *)s->private, chip->id,
> +		   (char *)s->private, priv->id,
>  		   chip->dev->bus ? chip->dev->bus->name : "no-bus",
>  		   dev_name(chip->dev), chip->npwm,
>  		   (chip->npwm !=3D 1) ? "s" : "");
> =20
> -	pwm_dbg_show(chip, s);
> +	pwm_dbg_show(priv, s);
> =20
>  	return 0;
>  }
> diff --git a/drivers/pwm/internal.h b/drivers/pwm/internal.h
> new file mode 100644
> index 000000000000..44fffd3b6744
> --- /dev/null
> +++ b/drivers/pwm/internal.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef PWM_INTERNAL_H
> +#define PWM_INTERNAL_H
> +
> +#include <linux/list.h>

This is unused?

> +struct pwm_chip;
> +struct pwm_device;
> +
> +/**
> + * struct pwm_chip_private - subsystem-private PWM chip data
> + * @chip: driver-private PWM chip data
> + * @owner: module providing the chip
> + * @pwms: array of PWM devices allocated by the framework
> + * @base: number of first PWM controlled by this chip
> + */
> +struct pwm_chip_private {
> +	struct pwm_chip *chip;
> +	struct module *owner;
> +	struct pwm_device *pwms;
> +	unsigned int id;
> +};

With my approach the struct pwm_chip * pointer isn't needed because it's
all in one structure. So you have two structures where I only have one
and your two are bigger in sum than my single one (not counting memory
management overhead and alignment).

> +#ifdef CONFIG_PWM_SYSFS
> +void pwmchip_sysfs_export(struct pwm_chip_private *priv);
> +void pwmchip_sysfs_unexport(struct pwm_chip_private *priv);
> +#else
> +static inline void pwmchip_sysfs_export(struct pwm_chip_private *priv)
> +{
> +}
> +
> +static inline void pwmchip_sysfs_unexport(struct pwm_chip_private *priv)
> +{
> +}
> +#endif /* CONFIG_PWM_SYSFS */
> +
> +#endif /* PWM_INTERNAL_H */
> diff --git a/drivers/pwm/pwm-atmel-hlcdc.c b/drivers/pwm/pwm-atmel-hlcdc.c
> index 3f2c5031a3ba..6bbbfaa582c1 100644
> --- a/drivers/pwm/pwm-atmel-hlcdc.c
> +++ b/drivers/pwm/pwm-atmel-hlcdc.c
> @@ -15,6 +15,8 @@
>  #include <linux/pwm.h>
>  #include <linux/regmap.h>
> =20
> +#include "internal.h"
> +
>  #define ATMEL_HLCDC_PWMCVAL_MASK	GENMASK(15, 8)
>  #define ATMEL_HLCDC_PWMCVAL(x)		(((x) << 8) & ATMEL_HLCDC_PWMCVAL_MASK)
>  #define ATMEL_HLCDC_PWMPOL		BIT(4)
> @@ -185,7 +187,7 @@ static int atmel_hlcdc_pwm_suspend(struct device *dev)
>  	struct atmel_hlcdc_pwm *atmel =3D dev_get_drvdata(dev);
> =20
>  	/* Keep the periph clock enabled if the PWM is still running. */
> -	if (pwm_is_enabled(&atmel->chip.pwms[0]))
> +	if (pwm_is_enabled(&atmel->chip.priv->pwms[0]))

Didn't work so well to hide the internals of pwm_chip_private from the
drivers?

>  		clk_disable_unprepare(atmel->hlcdc->periph_clk);
> =20
>  	return 0;
> =20

[... a few more drivers where hiding the internals failed ...]

> diff --git a/drivers/pwm/sysfs.c b/drivers/pwm/sysfs.c
> index 4edb994fa2e1..653df20afe1c 100644
> --- a/drivers/pwm/sysfs.c
> +++ b/drivers/pwm/sysfs.c
> @@ -14,6 +14,8 @@
>  #include <linux/kdev_t.h>
>  #include <linux/pwm.h>
> =20
> +#include "internal.h"
> +
>  struct pwm_export {
>  	struct device child;
>  	struct pwm_device *pwm;
> @@ -311,7 +313,7 @@ static ssize_t export_store(struct device *parent,
>  			    struct device_attribute *attr,
>  			    const char *buf, size_t len)
>  {
> -	struct pwm_chip *chip =3D dev_get_drvdata(parent);
> +	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
>  	struct pwm_device *pwm;
>  	unsigned int hwpwm;
>  	int ret;
> @@ -320,10 +322,10 @@ static ssize_t export_store(struct device *parent,
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (hwpwm >=3D chip->npwm)
> +	if (hwpwm >=3D priv->chip->npwm)

One more pointer dereference than before. You could trade that for some
data duplication by copying npwm to struct pwmchip_priv for the case
when you need .npwm but the chip is already gone.

>  		return -ENODEV;
> =20
> -	pwm =3D pwm_request_from_chip(chip, hwpwm, "sysfs");
> +	pwm =3D pwm_request_from_chip(priv->chip, hwpwm, "sysfs");
>  	if (IS_ERR(pwm))
>  		return PTR_ERR(pwm);
> =20
> @@ -339,7 +341,7 @@ static ssize_t unexport_store(struct device *parent,
>  			      struct device_attribute *attr,
>  			      const char *buf, size_t len)
>  {
> -	struct pwm_chip *chip =3D dev_get_drvdata(parent);
> +	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
>  	unsigned int hwpwm;
>  	int ret;
> =20
> @@ -347,10 +349,10 @@ static ssize_t unexport_store(struct device *parent,
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (hwpwm >=3D chip->npwm)
> +	if (hwpwm >=3D priv->chip->npwm)

One more pointer dereference than before.

>  		return -ENODEV;
> =20
> -	ret =3D pwm_unexport_child(parent, &chip->pwms[hwpwm]);
> +	ret =3D pwm_unexport_child(parent, &priv->pwms[hwpwm]);
> =20
>  	return ret ? : len;
>  }
> @@ -359,9 +361,9 @@ static DEVICE_ATTR_WO(unexport);
>  static ssize_t npwm_show(struct device *parent, struct device_attribute =
*attr,
>  			 char *buf)
>  {
> -	const struct pwm_chip *chip =3D dev_get_drvdata(parent);
> +	const struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
> =20
> -	return sysfs_emit(buf, "%u\n", chip->npwm);
> +	return sysfs_emit(buf, "%u\n", priv->chip->npwm);
>  }
>  static DEVICE_ATTR_RO(npwm);
> =20
> @@ -411,12 +413,12 @@ static int pwm_class_apply_state(struct pwm_export =
*export,
> =20
>  static int pwm_class_resume_npwm(struct device *parent, unsigned int npw=
m)
>  {
> -	struct pwm_chip *chip =3D dev_get_drvdata(parent);
> +	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
>  	unsigned int i;
>  	int ret =3D 0;
> =20
>  	for (i =3D 0; i < npwm; i++) {
> -		struct pwm_device *pwm =3D &chip->pwms[i];
> +		struct pwm_device *pwm =3D &priv->pwms[i];
>  		struct pwm_state state;
>  		struct pwm_export *export;
> =20
> @@ -442,12 +444,12 @@ static int pwm_class_resume_npwm(struct device *par=
ent, unsigned int npwm)
> =20
>  static int pwm_class_suspend(struct device *parent)
>  {
> -	struct pwm_chip *chip =3D dev_get_drvdata(parent);
> +	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
>  	unsigned int i;
>  	int ret =3D 0;
> =20
> -	for (i =3D 0; i < chip->npwm; i++) {
> -		struct pwm_device *pwm =3D &chip->pwms[i];
> +	for (i =3D 0; i < priv->chip->npwm; i++) {
> +		struct pwm_device *pwm =3D &priv->pwms[i];
>  		struct pwm_state state;
>  		struct pwm_export *export;
> =20
> @@ -483,9 +485,9 @@ static int pwm_class_suspend(struct device *parent)
> =20
>  static int pwm_class_resume(struct device *parent)
>  {
> -	struct pwm_chip *chip =3D dev_get_drvdata(parent);
> +	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
> =20
> -	return pwm_class_resume_npwm(parent, chip->npwm);
> +	return pwm_class_resume_npwm(parent, priv->chip->npwm);

One more pointer dereference than before.

>  }
> =20
>  static DEFINE_SIMPLE_DEV_PM_OPS(pwm_class_pm_ops, pwm_class_suspend, pwm=
_class_resume);
> @@ -501,7 +503,7 @@ static int pwmchip_sysfs_match(struct device *parent,=
 const void *data)
>  	return dev_get_drvdata(parent) =3D=3D data;
>  }
> =20
> -void pwmchip_sysfs_export(struct pwm_chip *chip)
> +void pwmchip_sysfs_export(struct pwm_chip_private *priv)
>  {
>  	struct device *parent;
> =20
> @@ -509,26 +511,26 @@ void pwmchip_sysfs_export(struct pwm_chip *chip)
>  	 * If device_create() fails the pwm_chip is still usable by
>  	 * the kernel it's just not exported.
>  	 */
> -	parent =3D device_create(&pwm_class, chip->dev, MKDEV(0, 0), chip,
> -			       "pwmchip%d", chip->id);
> +	parent =3D device_create(&pwm_class, priv->chip->dev, MKDEV(0, 0), priv,
> +			       "pwmchip%d", priv->id);
>  	if (IS_ERR(parent)) {
> -		dev_warn(chip->dev,
> +		dev_warn(priv->chip->dev,

One more pointer dereference than before.

>  			 "device_create failed for pwm_chip sysfs export\n");
>  	}
>  }

The TL;DR; is essentially what I already wrote in my last reply to Bart
in the v3 thread[1]:

 - My approach needs more changes to the individual drivers (which I
   don't consider a relevant disadvantage given that the resulting code
   is better);
 - My approach works with less pointer dereferences which IMHO also
   simplifies understanding the code as all relevant data is in a single
   place.
 - My approach has a weaker separation between the core and the lowlevel
   drivers. That's ok in my book given that this doesn't complicate the
   lowlevel drivers and that hiding details considerably better doesn't
   work anyhow (see the drivers that need internal.h in your patch).

For me the single allocation issue is only an added bonus. The relevant
advantage of my approach is that the code is easier and (probably) more
efficient.

Best regards
Uwe

[1] https://lore.kernel.org/linux-pwm/20231205093145.l7p52xtw2ak756ra@pengu=
tronix.de


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mbxb7vhkvijvi64k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVzZXgACgkQj4D7WH0S
/k5rowgAgSsQK9ESoK8tPeurylQNhyf+cQLwLNvBdDr2Tb1B5HAH9BKbFpub3UlN
4AzwN1Sl4O29Pg1Ytj47nbJ7Na+wv35FOgbaU7aXIX0WjcI2RCqJ7GOPoKEONnYw
NnsVFz+bUyjqP+JH0DsjuuKe9DpPas52sToQAR1tPEv+j9HB+xeMlymDUriZjR7d
g40gDpnMWHrC+EL7BfTm4dQ2B28j5jieZb55zPfBI/OZFre/eUzlGe1YakyKrSPp
gtEUBkS6N4IomcUqpNlYGsk5MDLEdt5+cgXyQaB0eUhNzmN2FTqt9GzLriJK3h1E
LU9TwwQ7OEFL63QIBUm3tSbrAVTFlQ==
=IW/k
-----END PGP SIGNATURE-----

--mbxb7vhkvijvi64k--
