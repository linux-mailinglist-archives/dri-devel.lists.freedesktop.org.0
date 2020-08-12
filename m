Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C02242733
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 11:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757486E2C4;
	Wed, 12 Aug 2020 09:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127606E2B4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 09:09:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t6so1383018ljk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FY3s3maREqriezAI0XSi4RMXYCcvv0BPXHDmals4/6M=;
 b=Q57wbOrowTYtxr1anQHxx0lBW2HWmtXxI9cPkMmt9j2D8O8jN2fqlCByUwMz3CncD4
 M5+/o5UCGvGqf+Ja2GyGAHGLz58rayiAE77Bvu2bNxeGHWvlZ2AcC938js3h9lK6d+P9
 j06AleNQ0Kc0CXQUyC+JrZODbXEeCnONOp4A2lKlPyzzNe+3IRNR92xkPyLzI6K2pfh3
 aAX9ZHH4qp/PgXDpjuL0MxVktNWv9h7Ls120D7HEo6aYz0cFC8fc4L1zXGz4pdYeMLzf
 X1pbwWWNBJgM3ofqqinadVsDI4s9gX1sLP4p+7XBaYLciaX95yuS+pI2YxbGfEcJ2xF2
 U7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FY3s3maREqriezAI0XSi4RMXYCcvv0BPXHDmals4/6M=;
 b=BFc3nKWs2xc8YjQ2bFJrABMZK+VGAZQeRhCD9mvx6FFj14nDI6EswuM5K25VyoJ+vC
 YFUfSClq6JPJ6+1roHqt+qfZGw9ji/vRzo/8gK/cKtJwIW1VsdDGnHd2DnJ5HPXUb/cg
 VjNdMw3izIFnslwXyG3B/Kc6Ttrq0ONr6U59VzX7jAI+jRZoSnGVC5oKw+Nh7TGUdqpS
 NCCcSpCQiHaiLbthsCkcAeMuIanDUhSliX2GvnWGRewmZGVMaOeXOjY8Vftxf+zSosLi
 H7M9Y5pq3Z0/GjSNVxf4KvZTx15QaUKdIFNiQ7P+/bQMY2KiPMJy+ujhnzfWBJd9o2rO
 2saQ==
X-Gm-Message-State: AOAM531YSLs0gvuoiykEbE9XC6K1E83evcAs69ofMs6urVJoBKkzZtFz
 fspuWjupRovRPqukm+c/iJMgIMTIWG9pxCGwnrr6BA==
X-Google-Smtp-Source: ABdhPJwk3HeAScHDHyqAL6rzVjK90mHBIkeel3C16tOuoxFFvERp8sKFXIkkmblpmQ+SXrfuD2s2ooieJ3igNrOfAAc=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr5087144ljb.283.1597223396558; 
 Wed, 12 Aug 2020 02:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200720203506.3883129-1-linus.walleij@linaro.org>
 <20200721083228.GA283099@ravnborg.org>
 <CACRpkdbuihAwvsx4QmV6PnVM5aDFMiaR9h-8aBF8EzXRGZ1XNA@mail.gmail.com>
 <20200812073454.GA584918@ravnborg.org>
In-Reply-To: <20200812073454.GA584918@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Aug 2020 11:09:45 +0200
Message-ID: <CACRpkdbFf7ZTwNt5_DCd1nYWqeUnnY8HPJMakJ9UVwkfBtjRoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2 v1] dt-bindings: backlight: Add Kinetic KTD253 bindings
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 9:34 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hmm, I think I looked at leds/ when I wrote that comment about
> common.yaml.
>
> Please consider Rob's comment in commit: 44e1655a444fe7a1bd81994d34c6bbb5245b9e60
> ("dt-bindings: backlight: Convert common backlight bindings to DT
> schema")
>
> Rob did not see the need for a common binding - but that may change as
> we add more backlight bindings.

It can't hurt. The proposal is out there, there are some drivers in
backlight that can readily be converted to use it if it is favored.

Thanks!
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
