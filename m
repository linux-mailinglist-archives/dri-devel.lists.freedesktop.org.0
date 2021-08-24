Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89FA3F64D3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 19:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756A66E071;
	Tue, 24 Aug 2021 17:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616FE6E071
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629824831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M+EkvRCjisgW9/FJYFVpuRO5Po0oLsZ90ivwhF4hpSs=;
 b=emz6HIB+Vflaz4WsVYZgyBBTcsbgEWW7YBDJgeH/d3/2yth8dMgzkLrJm1Ci9fY/fKPOw5
 nigoKHpyIyPfgnANFD5uqbBUnrSoI5ivq9VzLcBFxtwStR/8gCvfZkusqF5Oyorq9RKp+g
 n8qhrMwVbrQoxK47UTG6tnCrf+wgjLk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-k-W5MI-vMSGh6Q60fScFfQ-1; Tue, 24 Aug 2021 13:07:08 -0400
X-MC-Unique: k-W5MI-vMSGh6Q60fScFfQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 f34-20020a05622a1a2200b0029c338949c1so1564660qtb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 10:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=M+EkvRCjisgW9/FJYFVpuRO5Po0oLsZ90ivwhF4hpSs=;
 b=lGwVhdoP4bv1H2JMwi1nsh/h8wnjLboNukHuuBx4xP75uW2tJiluuIp4PybAyCNFHy
 cFr7qk8bE4f8Ztq5S+5YZA2jI0L07VxH5EaZcvsaZev0shzGaoVupBv1ZgQ+MkDFdZCj
 3FAK4FJ0zxd0QZDd+cPOPxm9aSE5keWycm5pLCGdxFBJa+mqHDDIUl1FB/mh3JAZYF+r
 oWggXAcxIhBTbHgUB7KbzWs2rYL/DyiMYerk8FUTygNHtCv6FY35dkC5v+SbG24GVVy2
 FbQlrv0dbGQX3hh23Nr6j2cQJcOy0VtPE987roYptMtiPXE2mpaaT4ZTfMnyV/N5f00K
 um/Q==
X-Gm-Message-State: AOAM533yB2IAb8FCAG27hmYCgohZrkx4uufVfvGgHP5GeYfeK1WuSBp2
 7UfdDQe9vWzavhzhQMW+jjOcjOtVL1jzZlm6fyGm1D/KZU4FsRljGqiSF35D5yx5NFy68+sjQYC
 +a4r+l9x8HFgFXIjUcFyTbb1CUAwt
X-Received: by 2002:a05:6214:621:: with SMTP id
 a1mr40120498qvx.12.1629824827956; 
 Tue, 24 Aug 2021 10:07:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjEBLm63jRc4t/L6dw09TUKBT09yP3DkBvnII/qB+rct8Z9iqhYH6ZriYAEHIEzCukdlMCSA==
X-Received: by 2002:a05:6214:621:: with SMTP id
 a1mr40120476qvx.12.1629824827749; 
 Tue, 24 Aug 2021 10:07:07 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id h6sm8211913qtb.44.2021.08.24.10.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 10:07:07 -0700 (PDT)
Message-ID: <1bd0bb90d6367307ad375d692563c6ba1fc43d50.camel@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.10 16/18] drm/nouveau/kms/nv50: workaround EFI
 GOP window channel format differences
From: Lyude Paul <lyude@redhat.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Tue, 24 Aug 2021 13:07:06 -0400
In-Reply-To: <20210824005432.631154-16-sashal@kernel.org>
References: <20210824005432.631154-1-sashal@kernel.org>
 <20210824005432.631154-16-sashal@kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Ben, do we even have Ampere support in 5.10?

