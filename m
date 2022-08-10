Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF1B58F09A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F4010FC49;
	Wed, 10 Aug 2022 16:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D52F112E65
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 16:41:45 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x19so13730150lfq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=IboOlRmkttx834Bl91hUxolhlCg7lfoSCMSCS2p/U0k=;
 b=IHIfCGGqkNbEP24ylvFw7WsvsOXR9bN3DKWRU/gGHfevmOOUx7Wmgl3UZ5XBLAmAAc
 8l30WDp+ajTAJ3AXbT1BYhjgIop+o6VtXEqFeLy3zjMrtj+cF4wBv9A4fh9Ul1KeHXrI
 c6nnrm9Ys+9Z0Cz9/jbBxzrE93uCAnvVeD15H2oV19A66UH1MmBGRAsE6piRmmvF+FH3
 8L6ARDFbnfjMU1UOQV5d+8PUcOqJvZFTF/AMQez8MhJr3uySjEh4wJUhWDcXN+u+/nAj
 dZDk6swzcgt89/iIVoddm+yLaLZgDlFOA6OzicnmlkeYOoeJGbdSikVH6M7kErVKpcQv
 /dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=IboOlRmkttx834Bl91hUxolhlCg7lfoSCMSCS2p/U0k=;
 b=Q8TI+qR5Fh3nKfDe/y4jJD0G0fLiU1AMsrLnf5+Y+StDrD4y2cf7Le1GXgSykDiVl4
 3Kwey5HyKUqIQt3blQorvo94rwjVoJAhtZzNGG7ioHAQpO6TNIEuxP+paewP+6OcRKMG
 MHqWXpjAIvyJnzPhhkmg/YsCO7nHmugLAVppGQ6uGwgm6psOCak8iK4cxRfuUgwgC/4p
 ElIdJ4dbC+4t7FzM6AcQfloTUmwPk+BfX3emihzgLVlsXeAQ7zjiZTfOt2V47CVUNN14
 nhupKQdIdkEoh3XWMi2BXnhsRKsTkWFGrQCn9ShBSGxQ393ap/ZqfHbRnh5i1DqU7wtk
 Z6uw==
X-Gm-Message-State: ACgBeo2uXy/bxqYMxIam9qIMCz37YLiZzPg/rQQquNmLbNQRHIOxconP
 ApX77ak3oP9kC690qqRPvh5fkvqSbIjmFIb+xWH8XyHKrJNenA==
X-Google-Smtp-Source: AA6agR7WOzfuKIJOAsH+/Ea7ziF0uJfqoTF8MsUll/UBw5AXR9ENEiQu36r7CNYitAm+4Jj6oSj6WL6ZDT1kyS+uuh0=
X-Received: by 2002:a17:907:3e21:b0:730:92bb:7fcd with SMTP id
 hp33-20020a1709073e2100b0073092bb7fcdmr20734969ejc.170.1660149689636; Wed, 10
 Aug 2022 09:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
 <20220709115837.560877-5-jose.exposito89@gmail.com>
 <CABVgOSmhOBdXPH_=B_WRcUjMGC-wVPTLBwCdbgZLb0o3-O8pKw@mail.gmail.com>
 <20220717170054.GA1028249@elementary>
In-Reply-To: <20220717170054.GA1028249@elementary>
From: Daniel Latypov <dlatypov@google.com>
Date: Wed, 10 Aug 2022 09:41:18 -0700
Message-ID: <CAGS_qxqqsLQ-aCfZHTJbYqb3e21hNSzobAmsZNN_QETXExwQ+A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb565()
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 David Gow <davidgow@google.com>, Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 17, 2022 at 10:01 AM Jos=C3=A9 Exp=C3=B3sito
<jose.exposito89@gmail.com> wrote:
>
> Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com> wrote:
> > I already fixed the warning and added the reviewed by tags, however, I
> > noticed that rebasing the series on the latest drm-misc-next show this
> > error:
> > [...]
>
> Sorry for the extra email. I forgot to mention that the error is only
> present in UML. Running in other architectures works as expected.
> Tested on x86_64 and PowerPC.

Can you take a look at the raw output?

It would be .kunit/test.log (or replace .kunit with w/e --build_dir
you're using).
You could also run the test with --raw_output to have kunit.py print
that out instead.
We might want to compare the output on UML vs x86 and see what looks suspic=
ious.

These errors
  [ERROR] Test: xrgb8888_to_rgb332_test: missing subtest result line!
means that kunit.py can't parse the KTAP output.

It could be that the output is mangled for some reason.
I recall running into a UML-specific issue with output mangling on an
old kernel fork. I doubt it's related to this one, but it shows that
it's possible there could be something going on.

-Daniel
