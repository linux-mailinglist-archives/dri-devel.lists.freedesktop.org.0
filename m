Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C22326A600
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 15:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0226E6E096;
	Tue, 15 Sep 2020 13:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F416E096
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 13:12:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k15so3234033wrn.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 06:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TyPqer7wDB2gWtoMI+Ms6W/7jkrH1d+RA3XfBspqMnI=;
 b=kPnmuSd6QqrpVTHX95//DQc41AD116cjWihniGNpviDQoq16XlcDIdJZJLz5KNy0uI
 n3EhuPGapDIYBwT7G/5//QgEpnbBQAiq6Pe7xtgHh/g7wKAc89GziONgcZ3OITtMfixS
 8kDIZaqcct2SGjhF3A+5OynRiMbv3+kWiaLfNSFH/3k2NR3RH3aDHLTctq1snCR1cQDl
 t8s1AMbKB8Vd03ehsU9r+39gJgNsCy/fi/yD1uf8hzX3UP4kbQW52svRhbIkU8B4aUCI
 mBJuu2P7qbf0OZ/xuaLsVBYfWNu28jor/g8nbeiMj2TFq/tAomrJNtRVaIjhGFOiYKJR
 NUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TyPqer7wDB2gWtoMI+Ms6W/7jkrH1d+RA3XfBspqMnI=;
 b=YbJntPhX3Z1NFSD+jRF4h/kBP4RE0tqGNg5GdX7P/Iqh3DTlyiww0liXeEjb/3VDCQ
 TC4CirnHJnVmhsZMRwh8KDGgG9yybqF3a3vnryRts/IClj32e/t0APCRjhdHO2LStNVV
 yFYcNqPRBDsNsy3CRM1GBxW+ejcZ4zW59+tHtCc55VEkMP27OlGZO6IDnZytCngRwEAc
 7Dns53cJcmEEYkWd3rKFaYhm9cliqwVevb+zZyckKHmha+QgnQmcgk4jMcidODZd0xwG
 GVNwBSJwt4Eu9rqSWI40/OMrX58sItgnARJ/+hGXTAYjdQCSVXlWBQmGVSXTyZVI/+eB
 GeIQ==
X-Gm-Message-State: AOAM533TNAJKs9PuvDXjPh6efRviAdfcdc5hpxZSQaBgAN6PGL9gq/no
 2Rg52KYzywnrUxDu/mb+Pr2oIV+RcEU3Kc8o
X-Google-Smtp-Source: ABdhPJxEPShl+mPnUOC8QFqLlTd2pVCgx27uH2ApSQXB86l4U7LCzUE4ITMvmTwi5BRr/w0QEBI8Fg==
X-Received: by 2002:a5d:5281:: with SMTP id c1mr21203738wrv.184.1600175542353; 
 Tue, 15 Sep 2020 06:12:22 -0700 (PDT)
