Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAA6ABBB42
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E7A10E124;
	Mon, 19 May 2025 10:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="dUqHcmmY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AA410E124
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:37:51 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-47677b77725so44120141cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1747651071; x=1748255871;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uLUsUinTMdjmLW5wpU4q/NnLHv21b+lbzGHwrlwL4dk=;
 b=dUqHcmmYNM9Up7rKMM0m2kupQ2vNZDpS//+WtYbV3IEf57NKlRm8InSVf04cIIBKkz
 pjmd/XhWamc6y2NrDG24gvuXk6hYUycLogtGGilpalDhRHptS5fcaM8nuAhEIM2WNxIc
 Vt479UVCyvAZn+YcTAhQtY+wyNwiTYSxOOVuX9ORTuD3krxZGovlhOKpTkXxH7RAZbib
 NxK151ad5b1Da+pQaK5Z+IkiPYVi4TWA7xUvsQL/T/fL3k29veRY998SMqJhsc7wvm9u
 L4DOxPK5Zpg1BX7/zcVbwrYRZEEekDR1vQF4RY1lb54g9p7PDxM0A4A7oMvAI0VEFDsu
 9swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747651071; x=1748255871;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uLUsUinTMdjmLW5wpU4q/NnLHv21b+lbzGHwrlwL4dk=;
 b=aFFKYs1Y2aPFfNaYp504U9vr2Uel3rfDpiSMhp10QnmKhnv1p9ka78nw4T4P2kjG58
 yk7aPvnVTWlc1Wtbvf4lscHTwgJDtE0zcuSXSBR3O58TSdYgFSntkF7rp7M5a7mGO29B
 vZybeys4FCsBGKdCIiEjf9bFkljBQyuFityLc7PeSPH+G//nIr1SizXVsCgBDq8FCzm3
 Ni37o8/6ZdEMCtFXS8f7G/AEOdD1fG9VkGj1suIPiKLl3zMSOXWiz00gV6vS6suz/tuo
 GEnr1ybbsjycd67z+8PrWiI3zuv5P0TjhM9ApIJ3iQgriDVJx4FKeRpH/q84RCEOZ2XQ
 RPJg==
X-Gm-Message-State: AOJu0YzXXSWcraijvueh/eYooBy+KSuFGm7YbJUgJuHWMJMudK7rZgf7
 96V4+/UjdOASqQQFkLYVGqvy3F81wyLNq3XpyoiMl6/0y0SO7BEluWVtPEZUIrim/HC8Z8HPMfl
 RfMmdWhgjwuhR/8U/JQf2QplSg7AFKlFPOm2xvE7MoQ==
X-Gm-Gg: ASbGnctSBI47uMY8hMNfJ4GB7ADP9So6ACOag8dXnBjVwGrEL5p91Z/CgW1epTK4zjL
 9mIa5W/CPLZDKpKqG0BB+4YRZj/6ZSdvugsG48sFLsxd4ULQnSJVZFX4qokqpNQhBuyYtP3BDAe
 pB+NeOmro0RvSV5PCVjcXqu253ZXoV5MY=
X-Google-Smtp-Source: AGHT+IHpoUyld3bWH/ccuYhs5XzdWrCcsdpq7tt7nhCOmlUkWwsRYL1EjQOis7dWQLywSekRjLeCOO/84Vo4YpYBUNY=
X-Received: by 2002:a05:622a:343:b0:480:7147:1998 with SMTP id
 d75a77b69052e-494ae3d017bmr155270341cf.22.1747651070647; Mon, 19 May 2025
 03:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250514050340.1418448-1-vignesh.raman@collabora.com>
In-Reply-To: <20250514050340.1418448-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 19 May 2025 11:37:39 +0100
X-Gm-Features: AX0GCFseuNxg2cyB31Kw8bdxaPv3D0EAGzhfq8OnlO6TTPxanjeFtSt3PM_LQL0
Message-ID: <CAPj87rMR9C4bgZBPhu=Pm7E-kqszt=GPQdnt4tCn_8-QqQAx=w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] drm/ci: mesa uprev and python-artifacts fixes
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
 robdclark@gmail.com, guilherme.gallo@collabora.com, 
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 lumag@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 quic_abhinavk@quicinc.com, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 linux-kernel@vger.kernel.org
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

Hi Vignesh,

On Wed, 14 May 2025 at 06:04, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> The python-artifacts job has a timeout of 10 minutes, which causes
> build failures as it was unable to clone the repository within the
> specified limits. Set GIT_DEPTH to 10 to speed up cloning and avoid
> build failures due to timeouts when fetching the full repository.
>
> The current s3cp stopped working after the migration. Update to the
> latest mesa and ci-templates to get s3cp working again and adapt to
> recent changes in mesa-ci.

I thought I already did this, sorry; the series is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
