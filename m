Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5B9A222C9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 18:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5E610E84E;
	Wed, 29 Jan 2025 17:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eCuJH6xD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA37E10E84E;
 Wed, 29 Jan 2025 17:24:02 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so11830790a12.3; 
 Wed, 29 Jan 2025 09:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738171441; x=1738776241; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q29os227sr0JVecE9XA4U6XGJadvG6XGthSvYDjeL/k=;
 b=eCuJH6xD3ynQ+j/IkBLyjkIh4qZJxCQ7r2jvtyKaXE8yNKanC1X6iudHmFJUT0GtfE
 F+R1zZ1MUptEIsHoAsYqIxlowcl9p8Jh+CZZnOjcm0vpaowrmtgwzzdoYKQSxFRLxNTV
 g4ZJYEtNsAagJBSJmpTr5ZdF62vU+RkIjyW6uIAJpzZ/wAwQJjgQ1arILl7gi4u2NfPk
 rCkc4sLKPbJG7y8YLIT372Y8uvwElz6ooTExry90eQ9NCOI4okm0YVKM6Apmf/l543I1
 Vfw96OxiMj4nlvqIVY8aQb3/bXyBXavgpJHGYOOOwSYmKx2Rmi0oH7Ee2B5hJggOAVRc
 gf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738171441; x=1738776241;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q29os227sr0JVecE9XA4U6XGJadvG6XGthSvYDjeL/k=;
 b=j94GRqzFMEgzvQvRIFodCsvH6BoVslq0JzBxiCU2z7aN6WjPBMiIcZvB+HTS2F8Dw7
 Jp3Z9jcu4qVAaBidYUpskuWaQD238QYKKpBLkCG7B3Ufpeqkt3+0aXBUljBlX7Orbca4
 fEhv2NQsJ2IOL/Px+TUGn7DLk5HJ7R1H/nrOol1cNXYq+Asw1yJFgvCJqMyK4HMGg5m7
 4i9ouV9G/dE8Ngm3UYg6ALWLsBGmxucNrkmK5oR+iTgOhJ3ag9DdpIyr4UUrSDlCM0HY
 B6loispUydhaWR8EzBN6r+W1nWj326F3YuELCwfX9iFNmz1mVYLG2CIvFYzccjXY+XlJ
 Eu+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/vq3rs2zns97t5W3xEnsgD2pq23Idpq1NreuCUUP6bvc3NtDF7mCoA+ypZUHWHrV0zlDfmg//704p@lists.freedesktop.org,
 AJvYcCXZdZnSouKl85l1dRKJ96gGDimyKUJiJDFCLXimuzUXwUnWMn6lWY647g6VVxuox1jjwvTGxIv0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyKlV4lPQl+b7vGH0mOlHafQtr1cIdeuXtKlPteAXjvHOzi7qv
 RIWiKK2MGxirHusZ6XusyYZA0R/DzETfq88BXZojp0FfGS4dax+kqZBGG3mYlBUd8lN5DZRzbPg
 SlNZMDZAqzki/Weh+5oMy7CXGZEY=
X-Gm-Gg: ASbGncte2VuAu+0rWmiThDZPnP/bhHtQFyUzZnUE65NIHj3TcMkS1GQwkbP3b+bdcBC
 lxNYdFI6gpuVFECQ9SjO06iPIzfNS1+CzsP+mHvb7Zc1JGw6pMeDY3Ye+k2QMHG4AXw8uKLxeJs
 CfVcKFrg8IySZCfD67Z5cW2CgUU1ZKZ8o=
X-Google-Smtp-Source: AGHT+IEAhq21i0843XhwOi0NisXkbV7e04L9GG9HuBT6CYkjpEXRtekenqgmUim+F4PinLHysdJ/6+Hnsr7N79ecVRA=
X-Received: by 2002:a17:906:5785:b0:ab6:d575:9540 with SMTP id
 a640c23a62f3a-ab6d575972fmr274567566b.50.1738171440900; Wed, 29 Jan 2025
 09:24:00 -0800 (PST)
MIME-Version: 1.0
References: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
 <20250127-tonyk-async_flip-v12-2-0f7f8a8610d3@igalia.com>
 <CAFZQkGwG7FLU1Lw8aRo20ox3ccJbEntSB=iZZURrXEJKLQoyhw@mail.gmail.com>
 <59b06cd5-979d-47a7-b955-c565b23ae21b@igalia.com>
In-Reply-To: <59b06cd5-979d-47a7-b955-c565b23ae21b@igalia.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Wed, 29 Jan 2025 18:23:49 +0100
X-Gm-Features: AWEUYZnPrRRKe3lXHg_oUyimCH9nDetdP2F1BufWAIw2PK5AUVwTevyjbSdddX4
Message-ID: <CAFZQkGyy_Rn-m2j5Lx3Ci-X7bj3atvdub15F96HbO9c+J4Z37Q@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] drm/amdgpu: Enable async flip on overlay planes
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org, 
 Simon Ser <contact@emersion.fr>, joshua@froggi.es,
 Daniel Stone <daniel@fooishbar.org>, 
 ville.syrjala@linux.intel.com, kernel-dev@igalia.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org
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

> It's not the intention of this patch to disable async updates on cursor
> planes... but I don't think it's happening here? Async plane updates and
> async page flips are different things.
Right, these are different code paths. Nevermind then, it's just a bit
confusing.

> Any function that used to call amdgpu_dm_plane_atomic_async_check() for
> an async update on a cursor plane will continue to being able to do that.
>
> For callers of _atomic_async_check() from a page flip path (like
> drm_atomic_set_property()), those couldn't flip a cursor plane, and will
> continue to be like that for now.
>
> At least this is my analysis, please let me know if I got something wrong.
