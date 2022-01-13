Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E9848DE8D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 21:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7E010E11E;
	Thu, 13 Jan 2022 20:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A653C10E11E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 20:01:47 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id t24so27141146edi.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 12:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CKKBvExIdXR4NmexUNKYFi4XGwRsnmajoIJ3WHiHemw=;
 b=P6MjH8VbEXKaa9Xe+OrKdRO/17t1xnavCQ1iFuARciPT4LOiqcts2TRquGSo5R4hUs
 1HKly7dXYmo1IcgU9eZ4RmPEjLSqFF5kdyQWJnjz5/QihSZl6AGE+jS9VQ77dkxe0Wlq
 0d5L0I0bVSUC+9dy1Z/pSnd9aqqpJeumK3DHxYZz4Bt7jIJWGJuAZdFZ01sJY8HxXVUo
 H6b/dbQhLkC+rjVhwONRlsm3b5c5Qqt0xdGix+lt5LFdDdhVyg85xvsD501bTueWz05l
 Lt99uTyImY/wlqSlKOJswzL3ZLzS0SJI7r6mjE5yB3GbQqi0HzmXON/MMPGHvLZ6JHTa
 WVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CKKBvExIdXR4NmexUNKYFi4XGwRsnmajoIJ3WHiHemw=;
 b=5GTTe9IfHGmOkUBdTTjbdlg1BzOIzHIHrP5uEtQ5RgGUC7/t0ekkqAe2l56wVwmXtn
 niMQGBAzGfbNDOnWdD9Cav4HYI8d4YwF2a/2FtVzFCqJ+9I+Yz0V5EfCAG/oNSu4eUMu
 Kx69hpYYTFLreJ1HKa2SDpUCXYscIPVEa3DgpgWbNTfLQyJzTLmIkWGYNXWGhySnquKP
 S6auSSPGF4LFQVpenTsrG/d2gy8k3ciOlWMcPGAPktXd7pJ+WXoJWON+vkubsancJqqw
 JJjRQPJIizHPaNrMomlHE8anF5meYBFmCmX2/TxswUpgCAkFZ4etpEzazb1+5cT9tu8V
 vq7Q==
X-Gm-Message-State: AOAM532NOJXkYwzoGZnN8Nvsj1WGQIVUgVKjiGzX3mW3v1ZLJqtMiLkC
 QyLOVqY4uXBI1mR/ohaCEx2ya1Dxk+aI4N9mdx4=
X-Google-Smtp-Source: ABdhPJwslh+6ha9GsyWg4OE9COVsBHcsGl2nt9B4vD1RxEyfjpYwfsR9lnhbTXuKZfXaIgsCtfoSmB0myB659ctydp4=
X-Received: by 2002:a05:6402:350f:: with SMTP id
 b15mr5636003edd.77.1642104106220; 
 Thu, 13 Jan 2022 12:01:46 -0800 (PST)
MIME-Version: 1.0
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 13 Jan 2022 17:01:34 -0300
Message-ID: <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge:
 display-connector: implement bus fmts callbacks")
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Thu, Jan 13, 2022 at 2:45 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi All,
>
> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour) till the commit
> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts callbacks").
>
> After this patch, the screen becomes greenish(may be it is setting it into YUV format??).
>
> By checking the code, previously it used to call get_input_fmt callback and set colour as RGB24.
>
> After this commit, it calls get_output_fmt_callbck and returns 3 outputformats(YUV16, YUV24 and RGB24)
> And get_input_fmt callback, I see the outputformat as YUV16 instead of RGB24.
>
> Not sure, I am the only one seeing this issue with dw_HDMI driver.

I have tested linux-next 20220112 on a imx6q-sabresd board, which shows:

dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with HDCP
(DWC HDMI 3D TX PHY)

The colors are shown correctly here.
