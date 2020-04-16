Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929B11AC7DD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 17:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4F16E072;
	Thu, 16 Apr 2020 15:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353DB6E072
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:00:31 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D913922242
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587049231;
 bh=DVcIcut7V8paBS+JSMimRiqrzi7YftlnrdpavTLLfdc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lPFn2FOFnFW/tzSX7zfrXKhkEs8QM3SsJoABJnQU6IFbuSVCwp8wAJqhzJxZlFYOS
 z90+f9pt+q6RBJS+uKchjREkwJJFJp5DE/yfoMrC021YM9ac1B3spN/uFwDVarkx0D
 9ZiP3sClmqX1vo19x80BEEl7bPiERZmtlQiO76K8=
Received: by mail-qk1-f177.google.com with SMTP id x66so21541216qkd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:00:30 -0700 (PDT)
X-Gm-Message-State: AGi0PuY6DewTejVZAvSceTn4sJG2o0X+021TbEDwKAH1+w0VrWYYpBou
 yLdmJD7C6D8gNRutc+hSAgSUarCYLWTGXNJJYQ==
X-Google-Smtp-Source: APiQypKPhjbIeooeQYaUl6m3o9DMQW69zKClSMYNoqd74zUzs7XT0VwRkFAbT8bmKqcEzIOmejAor15Wc827RuYfn58=
X-Received: by 2002:a37:7dc6:: with SMTP id
 y189mr33559835qkc.223.1587049229890; 
 Thu, 16 Apr 2020 08:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-3-sam@ravnborg.org>
 <CACRpkdYVY7eqrWctUm2GzzZ=1y9Cznya8HUYTDco2bA8Z9Hq1Q@mail.gmail.com>
In-Reply-To: <CACRpkdYVY7eqrWctUm2GzzZ=1y9Cznya8HUYTDco2bA8Z9Hq1Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Apr 2020 10:00:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL5A5rXSM+RmA3Rw9Jg+TBzhzJLF74L_Pzr9u36-+CjEw@mail.gmail.com>
Message-ID: <CAL_JsqL5A5rXSM+RmA3Rw9Jg+TBzhzJLF74L_Pzr9u36-+CjEw@mail.gmail.com>
Subject: Re: [PATCH v2 02/36] dt-bindings: display: look for dsi* nodes in
 dsi-controller
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 6:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Apr 8, 2020 at 9:51 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> > Rob wrote:
> >
> >     Uhhh, it's looking for dsi-controller(@.*)? which is not the common
> >     case found in dts files. We should fix that to dsi(@.*)?.
> >
> > See: https://lore.kernel.org/dri-devel/20200319032222.GK29911@bogus/
> >
> > Fix it.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
>
> I think I was instructed to use dsi-controller@ at some point but I
> suppose it was a misunderstanding.

Probably my fault. We've been nice and inconsistent on naming
patterns. I always have to double check whether it is
'gpio-controller@' or 'gpio@'... The answer is always whatever has the
most hits in dts files.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
