Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F055B81F4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 09:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5752310E891;
	Wed, 14 Sep 2022 07:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Tue, 13 Sep 2022 13:04:02 UTC
Received: from sosiego.soundray.org (sosiego.soundray.org [116.203.207.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94AF10E6F5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:04:02 +0000 (UTC)
From: Linus Heckemann <linus@sphalerite.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sphalerite.org;
 s=sosiego; t=1663073918;
 bh=PkccHgCNgdx9/YruWzJhpaVP37la3JXb4uAxKfHjN4M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date;
 b=v2Kz9y7hkx5TssqX5I4jMOX15Dk/vUkKMPVO7SLnWcjShI+7St1SU/ePvPLjFXiIq
 99Sl5BZDnPTVPfnlltF+1Hzy3cRUbu9U2IT1xUIvbhGsR6y39OPE16RRWdPYyz7nlz
 vduiVF5dp6a6KX6elLCrYzYbaoLCuKXWcIma92Sg=
To: Hugh Cole-Baker <sigmaris@gmail.com>, heiko@sntech.de, hjc@rock-chips.com
Subject: Re: [PATCH v2 1/3] drm/rockchip: define gamma registers for RK3399
In-Reply-To: <20211019215843.42718-2-sigmaris@gmail.com>
References: <20211019215843.42718-1-sigmaris@gmail.com>
 <20211019215843.42718-2-sigmaris@gmail.com>
Date: Tue, 13 Sep 2022 14:58:32 +0200
Message-ID: <ygaa6735t3b.fsf@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 14 Sep 2022 07:23:04 +0000
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
Cc: linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Hugh Cole-Baker <sigmaris@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hugh Cole-Baker <sigmaris@gmail.com> writes:
>
> The VOP on RK3399 has a different approach from previous versions for
> setting a gamma lookup table, using an update_gamma_lut register. As
> this differs from RK3288, give RK3399 its own set of "common" register
> definitions.
>
> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
> Tested-by: "Milan P. Stani=C4=87" <mps@arvanta.net>
> ---
>
> Changes from v1: no changes in this patch
>

This series makes gammastep on sway for adjusting colour temperature
work wonderfully. I'd really appreciate if it found its way upstream!

Tested-by: Linus Heckemann <git@sphalerite.org>
