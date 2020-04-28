Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BC1BC4F7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 18:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5C46E854;
	Tue, 28 Apr 2020 16:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957D16E852
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 16:19:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h4so3472716wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NopApeXh01c7L2Io03QMx8cqkS9YkQo3viws4wlNnSg=;
 b=PryLDU8fNN6N3kbaEKSnFW3ZljxLU0aEKb/QT9PXimf+nSVuMU7ucP99uGmeVTuXFL
 0p/ee18S1smX9x1e3ceylcDz2SWJwa72ZTbsMwetmBYWEVX4cF27O41AGTzVcwrn8u5g
 PbIsYOtqM23NIaTvc9y3sESXaAwIbJCxITZ2P2HQx3/XwghUA3gnM5d5HELhhFuWkpcF
 jsrnu3vL/GB66Xo166FKKryG/ir7ksho4hffwu3LLfhCcE98upCyoVzWUi8wsLFGyxd+
 bjwNjleFhAVyz2XyiubXZlKf1ikUnHD9bAdfHhukEalyqgFJiEGxZrgQIzqPY+WYytnp
 esGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NopApeXh01c7L2Io03QMx8cqkS9YkQo3viws4wlNnSg=;
 b=NQMUulLnxqpGhWn+lrGVJrxBGq0DAspMSV5YOR2H4bAIxZ1DmrxEnbBmOlNbH/hBXx
 470bdc9cunr8DedHiWaKSUwlNdsMmmJDLyYbk6tfDDCnLSKSy7iik7yJmNy2E5UnHmGq
 /ODRxvwWNKOs5KwEkG62Ad+J4kTV+jVtqE2VbAHlUc9UBK9AMfGDaPlYS735g6lYpVuE
 HdNXDVv8mH+R4kiO2BZVMA0umnURHqeDFK16Z4yuFkyZc6gmm+iK6v8tbUHErqWu2zLQ
 4/tmYTNld37OeVPsUbFMSBrXq1UOf1XC1tnJ2MHVantk+9lidTUqL71GCHeTJ+dfEds3
 Z3Lw==
X-Gm-Message-State: AGi0PubKyeVAWFP0iBzAhzWGr/Uh96+cxEd1xx7u44glr/272GSQtoPy
 Z3TbEcauYUrdNAc7YY2WunswMOoZKHEPAqKYFU2hBA==
X-Google-Smtp-Source: APiQypL3EsQ0jh1kA70/8Mgecdub3pq/2jqTXvhu/nseZ/tzt8oMEkOy7SFss8lrIFNxrKhvMfuy0TfvWG9Tvdn0UgM=
X-Received: by 2002:a1c:2457:: with SMTP id k84mr5090599wmk.96.1588090793272; 
 Tue, 28 Apr 2020 09:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <4cd617827cc28875ef36f3632122a83cff2ea4a7.1587742492.git-series.maxime@cerno.tech>
 <63f9e71a-1beb-7a67-ea48-dbc579fa3161@i2se.com>
 <20200428155711.efpq6vbqcq52gjk5@gilmour.lan>
In-Reply-To: <20200428155711.efpq6vbqcq52gjk5@gilmour.lan>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Apr 2020 17:19:38 +0100
Message-ID: <CAPY8ntBkKebzCM8uG0=YN_XngWS=Kgmgs_LBXmJb1nY3uPEWUw@mail.gmail.com>
Subject: Re: [PATCH v2 79/91] drm/vc4: hdmi: Deal with multiple debugfs files
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan and Maxime

On Tue, 28 Apr 2020 at 16:57, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Stefan,
>
> On Sat, Apr 25, 2020 at 11:26:31PM +0200, Stefan Wahren wrote:
> > Am 24.04.20 um 17:35 schrieb Maxime Ripard:
> > > The HDMI driver was registering a single debugfs file so far with the name
> > > hdmi_regs.
> > >
> > > Obviously, this is not going to work anymore when will have multiple HDMI
> > > controllers since we will end up trying to register two files with the same
> > > name.
> > >
> > > Let's use the ID to avoid that name conflict.
> >
> > even with this patch there is a name conflict in debugfs using Linux
> > 5.7-rc1. Dave Stevenson addressed this by using different card names
> > [1]. Since this patch won't apply anymore here is my suggestion:
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 29287ab..7209397 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -1181,9 +1181,14 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi
> > *vc4_hdmi)
> >
> >      card->dai_link = dai_link;
> >      card->num_links = 1;
> > -    card->name = "vc4-hdmi";
> >      card->dev = dev;
> >
> > +    if (vc4_hdmi->variant->encoder_type == VC4_ENCODER_TYPE_HDMI1) {
> > +        card->name = "vc4-hdmi1";
> > +    } else {
> > +        card->name = "vc4-hdmi";
> > +    }
> > +
>
> Thinking about this some more, we don't really need VC4_ENCODER_TYPE_HDMI0 and
> HDMI1, and it can all work with the same encoder type for both, so I'll drop
> them.
>
> To address this issue though, we can add a card name string to the variant, like
> I did for debugfs. Is that alright for you?

My patch doesn't fix everything with the audio debugfs entries anyway.
I'm working against 5.4 on our downstream tree, and even with my patch
I get
[    7.459508] debugfs: Directory 'fef00700.hdmi' with parent
'vc4-hdmi' already present!
[    7.511017] debugfs: Directory 'fef05700.hdmi' with parent
'vc4-hdmi1' already present!
I seem to recall I reduced the number of complaints over 'vc4-hdmi',
but internal to sound/soc-core the node is still registered twice.

There was discussion about this a few months back.
https://lore.kernel.org/lkml/1jblpvraho.fsf@starbuckisacylon.baylibre.com/
seemed to conclude that it wasn't totally trivial to solve.

Regards,
  Dave
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
