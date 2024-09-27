Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D342298805D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B12010EC4D;
	Fri, 27 Sep 2024 08:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VxwCa7ya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D6310EC4D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 08:35:35 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6d6a3ab427aso15387407b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 01:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727426134; x=1728030934; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5XUd7Nnduy5xO4AHIf3r18vL5fGi0trQPBiW3OSmV8o=;
 b=VxwCa7yawjT1FPkxuWrCL0WOSrmY8en6UBw4OdLQVYkhMy1B4ypFJJngCvcSJpGcZi
 wg7bQgixjdWSU5KMhB4K7Jes93yHyVOc8z1oyTcBkLt0tcrHWIG22DTXCH7Wy1XB2Ixo
 PjfQrgyUZM9ItefQ9jzadoG7H4Cwct+hXH8/99XEVUDkvAjHGh/XLtBVOjB7ZLMqRER4
 ELIjVdAkCyd2cqsFKdE2O2vFf+DNElW9x/jsGAvDZ50pnUvlODtotnXnZcG9wBbKTXcp
 D/hXBaD/lszyid/pHiH+anVsuesc5eQ4gV6s5W9J80NvsRcIEK3HHuASlfDJj3suUJRr
 s8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727426134; x=1728030934;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5XUd7Nnduy5xO4AHIf3r18vL5fGi0trQPBiW3OSmV8o=;
 b=uyRvnQBQruWC3leKHQtq4utnGIavAU2oq1eyU0Phym8xGa+fgRHFcYkccbPFpsM/PV
 4KMljD3ikAyk0dHmqSHO98Cn8O/U6sXHkTf0hX+G9phtTJSDKNqu/7/D4lk2LWaKkS8A
 yo8Zl7t68rQ2/v/UefQk5M2XZoiYcA5B09mFYIh+EdPVfZWX2q0/arVQEJz1NX6+QoH1
 Qjcc+6CikOt8IRdy5pkB1Q6NwZg4Kqi03uOg/I4nxZ8p/bTERO17S2aoTP1BERj9NXIa
 Bm6ey0if/jZ1yduz+/LMgl4AtvoRNqwBkUcQEm/G8u0a8JACyNEScV/gq2JpgQgDS6LV
 nZEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV/JpIidR5fDynfW/sveRH+qhghPrHnGhL71E2cjIco9H3PtwqIWXUknezDb32IIB6Bs/4n+Ia06I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymbCKfyJMgYiRqiReMSEDtEn69RiPd6dlSpAGrzgWhplYkQtu2
 irdvACcIhoBH/8XIgWnVY3HxOY1vj0zFJuFKuF4gES+zIIw5UwIemIa5Ym23f6XdXj2j0zzVkBk
 Uhg9jCJ2+SqagwGgQEItNWCvJrNrEMRNOFlvwNw==
X-Google-Smtp-Source: AGHT+IEzctUgceHZg4s1ya4eisdGWijfQ2geGrfzjwHBvsz5NThuPVpdViA25Blq+a4ULU8aoTtsMQvkxd9ludS0ckU=
X-Received: by 2002:a05:690c:660b:b0:6e2:1467:17c0 with SMTP id
 00721157ae682-6e24751a2d1mr19773607b3.8.1727426134592; Fri, 27 Sep 2024
 01:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com>
 <34mewzvfyjsvyud3lzy6swxs7sr64xkgrbkxtvyw3czvoerct7@7guo32ehwa52>
 <5a540bdb-e3ca-494a-b68d-8f81f4d1cc1a@ideasonboard.com>
 <il3s26owmtyf3knniv7klkmw3uuz4dffrump7jo47dk6hxdsya@v5plmtjcbukf>
 <bed619c7-1a82-4328-825c-117c2ee3639d@ideasonboard.com>
