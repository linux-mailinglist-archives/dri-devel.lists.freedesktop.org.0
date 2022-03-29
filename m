Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4B84EB31F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C533C10F0F5;
	Tue, 29 Mar 2022 18:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305C510F0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 18:08:45 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y10so21604784edv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=t+UE1KO46QdiRto85BlA8DZfqaRFjxjYaaWy5o877os=;
 b=lAM111G2+cOU42Dt1751lg4AAN+QAVF/wLyk/+OA9Sm+abTX27s42YlbZ2EIMcmNOI
 kqy1bxUDeiLR5/QFtPp+79xvHWXQyliKfA2WG4mcEoauhweQyi4dQ/Iy5h6+RsD0t822
 q4QMoG6SA/SGMTzpLYgccirSpcxlTAspHfWaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=t+UE1KO46QdiRto85BlA8DZfqaRFjxjYaaWy5o877os=;
 b=ErS4T2+Jo82VIdEMNHGaPHpiIN6Nu2Eo9HxtO/BnjmqCmRn/leWGtfeZRA4qEgh4D8
 +WWjQhv0Tewbd/ZfwRsvYfo0VnOe2ZR6u6hzi73B4DVwiHG56QDw/yZUNbWi/UDuS75V
 7tWivTao5EdSDxev5CXSPPT4CNJluC8RDFn6myoaTklO5fRreKi6p030aCH9ql93luov
 BA/bJQJGK8yb6if3pYBRUQY5+4Ezm15/d1WfuodYtXNW3K0CvdrT+XPAYl8ujiY72bWK
 t1tZvAOdT/Dgv7oBz72e00PGLWfUtfYPA/MDAgtDUuOHQ3N/2KUMo2OxLcQm9RudObjF
 Tnvg==
X-Gm-Message-State: AOAM532dZ7eA7qQHl8vvXww3sx549Eex2ILUfAUX8cSSHRxgcW7sVQJa
 ofRkWKub5s0kaVOIYPT+zCOEhEA+eZrUReu14ze2nw==
X-Google-Smtp-Source: ABdhPJwHESM1akHYhSVlGyzf3qR1J2Bc92sUcsTEfHmRwp607wKdRaYTO6wwLPgvxmqbDa65A5LOwjxz6KuLkxDZ180=
X-Received: by 2002:a05:6402:8d7:b0:419:1162:a507 with SMTP id
 d23-20020a05640208d700b004191162a507mr6118288edz.157.1648577323473; Tue, 29
 Mar 2022 11:08:43 -0700 (PDT)
MIME-Version: 1.0
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 29 Mar 2022 23:38:32 +0530
Message-ID: <CAMty3ZBT9WEPbkaoS_8t1O153tckBk0pxiP2cF75ASZb54SPUQ@mail.gmail.com>
Subject: DRM Master ignoring hotplug event during display switching (QT)
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
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
Cc: linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I have implemented runtime display switching in the MIPI switch design
where LVDS and HDMI bridges are selected with the help of runtime
GPIO.

Initial discussion on the same can be found here,
https://www.spinics.net/lists/dri-devel/msg318524.html

The implementation has been done by creating each connector at
runtime. The default boot will create the LVDS connector and based on
the HDMI plug-in the ISR.

1. forcing the LVDS to disconnect
2. call drm_kms_helper_hotplug_event
3. detach the bridge chain
4. attach the new bridge chain (HDMI)
5. call drm_kms_helper_hotplug_event

do the reverse when we unplug the HDMI cable.

So, the bridge chains are attached and detached based on GPIO
Interrupt which is indeed identified based on the physical HDMIA
connector.

Pipeline for LVDS,
mxfsb => nwl-dsi => display-switch => sn65dsi83=> panel-bridge

Pipeline for HDMI,
mxfsb => nwl-dsi => display-switch => adv7511 => display-connector

With this, implementation and I can able switch the displays with
default DRM (without specific DRM applications) where the LVDS is ON
by default and when HDMI plug-in the LVDS OFF/HDMI ON, and when HDMI
unplug the HDMI OFF/LVDS ON.

However, with QT5 I can see the DRM Master ignoring hotplug event by
returning 0 on drm_master_internal_acquire in
drm_fb_helper_hotplug_event. With this the hotplug returned early so
it cannot able to disconnect and connect the new switching connector.

Any help?

Thanks,
Jagan.