On Mon, 2021-08-23 at 20:54 -0400, Sasha Levin wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
> 
> [ Upstream commit e78b1b545c6cfe9f87fc577128e00026fff230ba ]
> 
> Should fix some initial modeset failures on (at least) Ampere boards.
> 
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 27 +++++++++++++++++++++++++
>  drivers/gpu/drm/nouveau/dispnv50/head.c | 13 ++++++++----
>  drivers/gpu/drm/nouveau/dispnv50/head.h |  1 +
>  3 files changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 5b8cabb099eb..c2d34c91e840 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2202,6 +2202,33 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state
> *state)
>                 interlock[NV50_DISP_INTERLOCK_CORE] = 0;
>         }
>  
> +       /* Finish updating head(s)...
> +        *
> +        * NVD is rather picky about both where window assignments can
> change,
> +        * *and* about certain core and window channel states matching.
> +        *
> +        * The EFI GOP driver on newer GPUs configures window channels with
> a
> +        * different output format to what we do, and the core channel
> update
> +        * in the assign_windows case above would result in a state
> mismatch.
> +        *
> +        * Delay some of the head update until after that point to
> workaround
> +        * the issue.  This only affects the initial modeset.
> +        *
> +        * TODO: handle this better when adding flexible window mapping
> +        */
> +       for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
> new_crtc_state, i) {
> +               struct nv50_head_atom *asyh =
> nv50_head_atom(new_crtc_state);
> +               struct nv50_head *head = nv50_head(crtc);
> +
> +               NV_ATOMIC(drm, "%s: set %04x (clr %04x)\n", crtc->name,
> +                         asyh->set.mask, asyh->clr.mask);
> +
> +               if (asyh->set.mask) {
> +                       nv50_head_flush_set_wndw(head, asyh);
> +                       interlock[NV50_DISP_INTERLOCK_CORE] = 1;
> +               }
> +       }
> +
>         /* Update plane(s). */
>         for_each_new_plane_in_state(state, plane, new_plane_state, i) {
>                 struct nv50_wndw_atom *asyw =
> nv50_wndw_atom(new_plane_state);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c
> b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index 841edfaf5b9d..61826cac3061 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -49,11 +49,8 @@ nv50_head_flush_clr(struct nv50_head *head,
>  }
>  
>  void
> -nv50_head_flush_set(struct nv50_head *head, struct nv50_head_atom *asyh)
> +nv50_head_flush_set_wndw(struct nv50_head *head, struct nv50_head_atom
> *asyh)
>  {
> -       if (asyh->set.view   ) head->func->view    (head, asyh);
> -       if (asyh->set.mode   ) head->func->mode    (head, asyh);
> -       if (asyh->set.core   ) head->func->core_set(head, asyh);
>         if (asyh->set.olut   ) {
>                 asyh->olut.offset = nv50_lut_load(&head->olut,
>                                                   asyh->olut.buffer,
> @@ -61,6 +58,14 @@ nv50_head_flush_set(struct nv50_head *head, struct
> nv50_head_atom *asyh)
>                                                   asyh->olut.load);
>                 head->func->olut_set(head, asyh);
>         }
> +}
> +
> +void
> +nv50_head_flush_set(struct nv50_head *head, struct nv50_head_atom *asyh)
> +{
> +       if (asyh->set.view   ) head->func->view    (head, asyh);
> +       if (asyh->set.mode   ) head->func->mode    (head, asyh);
> +       if (asyh->set.core   ) head->func->core_set(head, asyh);
>         if (asyh->set.curs   ) head->func->curs_set(head, asyh);
>         if (asyh->set.base   ) head->func->base    (head, asyh);
>         if (asyh->set.ovly   ) head->func->ovly    (head, asyh);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.h
> b/drivers/gpu/drm/nouveau/dispnv50/head.h
> index dae841dc05fd..0bac6be9ba34 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.h
> @@ -21,6 +21,7 @@ struct nv50_head {
>  
>  struct nv50_head *nv50_head_create(struct drm_device *, int index);
>  void nv50_head_flush_set(struct nv50_head *head, struct nv50_head_atom
> *asyh);
> +void nv50_head_flush_set_wndw(struct nv50_head *head, struct nv50_head_atom
> *asyh);
>  void nv50_head_flush_clr(struct nv50_head *head,
>                          struct nv50_head_atom *asyh, bool flush);
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

