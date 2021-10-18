Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5430431252
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6B26E0A2;
	Mon, 18 Oct 2021 08:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9622A6E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:42:48 +0000 (UTC)
Date: Mon, 18 Oct 2021 08:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634546566;
 bh=StTrfuj/ao9na790Dx/dojPcVW14Di78thrAoc7Hxyk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=iGKauygmWLnDRM031BGiKW0YiJStHP8WI0uSuw9vlJnK7qfubJGF5HuXLaOLCDiEy
 ZSgnNL5M+/9kgcwTNTd1WWzZHeu2xNeXc/r04lDlUVpeFNGPIkF/5Y8mDUYeG/8Euv
 52ZYB0/4AFQqhPHOGDHANkCJVsIki3n2MHr+YA68WV8g94Qx9F7QR76mb2/4ef88px
 cjBFIJnnYXCfdmb6/LxKg5NpKDYUGZBszL95aDJjg0RfQZG3lwW7KzKTM3HFyw3lGi
 TqwHI6bKafM3cESZHvWdo7CU3WeXVEkm5MWNtv6YR74pYSL8r3a15qyQKSIJUx0Pgt
 bLldpy48uSUTw==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 6/6] i915/display/dp: send a more fine-grained
 link-status uevent
Message-ID: <4DSa7Z_ajNZCK3o6aN7cXxZBVByW4ef0udl8Enn0W4yB_gS0zS2X1YsYNdoOZ3LsvyBM7piYSq2J7gEVWbKNE4zDbYd5l_fAi29iclG9zL0=@emersion.fr>
In-Reply-To: <YWnaL4WtISzv4msR@intel.com>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-7-contact@emersion.fr> <YWnaL4WtISzv4msR@intel.com>
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

On Friday, October 15th, 2021 at 21:44, Ville Syrj=C3=A4l=C3=A4 <ville.syrj=
ala@linux.intel.com> wrote:

> >  =09/* Send Hotplug uevent so userspace can reprobe */
> >  =09drm_kms_helper_hotplug_event(connector->dev);
> > +=09drm_sysfs_connector_status_event(connector,
> > +=09=09=09=09=09 connector->dev->mode_config.link_status_property);
>
> So we're now doing two uevents back to back? Is one not enough?

Oops, I think I missed a step in my rebase. Will fix!
