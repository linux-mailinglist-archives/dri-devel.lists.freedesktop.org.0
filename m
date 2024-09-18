Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D497B890
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 09:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A25610E555;
	Wed, 18 Sep 2024 07:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NEIwoyUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B185E10E560;
 Wed, 18 Sep 2024 07:32:06 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-49bd27b3507so1983801137.2; 
 Wed, 18 Sep 2024 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726644725; x=1727249525; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bfMM0evzgmGMVrgr4mPC3hbKeNArMpfP94evBcoK+kM=;
 b=NEIwoyUQzVPA3pbQmM6n45AgbCQkSamjr1RlmH4VhoZs/6FPIwLhr4N1RkoZtudu32
 1bAhC2LSAD/QJTCvi0rrzCz0Co6ZK4HUE0v4Wkw3XF6LvfMBOGieMCIOS2irXlJKn4Mw
 K+0Rc1ux/sS8y2ihfxl21T74FIHZypOlVeJn89S9cKJoRbix5JqKnbacXPhGtIIbYuas
 Wbgb5qmk+nWNmTpXtQiAmBU1PoAEstGpLJ3XgyVvJk1kpnEtamRjZy91BV3Q0kFDnJnf
 at1q7VS70B2pEVT9htN20jx4oQwCmnOFH6owxGIWUZGOlS2b2gRL2mR8YDenpHZ58Xjt
 5FXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726644725; x=1727249525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bfMM0evzgmGMVrgr4mPC3hbKeNArMpfP94evBcoK+kM=;
 b=XO3yBBwVOLo5xAbbJLlDVAHCYIvQJoujTOhpH6N7pHsHmryyFTMdfcAZXMXIwKiZt0
 BAyaldaDVRUAlbkPzQ+6aiq2YFueQ1D4dx1sN+VgdYcKvcBx8k41qY3dCfbQZDT4DGpL
 IewhpVS7IT7Y526ThZoH+ae2h2pTy0qVwQD+tzN9JCBq8irWEEaxodW4PZ5ojyAwoMDF
 FMRedNFUEgOyzScfJn93THbV1NZeCvtMNwpy+voYxTR02SgAAjmYujyNQBS1+lYp6q/x
 hKy+Czpmm3zmgroZbPWTdU4dnt8q/7FWcVrsU477Q8sTtC+iw5lo9dKwvo4vtFGPQ59w
 joZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyBHSiEDM3isVWl2Ej1sSZKUjYg8epx8mWSaPIN7vvummXcsLdglVtKZlPQA6VbhXWWuVmaFt22UoH@lists.freedesktop.org,
 AJvYcCXiZDxsCSuvdmrfCC6kjmigySBGuPrNhSlXPjz0e5mEOeWGnGxkQ85MlI24G8CnRt11MRgBOfts@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB2jaCVGLiaymIEw5U1O3hQ9bH75Cdp90HDXko/MSLOj1cjTdy
 v2A5RM7eftrdt5QFgPa0nhJhK7xENeHxC5EvZXGVCYpha02/Ex0tgkQMiBMBNTG7IgIQzdgI2Zs
 l5Hfz4AeSt8+69ZgGeXiJoTEol24=
X-Google-Smtp-Source: AGHT+IGCRcnc2PlFvH8xKkbZYgbxx9nzF5mO9R6LJZYHePEvGjbW5Wpm1KxJpM/qMvHgWttk3emFix3YOyGlURI2f3M=
X-Received: by 2002:a05:6102:36d6:b0:49e:928f:7976 with SMTP id
 ada2fe7eead31-49e928f8017mr2780150137.12.1726644725399; Wed, 18 Sep 2024
 00:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <CALjAwxidmwCT5ZwbZRhf9GwshYbzQZ4N8K3B8KGLi5DnRzj8wQ@mail.gmail.com>
 <CADnq5_ODjqwMS8WNbjdMq++YU3XeVtEEn=KnyoWOzdddyyUw0g@mail.gmail.com>
In-Reply-To: <CADnq5_ODjqwMS8WNbjdMq++YU3XeVtEEn=KnyoWOzdddyyUw0g@mail.gmail.com>
From: Sitsofe Wheeler <sitsofe@gmail.com>
Date: Wed, 18 Sep 2024 08:31:39 +0100
Message-ID: <CALjAwxjQDKsOdGs5As7sHa+gn_1SYE_LLQ4wDDvB_9NYCTLG5g@mail.gmail.com>
Subject: Re: Kernel hang when amdgpu driver is loaded on old radeon card
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
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

Hi,

On Tue, 17 Sept 2024 at 22:43, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Do you have secureboot enabled?  If so, perhaps this is relevant:
> https://bugzilla.kernel.org/show_bug.cgi?id=219229

The system is an old HP MicroServer N36L with no UEFI support so
there's no secureboot.

-- 
Sitsofe
