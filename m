Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53D729AF8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 15:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B459510E69D;
	Fri,  9 Jun 2023 13:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8BA10E69D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 13:04:45 +0000 (UTC)
Date: Fri, 09 Jun 2023 13:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1686315880; x=1686575080;
 bh=YjVvHB3PREf5Jt0xnd0uzMoRTyZ7dIiF301OQyD/ZVs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=YFMbR/1yV5Je4A319BkLkq7gc+x9N5rkjRCSfVUgcfnnwMzNXxS8OHoqpGpMQF/uM
 OfdaiRZAuQ/J6MDVF6yW5Esugd4ykndOwaed94l0gwQXUM7Ly+bG3TeOR6g/+PcTUt
 58Y5PzNBhSeJw/CknSvdJ/KF9XLw/lv4CcKwDKZKRInbyLZP66l3SvxCfIqJEt1mzg
 gCXOTOfimP0WDKijXgl/Yr9dN+MyZa/i0+p8vuXW1RqxDEpLlmo3ZmGCBrHzNtYv8S
 miiDo7yI9QgqxKVDfm7A7xSUYMIGfHabIVIJYiNJ08M+pCmI71otAeU1w3ZhnW+e7y
 pbeM6m3KB5kTA==
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table
 is missing
Message-ID: <IVEn465CI7o2ndJtCsJ0c0CY4IMdqgH5ECAxHmj6i6yx1WA4IvDNDkCcJyj2NISq0iBfvIW51gSq0HeyblJ56rmgD5IOaoPh6Ib5vE_VnTg=@emersion.fr>
In-Reply-To: <e5524875-1ea3-25b5-95d9-b66910e06d42@suse.de>
References: <20230302143502.500661-1-contact@emersion.fr>
 <e5524875-1ea3-25b5-95d9-b66910e06d42@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Tian Tao <tiantao6@hisilicon.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Friday, June 9th, 2023 at 13:31, Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:

> Is there a v3 of this patchset? It was Acked with the one errno code
> changed.

Since this was a minor change, I did it locally and pushed the patch
to drm-misc-next already.

Simon
