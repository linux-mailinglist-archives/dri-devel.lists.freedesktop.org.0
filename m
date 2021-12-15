Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22723475D34
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509DE10EF1F;
	Wed, 15 Dec 2021 16:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED9010EF1F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:18:27 +0000 (UTC)
Date: Wed, 15 Dec 2021 16:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1639585104;
 bh=qlSXnq0k9kLv7nAnJZp1tofYWVGCcWW/pkPYUjzUV2I=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=Gef2vX2f3I7SfHHMlyJWYCtqW3GziCDaC0KTj+FmAwTK/RUhlQNf2S7ir9Lnh6MNv
 2yjnkV5vePFxxreGveg7ErShI1Zfy7PNBPPord7CSfltMmOkriLeUKtwJCOyg0zfuC
 wU6EiTnxXvjrBFMexLOH4hF2bzlIRPDdr+znC/zg93YGhVpngK7NUKPPEWAcpgKbjw
 7CYQe8l3lVZh9nGf7SpqW+dwO1AB53wczI5K8lcAF/AqveHtndklIIOcI8X2D/RXgz
 +hPgRnGMhUhB9YVWprDSlRBE2Qn5ZanoCEz/8CeXnXi1WCuTrQmqnmkpa/IBq4RmwS
 2Ce1xj4vyLKtQ==
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/plane: add alpha and blend_mode to
 atomic_print_state
Message-ID: <VFr2GRLAih_hmjQXq2OZOGbYRN5vBU3dlBTULK8PlsT25MfW_Son4YjNOuFzJs4429UYxGlghaik1W655rbctOLRCTHfK7J6zk10q6fGi40=@emersion.fr>
In-Reply-To: <20211215160837.2715448-1-dmitry.baryshkov@linaro.org>
References: <20211215160837.2715448-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2 looks good to me. A little bit sad about the stringifier duplicating cod=
e
with drm_plane_create_blend_mode_property but it's not that of a big deal.

Reviewed-by: Simon Ser <contact@emersion.fr>
