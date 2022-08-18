Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F1C598E27
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 22:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A55510E1F1;
	Thu, 18 Aug 2022 20:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E8A10E1F1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 20:37:12 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-324ec5a9e97so72403387b3.7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=te30C2IAdz2ie8EgRg97JfclKhmQvdhP0CAG9MwGiPg=;
 b=R8BGKbrQWN9tKOcihZmAg+481uKcV+OrvDznnerC6qC6pL2xBHBXXndxqzS8/fowr1
 T5dUS5lTNiKtuylWqThnPxXZyZmA4U5WqQBKreC5PqBXUr4X06tW/mJsIL31bXftTA/K
 w2ETjeB7y1blHFegoa7rqwiJTLATsCgCqBQzDiIYxiFhH878Q9+fEPiQjJ0LwFAWfVYo
 8xFz9Rb8CJlseioN5hhIkvKmtKp8vArQ3d8LWeJr5efKz1Mp3lXjXFoEA36g4lpwh+7N
 C8cVSNP5wnUOI7jYVAcCqbcPFPMvqh3SAlc2k/BGECepzkzCK3/xxk0+dyHkg85IHjrs
 xylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=te30C2IAdz2ie8EgRg97JfclKhmQvdhP0CAG9MwGiPg=;
 b=6IyiBNpdH0kZApjMqWibF40wQ+F1WiHtsCkOHVv33J68SMUZ3TyrYIvudNmxuX16pB
 YVLJfe2pkfJN71ac+y4Vp/vO6KDFoF21sw5GkwJCZ254P1C2JKLWH3SK7o6r+rYoXOn+
 18pYBGBU1K73BGMKid8686pQGvf1uI1tDUQ9bcJ7WlXHMeG0NhegPrJcagXBrRW9cUls
 1M/E/F65d8Wka4lp58C9251Y9htREhGkLTkGINapJGpF7Dz+BuRAXaPLvaOkz7O8n8Sy
 DfgwyEkxc14TxBRz+AElfmcV3Nb1ivm+qLru9nDNvZgS9c3fkbxtH2W51En3mz7vX/uD
 cUhA==
X-Gm-Message-State: ACgBeo3QkA7sowv0DSkXESlOZbco66XTZtf21P8YoMlTpZwxTbtnSowW
 m6J0CPCA4bwE/lYJlhMAaXNSV25B9Zfy+yFQs2o=
X-Google-Smtp-Source: AA6agR4IbvQyTpxWSObecVxKV+yoUtdTEEwH2SEHW57LLRtwAGw54BL9LoY9/YxK2Eg7HJB+oTRVTzUx3IRAnksYHN0=
X-Received: by 2002:a81:99d7:0:b0:336:f7d3:8b4b with SMTP id
 q206-20020a8199d7000000b00336f7d38b4bmr3408213ywg.194.1660855031685; Thu, 18
 Aug 2022 13:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <YvvHK2zb1lbm2baU@debian> <20220817071048.4v66zky5qysn45wq@houat>
In-Reply-To: <20220817071048.4v66zky5qysn45wq@houat>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 18 Aug 2022 21:36:35 +0100
Message-ID: <CADVatmOKemXQbRpJeeqR2NbWMkUc9U09xrch=OpDkxFXqbH8XA@mail.gmail.com>
Subject: Re: drm warning with mainline due to 467e30171b5b ("drm/vc4: hdmi:
 Move HDMI reset to pm_resume")
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 8:10 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Tue, Aug 16, 2022 at 05:34:51PM +0100, Sudip Mukherjee (Codethink) wrote:
> > Not sure if it has been reported but the mainline kernel shows a drm warning
> > on RPI4B.
> >
> > [   14.821276] WARNING: CPU: 3 PID: 187 at drivers/gpu/drm/vc4/vc4_hdmi_regs.h:487 vc5_hdmi_reset+0x1f8/0x240 [vc4]

<snip>

> >
> > git bisect pointed to 467e30171b5b ("drm/vc4: hdmi: Move HDMI reset to pm_resume")
> > and reverting this commit has fixed the warning.
> >
> > I will be happy to test any patch or provide any extra log if needed.
>
> We have fixes for this in drm-misc-next that have missed the cut for the
> merge window:
>
> https://lore.kernel.org/all/20220629123510.1915022-38-maxime@cerno.tech/
> https://lore.kernel.org/all/20220629123510.1915022-39-maxime@cerno.tech/
>
> If it fixes it for you, I'll apply it to drm-misc-fixes

Thanks. With these two patches applied on top of the latest mainline,
I don't see the warning anymore.

Tested-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>


-- 
Regards
Sudip
