Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAA08CB319
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 19:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B1B10E4B3;
	Tue, 21 May 2024 17:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="afymc3ie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6705310F017
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 17:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1716313353; x=1716572553;
 bh=L1L6tJL7FUMNnnIjbCYfO8hZtNcaRUOZsZv2E/Ete/c=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=afymc3ieK2jQ3dC7Gn9lXG7oaVon6beBfyrxphdAfRLh5VQji43btd8JHT4Ybx+OQ
 sEnCX4q0q3tDOlLeIskoplmWRiVsDJBnyCgclhgFzPuNeXt+NKdag6ULlKxxpjDrUi
 LhAlqzqUUfST6KWTDBUllzQPDK2+GTBs7KY+Wy8eheRZe5IHc9HGR4z5/h/qkyITko
 kzSx2UX0RSxfP34xHTSWQrU6rBewQUvXLP1SbqckDkqRbGpWkQKsyPsLuGoEdm9H2W
 wrowqZLvVr8n+aicIYSAO/CdhfuvIDDbBoRB0OC7srkIaNmijj0AKsQiYrbK1gfvCZ
 sDJe/jiTN2/Hw==
Date: Tue, 21 May 2024 17:42:28 +0000
To: Leo Li <sunpeng.li@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 Harry.Wentland@amd.com, dri-devel@lists.freedesktop.org,
 "seanpaul@google.com" <seanpaul@google.com>
Subject: Re: [PATCH 0/2] Add support for Panel Power Savings property
Message-ID: <9Zj-hj9tIhcJycsfnOQgkpie7ixzYOC4Qoto9911yvooDOLrdB4ZqkJ9x6byeY6IkuPqkbXx178cXZK0wDoNErihGoG12H-GNRYWUo4qdK4=@emersion.fr>
In-Reply-To: <55205499-293e-45cd-870c-1ccccd05145d@amd.com>
References: <20240519130610.7773-1-mario.limonciello@amd.com>
 <-KAO9zJq5vTiesgtw-PMO0lDkSH1tuV271WNqlVuh3ZSkMzKWB9JQJce68-X-GwhD57QilHIBnLxN9k03I3-CMeYQm30NJMLizfyUUxTqHA=@emersion.fr>
 <e3a4331a-307e-4377-a349-8699024f8459@amd.com>
 <CAFZQkGyupsydjSEfv6OgMqPmHm9kMy4HQs7aNvzn77omSN+ZhQ@mail.gmail.com>
 <a35f2f5b-024f-42ed-9d59-48efcf4516a8@amd.com>
 <55205499-293e-45cd-870c-1ccccd05145d@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 90615fbf53b820727d1504c30dbd112d3d6c287f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Tuesday, May 21st, 2024 at 19:27, Leo Li <sunpeng.li@amd.com> wrote:

> I wonder if flags would work better than enums? A compositor can set some=
thing
> like `REQUIRE_ACCURACY & REQUIRE_LOW_LATENCY`, for example.

(FWIW, the KMS uAPI has first-class support for bitfields.)
