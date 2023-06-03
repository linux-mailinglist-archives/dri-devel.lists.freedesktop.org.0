Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A60720D8D
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 05:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DBE10E02D;
	Sat,  3 Jun 2023 03:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AAB10E02D;
 Sat,  3 Jun 2023 03:13:09 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94ea38c90ccso39139866b.1; 
 Fri, 02 Jun 2023 20:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685761987; x=1688353987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Usb7s3F8Xcfix1ovSHJbrYw1xUMhb/AXZoRNHGtQMu4=;
 b=bkpouXYiWv5DvZQEaOW/WHkl//foa4/btTP91qA+yLpwAEzE0YgM9ALdYSL572Bj++
 4mRXbYEcl3wP/41wCyd6POXHidubgNxO3ooDCj8hWB1/3+JvJkTDSeSUlk6SPNo52QIU
 NNl9jhEYndnd482CwXO2Htea2SrGYJBZOQ6LQPlZ4Cnozk6NazfFHM4poPDDPCkINuv+
 /yenzoAfN3uO0JbcqZXHOkahVJPpXvAN4reSRUVNZxOAmjchuyDPcKaYfGlZzpTwu/Lq
 RFWTS/AQqjfYTr4kag5c2gCC5nSqaKG4iWyp3jI5NGZd1tR2atwzyUoBX3wBoMTyDJSA
 KgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685761987; x=1688353987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Usb7s3F8Xcfix1ovSHJbrYw1xUMhb/AXZoRNHGtQMu4=;
 b=W+uVBHA92X1snjWd6xgRzjPRKVFYTGUfNdFlE38OY19oLrVnj5VjJMfduYs3ovRZnL
 ruEMWxnDr3feqrxgIfqsjboo4sEoholG8Zu1jaxvUChO4cYkl5N7RwFgUf+BbXGOHiOC
 hbJXsgIbVXXS2s3qJB9nlvUa5QuMH6r5mOixnIVIuglPalEBasLCLhaqw5JKmjFsKWgf
 rtm+ZlvrSkzlR3gFpmDw71R4AYIiDMKBWf4rQii2bKLXnvdn2TlfhjiEZMVd9woH54++
 sncebGy5DEhhFJy+O6BfWF57XmotGzCIrAd8Vg1MHmtBDKRjwZWsUQDG1Co49toC2Mk1
 8PNg==
X-Gm-Message-State: AC+VfDzGYLCc24/R7nidRzHiGpESYmGBM9W5W9JQ0xqSbbhtbh6w2HJy
 DnptugEn6GqumFbmHU1NJW4JRebB5AoVyQS8SUo=
X-Google-Smtp-Source: ACHHUZ5D07vBton5O5EJBgAy/2QO3MN1X4cvxATItcSokD+xAqlFk4XJXnM6Fy+xPS49b3Wp5e7yKzAAB17LJrSEx4I=
X-Received: by 2002:a17:906:145:b0:94a:5f0d:d9d6 with SMTP id
 5-20020a170906014500b0094a5f0dd9d6mr11500293ejh.4.1685761986837; Fri, 02 Jun
 2023 20:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230601214814.2329224-1-olvaffe@gmail.com>
 <CADnq5_NQ2zgvRDZ8NWUsCm-8JO6PZSEmQ+WrbjYqjv3vTLfinw@mail.gmail.com>
 <CADnq5_OmrnBhRbRZ_0thdKktNsSDG4w7dr8Vn_sbiNT2_t2UQA@mail.gmail.com>
In-Reply-To: <CADnq5_OmrnBhRbRZ_0thdKktNsSDG4w7dr8Vn_sbiNT2_t2UQA@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 2 Jun 2023 20:12:55 -0700
Message-ID: <CAPaKu7RuyPMBb2gAKCa_EhXyar8QpEEJ3zwRBP6dXdOc-VSasA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix xclk freq on CHIP_STONEY
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Le Ma <le.ma@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 2, 2023 at 11:50=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> Nevermind, missing your Signed-off-by.  Please add and I'll apply.
Sorry that I keep forgetting...  This patch is

  Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

I can send v2 if necessary.
>
> Alex
>
