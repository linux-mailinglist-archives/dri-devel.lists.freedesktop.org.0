Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B193B049B0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 23:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7548610E4EE;
	Mon, 14 Jul 2025 21:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="l8WQrWjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5748210E4EE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 21:47:23 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-236470b2dceso42355065ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 14:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752529639; x=1753134439;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1KAFEjbZF04jSsLnT35V9ZUTLej5gO86eh46Ao3TCLs=;
 b=l8WQrWjh4uxzYyU9Wq+7Hmz8zBom7Cue8mroytjDAsHkz7wnaNbifvPaK70VVguOK+
 MICNFzt46GtxtQqwnK6kFsFV//tfnzgIjkvKOHnRsScaYlQTpFyb/pSiYhDdtLdASFVv
 27XH5RF0I/6JmxDbS4+2Ew0rrD7WnSGPds7TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752529639; x=1753134439;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1KAFEjbZF04jSsLnT35V9ZUTLej5gO86eh46Ao3TCLs=;
 b=bxfG2tXk6yGlf49E1kfgeobl07DGEMgB99QT30AddNHhV2526H8bHJNun32I13Spx5
 GRyVpbr/7vVTWRkUqfENccz1wvtFgw4nIicikpa76pEjfJ1fGdQqWq2if6crzpNLuKP4
 krwGe4fQ0iLYBLJjS99HzbhkT7I1qmvjmW6XzSrsFhvFFGoKOCeMB7W/9MjjPXzOpeqV
 sdF1DZ6cvh9Lvz30s4ws1RbqhsgH3Z0Viz3seKIDLAedelB4elNg+7Y26PHQWaenRQcy
 vnZYjAnRwkCUgB62s6kpSBFmfjZmcHBYL+MUSHmHi/pcFySPOTKPu2LIuZBJDLnma/Ff
 gG/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTJw9Y6r4KQhVAxPuWPD1TQ7XQhETG3m41GH+zxqbqAC/c8y4beAkglPEk5Ng2qFS/o0kYIeEvZUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0LBEEWv9c9O3ZY7AqXpN3ITXYzBZEpNrQr7wTVXYevcAXPtEc
 M20tjiZjhTwzES5x18t/De7qA/RVrC/rk7JmvAaVwmdMyMlbiHYwcS2jIyY9ip6Lcxx7V6V5DKf
 UAOc=
X-Gm-Gg: ASbGnct7zZ82Ovi/5HHLRwpGPq7aqjzIKmlminzrcdnGr1A/GffBSEYcm5vPzpV/Qpv
 hnqmhJ8HjLPir0CQVj7YPG765FW3YAwhG3BD0/XXC4zg6wKXJfieLrMWdojB/KLOQ3LuNtOjSe3
 XIP4MS8JjtmyLFqdZatI+ATNZK4rkZQGIxLSVM6+l1f3FXiEJvxuIKZwjbqWF8k8IQZl5k8S4M9
 l0f/56glE8QJWvkZfRFvQaeQtfk1OLCQkoX7jmpkppnlVzI4V0grfnYYxkzPXF8HlY/oKAY0tH1
 Ve6oCBPA7fw44iTME8Dp/YBOgdUQt3VgOVPE3b1atJy77tWrVT+eNSMpkjkEFw34/MYuNM6wH34
 1ldTnwtyqYc19H8/qbBAOgurJQKuBNb9WpnKXOJFWnzr1HIql59wL0/umqoNqlA==
X-Google-Smtp-Source: AGHT+IGXHJab6+LuXUY6mlVlvKq7hQVgDh7KdztHgM6a/czwplxk3sZWlcx1evC/9ecsqWaG/TZ7mw==
X-Received: by 2002:a17:902:e548:b0:234:c86d:4572 with SMTP id
 d9443c01a7336-23dee26deb3mr218658545ad.30.1752529639223; 
 Mon, 14 Jul 2025 14:47:19 -0700 (PDT)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com.
 [209.85.216.50]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de436ecefsm102927075ad.259.2025.07.14.14.47.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 14:47:14 -0700 (PDT)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-313eeb77b1fso4024221a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 14:47:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtENjXw6lFhoyZ0Y7C1p2jgfnQIBxoPvlyX6miVKWt8b74EWqsB84p46vYa98DlbBzkdBs8Dgkg2k=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2f0b:b0:312:959:dc42 with SMTP id
 98e67ed59e1d1-31c4f4b7cadmr23322054a91.11.1752529629493; Mon, 14 Jul 2025
 14:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250708073901.90027-1-me@brighamcampbell.com>
 <20250708073901.90027-3-me@brighamcampbell.com>
In-Reply-To: <20250708073901.90027-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 14:46:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgOi-ySD=cog_qcV0UUU4Ni1VAAnkFS+kQjdjOe9MMsg@mail.gmail.com>
X-Gm-Features: Ac12FXxH2F0TYcijyhrCQmsQ50QRyPnFNI-fpx9VJR_jePJEeAOSnJSau6lHn7k
Message-ID: <CAD=FV=XgOi-ySD=cog_qcV0UUU4Ni1VAAnkFS+kQjdjOe9MMsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: Remove unused MIPI write seq and chatty
 functions
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

Hi,

On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Remove the deprecated mipi_dsi_generic_write_seq() and
> mipi_dsi_generic_write_chatty() functions now that they are no longer
> used.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 34 +++-------------------------------
>  include/drm/drm_mipi_dsi.h     | 23 -----------------------
>  2 files changed, 3 insertions(+), 54 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
