Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4257339663D
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 19:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F18E6E195;
	Mon, 31 May 2021 17:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578E96E195
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 17:00:05 +0000 (UTC)
Date: Mon, 31 May 2021 16:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1622480402;
 bh=6LG/hJF7Ud6Kg+P4M2rWvClciU5IL5IYVh6FJfAO3iM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=NOezI+7Gmj5HdJ4Izuqj7dwZsJEvhSZ5FyPWCcTRJ2xxHPxrxoDKvkfc9i2ZXOdh8
 kaNH1zzCQByPVfRpzSeqPYB7Ta6UAzNNQRltJwpVkKCOncrIjaq6fBi+oy0IWcpMoM
 ATYGG2zwy12QkBPQRgt0tKlyBh98dl7KwMzE1S0LPWjOpSrDGeDnoJ85e7FdDPzJA+
 Oa0LMRkch9nj5rPqi7xTuPnsNVr+w+LyO1pSpFLGZkVngWCblnK0zfHiJ7vaAo3UC6
 QBtr1yfb1ykCcYF6nZbbfn08YMGoDnuNiMjGicXHBQGA+prRxRP0IOEi4BMQoWKh/7
 AvzbVbyDktMZA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/3] drm: document minimum kernel version for
 DRM_CLIENT_CAP_*
Message-ID: <nhVvJ4DyCnV5o1Lz4WP4rTU_ZGiN7cqc1IaoCqasxBOOgIBqK7NmSTVc3Lw8qUGlaPRS81t-hGDlHyNBI5AZGzp0rYRC5YxH6ZC07witTpY=@emersion.fr>
In-Reply-To: <20210520111733.7f44a492@eldfell>
References: <8tBryxsjXiKtYZP4whnTumr2AsWx9X1xPmwFAdp5Nc@cp4-web-037.plabs.ch>
 <20210520111733.7f44a492@eldfell>
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
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, May 20th, 2021 at 10:17 AM, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:

> I think adding "for all drivers" would make things much more clear,
> like in the other cases you mention "atomic-capable drivers".

Good point, done.

> > @@ -797,6 +802,13 @@ struct drm_get_cap {
> >   * If set to 1, the DRM core will expose atomic properties to userspac=
e. This
> >   * implicitly enables &DRM_CLIENT_CAP_UNIVERSAL_PLANES and
> >   * &DRM_CLIENT_CAP_ASPECT_RATIO.
>
> Wait, why does atomic turn on aspect ratio? That's surprising,
> since I wouldn't think that atomic depends on aspect ratio features.

Yes. I guess the motivation was to make sure new user-space can deal with
these?
