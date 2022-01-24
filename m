Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482D49846A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522FB10E18C;
	Mon, 24 Jan 2022 16:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34E510E18C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:11:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FF63218A9;
 Mon, 24 Jan 2022 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643040708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XnUfGUPPVAeHs0amZ7Fk81HAoAs/nV9B8a9/MAM6+GE=;
 b=HrLQ48iTRJwyE4u/wzcSUc5thP1maYKA8TBvLJGV1UGqz9RPMRVNk6nX9bVIzTY2/jyeor
 VLHQkTEy1o+itKC5xvyvKwKvpyVrrIxBifxXxXYu/4L67EfWIs2lTBKLMbT+E95+R+4MMd
 sb9h2nVqSmipGena65kDM8j0F3Qx3Ks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643040708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XnUfGUPPVAeHs0amZ7Fk81HAoAs/nV9B8a9/MAM6+GE=;
 b=HC0Ug3+l5f/rRZz3tWdCwypFxNfPOiKNmakE81z0ZwOcW4nlKa9RsavmN48AUJcaw9s91r
 IFaLPDgBllMIW+Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E477B13C33;
 Mon, 24 Jan 2022 16:11:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f1ORNcPP7mGINgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jan 2022 16:11:47 +0000
Message-ID: <2d608d02-54ec-94b6-83c4-9f6c29c34c27@suse.de>
Date: Mon, 24 Jan 2022 17:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
 <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
 <20220121072006.ylw2hdl7jbkbwnre@sirius.home.kraxel.org>
 <64fd46cb-9746-3fd0-ec92-c64dba76875a@gmx.de>
 <d23800b4-503c-a6e2-2c51-2c07a736dffc@suse.de>
 <CAMuHMdXu_paBcNhevgxXzr1pEes7qWtD=RHXTrqP=hxNBkupnw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdXu_paBcNhevgxXzr1pEes7qWtD=RHXTrqP=hxNBkupnw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iRTp0NFwBh9eHcTGeU1Z5eDJ"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sven Schnelle <svens@stackframe.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iRTp0NFwBh9eHcTGeU1Z5eDJ
Content-Type: multipart/mixed; boundary="------------PimFI8AXsGXVPasze1EMNbqT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Helge Deller <deller@gmx.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Claudio Suarez <cssk@net-c.es>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <2d608d02-54ec-94b6-83c4-9f6c29c34c27@suse.de>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
 <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
 <20220121072006.ylw2hdl7jbkbwnre@sirius.home.kraxel.org>
 <64fd46cb-9746-3fd0-ec92-c64dba76875a@gmx.de>
 <d23800b4-503c-a6e2-2c51-2c07a736dffc@suse.de>
 <CAMuHMdXu_paBcNhevgxXzr1pEes7qWtD=RHXTrqP=hxNBkupnw@mail.gmail.com>
In-Reply-To: <CAMuHMdXu_paBcNhevgxXzr1pEes7qWtD=RHXTrqP=hxNBkupnw@mail.gmail.com>

--------------PimFI8AXsGXVPasze1EMNbqT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDEuMjIgdW0gMTY6NTAgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IE9uIE1vbiwgSmFuIDI0LCAyMDIyIGF0IDEyOjMzIFBNIFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+IFdpdGggZmJkZXYgZW11bGF0aW9u
LCBldmVyeSBEUk0gZHJpdmVyIGlzIGFuIGZiZGV2IGRyaXZlciB0b28uIFNvDQo+IA0KPiBT
b21lIGFyZSBldmVuIHdpdGhvdXQ/DQo+IA0KPiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9mYi5jOiAgICAgcmV0ID0gcmVnaXN0ZXJfZnJhbWVidWZmZXIoaW5mbyk7DQoNCldl
bGwsIEkgY291bnRlZCB0aGlzIGFzICdlbXVsYXRpb24nIGFzIHdlbGwuIFRoZXJlJ3MgZnVs
bHkgDQpkcml2ZXItYWdub3N0aWMgZmJkZXYgc3VwcG9ydCBpbiBEUk0sIGJ1dCBzb21lIGRy
aXZlcnMgc3RpbGwgcnVuIHRoZWlyIA0Kb3duLiBBdCBzb21lIHBvaW50LCB3ZSB3YW50IGFs
bCBkcml2ZXJzIHRvIHVzZSBEUk0ncyBnZW5lcmljIHNvbHV0aW9uLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1t
NjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------PimFI8AXsGXVPasze1EMNbqT--

--------------iRTp0NFwBh9eHcTGeU1Z5eDJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHuz8IFAwAAAAAACgkQlh/E3EQov+C9
Tw/+NyQbUldd1/42Fkul2EglrD9sAbWlKeCb0x6HKCZpPW1GYCuDlHRbnwPmmLn36ehXBIDJRFKH
ezOAWdmK1YKGeYgxbDJThYVJIUvcy0KzZe3PmpDkV+wziI5AUByQP+O1muGPFRT8Aea2VmPB9Ab7
iBirH36B/i6BuxtWdx45zbHi/zmTpIiEFvOVKOOHsNRJDeS9TjVWElOOzDuHYcUobfWa6LED5Ymn
PTuScP7QA70RkhgGfLEotne9ReGQzt/uEIDpBoYSzgMMdYya9lg73jZU/HcDG9ENYoOg04TicfTQ
p5zJ/1q+K6jMHQ5GQp6TJrp3yeHitUwcW+cmemiT3Nxg4umulUVK//pXnz/IVydbPzhza/j4s23z
dM6UiGZROCfnjjz3y7UeMpBHnJE9jLpmZ49mhZU6jMrTwia4ogsYwRTKZepwyNVp+6jL8Hb/mVGp
ddSdJJDLwKlPz3yYpvamngZPGrP5CXC6oHL1sh8zI+xHp5hPh6RDPgUMJdSa5R1IC2CMmSB49687
SaOUTvsnpK8AOhV9Dkeh1GisOYSfdSRsnuqKRpJto5gNUJcSMZzgSopOvBK+iisZ6mh4MwihqAes
8BVgCYGXP/SyX9FIcqzZoSj2Oa5rQbyT8MWx0xeiSO3m0LOG2zFqpvVau8SD0Yhz84B7Puc9Co0m
bFs=
=5Ca6
-----END PGP SIGNATURE-----

--------------iRTp0NFwBh9eHcTGeU1Z5eDJ--
