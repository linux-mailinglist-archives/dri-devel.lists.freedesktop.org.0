Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24824345A72
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5412B6E86D;
	Tue, 23 Mar 2021 09:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4C56E86D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 09:10:55 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id v3so11041623pgq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 02:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WbW5E3Qe4WZYEnKi/sCmjQ1D+Tk7jZ1l2FTPgjhfZMQ=;
 b=yo8DL/aCSBDBcC0tqsQubEuqRWy6eLT5ir9zRrGsKjmyULNbNnccMqMnD7jmadxDw3
 BGBok2NgqzzaR3uNkDmIajtKjfw1xjOqIJ/YLBW7GZNZbbv5CvEI9cgeue+5MtK4BpKN
 S1arzGTW1r4QJhbOQlc9o3b2oa2Lw+Ahw1ZqH5D2F0AMxncx0PgX2TScKhHBj8o47wKQ
 dADPkn6khGV+qRPCxXNv3qWXWtC0UTJPjxleX2xzunTLpcwnYPyR7WxEqEmzwO/kCH97
 BvOa35YvQG7GVC9RhR+xBt2MsYZYMEWcBUIATnocN31bsvzJxFJWzKx+r42IA62GTkkc
 BzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WbW5E3Qe4WZYEnKi/sCmjQ1D+Tk7jZ1l2FTPgjhfZMQ=;
 b=B7mEIcug3FTQbLGQI6WjtpyxaZlei7dr/IVuVM8YgjVOUCL3eGlQDOw//vwAHoKkiH
 n8lRDRTAeOlPHK796mVKjVjJkB8B6ogj+IV3DcrMfuldlpmJDtMD2XmC8SNCMm5HqUD7
 N2Vj5I+96fx6maNM99WaHV+/H3Nf7TR+2fV/yMZS7Y9gRp8KOrgJoELoj0k5hlhnC85Q
 CkJMMe3bcyxZp4ieYZIa+9/LyqB4P2sGn4UReYDJvE6dzoqWugbK5g+aoCRKV9WCpClU
 4YnWNoYbjR/V7wWmI2cvy4VzxrAVOie84EaZxb32LFeBjqxQpbJNHGEYu1175uE2vT2R
 fq2g==
X-Gm-Message-State: AOAM530pIvRn7Ihf7RFKFZCn36aqlPpLjZ1jbvybNpoxDQYK/cGP4N0+
 e9JtMlAYa8Vl+OFrSUBDHmM+G/VodQlsRv9YP5/Fjw==
X-Google-Smtp-Source: ABdhPJxIS20E4tfWyNlD9+niQr2Ru+nuZgsxwL8HvALaLQyatNmIeXyoZrtnqaDhRUCxdvIm1IRm+HpRgaUET82BHa4=
X-Received: by 2002:a63:ee4b:: with SMTP id n11mr3235216pgk.265.1616490654726; 
 Tue, 23 Mar 2021 02:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210308120555.252524-1-adrien.grassein@gmail.com>
 <20210308120555.252524-3-adrien.grassein@gmail.com>
In-Reply-To: <20210308120555.252524-3-adrien.grassein@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 23 Mar 2021 10:10:43 +0100
Message-ID: <CAG3jFytoE9hWvq2e2Caqn4qP_RuEOnm4r9VQ85ffbAcguSLf+w@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drm/bridge: Introduce LT8912B DSI to HDMI bridge
To: Adrien Grassein <adrien.grassein@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 kernel test robot <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Adrien,

Sorry about the slow reply, but I just received the documentation from
the vendor. So let's dig in to the HPD issue.

> +static enum drm_connector_status lt8912_check_cable_status(struct lt8912 *lt)
> +{
> +       int ret;
> +       unsigned int reg_val;
> +
> +       ret = regmap_read(lt->regmap[I2C_MAIN], 0xC1, &reg_val);
> +       if (ret)
> +               return connector_status_unknown;
> +
> +       if (reg_val & BIT(7))
> +               return connector_status_connected;

Register 0xc0 & BIT(7) - HPD signal after debounce
Register 0xc0 & BIT(6) - HPD signal for TX HPD pad

> +
> +static int lt8912_probe(struct i2c_client *client,
> +        const struct i2c_device_id *id)
> +{
> +       static struct lt8912 *lt;
> +       int ret = 0;
> +       struct device *dev = &client->dev;
> +
> +       lt = devm_kzalloc(dev, sizeof(struct lt8912), GFP_KERNEL);
> +       if (!lt)
> +               return -ENOMEM;
> +
> +       lt->dev = dev;
> +       lt->i2c_client[0] = client;
> +       lt->cable_status = connector_status_unknown;
> +       lt->workq = create_workqueue("lt8912_workq");

Looking at [1] and maybe even better [2], I think this polling
approach is the wrong way to go. And with access to documentation, I
think we should be able to sort this out.

Using the irq driver approach requires the interrupt pin to be
configured. Pin 63 of the lt8912b is the IRQ output pin.

In order to trigger interrupts based on it, the dt-binding would need
to be updated[3][4] as well as whichever DTS you're using.


[1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/analogix/anx7625.c#L1751

[2] https://github.com/torvalds/linux/blob/v5.11/drivers/gpu/drm/bridge/lontium-lt9611.c#L1160

[3] https://github.com/torvalds/linux/blob/v5.11/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml#L27

[4] https://github.com/torvalds/linux/blob/v5.11/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml#L144
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
