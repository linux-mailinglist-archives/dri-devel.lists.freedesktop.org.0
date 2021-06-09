Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7953A17F7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 16:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923346E1BA;
	Wed,  9 Jun 2021 14:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EC16E059;
 Wed,  9 Jun 2021 14:52:35 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id b14so26279740ilq.7;
 Wed, 09 Jun 2021 07:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g6kmw8K4NVOjfm80qKIii8vlGgWXSA520RlIgHO8Yb4=;
 b=iOygF/OZ+8OUprxAN/JdngI4LKQdwuqUdVRlfb9n7vHGK1GIXrnbhjPR7vOF/VmT4f
 NYt2OLrPlOL/ldX1eadQPdgdJvlwfGjO0NTLTnDAKd8gmiRlVtOBsmqho6j7HiWbMPPA
 NIR6CX9Hi+v7HBIAXAxcfpXOqDsHt81LDkSZagiAhmgg+n/JqX3kL7tldXleoczIjQNU
 X9n9kwx7CepzAbja6N958d9IVDm+iAuAEOsGafY3J4gM+7QG1ZsfcnmyQ5g+jQIhWlUM
 E9TY+P23tLVOIyMKhXRyihNUNJSwBoSCFYBDvzAVyh+NDKkN7RLYOAacDVY00j1ou3hv
 U8NQ==
X-Gm-Message-State: AOAM5338roNX74SFeerWKC/2Kkk0+ZtpVV3hbqsKVpwBhLsUX0IoM+Q2
 1v72EmC+vJirKJemUmBzPxhSDyQpLlAmetnnyyA=
X-Google-Smtp-Source: ABdhPJwOEVIdBD1niBDUdAkWBw+dsLEFdp+UdqONoNjS03w5Wptmn1Ai6NpFrW05sn0t4+Zkq1uUrVf0bg33ef8fqrk=
X-Received: by 2002:a6b:f805:: with SMTP id o5mr22516174ioh.55.1623250354514; 
 Wed, 09 Jun 2021 07:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
 <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
In-Reply-To: <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 9 Jun 2021 10:52:23 -0400
Message-ID: <CAKb7UvjrxXyvr9qpLbkoDQ2eScj4YdayP6OnG8rZnmEn1hyKvw@mail.gmail.com>
Subject: Re: [Nouveau] Trouble with TTM patches w/nouveau in linux-next
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 matthew.auld@intel.com, linux-tegra <linux-tegra@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Christian - potentially relevant is that Tegra doesn't have VRAM at
all -- all GTT (or GART or whatever it's called nowadays). No
fake/stolen VRAM.

Cheers,

  -ilia

On Wed, Jun 9, 2021 at 10:18 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Hi Mikko,
>
> strange sounds like Nouveau was somehow also using the GEM workaround
> for VMWGFX as well.
>
> But -12 means -ENOMEM which doesn't fits into the picture.
>
> I will try with a G710, but if that doesn't yields anything I need some
> more input from you.
>
> Thanks for the report,
> Christian.
>
>
> Am 09.06.21 um 15:47 schrieb Mikko Perttunen:
> > Hi,
> >
> > I'm observing nouveau not initializing recently on linux-next on my
> > Tegra186 Jetson TX2 board. Specifically it looks like BO allocation is
> > failing when initializing the sync subsystem:
> >
> > [   21.858149] nouveau 17000000.gpu: DRM: failed to initialise sync
> > subsystem, -28
> >
> > I have been bisecting and I have found two patches that affect this.
> > Firstly, things first break on
> >
> > d02117f8efaa drm/ttm: remove special handling for non GEM drivers
> >
> > starting to return error code -12. Then, at
> >
> > d79025c7f5e3 drm/ttm: always initialize the full ttm_resource v2
> >
> > the error code changes to the above -28.
> >
> > If I checkout one commit prior to d79025c7f5e3 and revert
> > d02117f8efaa, things work again. There are a bunch of other TTM
> > commits between this and HEAD, so reverting these on top of HEAD
> > doesn't work. However, I checked that both yesterday's and today's
> > nexts are also broken.
> >
> > Thank you,
> > Mikko
> >
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
