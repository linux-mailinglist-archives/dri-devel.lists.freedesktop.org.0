Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AE8440FAF
	for <lists+dri-devel@lfdr.de>; Sun, 31 Oct 2021 18:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE6F892C2;
	Sun, 31 Oct 2021 17:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3269892C2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Oct 2021 17:08:10 +0000 (UTC)
Date: Sun, 31 Oct 2021 17:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1635700088;
 bh=9vthuV4dxrJHBlKoxNl3OHmHvJxc432bkMFXYtavmug=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=qOxItYXt/vC9741cJnQum4UovzPO4tsdN/F7mnLi2LPCqEGqp9Gq5Q82m0nwir74M
 L4EkVOXzlDFGfXIvZNeY5IJ93BqdBkLkafUXkeyyuhjvb1GHaYHzhxl749MtA25/Bv
 BvAh7hHF/aMNJJF4aAdecDcmP90HaHDf+kkcbApRjn98aQmQ9LVxJta+MsIzMWJcST
 +WNkPa6XcvFblU/kAk+4+eu+eqWP4n9ZSib+b1ssIgDxNRsUxsZrdqRyuisYQaTiFb
 1nxKVRtgeKOzkPBiA+GEVvFolsJbtpqEGTApV6yUE9YtPJLc82VzuaLD1vL31C8pGf
 W0VFI8y7dFmyg==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm: Add R10 and R12 FourCC
Message-ID: <8rf-WA1K94a285mvt9w_UtbFEqJsWAioBzoIxHm5hTv02wrEZ1GB4tHRMgyKuoUTn5bPZClnR6EC9ISE3j7jdrc8ogXxCaXFn_Db8pph-qk=@emersion.fr>
In-Reply-To: <7P0-fl_xSxK5WQ37jctxElP_P1ytRhEHye246mchMwpqTaw7iFylPHfWIE0GpMbAHvrhlXEpdqr4ju1s9PRmoBF0CLneIVjaDXp6MYvk2m8=@emersion.fr>
References: <20211027233140.12268-1-laurent.pinchart@ideasonboard.com>
 <GkaYSCuz648_NXGj3rL0BmHzkGLlBdotRmuJv7K1hY9Ig2hOiresmoR_PS_tkf8nDm-3z8XnudFFPZ-eLtyQeWe6yGx17OUo5dz0Lh54jdc=@emersion.fr>
 <YXsyevoVkpJ52K6q@pendragon.ideasonboard.com>
 <7P0-fl_xSxK5WQ37jctxElP_P1ytRhEHye246mchMwpqTaw7iFylPHfWIE0GpMbAHvrhlXEpdqr4ju1s9PRmoBF0CLneIVjaDXp6MYvk2m8=@emersion.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sunday, October 31st, 2021 at 18:05, Simon Ser <contact@emersion.fr> wro=
te:

> Playing with
> DRM_FORMAT_BIG_ENDIAN (!) could do the trick.

Hm, nevermind, that wouldn't work, as this would do something like
RRXXXXXXRRRRRRRR.
