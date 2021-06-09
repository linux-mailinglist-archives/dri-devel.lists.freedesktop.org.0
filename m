Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E23A0D48
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 09:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2776E20E;
	Wed,  9 Jun 2021 07:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54ED46E20E;
 Wed,  9 Jun 2021 07:10:55 +0000 (UTC)
Received: from [192.168.1.3] (ns.gsystem.sk [62.176.172.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 8496D7A025C;
 Wed,  9 Jun 2021 09:10:54 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer
 dereference in nouveau_bo_sync_for_device
Date: Wed, 9 Jun 2021 09:10:51 +0200
User-Agent: KMail/1.9.10
References: <202106052143.52488.linux@zary.sk>
 <202106090857.42133.linux@zary.sk>
 <1c4a7360-57e3-c75a-c729-1432db5b90b9@amd.com>
In-Reply-To: <1c4a7360-57e3-c75a-c729-1432db5b90b9@amd.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <202106090910.51188.linux@zary.sk>
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday 09 June 2021, Christian K=C3=B6nig wrote:
> Am 09.06.21 um 08:57 schrieb Ondrej Zary:
> > [SNIP]
> >> Thanks for the heads up. So the problem with my patch is already fixed,
> >> isn't it?
> > The NULL pointer dereference in nouveau_bo_wr16 introduced in
> > 141b15e59175aa174ca1f7596188bd15a7ca17ba was fixed by
> > aea656b0d05ec5b8ed5beb2f94c4dd42ea834e9d.
> >
> > That's the bug I hit when bisecting the original problem:
> > NULL pointer dereference in nouveau_bo_sync_for_device
> > It's caused by:
> > # first bad commit: [e34b8feeaa4b65725b25f49c9b08a0f8707e8e86] drm/ttm:=
 merge ttm_dma_tt back into ttm_tt
>=20
> Good that I've asked :)
>=20
> Ok that's a bit strange. e34b8feeaa4b65725b25f49c9b08a0f8707e8e86 was=20
> created mostly automated.
>=20
> Do you have the original backtrace of that NULL pointer deref once more?

The original backtrace is here: https://lkml.org/lkml/2021/6/5/350

=2D-=20
Ondrej Zary
