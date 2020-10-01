Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0672527FE89
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 13:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CF96E19B;
	Thu,  1 Oct 2020 11:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C456E19B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601552236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4eXjspHxv+ABlMMFfGR7GC9CAx8SFwxNxhFzCnX2S94=;
 b=YMNuB84qRvhJlyaWvY7/wJ2onCAzQQm8wJo87VMdCZalbdmhMOxZbrEzQh6Lxr035Nvxax
 KyGPXfgzPevoXR179KvBnH4+8w/lJwN7W9tqml4Z1/bZxAGZ9zw4nZJl5qVCBZajVeczt4
 AVk1RkowosSz/MXBMHyXZLh3oFurpxI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-SE-WZdC_OfG-7ZWg_1eSxw-1; Thu, 01 Oct 2020 07:37:04 -0400
X-MC-Unique: SE-WZdC_OfG-7ZWg_1eSxw-1
Received: by mail-qv1-f72.google.com with SMTP id di5so2883136qvb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 04:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eXjspHxv+ABlMMFfGR7GC9CAx8SFwxNxhFzCnX2S94=;
 b=dc3iy108/yq4nXXKs7OiiLw2O5jNWKK+wslAEg4BQiZ6ZrnpDpOz+0RsZv/J+wyHYx
 Mr3G3LlIVEnvrkntyHtqmPnMY/faLgoCoIzdLNMRGYC4ZZqHlDjk+cCIVrVyUZ0VMKWy
 rCg4xAs/0kU47JhNuFjloRX0KYU0EMoa2qw7XvrDxlOFA3vWTllzsH9ZQc4c8EsiRReP
 85vCFI75HovObTTinnZ3iNHmE+cs5IYKXgXps57wDbpgWpYxZ1P/lpodjImSjor8GPkm
 sP6krLR2ENXNnPmtuUREwhabbrkNstpNmBtFBWzTBgdmTmbDLjzMCMlSV1YsQRuMs+Va
 s8hw==
X-Gm-Message-State: AOAM531omosAL+xOaPd7XYkkTRNPtBktcNIcd8+dhU7xCS2akS4Vy/jv
 7vlxdLkklNztwgvzSHFyQfxAwyC+ciMaDThZ02BMeXVkydLV7xmknmN/XMKa/RRjBKWEeXCKwpu
 vgsW3s5ZTI0vmt5oN27ukIsmjrUt1o/iMWDE//8ngkLi5
X-Received: by 2002:ac8:411c:: with SMTP id q28mr7089446qtl.254.1601552223878; 
 Thu, 01 Oct 2020 04:37:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsKkx5koDNootQdIEJCZxyYrvPYIZj5X0DvstXn2raHaIPYrbdSVeG2Y3iLhXbvVGXMXmh2o9a+wwNYiFz1LU=
X-Received: by 2002:ac8:411c:: with SMTP id q28mr7089424qtl.254.1601552223535; 
 Thu, 01 Oct 2020 04:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
In-Reply-To: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 1 Oct 2020 13:36:52 +0200
Message-ID: <CACO55tviMespp4FNko+2ipmx0DNx4de2WKSrmEW05EufW7P_ZA@mail.gmail.com>
Subject: Re: Nouveau wiki migration
To: nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
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
Cc: Jeremy Cline <jcline@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 11:27 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> Hi everybody,
>
> I think it's time to finally move our wiki from the old infrastructure
> over to gitlab pages.
>
> This comes with several benefits:
> * full control through git over the ikiwiki pipeline (setup files,
> plugins, system packages, ...)
> * random users are able to create MRs against the wiki as long as they
> are willing to create a gitlab account.
> * possible to migrate over to a different wiki generator or mix and
> match or whatever.
> * no CGI stuff on the wiki as we don't use ikiwiki for the git
> operations anymore
>
> To view the migrate wiki visit this URL:
> https://nouveau.pages.freedesktop.org/wiki/
> the gitlab project lives here: https://gitlab.freedesktop.org/nouveau/wiki
>
> There are a couple of changes I already made:
> * convert the perl ikiwiki setup file to yaml:
> https://gitlab.freedesktop.org/nouveau/wiki/-/blob/master/nouveau.yml
> * reworked the setup file to throw out unused plugins and adjust
> settings for gitlab
> * enabled HTML5 (does change the style slightly, but also fixed some
> regressions)
> * pulled in external sources (from the fdo.org server)
> * moved mdwn files into their own subdirectory
>
> For now I changed everything inside one big commit:
> https://gitlab.freedesktop.org/nouveau/wiki/-/commit/6f2d1669884af186863718ad827f65372a0c5c43
>
> There are a couple of remaining issues/questions:
> * the gitlab CI pipeline fails quite a bit, which could be annoying
> * there is a delay between editing and changes going live (usually
> below a minute though)
> * should we disallow direct editing of files for project members so we
> could CI the changes are still valid?
>
> Next steps:
> * verify everything still works
> * fix remaining issues
> * final step: point the subdomain to the new gitlab pages URL
>
> If anybody else is interested in moving their wikis over, don't
> hesitate to ask me questions or just copy whatever I did :)

I did some further changes, like ensuring backwards compatibility to
existing links and already started to clean up some bits, like
removing the google translate stuff.

Now I'd like to get the subdomain changed of the current wiki over to
the gitlab stuff and wanted to ask for acks/nacks on this

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