In-Reply-To: <bed619c7-1a82-4328-825c-117c2ee3639d@ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Sep 2024 10:35:25 +0200
Message-ID: <CAA8EJprDdst-mcwMsWs=0AHGCNa_5Ng90tubSJ7VAHamx2T93g@mail.gmail.com>
Subject: Re: fw_devlinks preventing a panel driver from probing
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Saravana Kannan <saravanak@google.com>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>
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

On Fri, 27 Sept 2024 at 08:41, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 27/09/2024 02:26, Dmitry Baryshkov wrote:
> > On Thu, Sep 26, 2024 at 02:52:35PM GMT, Tomi Valkeinen wrote:
> >> Hi,
> >>
> >> On 21/09/2024 23:15, Dmitry Baryshkov wrote:
> >>> On Mon, Sep 16, 2024 at 02:51:57PM GMT, Tomi Valkeinen wrote:
> >>>> Hi,
> >>>>
> >>>> We have an issue where two devices have dependencies to each other,
> >>>> according to drivers/base/core.c's fw_devlinks, and this prevents them from
> >>>> probing. I've been adding debugging to the core.c, but so far I don't quite
> >>>> grasp the issue, so I thought to ask. Maybe someone can instantly say that
> >>>> this just won't work...
> >>>
> >>> Well, just 2c from my side. I consider that fw_devlink adds devlinks for
> >>> of-graph nodes to be a bug. It doesn't know about the actual direction
> >>> of dependencies between corresponding devices or about the actual
> >>> relationship between drivers. It results in a loop which is then broken
> >>> in some way. Sometimes this works. Sometimes it doesn't. Sometimes this
> >>> hides actual dependencies between devices. I tried reverting offending
> >>> parts of devlink, but this attempt failed.
> >>
> >> I was also wondering about this. The of-graphs are always two-way links, so
> >> the system must always mark them as a cycle. But perhaps there are other
> >> benefits in the devlinks than dependency handling?
> >>
> >>>> If I understand the fw_devlink code correctly, in a normal case the links
> >>>> formed with media graphs are marked as a cycle (FWLINK_FLAG_CYCLE), and then
> >>>> ignored as far as probing goes.
> >>>>
> >>>> What we see here is that when using a single-link OLDI panel, the panel
> >>>> driver's probe never gets called, as it depends on the OLDI, and the link
> >>>> between the panel and the OLDI is not a cycle.
> >>>
> >>> I think in your case you should be able to fix the issue by using the
> >>> FWNODE_FLAG_NOT_DEVICE, which is intented to be used in such cases. You
> >>
> >> How would I go using FWNODE_FLAG_NOT_DEVICE? Won't this only make a
> >> difference if the flag is there at early stage when the linux devices are
> >> being created? I think it's too late if I set the flag when the dss driver
> >> is being probed.
> >
> > I think you have the NOT_DEVICE case as the DSS device corresponds to
> > the parent of your OLDI nodes. There is no device which corresponds to
> > the oldi@0 / oldi@1 device nodes (which contain corresponding port
> > nodes).
>
> Do you mean that I should already see FWNODE_FLAG_NOT_DEVICE set in the
> fwnode?

No, I think you should set it for you DSS links. If I understand
correctly, this should prevent fwdevlink from waiting on the OLDI to
materialize as a device.
Note: my understanding is based on a quick roaming through the code
some time ago.

>
> If I print information about the relevant fwnodes (from dss up to the
> oldi endpoints) in the DSS driver's probe, I see that none have
> FWNODE_FLAG_NOT_DEVICE set, all have FWNODE_FLAG_LINKS_ADDED set, and
> only the main DSS node has the fwnode->dev set (to 30200000.dss).
>
>   Tomi
>
> >>
> >>> have a dependency on DT node which doesn't have backing device.
> >>
> >> Well, there is a backing device, the DSS. But if you mean that the system at
> >> the moment cannot figure out that there is a backing device, then true.
> >
>


-- 
With best wishes
Dmitry
