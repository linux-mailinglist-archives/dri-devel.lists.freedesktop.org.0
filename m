Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6801FA2B7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 23:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22AA6E511;
	Mon, 15 Jun 2020 21:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B486E511
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 21:24:08 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id q2so10229718vsr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 14:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mdu8X+Q7CqBtC/GLB2icKvUv+XOLxvfh0ORFA3IvD2U=;
 b=dhc1djqDcafE5BR0hNJ7YzYzE0xG3+kRVdlEAA7+5Vdy6rvya4U5eD/OBiqQr6yaIb
 Q69HGbizyWmvOvLLVsjD7Re3mYqiTearF3vcfrmfW60mkafC8zGPiSFbm2j6QCwgecoN
 Yv523l9WIBb4DlH+/LOsuq0CY06PDtpr21EjhWj5dsNZdlRozNlfoHGBRGrVpWQyUL7R
 tGoVsWDsKy0v2+7PElbivcnBSfUw4hU4DSQKHdxlJyOxv3oUhzhEOlfK7hUi/iMit4wd
 xbGhOI9Smc6JZeuoo9kFji/zIJRxSUMMPRGv8JbpHvDmSSEC4LgngYJozCG1cWXR5DXp
 p4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mdu8X+Q7CqBtC/GLB2icKvUv+XOLxvfh0ORFA3IvD2U=;
 b=hWppEuFe6D3F/1UAW6nNVOWjH7VIyqdotu56yLZNJmWxSer2H98gKmR4fD5MlaSLk3
 FjbyhZZHhX9CUMBLCNYvag6KvgqDPwFkQ6+g4hKgMXm2vqga7sRz8QTRuLEcTeFCcBMP
 WeczpkXV/9HDu8esQDkrlgKinkAwirk815wzwxcikl7TEeqC0CodYQRMcPgpVMATIFcN
 t004DdW9oUoKpDOjBRrKF/E/NUMrHrGZl8/hmnXMvwdW3cu0NlYEOHTZ1zXfJj5BmjLe
 q04xCYpsvRaTNmsqla1+ExNq6fPY2khmEinbpy41Bmjx6Ju2BqTNe/MaCTPmUAZCewNm
 /c8A==
X-Gm-Message-State: AOAM533GGnd2YelpdJlt5bsfG8sHegHVk36Bk30fIbcC3LeXxofifqhp
 fbUC0esUDykC2imwddLHXQzNciDIYUI8p2rLSLs=
X-Google-Smtp-Source: ABdhPJzXrIs+SUF0pylq1xp8/iremWFjDjUX4s9YS4mC3ANMJzk0FVhHmuVLovqwSKQhHNbapA9FF6FCdnfIK5ySESo=
X-Received: by 2002:a67:b149:: with SMTP id z9mr20148246vsl.85.1592256248206; 
 Mon, 15 Jun 2020 14:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
 <20200610120131.3069-4-matthias.schiffer@ew.tq-group.com>
 <20200610145954.GA135509@ravnborg.org>
 <44d3b82a11fc292f0aa3f60a8ccebd4e8ce5d3e8.camel@ew.tq-group.com>
In-Reply-To: <44d3b82a11fc292f0aa3f60a8ccebd4e8ce5d3e8.camel@ew.tq-group.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 15 Jun 2020 22:20:27 +0100
Message-ID: <CACvgo50UoeCQ7ta0VPCWbskKL+s=C1ADyEz8P9bEtgebYcTZ0Q@mail.gmail.com>
Subject: Re: (EXT) Re: [PATCH 3/4] drm/panel: simple: add CDTech
 S070PWS19HP-FC21 and S070SWV29HG-DC44
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

On Thu, 11 Jun 2020 at 08:54, Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
> On Wed, 2020-06-10 at 16:59 +0200, Sam Ravnborg wrote:
> > On Wed, Jun 10, 2020 at 02:01:30PM +0200, Matthias Schiffer wrote:

> > > +   .vrefresh = 60,
> >
> > .vrefresh is no longer present, please drop.
>
> I based my patches on the branch drm-next of
> https://cgit.freedesktop.org/drm/drm, should I have used a different
> branch?
>
Small tip for the future:

The best way to find the correct tree is to check with the MAINTAINERS
file or via ./scripts/get_maintainer --scm ...

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
