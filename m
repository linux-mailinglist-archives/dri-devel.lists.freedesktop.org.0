Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CD6626307
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 21:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2181F10E8BF;
	Fri, 11 Nov 2022 20:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B70E10E8BF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 20:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668199123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iOc02DiC+CaIVCkcAVw6EXV28570qCIpUk2+es1FDOA=;
 b=d1pVgFwN/pFbRuQ9gzsVjKyUNF9oeZINt+d5PRKz4gTKDnH46iw2VRkzchsskIrNkPKTqg
 gmJruaDz6ROD1k3GJmKce9TDOp+Uja1VIGomD4i8a2XUrP1Ztp/R+r51lznwT4qjMDRYMC
 QbHAWl2Vvtoi4pcuTrWGEA2piDeQlx4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-nYHQOxDQPAS_hpB4S3fiwg-1; Fri, 11 Nov 2022 15:38:40 -0500
X-MC-Unique: nYHQOxDQPAS_hpB4S3fiwg-1
Received: by mail-qt1-f197.google.com with SMTP id
 f4-20020a05622a114400b003a57f828277so4355301qty.22
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iOc02DiC+CaIVCkcAVw6EXV28570qCIpUk2+es1FDOA=;
 b=zJKHcmPu3MyzQ9b2xJ0zk6q9fcTaxFDOmYYScrBy9lmlBSp6CemoOrM8CzBoGDlNV9
 qeX1KbYwZTe1evdHEIX/j9HwJAhfzYNvPd3WKWTLxdtvHTpbTp3B7QEzYA4pCzvYSRJF
 iSKqLwuOdkvQgqjQY/Nvw7v1fyfAT3hrUCm02JS0aEOyuNIV983AZU/oTuyzTj6XRGYV
 veiz9wjHRriyb5ykJ1u1t22+/g2ncYWwxZkzKamHinmylDnzo1rIRdJvQJ2pyUj2jg7p
 zQFeX92Zf5bqL5RYE8sctbQQDs61WM6lGljzwcu8lVuohW+25F2NV+KZhRq3ij8VGEnF
 0jiQ==
X-Gm-Message-State: ANoB5plXBPGjHvpy5L49Ksq2WCOqPaAis9yiQ5vs/YlfdpQKoGumdRoN
 AjrKm4zyc7Yb6Y6Lks4g8eFuZKZ9LbqnEdIOj/DOuDti+yN3+xWnb1PaIDr2y+XB2ccOXauO7R1
 GXzmZGS32V8Hm8B9A8/sLY2yAwzY8TfV2Ls3QW+CVr1CC
X-Received: by 2002:ac8:140e:0:b0:398:5f25:649 with SMTP id
 k14-20020ac8140e000000b003985f250649mr3006113qtj.673.1668199120414; 
 Fri, 11 Nov 2022 12:38:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5LOmUpWj0zC/+L7Y7H4Tvue8JzxcncnqkZQZYbqztBBpUxGN2/AlKbzfkTgtWEPvFTFIdqi6rdOfPhtKrf+k8=
X-Received: by 2002:ac8:140e:0:b0:398:5f25:649 with SMTP id
 k14-20020ac8140e000000b003985f250649mr3006098qtj.673.1668199120192; Fri, 11
 Nov 2022 12:38:40 -0800 (PST)
MIME-Version: 1.0
References: <202211100850.7A8DD75@keescook> <87iljl6ehe.fsf@intel.com>
 <202211111110.11B554B@keescook>
 <CACO55tt5KOgDYMEw=spDeoMaYuj2GQOuHU+BEgadr1nQiFOGhw@mail.gmail.com>
 <202211111215.1F421B7E@keescook>
