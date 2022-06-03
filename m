Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE5B53CB6C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 16:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC5710E31B;
	Fri,  3 Jun 2022 14:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA2F10E31B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 14:15:09 +0000 (UTC)
Date: Fri, 03 Jun 2022 14:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654265706; x=1654524906;
 bh=XO1webNqxfe1+pnbmLb9x34GDSV9XrARVVzLWGziXJY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=yuDlgvlq1C2UtTnJaFEEKlHEkkRHy1x4kYHd4Va1bnMjmBb3UjaLmmlkZ0IXMx1Zu
 7rL1JxT4VCh4ByC1yMKq37mtyY1j23KtVJt3ZEl9NuGM1rOqKwW87njXkq/Osw7MWf
 z9L78X+GeAOI40pRWijLShUHRCZWJ544xn2iP6eGHy5W24rmYVyjNLxCqktAbJbjC6
 oPHv+pWri5O1NJkyYKwhCc1vjNPc0uVMaiEDYnIo2g/d4wc71FTS2ab0QEC7sTek7x
 1ITOyK9fooVnfmehhW1qegFjmUXMmLFnaJ8Cm4Ms0WUhKASCj68DQ3pQAmv0MNw9E1
 4jbJVYFsAnA5g==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
In-Reply-To: <20220602154243.1015688-1-zack@kde.org>
References: <20220602154243.1015688-1-zack@kde.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: krastevm@vmware.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Please, read this thread:
https://lists.freedesktop.org/archives/dri-devel/2020-March/thread.html#259=
615

It has a lot of information about the pitfalls of cursor hotspot and
other things done by VM software.

In particular: since the driver will ignore the KMS cursor plane
position set by user-space, I don't think it's okay to just expose
without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).

cc wayland-devel and Pekka for user-space feedback.

On Thursday, June 2nd, 2022 at 17:42, Zack Rusin <zack@kde.org> wrote:

> - all userspace code needs to hardcore a list of drivers which require
> hotspots because there's no way to query from drm "does this driver
> require hotspot"

Can you elaborate? I'm not sure I understand what you mean here.

Thanks,

Simon
