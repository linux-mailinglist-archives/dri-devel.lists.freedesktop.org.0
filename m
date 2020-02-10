Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7A6157214
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 10:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FCD6EBBA;
	Mon, 10 Feb 2020 09:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE856EBBA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 09:50:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so6754310wrt.6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 01:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VERQvzakQm+SUc0TjMstgU+qiR8Y1gY4yphY2OZ9EGM=;
 b=EfSsAX3QV1DNfZCmCuqDBNPOS10zQZnQRdZeOVdGqwFG0IfVuILbzKpmcW1NmwPwpT
 3s7TleYQXKZEmanVquu1Z1+A4R35EFRsV1OneENQOdCQFPz8xRItmcpokgCPLMLOCoMa
 1hY6Ze5pTZwhBZxodlutd4H6briHJrO3whMgTK4oqFsHulCU3TCxUvhU19fs7JxI3HBe
 gEcTr5igkuDOwscxkox7GuITeTFTYO+RubTKCtQSpJzbOkiVsShfO8okPzwx2NZz2HJv
 LbjOSv+ljuRTatKOn4IhFarMHOwcyTreh6VUAXfYqE+UmAaZfzSmr1UY1T6/HJ8M3cGb
 l7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VERQvzakQm+SUc0TjMstgU+qiR8Y1gY4yphY2OZ9EGM=;
 b=e2STfa8125Ta3DyBAZb+knr2r1qG/eqJ99j7s1WBQcH4veiSwtaO5BUgaP2KgeyDFJ
 7fnTlh2GfWi8+bMNXlDFnUsYCEtx8pWTh+nItqXe8ZpTZOnRj6TFiolIgzNOUOkIaKAt
 M4LqFg+b1Hl8FPj6ikA2xzDASp7VU2L9uVH63Y3+SoY6xuyHTlK2is95c7uuKP9odOmE
 BurqULpTeG8rN0iwJNzWFIYdkSHqECNmKXOCjKh3CYMhYrBpiSgxHlBornu0XwO4gOlF
 Ga2x1BozNbf7XW94DzPfjenK7kqO4fftcyuT5960XF+bt2Vb6qETY+rOyUuQRHmwiMWW
 ZCqg==
X-Gm-Message-State: APjAAAUf16PVnxwvSTKocSoZgfmbnGMxVm3/Nbo9OueCfkpfo5VEiSgx
 EYpjbq/BBtdNzxaPzonCJbb1Og==
X-Google-Smtp-Source: APXvYqyfFIxizan/1PZVO/45DabLhFxmuPsd7wcpoGFK20hwep1pl3070xeAT7c9kVGZpJ7tUsHJYA==
X-Received: by 2002:a5d:494f:: with SMTP id r15mr1013142wrs.143.1581328231991; 
 Mon, 10 Feb 2020 01:50:31 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b17sm15983521wrp.49.2020.02.10.01.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 01:50:31 -0800 (PST)
Subject: Re: [PATCH v4 0/2] drm/bridge: Support for Toshiba tc358768 RGB to
 DSI bridge
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com,
 a.hajda@samsung.com
References: <20200131111553.472-1-peter.ujfalusi@ti.com>
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
Message-ID: <ac8f985b-af2c-f314-1b8b-fcfd7abd2dba@baylibre.com>
Date: Mon, 10 Feb 2020 10:50:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131111553.472-1-peter.ujfalusi@ti.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/01/2020 12:15, Peter Ujfalusi wrote:
> Hi,
> 
> Changes since v3:
> - bindings/example: Fixed the node name
> - bindings/example: Added include for GPIO_ACTIVE_LOW and fixed up the gpio
> 		    binding
> - driver: Moved the label for goto in tc358768_calc_pll()
> - driver: Replaced the refcounting of enabled with a simple bool as hw_enable()
>   is only called from one place (tc358768_bridge_pre_enable)
> - driver: Added Reviewed-by from Andrzej
> 
> Changes since v2:
> - Implement pre_enable and post_disbale callbacks and move code from enable and
>   disable callbacks.
> - hw_enable/disable is removed from tc358768_dsi_host_transfer()
> - Defines for DSI_CONFW accesses
> - breakout from the loops  (the check for it) is moved one level up in
>   tc358768_calc_pll()
> 
> Changes since v1:
> DT bindings document:
> - Removed MaxItems for the regulators
> - additionalProperties: false added to port@1
> 
> Driver:
> - Year is now 2020
> - Includes shorted
> - The three letter members of the private struct documented 0 they are named as
>   in the datasheet
> - Error handling for the IO functions is following what sil-sii8620.c does
> - regmap regcache is disabled along with refcache_sync() and volatile callback
>   for regmap
> - The hw enable and disable functions got separated
> - Taken the suggested simplifactions from Andrzej for tc358768_calc_pll() and
>   tc358768_dsi_host_transfer()
> - The driver no longer stores the drm_display_mode, it relies on
>   priv->bridge.encoder->crtc->state->adjusted_mode where it needs it
> - tc358768_calc_pll() can be used for verification only to not modify the state
> - refcounting added for hw enable state as a dsi transfer was shutting down the
>   bridge when it was already enabled.
> 
> Tested on top of drm-next + LED backlight patches + DT patches on dra7-evm with
> osd101t2045 (panel-simple) and osd101t2587 panel drivers.
> 
> Cover letter from v1:
> TC358768 is a parallel RGB to MIPI DSI bridge.
> 
> The initial driver supports MIPI_DSI_MODE_VIDEO, MIPI_DSI_FMT_RGB888 and
> only write is implemented for mipi_dsi_host_ops.transfer due to lack of hardware
> where other modes can be tested.
> 
> Regards,
> Peter
> ---
> Peter Ujfalusi (2):
>   dt-bindings: display: bridge: Add documentation for Toshiba tc358768
>   drm/bridge: Add tc358768 driver
> 
>  .../display/bridge/toshiba,tc358768.yaml      |  159 +++
>  drivers/gpu/drm/bridge/Kconfig                |   10 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/tc358768.c             | 1044 +++++++++++++++++
>  4 files changed, 1214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
>  create mode 100644 drivers/gpu/drm/bridge/tc358768.c
> 


Applying to drm-misc-next

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
