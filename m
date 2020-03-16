Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A439188715
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F5A6E151;
	Tue, 17 Mar 2020 14:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF57789F61;
 Mon, 16 Mar 2020 17:11:29 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id h35so3744085uae.5;
 Mon, 16 Mar 2020 10:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TIQbkhWW1CshXc560+02Ghxg2S580YLkWlLvER5vpd4=;
 b=ZfMif4klLvwsM7JIVwgZ8xUYv4ww1dNAWZ3NN/29laKybTlQ9lai/F9s3j0oHql5XG
 pdvwT7/opAURS/pzfdOQT/tQROffq3gCPagPf3QotTKjlDo2PB6WkUjlbq67LnO4cTj6
 nfQqJ9a3qFGn/40wS1grRWQ9Pspgoimd37x4TUgsJmnbr1zaR7yybSU0KJV7lPv+P81p
 qH6rpes/aCfy7V/GGdzDmVIR8EoSVRv1QxMDnKt7E2MArEvFNmNUAx0vge1B8zXyPKge
 UxTYeMHlK4uxf8MARgVIeWJNE3aFF5zZ6SYIXIKag1FwVicoAg9zxRUnxY1mOt772eGx
 ekmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TIQbkhWW1CshXc560+02Ghxg2S580YLkWlLvER5vpd4=;
 b=DlM1rPhNRzrXxe9A46MSn6UnjCHYaeAZDzJMiCbSsNPyPGNJm5XS5PWNuZ0d14UwVM
 3Bd8rSWXYzOGjWy3mVfGpMf3GbQNUaChs7dMbzPaDfa+yzmmfxTerqAlUVpxOJ6UV9Kd
 v02fiiJmvgTlNybve1Rnw/FhPc2ctH+RCeQF8Jzj5cBrBMIlqCI+7V+UHAxIa0qwbSS4
 0yowmguw5lg70f2WSg3oMd+C13v4L7Jo1KIOPHuWglKxiLdJApl1lAD+n6sqrZPUBFne
 x1IChh/hwkO5QLHalixsSgQ+K1i5UbLYTEv7LiJeSAYdG+R6VGzr2TmASpU1Z8JyihK2
 AsVQ==
X-Gm-Message-State: ANhLgQ3eCufJdVQ+IhYh4DW9GsHSqNiIypcRen5dPkUGqH/fBAs78xlM
 w+oTp69FfrEONndWTebz3EMD/WRDWvb+5FKdjCI=
X-Google-Smtp-Source: ADFU+vtFOnReKy7mdHcw0alejs5WzaKUcLq3Ev3Ze9kGweyUw3cPoIkVFp3QdIv9Fyu36RwsDuUzN35lyUVOnM8eFhY=
X-Received: by 2002:ab0:67:: with SMTP id 94mr794846uai.139.1584378688957;
 Mon, 16 Mar 2020 10:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com>
 <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
 <CAPj87rM-kmKH6yJZE5vbiQv3KTKXsywe88Na6sGm+Guew++ZfA@mail.gmail.com>
In-Reply-To: <CAPj87rM-kmKH6yJZE5vbiQv3KTKXsywe88Na6sGm+Guew++ZfA@mail.gmail.com>
From: Tomek Bury <tomek.bury@gmail.com>
Date: Mon, 16 Mar 2020 17:11:17 +0000
Message-ID: <CAO1ALzn+D-gj93d49BGsu7X+2oKnDobhi9cMeVfR25yAu14Vjw@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Daniel Stone <daniel@fooishbar.org>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> That's not true; you can post back a sync token every time the client
> buffer is used by the compositor.
Technically, yes but it's very cumbersome and invasive to the point
where it becomes impractical. Explicit sync is much cleaner solution.

> For instance, Mesa adds the `wl_drm` extension, which is
> used for bidirectional communication between the EGL implementations
> in the client and compositor address spaces, without modifying either.
Broadcom driver adds "wl_nexus" extension which servers similar
purpose for both EGL and Vulkan WSI

> OK. As it stands, everyone else has the kernel mechanism (e.g. via
> dmabuf resv), so in this case if you are reinventing the underlying
> platform in a proprietary stack, you get to solve the same problems
> yourselves.
That's an important point. In the explicit synchronisation scenario
the sync token is passed with the buffer. It becomes irrelevant where
the token originated from, as long as it's a commonly used type of
token, i.e. dma_fence in kernel space or sync_fd in user space. That
allows for greater flexibility and works with and without dma
reservation objects.

Cheers,
Tomek
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
