Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5606611BD
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 22:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C893910E1CB;
	Sat,  7 Jan 2023 21:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E3F10E1CB
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 21:02:50 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-4bf16baa865so65355377b3.13
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 13:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JmL5h/5f9ZKkHhV7ji7KKVGJQTUq0yPHfnhiMRhXed0=;
 b=IK5dGKTx88W2mfNkdSbqWACqkjubhVS9N14mCOb6xiNrTRTmnuplQafYC0im+wGspK
 eOYeaF0MULlk8xs1MhOKyABR+2n5mu7ywO33aNQ9VX4GMkdSdCVqflFNfkdkPvE907aV
 AbMRlhdfsnbXDXTGbNIAQfaGPRPsPMo8biAT31OQE9sPB82/31f0is5EfnCupoTz/Ke+
 5qPrTwyq0HpYK24udJ89pRlkE2Z5QaSlpexv9uCe2Y49IpPc0IVSTp5co8YZkKYLFYOl
 z+xqA+ASKB1ZQdTTr7sECFdnwcqnzJz4QBV2ycEBNoSYjk2aEYooKDaJopPZvE6w6Z6k
 Ar3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JmL5h/5f9ZKkHhV7ji7KKVGJQTUq0yPHfnhiMRhXed0=;
 b=gf6GLC/owU/Ll0nPbamUQLoSjYtWWOUv9+5ONEvZ8OC82GvmkF5441GVAP0+zOhP2G
 aWE5osM+PNOtHNv00pGfdFyjte+vY56eYz9boCNgnV81nh0nSdRzaitfpE+Q11Fny7Gh
 7RraUJS4un4dRg77rh4juR8jExMP+6UTZRRx8F7rZbLvgukZwE2ko99yewTxGZRWnGJv
 dexDf7VtFBUhfb7xbx/f6qlusZP5ystjPfDURfyKsVPWCtu91SYHK/X/Z7TyJpLkNMGW
 htiQXmR0LAvmusXRpICkncyIjaZfNcLqwd+o1jtKZlEramesqwewKwF3lg6L6lyNzACu
 KDWw==
X-Gm-Message-State: AFqh2kp4+tUkhuhJFGcceFhGGNawFznzd9+9lSMqJJdEa8ScihVPUz4a
 XT44aAHCW0n7t0GyDlwJtwEqXCsgnq8grkOhTEE=
X-Google-Smtp-Source: AMrXdXvY/st+xuDrW4znKkHpZttsCvsZGZkx5Bw3ldG/KbixkSHtRzf/+VMAvkN/c9NxoWqjkDvGG4OpHXXkd75XJ3w=
X-Received: by 2002:a81:484f:0:b0:3ed:90d2:2ab8 with SMTP id
 v76-20020a81484f000000b003ed90d22ab8mr582273ywa.67.1673125369382; Sat, 07 Jan
 2023 13:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Jan 2023 22:02:38 +0100
Message-ID: <CANiq72mFMJuec+r=T6xYtLpuU+a1rOrAhrHiecy_1Jpj2m4J=g@mail.gmail.com>
Subject: Re: [PATCH 12/15] auxdisplay: ht16k33: Introduce
 backlight_get_brightness()
To: sam@ravnborg.org, Stephen Kitt <steve@sk2.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-omap@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 Robin van der Gracht <robin@protonic.nl>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-staging@lists.linux.dev,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 7, 2023 at 7:26 PM Sam Ravnborg via B4 Submission Endpoint
<devnull+sam.ravnborg.org@kernel.org> wrote:
>
> Introduce backlight_get_brightness() to simplify logic
> and avoid direct access to backlight properties.

Note: Stephen sent this one too a while ago (with some more details in
the commit message, which is always nice); and then he sent yesterday
v2 [1] (to mention the functional change with `BL_CORE_SUSPENDED`
[2]).

Anyway, if it goes via drm-misc, feel free to have my:

    Acked-by: Miguel Ojeda <ojeda@kernel.org>

Though it would be nice to have Robin test the change.

Thanks!

[1] https://lore.kernel.org/lkml/20230106143002.1434266-1-steve@sk2.org/
[2] https://lore.kernel.org/lkml/CANiq72kRhmT37H1FAGYGny83ONYXeqJuO8ZPbym0ajQOWKY4Kw@mail.gmail.com/

Cheers,
Miguel
