Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B78216329
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 02:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6779C89E43;
	Tue,  7 Jul 2020 00:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3653889E43
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 00:51:42 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a8so35722975edy.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 17:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fP4OpLp0FjsIYxMifwNx7k+9nkUSsvv31ikh9HglHIY=;
 b=j2JrZAWlwruxerUFy6eYB7r/b1mBHmiLW+tOmUbIJ6oIXT79vVI/tddFTHoQqA/Dag
 rjKhpQqSsxsj79lP9td1HcHxhkVvqTbZyMu48pEGRTfEf2yuqs8Td7KOtlyzYNOKQGkF
 FQ1ah6AkelWrfLcHEGS18zqKSL3HJ8vkSVaBiDFcK+L7Nl+nQbxs/CZ0W7RiQF1H1urJ
 fwuLjrYyYSOw2TtMlD1lnj01RwHdCXmUU4cIA7QbmZDU9kGef5FVAHH9X7oWkHxfjbbz
 cYrA5UiQqdYa6JRuXQy5WLFuuR/gudReKjl8b5QAANlchWmmAPaQAphPqomY8QuId3bw
 8miA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fP4OpLp0FjsIYxMifwNx7k+9nkUSsvv31ikh9HglHIY=;
 b=EPHL2jULLfMJKvIXWjggArs/6gepRhwvGstAh4yKOMlPOh3LbnwaNWD/tmoVHTLw5E
 ljA5l4GW3UmqfYM2toDvxdX7lzLRj55YicHaR5afa5YAvhA+OtkkPEtLR0pxeaDrTtTj
 XKmjoOralSTcbhZIrtiB2smaswhBnkMSOV9m+gJOV9zy1Ik6lzCfCSVZbwZ4686588YZ
 qJ9dDS+fYTTq7mvuTuF6WowOL1P8q/jig988yKaC3yMMAaXhVk2JsmVs7gZ1X9BRhkzI
 1SJsdnBVsH6DhWZDmIH8tyOoLc0+UddiMxSbxThmiR3Bq37Dlv0w5d0daCtBMhNLRqBv
 /FmA==
X-Gm-Message-State: AOAM532Sjeqmk+lhW2PgGR213KYdKeZ1BvHVNvykhzqcUu0nknDIkk3f
 wzUJ1qwpNrT3nkw1qABL30nOIOmDy6DPkoIpjV7BTA==
X-Google-Smtp-Source: ABdhPJzp8OxMJ6XX57N3wsB50xwXQiNgeDUcSeD89047WHNDCTbtIajsV/i86EY+rHSRbixicaAeReheN7Jay3TZvaI=
X-Received: by 2002:a50:fe16:: with SMTP id f22mr52368626edt.315.1594083100783; 
 Mon, 06 Jul 2020 17:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
 <20200630082509.puuzneiipalvrxup@gilmour.lan>
In-Reply-To: <20200630082509.puuzneiipalvrxup@gilmour.lan>
From: Eric Anholt <eric@anholt.net>
Date: Mon, 6 Jul 2020 17:51:29 -0700
Message-ID: <CADaigPXSaZ8K2m_fyq2dFwf-X76LpYMagjXqA01b0ST6QYzE2g@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] drm/vc4: Turn the TXP into a CRTC
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 1:25 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Eric,
>
> On Thu, Jun 11, 2020 at 03:36:45PM +0200, Maxime Ripard wrote:
> > Hi,
> >
> > This is another part of the rpi4 HDMI series that got promoted to a
> > series of its own to try to reduce the main one.
> >
> > This rework is needed since the bcm2711 used in the rpi4 has a more
> > complex routing in the HVS that doesn't allow to use a fairly simple
> > mapping like what was used before.
> >
> > Since that mapping affects both the pixelvalves and the TXP, turning the
> > TXP into a CRTC just like pixelvalves are allows to deal with the
> > mapping in the CRTC states, which turns out to be pretty convenient.
> >
> > Let me know what you think,
> > Maxime
> >
> > Changes from v3:
> >   - Stripped the patches out of the main HDMI series
> >   - Change the bind order of the HVS to avoid a compatible check
> >   - Added Eric's tags
> >   - Rebased on top of drm-misc-next
> >
> > Maxime Ripard (9):
> >   drm/vc4: Reorder the bind order of the devices
> >   drm/vc4: crtc: Move HVS setup code to the HVS driver
>
> Could you review those two patches? You haven't reviewed them yet and
> it's holding back the rest of the patches.

LKML email workflow is the worst, the patches never came through to me
so I didn't see them until you linked me the patchwork.  Patch 2,
commit message should say "We'll need the HVS to be bound before the
TXP", but other than that, r-b.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
