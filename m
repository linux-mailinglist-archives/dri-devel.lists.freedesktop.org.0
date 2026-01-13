Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC9D1B958
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 23:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE9810E361;
	Tue, 13 Jan 2026 22:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VQm0BXLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE35510E55C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 22:27:00 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8b2148ca40eso1154215385a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768343219; x=1768948019; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPbQrO6E6LNgt6h0c8k7RPbbRO6mI1IhumUT5S5hMUI=;
 b=VQm0BXLntfJnhilZOZ3dJc4+I5+Y01exsxo9dln5mbq/Hxs0f+vGr3LfiDGstCjOVk
 AM/0jEbmrcmMwal34R0EjzcHIbYL7TwtQpb7A/79qAoKq+EfOOyQirdC75ABnKv5S29j
 VRwvx0A35Vw9JH7lYlMI7Lvtk1ssLcuccaECEvZ/tG27cHapPbKodNKz+ePF4TYPPGzy
 piKYsEFUmulpVocOHBtQWtvfbx7KUKK/pRiYHO3QlxZ7E3o3xMuJ5PsNs2k7UH/nuPAt
 RGB4t1CjuXyIbmG0Rmdnul9yOmnavQotjQBQO9fcfrzCh0Zc+lNkLGXyiecwAcgIxbZj
 MZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768343219; x=1768948019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FPbQrO6E6LNgt6h0c8k7RPbbRO6mI1IhumUT5S5hMUI=;
 b=enyZ9w2+s8kS8My/X2XAu7aqcwJypEDFyXCiw6OQWvTayN7ahNS2RsuMiiLSxfOFh6
 cQ34ix00r3709taQqFWsN7P1/JyD56bRR17DmsZlknmuhTgyR/oUKotqt8421O0ft1im
 6Zoh+JeolOh2Vc8UysZTf9d2BrtmwvXspr21NYWJ+u+2//wHHiq4LpG9IAwE4WiY2pd/
 JhyLwl6SmkfBFZykbeo8kMU+3QEsYVX1+2Pcyrq244gM4zp9yhkQCHWYyKD6yzmiM5m6
 yU80loFc7SFB4bbzMzU9ZsUDrK6ssqmLWOMTh4Tp1xz+0lKGlEqATbdmE8iv+VzOUJVY
 q9EA==
X-Gm-Message-State: AOJu0YztreI0F3JH/qrbEYUs6FEAShr+ELKYNmPtOO3c5Ct4QLE2fwry
 MBFTkK1ealhkMgSzp8ip5RHePoRf6tqN74De68UmE0T33ay/QD01mHp6ild8dX0J8JZ2lm+P4KG
 +jjF8nl70byN5g0Lb2Z4yVkh1Wy4qer8=
X-Gm-Gg: AY/fxX5tv8Hi68Wp2Y3dNel3TTXV5mLm2xDBOX3ELJo2VlZF+yZ3/taVDkTV8Q6GJme
 C1IFBHmKqE8O3sI4sh2hAHIdV10/4A78xcfRsg69wBvRZpDLpCWQn+IyALkcA/Wt7H/IDqph7I9
 H+sm1di7rw2++ui5BVI5SHeqgZAHu4/a15CeeNbtrpDVAtBtI/MGjy3xuTWf3XNyA8dByxWznxX
 UwiUlJcFP/cvmGZrh2jF2RKb90FnRelJJ8lqkhX2oUILMsjA0AH0ZrnofpzTL2EbR+6LfJwD5xD
 6gRi6weoQxz/hRpkvrgPzDwn9JXCj/vw0dyvNRNUJeTwGMLg1Ly7QXiULZ7ZTpiF/g==
X-Received: by 2002:a05:6214:2623:b0:888:89fd:a727 with SMTP id
 6a1803df08f44-892743ef0ffmr6079486d6.49.1768343219612; Tue, 13 Jan 2026
 14:26:59 -0800 (PST)
MIME-Version: 1.0
References: <20251219215344.170852-1-lyude@redhat.com>
In-Reply-To: <20251219215344.170852-1-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 14 Jan 2026 08:26:47 +1000
X-Gm-Features: AZwV_QitC4C9JKRt83ui2oLTLmZ5Ebkau-oI8dlyldv-clQuwlEdMkjnegGK9cI
Message-ID: <CAPM=9txG1PSR_F7s=oRTVKEPOC_XwW_o5_EqOnvX-hqcYEOoYg@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/nouveau: Fix cursor-related display hang
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Timur Tabi <ttabi@nvidia.com>, 
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Ben Skeggs <bskeggs@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Both look good to me,

Reviewed-by: Dave Airlie <airlied@redhat.com>

On Sat, 20 Dec 2025 at 07:53, Lyude Paul <lyude@redhat.com> wrote:
>
> This is a fix for one of the many issues I've been finding on my brand
> new desktop. This one in particular is easy to hit if you have a cursor
> with a continously updating surface between two displays, what fun!
>
> Reminds me of a another bug from long ago=E2=80=A6
>
> Lyude Paul (2):
>   drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
>   drm/nouveau/kms/nv50-: Assert we hold nv50_disp->lock in
>     nv50_head_flush_*
>
>  drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 1 +
>  drivers/gpu/drm/nouveau/dispnv50/head.c     | 5 +++++
>  2 files changed, 6 insertions(+)
>
>
> base-commit: 8e7460eac786c72f48c4e04ce9be692b939428ce
> --
> 2.52.0
>
