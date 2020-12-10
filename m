Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2B2D61BF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 17:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F286EAB0;
	Thu, 10 Dec 2020 16:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58A06EABE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:28:03 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id d189so6313803oig.11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 08:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=khEVg5q5uNbQBMitxsqiKgstxoBjHfvUIKX4gfX4U3o=;
 b=n7NTrgZ39r/LY5WKTOoNUz2G6cI/R/EtBQdHwrrORccn75HoYfmYKEYPOJV/w6YC8G
 7L24KsH5qOfZ2neMpwlGg0QPHSxdthnzwHyAdWtNQFQXtEE1p9vcu9zSaGM6JlNtAO3v
 t1MSH9EHcwV7eegzfPwRMpL5dQDW4COtOIjDWWhUL3iWLJnH2634IikYbClT1+rwp7tM
 IZsnrUpavQZ/bqXBLU0zIlPuIuYX16C/+tIr/44Hv8d0HR0HQeRosjR08nxWCMzwawVQ
 mlvYJZTbkv3tGnFPfzXP+a/OUbUUN7+3khNhs+49Pdr1vRDMimxOTuaMf0/aUIxONtq4
 ENvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=khEVg5q5uNbQBMitxsqiKgstxoBjHfvUIKX4gfX4U3o=;
 b=nBxFPjx4DmZMiKYpikQlDcSd2iC8edzaOgVda80qty0iTg5WVcEJTkp8MMfSHdCXwQ
 yozqOnRlNKBzSL0L0hwhEMrusYsN+YequRfvdn09E3yuwqGV9SsJnjiVGKz8ENJ6MuW3
 wpJmIEGY8bFCP4QHBZNY3ikoV0s9JUauI9baBhTFIGWdeRHLvnO9wE3TQujm25kNCEui
 HZ2GFH18jC36iIpNMH+tu9RbS5CP/8kh2kGiYsOeENGb6G+U8B3Z6E+Q9rtDZ33kYHxI
 7JR6Hbdw/uzOWzzT3+nOnjH5SfKQWHCgW0WMLXhns0uj6RBdSVqf75PWXanc9p3+/EqS
 w10w==
X-Gm-Message-State: AOAM533BKjeLcNT/OL4QhfeWutUZcInrJjsO25MMmGdThEjEvEjvOyQa
 u0Ge7Q9qXzuX6/33azbyLWlvYcMlHc8rCOXDqOY=
X-Google-Smtp-Source: ABdhPJzdabKo1TxOySFKyt5U+nimpou7s/hcgk96ASMQ09xK1hG0WkdU7CdHM23p4v+t/4lzRBLdjhe0B05wGwGqVlM=
X-Received: by 2002:a54:4608:: with SMTP id p8mr5730487oip.5.1607617683115;
 Thu, 10 Dec 2020 08:28:03 -0800 (PST)
MIME-Version: 1.0
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
 <20201209004223.GL401619@phenom.ffwll.local>
 <0zedd9O9Bp0DfEH26xBTGvZtqA5bdE2EJDN3z5TXiDIyiwfTnRapgDy69MjAlhMWrzqKTzoYwovpGANNhp1PmneSCrm-xzw9DIeauv1SkgM=@emersion.fr>
 <20201209160223.GT401619@phenom.ffwll.local>
 <W7ZhvStaUaGjlhYSldWxC93V0-tjSEwm-ldyPBpmvkJ9xRw1krfB1TNd5X4hEjkamaEhH1ASD0yiFzMCh72oG8vCeg-HeOt5dRN5U5v_q34=@emersion.fr>
 <20201209194030.GV401619@phenom.ffwll.local>
 <iId0AQqxwalIhTMk-efVSEskNIuLA_pP5h4loD4Mbu17dJF83zbUXu5HZnSekjM73tghP2kE5MNXdMT3D5lus2e-s66PX4V0a_mDka695FY=@emersion.fr>
 <CAKMK7uFywgzd3JvACQLFupX6C9Cz_+XVHDV34XvNJHXv3TfXdQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFywgzd3JvACQLFupX6C9Cz_+XVHDV34XvNJHXv3TfXdQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Dec 2020 11:27:51 -0500
Message-ID: <CADnq5_OxcTThMu2QE_kiUKrL6VJDg4u1Efo1r4Rmu9K12VKP=A@mail.gmail.com>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 10:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Dec 10, 2020 at 4:45 PM Simon Ser <contact@emersion.fr> wrote:
> > On Wednesday, December 9th, 2020 at 8:40 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > But it's not enough, can't have two CRTCs with the same primary plane. Well,
> > > > I give up, it's just simpler to use Daniel's criteria.
> > >
> > > Yeah, also with the validation check we'll now real quick if any driver
> > > gets it wrong. Then I think we can have a useful discussion about why, and
> > > what to do with that case. As-is we're kinda drafting specs in the void,
> > > which is always a bit tough ...
> > >
> > > That's kinda another reason for doing the stricter check I proposed, it's
> > > easier to check and guarantee (on both the driver and compositor side
> > > hopefully).
> >
> > Hmm, actually, I'm already hitting a driver which doesn't guarantee that.
> > amdgpu with my hardware [1] has the first primary plane linked to the the last
> > CRTC, the second primary plane linked to the second-to-last CRTC, and so on.
> >
> > [1]: https://drmdb.emersion.fr/devices/129e158a4d9f
>
> Huh so crtc are registered forward and planes backward? I guess adding
> amd people. And yeah sounds like defacto you can't figure out which
> primary plane goes to which crtc, and we just take whatever goes.
> Maybe that stricter approach with more guarantees just doesn't work,
> ship sailed already :-/

IIRC, we used to register them both the same way, but ended up
reversing the order at some point because the direct mapping didn't
work for some reason.  This was years ago though, so the details are
hazy.  Maybe Harry or Leo remembers more details?

Alex

> -Daniel
>
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
