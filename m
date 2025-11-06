Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FD9C38A8E
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 02:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA9B10E706;
	Thu,  6 Nov 2025 01:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XJpThGMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016D010E706
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 01:10:37 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-88f8f346c2cso44653785a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 17:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762391437; x=1762996237; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pyhS6jZpYBILAbqR+rnW9JcsPWV01j5CzZ2xzVsZ5pE=;
 b=XJpThGMj/d/3TSTDao7nj9IvdiJBJ9dZplQsgAzE/XzAzEOS/v5M7+Jq9z9EsNTgYY
 Med05nJj4Zt56qeV0rDlWdmyz/iajFAkMMRAg9uZurmSFmlEaqULr4UL8vgE3iPBovaL
 +cvONp1Pwm2BJitLiDHBZsOFUYyEx1fj7G8WLZ/eT7E4CbFwuaWRwfVfsEru0gIZy4wa
 0+OnITr/v1VHoPbI5av5HTm12bPczVL2PhljM4+wydXLH593eecgvlrfHp1vsZ5HBq/d
 y4P8cf3OfvkZ32WfQtyDsfoQ8/ACCPpiZhp0+aUNlT9ahLtjpvto6Xd3kmU0RNxSfjM/
 UhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762391437; x=1762996237;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pyhS6jZpYBILAbqR+rnW9JcsPWV01j5CzZ2xzVsZ5pE=;
 b=qF0P3f6tYO/FK0S4FTP9+gbHunmgcrvL7xAsr0t5vrwxcmHyxI6QA6LokfNYTVBhCE
 iU3sJTc77HQqaJITl5ePcJ308pVAmuPJRDG/OmyntoPyTpgnLDzMOKnb3Ia82mAmrPeg
 32GuQxek25FAygMZzcdeHtFEjIlU21viLb9pgHbPiw6USpLXLvDb9eLNRYhwFCUwD9yn
 QiUJhR8tdlmE8n77LE+ZR36J15FTISxq/taoDkN7DtVE3CGakG+1c9aZ9AgXnbZ9Ozm1
 FWqBDGAj+AGs4OfzcIKFt3gM/gDAdxd67a6oH+n73ZP/bOq9nbap5d2xGVJdmlnKDv6M
 In7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW96Mf7t69riKlZ4FHmnGmtFLHGUp/7UVyihUrpYw7MM8133jbT1yw1SDKcacKlNnUJH05saUXGoJY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDVuB4XMrDatQzISEUcQkywJRyuviap4kS/maAzgsO0UHawGiF
 WsCpYEdjIn7htPEbGslKmNi7Vuv6vPCd7I5KMPahkuzG8DwmA6WgLWVl33HydckGWIzfCFE6ppX
 Hb3TVTftMoGA5hVBESv4R5g9VoS+D5G0=
X-Gm-Gg: ASbGnctc3rgCQ0L/t8lrDqyuDopgf6savdhf082UgjK7OwgHmbEr2+NLsRGHE3aGQnK
 +rSKtzTyta/obHm+lKxmnOl5C2iOxHHsiTkoKq31CFo6antiwCl9qK+jkl7tDpq9tukCp73jEtg
 QtulXu7evOyvtP7f3SWxMbuLGIASL1GBUbtxFP0Ofpre9v5mT9xYMdUkHqsJCvvIgCy8j2j8v57
 yqGfgknL1LgCmh85wvqotBQ3jADrlinyuBC3sM+wtlFskD8NQVdXzSSALs=
X-Google-Smtp-Source: AGHT+IGUC6+9UkrRywwWWGU2MV3s+qVzGfbXA45ue4Tsj/rDblSjV6K9yCuZbFoS90JE8TEkBbHhcXBLEr05S4MkH4s=
X-Received: by 2002:a05:620a:d8b:b0:873:9fcc:3fb5 with SMTP id
 af79cd13be357-8b22081b49dmr710776085a.1.1762391436933; Wed, 05 Nov 2025
 17:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20251030181153.1208-1-jajones@nvidia.com>
In-Reply-To: <20251030181153.1208-1-jajones@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 6 Nov 2025 11:10:25 +1000
X-Gm-Features: AWmQ_bmCTQVuWSlyEeES5u_487iyQN-Bb540-HKjfSbJe_ACE1aHE1Bnc6YfQP8
Message-ID: <CAPM=9tzMUi_9BRL8onjvXoj8Cb0eQFpFwmKHveGTCRU1Nc7O3Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/nouveau: Advertise correct modifiers on GB20x
To: James Jones <jajones@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>
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

I've pushed both of these to drm-misc-fixes.

Thanks,
Dave.

On Fri, 31 Oct 2025 at 04:07, James Jones <jajones@nvidia.com> wrote:
>
> This series adds new format modifiers for 8 and 16-bit formats on GB20x
> GPUs, preventing them from mistakenly sharing block-linear surfaces
> using these formats with prior GPUs that use a different layout.
>
> There are a few ways the parameteric format modifier definition
> could have been altered to handle the new layouts:
>
> -The GOB Height and Page Kind field has a reserved value that could
>  have been used. However, the GOB height and page kind enums did
>  not change relative to prior chips, so this is sort of a lie.
>  However, this is the least-invasive change.
>
> -An entirely new field could have been added. This seems
>  inappropriate given the presence of an existing appropriate field.
>  The advantage here is it avoids splitting the sector layout field
>  across two bitfields.
>
> The chosen approach is the logically consistent one, but has the
> downside of being the most complex, and that it causes the
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to evaluate its 's'
> parameter twice. However, utilizing simple helper functions in
> client code when accessing the parameteric format modifier fields
> easily addresses the complexity, and I have audited the relevant code
> and do not believe the double evaluation should cause any problems in
> practice.
>
> Tested on GB20x and TU10x cards using the following:
>
> -kmscube w/NVK+Zink built with these patches applied:
>
>    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36336
>
>  with various manually specified formats
>  and both manually specified and automatically
>  selected modifiers.
>
> -drmfmtmods, a tiny test program that lists modifiers:
>
>    https://github.com/cubanismo/drmfmtmods
>
> Changes in v2:
>
> -Added "Fixes: 6cc6e08d4542" line since this can be considered a bug
>  fix for the initial blackwell KMS support in nouveau.
>
> -Dropped the second patch from the v1 series as it has been merged.
>
> Changes since the RFC version here:
>
>   https://lore.kernel.org/nouveau/20250703223658.1457-1-jajones@nvidia.com/
>
> -Dropped the helper macros & static inlines in
>  drm_fourcc.h as requested by Faith Ekstrand,
>  who noted these aren't helpful for UMD code,
>  which is all written in rust now. I may re-
>  introduce some of these in a subsequent series,
>  but we both agreed we do not want to delay
>  progress on the modifiers themselves while we
>  debate the details of those cometic details.
>
> -Reserved an extra bit for future sector
>  layouts.
>
> -Fixed handling of linear modifiers on GB20x
>  and NV5x/G8x/G9x/GT2xx chips.
>
> James Jones (2):
>   drm: define NVIDIA DRM format modifiers for GB20x
>   drm/nouveau: Advertise correct modifiers on GB20x
>
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  4 ++-
>  drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 24 +++++++++++++--
>  drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c | 33 +++++++++++++++++++++
>  include/uapi/drm/drm_fourcc.h               | 25 ++++++++++------
>  5 files changed, 75 insertions(+), 12 deletions(-)
>
> --
> 2.50.1
>
