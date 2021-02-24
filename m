Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2240732426F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 17:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0D36EB0A;
	Wed, 24 Feb 2021 16:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10F36EB03;
 Wed, 24 Feb 2021 16:48:50 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id e7so2284619ile.7;
 Wed, 24 Feb 2021 08:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HO9QYoqevB/hV3YnbfJjP+5BTson4nrP52gAAP7I09Y=;
 b=HowBCv2QrRQna3N54zKJcHnk6Sx+FCGiH5PcJF873Q1ONDCQ2yb8xuFCpNRCBK8V6d
 UrrR0kBuD7nkLHHfhF5FioSIHxaY28Q4XxyPeT8AnmZ+0FMsNeIT/xh7IhTGRu8Q4zw5
 97/nkF0ZASgsxvkyJFV+byHMtQZsIDq+3/QPIYTqtOaLR2tgbtMxuKgO5p3mj/NDEsdG
 xRfo87Pyl54HSRLSqAM5k0iGM7I+oQGm/ZgsH28OOEuwexkSqrbryJofSWfqFrbEC6At
 9NwIsMf272b33mN3XSwGEFr/URpzI9L+/B3Ncr/b+WwyqbV/OCyFNrqFBYQL3yigr/nI
 KbsA==
X-Gm-Message-State: AOAM5309GLzmdaeI0m2b+Hp0lImZ3u3qBqhkAIX/jJ6uVAV91rh9RVbe
 ju3CKYu7wBdW/zmLqRbt33Rk43iiMO/IuGaJFmIDG8Bkngs=
X-Google-Smtp-Source: ABdhPJwjax1KJ89w6eZv7wJIRq3ylu6cYjwXKngPJG/49cn6H+kF3/OmLh5hPglwyZbhAq6CmM30nH03NcaF+erqKY4=
X-Received: by 2002:a05:6e02:1848:: with SMTP id
 b8mr24584146ilv.210.1614185330032; 
 Wed, 24 Feb 2021 08:48:50 -0800 (PST)
MIME-Version: 1.0
References: <20210119015415.2511028-2-lyude@redhat.com>
 <YDUN+Re/alMVL0Zn@pflmari>
 <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
 <YDUg/9fjsvTkRUqr@pflmari>
 <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
 <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
In-Reply-To: <YDaAQts9LIb5h3xd@pflmari>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 24 Feb 2021 11:48:39 -0500
Message-ID: <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
To: Alex Riesen <alexander.riesen@cetitec.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 24, 2021 at 11:35 AM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
> Ilia Mirkin, Wed, Feb 24, 2021 16:10:57 +0100:
> > The fact that you're getting lines with modetest means there's
> > something wrong with 256x256. What if you do 128x128 -- does that work
> > OK?
>
> Yes. Unfortunately in both cases.

Just to be crystal clear -- are you saying that 128x128 works or does
not work? (You said "yes", which would imply it works OK, but then you
said both cases, which would imply doesn't work since 256x256 doesn't
work?)

Thanks,

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