Received: from [192.168.1.23] (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id z83sm25855339wmb.4.2020.09.15.06.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 06:12:21 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] drm/bridge: ps8640: Rework power state handling
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20200827085911.944899-1-enric.balletbo@collabora.com>
 <20200827085911.944899-2-enric.balletbo@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwU0EVid/pAEQAND7AFhr
 5faf/EhDP9FSgYd/zgmb7JOpFPje3uw7jz9wFb28Cf0Y3CcncdElYoBNbRlesKvjQRL8mozV
 9RN+IUMHdUx1akR/A4BPXNdL7StfzKWOCxZHVS+rIQ/fE3Qz/jRmT6t2ZkpplLxVBpdu95qJ
 YwSZjuwFXdC+A7MHtQXYi3UfCgKiflj4+/ITcKC6EF32KrmIRqamQwiRsDcUUKlAUjkCLcHL
 CQvNsDdm2cxdHxC32AVm3Je8VCsH7/qEPMQ+cEZk47HOR3+Ihfn1LEG5LfwsyWE8/JxsU2a1
 q44LQM2lcK/0AKAL20XDd7ERH/FCBKkNVzi+svYJpyvCZCnWT0TRb72mT+XxLWNwfHTeGALE
 +1As4jIS72IglvbtONxc2OIid3tR5rX3k2V0iud0P7Hnz/JTdfvSpVj55ZurOl2XAXUpGbq5
 XRk5CESFuLQV8oqCxgWAEgFyEapI4GwJsvfl/2Er8kLoucYO1Id4mz6N33+omPhaoXfHyLSy
 dxD+CzNJqN2GdavGtobdvv/2V0wukqj86iKF8toLG2/Fia3DxMaGUxqI7GMOuiGZjXPt/et/
 qeOySghdQ7Sdpu6fWc8CJXV2mOV6DrSzc6ZVB4SmvdoruBHWWOR6YnMz01ShFE49pPucyU1h
 Av4jC62El3pdCrDOnWNFMYbbon3vABEBAAHCwn4EGAECAAkFAlYnf6QCGwICKQkQFpq3saTP
 +K7BXSAEGQECAAYFAlYnf6QACgkQd9zb2sjISdGToxAAkOjSfGxp0ulgHboUAtmxaU3viucV
 e2Hl1BVDtKSKmbIVZmEUvx9D06IijFaEzqtKD34LXD6fjl4HIyDZvwfeaZCbJbO10j3k7FJE
 QrBtpdVqkJxme/nYlGOVzcOiKIepNkwvnHVnuVDVPcXyj2wqtsU7VZDDX41z3X4xTQwY3SO1
 9nRO+f+i4RmtJcITgregMa2PcB0LvrjJlWroI+KAKCzoTHzSTpCXMJ1U/dEqyc87bFBdc+DI
 k8mWkPxsccdbs4t+hH0NoE3Kal9xtAl56RCtO/KgBLAQ5M8oToJVatxAjO1SnRYVN1EaAwrR
 xkHdd97qw6nbg9BMcAoa2NMc0/9MeiaQfbgW6b0reIz/haHhXZ6oYSCl15Knkr4t1o3I2Bqr
 Mw623gdiTzotgtId8VfLB2Vsatj35OqIn5lVbi2ua6I0gkI6S7xJhqeyrfhDNgzTHdQVHB9/
 7jnM0ERXNy1Ket6aDWZWCvM59dTyu37g3VvYzGis8XzrX1oLBU/tTXqo1IFqqIAmvh7lI0Se
 gCrXz7UanxCwUbQBFjzGn6pooEHJYRLuVGLdBuoApl/I4dLqCZij2AGa4CFzrn9W0cwm3HCO
 lR43gFyz0dSkMwNUd195FrvfAz7Bjmmi19DnORKnQmlvGe/9xEEfr5zjey1N9+mt3//geDP6
 clwKBkq0JggA+RTEAELzkgPYKJ3NutoStUAKZGiLOFMpHY6KpItbbHjF2ZKIU1whaRYkHpB2
 uLQXOzZ0d7x60PUdhqG3VmFnzXSztA4vsnDKk7x2xw0pMSTKhMafpxaPQJf494/jGnwBHyi3
 h3QGG1RjfhQ/OMTX/HKtAUB2ct3Q8/jBfF0hS5GzT6dYtj0Ci7+8LUsB2VoayhNXMnaBfh+Q
 pAhaFfRZWTjUFIV4MpDdFDame7PB50s73gF/pfQbjw5Wxtes/0FnqydfId95s+eej+17ldGp
 lMv1ok7K0H/WJSdr7UwDAHEYU++p4RRTJP6DHWXcByVlpNQ4SSAiivmWiwOt490+Ac7ATQRN
 WQbPAQgAvIoM384ZRFocFXPCOBir5m2J+96R2tI2XxMgMfyDXGJwFilBNs+fpttJlt2995A8
 0JwPj8SFdm6FBcxygmxBBCc7i/BVQuY8aC0Z/w9Vzt3Eo561r6pSHr5JGHe8hwBQUcNPd/9l
 2ynP57YTSE9XaGJK8gIuTXWo7pzIkTXfN40Wh5jeCCspj4jNsWiYhljjIbrEj300g8RUT2U0
 FcEoiV7AjJWWQ5pi8lZJX6nmB0lc69Jw03V6mblgeZ/1oTZmOepkagwy2zLDXxihf0GowUif
 GphBDeP8elWBNK+ajl5rmpAMNRoKxpN/xR4NzBg62AjyIvigdywa1RehSTfccQARAQABwsBf
 BBgBAgAJBQJNWQbPAhsMAAoJEBaat7Gkz/iuteIH+wZuRDqK0ysAh+czshtG6JJlLW6eXJJR
 Vi7dIPpgFic2LcbkSlvB8E25Pcfz/+tW+04Urg4PxxFiTFdFCZO+prfd4Mge7/OvUcwoSub7
 ZIPo8726ZF5/xXzajahoIu9/hZ4iywWPAHRvprXaim5E/vKjcTeBMJIqZtS4u/UK3EpAX59R
 XVxVpM8zJPbk535ELUr6I5HQXnihQm8l6rt9TNuf8p2WEDxc8bPAZHLjNyw9a/CdeB97m2Tr
 zR8QplXA5kogS4kLe/7/JmlDMO8Zgm9vKLHSUeesLOrjdZ59EcjldNNBszRZQgEhwaarfz46
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <08dafb77-b243-19e1-247a-6365c2b3234d@baylibre.com>
Date: Tue, 15 Sep 2020 15:12:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827085911.944899-2-enric.balletbo@collabora.com>
Content-Language: en-US
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/08/2020 10:59, Enric Balletbo i Serra wrote:
> The get_edid() callback can be triggered anytime by an ioctl, i.e
> 
>   drm_mode_getconnector (ioctl)
>     -> drm_helper_probe_single_connector_modes
>        -> drm_bridge_connector_get_modes
>           -> ps8640_bridge_get_edid
> 
> Actually if the bridge pre_enable() function was not called before
> get_edid(), the driver will not be able to get the EDID properly and
> display will not work until a second get_edid() call is issued and if
> pre_enable() is called before. The side effect of this, for example, is
> that you see anything when `Frecon` starts, neither the splash screen,
> until the graphical session manager starts.
> 
> To fix this we need to make sure that all we need is enabled before
> reading the EDID. This means the following:
> 
> 1. If get_edid() is called before having the device powered we need to
>    power on the device. In such case, the driver will power off again the
>    device.
> 
> 2. If get_edid() is called after having the device powered, all should
>    just work. We added a powered flag in order to avoid recurrent calls
>    to ps8640_bridge_poweron() and unneeded delays.
> 
> 3. This seems to be specific for this device, but we need to make sure
>    the panel is powered on before do a power on cycle on this device.
>    Otherwise the device fails to retrieve the EDID.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v3:
> - Make poweron/poweroff and pre_enable/post_disable reverse one to each other (Sam Ravnborg)
> 
> Changes in v2:
> - Use drm_bridge_chain_pre_enable/post_disable() helpers (Sam Ravnborg)
> 
>  drivers/gpu/drm/bridge/parade-ps8640.c | 68 ++++++++++++++++++++++----
>  1 file changed, 58 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 9f7b7a9c53c5..7bd0affa057a 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -65,6 +65,7 @@ struct ps8640 {
>  	struct regulator_bulk_data supplies[2];
>  	struct gpio_desc *gpio_reset;
>  	struct gpio_desc *gpio_powerdown;
> +	bool powered;
>  };
>  
>  static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> @@ -91,13 +92,15 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
>  	return 0;
>  }
>  
> -static void ps8640_pre_enable(struct drm_bridge *bridge)
> +static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>  {
> -	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  	struct i2c_client *client = ps_bridge->page[PAGE2_TOP_CNTL];
>  	unsigned long timeout;
>  	int ret, status;
>  
> +	if (ps_bridge->powered)
> +		return;
> +
>  	ret = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
>  				    ps_bridge->supplies);
>  	if (ret < 0) {
> @@ -152,10 +155,6 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>  		goto err_regulators_disable;
>  	}
>  
> -	ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
> -	if (ret)
> -		goto err_regulators_disable;
> -
>  	/* Switch access edp panel's edid through i2c */
>  	ret = i2c_smbus_write_byte_data(client, PAGE2_I2C_BYPASS,
>  					I2C_BYPASS_EN);
> @@ -164,6 +163,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>  		goto err_regulators_disable;
>  	}
>  
> +	ps_bridge->powered = true;
> +
>  	return;
>  
>  err_regulators_disable:
> @@ -171,12 +172,12 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>  			       ps_bridge->supplies);
>  }
>  
> -static void ps8640_post_disable(struct drm_bridge *bridge)
> +static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
>  {
> -	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  	int ret;
>  
> -	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
> +	if (!ps_bridge->powered)
> +		return;
>  
>  	gpiod_set_value(ps_bridge->gpio_reset, 1);
>  	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
> @@ -184,6 +185,28 @@ static void ps8640_post_disable(struct drm_bridge *bridge)
>  				     ps_bridge->supplies);
>  	if (ret < 0)
>  		DRM_ERROR("cannot disable regulators %d\n", ret);
> +
> +	ps_bridge->powered = false;
> +}
> +
> +static void ps8640_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	int ret;
> +
> +	ps8640_bridge_poweron(ps_bridge);
> +
> +	ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
> +	if (ret < 0)
> +		ps8640_bridge_poweroff(ps_bridge);
> +}
> +
> +static void ps8640_post_disable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +
> +	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
> +	ps8640_bridge_poweroff(ps_bridge);
>  }
>  
>  static int ps8640_bridge_attach(struct drm_bridge *bridge,
> @@ -249,9 +272,34 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>  					   struct drm_connector *connector)
>  {
>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	bool poweroff = !ps_bridge->powered;
> +	struct edid *edid;
> +
> +	/*
> +	 * When we end calling get_edid() triggered by an ioctl, i.e
> +	 *
> +	 *   drm_mode_getconnector (ioctl)
> +	 *     -> drm_helper_probe_single_connector_modes
> +	 *        -> drm_bridge_connector_get_modes
> +	 *           -> ps8640_bridge_get_edid
> +	 *
> +	 * We need to make sure that what we need is enabled before reading
> +	 * EDID, for this chip, we need to do a full poweron, otherwise it will
> +	 * fail.
> +	 */
> +	drm_bridge_chain_pre_enable(bridge);
>  
> -	return drm_get_edid(connector,
> +	edid = drm_get_edid(connector,
>  			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
> +
> +	/*
> +	 * If we call the get_edid() function without having enabled the chip
> +	 * before, return the chip to its original power state.
> +	 */
> +	if (poweroff)
> +		drm_bridge_chain_post_disable(bridge);
> +
> +	return edid;
>  }
>  
>  static const struct drm_bridge_funcs ps8640_bridge_funcs = {
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
