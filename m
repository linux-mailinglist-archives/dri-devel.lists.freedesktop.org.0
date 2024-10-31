Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB339B8285
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 19:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EE910E903;
	Thu, 31 Oct 2024 18:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zYGDUFaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CE410E90C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 18:23:12 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6ea0b25695dso9933287b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730398991; x=1731003791; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oyFaR/Nqjo7VFSddLUYVyYGruB0Du5lv6wuap1vCS68=;
 b=zYGDUFaEQ7/ec/8jTyKQZXpc3DRNFR5GpFQfjKN4sWfYW1T9hmW0H/XuxgGSEhxhac
 0umYKKjlX/NbO4kqqcz4avVYwYFH54WkESh75fL1Cf/88jp6azzbUWqBaHSSRD3+0MEK
 9T5+8Y2KFBgChkq2Gfv3hxKHMrmWXpFPtp1fsJjiJleHOLdFO2s1Ro28fF32aQzKBe07
 Xl05gzFP5M6D/6nkmVp9ORaG6LTRQi9iDS7AXG8N+bim1JLVYQx7NM0Bx0TgPOpdkvbJ
 K1iyg2ejtcjzSaWtY31ywdY8yHrrrEzVL3KSGj15bB/OFAq4FmBcUFXrb4u4ctpuRBu1
 uzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730398991; x=1731003791;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oyFaR/Nqjo7VFSddLUYVyYGruB0Du5lv6wuap1vCS68=;
 b=Rk1huX2aI30zSXaw0rKVPCa6T3N7awPAB1Y2f74R75qNjUoTzVYVyLZ0ueOcepp2Sj
 OZFCv1fG9h246zIRh3aN9JNNKYPO8A4plKhkPHpL4qjMC4SluWjnmXy8Xrjtes9Ibih3
 DJTvSebFudAoXQGkzIX8H7/lMlSFv8bSQ4KUb8oPT/iKFWXFc6dzDywUNtAlRXX3dQ10
 eNuaBK5a4zuR4LZFMg85E4n1Bl1C7eCmQaS363lrpedG0fWjaTAnfJHBqAezJWe4e20y
 qi0X/H6gzXrtNiDpFKxWSyoMJIN5aMZbMeOmuSwviAY9O8gx9pNo7qbW1LBzBZTNiK6r
 rcxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOTUmFpn2e0bcxeO0PWouRYiSbQZuIkM2mugQR0FleurI4Lm5BmxkUWD+qBA1jTT89hWF0zOVxidE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza2IGc71N1GPRFaqSBWS4OY0SJ6b4vEAgjJFhFaIfAhSUNztCa
 AdQBFzJSwTrIddQxktHT2c0ReLD/9Xj4h1eqarXaFhnwIJS3JawYv7okOfs2GYSiO0N9qRkn4J5
 z+AqsfI+4jcDmHUCz4sVT3eyXEMp/Y5DxDXVz1g==
X-Google-Smtp-Source: AGHT+IFq8R0CLiSKN/KyW3w8yrGdFcwHeCP7az6vUpHoYzraiFHMKDOSyj3hQcHE8V/hDNjDyyFp/YsnTwuwz+WSQKo=
X-Received: by 2002:a05:690c:fc2:b0:6e2:a962:d7ec with SMTP id
 00721157ae682-6e9d88e8babmr217442787b3.6.1730398991054; Thu, 31 Oct 2024
 11:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241030010723.3520941-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20241030010723.3520941-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 20:23:00 +0200
Message-ID: <CAA8EJppKou84MZm0JS_4bPveMO2UxpMs5ejCoL7OMWd-umtDmQ@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: skip of_i2c_register_device() for invalid child
 nodes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, swboyd@chromium.org, 
 airlied@gmail.com, quic_jesszhan@quicinc.com, lyude@redhat.com, 
 simona@ffwll.ch, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Oct 2024 at 03:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> of_i2c_register_devices() adds all child nodes of a given i2c bus
> however in certain device trees of_alias_from_compatible() and
> of_property_read_u32() can fail as the child nodes of the device
> might not be valid i2c client devices. One such example is the
> i2c aux device for the DRM MST toplogy manager which uses the
> display controller device node to add the i2c adaptor [1] leading
> to an error spam like below
>
> i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> i2c i2c-20: of_i2c: modalias failure on /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
> i2c i2c-20: of_i2c: invalid reg on /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
> i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
>
> Add protection against invalid child nodes before trying to register
> i2c devices for all child nodes.
>
> [1] : https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/display/drm_dp_mst_topology.c#L5985
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/i2c/i2c-core-of.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index a6c407d36800..62a2603c3092 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -86,6 +86,8 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>  {
>         struct device_node *bus, *node;
>         struct i2c_client *client;
> +       u32 addr;
> +       char temp[16];
>
>         /* Only register child devices if the adapter has a node pointer set */
>         if (!adap->dev.of_node)
> @@ -101,6 +103,10 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>                 if (of_node_test_and_set_flag(node, OF_POPULATED))
>                         continue;
>
> +               if (of_property_read_u32(node, "reg", &addr) ||
> +                   of_alias_from_compatible(node, temp, sizeof(temp)))
> +                       continue;

I think just of_property_read_u32() should be enough to skip
non-I2C-device children. If of_alias_from_compatible() fails, it is a
legit error.

> +
>                 client = of_i2c_register_device(adap, node);
>                 if (IS_ERR(client)) {
>                         dev_err(&adap->dev,
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
