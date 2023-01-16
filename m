Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2014E66C6C8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 17:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C3E10E455;
	Mon, 16 Jan 2023 16:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4686E10E455
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673886301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SapRDhSD4bg3SNicTSW2wGgbS66LIJZoHqZZ/9cufV4=;
 b=KKec3WhzPW49Hf4c0lgI1FRD59s0ltp1jZD5Yma+1MwitgrYXw0tyZPhSThkpO6AHUUO4v
 OYHEynqate4/Ir6Jo0Oi4hL3BoIw4aiXylOydVFyoQRLwAb159N6mDYGCmhqIGiDvDtLrq
 Uxt37DiTFFr5SFf1rS0ymavoWvHpDfk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-PmWBGOqUO9e4HZmfczX0kw-1; Mon, 16 Jan 2023 11:25:00 -0500
X-MC-Unique: PmWBGOqUO9e4HZmfczX0kw-1
Received: by mail-lj1-f198.google.com with SMTP id
 y8-20020a2e9d48000000b0027f1feabc75so7626602ljj.16
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 08:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SapRDhSD4bg3SNicTSW2wGgbS66LIJZoHqZZ/9cufV4=;
 b=afWXi8KWJfGoog9QIBs/1iwXm3nLAnNyz0w300gIew/rEA6Lj/TKL478aspMbQGrQo
 7pNWFCpLbCCCMJ/sU/QRXjMIzKlpMJhuM+YNunhI/pTAQs+qyXhMIQc897YA37+Tl0qU
 z85vx2w2zyDfQuz3FRU47UNzHOSd66SUZSNOthNBAx9GgAclIz5D5a2fkPh1bdr8kGGw
 GGknrTc6RkhjJsBS0HpOz43cgNylz3fhPsLPo5PGf0paJ/KRkdDdOwyJp4O4+MEgYpEB
 cCNMP/rNFoECQ4rU3iSnF6RD/ROCbyCobSu56fsS4265uajUq3jSm3i0qkNz8nexiAJJ
 S+mQ==
X-Gm-Message-State: AFqh2kpkzNJ6Vf0oJjoJNvRZwkSryhWMQoFtO7cbdpNb2xgmLRVRdSAV
 q9ixCXxyXYQBwvnf0Qvb+ojnk0G/rV8tRD/K/J00ad0ueejd0vK5/tcsmTmU99bfSQ0KxF7JX5q
 MJYqziwrQkhFK02Nh+KOQA8kd5a9SM1LjOjtfxjkL9Ktn
X-Received: by 2002:ac2:4f8c:0:b0:4d0:7b7:65dc with SMTP id
 z12-20020ac24f8c000000b004d007b765dcmr483286lfs.122.1673886298836; 
 Mon, 16 Jan 2023 08:24:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXskVXALh3cMxytws6o+ulKkC0aRueGIcJS8YRlvP7WpfCxojGKp4y72qPmz5veoTJzcgsV96C0ycbrb/7Q/f08=
X-Received: by 2002:ac2:4f8c:0:b0:4d0:7b7:65dc with SMTP id
 z12-20020ac24f8c000000b004d007b765dcmr483278lfs.122.1673886298656; Mon, 16
 Jan 2023 08:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20230103234835.never.378-kees@kernel.org> <Y7TNtQqunHIW8her@work>
In-Reply-To: <Y7TNtQqunHIW8her@work>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 16 Jan 2023 17:24:47 +0100
Message-ID: <CACO55tsyCtf-_mCPVEo-4Dj_mAu-tnNTTjP75wx=9n+TS1XVvw@mail.gmail.com>
Subject: Re: [RESEND][PATCH] drm/nouveau/fb/ga102: Replace zero-length array
 of trailing structs with flex-array
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: Kees Cook <keescook@chromium.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 4, 2023 at 1:52 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> On Tue, Jan 03, 2023 at 03:48:36PM -0800, Kees Cook wrote:
> > Zero-length arrays are deprecated[1] and are being replaced with
> > flexible array members in support of the ongoing efforts to tighten the
> > FORTIFY_SOURCE routines on memcpy(), correctly instrument array indexing
> > with UBSAN_BOUNDS, and to globally enable -fstrict-flex-arrays=3.
> >
> > Replace zero-length array with flexible-array member.
> >
> > This results in no differences in binary output.
> >
> > [1] https://github.com/KSPP/linux/issues/78
> >
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Gourav Samaiya <gsamaiya@nvidia.com>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: nouveau@lists.freedesktop.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Here is my RB again:
>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will push in a moment

> Thanks!
> --
> Gustavo
>
> > ---
> > Sent before as: https://lore.kernel.org/all/20221118211207.never.039-kees@kernel.org/
> > ---
> >  drivers/gpu/drm/nouveau/include/nvfw/hs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > index 8c4cd08a7b5f..8b58b668fc0c 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > @@ -52,7 +52,7 @@ struct nvfw_hs_load_header_v2 {
> >       struct {
> >               u32 offset;
> >               u32 size;
> > -     } app[0];
> > +     } app[];
> >  };
> >
> >  const struct nvfw_hs_load_header_v2 *nvfw_hs_load_header_v2(struct nvkm_subdev *, const void *);
> > --
> > 2.34.1
> >
>

