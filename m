Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E684A5B6192
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 21:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0630010E181;
	Mon, 12 Sep 2022 19:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F324D10E181
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 19:21:07 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id y136so9585733pfb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 12:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=SZHaj8okATHVu/Q6unhlirD3gdvtLQE0uzOf/LJ8iDA=;
 b=3jCsf+VpeWOvXcTHOtj3qCcqITNJAWUXdFB4Af2SSbboVCNSqGCXIa/g1mo8eeB/Rv
 ECJ0bR2AromSL8szpZbzsbrJN6NbS1XzRyVMqUSxL2lgIPvQ+sA10mrSI9rTizSW7OLZ
 N1OBXiISmx3TJbLxQ/lArGmmNwgltBOKtdrooRGQtAqlSLxW+f48DNTm/fKpYAyBpYMY
 G478oyvo6RYUmGTZc7MX1fsccejQa5O+kgUBaYtyIV86wmVbX2Uyc2qIuqv/Fv/vOgoc
 l7Y5QZQcqHzsN9ZvxxU3TD+A/9cfviUM1UCPjixA3oL1y5AdM7TY7wTVChO6OOk5f06I
 YJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=SZHaj8okATHVu/Q6unhlirD3gdvtLQE0uzOf/LJ8iDA=;
 b=S5ll58ayvbzYuRcTLbbo+NRvv/u7qSP0Mr5vegonCQfKHNlDbsA/WDSmwK4oReg3+z
 n2doyJryXkn+jJpUbdT7DjNOvNxdjDqYCVgeJg0GxZPaCsBU5cbYibRYySvZ0UNoPMvr
 KDDxyIYBCWgw4n7bSkRd7tQPzDPIbMx7Re2B4Ot5jCUvg+uFzcQ5bMsd2Zpg7P+QU8Ps
 ZWYjG/yH4MmASGIzm42j/jh8lzmcVQ1K3hgui+QP44tNYWQPNkTdgms+LgOv9wtuPOpf
 PYxcbTst68YEBvkK4bcsEG+JgLzRXw5F0p5i2hpvi2ueTZQHwiDjF5oSE++wN3ya94B6
 obBQ==
X-Gm-Message-State: ACgBeo3+mBzb2yHZDmZwMyNEDPAdV5Rt+BZNulytLlK9ZsFhHfgYWxSa
 GciJEWPxS9v7z12GgfPC99bRy87Mye53SQCb9+W03Q==
X-Google-Smtp-Source: AA6agR4QSkhDFUb4mywD3J9h/2Xq5LTVyTodEmqOY/s8+f884DXkrrz5OQO3/bz3sSdo7c6fEuYfhoHcnGlD4O+2qrc=
X-Received: by 2002:a65:6a4a:0:b0:434:a2b8:1a83 with SMTP id
 o10-20020a656a4a000000b00434a2b81a83mr24179676pgu.125.1663010467524; Mon, 12
 Sep 2022 12:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220908135940.299324-1-jagan@edgeble.ai>
 <20220908135940.299324-4-jagan@edgeble.ai>
 <CAPY8ntARtgRT_kYbS-zw9kAuc16Qy49UF+y2H1143s_2=cnmYg@mail.gmail.com>
In-Reply-To: <CAPY8ntARtgRT_kYbS-zw9kAuc16Qy49UF+y2H1143s_2=cnmYg@mail.gmail.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Tue, 13 Sep 2022 00:50:56 +0530
Message-ID: <CA+VMnFwTFbisCJOB_9XcwT_xxnyxNjeqNX5cyMHmviWtpZ6T3g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm: panel: Add Jadard JD9365DA-H3 DSI panel
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On Thu, 8 Sept 2022 at 20:33, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Jagan
>
> On Thu, 8 Sept 2022 at 15:00, Jagan Teki <jagan@edgeble.ai> wrote:
> >
> > Jadard JD9365DA-H3 is WUXGA MIPI DSI panel and it support TFT
> > dot matrix LCD with 800RGBx1280 dots at maximum.

Look like I wrapped the wrong text, maybe this copy came from vendor
code. Yes, the datasheet mentioned this as WXGA resolution.

Thanks for this. I will correct it.

>
> Sorry, I'm confused by this commit text.
>
> WUXGA is normally defined as 1920x1200.
> So the panel is 1920x1200, but it supports a max of 800x1280 pixels?
> What do the other pixels do then?
>
> Google implies that Jadard JD9365DA-H3 is a driver IC, not a panel. So
> is this driver for all JD9365DA-H3 based panels, not just one panel?
> Having a compatible of "chongzhou,cz101b4001" implies it.
> (Thinking about it, I have a JD9365Z based DSI panel on my desk, but
> the JD9365Z is made by Fitipower and it supports a max resolution of
> 720x1280. Those trailing letters are obviously very significant on
> this range)

Yes, chongzhou,cz101b4001 panel which used JD9365DA-H3 controller IC.
Though JD9365DA-H3 itself is not a direct panel, we usually denote
controller IC as panel driver as these are part of Linux DRM panel and
as its own compatible "jadard,jd9365da-h3"

Thanks,
Jagan.
