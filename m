Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2113A5A0276
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E999BE07B;
	Wed, 24 Aug 2022 20:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6795B12A752
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 16:33:16 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id h22so12046958ejk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 09:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=L964RLsTbSL/YL9PBzvH6rCb3tpB0PeNQCbDW7ySaTE=;
 b=SjyUshFDPR1oqOVRkj8XXuuaWCqHmr33hFyVRHUXRZN5I0zh5/gvuKpZwdouMLF7Pk
 Ib1JsTw2UFvz1fSZrlL7Kxf4d71fzDVPQnQj3/hl0GpeMdK7cAqj1pUGZ62ixXve+29W
 IYZ0UEPkSrA3p/C3ElLZgXtPmjvDajKpMr4ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=L964RLsTbSL/YL9PBzvH6rCb3tpB0PeNQCbDW7ySaTE=;
 b=QRMGs0bRtHCTLQ/LZqf0UmAIbDTnSCNZ3K884/H4D7yS27og+K5/iifYSJHy6mgEmc
 agsakrw/vyJrz7zKknk9TR20yXXuUFSYAEX8HO0SP7KsTgV+5Vp2mvKj2HuWIdcajXfy
 zGotfz+Focl9LD2yf1jbhpea2in2jj5lDpxNPrfFV3OLyyV0MCwlwWily+MZpxOZxSlt
 5Nhy5Z1jDg4HJtQ6LZ0b5ukEvnOd3F6uvXqZOu9EXNvp5qe6pVwY9vGXfrbPI3mfcKak
 cIeb4cibxDKi3+pm2kaHlUh09aXE6/JGy2W/UziI+WSOlDxZgOqc7oWMxrOVeQl5UO4i
 7m5A==
X-Gm-Message-State: ACgBeo3SsezwWlsGW8zvZV5ZowWtSohWk2tgDqY2OZ09gPfkdkGJn7HH
 2ZuZvItTz4nvjon6/yExuXuXMubQFKp1Fg==
X-Google-Smtp-Source: AA6agR77uLQ6LxBSRTjo0Cy8ct7v5Gffx5wOSTO28To4kWAWwBt6wTCJhegqcVxyUhFOI9J/RPeHJg==
X-Received: by 2002:a17:907:da2:b0:73d:83a9:6bd3 with SMTP id
 go34-20020a1709070da200b0073d83a96bd3mr3355256ejc.489.1661185994039; 
 Mon, 22 Aug 2022 09:33:14 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 o13-20020a056402438d00b004467facb892sm4643561edc.42.2022.08.22.09.33.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 09:33:13 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id h5so13109918wru.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 09:33:13 -0700 (PDT)
X-Received: by 2002:a5d:6881:0:b0:225:28cb:332f with SMTP id
 h1-20020a5d6881000000b0022528cb332fmr11248948wru.405.1661185993008; Mon, 22
 Aug 2022 09:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220815093905.134164-1-hsinyi@chromium.org>
 <CAD=FV=XYNKF8q1mttru_J188pYMjSphQsEfQAO1Bt7GvjJRKXw@mail.gmail.com>
 <CAJMQK-gjg9evLY3oP5rgaGoRdQQTLqnK2-FChaabJTCxLTTmYA@mail.gmail.com>
 <CAMuczyUH1tefU_4+dx495_5kdrxRdA3pmXS-eyjzMCcYFfjNXQ@mail.gmail.com>
 <CAJMQK-jEgRq68JXSWtS4y5_39vJ1pWCT2-Atg31__veRtnuREA@mail.gmail.com>
 <CAD=FV=UXFiA4hW8_cmO0Di-NCpqvkjTqqOfbc6DfD5Rs8aT6hA@mail.gmail.com>
In-Reply-To: <CAD=FV=UXFiA4hW8_cmO0Di-NCpqvkjTqqOfbc6DfD5Rs8aT6hA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Aug 2022 09:33:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vg5o-OxyQnemB+XfkGundDA-R31QhkmHJv4RmTMcF2gA@mail.gmail.com>
Message-ID: <CAD=FV=Vg5o-OxyQnemB+XfkGundDA-R31QhkmHJv4RmTMcF2gA@mail.gmail.com>
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

On Thu, Aug 18, 2022 at 8:03 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Aug 17, 2022 at 8:22 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > On Thu, Aug 18, 2022 at 11:19 AM Rock Chiu
> > <rock.chiu@paradetech.corp-partner.google.com> wrote:
> > >
> > > How does T4/T5  impact the real case? We talked previously the T4/T5
> > > shouldn't cause user impact.
> > > Do we have testing data from ODM?
> > >
> > Please leave comments below the previous comment's headline.
> >
> > I'm confused. The reason I upstreamed this patch is because this is in
> > your application note and you asked us to help upstream it. Now do you
> > mean that we don't need T4 and T5?
>
> I think Rock is asking what problems the extra delay is causing. In
> other words: why do we care about keeping these delays short?
>
> The answer is that it affects boot speed and also resume speed of
> devices. Adding these two delays here means that there's an extra 100
> ms before the user can see something on the screen. That may not seem
> like a lot, but those kinds of delays add up quickly. At least on
> Chromebooks, booting quickly is always a big goal.

While I'm not very happy with this change and I don't really
understand why these delays need to be so long, if folks are really
certain that we need them and can't make them shorter then I guess we
can land it. I'll wait a few more days in case anyone wants to chime
in with their thoughts.

-Doug
