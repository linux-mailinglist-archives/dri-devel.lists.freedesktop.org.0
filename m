Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3087D89B6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 22:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6DF10E89F;
	Thu, 26 Oct 2023 20:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF6710E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 18:24:03 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c434c33ec0so10726615ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698344643; x=1698949443; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tnqsda22G2Qc0lGiVQrWJUyVTt/ZCgCquZzH6q8sR6Q=;
 b=CbNASkDC7z4Hb0ahlcpOaSZ58o/qbiirvlR44pOTbxmVENVU6WlxcjQsjnk33iVYJN
 Az/30DNUcRjdh4IlNUc2I6YOoIX/peCjxNY7IFPo08n5ofF2xGnT2TFcG2OtqYwJ7K8b
 jYFCbC3+3CVDmp2T3rpbWBg3NIrGZn1Df8kYw98H063PMTs5WhDrUeenJytbZ7qpDXVe
 gkWDrylIVGEd8mee0hGy5vqMiVP065pEmFni3WsEF32DVJMepcva4s+mpw0uCeU9u9/a
 sCC6PmmAT4X0ve7Ma48v8tFFSjLs9VmIM5wOe4jTWC1Ez0e9xVbmEIjO7SVTrydufCOB
 xXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698344643; x=1698949443;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tnqsda22G2Qc0lGiVQrWJUyVTt/ZCgCquZzH6q8sR6Q=;
 b=uhjV+SuaJJOhh6wkElfZhS1ifyK7Cyq0jhWrLklkcvvavXm4qSHQ6woMW0Ff3APqGJ
 Q2ZR8madFPXJM7LkPjg7bt9rl5igKd/Ys6vLJvXGXu/FeLTA/su8m+S/WMj/L20E5wy8
 /MB34d4UXAzeIGZz98QitUL8Plv11RnbsJRwNHTWG8F9r0Rgm2HjyH79fGKklg6erRpB
 Yx3b1P/cetxPU0fVvaqKVgOEtKMS0X3FhYBgdG9XcO4JfsiRJJdCQADrGlMwtWzbfSd0
 gm3/R/HW7baIjgIr2uGSXmzJPQKmZTD9WMrDHcXTTwd7NJ7n04btDQ6bX+S0JyHzeEVe
 khnQ==
X-Gm-Message-State: AOJu0YxBOlOR183zMQrTrLUwVAzELJxNVl1hOJjLHUx3l8oOchCCfNMH
 Lg92P0/aIDq5TllN4g79I3aKHkSkYuW6krZVYCc=
X-Google-Smtp-Source: AGHT+IE+o7QR+l7tubrg3r769ZTbF/CKg3EvU6ErUXxmnp6IHl6gjoGlzIV2tfNSbzZtYIWwQ0wHVArrwvqQGig+NkY=
X-Received: by 2002:a17:90b:4389:b0:27c:edd5:6137 with SMTP id
 in9-20020a17090b438900b0027cedd56137mr311202pjb.25.1698344643160; Thu, 26 Oct
 2023 11:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231013031040.152282-1-aford173@gmail.com>
 <7e16351f-4d70-4451-b3c7-1dadfa41f20b@kontron.de>
In-Reply-To: <7e16351f-4d70-4451-b3c7-1dadfa41f20b@kontron.de>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 26 Oct 2023 13:23:51 -0500
Message-ID: <CAHCN7xKhbvaVnz1FFc_GX1xFN25ctS2aRDs0ZwY0MazqVgjxFA@mail.gmail.com>
Subject: Re: [RFC] drm: bridge: samsung-dsim: Recalculate timings when
 rounding HFP up
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 26 Oct 2023 20:33:24 +0000
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 26, 2023 at 1:12=E2=80=AFPM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Adam,
>
> On 13.10.23 05:10, Adam Ford wrote:
> > When using video sync pulses, the HFP, HBP, and HSA are divided between
> > the available lanes if there is more than one lane.  For certain
> > timings and lane configurations, the HFP may not be evenly divisible
> > and it gets rounded down which can cause certain resolutions and
> > refresh rates to not sync.
> >
> > ie. 720p60 on some monitors show hss of 1390 and hdisplay of 1280.  Thi=
s
> > yields an HFP of 110. When taking the HFP of 110 divides along 4 lanes,
> > the result is 27.5 which rounds down to 27 and causes some monitors not
> > to sync.
> >
> > The solultion is to round HFP up by finding the remainder of HFP /
> > the number of lanes and increasing the hsync_start, hsync_end, and
> > htotal to compensate when there is a remainder.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> > This adds support for 720p60 in the i.MX8M Plus.
> >
> > NXP uses a look-up table in their downstream code to accomplish this.
> > Using this calculation, the driver can adjust without the need for a
> > complicated table and should be flexible for different timings and
> > resolutions depending on the monitor.
> >
> > I don't have a DSI analyzer, and this appears to only work on
> > i.MX8M Plus but not Mini and Nano for some reason, despite their
> > having a similar DSI bridge.
>
> I just want to report that I have tested this patch (on top of current
> linux-next) on our Kontron BL i.MX8MM board with the ADV7535 bridge and
> I don't see any change when trying the 30 different modes the monitor
> reports as supported. 18 of those work and 12 don't work.

Thanks for testing this.   I didn't see any regressions on my Mini or
Nano either, but I did see the 720p60 now works on i.MX8M Plus (but
not on Mini/Nano).  I am not sure why, and I don't have a DSI
analyzer.

>
> So at least there is no negative impact in this case.

At least nothing broke.  :-)

>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL
> i.MX8MM with HDMI monitor

I'll add your T-b when I post it again.
>
> Thanks
> Frieder
