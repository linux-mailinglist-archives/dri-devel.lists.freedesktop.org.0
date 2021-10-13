Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A140242C27C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECC46E0C4;
	Wed, 13 Oct 2021 14:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0336E0C4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:12:47 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id f3so4755000uap.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=//wmfsyzKN6sJRRuiRVe+9SYGGdywfnaIIbc8fN2K7Q=;
 b=UWOOFVd77M+1G1WCZ54iavR8ZibGxzWrpLcC9I5mBObHI7ZaKGQwUml/aGnT6r2kBn
 AeBA6vLe4d8JVE/eiYDudFZiNH6sZ5koq5QY1mfCG1VoadErGd5cNljZbvSA3ka7BRTe
 lZiwcS4xGL0p0rpn6GgwyGieJLXHo1riHIjA2gc/qMLpHvhUY84c/6yyZQAx50ya+bww
 b5fmXF9ULZKUMvRcw99X52Y9WT0MIpa5miB5PJoGVxf1p1u9vjbQBN6AtA84sA+d6Ru+
 xUrVxtqWshYcnQj0dPnMfjrj2ko0YgTzQcGTbg0hqPH4fSwkE8dg2DTl8wU0IoE2ynSn
 MScg==
X-Gm-Message-State: AOAM530IggwJOlU/MVSxs5KM70X0ANNiT0xGyxvalZX4hQBfV3hwx5uh
 xNunvnIWSnX0CvfCxnUoIL87Y1kNDVx9EsDZ15I=
X-Google-Smtp-Source: ABdhPJygQZTdnnxtn8/RdCByAxCkJnr3ICGmYP0XCgAaXRUmsyM4Ot4y+nF6DbYBk7d7NqHTmTxXiSc8WNrzdFRyx/8=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr30390992ual.122.1634134367074; 
 Wed, 13 Oct 2021 07:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210914200539.732093-1-paul.kocialkowski@bootlin.com>
 <20210914200539.732093-3-paul.kocialkowski@bootlin.com>
 <YUtBkOFeQWnteG5L@google.com>
In-Reply-To: <YUtBkOFeQWnteG5L@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Oct 2021 16:12:35 +0200
Message-ID: <CAMuHMdWO2AhtMwtq+QkAO7nLs+AQjt=fQ0JoSag3B+uRQj-o-w@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] dt-bindings: mfd: logicvc: Add patternProperties
 for the display
To: Lee Jones <lee.jones@linaro.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,

On Wed, Sep 22, 2021 at 4:46 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Tue, 14 Sep 2021, Paul Kocialkowski wrote:
> > The LogiCVC multi-function device has a display part which is now
> > described in its binding. Add a patternProperties match for it.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
>
> Applied, thanks.

Unknown file referenced: [Errno 2] No such file or directory:
'.../dt-schema/dtschema/schemas/display/xylon,logicvc-display.yaml'

as 1/4 hasn't been applied yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
