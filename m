Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4437842D1F1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 07:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91436E120;
	Thu, 14 Oct 2021 05:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62ED26E120
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 05:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634190143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VY03GubPFVDdkvSR8SdXXqCAVaPVrTzhj7NluBAU388=;
 b=PzA0Cuas91a7mf9izDA4td3OIfZMYr7glmocc8jlOvPWiJH+mDFOySbwJKJ1G360yRDbBU
 d1plIHLyPwFZFCsaJYNVDT6SEWAxB3Vqjxo+J1Na/bKH/W08G3pPUqmMXb2Y/ZiqswIItY
 prsemgC7gEAvCeHvodTH8bsiVEubgbY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-AGdcQE2bOwqckSxqmNHvZQ-1; Thu, 14 Oct 2021 01:42:22 -0400
X-MC-Unique: AGdcQE2bOwqckSxqmNHvZQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso3694487wrc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 22:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VY03GubPFVDdkvSR8SdXXqCAVaPVrTzhj7NluBAU388=;
 b=TBNdosVyda24JYxK2F+gu/kWNyXF7h+XSDxqHrFTabA9TSM0zUuZwxRX811jKBCjcb
 7lOS3SR2pEPtuOC1i9cH5EEUec0c9Dgdb4vq5PQRSAmkBkyaigMu6G2DwdwA2JxaZcR0
 4ffnZhCG8wCb3bXM+YpnX5sPn6+JHiMDZ34H69g5nyk+MTHpi5A2rvjthA29QPkA1eFp
 s4txnPytQv0LcuhvfujJEzs4IWywuMMZiXiEOde8iu3wi0GCmyUn2I4IKGPGws1D9HZD
 tJ7qmdrdH3c2x1R6VRF0f71YvFKdPXeQ6w3LYgsKW1rIj83qOfPuszv1bcVI5oHU8OqI
 9Gsw==
X-Gm-Message-State: AOAM533V56OlrHc5RV0a74fz7B45LspLHRO7v+6rJUQ59SbFY0ToMX56
 BtxxoAYdtqdaayqH5i6fNt2xnWP77k0C7Vj0p/aZREkCe0bc3yQvLVsouky/Mh6zUXhM2Pmy5HA
 HyLynr9pz8kxjW0CrHDMif/fhXmeilyO07FjbON691E4l
X-Received: by 2002:adf:a29c:: with SMTP id s28mr4104549wra.116.1634190140692; 
 Wed, 13 Oct 2021 22:42:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQovMuuTmLhj35z2utXaPHJV063AsII3FyccF8wXMMb7viJYHRoQqfSWAqErXYbz1US8DF/BzbxkOaXmWnGMg=
X-Received: by 2002:adf:a29c:: with SMTP id s28mr4104529wra.116.1634190140520; 
 Wed, 13 Oct 2021 22:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211012131836.4e17a031@canb.auug.org.au>
 <202110141102364478237@zte.com.cn>
In-Reply-To: <202110141102364478237@zte.com.cn>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 14 Oct 2021 07:42:09 +0200
Message-ID: <CACO55tsyrnta4z=K_vARsQTTD1t4o8sHA4Svr=Z+sDnvv0jHCQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Luo penghao <luo.penghao@zte.com.cn>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 14, 2021 at 5:02 AM <luo.penghao@zte.com.cn> wrote:
>
> Hi,
>
> I review the code.
>
> It seems I forget to delete the definition of the variable "inst",I'm sry for that.: (
>
> I'll submit another patch soon.
>

I already wrote the patch and pushed it:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit?id=381ba6a6baf104b572379c6b2deab884555104d4

>
> > Hi all,
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c: In function 'gp100_vmm_fault_cancel':
> > drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c:491:6: error: unused variable 'inst' [-Werror=unused-variable]
> >   491 |  u32 inst, aper;
> >       |      ^~~~
> > cc1: all warnings being treated as errors
> >
> > Caused by commit
> >
> >   404046cf4805 ("drm/nouveau/mmu/gp100-: drop unneeded assignment in the if condition.")
> >
> > I have used the drm-misc tree from next-20211011 for today.
> >
> > --
> > Cheers,
> > Stephen Rothwell

