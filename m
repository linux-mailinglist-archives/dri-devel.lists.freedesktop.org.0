Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011A229413D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 19:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54946ED27;
	Tue, 20 Oct 2020 17:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61756ED27
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 17:17:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id q5so2839945wmq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NmHXQNYmimichWP+7yJJsgY2l2l46Hca2l4/7qqpG4s=;
 b=vN/LE0dK8tfozjB1GAjacq6xmsrSCpYRXNz1IX2He/ZpJUnjXSnVtswQm1MC5Df4it
 PBdcALDVcPbsV3/o/pQlkfk/Gw4Ghr7vg03BkFs5b2mPgj/STtGkhbVJ6pfsZfT2XCv+
 8YDLXyQcqms2fK69eDLaDEg9numJmW3FXsvLdPzmr4KsxKjAH+xjTLhqb3f2Vu7sn2iQ
 fOGaigGg/vzxizc5HIMQhut1P9bfuctWujCBmRoXXRY9uktgSzfzp/t/8Npq20RBSKxZ
 dqI4kRzruQnS1jqWzKmKh5+ARttAWOH4R1xzI14h5UDkcRZWuK2AMDGEdOGWs7Fd6LH1
 ZCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NmHXQNYmimichWP+7yJJsgY2l2l46Hca2l4/7qqpG4s=;
 b=DVPU2Oqm92Vc/UNk83j+poE9GIFqxCdYjUuePGb6iZnM4N/XsnO3tx5nlbo4g11/mW
 PmfQSRPvIAtNplE9MMWT5uYySDyz0NVahzo0OKsiLZ7rdx/6uIDBYPXTQfav1N6YvJvU
 jwlyLkWf1+2hyrxuZcBFAzs0CbtQOGji/o6FQ32OpScEstLW7Vj9JVUz863uB1ADcVXD
 Z3bI8N6xYjD56o6j7+0t5i8dzTOYIIqCV21nga5elOcy9VKaHoi1OsaEdgGT/TRqEiPo
 Ge28krH9+SgMMaW7ZbROT3UKqt2rEs1/lwPdYNuIdNj3PUqAQ/EQeHkDu4pe9+jOL10Y
 XzXA==
X-Gm-Message-State: AOAM532BHvTtdYPaXRFgSPBvkI24rLPYuWjA7AcpL2HkBBXwh77R96e4
 3geDNI6h0WlBTiZMoE4lUHk2ob+TK4sIM7un8rthXT5W
X-Google-Smtp-Source: ABdhPJxgM+X3EqGoq2aiiVdnB0ATLIY3O5Z85fjLat5Gm+L07eKjgCWEAdD1B7Q6cNahcF2dbZxsq+URboVySgHmcDo=
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr3966239wma.70.1603214271551; 
 Tue, 20 Oct 2020 10:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
 <20201018210412.GA515543@ravnborg.org>
 <trinity-a0f09460-7d25-457a-aef8-e70fcf617a83-1603136588694@3c-app-mailcom-bs01>
In-Reply-To: <trinity-a0f09460-7d25-457a-aef8-e70fcf617a83-1603136588694@3c-app-mailcom-bs01>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Oct 2020 13:17:39 -0400
Message-ID: <CADnq5_P8K16nf7WSOVZQZ3nMOmACz=tpsW-Ep+CEh+t0JLEtNA@mail.gmail.com>
Subject: Re: It appears drm-next TTM cleanup broke something . . .
To: Kevin Brace <kevinbrace@gmx.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 3:43 PM Kevin Brace <kevinbrace@gmx.com> wrote:
>
> Hi Sam,
>
> Thanks for asking the question.
> The current OpenChrome DRM code has these two major issues.
>
> 1) It does not support atomic modesetting
>
> I do internally have working code to support atomic modesetting, but it is not ready for committing into the upstream OpenChrome DRM repository.
> In particular, it suffers from a freeze relating to a cursor plane.
> The freeze is a bad kind that kern.log does not really tell me what is wrong.
> If I disable hardware cursor, the atomic modesetting based OpenChrome DRM appears to work okay.
> In other words, I am getting close to getting atomic modesetting working, but I am stuck.
>
>
> 2) Double allocation of visible portion of frame buffer
>
> This is a big problem left behind from the previous developer who developed OpenChrome prior to me.
> For some reason, the developer wanted to allocate visible portion of the frame buffer to be the maximum possible size supported by the detected monitor when initializing the frame buffer inside OpenChrome DRM code.
> I believe Radeon DRM does something similar to that.
> The problem is, OpenChrome DDX allocates an equal sized frame buffer visible portion during the DDX's initialization.
> This means that we got two same sized visible portions allocated, but OpenChrome DDX and OpenChrome DRM combined should really be allocating only one.
> At this point, OpenChrome is not supporting double buffering.
> This double allocation of a visible portion of the frame buffer contributes to a X Server crash when the screen is resized and 16 MB or less (i.e., 8 MB) shared frame buffer is reserved by the system via BIOS setup.
> I personally think letting OpenChrome DRM allocate the visible portion of the frame buffer is the way to go, but if so, how do I get the DDX or shadow FB to access the frame buffer visible portion allocated by OpenChrome DRM?
> Any suggestions on what to do about this issue will be greatly appreciated.

All drivers do this.  You have one buffer for the fbdev console and
then userspace allocates buffers it needs in addition, otherwise,
you'd overwrite your console.  You can disable it by not enabling the
fbdev emulation if you don't want a console.

Alex


> Perhaps, I should post a question to dri-devel regarding this issue.
> I really do not know what I should do at this point.
>
> Regards,
>
> Kevin Brace
> Brace Computer Laboratory blog
> https://bracecomputerlab.com
>
>
> > Sent: Sunday, October 18, 2020 at 2:04 PM
> > From: "Sam Ravnborg" <sam@ravnborg.org>
> > To: "Kevin Brace" <kevinbrace@gmx.com>
> > Cc: dri-devel@lists.freedesktop.org, "Dave Airlie" <airlied@redhat.com>
> > Subject: Re: It appears drm-next TTM cleanup broke something . . .
> >
> > Hi Kevin.
> >
> > On Sun, Oct 18, 2020 at 09:15:17PM +0200, Kevin Brace wrote:
> > > As usual, I pulled in DRM repository code for an out of tree OpenChrome DRM repository a few days ago.
> >
> > I know you have been working on and off on the openchrome driver for a
> > long time now. Any chance we will see the driver submitted for upstream soon?
> >
> >       Sam
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
