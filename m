Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBF53D5795
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBB46E7D2;
	Mon, 26 Jul 2021 10:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1092E6E7D2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 10:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627295581;
 bh=+VUL+QLDy3glb1Z4duCwJNXnE36cEk4VDEsuDj6mCnQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=D4haEr6H/SaIBPEo3SJ8CWQB4DeoSwc2UtLQllOAVQsGyKYm01eMGbsPhTzMQ7TXa
 +Vpku6C6oeY4t8LkQSq2ylwij6Qn4zQ/odvh05cxoBq7D/y/1zO4Dl/ZIuMR7XCjhS
 y6jNDaZkirM2el+zVw9/P5wa+Ufys5riG9RzI5Qg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.151.117] ([217.61.151.117]) by web-mail.gmx.net
 (3c-app-gmx-bs55.server.lan [172.19.170.139]) (via HTTP); Mon, 26 Jul 2021
 12:33:01 +0200
MIME-Version: 1.0
Message-ID: <trinity-3fb57d4b-aa73-410c-9d9b-4ba3c8b0f674-1627295581632@3c-app-gmx-bs55>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re:  Re: [PATCH] soc: mediatek: mmsys: fix HDMI output on
 mt7623/bananapi-r2
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jul 2021 12:33:01 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_-2vJE_v2vV=fJqK9--yx=++P9x53T-g3Cv4qKfHhqbLg@mail.gmail.com>
References: <20210710132431.265985-1-linux@fw-web.de>
 <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
 <trinity-02bc17fc-b458-4d17-baca-8afe30e4c92c-1626110171249@3c-app-gmx-bs28>
 <dbe23d2a-cd29-0782-1b7d-bcb5c6683607@collabora.com>
 <6EF00182-1FF4-4061-BCE4-E2AD7275211B@public-files.de>
 <CAAOTY_-2vJE_v2vV=fJqK9--yx=++P9x53T-g3Cv4qKfHhqbLg@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:iPn7TUoOCvn5EtAyQEAe4fH9u6GWCjG99MHdzRiuhNVgs2b7AjqMoxzf+RKZ1aSoarRpO
 6di4hcveSpohkWPxcKqUEwsKney50YrmUADSL/bV4qeqUyR6rCMiTymQgeiIvA4v1XoQFKtCUX+H
 5cEdAvXLupE2EomWYtTOY26eGRYJSwzGODgEmjhcHavXkvGpordBctuERaRmSvEB/i3I9U5azvfC
 KpeAb5OpCwYueskrexzltzsrroC5uPn7X2Pa5hfOEtf71Bj0dWqygfBU+8gwdDTYdlLk5ip0ouTh
 sY=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3D1zLxNwjgY=:WUxgCA+GhIthK0mPzonNLV
 Tz6F3VlfZSjLkuGSpaC/9Tysu0WFvu7ofQJNq6I9eNAYT7bd4RaZV421YMrQXpzNl8RIWcKrf
 6V7g1DdfLtPp7Stjlkxopl7lHzJcYaWNJOYPYT7YapwJLHvHr2zrGGTiJ409YhjDNRUAq+O0f
 jkRMMCgJ9l8fOK4m94ShbZq3CWqJqPU5mNnGOu1WY/nWgcjj7sHIQuKjKrjepL31TU42LVwHe
 msQLZ96/zzoKY6CPOw8qVx8P93KTPG+WP3rtdtrCTzpEpOv09PB2VhsSv2FklwlOYjIM6Jczl
 uerSsDND6PouY7IineKf7Az3ZmPpqNzh5cD1nADyfieIrJoyV9dxLvg++V3n4escBGrplo3Bl
 b8LXnVZf/jDC6c3n325Gar8tus2x5vJCQFYdftGLRQYnNVB5XFbXatUGZiqZcRgMCvszB4+RF
 uVjwpEejJVycv/zgmXw/yEMA3EAlSZr6SwLfWkDMeDgHvajlpwYwCinHpGcZAumBxeu4N8G1i
 NZCUAhAsKxEG+1EOkxZRjX/+qgsSSfwebsC7UGOicSrVrmK6D7y7P+uHwUqsSkOYWy/B8/yB5
 4uZiPI0inEtH7ex8to3REb9MGi544f2F1f38Zw9cGZYSDtfleOs2YB4JJcw1lUOYkMyqoIIdV
 FepBaKWROreMfTvQgzTqEV7mipD8v6wrjyzXvjdQSi4lcxK8BIxkheAlp8a0A/AXqCkXpnhHj
 +dxUDQUiyIX3Ox7ocy6HoaTnnzQ3czx5fBK/MnlJM+nXHeID668eQplEapkxdyy+cVlkTPbvq
 XAah5Xx+cjNooG+Tpr9DWj0W3+X8MUM+6d6/mqRpoJSJ9qD1Eo=
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

> Gesendet: Montag, 26. Juli 2021 um 02:27 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
> As I've discussed in [1], SOUT has many bits and need to be cleared
> before set new value. Of course, write only could do the clear, but
> for MOUT, it clear the bits that should not be cleared. If you want to
> use the table, you need to implement the 'mask'.
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/trinity-93=
7ebfa3-d123-42de-a289-3ad0dbc09782-1625830110576@3c-app-gmx-bap43/

I've added the mask like you did here [1] on my repo [2]

and it works too...should i use you as author as i only take your code whe=
n posting?

regards Frank

[1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kern=
el/+/2345186/5/drivers/soc/mediatek/mtk-mmsys.c#294
[2] https://github.com/frank-w/BPI-R2-4.14/commits/5.14-mmsys
