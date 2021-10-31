Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDF4440FAA
	for <lists+dri-devel@lfdr.de>; Sun, 31 Oct 2021 18:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8760789BBE;
	Sun, 31 Oct 2021 17:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E79589BBE
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Oct 2021 17:05:08 +0000 (UTC)
Date: Sun, 31 Oct 2021 17:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1635699905;
 bh=I3xIr9sykXDKCSW/6ss33PLcmAeDhUuseyDbn8PaWcU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ROUIMY9agcUk7OvO8OF4un0OQmfl6xVTSqeL/3caZD6STBnhrDmFhFV/7dt7C9nMU
 HucPjDK98Epr5tUuDnrabE9sgPdN+n3r+b8FPReFzWqHuPSS/xW9lxc/oLajckzhWE
 B3mJ74JnoTzJxtXeMYbw6Zkvx3aP5o2rF8XRckd0sVnlvpJBAgsQGlCg93yTlACVv/
 aXRi6GsOCfOJOFBN0+DeNQsEoBI1eIaERlOmcRusWOoa3i7ijtVD1kHN8j3JErMA6U
 qrV2lJmXv8uW0pO8LFzHjm0Ih7f2d31/Rk00knUIoXyhr1ixE6h7X+ZQuMcmApx3iu
 VI9bZ4vIz40Xw==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm: Add R10 and R12 FourCC
Message-ID: <7P0-fl_xSxK5WQ37jctxElP_P1ytRhEHye246mchMwpqTaw7iFylPHfWIE0GpMbAHvrhlXEpdqr4ju1s9PRmoBF0CLneIVjaDXp6MYvk2m8=@emersion.fr>
In-Reply-To: <YXsyevoVkpJ52K6q@pendragon.ideasonboard.com>
References: <20211027233140.12268-1-laurent.pinchart@ideasonboard.com>
 <GkaYSCuz648_NXGj3rL0BmHzkGLlBdotRmuJv7K1hY9Ig2hOiresmoR_PS_tkf8nDm-3z8XnudFFPZ-eLtyQeWe6yGx17OUo5dz0Lh54jdc=@emersion.fr>
 <YXsyevoVkpJ52K6q@pendragon.ideasonboard.com>
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

On Friday, October 29th, 2021 at 01:30, Laurent Pinchart <laurent.pinchart@=
ideasonboard.com> wrote:

> I don't think we'll need a format with padding at that end (with data
> aligned to tbe MSB) as that would essentially be DRM_FORMAT_R16.

The X channel doesn't mean that the padding is zeroes: the padding has
undefined contents. So using R16 wouldn't quite work. Playing with
DRM_FORMAT_BIG_ENDIAN (!) could do the trick.
