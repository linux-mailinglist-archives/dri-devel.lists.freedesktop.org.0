Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8862E2F8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 18:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FDB10E651;
	Thu, 17 Nov 2022 17:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295D810E657
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 17:26:00 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ud5so6819801ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 09:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7rh9znBXsFKpv/JRJo88opLzz4QQKJoh7e7ZIix0R5c=;
 b=mojJmptnETuCrRADBiymgqt9Ztwx8PnEPoJX0GAXmR6QOws+o5duVYpswPjZ2Rczqk
 6EblxUIk7HUZ41mzG3+saD5VFiZDnoRbemfg6pXTdvYRLAIn3AeIbULlCYXEupOZZdH6
 Si94ZrcsmFk5y0xQe/OTfyEE30OCO9fS9Z7ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7rh9znBXsFKpv/JRJo88opLzz4QQKJoh7e7ZIix0R5c=;
 b=7frcWkmL2itaSIPO7mHn1B8SKS5Y1cOJt5wl93kO/IX7l613Q7DOm71Ce31sn3sR/O
 6FFzvXzADXoBq3eN0pQbHE+TVDbH/Eq+NnNet7sAZeNTrutOzcobRKt8an1EkW30c7Wi
 Eps6m/qmQXFT8Nr6qCSZ4Y1kI8CnCT6Ed631yukuoQDlfPRKMrCf9aH3t6IwzxHu0wYc
 lwybvnzrVj0iIDuUI34FAapb8o8iP9l8a+Ve2YfSL0OpTM/AotPyZxM+qulRZAeQCkoA
 KPai3J/oXHjqurIB5SluaR73J375He2Noi60F8LadsZRVZgffdlo4HAZaDYrQx2C/w2X
 X9IA==
X-Gm-Message-State: ANoB5pmkNv3e/t2wNrfI3SYT+LC1fv8AdCY+P3JrZUB5hKw6w+6CFvfT
 h50v2WoxxFrgndOeWl7wXC1BtYu7fpP0Ha+G
X-Google-Smtp-Source: AA0mqf4JpUMszQRdOPuDTIssV3pQHuUocpZyZeO7FvXWUmtd9bbLtJWnZZD5HZGsP2uYv6NO0FWBnA==
X-Received: by 2002:a17:907:2105:b0:7a1:1c24:e566 with SMTP id
 qn5-20020a170907210500b007a11c24e566mr2946864ejb.360.1668705958209; 
 Thu, 17 Nov 2022 09:25:58 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 s16-20020a056402015000b00461816beef9sm787085edu.14.2022.11.17.09.25.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 09:25:57 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id cl5so4965016wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 09:25:57 -0800 (PST)
X-Received: by 2002:adf:cd82:0:b0:238:b29e:4919 with SMTP id
 q2-20020adfcd82000000b00238b29e4919mr2112282wrj.583.1668705956712; Thu, 17
 Nov 2022 09:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20221117110804.1431024-1-hsinyi@chromium.org>
 <CAD=FV=VEC=GzkDfaOqauBB5Y79teS1ENA5wFUHZmnTRkg6Z4tg@mail.gmail.com>
 <CAJMQK-gQj83N1MBu1s+_YDJ4qbqN4McSqCnOwWAq4iaNXo5Sfg@mail.gmail.com>
In-Reply-To: <CAJMQK-gQj83N1MBu1s+_YDJ4qbqN4McSqCnOwWAq4iaNXo5Sfg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Nov 2022 09:25:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VoF5PyeNWX+4_3sseyRemZVsr5WtQVeg-8mhfgm40w3g@mail.gmail.com>
Message-ID: <CAD=FV=VoF5PyeNWX+4_3sseyRemZVsr5WtQVeg-8mhfgm40w3g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] drm_bridge: register content protect property
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 17, 2022 at 9:12 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Thu, Nov 17, 2022 at 11:57 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Nov 17, 2022 at 3:08 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > Some bridges are able to update HDCP status from userspace request if
> > > they support HDCP.
> > >
> > > HDCP property is the same as other connector properties that needs to be
> > > created after the connecter is initialized and before the connector is
> > > registered.
> > >
> > > If there exists a bridge that supports HDCP, add the property to the
> > > bridge connector.
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > Reviewed-by: Sean Paul <seanpaul@chromium.org>
> > > Reported-by: kernel test robot <lkp@intel.com>
> >
> > Not sure it's worth spinning for, but FWIW I wouldn't put
> > "Reported-by: kernel test robot <lkp@intel.com>". The emails from that
> > bot are always a bit confusing in this regards, but I think they mean
> > "if the patch has already landed and you're sending a separate patch
> > with a fix then please add the "Reported-by" tag". ...but adding it to
> > the original patch just doesn't make a lot of sense.
>
> Got it, thanks. I think I'll wait for a while to see if there's other
> comments. Otherwise should I send another version to remove the tag?

I don't think it's necessary. Someone could just remove it when they
land the patch.

Speaking of which, I'm OK with landing the first two patches with
Sean's Reviewed-by, but ideally we'd get a non-Google review from
someone that maintains the bridge stuff on the patches. That being
said, in another email thread [1] it was pointed out that the bridge
subsystem is mainly under maintained. When I got committer access for
drm-misc access I was told in IRC that part of my job would be to deal
with landing ChromeOS-related stuff assuming it was properly reviewed.

I'm about to head on vacation for ~1 week and don't want to land and
run, so how about this? Let's see if you can get Sean to review the
3rd patch in the series. If he's happy with it and things aren't on
fire when I get back, I'll send another email to the list saying that
I'll give that patch another ~1 week on the list and then land it if
there are no objections. This way folks will have plenty of warning if
they want to review the series, but if not then it won't sit waiting
forever. Assuming everything with v6 still looks good and there is no
other reason to spin, I'm happy removing the extra Reported-by tag
when I land.

[1] https://lore.kernel.org/r/20221117143411.5sdyrx6v2nunql5n@houat
