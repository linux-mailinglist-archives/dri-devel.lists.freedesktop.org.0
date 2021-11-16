Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F6F452B9D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 08:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D866EDF7;
	Tue, 16 Nov 2021 07:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EA76EDF2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 07:37:14 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w199so7382114oiw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aWT1hUeAl5+ozEOmXCxiRk0XQldcmiQHiS2LAVOVaUc=;
 b=Xx2rZWxE3JgEnPiSD/7E+iz4GKhyOcOYszYBMBVByXvag2WXWipbfR0/OV7oj6boFi
 Jdt3ff0P9cOwyvjLaaW5UZnJc60xIBRNI8t3c8mPcpbjh/rrm2znmyHS0jMj5msMCdsI
 cLK5OGS9V4sy7JEm7IZ6UWZuGLZ5ccQaxxuyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aWT1hUeAl5+ozEOmXCxiRk0XQldcmiQHiS2LAVOVaUc=;
 b=vuwYY3hofM5zrwD/pGaN9WxN8xEn5g+O1Rb0IOtGZQnWYCFGNadKdYmKJio4BVXyf4
 FtfgBzS049aohIaKco325HdN0ZfshOYda1xyRV9HqX93pbhPSdgceEqm+zraBWpiN4Gb
 T7yyt9n8tYUEbBJd/bLRFPWG8OTip5Gt/+mjDoJJ/CIxl2ldbAk4HLEo1uJv+mVUeG3f
 ftXz3jcMK6O5r31spEA5wdNBYxOnWHo8nE5G8LuOFJrejb+N/hvdpX5JEzFEWHTwHnUq
 4qgqSGHD0CQtvYPQVw5aOjZ7GcPubK4+AYnFmPozzFC/vwLuHDyRtYyHwriO7bi/hKZ3
 8hzQ==
X-Gm-Message-State: AOAM531KEUwSNuFtkgbfcKsN7YWKwoVK65mWK0r0Zrbb72OpWdqEbluX
 foRfcNYkeWfGuA+xRwycW+hHxcw5yH1tQas4Gu77ng==
X-Google-Smtp-Source: ABdhPJyKyhIRQJ+sj9A+VWfdBUhJrVQHRDH10F5y6mVyJRHqBp820EPH2QLK8cUfP+B+Nrngswtpx37ucD1oUTyw66k=
X-Received: by 2002:a05:6808:3d2:: with SMTP id
 o18mr49826992oie.14.1637048234238; 
 Mon, 15 Nov 2021 23:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20211114234045.cc5tearljna2ywij@core>
 <CAPj87rPxtQVQnrs0BiXy0H1viF-oMNeCCP_Aptsxt_sgeK+CpA@mail.gmail.com>
 <CAKMK7uGd+W3yOr2wGRREW08pcX=g1UPvkX4n13dVo7YdQ4dpxg@mail.gmail.com>
 <fd82ad9c-2b48-9bf3-0552-6f103847260b@amd.com>
In-Reply-To: <fd82ad9c-2b48-9bf3-0552-6f103847260b@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 16 Nov 2021 08:37:02 +0100
Message-ID: <CAKMK7uG3TPHH_jeGygKONNiivRiSvxM=mKafi4+6ceDuN1HErA@mail.gmail.com>
Subject: Re: Panic with linus/master and panfrost
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 9:23 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 15.11.21 um 16:05 schrieb Daniel Vetter:
> > You need
> >
> > commit 13e9e30cafea10dff6bc8d63a38a61249e83fd65
> > Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Date:   Mon Oct 18 21:27:55 2021 +0200
> >
> >     drm/scheduler: fix drm_sched_job_add_implicit_dependencies
> >
> > which Christian pushed to drm-misc-next instead of drm-misc-fixes. I
> > already asked Christian in some other thread to cherry-pick it over.
>
> Sounds like you haven't seen my answer to that request.
>
> I can't cherry pick the patch to drm-misc-fixes because the patch which
> broke things hasn't showed up in that branch yet causing a conflict.

Yeah I asked Maxime to roll forward to -rc1 right after sending out
this mail so you can do that. Which you could have done too :-)
-Daniel

>
> Regards,
> Christian.
>
> > -Daniel
> >
> > On Mon, Nov 15, 2021 at 3:56 PM Daniel Stone <daniel@fooishbar.org> wro=
te:
> >> Hi Ondrej,
> >>
> >> On Mon, 15 Nov 2021 at 07:35, Ond=C5=99ej Jirman <megi@xff.cz> wrote:
> >>> I'm getting some fence refcounting related panics with the current
> >>> Linus's master branch:
> >>>
> >>> It happens immediately whenever I start Xorg or sway.
> >>>
> >>> Anyone has any ideas where to start looking? It works fine with v5.15=
.
> >>>
> >>> (sorry for the interleaved log, it's coming from multiple CPUs at onc=
e
> >>> I guess)
> >> Thanks a lot for the report - are you able to bisect this please?
> >>
> >> Cheers,
> >> Daniel
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog=
.ffwll.ch%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cc541030e445e=
472b082808d9a84954cc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637725855=
208408806%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DLVQEVyNFPE1hpZjlD%2BApOVsfUBEP=
YPiRVVp5Gkut%2BcU%3D&amp;reserved=3D0
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
