Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA4E43F20F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 23:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AC16E0E3;
	Thu, 28 Oct 2021 21:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3B76E0E3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 21:51:04 +0000 (UTC)
Date: Thu, 28 Oct 2021 21:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1635457862;
 bh=kTFqCimPNHBrsjzzzc1OW5/zkcpcjpxuO4yNPEIogiE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=NWf7q2YF7yKbt4cV8gy64N1NZB0uhtwNiFKzFGqpmpxC54cD3mO5Vk92z+H7XRCPR
 W8l72Xzha/MOdB7LYTOF3xzF3GjevvEC13wHAova+wA0Jy/S7EmaWXdI9k6GzWC/Mr
 wdBZGfbIuNkKL2fUzhChsJAh81u7OPZ9qfObErAAgoFSkSIYv17YSLJHKsSO4tGZOr
 +u4wFRNpRAuykkhVyl28cTNb+GKWtydhxYxXg/nmgsBfH3ODNL5bVeaAKquJ0sPeJD
 J9LoKGPBi0gW+8HZeizchfiAVsvlExkqNpEslUO481+/D1kM0bXSHso8l9myqcoCEw
 uNrZLSaQN1cvg==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm: Add R10 and R12 FourCC
Message-ID: <h8RrKyTwjsatHDQx1ufEUpq3URIZavWEArsFi6z8wxT1iDJYMnwY4NhhYBtdY-Y5a0p6t96O4QPFOATsU8_e0Eam40DA3J54hIVl1NFSFr4=@emersion.fr>
In-Reply-To: <GkaYSCuz648_NXGj3rL0BmHzkGLlBdotRmuJv7K1hY9Ig2hOiresmoR_PS_tkf8nDm-3z8XnudFFPZ-eLtyQeWe6yGx17OUo5dz0Lh54jdc=@emersion.fr>
References: <20211027233140.12268-1-laurent.pinchart@ideasonboard.com>
 <GkaYSCuz648_NXGj3rL0BmHzkGLlBdotRmuJv7K1hY9Ig2hOiresmoR_PS_tkf8nDm-3z8XnudFFPZ-eLtyQeWe6yGx17OUo5dz0Lh54jdc=@emersion.fr>
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

On Thursday, October 28th, 2021 at 23:49, Simon Ser <contact@emersion.fr> w=
rote:

> Are these codes arbitrary, or are they taken from somewhere else?
> If they are arbitrary, maybe it'd be better to pick XR10 and XR12 instead=
 of
> R10 and R12, to allow a future patch to add other format codes with the p=
adding
> at the end if we ever need that.

Ah, it seems like XR12 is already taken by XRGB4444=E2=80=A6
