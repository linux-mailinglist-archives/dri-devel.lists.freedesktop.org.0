Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE393DCA79
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 09:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0768A6E8ED;
	Sun,  1 Aug 2021 07:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FCB6E9AB
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 00:48:58 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id y9so16135177iox.2
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 17:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dIcKvSDUxKhGQLJXFjHOTdn0zd4fY2Y+EtuO71E/gQw=;
 b=PtfYOsTDptsYy0YIEKDi64pNVZlu86W9/g3MGWNO9D4F0+kSIkJTZx51cIq/pAIPry
 FGLT3O2GOQByLQ/TZ7jCdA90M2IYoEoQ80inY+/mWzFZFqxzRUAtzHOVabEGyYaA/weC
 Ra+RFN80VoBK1uzt+PtmaFaeyU8hMO2aXDsGIENuSfmLt9ajY3KcOtEgiDFASb6VnCnX
 NefCtlsCttcKDS71HfPA2CVQnRMsevxLMBVLtHBYWfBvq87e0xM9ZtI6HGDR84QYf88R
 DYWKqz7RRnkJccRlrZDo/dMm9CWjJFlFwjU5+oew+qOuAiXFF8SeRHeUT6ELFMT3pmAR
 mhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dIcKvSDUxKhGQLJXFjHOTdn0zd4fY2Y+EtuO71E/gQw=;
 b=iPfLFyxNF+kVIc7TjDk5T/1kAwzCbrZzatXmc6Z4Pqyx+qoxw9mo4rftNCH5XniHil
 699OTt4oQpXP3tTFMOT+hwofzMsJs/vhAVKQeLHHqnBC33/2Hjlvb9n9Yp0Qe1Vgg3fb
 lb1ctqFTVRzQLxLOB13PoaZEmLBwLvWHQc+UhvmJgJSoo+7TnMw3+aSfTu2XvjF/l0EQ
 /1pC/Ijkba3x0FSpcVNfPxjSqD1sROIpcnu37bjJeyzaQ+Gmhks2QEyNhXNKc2SMMHLy
 aUNi8abasi2tswC3+DvXUgpbNJW9p77H6YwFv5OI/1p/Y3s7miV82uScWf20NF/bTOXT
 ZEhQ==
X-Gm-Message-State: AOAM531kkhyP2D1zJYLQrIMVtRwxf0/RTwVbXmQ/HeGp6d3BqBpTCAuy
 21azHV9PUDw3EQPQ+09yDhHVtTmPZ0pVDO0BRFk=
X-Google-Smtp-Source: ABdhPJy6l5NQD1s1nsQCCad4HUdJ1fLYJkA3RRZGX5nEjYID7/ogMW80Fv49iGIGOGYA1cjXJq6cyMw6hS6YEGByPqU=
X-Received: by 2002:a5d:8541:: with SMTP id b1mr2090135ios.105.1627778938146; 
 Sat, 31 Jul 2021 17:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210730121310.131-1-alistair@alistair23.me>
 <YQWV54S1nkJdcgce@ravnborg.org>
In-Reply-To: <YQWV54S1nkJdcgce@ravnborg.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 1 Aug 2021 10:48:31 +1000
Message-ID: <CAKmqyKM2CRfP_jKXUPEWQS0vCBLf0bVBQ1EE4gBer_F8Nv=A4A@mail.gmail.com>
Subject: Re: [PATCH v5] drm/panel: Add support for E Ink VB3300-KCA
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, 
 Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Palmer <daniel@0x0f.com>, 
 linux@rempel-privat.de, kuninori.morimoto.gx@renesas.com, 
 max.Merchel@tq-group.com, geert+renesas@glider.be, airlied@linux.ie, 
 Daniel Vetter <daniel@ffwll.ch>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 01 Aug 2021 07:07:10 +0000
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

On Sun, Aug 1, 2021 at 4:26 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Alistair,
>
> On Fri, Jul 30, 2021 at 10:13:10PM +1000, Alistair Francis wrote:
> > Add support for the 10.3" E Ink panel described at:
> > https://www.eink.com/product.html?type=productdetail&id=7
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > Acked-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> > v5:
> >  - Add .connector_type
>
> I missed this revision before sending my last mail.
> I tried to apply this patch but every patch confliced due to other
> changes since the kernel this is based on.
>
> I need you to generate a new patch on top of drm-misc-next,
> or as an alternative on top of linux-next.
> You are in a much better position to do this right than I am.
>
> Sorry for the troubles!

No worries! Just sent a v6 rebased on linux-next.

I am never sure if my patches should be based on master or linux-next.
Sorry for the conflicts.

Alistair
