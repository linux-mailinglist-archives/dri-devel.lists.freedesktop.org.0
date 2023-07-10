Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C374D850
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 15:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82F610E1B2;
	Mon, 10 Jul 2023 13:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7904110E1B2;
 Mon, 10 Jul 2023 13:59:41 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1qIrQO-0015b5-SK; Mon, 10 Jul 2023 15:59:36 +0200
Received: from p57bd95f7.dip0.t-ipconnect.de ([87.189.149.247]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1qIrQO-001lZK-KC; Mon, 10 Jul 2023 15:59:36 +0200
Message-ID: <536cc8c679cc68829c8662176ff02a9052249a46.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 08/17] arch/sh: Do not assign FBINFO_FLAG_DEFAULT to
 fb_videomode.flag
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, javierm@redhat.com
Date: Mon, 10 Jul 2023 15:59:35 +0200
In-Reply-To: <54e3e070-52fb-9ccb-bc47-0f41690f6bfa@suse.de>
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710130113.14563-9-tzimmermann@suse.de>
 <0a47ed93fe90a77180533f8c2e42e402827e8f1c.camel@physik.fu-berlin.de>
 <54e3e070-52fb-9ccb-bc47-0f41690f6bfa@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.149.247
X-ZEDAT-Hint: PO
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas!

On Mon, 2023-07-10 at 15:52 +0200, Thomas Zimmermann wrote:
> > I would argue that the current code is more readable that your proposed=
 change.
> >=20
> > I agree that it's a no-op, but code is not just about functionality but=
 also
> > readability, isn't it?
>=20
> I won't argue with that, but the flag itself is wrong.=20
> FBINFO_FLAG_DEFAULT is/was for struct fb_info.flags. You have struct=20
> fb_videomode.flag. The valid flags for this field are at [1]. If=20
> anything, the field could be initialized to FB_MODE_IS_UNKNOWN, which=20
> has the same value.
>=20
> [1] https://elixir.bootlin.com/linux/latest/source/include/linux/fb.h#L68=
1

FB_MODE_IS_UNKNOWN sounds very reasonable to me. Would you agree using that=
 instead?

> >=20
> > Also, I prefer "sh:" as the architecture prefix, not "arch/sh:".
>=20
> Ok.

Thanks.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
