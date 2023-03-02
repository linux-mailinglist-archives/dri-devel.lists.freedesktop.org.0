Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1192A6A7FC1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 11:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A710410E46A;
	Thu,  2 Mar 2023 10:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1DB10E46A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 10:15:00 +0000 (UTC)
Date: Thu, 02 Mar 2023 10:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677752098; x=1678011298;
 bh=PpIbyWQTwT+hTLdj79c7/93Vnu9MDoZtJS5HjgUuGPw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=r6aVLaSok88qcqTnY4XcomwTLAe3ZBLvaD/7xAzewYZ0KAvY+Q7Ha1W0Z/iXRwR22
 UgW6zif7UJdtKH8CUgXRVYoEh6EvmgpzZ9V1xn8x8UUmC+bYG8rMPgRc/8ZAFg7rzn
 4p/8asD5dSLIHseWSufz/GH3Qn/yBr7SD/AZEaz85Mlh30lzDlS3T18uqAurSQ7KOW
 1bWU0snGJICSgfpDKRiZoIVmHgVUWSwXYMp/cNcj7foCBb3bcXX+SrnBAknn2s9MTt
 g7Ncg0BoC8uy7VNy5kj5gHESLMcUFG4s/axwBKFelyk26WxMoFcUisKOCKWCQQQWTV
 froMoVJyDqNwg==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vram-helper: turn on PRIME import/export
Message-ID: <R1BP91PubkIEl7OMjpEUBo5n8CdMZ4yW4KHtgZJZ3Ay0qJ9GREsN7oKCr5k2H6g_r03AEX0w0owgO6jBZXaKSDjzh4OH1S7LDHd1QXicvxE=@emersion.fr>
In-Reply-To: <e3fa0ef2-b9a0-ef53-abb5-edaa14eb3f9b@amd.com>
References: <20230301222903.458692-1-contact@emersion.fr>
 <e3fa0ef2-b9a0-ef53-abb5-edaa14eb3f9b@amd.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, March 2nd, 2023 at 08:11, Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:

> Am 01.03.23 um 23:29 schrieb Simon Ser:
>=20
> > We don't populate gem_prime_import_sg_table so only DMA-BUFs
> > exported from our own device can be imported. Still, this is useful
> > to user-space.
>=20
> But what happens if one of your BOs is imported into another device?

Is there a way to make this fail, always?
