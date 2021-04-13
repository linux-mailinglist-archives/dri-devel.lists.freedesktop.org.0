Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CBA35E29B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 17:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F081F89C5E;
	Tue, 13 Apr 2021 15:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FF489C5E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 15:22:42 +0000 (UTC)
Date: Tue, 13 Apr 2021 15:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1618327360;
 bh=ZX12ICSRUF3mgSveenh/HLAhMXSuYjKGwbWSHfY/te0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UXgHYl+aG7KoLminSkqBvcsf2Jg/bv0dwAcqL3odq68TN5XhR5vzDiAsTUyRyWB2d
 9MmxOMN2CK88HS1xtS7u43ITI674QV8rWEPxzZ6AkjOKwvvGqvu88S+QKzUOeBBGOc
 fO2TAEPXDpxVZTBKzgurQvY+3BGlTf9DU4sqb8EOWi8MpifP55zBEM1rDAhjtYyOkm
 wVVGa9NvyMnT9nIBHZTgjyQolaFxx+NzTcWTuXr25YX+qcCrJ8oOcwJUChBlV091eh
 8JC3fPegJPlHa8gvwqIQpxpj4Xpx2seNWYz68EiklaIW5zaYmRTJXf2iheD70EpBMW
 HjfOiv2zEl6oA==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 12/12] drm/modifiers: Enforce consistency between the cap
 an IN_FORMATS
Message-ID: <702gzXybUq6472OXiLDwH84leKNJu6InofCdhviGlZLdK6BuWn64M9zZOu2-cawLheX1U4CuwgJsByNcQZtfCeYjl1faFh3sjdkUyp-wwQY=@emersion.fr>
In-Reply-To: <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, April 13th, 2021 at 11:49 AM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> + *     Note that userspace can check the DRM_CAP_ADDFB2_MODIFIERS driver

Prepend an ampersand like so and a hyperlink will be rendered:

    Note that userspace can check the &DRM_CAP_ADDFB2_MODIFIERS driver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
