Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988F626285
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 21:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A49F10E096;
	Fri, 11 Nov 2022 20:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6495510E0B4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 20:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668197227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ztz/XLY+gVz+oUJ3nFqgwH/snUdD+Aa6fbqfFn0t54Q=;
 b=DrY4YYdHg3KHyXUdkRRXsW89ArIUR9LL+Xw4mFJv6rLxKSPgpiuj8iijzLd7TWDgOv1uXT
 nUN+dBT/Wtv3Ou25EXMvbZOwYu+D4feksSVuic+ypG9UZGH5PPqfuEDXVuzMQd51DHZpiy
 C9HM1xKNtaSyZ+O6pEaTSd/JIIekXoM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-58-wgFBqwUBPBaJPJ1dZd_q6A-1; Fri, 11 Nov 2022 15:07:06 -0500
X-MC-Unique: wgFBqwUBPBaJPJ1dZd_q6A-1
Received: by mail-qt1-f197.google.com with SMTP id
 y19-20020a05622a121300b003a526e0ff9bso4256414qtx.15
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ztz/XLY+gVz+oUJ3nFqgwH/snUdD+Aa6fbqfFn0t54Q=;
 b=iOYwLEo+3j5QB7ReiwMPaf7PzF4sgWfLekc07mPJ9Es4dtG8owy4VwqOG58a+lYqQD
 Kzq07CNXNtHTIoUE1eeOAuMrJU/kKG8U4DhwRIr51WRF61xBeG/XqdNfzsQKhOJQnq9w
 fBMQX65SHxLkJ8ylcTThqRXYP8bGVb3cD7dYvUaIDdK1yZTSe849qi9ctPlea4vdfhrd
 r9ON8ijZbygquQkGFZweWrXz2f5BRzeCF1VajZocXaDQPUrp1BLUVRbqbLUZDqVfC0s4
 px+mGPwoV5UBUxjFNMcKeNGcy964Z8QUwbemD5qwjygjS+zPnH7omubSyYIQhBYx5dBu
 sdaw==
X-Gm-Message-State: ANoB5pmiUTCruvkYNupUeLUnod9JgEuJ5tTk8e8BZHlvzfXEn3nYfR/B
 38eVU0BU7cDKgdrmYu/YzVta3hYDsf3PvTlo9hkQrGIAPqD1vvf9JmJyDsIui8TWyU+IxKfUVv2
 SxmFhmuCLbWne/DcvN9VOQ7tbHtkE7RV1I4i2+WC7nVDM
X-Received: by 2002:ad4:5841:0:b0:4b7:ebc1:ecd6 with SMTP id
 de1-20020ad45841000000b004b7ebc1ecd6mr3495809qvb.9.1668197225866; 
 Fri, 11 Nov 2022 12:07:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf68Jn9djmiUd4uv1/cfDmbQ+VLUpDoROQzfpclynblmshr7W68Ci6lUZZl77R84XzS9JdKfuZgUrn+NrxImjwc=
X-Received: by 2002:ad4:5841:0:b0:4b7:ebc1:ecd6 with SMTP id
 de1-20020ad45841000000b004b7ebc1ecd6mr3495779qvb.9.1668197225586; Fri, 11 Nov
 2022 12:07:05 -0800 (PST)
MIME-Version: 1.0
References: <202211100850.7A8DD75@keescook> <87iljl6ehe.fsf@intel.com>
 <202211111110.11B554B@keescook>
In-Reply-To: <202211111110.11B554B@keescook>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 11 Nov 2022 21:06:54 +0100
Message-ID: <CACO55tt5KOgDYMEw=spDeoMaYuj2GQOuHU+BEgadr1nQiFOGhw@mail.gmail.com>
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

On Fri, Nov 11, 2022 at 8:21 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Nov 11, 2022 at 11:13:17AM +0200, Jani Nikula wrote:
> > On Thu, 10 Nov 2022, coverity-bot <keescook@chromium.org> wrote:
> > > Hello!
> > >
> > > This is an experimental semi-automated report about issues detected by
> > > Coverity from a scan of next-20221110 as part of the linux-next scan project:
> > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > >
> > > You're getting this email because you were associated with the identified
> > > lines of code (noted below) that were touched by commits:
> > >
> > >   Mon Aug 31 19:10:08 2020 -0400
> > >     a0922278f83e ("drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling")
> >
> > Hi Kees, this looks like a good idea, but maybe double check the Cc list
> > generation? I was Cc'd on four mails today that I thought were
> > irrelevant to me.
>
> Hi!
>
> Heh, I was recently asked to _expand_ the CC list. :)
>
> For these last pass of reports, I added a get_maintainers.pl run to the
> identified commit. In this instance, the commit touched:
>
>  drivers/gpu/drm/nouveau/dispnv04/disp.c     |    6 +
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  192 ++++++++++++++++++++++--------------------------
>  drivers/gpu/drm/nouveau/nouveau_connector.c |   14 ---
>  drivers/gpu/drm/nouveau/nouveau_display.c   |    2
>  drivers/gpu/drm/nouveau/nouveau_display.h   |    2
>  drivers/gpu/drm/nouveau/nouveau_dp.c        |  132 ++++++++++++++++++++++++++++-----
>  drivers/gpu/drm/nouveau/nouveau_encoder.h   |   33 +++++++-
>  7 files changed, 244 insertions(+), 137 deletions(-)
>
> And the get_maintainers.pl rationale was:
>
> Ben Skeggs <bskeggs@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:1/1=100%,commit_signer:6/16=38%,authored:4/16=25%,added_lines:23/124=19%,removed_lines:36/152=24%)
> Karol Herbst <kherbst@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:2/1=100%)
> Lyude Paul <lyude@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:9/16=56%,authored:6/16=38%,added_lines:92/124=74%,removed_lines:107/152=70%)
> David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
> Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
> Ilia Mirkin <imirkin@alum.mit.edu> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:2/2=100%,removed_lines:2/2=100%)
> "Nathan E. Egge" <unlord@xiph.org> (commit_signer:1/1=100%)
> Jani Nikula <jani.nikula@intel.com> (commit_signer:6/16=38%)
> Dave Airlie <airlied@redhat.com> (commit_signer:5/16=31%)
> Thomas Zimmermann <tzimmermann@suse.de> (commit_signer:4/16=25%,authored:4/16=25%)
> dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
> nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
>

I'd say it's good enough to message supporters and the mailing lists
for at least Nouveau code, maybe even all drm drivers.

Not sure what to do about actual maintainers, but I doubt Dave and
Daniel want to be CCed on every Coverity report here either.

Karol

>
> --
> Kees Cook
>

