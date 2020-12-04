Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EC32CF15A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 16:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19E26E199;
	Fri,  4 Dec 2020 15:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FC36E199
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 15:58:13 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id y74so6593923oia.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 07:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m5DyIeCqEHow3pyi/ELGyt5+gpVvfGOYWC30niViLAw=;
 b=ENVmYaHkYKwkKLuOLOYqWHAtVAIBDKKTrE0phm2RbW/YGj6vvZSTOxkWMEVaN3t565
 yFv/JRxwqpR0lthp4Sfvme/8pIf2685uvQdK0BCzWNyqyeei1zOK495ZOAakvciS20m1
 w/utIJ2/QMjErlSI7wYNxiMUmZvbaLS2ANq7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m5DyIeCqEHow3pyi/ELGyt5+gpVvfGOYWC30niViLAw=;
 b=tOaHChbo5GcuQn3RsaValw3OQXZprXVsVZ1r3YeTswTDBX8EKMqq2nNUgy/Cab5e1M
 6f0jwiRPP+m6/5xM4VXvMGNivWwNc1mZMTuGa1DEZwl2cXYMoMbwVE4lQ0d4+C/aR2NS
 dX/s2guevrS+mqjHm6IvK6bfa1gRMADk1ZzZQz/zko9a4C6B7JXV6X9XdqBHa6UBBFHN
 AkC7nBSK8OtqF4EujCz36kVjQvyht8UUZOZi0u365lyfnEiod2lOo1lopCSXT7uuqFam
 B6l/Z/F+SMBL01XuhbQvSUV0SfmLA1PrNL2Y5/g+2ATqyrbZi5nOZI9hbHVdNoL+7lzO
 YYzQ==
X-Gm-Message-State: AOAM530V+kQCpTN6B0DIhuwYWgWHpjgtLDmTXlCuyzr61CU8lTVJgmrx
 fjep5+pqX+FfVHNjDKPByvNalS+T7zENPP2OmfKPjg==
X-Google-Smtp-Source: ABdhPJy/glayHXrKa+Blt8mThAT2uPeru1uzubYdwEL07+6IOjO5J4TeJsD6tMCy1ZKZlK4XHPD5cV60PhsoBDOlpy0=
X-Received: by 2002:aca:7506:: with SMTP id q6mr3721074oic.128.1607097492303; 
 Fri, 04 Dec 2020 07:58:12 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <c68d121c-ead2-dbe9-cb26-8b18ccb86011@daenzer.net>
 <CAKMK7uHZGAT6qUc1AbOHar0h=q0uJKOHuNL_HdiOgLx+iiy-kg@mail.gmail.com>
 <CABjik9dFoGSaxOouXsMdNgeFK57-RP28dhrPi4EXX81OswgeSw@mail.gmail.com>
 <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <20201204101151.55f487b8@eldfell>
In-Reply-To: <20201204101151.55f487b8@eldfell>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 4 Dec 2020 16:58:01 +0100
Message-ID: <CAKMK7uHi+y-=4BeVxt6362Fu79mBsB7LzmVqCqax_-JO0rUQCg@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 4, 2020 at 9:12 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 3 Dec 2020 21:45:14 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Thu, Dec 3, 2020 at 7:55 PM James Park <james.park@lagfreegames.com> wrote:
> > >
> > > The trailing underscore for  DRM_FOURCC_STANDALONE_ isn't
> > > intentional, right? Should I put all the integer types, or just the
> > > ones that are used in that file?
> >
> > Yeah that trailing _ just slipped in. And I'd just do the types
> > already used. I don't think anything else than __u32 (for drm fourcc)
> > and __u64 (for drm modifier) is needed.
>
> Hi,
>
> can that create conflicts if userspace first includes drm_fourcc.h and
> then drm.h?
>
> I would find it natural to userspace have generic headers including
> drm_fourcc.h and then DRM-specific C-files including drm.h as well
> (through libdrm headers). I think Weston might already do this.
>
> The generic userspace (weston) header would obviously #define
> DRM_FOURCC_STANDALONE, because it is used by non-DRM C-files as well.

Hm yes that would break. I guess we could just include the linux types
header for this. And I guess on windows you'd need to have that from
somewhere. Or we just require that users of the standalone header pull
the right header or defines in first?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
