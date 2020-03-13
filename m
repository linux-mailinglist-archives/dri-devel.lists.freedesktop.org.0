Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3B3184ABE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 16:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F0B6EBF7;
	Fri, 13 Mar 2020 15:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69A06EBF7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 15:30:02 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 6so10435417wmi.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aOo6dLQRbGtNVZizUX8MQehDOjSxcCEmz/shUdkGfFQ=;
 b=vN6DUncRWVA+2RqDTHBwkgrspGJ+Z4aEKegksvD7vBizwLG6NK8c2VpIKVsrYyIyli
 RVDAjvPpXiXIvu5rOMh0q0IlRArnfvde6Wf0+5NDs6oMJjuM79QqkIB6wwa8AWSr5IUL
 JTW889zogP0mKlTqznnfjHmyT7djHuCOA8wERWA0wFUP9nyZ+w1kpTxTjTfPrdRupAVk
 yt7KBnaZoG7CQj4res9AeeVAEpygWPfi+DH8QLSmaCNSBP2NpUQ6iMfjp0Gfjl1m5FHY
 u/kNzUhzO3G7KQsqaq42Tm55lWln1Ojv16IDOMMfHdiq9i0HP2o/G9utyIN88TIDqqt5
 2HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aOo6dLQRbGtNVZizUX8MQehDOjSxcCEmz/shUdkGfFQ=;
 b=Pk8OHVAOSwHOjk0wWyPQxomEFg3fSh0f6Hlzv9HIB7P1pi/Pg4Yq8JFF8Ue3xu81KN
 fxKJs4ux4kX9qaij2v6Vd9NEq+KNg5nRbb6BugExiNuJ4CNCQLNsZKuQ9EbBpcxJF+TD
 swZ00mwgdEJs8xe4175kjug1A4qLWsjdpHudSTUkC7KrCNLaxKKlogba2E9z8c8RBzxy
 3eFBAAQTqJbxJzyCchZCwLoiN8nlyslE0ahgn0FBw+mgPONav7FXYRYp0MjYkgAVDzW2
 5yWdNMWOeUbS3n6mnKF/bvQhoq2EVeEnQEKNI7w3SSZrDhF//L/2zzT+RcHP4zmxB59H
 +nzA==
X-Gm-Message-State: ANhLgQ0mmrXbQ8ZphpSd8oU/tf2I0hODVzBcuKrkobSV3SoEIGYgw6CK
 HK/DJhow2qeR48gZq8stA9zp82YLZxZDEQ==
X-Google-Smtp-Source: ADFU+vsfyKK37HfPo8ugfQibWInzVKb+sZXPd6q7TB0cd23sRHPhLjNClmVA1kiqiMHODraULQbjnA==
X-Received: by 2002:a1c:b7d7:: with SMTP id h206mr6844189wmf.143.1584113401358; 
 Fri, 13 Mar 2020 08:30:01 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2?
 ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o26sm16385696wmc.33.2020.03.13.08.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 08:30:00 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] dt-bindings: display: bridge: add it66121 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200311125135.30832-1-ple@baylibre.com>
 <20200311125135.30832-3-ple@baylibre.com>
 <20200313134013.GC4751@pendragon.ideasonboard.com>
 <03d5bb7f-db1b-79df-bd46-3ac0f3b4feb1@baylibre.com>
 <20200313141713.GG4751@pendragon.ideasonboard.com>
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
Message-ID: <87a0d129-163b-18ae-eb09-cf7df4048dad@baylibre.com>
Date: Fri, 13 Mar 2020 16:29:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313141713.GG4751@pendragon.ideasonboard.com>
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
Cc: mark.rutland@arm.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, mchehab+samsung@kernel.org, sam@ravnborg.org,
 heiko.stuebner@theobroma-systems.com, icenowy@aosc.io,
 devicetree@vger.kernel.org, stephan@gerhold.net, jonas@kwiboo.se,
 robh+dt@kernel.org, Jonathan.Cameron@huawei.com,
 andriy.shevchenko@linux.intel.com, jernej.skrabec@siol.net,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Phong LE <ple@baylibre.com>, broonie@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/03/2020 15:17, Laurent Pinchart wrote:
> Hi Neil,
> 
> On Fri, Mar 13, 2020 at 03:12:13PM +0100, Neil Armstrong wrote:
>> On 13/03/2020 14:40, Laurent Pinchart wrote:
>>> On Wed, Mar 11, 2020 at 01:51:33PM +0100, Phong LE wrote:
>>>> Add the ITE bridge HDMI it66121 bindings.
>>>>
>>>> Signed-off-by: Phong LE <ple@baylibre.com>
>>>> ---
>>>>  .../bindings/display/bridge/ite,it66121.yaml  | 98 +++++++++++++++++++
>>>>  1 file changed, 98 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
>>>>

[...]

>>>> +
>>>> +  pclk-dual-edge:
>>>> +    maxItems: 1
>>>> +    description: enable pclk dual edge mode.
>>>
>>> I'm having a bit of trouble understanding how this operates. Looking at
>>> the driver code the property is only taken into account to calculate the
>>> maximum allowed frequency. How is the IT66121 configured for single vs.
>>> dual pixel clock edge mode ?
>>
>> Dual edge mode is Dual-Data-Rate mode, the normal mode is MEDIA_BUS_FMT_RGB888_1X24 and dual edge is
>> MEDIA_BUS_FMT_RGB888_2X12_LE (or MEDIA_BUS_FMT_RGB888_2X12_BE, not sure) on a single clock period.
>>
>> This should be negociated at runtime, but the bus width should be specified somewhere to select
>> one of the modes.
> 
> How about replacing this property by bus-width to report the connected
> bus width ? It should then become an endpoint property.

It was my thought.

The mediatek dpi also uses this property, which is also very wrong in the same way.

Neil

[...]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
