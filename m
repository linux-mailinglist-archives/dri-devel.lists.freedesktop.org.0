Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030725919E3
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 12:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54499502E;
	Sat, 13 Aug 2022 10:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB1F18AFEA
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 10:36:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b4so505996wrn.4
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 03:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=HPuvTq5hFjRHTYbOkDpZrmTC++rMWhoNof888/AkPnc=;
 b=AAkADSOegOTUqUha0RqJU/WOWtpIjaLnBBG1CrsD/pTFaDC5BIaxwKdWiZikvRIgYh
 s7eFvvYg9gMQc//tTE42QQddOXmeHvZ4MS83ppg6epa96YRuh8OGTlQj9DxjZXu/fBD9
 lAt9813Qn6Tm+qfP1mf5fJ9GTvDqa1/F0Cap73LnLNSTgD27ynLXw0YdUluth7N/YL76
 9Pu53gAg2dKbdHa5mt5t5Cn1Z1XBr60o3e6L3TIV0XDCtLZtZyZC2Fp4+j1aGOs1nJ27
 T2Oz20n/JhJzsOvlKoSHajPdJd2qA8QxRU6OXiK4IM1gFI1VZ/XvSuuLGn8GvMujOQ26
 G4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=HPuvTq5hFjRHTYbOkDpZrmTC++rMWhoNof888/AkPnc=;
 b=l9woo0O2jcB/YCHImG+Dv1kDIXwn3tuQ78JRiQWUONiqa5WgXc0cDwQahModeKBQRq
 QY38fIOc0LkatFFOd/TcffgV4SXkXChcWjgVtKVQec6LfNt+Pta2ALv3FRZWSo/Hq8Qp
 oRAwP55sPHMyyrSa3p6nA03exhKoc8zwnEW9gT0bgg2S/KZq4bJMEwMhgxHUOtg4+L4q
 J4Nf3Ok1fgmxE4TQPwPkg4XoMyo9blgd/PbRdKDclkNX0wpej9DmhyWO1O37l/ec8c+N
 bFZAodKKwgHnVED9uEQjwzIflcC9JMr1maS2AYeAqY5Dt/jQdfxjD+0MtBcbGNVtP4qX
 scjg==
X-Gm-Message-State: ACgBeo2aIC6CidUZ9Gq4fZaOVZuTHwZQ7OjXyXghdrAX6qQiGnbBOcaN
 2SvzEy9bJsI46pmzBOMp9u8=
X-Google-Smtp-Source: AA6agR6O4owm7ZLvvr10Jg+0Qa1Cn4ZvQcTZ/9lEDTu9z3VlZouQN1mdGcpPmr1rOUR/OOXs6sNb3g==
X-Received: by 2002:a05:6000:2c6:b0:222:411:a934 with SMTP id
 o6-20020a05600002c600b002220411a934mr4067190wry.155.1660386990870; 
 Sat, 13 Aug 2022 03:36:30 -0700 (PDT)
Received: from elementary ([94.73.32.249]) by smtp.gmail.com with ESMTPSA id
 c3-20020adffb43000000b00222d512d96asm1725763wrs.75.2022.08.13.03.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 03:36:30 -0700 (PDT)
Date: Sat, 13 Aug 2022 12:36:19 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Daniel Latypov <dlatypov@google.com>
Subject: Re: [PATCH v2 4/4] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb565()
Message-ID: <20220813103619.GA12453@elementary>
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
 <20220709115837.560877-5-jose.exposito89@gmail.com>
 <CABVgOSmhOBdXPH_=B_WRcUjMGC-wVPTLBwCdbgZLb0o3-O8pKw@mail.gmail.com>
 <20220717170054.GA1028249@elementary>
 <CAGS_qxqqsLQ-aCfZHTJbYqb3e21hNSzobAmsZNN_QETXExwQ+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGS_qxqqsLQ-aCfZHTJbYqb3e21hNSzobAmsZNN_QETXExwQ+A@mail.gmail.com>
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
Cc: magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 David Gow <davidgow@google.com>, Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 09:41:18AM -0700, Daniel Latypov wrote:
> On Sun, Jul 17, 2022 at 10:01 AM José Expósito
> <jose.exposito89@gmail.com> wrote:
> >
> > José Expósito <jose.exposito89@gmail.com> wrote:
> > > I already fixed the warning and added the reviewed by tags, however, I
> > > noticed that rebasing the series on the latest drm-misc-next show this
> > > error:
> > > [...]
> >
> > Sorry for the extra email. I forgot to mention that the error is only
> > present in UML. Running in other architectures works as expected.
> > Tested on x86_64 and PowerPC.
> 
> Can you take a look at the raw output?
> 
> It would be .kunit/test.log (or replace .kunit with w/e --build_dir
> you're using).
> You could also run the test with --raw_output to have kunit.py print
> that out instead.
> We might want to compare the output on UML vs x86 and see what looks suspicious.
> 
> These errors
>   [ERROR] Test: xrgb8888_to_rgb332_test: missing subtest result line!
> means that kunit.py can't parse the KTAP output.
> 
> It could be that the output is mangled for some reason.
> I recall running into a UML-specific issue with output mangling on an
> old kernel fork. I doubt it's related to this one, but it shows that
> it's possible there could be something going on.
> 
> -Daniel

Hi!

Sorry for not clarifying the error in this thread.
I fixed it in v3 (already merged).

The issue was in my implementation. I was overwriting a few bytes of
memory due to an out of bounds bug. Thanks to the crash I mentioned,
I detected it before the code got merged.

Thanks a lot for the pointers Daniel, the next time I'll check
.kunit/test.log for usefull information.

Jose
