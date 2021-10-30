Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35FB440B91
	for <lists+dri-devel@lfdr.de>; Sat, 30 Oct 2021 22:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBE489DA6;
	Sat, 30 Oct 2021 20:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1429E89DA6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Oct 2021 20:03:42 +0000 (UTC)
Date: Sat, 30 Oct 2021 21:03:30 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] gpu/drm: ingenic: Remove bogus register write
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Christophe Branchereau
 <cbranchereau@gmail.com>, list@opendingux.net, kernel test robot
 <lkp@intel.com>
Message-Id: <UP3T1R.6J62YIN55WCQ3@crapouillou.net>
In-Reply-To: <YX2T0dbyaYkIbUgs@ravnborg.org>
References: <20211030100032.42066-1-paul@crapouillou.net>
 <YX2T0dbyaYkIbUgs@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le sam., oct. 30 2021 at 20:49:53 +0200, Sam Ravnborg=20
<sam@ravnborg.org> a =E9crit :
> Hi Paul,
>=20
> On Sat, Oct 30, 2021 at 11:00:32AM +0100, Paul Cercueil wrote:
>>  Commit 1bdb542da736 ("drm/ingenic: Simplify code by using hwdescs
>>  array") caused the dma_hwdesc_phys_f{0,1} variables to be used while
>>  uninitialized in a mmio register write, which most certainly broke=20
>> the
>>  ingenic-drm driver.
>>=20
>>  However, the very same patchset also submitted commit 6055466203df
>>  ("drm/ingenic: Upload palette before frame"), which restored a=20
>> correct
>>  behaviour by doing the register writes in a different place in the=20
>> code.
>>=20
>>  What's left of this, is just to remove the bogus register writes in=20
>> the
>>  probe function.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  Reported-by: kernel test robot <lkp@intel.com>
>=20
> Thank you lkp...
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Pushed to drm-misc-next.

Thanks!
-Paul


