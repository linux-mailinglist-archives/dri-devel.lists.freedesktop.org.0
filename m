Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5754B244C44
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 17:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4041A6EB68;
	Fri, 14 Aug 2020 15:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E37B6EB68
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597419798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0w9QrfBaxAowbsnefGj6NPGdj1Pppc4i+a2DLru63P8=;
 b=JybxtGV7DFBm8OrfDQDNM3Iphj4BNIyFvydZSVZmUrE+9bbBhjiApZDo2n6lGgj8MyXLYI
 u7i75f/Z2nVkH/FIaYdKm5WMd3ygail+YBB6OvurfpvyyW/EvUBA1Z213JbR1jUPE2tise
 Go0bVz+Myg/fG0UTSDaaongzKc4dsrc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-chLpTtVpMWmk8IeeEIq_Eg-1; Fri, 14 Aug 2020 11:43:13 -0400
X-MC-Unique: chLpTtVpMWmk8IeeEIq_Eg-1
Received: by mail-qt1-f200.google.com with SMTP id u17so7292058qtq.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 08:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0w9QrfBaxAowbsnefGj6NPGdj1Pppc4i+a2DLru63P8=;
 b=KWGg3yLBIHG2vLKLYDGl0bFA34Xe2BYWxvtjLr6bxR0q3mnQCiklZjhT+rWCe0w8A2
 nPp/PERYk24rJhOifeFC7ffBoLNRYzNZiJm+8ZswywX2VVSSHWPUedBunQkde0tcC4Ic
 LaYidG6jvXDF5e7VJO8vpg5HZvEVJFC86mIKDwQrToqyScC/qIId5PC+XUMfQY0ykeZ/
 L1WozCeZCzUF/wCjnKP2eP1sbca9glzqwxTpnCTYp84sLR5/p0DwPIM59CNQlHPQUhP1
 bzY/Dyvgu8RQnwEcUpvfzQ3f+uH/EotvAg7xQPNdWrL75d4HWTEZYg5PDnOz9rMz0Zoc
 Q7YA==
X-Gm-Message-State: AOAM530aRg94GKWbReCdddvaNp5Bs7JrGwT7qqkUpRh2kskPMVuFL3zM
 tAlTQm0pE5FB2RqKvhTmaxPS3rH2M7ccMU2YjsAX3ovnGloqigtIM4lCWGjNO1g1GCDkhqPhStB
 0eLHhukq3JIQt2veXGZxa7tNu0JKc4E3LOp9k1uZTRG2a
X-Received: by 2002:a37:4d09:: with SMTP id a9mr2569366qkb.157.1597419793465; 
 Fri, 14 Aug 2020 08:43:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2wjpIUccvB9MpKR96bPke7i0LOg6cJnojjKaut9GELCvaBv2WN5VASLmQVlCaZax7g+JyfHrNwmABq/Os1HU=
X-Received: by 2002:a37:4d09:: with SMTP id a9mr2569348qkb.157.1597419793253; 
 Fri, 14 Aug 2020 08:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
 <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
 <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <20200814140811.GE556087@ulmo>
 <CACO55tvz1_cp=qrF9M8RtyifLJ3N-ZdLM5O6wR=hy2o5TvSRpg@mail.gmail.com>
 <20200814152433.GG556087@ulmo>
In-Reply-To: <20200814152433.GG556087@ulmo>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 14 Aug 2020 17:43:01 +0200
Message-ID: <CACO55tv5YsxcEM52GXV-4t+LgwtTVZSQ-SMPotnF_Ht8OHvXYQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Thierry Reding <thierry.reding@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 5:24 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Fri, Aug 14, 2020 at 04:45:39PM +0200, Karol Herbst wrote:
> > On Fri, Aug 14, 2020 at 4:08 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > On Thu, Aug 13, 2020 at 05:39:39PM +0200, Karol Herbst wrote:
> > > > btw, I just noticed that wayland with gnome-shell is totally busted.
> > > > With this MR it at least displays something, but without it doesn't
> > > > work at all.
> > >
> > > Interesting, one of my typical test cases is to run Weston with a couple
> > > of test programs (like weston-simple-egl). Those usually work. I'll go
> > > run a few more tests to see where we are.
> > >
> > > To clarify, is this gnome-shell/wayland issue happening with Mesa's
> > > mainline, or with James' patches already applied?
> > >
> >
> > mainline. It does work for me on weston, but that's because weston is
> > always modifier aware afaik. For gnome-shell/wayland we have to enable
> > it to make it work.
>
> For some reason I can't get my mouse to work in Weston and it seems like
> that's the only way to start a terminal... But sounds like that wouldn't
> be any good anyway since it's different from that use-case. Apart from
> building gnome-shell, which I recall has a large number of dependencies,
> are you aware of another use-case that would allow testing the code
> paths with no modifiers?
>

with the newest l4t releases you can just copy whatever distribution
provides filesystem tarballs and generate images yourself. But yeah..
this is still a bit messy to do and I don't have a script which just
works without having to go through other steps first :/ Don't know
what your system is based on, but the fedora 32 images should more or
less work (unless you need your own kernel and stuff)



> Sounds like perhaps that would be interesting to add to Weston as a knob
> to test these somewhat legacy paths.
>
> Thierry

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
