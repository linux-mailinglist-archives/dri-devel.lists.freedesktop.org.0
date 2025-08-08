Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA4AB1F124
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 00:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D62610E1FB;
	Fri,  8 Aug 2025 22:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="XnWl9Ace";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E5310E091;
 Fri,  8 Aug 2025 22:53:12 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 08B8B33DDAD;
 Fri,  8 Aug 2025 23:53:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1754693591; bh=A8Lw8n1IVBtwkZR7h5aK6n+Rx2v/gD7XRYiG2a6qJzY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XnWl9AceZxoHIJHx23pk8Joivqps5OVUazrEOVKQwnIIG4e8oCZTRqNtT81TGx6c9
 pr9IcRKmiFbXfyTwGcUl6+jd1FLIU1I7mM7wCNc7ukoxgSx4EpPF2GoLNNO2YPMtDL
 XRiaNPaqe/mAl5g+PhkrS1uAVsuVjX1vkGtRtECEL6vF/fbjOVNJCBPrKJYoHaVCu8
 X6WfhwUCWK+/LFf3BB3jV31PalfXZnLEroGgez9syVQ/zp4nf2yByyewUvqUhvgm3h
 NKB7BtBf3/44hFTqqLrIrbyfXTIreBT8UaI56G8AzEE9Dfl3j/KPKoBXFxTUlF68Ul
 FU4dStY6qlygw==
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ae0bde4d5c9so498299366b.3; 
 Fri, 08 Aug 2025 15:53:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAl9pvlVLaGvQIeWaTXw+PE2PjYF4DQ8lzBE0DeUheG1jKHcjsArZY7ursESXauPp0L//oIooP@lists.freedesktop.org,
 AJvYcCXGLdO8j7Yja7mDHgoRfK5snRV7yyzR6mYG/S8QBlAKDsOiGZc5xFnYYtd0IxOOYQqQ2xTVY0OFNsAe@lists.freedesktop.org,
 AJvYcCXIgCt1gmhTmGVR/fniWPtVVpcjhiosRUs/ROIbKAkhK/CQIwAfhuFEN7C9zJqQugxSgo90rg+tQUbb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuktTXreHAcseFs+zgp7crdGV/PWEMGx455bAEQFmEbE99+Jhz
 vgzaRNMY+k477smjiRAhvpN2fkFxUobHaKJb6yGZp38PEfn7e46+phJMrufYghv/hfYDEYtW2dx
 8zhJGdsEFGKUthVBqn7YCYFzHGcgiWHk=
X-Google-Smtp-Source: AGHT+IGtYlZ5tumktZPMAHPpzXi2sV3memt8DCuUmS77VsedA/NOfqLPJBGofHGqEop0PZP4PViOqIa46ZOLRZSTFqA=
X-Received: by 2002:a17:907:3cd3:b0:ae3:e378:159e with SMTP id
 a640c23a62f3a-af9c63d4a85mr400338766b.26.1754693590535; Fri, 08 Aug 2025
 15:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250801131053.6730-1-xaver.hugl@kde.org>
 <ad9b68cc-4a33-406a-9512-ff5f5460bf99@intel.com>
 <CAFZQkGwviMAshk5gSF0pDmkqbfZT=6FHCfNq6PWj8srNEXjX7w@mail.gmail.com>
 <BN9PR11MB529028C2BFB87E7751ED42B7A722A@BN9PR11MB5290.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB529028C2BFB87E7751ED42B7A722A@BN9PR11MB5290.namprd11.prod.outlook.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Sat, 9 Aug 2025 00:52:59 +0200
X-Gmail-Original-Message-ID: <CAFZQkGx1RSZGAzZ5r2xYt2KruBvGBxagNO1J9qWV+_ip4CW6xQ@mail.gmail.com>
X-Gm-Features: Ac12FXzkuKLZ0Xm2flbfGjDiUOoVJtLTmYudJ0B-halzCMekWKrKlnt9GxycFto
Message-ID: <CAFZQkGx1RSZGAzZ5r2xYt2KruBvGBxagNO1J9qWV+_ip4CW6xQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm: don't run atomic_async_check for disabled planes
To: "Kumar, Naveen1" <naveen1.kumar@intel.com>
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "chris@kode54.net" <chris@kode54.net>, 
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>
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

> As I commented earlier in the gitlab issue [1], any change of property, including disabling a plane is not allowed in the async commit.
> We must disable a plane (e.g. HW cursor) during the first (synchronized) flip, and allowing later flips to proceed asynchronously.
> This change should be done in the compositor.
No change is needed there, compositors already do that.
> As per Ville's opinion in related series [2], kernel driver should reject all these disabled
> Planes in the drm core and driver should only get the planes which is supported with async flip. Based on his comment, I have started
> Working and will be addressing it in the next version of my series [3].
As long as it only filters out planes that were and still are
disabled, I think that could work out fine - in theory they shouldn't
have any side effects.
Note though that my patch intends to specifically fix a regression for
amdgpu in 6.15, which I think we can do with fewer changes.

> [1]. https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2994595
> [2]. https://lore.kernel.org/all/aHAg2J-uFLLWINqp@intel.com/
> [3]. https://patchwork.freedesktop.org/series/151280/
>
> Regards,
> Naveen Kumar
