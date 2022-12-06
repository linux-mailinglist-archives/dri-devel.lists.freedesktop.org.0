Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403E76444DC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 14:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A295810E11A;
	Tue,  6 Dec 2022 13:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E9E10E036
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 13:47:44 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id c15so13702253qtw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 05:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+zwsuo3CbkQiK4rUg7GOR+GbgfKxh+ViwiReQiXihu4=;
 b=4xvGK6rDgatI87GluLvQJhtAgHnnCrJGzbPKXA+YGngTRxWSuHRbyaGF41yRhn8oOa
 xgmmkBdu2mJ04uhE71ot1i+nqGNSLv0fTGGZWMxsh3/0Nhz2i4mE7ryT6/GAuw8HBXMU
 ZxTaNBYrIW/HvRfZ6oJ1XferJw5SMQKzh2rg3JGX3S4i3E6CBI4Dw70DpDZ/WvaqZnhr
 s6hvUP0nM0fhWKDz9hG5BXDfl3TpqzuyQ2ObLKILVD39Vn6Z3XVKuu/3yqqLD+LRZyXx
 zJczt/qFsbbv/WL6MGFmZJ9sghQFzP23Y+k+fborGnXRHq1OrGl25K1rzGzDvje8mHCE
 Zurg==
X-Gm-Message-State: ANoB5plorIcqF6yBb+D7ziMW9imVnz4yrdZpaAh0zAffP0MfzupdfJuI
 wznAbAjG2fJqgPCOh1/eu5GpH31jbtOE3Q==
X-Google-Smtp-Source: AA0mqf5gqTGVDiZfyi8vpYpffYLl4Knrqbt5C0fIfTg53H7JpV2a1tDbhiC18C7ksm1G/aLn3mgjog==
X-Received: by 2002:ac8:607:0:b0:3a5:3553:7e67 with SMTP id
 d7-20020ac80607000000b003a535537e67mr63358650qth.221.1670334462780; 
 Tue, 06 Dec 2022 05:47:42 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 l28-20020a37f91c000000b006fca1691425sm13711180qkj.63.2022.12.06.05.47.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 05:47:42 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-3b48b139b46so151922787b3.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 05:47:41 -0800 (PST)
X-Received: by 2002:a81:4e09:0:b0:370:202b:f085 with SMTP id
 c9-20020a814e09000000b00370202bf085mr16748351ywb.502.1670334461439; Tue, 06
 Dec 2022 05:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221201095631.89448-6-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdXXoNq0CxSqPLzZUPdVTNa+6u+DNhbm_pCSQOvTHf3EjQ@mail.gmail.com>
 <b35d7cf0-99ef-86b7-41b3-0751abd4642a@ideasonboard.com>
In-Reply-To: <b35d7cf0-99ef-86b7-41b3-0751abd4642a@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Dec 2022 14:47:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeyo-8G2LtA9tgqJ8P8zT2EQGx8GYUWQx66ut29e8RTw@mail.gmail.com>
Message-ID: <CAMuHMdVeyo-8G2LtA9tgqJ8P8zT2EQGx8GYUWQx66ut29e8RTw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] arm64: dts: renesas: white-hawk-cpu: Add DP output
 support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Tue, Dec 6, 2022 at 2:45 PM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 05/12/2022 12:10, Geert Uytterhoeven wrote:
> > On Thu, Dec 1, 2022 at 10:56 AM Tomi Valkeinen
> > <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >>
> >> Add DT nodes needed for the mini DP connector. The DP is driven by
> >> sn65dsi86, which in turn gets the pixel data from the SoC via DSI.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > (same comments as v2)
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v6.3, with the mini-dp-con node
> > moved up.
>
> Ah, sorry, I had missed this change. I'll update my branch too.

Np.  IIRC, you were sending out v5 while I was reviewing v2/v4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
