Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2217D1D3720
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 18:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235716EB8D;
	Thu, 14 May 2020 16:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFCA6EB8D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 16:56:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e1so5192694wrt.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kIHq7xVLLJxCbGB1Nn+uZSxvbyG8thJFHxbJEIE2dyU=;
 b=j5T+Ywi6Oa713BP5oEJIVmlzmnHezmdlOYJwOUiXR6OYLK40ehJ646byGdkink32jt
 Gqd4lX2YzBkH8gHnjnInqnA9pEYdkPCb6e0/X38ptXx2ta7a8zrJTxWXObWQJ4tgNSFV
 s9KHfC7aeHswgpaouPjYDr+LsUeVOB6QuJIreww3mE79MzxR4hWE1OOUiRxS3dMdlOAD
 nFyHQJK+Mu3UBi+oRh24qZ7COWC4Qxmu2e5HUNLaavZv5e8SRyNn6fMD4Hn/MhguAedo
 M06qFY2a2jpOVkI/lH2j28MLMwyWktGuezLrpvXKIWzdTeRPUSNfE9H3393KF3TA/Ly3
 6plQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kIHq7xVLLJxCbGB1Nn+uZSxvbyG8thJFHxbJEIE2dyU=;
 b=j8hVH0R75gaYaQ13gmivFOCI0OSdH9QLaJLEhl6WHcVP9yu366N8EYlJzsImXGfadY
 JL1bd85z6VKLcHlk/48KuOCgAXnnnCDkBGco9YO+8g4OrhBNwTWkhWgvyS3FGoTPen9/
 WfnLgVgvM13hDHT3+Ie2ZeKObJNwiGEtg7IYoMTqXvzT/AuwDgtl+4VwxfHjR8np8Jjk
 E4BcXB9WMwQYCGuWrLD6rmztLLncmyJOVP//H+Ed/JAOP78QbJ3mpJhZADib1EeHtLwx
 oEZrDWnpd1+c8bPZqWwLj+aWJGyV98P/FWmOt/4maAlSzQQahtDbMgkjo6bNmbiiX0XC
 hwtw==
X-Gm-Message-State: AOAM531HlDQWYjtyIVQhjRB6ctcT6hETH3mtk8iDE0J754dlwytqz6Co
 sjoAFfMG5pc6vT+hoWEUporkVJZnFnBEBg==
