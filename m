Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D94EC6BBBE1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 19:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DFD10E2DF;
	Wed, 15 Mar 2023 18:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15DA10E2DF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 18:19:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 921EF378;
 Wed, 15 Mar 2023 18:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 921EF378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1678904381; bh=j5FgemK+JDdaFLaY3yStR1MCa6tiuLuhfjdneBnCDDE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FswdtRSc+3jEJEJ+5cZqKM0mUX6YwkltD9Nuds7UZy2B+5OSBPHX0BMlPzWxAffqQ
 NemgWW/RX0RXiD93F99+5+pp+kMYpVm2zrQLQPoqRcZ4/vRwsOQHG0lg0qQ2bN/hti
 bQsRzBQ3o7qmkU+fsmGKm0otoEzHY5hMqGBIgKPrb0LkmcVRiPx48FxhZ11zxypAMD
 zEK+xOGsrt81lEmWy7EcmI+LVrVbkuuDepMGyZ1aH2SFzX3sUo+pGjbNE1zCiHQBil
 ufJmvdYxci6ZawuEqII8405pLEfffUdfJexXz+ZyPhBe7WUnn9m+VyIjkwAvBfDV6B
 vy7RG8kT4zBQw==
From: Jonathan Corbet <corbet@lwn.net>
To: Matthieu Baerts <matthieu.baerts@tessares.net>, Andy Whitcroft
 <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kai
 =?utf-8?Q?Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>, Thorsten Leemhuis
 <linux@leemhuis.info>, Andrew Morton <akpm@linux-foundation.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] docs: process: allow Closes tags with links
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v1-1-1b83072e9a9a@tessares.net>
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v1-1-1b83072e9a9a@tessares.net>
Date: Wed, 15 Mar 2023 12:19:40 -0600
Message-ID: <87zg8dop1f.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Matthieu Baerts <matthieu.baerts@tessares.net>, mptcp@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Matthieu Baerts <matthieu.baerts@tessares.net> writes:

> +In the same category as linking web pages, a special tag is also used to close
> +issues but only when the mentioned ticketing system can do this operation
> +automatically::
> +
> +        Closes: https://example.com/issues/1234
> +
> +Please use this 'Closes:' tag only if it helps managing issues thanks to
> +automations. If not, pick the 'Link:' one.

So if there is a consensus for this, I can certainly apply the patch.

I do think, though, that if we accept this tag, we should ask that it
only be used for *public* trackers.  A bunch of tags referring to
internal trackers and such aren't going to be all that helpful.

jon
