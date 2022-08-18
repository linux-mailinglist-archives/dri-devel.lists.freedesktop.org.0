Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75FF5986C8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 17:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4098010F4EA;
	Thu, 18 Aug 2022 15:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B251EBA840
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 15:03:41 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qn6so3724384ejc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=80/EAklMgMmVc7+HRt3hhNecCleYekXbl0EPWCDjc+c=;
 b=eE33E4S6PX1YDzLHM0eWlaaEQtcHJ/gF4SGTxR+tXmvZZ1Cnv+qlD1aXH8fiSvuWWl
 hQ2HggDjmDis3NZLY79V1oMy4KhjFqNclXM91U+/iIQsnIdie00suskSyk761MUhqh1j
 1gZXQabGb6GZ9vg3rv5LcNibMTmJuCK+ve3j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=80/EAklMgMmVc7+HRt3hhNecCleYekXbl0EPWCDjc+c=;
 b=bkM+G1s8MZgaLlzaF7/HyXILcOWI7GcTRUk4u1J6zCdk/J22aH9wuUParPWvR06ciT
 MzrP8Uy/VEAFDJjj3MsEvS7Ur18PxqR8eKvkBLjee9uRlyezfVXZhTw9hdVu4lprU2yR
 wkbTFLJCa/9CoIh0ipFyM46p/sFGrQBGvHo21zvWsLEjfmgwnoOPWYOZOOHu58rSMR7F
 LuhkR5jNejjgXUhHjRk6+G/T3b2TVVfNh7BHkItU3Coe1M1q9X4la9SicUY0ASZlfbNR
 9G396lpcT7LozEiANm97Moa0mdkUmCHvryrQLy32B05QZVBRkKQMC+e/jX36ZgsSSdw/
 SjqA==
X-Gm-Message-State: ACgBeo3kox8W54auIBkIzUaNIkYo3QS9CGC6aKPvB4a6JrzaCLCecuae
 9uH2t5oI2W5BfYRW9osefsl24MmYYF9YITm/
X-Google-Smtp-Source: AA6agR7d+yMsDI0ayqx4K0djLoJaEUrjcVFBIhlsKHsrzcG5+5idW1IG9f5WVmgjjpU0eWioDvpl8A==
X-Received: by 2002:a17:906:e9b:b0:730:a6a1:9fc9 with SMTP id
 p27-20020a1709060e9b00b00730a6a19fc9mr2142703ejf.601.1660835019962; 
 Thu, 18 Aug 2022 08:03:39 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 eu24-20020a170907299800b007262b9f7120sm932051ejc.167.2022.08.18.08.03.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 08:03:38 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 r83-20020a1c4456000000b003a5cb389944so2720567wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 08:03:37 -0700 (PDT)
X-Received: by 2002:a05:600c:5114:b0:3a6:1ab9:5b3d with SMTP id
 o20-20020a05600c511400b003a61ab95b3dmr2104036wms.93.1660835017557; Thu, 18
 Aug 2022 08:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220815093905.134164-1-hsinyi@chromium.org>
 <CAD=FV=XYNKF8q1mttru_J188pYMjSphQsEfQAO1Bt7GvjJRKXw@mail.gmail.com>
 <CAJMQK-gjg9evLY3oP5rgaGoRdQQTLqnK2-FChaabJTCxLTTmYA@mail.gmail.com>
 <CAMuczyUH1tefU_4+dx495_5kdrxRdA3pmXS-eyjzMCcYFfjNXQ@mail.gmail.com>
 <CAJMQK-jEgRq68JXSWtS4y5_39vJ1pWCT2-Atg31__veRtnuREA@mail.gmail.com>
In-Reply-To: <CAJMQK-jEgRq68JXSWtS4y5_39vJ1pWCT2-Atg31__veRtnuREA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Aug 2022 08:03:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXFiA4hW8_cmO0Di-NCpqvkjTqqOfbc6DfD5Rs8aT6hA@mail.gmail.com>
Message-ID: <CAD=FV=UXFiA4hW8_cmO0Di-NCpqvkjTqqOfbc6DfD5Rs8aT6hA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add double reset T4 and T5 to
 power-on sequence
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Rock Chiu <rock.chiu@paradetech.corp-partner.google.com>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 17, 2022 at 8:22 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Thu, Aug 18, 2022 at 11:19 AM Rock Chiu
> <rock.chiu@paradetech.corp-partner.google.com> wrote:
> >
> > How does T4/T5  impact the real case? We talked previously the T4/T5
> > shouldn't cause user impact.
> > Do we have testing data from ODM?
> >
> Please leave comments below the previous comment's headline.
>
> I'm confused. The reason I upstreamed this patch is because this is in
> your application note and you asked us to help upstream it. Now do you
> mean that we don't need T4 and T5?

I think Rock is asking what problems the extra delay is causing. In
other words: why do we care about keeping these delays short?

The answer is that it affects boot speed and also resume speed of
devices. Adding these two delays here means that there's an extra 100
ms before the user can see something on the screen. That may not seem
like a lot, but those kinds of delays add up quickly. At least on
Chromebooks, booting quickly is always a big goal.

-Doug
