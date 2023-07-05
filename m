Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566A07486AD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 16:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805BD10E38B;
	Wed,  5 Jul 2023 14:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D31D10E38B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 14:44:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fa93d61d48so80508975e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 07:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688568248; x=1691160248;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YmKtwavW1ZM/DLIGe88sJoG8P4s5K1xjWW1lgqiHqhQ=;
 b=HkDAkMRTNguX2wXY4lgtObUg9/ZDiVk/Hh0kwMJgW750mtz7FOMz57PUAdEidiL3za
 ivETv74tTqWsMsLSV5ZRqGo8t8KsVSbpywm4Y/E+ivFyuX1aldL9Bl3Kz3zADntgqP5u
 5h870+j/MdaEV6PH5hXFshz/8rGc4ESaoGaNkvVpWw0jyoilr4mWSvfJpPjcwR79rByb
 XlOFmOni5Lh7WIeB9VZygBojFlTM0lDMztRa+8+AqQNznGCxqhiYvUZxgmUq1dIB+7n6
 gUBti9EXH2uBmK+kHF9ZssGbIZ+C4IOYEXyB4Il7McJkEr7V6qPDoehmmu8t0G4T7+LR
 qMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688568248; x=1691160248;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YmKtwavW1ZM/DLIGe88sJoG8P4s5K1xjWW1lgqiHqhQ=;
 b=MjbnORpCDbWGvkkVaiKwxacooH2Vt+IuwRZ8qT8s8JXNazIZ73yzNggjBznG7vFPJj
 F1Sn64aYI2SFbN26n0qCeKx7u76j+jP1DvaDwL8hHV3RTxhG6fgf1CGwC1Oq+eOwRQGg
 A0Lrl30OF6k/WtcgWYy/oehNPpwBVD7a5m3C8nlURGOBa5ZB2VnKCQs8XESOUBPe7aLv
 4cgaMPJzRLqNnNqmJ4ICwQNyahLLQ70WAsXUj+vHIL7TznGKFzE+UKt9bbZoaQ/XJpkv
 MDbuV5rMLHw9zRQExrNxYRfCwX0kODgo1vhH19w0Wp0+vKXXs4trHxueEILe2tyXJwGd
 5LWQ==
X-Gm-Message-State: ABy/qLa5cVVXcjo6CsWR+r+Qv3YqaMr0gIlnI67KXUkvZpxMR+5vskp7
 Gx4tOZPQtPQYDQkY8J9DtP/Jcw==
X-Google-Smtp-Source: APBJJlECxIHZ1/nuhSbjtKSOWFbIVTOW/tFGCk0wGrvxbMvkpR32UFyVPy1XTc9iu8ZGmCrUUpXLIA==
X-Received: by 2002:a05:600c:3785:b0:3fb:dd9c:72d2 with SMTP id
 o5-20020a05600c378500b003fbdd9c72d2mr5832003wmr.31.1688568248299; 
 Wed, 05 Jul 2023 07:44:08 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a7bc8cb000000b003fbd04ecdc6sm2370816wml.5.2023.07.05.07.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 07:44:07 -0700 (PDT)
Date: Wed, 5 Jul 2023 15:44:06 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH] backlight: led_bl: fix initial power state
Message-ID: <20230705144406.GA9021@aspen.lan>
References: <20230705142447.15546-1-mans@mansr.com>
 <20230705143320.GE6265@aspen.lan> <yw1xjzvezapt.fsf@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yw1xjzvezapt.fsf@mansr.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 05, 2023 at 03:36:46PM +0100, Måns Rullgård wrote:
> Daniel Thompson <daniel.thompson@linaro.org> writes:
>
> > On Wed, Jul 05, 2023 at 03:24:14PM +0100, Mans Rullgard wrote:
> >> The condition for the initial power state based on the default
> >> brightness value is reversed.  Fix it.
> >>
> >> Furthermore, use the actual state of the LEDs rather than the default
> >> brightness specified in the devicetree as the latter should not cause
> >> the backlight to be automatically turned on.
> >>
> >> If the backlight device is not linked to any display, set the initial
> >> power to on unconditionally.
> >>
> >> Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
> >> Signed-off-by: Mans Rullgard <mans@mansr.com>
> >> ---
> >> Changes in v3:
> >> - Add comment
> >
> > This mismatches the subject line ;-) but I can live with that if Lee
> > and Jingoo can!
>
> Does it not fix it?  If you think the subject is misleading, feel free
> to change it.

The bit that goes into version control is fine!

However without '[PATCH v3]' on the subject line for the initial patch
there is a risk this thread will get overlooked and not queued[1].


Daniel.


[1] Just to be clear, Lee J. typically hoovers up the backlight patches
    and sends the PR. I only queue backlight patches myself as holiday
    cover...
