Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4472E6E4E3F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 18:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5608710E47E;
	Mon, 17 Apr 2023 16:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8BA10E467
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 16:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681748731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTTtRzBVTjjwCLzyfJV4ohTaunXWOeVeAb2RjGQ5vZ8=;
 b=XalNanORxrz8GQFbP/b9m/q6unvFauLBOaGQljALOXGdyfIGdtZXUSsGgdXXs2QdyhQgiw
 gt1KSXb82CiVfRQ4izQ0Xu3nZMWMsKZsEcAHL3UlMd8j7DBWapyqay8PVdmYY4v/oQ7WD5
 IGIzrjO4W5sG4faxgnZJ8LD8LY1GDmY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-nQjJ-0ndPH62AY5P0lw1DQ-1; Mon, 17 Apr 2023 12:25:30 -0400
X-MC-Unique: nQjJ-0ndPH62AY5P0lw1DQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2a8a54fc72cso5671431fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 09:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681748725; x=1684340725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xTTtRzBVTjjwCLzyfJV4ohTaunXWOeVeAb2RjGQ5vZ8=;
 b=ON+nTOch4qYHjNjeOH8A3G5Wjz5X+qUDH6u8QvV9MBdPeuwy7QkYIgAAtCyV23rvjy
 qFsQjtRJZGJweOmsbTRi49w8T3Wj0KG5X9UYTqX4Rf198rr7YiVO7JlGBXntqAAwKNch
 V80Ry2JnTuQEziuD+7mp9fEo7qFqwmR1yHDyZxrMiJyQzXsyvkCjE6FkgO+48AX3N1sv
 0XzdiCppHU7n0po79qeq/j9SJ8x+8KzAPa7oECmo5zZYVwqapNuzAnbVel0oNq+RNbhK
 P6FfHOfaiGDaZLo5G7Syakuj6sPD4jx5rrJaT6ou9Ne38Z8JQnKquWUiXhqE/KpoZD+x
 zVbA==
X-Gm-Message-State: AAQBX9einr7jyK+0B7EaNuLUJU3shFX6O3ywa1eXu3MpZW0fQP/HIOX8
 SzwL/QHeaZft/cp7lGdrwMSyRKHl/qEmQJ6fqnM6medi82QQf/7vQEfmzYXz4Ru66BG+3lbME02
 QlvLgdpcQRBibE2oTae9TlQeodoxEXP3GQ+voyZhNCiYz
X-Received: by 2002:ac2:5dea:0:b0:4ec:e32f:3d1f with SMTP id
 z10-20020ac25dea000000b004ece32f3d1fmr2308541lfq.11.1681748725393; 
 Mon, 17 Apr 2023 09:25:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y+bsYZfdQ0YbXRNUdAiXrEC617Co8M6Ae9OYtGyQ7Z0JTehg+Oxteoxe+dPaIDFHLfU5sWj8/W0mxSAgomtgA=
X-Received: by 2002:ac2:5dea:0:b0:4ec:e32f:3d1f with SMTP id
 z10-20020ac25dea000000b004ece32f3d1fmr2308529lfq.11.1681748725093; Mon, 17
 Apr 2023 09:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
In-Reply-To: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 17 Apr 2023 18:25:13 +0200
Message-ID: <CACO55ttSoyhgjqMdtiEfhMP1YKFFTZJRXEv17F-WRWPzLF2Uvw@mail.gmail.com>
Subject: Re: [PATCH 0/9] GPU-DRM-nouveau: Adjustments for seven function
 implementations
To: Markus Elfring <Markus.Elfring@web.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 16, 2023 at 11:30=E2=80=AFAM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> Date: Sun, 16 Apr 2023 11:22:23 +0200
>
> Several update suggestions were taken into account
> from static source code analysis.
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> Markus Elfring (9):
>   debugfs: Move an expression into a function call parameter
>     in nouveau_debugfs_pstate_set()
>   debugfs: Move a variable assignment behind a null pointer check
>     in nouveau_debugfs_pstate_get()
>   debugfs: Use seq_putc()
>     in nouveau_debugfs_pstate_get()
>   debugfs: Replace five seq_printf() calls by seq_puts()
>     in nouveau_debugfs_pstate_get()
>   power_budget: Move an expression into a macro call parameter
>     in nvbios_power_budget_header()
>   clk: Move a variable assignment behind a null pointer check
>     in nvkm_pstate_new()
>   pci: Move a variable assignment behind condition checks
>     in nvkm_pcie_set_link()
>   pci: Move an expression into a function call parameter
>     in nvkm_pcie_set_link()
>   therm: Move an assignment statement behind a null pointer check
>     in two functions
>
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c     | 19 ++++++++++---------
>  .../nouveau/nvkm/subdev/bios/power_budget.c   |  3 +--
>  .../gpu/drm/nouveau/nvkm/subdev/clk/base.c    |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/pci/pcie.c    |  7 +++----
>  .../drm/nouveau/nvkm/subdev/therm/fanpwm.c    |  2 +-
>  .../drm/nouveau/nvkm/subdev/therm/fantog.c    |  2 +-
>  6 files changed, 17 insertions(+), 18 deletions(-)
>
> --
> 2.40.0
>

