Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AEC244B55
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 16:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7276EB74;
	Fri, 14 Aug 2020 14:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E8E6EB74
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 14:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597416353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zSEOSaI7rG/JfA9p/x7LweUTeZPZDqz+1uNeELv9SeA=;
 b=Cx8EWnvP5PUlflx99qfBFwCpUcw4WlkLZbn0ICg3VjcrD7doh4NM2rFM3yRIBTcfcW52xE
 PbEkGNEbxU6hk3AdaIXo0rL6X3hWvGEudzv/C2oG3zuukQB1wdKUzbmliZX6ewd9BWBUxH
 XaE13bM2M2ZcyPMz6/8U5KxKBq05LuA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-JVQhGZrpOludmg6BhGHOhg-1; Fri, 14 Aug 2020 10:45:51 -0400
X-MC-Unique: JVQhGZrpOludmg6BhGHOhg-1
Received: by mail-qt1-f198.google.com with SMTP id u17so7189782qtq.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 07:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zSEOSaI7rG/JfA9p/x7LweUTeZPZDqz+1uNeELv9SeA=;
 b=NTB6NZNayXInJPLqMrEFrDHbJa/dSx6B3tcRHvVbDwjYeYIDq77iU0jyOeE7jOaqJM
 8cZzCwRp0vwCx6QMaMXqP+BlFYsQ9fX3egzCbDZqrqWZQ3PkPk8g53lot6SnhXgH2W4z
 KRAPiwJLQBPVz4LBcJJednWSOdtxGWTQXrVbd5mLSx9wh0TclxChLlTrMqwJxQvYdctV
 DMgqVyMYGKEk0L/olZoT1FkoZC/wa2cNJ1/NDbBfDmbeYh6/AClBkLxu6XRdDhTYnAvM
 NA5uBDezVzvx82gpvIjka9trLOCFZGOBw+g5vP7ycY/rU9cPdzCmlESicaJggEJY71YI
 Z0JA==
X-Gm-Message-State: AOAM530mR9GdOnzg4CIyoSxkEgeYaoY1yu4XblenlurKGTVzqiYSvuVr
 72eD7EPbgvZFU3+Jl1imr4+la0oLTs9EhUCk91YBFZYXFlg7S2C8UNwHzrnJ8pV/uDV4EaatPFp
 ojuH0eVS8m2DHDL8KZoIV3qkIwHI5w6eCz4mldkKHwcF0
X-Received: by 2002:ac8:74c7:: with SMTP id j7mr2304501qtr.254.1597416351266; 
 Fri, 14 Aug 2020 07:45:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiSF78mNDC/Q28nAnzlavwfeT3/e4EPMnHZ/20oiwuNQmf7jimsobJBca2gLTHrSnevaGd6w9yExaCwpSWAHI=
X-Received: by 2002:ac8:74c7:: with SMTP id j7mr2304493qtr.254.1597416351090; 
 Fri, 14 Aug 2020 07:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
 <CAKb7UviVa32hWv+y+_kwbZzkJAxKcWr1RPCgkGt-mi=uayUKyw@mail.gmail.com>
 <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
 <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
 <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <20200814140811.GE556087@ulmo>
In-Reply-To: <20200814140811.GE556087@ulmo>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 14 Aug 2020 16:45:39 +0200
Message-ID: <CACO55tvz1_cp=qrF9M8RtyifLJ3N-ZdLM5O6wR=hy2o5TvSRpg@mail.gmail.com>
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

On Fri, Aug 14, 2020 at 4:08 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Aug 13, 2020 at 05:39:39PM +0200, Karol Herbst wrote:
> > btw, I just noticed that wayland with gnome-shell is totally busted.
> > With this MR it at least displays something, but without it doesn't
> > work at all.
>
> Interesting, one of my typical test cases is to run Weston with a couple
> of test programs (like weston-simple-egl). Those usually work. I'll go
> run a few more tests to see where we are.
>
> To clarify, is this gnome-shell/wayland issue happening with Mesa's
> mainline, or with James' patches already applied?
>

mainline. It does work for me on weston, but that's because weston is
always modifier aware afaik. For gnome-shell/wayland we have to enable
it to make it work.

> Thierry

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
