Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5351887A6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E8B6E2E8;
	Tue, 17 Mar 2020 14:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D626E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 14:38:44 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i24so22953439eds.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=58E8O3m6t+KgZRbknRUT1fbjtg6lCF8mlzGXozHsZLI=;
 b=BKjx5GxjtPf5TPEDBnuMSgESLn6y4nsg9DPWOCwQKhF3s62lwdV/DxSK8/c5eobv6d
 51rKZiSe3dl6f3w1ru0untIXiQ31rEFO318tRU1KhZy1q44+SNKkurjHT/fVnMI2gUoP
 dPFPdx8DJHdLIolT21N89p5cd6a9wZw4YY+gxIGiFb62syceA83loj687Qdi3O5RXpzv
 WeDVB084vKjwRioNkoGfe6KwW/k+7s2u8Mucso09MzFdOnZbDGxVS/U9b5omgpwsqXKK
 Okdf9OcBUeEFLQssq+XvsUWXOCAplKx04/xuTEm1K1dUNa4U+w3KOSottFFcFvYCkdZR
 fBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=58E8O3m6t+KgZRbknRUT1fbjtg6lCF8mlzGXozHsZLI=;
 b=b0VlyqnHvIJXRxaax4wo2adZTn4ur7EfPh8vPTYYtSvyccuHY67+hke1MBu1SqyAdK
 qjcl+b+tjOE3wTUdowwPYePslnsPdu6FYVcVm5DxzDvgRhPFtsRx1TXnNVWqJ5tbcwqN
 r4bO49RMo8awa+KLY+UhI/QflnvjaQewRRAM5/nMR3TjhOv1zpdNw/y+fTVays/78EWv
 Uygp4al6l6ibcTHKvD52x47kPLwEV78s5OJd98NgYnEmFMAYJZTfyF9tA9JEaWAERx5x
 HI55X7eVGZJJYVE6ipImgRrBqkHLfnDHJAn8ph8CjE1kJhh+wE8cI9oLVdslXiVBa/Po
 wL6Q==
X-Gm-Message-State: ANhLgQ0SBS7nvycX+eaYDksZImmDFf8f7hhRzsHAot5Z1LLLXSkftAY/
 8IWXeJFrACM9bgjedB2JLhDo8oM5FGxLrj3CfbTnEw==
X-Google-Smtp-Source: ADFU+vsFSMTrSBQzzVz0fns2aVhYRgz8om7siPBypK9bv6eKullnoKrCBPCjz8ZdyB5DIdM56eZbTEPZ9DOJmnbIGpg=
X-Received: by 2002:aa7:d64a:: with SMTP id v10mr5738252edr.324.1584455922976; 
 Tue, 17 Mar 2020 07:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com>
 <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
 <CAOFGe94crnBBvjfP=0W3awUrxu+ZZG1_Q3bO03ti6jBckgTf_g@mail.gmail.com>
 <Y9H86RTKcPvmzxnEtxZ13-XX87Y6YIAbA8qSYhDsYVgAKBp8zVlC342pyTaC7JFJr-s9B4jMtfDPz_I2v9D9fYpKaZtpNOl--Brk8aobnSE=@emersion.fr>
In-Reply-To: <Y9H86RTKcPvmzxnEtxZ13-XX87Y6YIAbA8qSYhDsYVgAKBp8zVlC342pyTaC7JFJr-s9B4jMtfDPz_I2v9D9fYpKaZtpNOl--Brk8aobnSE=@emersion.fr>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 17 Mar 2020 09:38:31 -0500
Message-ID: <CAOFGe95joO91aBpZCHf+5TR3JDocrgdiQJ+Qxg1H3J3m+dKPsA@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Simon Ser <contact@emersion.fr>
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>, Tomek Bury <tomek.bury@gmail.com>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 3:01 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Monday, March 16, 2020 5:04 PM, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> > Hopefully, that will provide some motivation for other compositors
> > (kwin, gnome-shell, etc.) because they now have a real user of it in
> > an upstream driver for a major desktop platform and not just a few
> > weston examples. However, someone is going to have to drive the
> > actual development in those compositors. I'd be very happy if more
> > people got involved, :-)
>
> FWIW, a wlroots pull request is in progress [0]. The plan is first to
> accept fence FDs from clients, then send them our fences as a second
> step.

What exactly are the semantics there?  Are you going to somehow wait
inside wlroots for the buffer to be 100% idle or are you expecting the
client to somehow use explicit for sending buffers implicit to wait
for idle?  If it's the latter, that's not going to work.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
