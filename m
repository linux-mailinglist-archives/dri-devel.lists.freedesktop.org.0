Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD8D174160
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 22:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2E56F4D6;
	Fri, 28 Feb 2020 21:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB9D6E11F;
 Fri, 28 Feb 2020 21:21:00 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id s24so5073922iog.5;
 Fri, 28 Feb 2020 13:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fPoBvQNAORE4S2A5a1hc57dFFkQBl9Ikx0sIm1zcCOk=;
 b=fiw7RdMd6k7oM8JegLJKmL5Zlw1tDDkSuP7lZ2+cPwtDrrOBlDSX1O/nx3cB/pB1Qw
 59FO8IdLrwVjxQDMD25uvYJOfNAyH+4+dlnU/aTsJM6l9AH0tvdb2cPhdv7FVwATXKaV
 joJvHsT2GtGI6d5DsItTBA3Bd4Gp/REvYkjFj8rdNJhQjtHPIe7kUp52o22YyyHl3wnf
 tg7xkvfkWlIEiaTE5zAvvNCcLrO0nDun5oq5me3h0he1wIxS64ZDB3vj1YLIOzpOmvxv
 PMKxAKPC/6yhJ+PcK9In0gPEDDNzq7geHIPSYZSbjclT4qr7Wd1DGetOtRq9mgd/NJWW
 r7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fPoBvQNAORE4S2A5a1hc57dFFkQBl9Ikx0sIm1zcCOk=;
 b=JtPRBPl4PxW7zwCIypu2P8twHcYRWIDIjbXG8NAJarQ1/1H+y7vVR2LvwGLCY0w9P3
 Miu7W2GB0dCvwvZfnHFmw9HZAb3RJAgz4XB1foR90uvBaXinTUhP+26/w7md88dGx/IT
 /kphGwLG6cYwg4EhV2buVk5duLr3lM9RUYI8Yk4QqQvxuAMQ9W2Xne4YsZ17IAr1+bUI
 zfRjpaaVynhGavUGaQRtA/w2gnvKESpGfLvVt+SclHqe0QKRkqV4RhiZh94PuMqp2elL
 rJl92GcOPkZ4OF5svgY4l4ZU2QuEwwOCm8Kq04uPa/8fJ0lOagB9haDr8xL9FYzkww2h
 Ezwg==
X-Gm-Message-State: APjAAAVkWrMIDfK8j7jmZT0QwOAC9LKXcOcTXzj2W5MyKlZS1ob1Roli
 JsD8e0hAn82zWpL/AwQP24GWjRdDqjzE6fjPDUxBrQ==
X-Google-Smtp-Source: APXvYqx7nDlEFOwGS0EHgvvJcG8iAZ2SD0qjt3ceWYnjM9r0ncVtqXu5h6EQzEkWXNGZYL4vC+NSWcdM30BQb+RglwU=
X-Received: by 2002:a5e:d614:: with SMTP id w20mr4871201iom.278.1582924860037; 
 Fri, 28 Feb 2020 13:21:00 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAEdQ38Hr-L6rg80Gf18QNM7eK-QDK0BBU-9tChT6VxrP+T4qCw@mail.gmail.com>
 <CAPj87rOhwLPGHaHvPrZ6j8zufO8VqiwNFoBGFjx95yHr3cBm3Q@mail.gmail.com>
In-Reply-To: <CAPj87rOhwLPGHaHvPrZ6j8zufO8VqiwNFoBGFjx95yHr3cBm3Q@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 28 Feb 2020 13:20:47 -0800
Message-ID: <CAEdQ38EQCgGjNAYiuWqZWBfeL-uUjzE40gm9a20HSQgizhjrgw@mail.gmail.com>
Subject: Re: gitlab.fd.o financial situation and impact on services
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 gstreamer-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 12:00 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi Matt,
>
> On Thu, 27 Feb 2020 at 23:45, Matt Turner <mattst88@gmail.com> wrote:
> > We're paying 75K USD for the bandwidth to transfer data from the
> > GitLab cloud instance. i.e., for viewing the https site, for
> > cloning/updating git repos, and for downloading CI artifacts/images to
> > the testing machines (AFAIU).
>
> I believe that in January, we had $2082 of network cost (almost
> entirely egress; ingress is basically free) and $1750 of cloud-storage
> cost (almost all of which was download). That's based on 16TB of
> cloud-storage (CI artifacts, container images, file uploads, Git LFS)
> egress and 17.9TB of other egress (the web service itself, repo
> activity). Projecting that out gives us roughly $45k of network
> activity alone, so it looks like this figure is based on a projected
> increase of ~50%.
>
> The actual compute capacity is closer to $1150/month.

Could we have the full GCP bill posted?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
