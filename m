Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB434426884
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 13:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED65D6F4FB;
	Fri,  8 Oct 2021 11:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EC46F496
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 11:15:08 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id p13so35520674edw.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 04:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=YJWlvEEwmFKhr4akTgoU7wVfe4IWf4RFOCaAdeVFYrs=;
 b=Cbx8xAJucnaOowcS6TWk2wLoeACUJWwX88GLFBIF/kcA9u1n4K98PONICzKwqqTd/+
 +rnmN7MuIYSGr4EZAk1UYMUSSh99wiIsx0Jk9QTYKP4emzNdcCeExNtX1Ma5WooBgstb
 Z0hv8kqy4Wf9r3DjXe91rr/xem5/p27uV4gwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=YJWlvEEwmFKhr4akTgoU7wVfe4IWf4RFOCaAdeVFYrs=;
 b=IzsF72huRhUq5AH6sRzbzHL0tYYp5o2WfQs0SrahW6YSl3v5YIvZ867chPEf8F2aaF
 jG2wKklkA1+Hb8a/kpjNoWJajaMq8dbA1EiCePEAp5vEzs0YAXUkQJVyhv/CEtT0wUc0
 qQdvqWz7vMfqarfKsE9slv32HkY86boWrSvncam+rLpg6nTocaTj8zEMZQUNmMMGcU4W
 AvvUlz60Kp9y04O4RKJDSO0SNCcxRdnDHf1hZ2MClW6kWUnhcCMTyk3Uuh3V+cg6Xdue
 YDEOmvpEf1NsyfQRMmGTb6NkUN5u1JDCmrbb9wFhyzGrj9yxJDOC362yfwH7vhPQd3JE
 1v7g==
X-Gm-Message-State: AOAM530mh59jyRtic9wMU8TNbd7IGKzkAbBqMr2jLWfOK1GboC0TBZY1
 PR7pG9cspyNz5NmUryCNr5yzQZBp7uQM13yfD9Ii5Apfp3I=
X-Google-Smtp-Source: ABdhPJySJA6ZrfFwcrMc7p3DQoY28fPZM2dZPduU34dcq3eU6nOvGNCNqu1jmAT/vBxGIBBacvNBh4uZ1CxNrrhIfWc=
X-Received: by 2002:a17:906:32c9:: with SMTP id
 k9mr3602515ejk.218.1633691706613; 
 Fri, 08 Oct 2021 04:15:06 -0700 (PDT)
MIME-Version: 1.0
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 8 Oct 2021 16:44:55 +0530
Message-ID: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
Subject: DSI Bridge switching
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
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

Hi,

I think this seems to be a known use case for industrial these days with i.mx8m.

The host DSI would configure with two bridges one for DSI to LVDS
(SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technically we
can use only one bridge at a time as host DSI support single out port.
So we can have two separate device tree files for LVDS and HDMI and
load them static.

But, one of the use cases is to support both of them in single dts, and
- Turn On LVDS (default)
- Turn Off LVDS then Turn On HDMI when cable plug-in.

The HDMI event can be detected via some HDMI-INT GPIO on-board design.

The possible solution, I'm thinking of adding LVDS on port 1, HDMI on
port 2 in the DSI host node, and trying to attach the respective
bridge based on HDMI-INT like repeating the bridge attachment cycle
based on the HDMI-INT.

Can it be possible to do bridge attachment at runtime? something like
a bridge hotplug event? or any other possible solutions?

Any suggestions?

Thanks,
Jagan.
