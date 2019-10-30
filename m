Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F32EAC1C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB9A6EDC3;
	Thu, 31 Oct 2019 09:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993A26E8D9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 09:09:59 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n17so1687835ioa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 02:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3BXeivFO4X0coYk6B/avMJFt+nMNImCe8Y2eVzRxJFc=;
 b=aVhSjA//r7vZzw5kqgp1gRqgg3rTv0EHTUfcLHUrogwJJgZVcr1cG4oHL5vadSjK/1
 wOMQTz3PidnBZOouRkgCOwX19hkOCS39PqgrQoD5ooUe75y0ckO0USZ3UsUARdZUCaIm
 1RwKQcHu0Fhs2BFc7zS7sQGtMSEUKabwsLYdoXhRZCsFn+Wb3xg9/UvLdeAY2J0FVK5u
 4l/45dAeWe5nkQBKLap9sdWKfIpWLk5vfEbOP2P6Qaa880mhXUo6taevFSLKEyB+jhQZ
 VvRf/mKMud5lX7gDZ4nKgGffDwh705nWZXOMJVoYUXyRMn8PkPTnCLgPRAO3uvMhVOcR
 sZtg==
X-Gm-Message-State: APjAAAUwEoZJaDxK6tjbJIcJi0Rxy1WCfwGsuT3BA5x4luLixICMyAJP
 SieBMhiTHkxtq7C+XLrIWKPqp5/o3z2eo+UjmsI6tg==
X-Google-Smtp-Source: APXvYqwsMJgbtEnWJYSgXn3eGjvbOusJ0jj+WPFGATdoFjsdJMwxpkNReWQUMncR1sWsj4rp80BoxS+tjeE5DjoKEvw=
X-Received: by 2002:a02:900a:: with SMTP id w10mr16212181jaf.29.1572426598410; 
 Wed, 30 Oct 2019 02:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191028071930.145899-1-cychiang@chromium.org>
 <20191028071930.145899-6-cychiang@chromium.org>
In-Reply-To: <20191028071930.145899-6-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 30 Oct 2019 17:09:46 +0800
Message-ID: <CA+Px+wXAo5EPjudneS+aFEAfBRAQR1Xp6goutdMdYTPeKcfTTA@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] ARM: dts: rockchip: Add HDMI support to
 rk3288-veyron-analog-audio
To: Cheng-Yi Chiang <cychiang@chromium.org>
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3BXeivFO4X0coYk6B/avMJFt+nMNImCe8Y2eVzRxJFc=;
 b=rgD3YR7uT2D0dkZuQMZgyLiH4b7hPEZWk818ADfeJHzIIEODqIjPi2Vwf4LkxgAJmn
 GugrOnHZ98V0Z5fmecKHMcS4hhuDDgAuQ45STgVaPP8PMGfNK8RQBIkyqnJcuPIbjHpl
 7yMmKCa2oWZjT98EoCyr6Qd1oE0fmu+QDael6BlSgXecboYQs5C6kbhzYZOH1MoZf652
 CMiu/cM0XoYvWCxUEw/QTl/q0/a/x3fI2q5xfQL6mBfYtpOxKH9AXmxUYDTxVIH74NwP
 P7u0BMgZXlVHQDYXTqHqKWo2W12R4VEUMqhCBlZcEmk7Wlxy94ZwfULaTy0x03tOe9Qr
 KxZw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFyaywKClRoaXMgc2VyaWVzIGhhcyA2IHBhdGNoZXMuICBXZSBub3RpY2VkIHlvdSBoYXZlIG1l
cmdlZCB0aGUgZmlyc3QgNApwYXRjaGVzIChpbmNsdWRlcyB0aGUgRFQgYmluZGluZyBvbmU6Cmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL3BpcGVybWFpbC9hbHNhLWRldmVsLzIwMTkt
T2N0b2Jlci8xNTc2NjguaHRtbCkuCgpUaGVyZSBhcmUgMiBEVFMgcGF0Y2hlcyBhcmUgc3RpbGwg
b24gdGhlIGxpc3Q6Ci0gW1BBVENIIHY5IDUvNl0gQVJNOiBkdHM6IHJvY2tjaGlwOiBBZGQgSERN
SSBzdXBwb3J0IHRvCnJrMzI4OC12ZXlyb24tYW5hbG9nLWF1ZGlvCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL3BpcGVybWFpbC9hbHNhLWRldmVsLzIwMTktT2N0b2Jlci8xNTc0OTku
aHRtbAotIFtQQVRDSCB2OSA2LzZdIEFSTTogZHRzOiByb2NrY2hpcDogQWRkIEhETUkgYXVkaW8g
c3VwcG9ydCB0bwpyazMyODgtdmV5cm9uLW1pY2tleS5kdHMKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvcGlwZXJtYWlsL2Fsc2EtZGV2ZWwvMjAxOS1PY3RvYmVyLzE1NzUwMC5odG1s
CgpBcmUgeW91IHdhaXRpbmcgZm9yIG90aGVyIG1haW50YWluZXJzJyBhY2tub3dsZWRnZW1lbnQ/
ICBPciBkbyB3ZSBuZWVkCnRvIHJlc2VuZCB0aGVtIHdpdGggbWF5YmUgc29tZSBtb2RpZmljYXRp
b25zPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
