Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5859EADF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 20:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA8B113791;
	Tue, 23 Aug 2022 18:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347BD113791
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 18:24:01 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id pm13so5826536pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc;
 bh=7XTGVkMBPLrwjtXxcaOx31Px0tvAGpLY3EuE7oCCnjI=;
 b=QUiNSn917AVTIsrzbGnUa617Ladt8vDyJ8nDZLINOxnle2vQeENAUIXJWhCywURT0G
 i1G8J5GPlHiqJcgXFXfdcXY9pCFt1G7Sxy5zR48Ta0uhJXvosmei+9D2NfxJYTTtHoWc
 loVF8T5YXKtEapCIn0IWvUJikZ9qqCMJXMbUX7qj6jGbe35rdkghS9lJ+ML1sj2Yy5JP
 rbkIWnVRIdFuRNiguifR+T4GXjiQWY/6DxPzSfsM+iW6BFnyfudXcg98xH+53Cbe3oQL
 3wTI0zpyFmaqgOIt+WsThvYhaKwq3evPe+wEhcOPxL1zQ/i7Ehz9k07ljeYz3B7fKyA/
 UOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc;
 bh=7XTGVkMBPLrwjtXxcaOx31Px0tvAGpLY3EuE7oCCnjI=;
 b=WW1B6r1S1fRM24bO1++Fgcc/aFjeGehfRVSbSfk1xZjzs5QXjF6+yH2ThP8/Z7qovB
 UX6Qdp42zdZDvoEnQY7UVa672bu+kkLHQltkcl4cVCPsmZek72VrsPRTqUAkxpyRh+YH
 uqg/NxDrOmCY5DMOZ/YeYNH7jyqBRtSxhejg7XJB/zPhVsic3Qa3iz49X+XhHb6JwGuW
 kY0m3pHfq1bLDsf0TjhHh0kdukj7RKDPV+iW971gdmcIqF7kRC+OR8tlF5vaT5g2HX+R
 //HsEZ//OdYeQ6BAuezZXX4QmTJY9w58IlhZOjrCMmmIHLhb200Ximf584Bx/NaxqjOs
 oUdA==
X-Gm-Message-State: ACgBeo0iKQ4kwyJIyeIArJ64r8Jba9+mTwVXtIfYP2M+MnjLEf02kbhK
 PmWzYcYWdiVk/kF4oHDtuske8w==
X-Google-Smtp-Source: AA6agR5+pbDTRD51vIsgkYI58hWxVoEtGJ3K3IFa8qKR94EwPjqxMSHDIYNArBj1P94/Qu1HRRweYA==
X-Received: by 2002:a17:902:e54f:b0:172:ef3e:f725 with SMTP id
 n15-20020a170902e54f00b00172ef3ef725mr9200223plf.66.1661279040572; 
 Tue, 23 Aug 2022 11:24:00 -0700 (PDT)
Received: from localhost ([76.146.1.42]) by smtp.gmail.com with ESMTPSA id
 h17-20020a170902f55100b0016e808dbe55sm10952991plf.96.2022.08.23.11.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 11:24:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Oded Gabbay <oded.gabbay@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yuji Ishikawa
 <yuji2.ishikawa@toshiba.co.jp>, Jiho Chu <jiho.chu@samsung.com>, Alexandre
 Bailon <abailon@baylibre.com>
Subject: Re: New subsystem for acceleration devices
In-Reply-To: <CAFCwf13WU3ZEjurEaEnVC56zorwKr-uuQn-ec10r301Fh+XEtA@mail.gmail.com>
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <CAPM=9txme2dQD9kyM6gnYyXL34hYP8wcGMbduOUcFsKe+4zTcQ@mail.gmail.com>
 <CAFCwf11TPKTF_Ndi60FneWp5g3SoawJvfJoKVWJ-QjxjpawMmg@mail.gmail.com>
 <CAFCwf13WU3ZEjurEaEnVC56zorwKr-uuQn-ec10r301Fh+XEtA@mail.gmail.com>
Date: Tue, 23 Aug 2022 11:23:59 -0700
Message-ID: <7hk06ykedc.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@arndb.de>,
 Jason Gunthorpe <jgg@nvidia.com>, "Linux-Kernel@Vger. Kernel.
 Org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Obed,

Oded Gabbay <oded.gabbay@gmail.com> writes:

[...]

> I want to update that I'm currently in discussions with Dave to figure
> out what's the best way to move forward. We are writing it down to do
> a proper comparison between the two paths (new accel subsystem or
> using drm). I guess it will take a week or so.

Any update on the discussions with Dave? and/or are there any plans to
discuss this further at LPC/ksummit yet?

We (BayLibre) are upstreaming support for APUs on Mediatek SoCs, and are
using the DRM-based approach.  I'll also be at LPC and happy to discuss
in person.

For some context on my/our interest: back in Sept 2020 we initially
submitted an rpmesg based driver for kernel communication[1].  After
review comments, we rewrote that based on DRM[2] and are now using it
for some MTK SoCs[3] and supporting our MTK customers with it.

Hopefully we will get the kernel interfaces sorted out soon, but next,
there's the userspace side of things.  To that end, we're also working
on libAPU, a common, open userspace stack.  Alex Bailon recently
presented a proposal earlier this year at Embedded Recipes in Paris
(video[4], slides[5].)

libAPU would include abstractions of the kernel interfaces for DRM
(using libdrm), remoteproc/rpmsg, virtio etc. but also goes farther and
proposes an open firmware for the accelerator side using
libMetal/OpenAMP + rpmsg for communication with (most likely closed
source) vendor firmware.  Think of this like sound open firmware (SOF[6]),
but for accelerators.

We've been using this succesfully for Mediatek SoCs (which have a
Cadence VP6 APU) and have submitted/published the code, including the
OpenAMP[7] and libmetal[8] parts in addition to the kernel parts already
mentioned.

We're to the point where we're pretty happy with how this works for MTK
SoCs, and wanting to collaborate with folks working on other platforms
and to see what's needed to support other kinds of accelerators with a
common userspace and open firmware infrastructure.

Kevin

[1] https://lore.kernel.org/r/20200930115350.5272-1-abailon@baylibre.com
[2] https://lore.kernel.org/r/20210917125945.620097-1-abailon@baylibre.com
[3] https://lore.kernel.org/r/20210819151340.741565-1-abailon@baylibre.com
[4] https://www.youtube.com/watch?v=Uj1FZoF8MMw&t=18211s
[5] https://embedded-recipes.org/2022/wp-content/uploads/2022/06/bailon.pdf
[6] https://www.sofproject.org/
[7] https://github.com/BayLibre/open-amp/tree/v2021.10-mtk 
[8] https://github.com/BayLibre/libmetal/tree/v2021.10-mtk 
