Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7C743F209
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 23:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7D66E0DD;
	Thu, 28 Oct 2021 21:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFF16E0DD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 21:49:22 +0000 (UTC)
Date: Thu, 28 Oct 2021 21:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1635457759;
 bh=/NF2ZWfviNXnX7PH+oZDVqkkXm8TOhxS5qa6UwyAl9s=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=sd1YKAUhFYuI65stOcIH6l8RD5daiHp+FFWjKfatTGVTq8Ll3mAgYB68p1mVTXuF4
 CoFSxAPCjuYAmazpBwyoQMNDSv+hVSu3zvwT+weeqOqZ/p8YVBBAWg58VwLbhZyaJb
 kStPGh9PWmoUWoiN0tFKtiGYdzDciGCC+xi/SxmxNHNmi0RJzOylw01pUAdPmAJwFs
 CDEk0cb3R+g14Kl22mO+NpPK/gb+psbhNXZIhSiHoP3cNFUs3iLYhKCMEeTcAHkYWD
 G+gVD/5RZb0XynAjLttKIziR0gaYiQAkqqyDTsjqr/st/B8HA4NDjDnnmA4/DgaVlg
 vOSsoKv9/AlAw==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm: Add R10 and R12 FourCC
Message-ID: <GkaYSCuz648_NXGj3rL0BmHzkGLlBdotRmuJv7K1hY9Ig2hOiresmoR_PS_tkf8nDm-3z8XnudFFPZ-eLtyQeWe6yGx17OUo5dz0Lh54jdc=@emersion.fr>
In-Reply-To: <20211027233140.12268-1-laurent.pinchart@ideasonboard.com>
References: <20211027233140.12268-1-laurent.pinchart@ideasonboard.com>
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

> +/* 10 bpp Red */
> +#define DRM_FORMAT_R10=09=09fourcc_code('R', '1', '0', ' ') /* [15:0] x:=
R 6:10 little endian */
> +
> +/* 12 bpp Red */
> +#define DRM_FORMAT_R12=09=09fourcc_code('R', '1', '2', ' ') /* [15:0] x:=
R 4:12 little endian */

Are these codes arbitrary, or are they taken from somewhere else?

If they are arbitrary, maybe it'd be better to pick XR10 and XR12 instead o=
f
R10 and R12, to allow a future patch to add other format codes with the pad=
ding
at the end if we ever need that.