In-Reply-To: <202211111215.1F421B7E@keescook>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 11 Nov 2022 21:38:28 +0100
Message-ID: <CACO55tvaXFyAMiAYmx2DKNj9fNtapThejHkRsvZd_5StYXTy+w@mail.gmail.com>
Subject: Re: Coverity: nouveau_dp_irq(): Null pointer dereferences
To: Kees Cook <keescook@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Nathan E. Egge" <unlord@xiph.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 9:16 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Nov 11, 2022 at 09:06:54PM +0100, Karol Herbst wrote:
> > On Fri, Nov 11, 2022 at 8:21 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Fri, Nov 11, 2022 at 11:13:17AM +0200, Jani Nikula wrote:
> > > > On Thu, 10 Nov 2022, coverity-bot <keescook@chromium.org> wrote:
> > > > > Hello!
> > > > >
> > > > > This is an experimental semi-automated report about issues detected by
> > > > > Coverity from a scan of next-20221110 as part of the linux-next scan project:
> > > > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > > > >
> > > > > You're getting this email because you were associated with the identified
> > > > > lines of code (noted below) that were touched by commits:
> > > > >
> > > > >   Mon Aug 31 19:10:08 2020 -0400
> > > > >     a0922278f83e ("drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling")
> > > >
> > > > Hi Kees, this looks like a good idea, but maybe double check the Cc list
> > > > generation? I was Cc'd on four mails today that I thought were
> > > > irrelevant to me.
> > >
> > > Hi!
> > >
> > > Heh, I was recently asked to _expand_ the CC list. :)
> > >
> > > For these last pass of reports, I added a get_maintainers.pl run to the
> > > identified commit. In this instance, the commit touched:
> > >
> > >  drivers/gpu/drm/nouveau/dispnv04/disp.c     |    6 +
> > >  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  192 ++++++++++++++++++++++--------------------------
> > >  drivers/gpu/drm/nouveau/nouveau_connector.c |   14 ---
> > >  drivers/gpu/drm/nouveau/nouveau_display.c   |    2
> > >  drivers/gpu/drm/nouveau/nouveau_display.h   |    2
> > >  drivers/gpu/drm/nouveau/nouveau_dp.c        |  132 ++++++++++++++++++++++++++++-----
> > >  drivers/gpu/drm/nouveau/nouveau_encoder.h   |   33 +++++++-
> > >  7 files changed, 244 insertions(+), 137 deletions(-)
> > >
> > > And the get_maintainers.pl rationale was:
> > >
> > > Ben Skeggs <bskeggs@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:1/1=100%,commit_signer:6/16=38%,authored:4/16=25%,added_lines:23/124=19%,removed_lines:36/152=24%)
> > > Karol Herbst <kherbst@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:2/1=100%)
> > > Lyude Paul <lyude@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:9/16=56%,authored:6/16=38%,added_lines:92/124=74%,removed_lines:107/152=70%)
> > > David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
> > > Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
> > > Ilia Mirkin <imirkin@alum.mit.edu> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:2/2=100%,removed_lines:2/2=100%)
> > > "Nathan E. Egge" <unlord@xiph.org> (commit_signer:1/1=100%)
> > > Jani Nikula <jani.nikula@intel.com> (commit_signer:6/16=38%)
> > > Dave Airlie <airlied@redhat.com> (commit_signer:5/16=31%)
> > > Thomas Zimmermann <tzimmermann@suse.de> (commit_signer:4/16=25%,authored:4/16=25%)
> > > dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
> > > nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
> > >
> >
> > I'd say it's good enough to message supporters and the mailing lists
> > for at least Nouveau code, maybe even all drm drivers.
>
> i.e. leave out the commit_signer hits?
>

yes.

> > Not sure what to do about actual maintainers, but I doubt Dave and
> > Daniel want to be CCed on every Coverity report here either.
>
> I updated the CC logic based on this feedback:
> https://lore.kernel.org/linux-hardening/87h6zgfub4.fsf@kernel.org/
>
> So maybe just mailing lists?
>

That should be good enough, but maybe the DRM subsystem is big enough
so it's reasonable to add special rules. For Nouveau either way is
fine.

> --
> Kees Cook
>

