Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C1C147087
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 19:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31E56FE17;
	Thu, 23 Jan 2020 18:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55FE6FE17
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 18:13:43 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A71522522
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 18:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579803223;
 bh=6MqlOLnjfj6n5OQ2aTdf6gU9RHeDhjoyWjb+T9xoTeU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LPohR2SwKeSV+JWcooZYGFKgRx8O4J8cJ7QKXPjwCi8d/t+bkwhnna6hP+yc67xIC
 KEx6Hycn+ucM33GU4wqf0RJeiKYKYemFrbQH7Mix4CktbgC/+iSv3jxhzG+ZN+Tsgp
 e694yKU1BGqMsTobgbi1WI0pLjFU6sETpcy0FoOs=
Received: by mail-qt1-f173.google.com with SMTP id d18so3184015qtj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 10:13:43 -0800 (PST)
X-Gm-Message-State: APjAAAWOog0nFbB6dlP26CeSgeDzOrNapgB1V7GIowg1gDwwO0phxU50
 btBS3Em/0PiWpo8FaCoqExNteM+6R4FwfR5AaA==
X-Google-Smtp-Source: APXvYqzvfTdOzsaxrB3HCvzOLuVxPF28i8nePTrJjljhe1B9g1FVhmdb1LKUEW17DoEzBwPRCMw9/W+jFStAHdPb3J4=
X-Received: by 2002:ac8:6747:: with SMTP id n7mr17304328qtp.224.1579803222465; 
 Thu, 23 Jan 2020 10:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20200119210907.24152-1-robh@kernel.org>
 <20200123175650.GA17233@ravnborg.org>
In-Reply-To: <20200123175650.GA17233@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 23 Jan 2020 12:13:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLsf-YeQfeP3Vc_WRbT5_2T0aDsRpBdD2uL--Xg7ciBTA@mail.gmail.com>
Message-ID: <CAL_JsqLsf-YeQfeP3Vc_WRbT5_2T0aDsRpBdD2uL--Xg7ciBTA@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: display: Convert a bunch of panels to DT
 schema
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 11:56 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Sun, Jan 19, 2020 at 03:09:07PM -0600, Rob Herring wrote:
> > Convert all the 'simple' panels which match the constraints of the
> > common panel-simple.yaml schema. This conversion is based on how the
> > panels are documented. Some may turn out to be more complex once the
> > schema is applied to actual dts files.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Removing this amount of files does not happen every day - it is a good feeling.
> Thanks, applied to drm-misc-next.

My goal in kernel development is to remove more lines than I add. :)
Most conversions are about double the number of lines, so I'm not
doing too well.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
