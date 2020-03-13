Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5177218421F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F596EB9A;
	Fri, 13 Mar 2020 08:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7166EB6A;
 Fri, 13 Mar 2020 01:37:39 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h16so6218063qtr.11;
 Thu, 12 Mar 2020 18:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1su1FtYhvLukRFjOPJKpPGzMks5TFRo2RUOnu8jvPBc=;
 b=RS0wu07mMtJJnQAZZ+RJ9cJoUiamFx+ctkyOC0dKGnY4F7Eq5JsEnODLd0EzQZhJtv
 vnaPfanoSbQbD2wZJH8GTCSeUApDCgNrobr/l5rGc5b+voD+Yj8vcJ0TtVpjS7eikVbm
 +srB6fExh7Egd2H1C0uZ8KWrMFW6WrnMnBGgKI7W8CcH+qU3CYSs5485IsIEfA9t+MlI
 gmsy2lTNEYDeA6ZMbz4rflSrgvTpYDl9dDLEa55pbpKSAH+J5DOZwyHhnfvMCrf3zgfF
 lOZUbAybewLiO1Iq6GTAjrl/uH6nJ0UNpCMXyz/uY8SY/lqVDy8Ycpc4J1dfPZoe9GAi
 Mh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1su1FtYhvLukRFjOPJKpPGzMks5TFRo2RUOnu8jvPBc=;
 b=kqPh5bz9mAEnDXcTvsnSAsvtWkTSg8NzZicHdLf4wfhWWLCOMTEe0IO3Cv/9kM4BjW
 2lw86+hGiek++9uvtdmgI0Y0/wgkHGwg65LyHYaPXiJOZsqj1nr/8FRV39BmnBDoOYM7
 ae8i2Ij6/X2JYahHxMo8gH2FYzN8tc23AKj1OkUHwhvyVH3ikBFH/Xpcz4f7Cg9HmS7j
 MJ5giP6jusJ2Na0TDzy6X/Tpw4wNy/tL3qmCFgY5iwHQdGch3vII+IOlSu6cXXgYK8m1
 drD2y8F//xP5Mgrj0sfO2porJ7DrSZV+iwwRJfQuPL4uPusKinlVMg5uaju7Jw5SHum/
 1ugw==
X-Gm-Message-State: ANhLgQ1/HX0Jdlw765JjS/5Qo/zqsVwIJhHqjICVTypWVE9t67UW7h5e
 OMWnSjZH+n2mXDL7p8iitSYJIuAQyD0WWNBrRhk=
X-Google-Smtp-Source: ADFU+vvmSRq9n6Q6n0ceO8TSTRtXhQnYI3GMv38CZ1di8cNtVi7n3a97Cbr2iuX0QTFJVst+QiFSpnd+OgSQAL8YXMY=
X-Received: by 2002:aed:2533:: with SMTP id v48mr2029402qtc.39.1584063458349; 
 Thu, 12 Mar 2020 18:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
In-Reply-To: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
From: "Alexander E. Patrakov" <patrakov@gmail.com>
Date: Fri, 13 Mar 2020 06:37:27 +0500
Message-ID: <CAN_LGv20iPVmPQ_cXFATNp94Hp9ubnVb2ViUYndLihRk_uOgEw@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Jason Ekstrand <jason@jlekstrand.net>
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 6:36 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> From the perspective of a Wayland compositor (I used to play in this
> space), they'd love to implement the new explicit sync extension but
> can't.  Sure, they could wire up the extension, but the moment they go
> to flip a client buffer to the screen directly, they discover that KMS
> doesn't support any explicit sync APIs.  So, yes, they can technically
> implement the extension assuming the EGL stack they're running on has
> the sync_file extensions but any client buffers which come in using
> the explicit sync Wayland extension have to be composited and can't be
> scanned out directly.  As a 3D driver developer, I absolutely don't
> want compositors doing that because my users will complain about
> performance issues due to the extra blit.

<troll>
Maybe this is something for the Marketing Department to solve? Sell
the extra processing that can be done during such extra blit as a
feature?

As a former user of a wide-gamut monitor that has no sRGB mode, and a
gamer, I would definitely accept the extra step (color conversion, not
"just a blit"!) between the application and the actual output. In
fact, I have set up compicc just for this purpose. Games with
poisonous oversaturated colors (because none of the game authors care
about wide-gamut monitors) are worse than the same games affected by
the very small performance penalty due to the conversion.

We just need a Marketing Person to come up with a huge list of other
cases where such compositing step is required for correctness, and
declare that direct scanout is something that makes no sense in the
present day, except possibly on embedded devices.
</troll>

Of course the above trolling does not solve the problem related to
inability to be sure about the correct API usage.

-- 
Alexander E. Patrakov
CV: http://pc.cd/PLz7
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