X-Google-Smtp-Source: ABdhPJxmxpICiUoc7f4VG7Y0z24J48kXysaaCW7t9uA09hj78dL5ecnPkSq4Anm5Bf2fYQ9l55BQDA==
X-Received: by 2002:adf:f9c1:: with SMTP id w1mr6839173wrr.342.1589475415627; 
 Thu, 14 May 2020 09:56:55 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:4460:3fd3:382:4a71?
 ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id e5sm4967122wro.3.2020.05.14.09.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 09:56:54 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm: bridge: dw-hdmi: Pass dw_hdmi pointer to
 .mode_valid() operation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200514011707.6512-1-laurent.pinchart+renesas@ideasonboard.com>
 <8dd2e65a-804d-2764-5a0b-e9e0286afa68@baylibre.com>
 <20200514152809.GH5955@pendragon.ideasonboard.com>
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
Message-ID: <bff7efa2-c2cb-2652-623f-7d7b284c26b7@baylibre.com>
Date: Thu, 14 May 2020 18:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200514152809.GH5955@pendragon.ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sandy Huang <hjc@rock-chips.com>,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/05/2020 17:28, Laurent Pinchart wrote:
> Hi Neil,
> 
> On Thu, May 14, 2020 at 11:15:52AM +0200, Neil Armstrong wrote:
>> On 14/05/2020 03:17, Laurent Pinchart wrote:
>>> Platform glue drivers for dw_hdmi may need to access device-specific
>>> data from their .mode_valid() implementation. They currently have no
>>> clean way to do so, and one driver hacks around it by accessing the
>>> dev_private data of the drm_device retrieved from the connector.
>>>
>>> Pass the dw_hdmi pointer to .mode_valid() in order give context
>>> information to drivers, and add a dw_hdmi_device() to retrieve the
>>> struct device related to the context.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> ---
>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 13 ++++++++++++-
>>>  drivers/gpu/drm/imx/dw_hdmi-imx.c           |  4 ++--
>>>  drivers/gpu/drm/meson/meson_dw_hdmi.c       |  3 ++-
>>>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c      |  2 +-
>>>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  3 ++-
>>>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c       |  6 ++++--
>>>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h       |  3 ++-
>>>  include/drm/bridge/dw_hdmi.h                |  4 +++-
>>>  8 files changed, 28 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> index 30681398cfb0..97c7a9a4983c 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> @@ -2778,7 +2778,8 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>>>  		return MODE_BAD;
>>>  
>>>  	if (hdmi->plat_data->mode_valid)
>>> -		mode_status = hdmi->plat_data->mode_valid(connector, mode);
>>> +		mode_status = hdmi->plat_data->mode_valid(hdmi, connector,
>>> +							  mode);
>>
>> Can't it pass `struct dw_hdmi *hdmi, void *data` like the phy_ops ?
> 
> We could, if we had a void *data pointer :-) The PHY ops have a void
> *phy_data in dw_hdmi_plat_data, but for .mode_valid() (and
> .configure_phy()) we don't have a data field. Would you add one to
> dw_hdmi_plat_data ? I wonder which of them should be passed to
> .configure_phy() in that case, as it's a PHY-related function, but not
> applicable to vendor PHYs. dw_hdmi_plat_data is quite messy :-S
> 
> I wonder if we could merge all private data. Or do you think the PHY ops
> and the other ops would be handled by different pieces of code that
> would each require their own private data ?


No reason to be separated, I think I did a separation to prepare a switch
to extract PHY handling out of dw-hdmi, but I'm not sure it's possible/viable
for the currently handled PHYs.

Neil

