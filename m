Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE224B13057
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4834410E294;
	Sun, 27 Jul 2025 16:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="QsRa23cE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9E110E294
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1753632973; x=1754237773; i=deller@gmx.de;
 bh=sNbqz4l2VlsezJnN5tus4fgjuQr0FDo/Jx9eg29uLk4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=QsRa23cEHdcMXW3GX2m0nYpTRscxLgcP28SpLHsJEAokj+Ofc8JtG1yTElB0S9Lh
 nqf5rvDusSA9qx6ExLlU4P3pa1tNKFBtWHpMUEWoFOaB9FV3mq2PFcBffli/0Sdcq
 uoRyh5pFFejeGwNkTe7j0PPaYd63LD0nex6CgRXXL/5yB2DwV6UAQ3C8t7vLAmVBX
 mcWd3Feh6XvnsCHLlTEdllirshbFfWEtr3Uzskm1jp5dUVISMZY9mr4NpEQi2ZJJy
 SZCb+qgCF3rXmWX3XJ17BgDrOGE3kAAjvdEwVZz5VJwSnlxtvmscwM5XpoFI6KyL4
 Vis8Re3RsFRS0+kKoA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N63VY-1udxTQ2jQ8-011276; Sun, 27
 Jul 2025 18:16:12 +0200
Message-ID: <90c87092-6545-4460-9421-58751e437ae7@gmx.de>
Date: Sun, 27 Jul 2025 20:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Fix typo in Kconfig text for FB_DEVICE
To: daniel.palmer@sony.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250725-fbdev-typo-v1-1-f9fd1418cb51@sony.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250725-fbdev-typo-v1-1-f9fd1418cb51@sony.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sCSGhxsoLimG34jRuGGoaLM85WWVJzB3ocLIE8cRfl2sRXiHFI4
 GijpeYJzlCW+NN/iSfjryjjy88hpakx9DFucltZ69qncVfzywWjMAXKoGALJYRBfNep/etj
 3Qtjq7FHCrJKGjx5JLURR0aEYy+yGqrZYy5rGt3M9y87cXUh87OL1lHPPuuCqT7MW5Y/AQC
 Tt9ZU4+2bYf3eqR1wfQXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lJ4IZaKQ7KE=;sshfeD4hww81di9JX36SNg8Qsbb
 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
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

On 7/25/25 07:30, Daniel Palmer via B4 Relay wrote:
> From: Daniel Palmer <daniel.palmer@sony.com>
>=20
> Seems like someone hit 'c' when they meant to hit 'd'.
>=20
> Signed-off-by: Daniel Palmer <daniel.palmer@sony.com>
> ---
>   drivers/video/fbdev/core/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.

Thanks!
Helge
