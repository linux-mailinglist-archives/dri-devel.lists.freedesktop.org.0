Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB69473E49
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 09:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADD810EA38;
	Tue, 14 Dec 2021 08:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708AA10EA38
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 08:37:41 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id m186so16157562qkb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 00:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V775Jo7foyl5u33KO9wxNFO5Xpg512uth3xPug6/f9Y=;
 b=NmsmnUQjon4giEIPURXak6DNfz2uv3mxLeDEiVc8iUJV+WQGHo0oIywd2C3DSI4pVI
 4GuYtTQuyOG7798S3lnZcHyrILmqUoL50dlmbyCyTixojp/IGFP2EkTyKQgP170Pl3hq
 3ZZTfp+NvlUjYXYlRC9z5TqZF86aF2Zr51JO3mvpkOaTvBpEAUi9RCW9TtSQfOeQOXhx
 iHPWUKKEP3loANy/6Y5EPGU4/Y/NvufewNugTqqrzYw8tHGKjsES4Pu9OaWA58l7LcZH
 8iUJjaT1SIRs1kDZ/7XPmBNEpbbLyESohomuDZ8Ply7kroWO48ooXLGjptuR/AuMiHbM
 Rk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V775Jo7foyl5u33KO9wxNFO5Xpg512uth3xPug6/f9Y=;
 b=AlSEwXxP06sXOio3krdeM0qZ56SIwChZb8CemDibVO67lDenyohlJz7LPt5pX5V7bd
 dUMDESP1UlcpuqA3dQE+cEPPgCzf0hiWzviVTCBvk8Y9Vibm5xDmvv7dL9DD8BMyOROq
 FWr8RTK5ypDSFVX+DmxVgsQG+P/5xnKT3q8IUPqOH8F5YV+CITDHw8rkwA02Wes1t6fh
 JP97YyMhWNqQLbXHDFbDsTbn1lzCG7TgmTHYu9YznUvXWcrT0rXOPOU4WNw/XBz73Ark
 8a3U8elWlYfCkA19OQAwRaA3IbsEbZtV4R5HDPOjNeRsYK3o/ltmbSKV1Ji0KvOu57T0
 HcFQ==
X-Gm-Message-State: AOAM531BtQ7vUgySqvBFNk9Ls7pEbpkojmtIJsqKlttlRhfLeYTcUVZk
 SIse5TjTt6qSzvHBg13c+fy8kgRfimXEsQtNGfH9+Q==
X-Google-Smtp-Source: ABdhPJwTLF1AMEeFod/l2CxZZeOst/LaOVrIJybQJ5YF/RyGQnZ4Krjx2+P/GvWwxeDL73OopPshCk3YG/laGaGdXjg=
X-Received: by 2002:a05:620a:298a:: with SMTP id
 r10mr2844306qkp.447.1639471060440; 
 Tue, 14 Dec 2021 00:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20211212062407.138309-1-marcan@marcan.st>
 <20211212062407.138309-2-marcan@marcan.st>
 <CABxcv=m4fu8h=FwY7R=thuvd13_ZbFqB9rNNN07QOAd__jdYSQ@mail.gmail.com>
 <63334964-d63d-7625-e46f-a6e6ec19e908@marcan.st>
 <CABxcv=kbR5GX3yEfqchKJPkCqpWp_oKWjG=pu7LikBwoSX8W3A@mail.gmail.com>
 <CAL_JsqLLTL-_H3XgsZRZaxE6qO6y8CDpoHfDkOgwekb1ysNQFw@mail.gmail.com>
In-Reply-To: <CAL_JsqLLTL-_H3XgsZRZaxE6qO6y8CDpoHfDkOgwekb1ysNQFw@mail.gmail.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Tue, 14 Dec 2021 09:37:29 +0100
Message-ID: <CABxcv=nFx9r+=qMXop6kp6E4KoXaX_8duLY7S9fo6uqs_539jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
To: Rob Herring <robh+dt@kernel.org>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Hector Martin <marcan@marcan.st>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 3:50 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Dec 13, 2021 at 5:30 AM Javier Martinez Canillas
> <javier@dowhile0.org> wrote:

[snip]

> >
> > You are right that passing NULL is a safe code path for now due the
> > of_device_is_available(node) check, but that seems fragile to me since
> > just adding a similar debug output to of_platform_device_create()
> > could trigger the NULL pointer dereference.
>
> All/most DT functions work with a NULL node ptr, so why should this
> one be different?
>

If you are OK with the patch as is, then I won't object :)

> Rob

Best regards,
Javier
