Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE58CCB2B7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 10:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E33510EAE1;
	Thu, 18 Dec 2025 09:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aqxxtvn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CE410EAE1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 09:28:25 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-34cf1e31f85so408158a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 01:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766050105; x=1766654905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJiWLRgJo9tp7oY1C+RHdHHn+1eyK2bNbYU2ktmgLnc=;
 b=aqxxtvn/qpREXa4Cbhkn8JZzDQn6v2/TV6mK7zBgKQH0BRJoklAfQheEFSwY69mKUV
 HT/7IOZg65XdhSRc6YHGzyNTzf7yUL5rDouogDqgvjQwytlY/Sy9stuO0eohlUDgRQsa
 BIwSOq8FPyh4Eu2j93sK85myyU8oM2Jif1QpH7x2TWQswcuPSVfJipG3oKQOeFi7cztJ
 vvuttCe/53cb2ZDkj/sLvwLiMAB38rO6zJid1i2CVhWnSOqhJBe+y90IL5h+uuCHg/CA
 71E/Z5J0ZjWSXVECce6mWIQ3tvcyEgIpmzrAPrcGHDTCkYKdeo+MYhTpz65ISHgeLSWk
 NC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766050105; x=1766654905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EJiWLRgJo9tp7oY1C+RHdHHn+1eyK2bNbYU2ktmgLnc=;
 b=ngFeIMZIFpCO4p6iVMv5hKoRiD1qVFl8co6Bnmz8leH3NmnYsxyAH5cP6h8I4tkAnb
 NxAjBJSbZQ43X+MHdy4D+ZXfLKDY6Pw9QT8scHDn0LI9af6cQUewY1Cfv+iBfxUqNDGQ
 ufNrZaEUqRIX/zXWXKPnB10SYoT/oQArWVB2SBcFrHzcjC6H6IYYOTAadH1QlGdcpu0v
 fZaoEGjgyJOf647JFqUFH1wDwr2llWhQQk1gqt02f1mLJYr36Zys8HS6ViCZKhDxp8d2
 gAUJfrFN9UfZbUPoQn0sHGpsmpKlWBzvMG9760HpsGyetl7S28kUjKeQVX13epbN1Z8f
 xrdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEyA31mZ7TcaXEIUdCwAbks0H4YrTvmcCKd2a/JfiXrLP0PlhsJ/WZ4i/Qm4BZu7DGRyLcqSnISnM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAEGGHbMfNrKCPvMbMfg9LtY5ELQiAXcI7BnKXMvCFTPOl7Xkv
 w5Dqv2H47+ncAxPIFTwfVATar7s0TzZwwAYYCQvWZUGYjFbTGKGR8iMIK3KgwejuGxQsc9aGU+O
 Zk9rJ6Wy4p7oal9sfm+yZ9sVnXKMD9tk=
X-Gm-Gg: AY/fxX6RiTr8Bfmc3XmzTvrfnq5dMvUvjN7XMIjHwLILVBVYYOrKppbA7Tu4aj1HLBD
 Utzkc0faBEn3etnZ+nxdvvagofIiBLvozL5yXHmR5htE2epkpZ61bI2mVBzZSGd4pq+HmfdR7ne
 M5WQpsZbaf3jQjtZ3vm8r64h19GTlA32COirb2sMXnlo4UOFDrRnPWlRaggW3tcWkYVipLm9Rs7
 U4biDQ0sCir0hjW65mafM+gXRTgPSQqzNgh1pCj4Mn6+ZkPpv5ojgNMYs5x9O233v2VBRq7WmGc
 9yvW3nc=
X-Google-Smtp-Source: AGHT+IEXBcsVc8hlqDUN81ixxAXFeEkb9O19zutWwpIKpuQ7pq9LUb7JZ/885J2I1GT8Aeo3ovjOaxqMuEqAo1owGfw=
X-Received: by 2002:a17:90b:2ccf:b0:341:2150:4856 with SMTP id
 98e67ed59e1d1-34abd7617ebmr22164740a91.17.1766050104749; Thu, 18 Dec 2025
 01:28:24 -0800 (PST)
MIME-Version: 1.0
References: <20251217170104.2767939-1-suryasaimadhu369@gmail.com>
 <b767cb12-3023-44cf-9d4f-2fbb40c1431e@amd.com>
 <CAB0uMAfx4uiXZg5HB=--0Hpnx6nD8pu4a=pWmFK2B8HHx4R=VQ@mail.gmail.com>
In-Reply-To: <CAB0uMAfx4uiXZg5HB=--0Hpnx6nD8pu4a=pWmFK2B8HHx4R=VQ@mail.gmail.com>
From: Sai Madhu <suryasaimadhu369@gmail.com>
Date: Thu, 18 Dec 2025 14:58:13 +0530
X-Gm-Features: AQt7F2pyWG9gfPVDIdJzpXzA3zdgwaHJnjiNZcENzl8bee2Wfatdzc7hVtdotg4
Message-ID: <CAB0uMAcjb2sZ7go+hF8=R2DvdABU=mM1z5PpKTenqkM=6z=ENg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 siqueira@igalia.com, mario.limonciello@amd.com, wayne.lin@amd.com, 
 roman.li@amd.com, timur.kristof@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Thanks for the review!



You=E2=80=99re right =E2=80=94 I=E2=80=99ll switch those remaining cases to=
 pass adev and derive
the drm_device via adev_to_drm(), and I=E2=80=99ll also compact the logging
statements a bit.



I=E2=80=99ll send a v3 shortly.


On Thu, 18 Dec 2025 at 14:57, Sai Madhu <suryasaimadhu369@gmail.com> wrote:
>
> Thanks for the review!
>
>
>
> You=E2=80=99re right =E2=80=94 I=E2=80=99ll switch those remaining cases =
to pass adev and derive
> the drm_device via adev_to_drm(), and I=E2=80=99ll also compact the loggi=
ng
> statements a bit.
>
>
>
> I=E2=80=99ll send a v3 shortly.
