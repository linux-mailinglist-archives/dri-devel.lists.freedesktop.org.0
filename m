Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BD4A19073
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 12:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E3710E6BD;
	Wed, 22 Jan 2025 11:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FVoi6x76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E573810E6BD;
 Wed, 22 Jan 2025 11:15:44 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d9f0a6ad83so4640978a12.2; 
 Wed, 22 Jan 2025 03:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737544543; x=1738149343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3N7KQWc5ZSYL4c3U+Bo/Fk2vvjtKAhcZmZ6nzcJVsV8=;
 b=FVoi6x760lbTBCRxfO7tbmEa35eJVCJa7YTxcBsUbKtRaXjaovpqjYVPNwpLFsHLDe
 Cc4tGNnQX7qAjdUZd/vOqrDzOX5Csf2Q6VNbbXh8WIBsDGlh+vZSBq6hNDSUZCMB8MDU
 yEGA85aRqL59csRO+AQHEU1XWoAXbYdE86fXKXMvaAJ+FOwUps9N9kV3L7T8G5Zbt0Te
 enfxRa2kmQUknEQ1UlwdS2GFHfDt1OTdzAx3/zuTUKNM1VPHET6sKdmQjn40iLgIna/r
 H9tLi6qa5dxYjh3BDW8el6yEl8VTrBih2musj94vmTWrgxuRbi4/zdw7uGm6Bfv5bhWj
 aIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737544543; x=1738149343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3N7KQWc5ZSYL4c3U+Bo/Fk2vvjtKAhcZmZ6nzcJVsV8=;
 b=u09GwEf9zc/9mWWwEo2/spGtitFFGuxCyXJoe1V0iocurOZwNmGcBVxR7FtUMbKsW5
 NMTyTo24K+i1r5CV/Gm0yOU0jTTD2hTbwCjJmxHyeu9PHtloj1JoDXAAbd33G0GGBqK+
 eFBw8t/d7aGzlFYXWooLm5cNJT5AEUlP47EIsjvd0mVlFPMcl8U4o7oE+qA1YRIhjnSH
 iGSBifqjzG6+X77DLrL1kB8bukWzJsFLPF7fcbfOZohgSzqSuGkl27ZjCEF9gdVWcm9o
 gG0oVUqgnvAazkFIed2FyZUvj345ZMgijBG7trWtzTVpxmTbTfYRT+cegsnBX+bZ/5ED
 rwsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCKmLGR3P0fT0CKr6QHvdiNrAezU5z8RUOoFdI4bGqvHBQH1l7juVQ5urNBE0YX8A8TmpSploHWNc=@lists.freedesktop.org,
 AJvYcCW0pbcG5ViJTx6ZezaFolleEb/ES5huupi0rhxlWDY4B8njFAgQ52LCwE3vXBGR7bPNXaBhH30KMcE=@lists.freedesktop.org,
 AJvYcCWqpb6sTRVS0U+eidTVIhokedZwZIXaYaKiPVDHnnsM9PFfh94qB5RBbs3YWVklKT4sLP3XhHNOGKvq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybIfLveOdEEVqTcEWzzNogNO+U+ttu/XQ5Yq6a7sGa3xHGS2Oq
 Ko3gYBCcM8yE+DwkXmlFSt3D+tNNB5ci0wMkmQHwdwMVlbHuELxtromUWakhKkRX7KfC2EAU8nQ
 Fhu89Mb/S04cNcx1UfG5lanNm1nc=
X-Gm-Gg: ASbGncuz9EatPsaGV31PXdFhr8F18yqDVgeELj4RnnmIko62Hl/tvehjaiSE4vaP+iv
 gQCD/YhohbtwN4aWruVFG5q+2gNvXXWRUxKk+9jOn3prGaUO8X94wfkND+a2iyv8x1y+2y99+tS
 lCWj5VmQ8=
X-Google-Smtp-Source: AGHT+IFgz5YD2/eL7o6fQ5cyTA4ydywFqk8/+MSm88wqp8wQKkf5L8zUNwvIOar+Rg1bS9e/JOQf+nS36W9EB2VHACI=
X-Received: by 2002:a17:907:969f:b0:ab2:b863:b7fa with SMTP id
 a640c23a62f3a-ab38b43b915mr2064916966b.44.1737544543181; Wed, 22 Jan 2025
 03:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20241017075725.207384-1-giedriuswork@gmail.com>
 <CALt+6nqxMZjuZuOKaj8Cx4dcNZx0n-0F9aa97d-vZoMWeN=bOw@mail.gmail.com>
 <Zyk8dFthM0EA2A_K@intel.com>
In-Reply-To: <Zyk8dFthM0EA2A_K@intel.com>
From: =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedriuswork@gmail.com>
Date: Wed, 22 Jan 2025 13:15:31 +0200
X-Gm-Features: AbW1kvbJVUteULK-nbFo57ZObMeweZV6uJOdBdm9RnyIRoQ5uhfPq6KQacKM6ig
Message-ID: <CALt+6noH3qSJNFYeVmhhGahcFiUsti5Rbt8+ef8QKOi37neaEQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/lspcon: do not hardcode settle timeout
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
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

Hello,

On Mon, 4 Nov 2024 at 23:28, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Mon, Nov 04, 2024 at 02:09:46PM +0200, Giedrius Statkevi=C4=8Dius wrot=
e:
> > Hello,
> >
> > Kind ping.
>
> There was a pipe underun in CI... I honestly don't believe this patch is
> causing it, but anyway I decided to trigger a retest there before I push =
this.
>
> Thanks for the patch and review.


Ping. Could we merge this patch? This plus another patch (that I have yet t=
o
send) fixes replugging the HDMI cable on my laptop.

Best regards,
Giedrius
