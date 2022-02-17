Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6EE4B9B98
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EBB10E94C;
	Thu, 17 Feb 2022 08:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BD010E94C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:59:48 +0000 (UTC)
Date: Thu, 17 Feb 2022 08:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1645088386;
 bh=IQbZsojKe9lupbzeOgNh8g2krPFHairv1oszA1JNBVI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=dRYZUli9MTk6aBlXer6PANUviQ9ALuqJ+/t+V/7U3/ACardksS//2yICqGrw02f58
 nw59NXFyzUpt/atV79IFpaZWOrYGpmTYa0FFT21leVjBs8y/+mddoTybtQsRBNQUk+
 mezKjoI8BCK+Ku1kzNxKI+AvzrjWIzx/AW5bDnBy9m4yhQ4H0a15iAxSr32pZT0ACL
 z1FK4btjO8QeX+q+PLvmaSfI124hMXkrgdTOvvKwvuuk6AhMjogu3pRDatKMKV+2Mt
 jy9Tcca2HJpEaKuO+p7IggK5apQUl+eB9TeDu5Qlxhg1YbDTOY6g7JbyjqFnh3T4Cu
 dk+Y3QRNdtCrg==
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/mode: Improve drm_mode_fb_cmd2 documentation
Message-ID: <b6s2ucykJjo2wgU34rse2adHIJGzyi5CilOsxZIXg3USNqjgklcYlUzL_p8z4lwj_UyvZ9v8FN3Dkh4QAghinstbWoMW5rkbAb5H5HQcv4U=@emersion.fr>
In-Reply-To: <20220216084136.2913927-1-geert@linux-m68k.org>
References: <20220216084136.2913927-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next has changed this doc comment. Can you rebase your changes?

Any any case, r-b me.

[1]: https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Da3574119826d9a4=
ef807fb973cf5150c3b90da43
