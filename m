Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190644253E3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 15:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B1B6F484;
	Thu,  7 Oct 2021 13:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40696F484
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 13:18:11 +0000 (UTC)
Date: Thu, 07 Oct 2021 13:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1633612689;
 bh=VgsdSuXN7Wpww5DOlu3wd5wovjDTBXBbd+4WJURbEdM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ZZmYv/eFHTF/+D+9Bv68DseZaH3ygXrwWlXrRyJ1PiC92l353xd8bN+Tep5Uc5hla
 pbrOaeqB2MIaaKqoC69CRWry2qftT0ZOmWCGLNQ93mE0Fs5abLDCbFgILLzKhCc0Az
 NRI2YKXSn1fDA4146iLfL501PHjSE776TtF7aEhso2Va3R2DU/TM512ulBpvKUCMKY
 ftIuFiEAEvu2fr962pa32dAW8/+gs+VNuKOsqs6DQndM04gYPQoR00j7CSf1taV9jD
 7bBUX6U2YBrW+g4YEzzRSVu0/N4Vt+Mq1NgubDz6qg/MOKeNUJ17VRR6QfMH44Dy/S
 mhG7w5FxJMnVA==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dennis Filder <d.filder@web.de>
Subject: Re: [PATCH RFC] drm: introduce DRM_MODE_FB_PERSIST
Message-ID: <-3X46I-OPnBBJMlZQvEy-uaTlZ7syxW6FiHM84bbpRD6F_RJBkfQ28pCFrT53Jb05w0tahWlvUwJHn_s_AD5C5dFCjPhiy1Re44ARDC4OAE=@emersion.fr>
In-Reply-To: <5e84cd22-b359-c33b-a19c-7ff9b91a8aff@redhat.com>
References: <20211006151921.312714-1-contact@emersion.fr>
 <CAKMK7uGsFDGR7TFR1A5utrtyOL19Vc2=MEXO3XLbEOexJcuj0A@mail.gmail.com>
 <20211007104521.24b75b95@eldfell>
 <5e84cd22-b359-c33b-a19c-7ff9b91a8aff@redhat.com>
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

On Thursday, October 7th, 2021 at 10:10, Hans de Goede <hdegoede@redhat.com=
> wrote:

> > I think my order of favourites is:
> >  1. RMFB flag
> >  2. ioctl to set an existing FB as persistent
> >  3. ADDFB flag
> >
> > They all seem workable to me.
>
> I fully agree with the above.

Thanks for the feedback! It seems like everyone agrees Rob Clark's CLOSEFB =
is
the best solution. Sent a new RFC at [1].

[1]: https://lore.kernel.org/dri-devel/20211007131507.149734-1-contact@emer=
sion.fr/T/
