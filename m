Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5100CB184F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 01:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7720910E5D1;
	Wed, 10 Dec 2025 00:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dMUSespG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCB110E646
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 00:40:40 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4eddfb8c7f5so61610681cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 16:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765327239; x=1765932039; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6wymOcLk7grT72mfA5h3N8IHYwLlfL5lz9NpBSo3BMM=;
 b=dMUSespG2rDCVyWgDgLAu+6EmOxtz4eFQKDuhiVzGI6/QtoObh6TMjykZ0jatAoA4V
 qP0CoS3GC/7pgX3w68eufT0aoDdkeQWwHLyZBAPetrXg4+eI11KwWENAt2Ibup58jm5o
 aUVvpkW56ED/uqCdrQHMScbS/57ZDoNnbJlV1HkY1uNevMOOUBC4wKSYG2qblixlfkBU
 c12g5NW4Kx+bcVcjrnyUBGZ13ngaDRnksOLGVdYYNPkeTV+PizmdFR1G8rkYhBi0O9I4
 5e2LXmUiVHnj0/d+u+j7nloSUUSoCPr71lEIQ8q5YZ0zA+BDtyXxjHTNVFzDaLG1BnIZ
 ovTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765327239; x=1765932039;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wymOcLk7grT72mfA5h3N8IHYwLlfL5lz9NpBSo3BMM=;
 b=JZ+WDHA/CrxvUq+R3cbxiP8uV1D4kSV6ThQGjJFdu0kvoUmzUt1OR3Q/Ibsn+2QvHU
 77nZlrIolK0GvGjpXJLgYb1W40q8pzfeI2Xz5jiLRnYQt0nLRFmQDWoQDgpb9//v/vMn
 PpJ7V4omdZtzzxhNDzZHty4WFDE8M2YKmz6mVROZBikh9uT3c992/NqmcLJmufmsgI6t
 /bjrpMQQbkRbMIflFHTKyaLjv/+xD3zQzQGa0Yoj+2CntQpkdLBO4VwoYQ420oKue/kn
 Vblv25zOEcK0QBe3KTKYMZaRTYR0KkVavoPvwH2XGfr8WB0c0CZgPse2i0QxOSKKaRNV
 lN0A==
X-Gm-Message-State: AOJu0YzVmt3A/MauYXKjSydF7aNMJgdNZ3FxWQUylY6fqS29kIwE1QPX
 Y4jPz2cBsfUz33gBbmRn8T6mzIK44sXO8OTohjDUstpNdooJGYud29LwT6bYMAWq6K9UennYDpW
 c/ejP0Eju3AlE+f06v9ECPqNywBhJfVE=
X-Gm-Gg: ASbGncthZLyIuxtqyn0cFL/asiD9AL/hOcpjPHzWcjH0FhW9DSN2ks4XfCP0GmeOr6m
 1kEkhc+E8BYT/iEl+br0wRKMlo7HCTZ5Sq/OMzC9VdZxfjdR25LneeXiuakNQqbfcSoTycDarqS
 ZAkYueHuR+r01KG1GpDljy4kL05lZ9/hhYmkNMCnqN7dAOv6gspswqVCnMkPiPcLPm+R/E+wLNl
 3VdqvNDyCqka5kgbw1xL4SKud4q3aS4I5mLQIPVa7hBwfSfu+o+YvRn7oVGD8qbD4sbEpIYdg==
X-Google-Smtp-Source: AGHT+IF/YC0wH4HTdXv6pBm0higZhgIr6sri+RQProT90pYcXmiv4UEnt1bnDECpeUGNAkSQJpp1ZNSu2G91t4JCDtM=
X-Received: by 2002:a05:622a:4814:b0:4ed:e0c1:44d5 with SMTP id
 d75a77b69052e-4f1b1a071ccmr9294931cf.19.1765327239484; Tue, 09 Dec 2025
 16:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20251205213156.2847867-1-lyude@redhat.com>
In-Reply-To: <20251205213156.2847867-1-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 10 Dec 2025 10:40:28 +1000
X-Gm-Features: AQt7F2olu1ewz5U3w0AuR9qHG-FpMcQsFdcic-uQjr_AUIrpcOyV2fiEy8XZ48c
Message-ID: <CAPM=9txpeYNrGEd=KbHe0mLbrG+vucwdQYRMfmcXcXwWoeCkWA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/dispnv50: Don't call
 drm_atomic_get_crtc_state() in prepare_fb
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, nouveau@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 James Jones <jajones@nvidia.com>
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

On Sat, 6 Dec 2025 at 07:32, Lyude Paul <lyude@redhat.com> wrote:
>
> Since we recently started warning about uses of this function after the
> atomic check phase completes, we've started getting warnings about this in
> nouveau. It appears a misplaced drm_atomic_get_crtc_state() call has been
> hiding in our .prepare_fb callback for a while.
>
> So, fix this by adding a new nv50_head_atom_get_new() function and use that
> in our .prepare_fb callback instead.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> Fixes: 1590700d94ac ("drm/nouveau/kms/nv50-: split each resource type into their own source files")
> Cc: <stable@vger.kernel.org> # v4.18+
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/atom.h | 13 +++++++++++++
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c |  2 +-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
> index 93f8f4f645784..85b7cf70d13c4 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
> @@ -152,8 +152,21 @@ static inline struct nv50_head_atom *
>  nv50_head_atom_get(struct drm_atomic_state *state, struct drm_crtc *crtc)
>  {
>         struct drm_crtc_state *statec = drm_atomic_get_crtc_state(state, crtc);
> +
>         if (IS_ERR(statec))
>                 return (void *)statec;
> +
> +       return nv50_head_atom(statec);
> +}
> +
> +static inline struct nv50_head_atom *
> +nv50_head_atom_get_new(struct drm_atomic_state *state, struct drm_crtc *crtc)
> +{
> +       struct drm_crtc_state *statec = drm_atomic_get_new_crtc_state(state, crtc);
> +
> +       if (IS_ERR(statec))
> +               return (void*)statec;
> +

So I was at kernel summit and someone was talking about AI review
prompts so I threw this patch at it, and it we shouldn't use IS_ERR
here, and I think it is correct.

get_new_crtc_state only returns NULL not an error.

Dave.
