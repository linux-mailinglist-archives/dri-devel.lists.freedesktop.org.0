Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCC42CADF4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 22:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDC36E02B;
	Tue,  1 Dec 2020 21:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098E16E02B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 21:01:06 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id g23so1050144uan.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 13:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aWYVSLoMbHTMBYXNZeA1jDQCPhRLUCzYMMW57m2xkJc=;
 b=dNmi4nRyPM2wRJRGonutC+zgIyr66kWdax56icmne/Z0wivDKzLX/ICd2nHQHlClGT
 3mr6iu8pvafMB7o/B9BZmlE96NPBGn6Jaf75OERBl6VuKu1z0ZEd0+BvGftZCp2edQAX
 5OPQ7mvMfTkYFVtwpcvMp1XlX/2ebq3CKnu9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aWYVSLoMbHTMBYXNZeA1jDQCPhRLUCzYMMW57m2xkJc=;
 b=D6rrG4Gf6Jf33ZmD7/KPNAdC83DLmVfQ1mGgSKEwCanhH/f+550vZ9CPhyoCnLU3sE
 X11QWGMGWIbJOCto93RkU0eJklUDYcWe8LVfLY26TcjeamBAy9J6JuiPCaOLRwVapmiY
 +0CQ15OawYQ9T12Z+JTaf5EL1mklVVEH7V62Z/v47YcrwViz+n56Yp69ahpxFuB/rnjy
 o7jSNCQ+uIoq/5UdRkUPRdkLUK0JVcE/3vt4PRsBx8LPFPdRLthBaOucCrP8xvUb81On
 lmo/E+C88yd3P81A3N/xjmxJUQcnM46NC4WzBIBb/35peg/vXJ5R9p1UpvEoT9teM8Mj
 ha+w==
X-Gm-Message-State: AOAM532C7zP+4oyZEEuJ5h8u6dbV4M9i3vqpcM3pAS7kGBpDqxrzSsoO
 QuCjfwEQQN/Y0tpKYbtmIlU7mgjC3oS5EA==
X-Google-Smtp-Source: ABdhPJwPjENjFNeyYhUBfxuqAsYeBKK3On5toqHomJMty7r60eY3UHOV7vnHBxfkR0zb8SBYk7PmlA==
X-Received: by 2002:ab0:2986:: with SMTP id u6mr4273917uap.118.1606856464936; 
 Tue, 01 Dec 2020 13:01:04 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id y24sm84060vsd.5.2020.12.01.13.01.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 13:01:04 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id x26so1715078vsq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 13:01:04 -0800 (PST)
X-Received: by 2002:a67:8c41:: with SMTP id o62mr4909937vsd.49.1606856463746; 
 Tue, 01 Dec 2020 13:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
 <20201129221047.GH1162850@ravnborg.org>
In-Reply-To: <20201129221047.GH1162850@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Dec 2020 13:00:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X=qA9jB9KJZopWM5qmW5XYonX7LVQdmQ1cqoajcsBGUg@mail.gmail.com>
Message-ID: <CAD=FV=X=qA9jB9KJZopWM5qmW5XYonX7LVQdmQ1cqoajcsBGUg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm: panel: simple: Fixup the struct panel_desc
 kernel doc
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Nov 29, 2020 at 2:10 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Douglas,
> On Mon, Nov 09, 2020 at 05:00:55PM -0800, Douglas Anderson wrote:
> > When I run:
> >   scripts/kernel-doc -rst drivers/gpu/drm/panel/panel-simple.c
> >
> > I see that several of the kernel-doc entries aren't showing up because
> > they don't specify the full path down the hierarchy.  Let's fix that
> > and also move to inline kernel docs.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Thanks, applied to drm-misc-next.
>
> Could you do a follow-up patch that moves the rest as inline comments
> and verify that all fields are described.  (W=1 should show no warnings).
> That would be appreciated!

Ah, I hadn't realized that you wanted it all moved and thought
originally you just wanted the deeply nested stuff.  See if:

https://lore.kernel.org/r/20201201125822.1.I3c4191336014bd57364309439e56f600c94bb12b@changeid

...looks like what you want.  :-)

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