> 
>>>  
>>>  	return mode_status;
>>>  }
>>> @@ -3395,6 +3396,16 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
>>>  		i2c_put_adapter(hdmi->ddc);
>>>  }
>>>  
>>> +/*
>>> + * Retrieve the device passed to the dw_hdmi_probe() or dw_hdmi_bind()
>>> + * functions.
>>> + */
>>> +struct device *dw_hdmi_device(struct dw_hdmi *hdmi)
>>> +{
>>> +	return hdmi->dev;
>>> +}
>>> +EXPORT_SYMBOL_GPL(dw_hdmi_device);
>>
>> This looks really hackish, passing data like the phy_ops looks cleaner.
>>
>>> +
>>>  /* -----------------------------------------------------------------------------
>>>   * Probe/remove API, used from platforms based on the DRM bridge API.
>>>   */
>>> diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
>>> index ba4ca17fd4d8..ff5b03a4a86a 100644
>>> --- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
>>> +++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
>>> @@ -145,7 +145,7 @@ static const struct drm_encoder_helper_funcs dw_hdmi_imx_encoder_helper_funcs =
>>>  };
>>>  
>>>  static enum drm_mode_status
>>> -imx6q_hdmi_mode_valid(struct drm_connector *con,
>>> +imx6q_hdmi_mode_valid(struct dw_hdmi *hdmi, struct drm_connector *con,
>>>  		      const struct drm_display_mode *mode)
>>>  {
>>>  	if (mode->clock < 13500)
>>> @@ -158,7 +158,7 @@ imx6q_hdmi_mode_valid(struct drm_connector *con,
>>>  }
>>>  
>>>  static enum drm_mode_status
>>> -imx6dl_hdmi_mode_valid(struct drm_connector *con,
>>> +imx6dl_hdmi_mode_valid(struct dw_hdmi *hdmi, struct drm_connector *con,
>>>  		       const struct drm_display_mode *mode)
>>>  {
>>>  	if (mode->clock < 13500)
>>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>> index 5be963e9db05..174d45ecdeda 100644
>>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>> @@ -630,7 +630,8 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
>>>  }
>>>  
>>>  static enum drm_mode_status
>>> -dw_hdmi_mode_valid(struct drm_connector *connector,
>>> +dw_hdmi_mode_valid(struct dw_hdmi *hdmi,
>>> +		   struct drm_connector *connector,
>>>  		   const struct drm_display_mode *mode)
>>>  {
>>>  	struct meson_drm *priv = connector->dev->dev_private;
>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
>>> index 452461dc96f2..3d2fdbeeb82d 100644
>>> --- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
>>> +++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
>>> @@ -38,7 +38,7 @@ static const struct rcar_hdmi_phy_params rcar_hdmi_phy_params[] = {
>>>  };
>>>  
>>>  static enum drm_mode_status
>>> -rcar_hdmi_mode_valid(struct drm_connector *connector,
>>> +rcar_hdmi_mode_valid(struct dw_hdmi *hdmi, struct drm_connector *connector,
>>>  		     const struct drm_display_mode *mode)
>>>  {
>>>  	/*
>>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>> index 121aa8a63a76..32acfe2c3f58 100644
>>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>> @@ -220,7 +220,8 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>>>  }
>>>  
>>>  static enum drm_mode_status
>>> -dw_hdmi_rockchip_mode_valid(struct drm_connector *connector,
>>> +dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi,
>>> +			    struct drm_connector *connector,
>>>  			    const struct drm_display_mode *mode)
>>>  {
>>>  	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
>>> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
>>> index 972682bb8000..055ffefd1b60 100644
>>> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
>>> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
>>> @@ -31,7 +31,8 @@ sun8i_dw_hdmi_encoder_helper_funcs = {
>>>  };
>>>  
>>>  static enum drm_mode_status
>>> -sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
>>> +sun8i_dw_hdmi_mode_valid_a83t(struct dw_hdmi *hdmi,
>>> +			      struct drm_connector *connector,
>>>  			      const struct drm_display_mode *mode)
>>>  {
>>>  	if (mode->clock > 297000)
>>> @@ -41,7 +42,8 @@ sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
>>>  }
>>>  
>>>  static enum drm_mode_status
>>> -sun8i_dw_hdmi_mode_valid_h6(struct drm_connector *connector,
>>> +sun8i_dw_hdmi_mode_valid_h6(struct dw_hdmi *hdmi,
>>> +			    struct drm_connector *connector,
>>>  			    const struct drm_display_mode *mode)
>>>  {
>>>  	/*
>>> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
>>> index 8e64945167e9..f831cb351d72 100644
>>> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
>>> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
>>> @@ -176,7 +176,8 @@ struct sun8i_hdmi_phy {
>>>  };
>>>  
>>>  struct sun8i_dw_hdmi_quirks {
>>> -	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
>>> +	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi,
>>> +					   struct drm_connector *connector,
>>>  					   const struct drm_display_mode *mode);
>>>  	unsigned int set_rate : 1;
>>>  	unsigned int use_drm_infoframe : 1;
>>> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
>>> index 0b34a12c4a1c..c98010a53683 100644
>>> --- a/include/drm/bridge/dw_hdmi.h
>>> +++ b/include/drm/bridge/dw_hdmi.h
>>> @@ -124,7 +124,8 @@ struct dw_hdmi_phy_ops {
>>>  
>>>  struct dw_hdmi_plat_data {
>>>  	struct regmap *regm;
>>> -	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
>>> +	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi,
>>> +					   struct drm_connector *connector,
>>>  					   const struct drm_display_mode *mode);
>>>  	unsigned long input_bus_format;
>>>  	unsigned long input_bus_encoding;
>>> @@ -153,6 +154,7 @@ void dw_hdmi_unbind(struct dw_hdmi *hdmi);
>>>  struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
>>>  			     struct drm_encoder *encoder,
>>>  			     const struct dw_hdmi_plat_data *plat_data);
>>> +struct device *dw_hdmi_device(struct dw_hdmi *hdmi);
>>>  
>>>  void dw_hdmi_resume(struct dw_hdmi *hdmi);
>>>  
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
