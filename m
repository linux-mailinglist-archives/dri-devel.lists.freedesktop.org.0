Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B94D5A2840
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 15:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA21E10E74C;
	Fri, 26 Aug 2022 13:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA88A10E74C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 13:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661519471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=blL1krI+FRfNzpxmwtq44D7yq8zuzcumkbYejqBUA2I=;
 b=HrwrWfmeam0rM/dyzT/s0lhJfixfMBY21EqCYqTcDy8kRs1wO6dWYJiqDkBhfpJzIqIk5o
 j4mIb1eq08RvXOksGLKdzdAZ7eKiQPD8q3IX9LKZS0bvS6XHUh8KpzT7klRuEU9U+pmcdo
 a8ulXnzjr9bHmYX4H9fwoLy3RaSuCug=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-OqrejK81Nka2D_z2iA4GtQ-1; Fri, 26 Aug 2022 09:11:10 -0400
X-MC-Unique: OqrejK81Nka2D_z2iA4GtQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 o24-20020a9d6d18000000b00639239e36b0so725745otp.13
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 06:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=blL1krI+FRfNzpxmwtq44D7yq8zuzcumkbYejqBUA2I=;
 b=ms6wdIzL5J1q9X5LGf4ArgcGBL21nFpdhDNdwARR8SDDXF3ra7QE22uLJLYxVbAbYh
 4jvW/c3qV6w1YFpHZ/+LoFBxD+zRNBA9fIYUiCVczbPd1I3xNDntgyrYzZ76fbKRG6x5
 7XMlUI62z5WWn/droAdvULDg1SZMixPcYSEQ9VoOr8fgcMjr6m9OjrNMLN3UADCF5x1/
 9NS6nPVYqRwsRtbaYznSWf/A+HKssQOExZ54X/XI11cLgNAuLoYyyiopT2P1NWE+GEv6
 vQU0DzFlVpuc8AHiSvs/M9LenNgafprs2DXlGHk4t3XiqWgS+92KKA3HbTdL7no4Uv5f
 0VrA==
X-Gm-Message-State: ACgBeo19fSUU2qCG3BfbKtj8VfZ5tPDDzGsX0aBgZUPGVWWsoeZZMPGL
 5B4FhW8poPoHDb7skYCkneYXedyLDotJyYGBEcDaNEvImyNapAieu/TL8/4i04CWK2dWfGdsCro
 gpdDRjkfetr61dcysHQG8ZDEW7TvZQzo+dOk+NjV5v9Xd
X-Received: by 2002:a05:6830:1b7c:b0:637:2583:47fe with SMTP id
 d28-20020a0568301b7c00b00637258347femr1350644ote.231.1661519469972; 
 Fri, 26 Aug 2022 06:11:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR72zDK9BPm9cmDvGge+eBJdOaycSweMqCCukHLOok3PXH+O14EuQ/8Q7OBuJNW8C7P6EkHVfMKHMy/7bbRelSs=
X-Received: by 2002:a05:6830:1b7c:b0:637:2583:47fe with SMTP id
 d28-20020a0568301b7c00b00637258347femr1350630ote.231.1661519469718; Fri, 26
 Aug 2022 06:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
 <CA+hFU4zUi42eKGbJfeB3caKXnZ_xQ5dQ_bu83EFVLM-S9SqkwQ@mail.gmail.com>
 <1mpWeZzQLcq5D99K0SJS_TB1xrG-YDLYDYcMwRpelbtZCA_PY3TSWwZKQnOBbtyiguz3bxbnDUq2PH5qbzz1Kt-xMoh4sLzzK2IbJQIRKTg=@emersion.fr>
In-Reply-To: <1mpWeZzQLcq5D99K0SJS_TB1xrG-YDLYDYcMwRpelbtZCA_PY3TSWwZKQnOBbtyiguz3bxbnDUq2PH5qbzz1Kt-xMoh4sLzzK2IbJQIRKTg=@emersion.fr>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 26 Aug 2022 15:10:58 +0200
Message-ID: <CA+hFU4yjumfFPR-ke_6BCP95Xdw3COZrrTf24h4PH3-ko2UvaA@mail.gmail.com>
Subject: Re: drm: document uAPI page-flip flags
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 2:17 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Friday, August 26th, 2022 at 11:49, Sebastian Wick <sebastian.wick@redhat.com> wrote:
>
> > > > +/*
> > > > + * DRM_MODE_ATOMIC_ALLOW_MODESET
> > > > + *
> > > > + * Allow the update to result in visible artifacts such as a black screen.
> > >
> > > Maybe add:
> > >
> > > ...temporary or transient visible artifacts while the update is
> > > being applied. Applying the update may also take significantly
> > > more time than a page flip. The visual artifacts will not
> > > appear after the update is completed.
> > >
> > > This flag must be set when the KMS update might cause visible
> > > artifacts. Without this flag such KMS update will return EINVAL
> > > error. What kind of updates may cause visible artifacts depends
> > > on the driver and the hardware. Userspace that needs to know
> > > beforehand if an update might cause visible artifacts can use
> > > DRM_MODE_ATOMIC_TEST_ONLY without DRM_MODE_ATOMIC_ALLOW_MODESET
> > > to see if it fails.
> > >
> > > Visual artifacts are guaranteed to not appear when this flag is
> > > not set.
> >
> > That doesn't seem to be true, though. For example setting
> > HDR_OUTPUT_METADATA for example does result in visual artifacts on my
> > display no matter if the flag is specified or not because the
> > artifacts are not the result of a mode set but of the display reacting
> > to some AVI InfoFrame.
>
> One would need to read the HDMI spec to see if there's anything in
> there about artifacts on AVI InfoFrame change, then figure out whether
> this is a bug in the physical screen itself or whether the kernel
> driver should require ALLOW_MODESET when updating the HDR metadata.

I'm not even sure if that's the right thing to do. ALLOW_MODESET isn't
really about if a commit can lead to visual artifacts but about
keeping the existing links alive (someone with more knowledge on this
subject probably has a better description for this). An async commit
can also introduce visual artifacts for example and there are probably
more cases.

>

