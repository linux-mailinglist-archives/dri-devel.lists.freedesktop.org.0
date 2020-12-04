Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F72D0C2A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB9589DB7;
	Mon,  7 Dec 2020 08:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E596E138
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 10:07:40 +0000 (UTC)
Date: Fri, 04 Dec 2020 10:07:18 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] drm/ingenic: depend on COMMON_CLK to fix
 =?UTF-8?Q?compile=0D=0A?= tests
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <648TKQ.6Y0PFSNHQM1Q3@crapouillou.net>
In-Reply-To: <20201204081819.GA3891@kozik-lap>
References: <20201116175301.402787-1-krzk@kernel.org>
 <20201116175301.402787-2-krzk@kernel.org>
 <3ANWJQ.LV5B6V47KTYS2@crapouillou.net> <20201204081819.GA3891@kozik-lap>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Le ven. 4 d=E9c. 2020 =E0 10:18, Krzysztof Kozlowski <krzk@kernel.org> a =

=E9crit :
> On Mon, Nov 16, 2020 at 07:54:03PM +0000, Paul Cercueil wrote:
>>  Hi Krzysztof,
>> =

>>  Le lun. 16 nov. 2020 =E0 18:53, Krzysztof Kozlowski =

>> <krzk@kernel.org> a =E9crit
>>  :
>>  > The Ingenic DRM uses Common Clock Framework thus it cannot be =

>> built on
>>  > platforms without it (e.g. compile test on MIPS with RALINK and
>>  > SOC_RT305X):
>>  >
>>  >     /usr/bin/mips-linux-gnu-ld:
>>  > drivers/gpu/drm/ingenic/ingenic-drm-drv.o: in function
>>  > `ingenic_drm_bind.isra.0':
>>  >     ingenic-drm-drv.c:(.text+0x1600): undefined reference to
>>  > `clk_get_parent'
>>  >     /usr/bin/mips-linux-gnu-ld: ingenic-drm-drv.c:(.text+0x16b0):
>>  > undefined reference to `clk_get_parent'
>>  >
>>  > Reported-by: kernel test robot <lkp@intel.com>
>>  > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> =

>>  Acked-by: Paul Cercueil <paul@crapouillou.net>
> =

> Thanks for the ack.
> =

> David and Daniel,
> I think there is no dedicated maintainer for Ingenic DRM, so can you
> pick it up directly?

I am. Pushed to drm-misc-next, thanks!

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
