Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F304A8BDC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 19:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C3910E125;
	Thu,  3 Feb 2022 18:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D458B10E125
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 18:49:01 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w20so4019014edc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 10:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stapelberg.ch; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZbS98gcFWF571VZjAn4ntA9b47CYXcG55OUrka6rOCA=;
 b=SG9VDUloeuLH9xJxztGBh1/kAE3x0pEUrn3iySODfQN3O6ktXEWSVJPomLO1+Jg6eQ
 5K2xMlWmMda0AMYljaFwletHpeZ4tETTj6f83Ly0JMbozHgCuUHc6V/ZEu+pwj9VrQVD
 VFBDykLL19j5NxePuZbt8iA/QoCUgKQOyhkYehjFxnEJrhnsgdM8HdUSISxZDfQ7FtMo
 I9OCqHaNALZQ2IjCOWi5cAEdWiyTpwJxGjIBbqasPnh/STw3ZaiZ+X64/UzH17C3AqDh
 FBaNhhvgZB4GzpMNzHeHjksbqpDBfwnYqqsq2ay+Vi7inTKIVND9qAPMOT0bvCiaOz4h
 fpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ZbS98gcFWF571VZjAn4ntA9b47CYXcG55OUrka6rOCA=;
 b=DPldamZ6NgQ24K4duPxQcTf9FuHg0TwIVSDiJYpnmOXt86lBjhhJ8m+wSeKU1Ts+rY
 LowF85xPzgAKrV35z+W3J02k8IhgwUTK2yUYpvs+4Pw0a2+SMadGi/ruV0I02CA1i2sI
 6soB4cLuzcBvVX368j+Xr5oLumfkfUe3q19/4J366/oa0recDasvwBo/ekBrfvwoSe76
 P7i7fNbRWIyHzjpHDa79DaltzVwvLicAgOMiHR0+CtY+vr0rIP7MPloH4wSXLBueRCV0
 U5u70IZ6O6GohgzuSpVKYxnHltc9h1WWyhjfPCL+o4Lkg3E5zaxIAQcGKnxkRYKXEoV+
 XmCA==
X-Gm-Message-State: AOAM530795DzzFqHbxwNNljcJyXDgh4fHr88ie4aw3UeY7NGjycauzlh
 flEkppxY+yaHDRiAffL35V/8tGuSI7Rv7g==
X-Google-Smtp-Source: ABdhPJxOz6i2esqkfLN4bQTiVqghG25kWt3CunI8Q5rhNbmzQztZ2+tjh2cLnl2Qwz8mQEzR0VPyIA==
X-Received: by 2002:a05:6402:42c6:: with SMTP id
 i6mr37002448edc.220.1643914140322; 
 Thu, 03 Feb 2022 10:49:00 -0800 (PST)
Received: from localhost ([2a02:168:4a00:0:e61d:2dff:fe09:a3e0])
 by smtp.gmail.com with ESMTPSA id w24sm15132081edu.97.2022.02.03.10.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 10:48:59 -0800 (PST)
From: Michael Stapelberg <michael+drm@stapelberg.ch>
To: maxime@cerno.tech
Subject: Re: Linux 5.16.3 breaks headless Raspberry Pi 3 boot, again
In-Reply-To: <20220131104833.n7lr6u2idk66dcko@houat>
References: <CANnVG6=ERdWhbEsNKY4r=QNmaUWPeqcQ9fwWa05SyuT8ETeFHw@mail.gmail.com>
 <20220131104833.n7lr6u2idk66dcko@houat>
Date: Thu, 03 Feb 2022 19:48:59 +0100
Message-ID: <877dab6b1g.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

maxime at cerno.tech (Maxime Ripard) writes:
> I'm not entirely sure what you expect by insisting on things getting
> broken *again*, but we got it, thanks.

I wanted to remind of the previous issue, which had the same symptoms,
and hence might be related and helpful in debugging.

Upon further reading, I realize it came across as annoyed and
accusatory, and for that I apologize. Sorry. It was not my intention.

While we=E2=80=99re on the subject, though, I do wonder whether anything co=
uld
be improved to catch issues like this one before the kernel is released
in the future?

Are you not testing this driver on the Raspberry Pi 3?

I don=E2=80=99t know what the testing process for this driver, or Linux more
broadly, looks like in detail, so I=E2=80=99m curious to learn more.

> For some reason, in the stable commit, pm_runtime_put ended up in
> vc4_hdmi_cec_init while it should have been at the end of
> vc4_hdmi_cec_adap_enable.
>
> I'll send a patch to fix it.

Thanks for identifying and getting this addressed so quickly!

--=20
Best regards,
Michael
