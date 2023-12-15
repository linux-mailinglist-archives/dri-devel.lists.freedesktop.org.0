Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A8A8149F2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B93A10EA23;
	Fri, 15 Dec 2023 14:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856D210EA23
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:04:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E5DFF6262C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EFCC4339A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702649079;
 bh=FhKPPt78Vf+g45RBRV5hED8LRF4V4FnS8ClJNfKBzWE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nlJpbftQ06nZVapbe0Ok7n05jmkYBOfvULXbU8nxD2lFMZCny2FrijKviQjTfH9u7
 YsiSG92u1G66ZvXsW9QjsROcp4c648OnrUpO1JnQsV+u29jKusP5Wcoyk7Lbk1dgqv
 b1p4FPgianpV+6QgveqYs3Vzm3QxnUdQ94ud+1KtFpJmXB/nTf3Tsg108uK779FnpE
 wQVstefqnkKiqid2yPyM92CxY1IsEljZb+iN89/JgXuBrgik1WTLm/ZUmjqVfCy6fO
 oI3IFi1DQyDE5R0BA5XQdOp8Z98k8XCqqQ+HuisJXQ98v40KpLTyiEeutVCIk8lImP
 QjJNKL2p6nJag==
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6d0a679fca7so338052b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 06:04:39 -0800 (PST)
X-Gm-Message-State: AOJu0YwfImBmNNHCixAIic8Ou9NFlpU5ocjC2K+54bJMG1RT2nSV+8Qh
 QSRul4IikiR8qrwwYNKC51gAsSzVTrGXnkqFY/d7kA==
X-Google-Smtp-Source: AGHT+IHXl3PbCabFeCBXX/vu1waa28tWQ/3iP9BXV2/Ojdvj7XaW81U2IoB2eB64jfdS+JJaXtOi+d5jmnjcOLwYVGc=
X-Received: by 2002:a05:6a00:886:b0:6d0:8895:2cb with SMTP id
 q6-20020a056a00088600b006d0889502cbmr5344546pfj.34.1702649079148; Fri, 15 Dec
 2023 06:04:39 -0800 (PST)
MIME-Version: 1.0
References: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20231212075257.75084-1-alexander.stein@ew.tq-group.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 15 Dec 2023 15:04:27 +0100
X-Gmail-Original-Message-ID: <CAN6tsi5fS1bBdExKjtZDArAu3Q+K3mWS6WJ5ao3q=1N+vQJ4XQ@mail.gmail.com>
Message-ID: <CAN6tsi5fS1bBdExKjtZDArAu3Q+K3mWS6WJ5ao3q=1N+vQJ4XQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Improve tc358767 regmap usage
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 8:53=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> this series improves the regmap usage by cleaning up current usage as wel=
l as
> adding more registers to the list of volatile registers. SYSSTAT is added
> to the list of precious registers as it is cleared upon read.
> This series is based on [1].
>
> Changes in v2:
> * Patch 3: Use more symbolic names instead of register address numbers
> * Patch 3: Add register group description for 0x300 and 0x400 area
>
> Changes in v3:
> * Rebased to next-20231212
> * No changes despite the context due to commit 4dd9368671fb7 ("drm/bridge=
:
>   tc358767: Convert to use maple tree register cache")
>
> Best regards,
> Alexander
>
> [1] https://lore.kernel.org/dri-devel/20230817075234.1075736-1-alexander.=
stein@ew.tq-group.com/T/#t
>
> Alexander Stein (7):
>   drm/bridge: tc358767: Use regmap_access_table for writeable registers
>   drm/bridge: tc358767: Fix order of register defines
>   drm/bridge: tc358767: Add more registers to non-writeable range
>   drm/bridge: tc358767: Sort volatile registers according to address
>   drm/bridge: tc358767: Add more volatile registers
>   drm/bridge: tc358767: Add precious register SYSSTAT
>   drm/bridge: tc358767: Add descriptions to register definitions
>
>  drivers/gpu/drm/bridge/tc358767.c | 171 +++++++++++++++++++++++-------
>  1 file changed, 133 insertions(+), 38 deletions(-)
>
> --
> 2.34.1
>

Applied to drm-misc-next
