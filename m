Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D08458BF0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 11:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2263B6E423;
	Mon, 22 Nov 2021 10:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D0C6E423
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 10:00:31 +0000 (UTC)
Date: Mon, 22 Nov 2021 10:00:19 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 03/15] iio: buffer-dma: Use round_down() instead of
 rounddown()
To: Jonathan Cameron <jic23@kernel.org>
Message-Id: <J4XY2R.1WOGAOGR6ITU2@crapouillou.net>
In-Reply-To: <20211121140823.6b2922f6@jic23-huawei>
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-4-paul@crapouillou.net>
 <20211121140823.6b2922f6@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Le dim., nov. 21 2021 at 14:08:23 +0000, Jonathan Cameron=20
<jic23@kernel.org> a =E9crit :
> On Mon, 15 Nov 2021 14:19:13 +0000
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
>>  We know that the buffer's alignment will always be a power of two;
>>  therefore, we can use the faster round_down() macro.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> *groan*.  I don't want to know where the naming of these two came=20
> from but that
> is spectacular...
>=20
> Anyhow, happy to pick up 1-3 now if you like as all are good cleanup=20
> of
> existing code.

I think you can pick 2-3 now; I will do some changes to patch [01/15]=20
in the V2.

Cheers,
-Paul


