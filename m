Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957EBACCC88
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 19:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6638D10E0F3;
	Tue,  3 Jun 2025 17:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T1HpdBfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D7B10E0F3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 17:55:09 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso1138416866b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 10:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1748973307; x=1749578107;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fC/6H+NAYLMVj5GzwzsNQxA9cPRU1IAN6ZNdrc7a8/Y=;
 b=T1HpdBfgbYWar/bDh3L0HJOlRYe3ZQU5Oe66P4xrCwMfunsmBdUGHoP+8VudXdhnxM
 JXIqJqdngw/Gw+fzU9YhYp0EsdtV6Aq4BojMeMFnRVzSu4BlGV2E3RY3MWj5luBA24GD
 x4ROqDYN/pqZaDeQsF04AmdzRY/8CT3lLiI2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748973307; x=1749578107;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fC/6H+NAYLMVj5GzwzsNQxA9cPRU1IAN6ZNdrc7a8/Y=;
 b=cGIFqp6NxQ1sNF0dUQCgIu7sTVFmjXokM54fp2fT+ch5pzLp37b43qJmZ0SZ0rmOxi
 i8CSWqwnqNQda1nzjyfOrYsmv4c7DYPTtIhACbwBG23aOxWJSxInxHhjl8JO4Mkogcze
 VEsWpS31hSU76oYFMmgzZctyUcowMfxTNZ3olcwpcPvtbFU4He/MWcSv64J0/UyFzMKD
 qwp7c0vpq3g9NDPFdWGlqizIAfxCxpJWmhnILT+TOfTcGk3dBWW148sc1LjvpflLDc0M
 aUkMncVqGvqAucBhiFtyc2X1ydnP0h+39mieD4IvBKJKkILk3HYoVU6evtS22DZldUIc
 nAkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUviW2Q2As/1MPRFoH/B7tL7KwnsC2539L37uYny9jRN6xtTsRjHM8eYJgPzpmNGDA1r/73JLF+b6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPB3xiiYnvJJsa1vWq4PQI29UmwRYv3GvpcD/uHWj1l4MZFHN8
 vfHJBxpHlrp29YoDUVTffFb+aP1mg1mtcYNUZmVqbgXc7SZCYw+f+F5NZ7iyB5IV0fOPMhS8vL0
 obMU/p+Y=
X-Gm-Gg: ASbGncsDUTm7NwVd3fw8fFrrowk2tnmd+TPGa1OGLXDX4wwI08t6Sh0+DUfSkefVEpM
 8+r4EdYWbgdsyGBPAyyPOFAo8PKRCj3o0qFkD0E2LOWVzH9jUz1g5NFJpaFnTHbLiX5vns9A9Ci
 7Y5/z3aQH3CMMEl3wHTZdpiBzZfpVKwBwrO1SPFKCRV5a9ReJSEyHzW/TruPz6jZQzkHNmkExzX
 d/QkSC8lSi5i8SqhKIanVyCwuSkJnx+XpHVK0cDEHH5PtH7S4A/pyB3mECio8zXrwCn4fsLM4CW
 CHKkonbzaf6BmNeilkN/D3pG0/YsjrbAEMbXHQ463NlMgljeYd80wOYnLeTUdNQobgKgeygxACU
 cKdpvdzGo6xiPcQRuww9vZC1Vpw==
X-Google-Smtp-Source: AGHT+IGr7AWlTLZZ6I6jRCI3UHveXoH3EF5kvIp8yBSa2uSawTxl30ZMntbjP19bGK9kb36h2IrNvw==
X-Received: by 2002:a17:906:6a0a:b0:ad5:3a97:8438 with SMTP id
 a640c23a62f3a-adb3242e81fmr1808200266b.41.1748973307217; 
 Tue, 03 Jun 2025 10:55:07 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad39e58sm994306166b.146.2025.06.03.10.55.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 10:55:06 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-60461fc88d7so11879641a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 10:55:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVRdjNQUNPe2NFC6RXmj+APMl/wHPjXqGzugvg2SqOVxln6ORvLOUTSfp9kUiJww9YDVMEGfvD4ASg=@lists.freedesktop.org
X-Received: by 2002:a05:6402:1d4b:b0:602:17a1:c672 with SMTP id
 4fb4d7f45d1cf-6056dd5cd6emr17985307a12.8.1748973305522; Tue, 03 Jun 2025
 10:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250602170500.48713a2b@gandalf.local.home>
 <20250602171458.7ceabb1c@gandalf.local.home>
 <aD4boBrdZXtz_5kL@casper.infradead.org>
 <fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
 <20250603102959.20c85adb@gandalf.local.home>
 <aD8iL4cFoXpIVK_0@casper.infradead.org>
 <20250603132736.554f611d@gandalf.local.home>
In-Reply-To: <20250603132736.554f611d@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 Jun 2025 10:54:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com>
X-Gm-Features: AX0GCFuRcH8vVPhe4YXVxMZojF04nrgUVpEyUgoXeIKviV3b1cQy4lAyiTFx_xs
Message-ID: <CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, 
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

On Tue, 3 Jun 2025 at 10:26, Steven Rostedt <rostedt@goodmis.org> wrote:
>
>  config DRM_TTM
>         tristate
> -       depends on DRM && MMU
> +       depends on DRM && MMU && SHMEM

Yeah, except I think you should just make it be

          depends on DRM && SHMEM

because SHMEM already depends on MMU.

That said, our docs already say that if you disable SHMEM, it gets
replaced by RAMFS, so maybe just having a ramfs version is the
RightThing(tm).

I don't think such a ramfs version should just return 0 - much less an
error. I think it should always redirty the page.

IOW, I think the "ramfs" version should look something like

        folio_mark_dirty(folio);
        if (wbc->for_reclaim)
                return AOP_WRITEPAGE_ACTIVATE;  /* Return with folio locked */
        folio_unlock(folio);
        return 0;

which is what shmem does for the "page is locked" case.

            Linus
