Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D451B492848
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 15:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0D710E6D6;
	Tue, 18 Jan 2022 14:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8934510E6D6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 14:23:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C5491F3C0;
 Tue, 18 Jan 2022 14:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642515822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tM6zt9zecMhOJSD1c47Vgit3U6uq8FT429lnN1jQWA4=;
 b=QS2H8AMo2BkBlkVx2UUOhJJbuFd52rl1CA5wCH4cv0cOsQHV+3Zx5YyRdTms6K1Ry/bD4n
 oD2PO4c8+Wn+EmknI8OsDNw1ECY0XjsFc3qipgcT+u37KCoik0sqaqEd6T/dKPg27L2vTt
 whj4mpe+J2V5FtRxKUM/8mV+JqTSOaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642515822;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tM6zt9zecMhOJSD1c47Vgit3U6uq8FT429lnN1jQWA4=;
 b=aADDFnnCPd+3fQWLWHazAyKQCWMg2JWz7PTyDTJEsorhPQeKbS7NfgPm19wddtRVnN2JAV
 1UrqpLSeO51J1sDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EB45D13AB6;
 Tue, 18 Jan 2022 14:23:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WKZxOG3N5mHsPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Jan 2022 14:23:41 +0000
Message-ID: <3f96f393-e59d-34ac-c98b-46180e2225cd@suse.de>
Date: Tue, 18 Jan 2022 15:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
 <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------14SQUsxm06705p8tH2chcwLf"
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
 Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------14SQUsxm06705p8tH2chcwLf
Content-Type: multipart/mixed; boundary="------------2szkWFXyk0r6UwvNxqEM6tru";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sven Schnelle <svens@stackframe.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <3f96f393-e59d-34ac-c98b-46180e2225cd@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
 <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
In-Reply-To: <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>

--------------2szkWFXyk0r6UwvNxqEM6tru
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDEuMjIgdW0gMDk6MTAgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIEdlcmQsDQo+IA0KPiBPbiBUdWUsIEphbiAxOCwgMjAyMiBhdCA3OjMwIEFNIEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiB3cm90ZToNCj4+IEFsc28gbm90ZSB0
aGF0IHVzaW5nIGEgc2hhZG93IGZyYW1lYnVmZmVyIGFsbG93cyB0byBkZWNvdXBsZSBmYmNv
bg0KPj4gdXBkYXRlcyBhbmQgc2Nhbm91dCBmcmFtZWJ1ZmZlciB1cGRhdGVzLiAgQ2FuIGJl
IHVzZWQgdG8gc3BlZWQgdXANCj4+IHRoaW5ncyB3aXRob3V0IGRlcGVuZGluZyBvbiB0aGUg
MmQgYmxpdHRlci4NCj4gDQo+IEFzc3VtaW5nIGFjY2Vzc2VzIHRvIHRoZSBzaGFkb3cgZnJh
bWUgYnVmZmVyIGFyZSBmYXN0ZXIgdGhhbiBhY2Nlc3Nlcw0KPiB0byB0aGUgc2Nhbm91dCBm
cmFtZSBidWZmZXIuIFdoaWxlIHRoaXMgaXMgdHJ1ZSBvbiBtb2Rlcm4gaGFyZHdhcmUsDQo+
IHRoaXMgaXMgbm90IHRoZSBjYXNlIG9uIGFsbCBoYXJkd2FyZS4gIEVzcGVjaWFsbHkgaWYg
dGhlIHNoYWRvdyBmcmFtZQ0KPiBidWZmZXIgaGFzIGEgaGlnaGVyIGRlcHRoIChYUkdCODg4
OCkgdGhhbiB0aGUgc2Nhbm91dCBmcmFtZSBidWZmZXINCj4gKGUuZy4gQ24pLi4uDQo+IA0K
PiBUaGUgZnVubnkgdGhpbmcgaXMgdGhhdCB0aGUgc3lzdGVtcyB3ZSBhcmUgaW50ZXJlc3Rl
ZCBpbiwgb25jZSB1c2VkDQo+IHRvIGJlIGtub3duIGZvciB0aGVpciBncmFwaGljcyBjYXBh
YmlsaXRpZXMgYW5kL29yIHBlcmZvcm1hbmNlLi4uDQoNCldoYXQgSSBzdGlsbCBkb24ndCB1
bmRlcnN0YW5kOiB3aHkgYXJlIHlvdSBzbyBrZWVuIG9uIG1haW50YWluaW5nIGFuIA0KaW50
ZXJmYWNlIHRoYXQgb25seSBzZXJ2ZXMgdGhlIGNvbnNvbGU/IE5vdGhpbmcgZWxzZSB1c2Vz
IGZiZGV2IHRoZXNlIA0KZGF5cy4gV2h5IG5vdCBpbXByb3ZlIERSTS91c2Vyc3BhY2UgdG8g
dGhlIHBvaW50IHdoZXJlIGl0IGZpdHMgeW91ciANCnJlcXVpcmVtZW50cz8gTG9uZy10ZXJt
LCB0aGUgbGF0dGVyIHdvdWxkIG1ha2UgYSBsb3QgbW9yZSBzZW5zZS4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgt
bTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------2szkWFXyk0r6UwvNxqEM6tru--

--------------14SQUsxm06705p8tH2chcwLf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHmzW0FAwAAAAAACgkQlh/E3EQov+DD
YQ//U8Hso+ElXk2uF3RYfYt3ZsZ/mVcFtvtHxmnVI7Kuh7Hd2TyU8gOBSjx14fXMakmIzOFlU7ap
2lE66012f//80xRKb2EDjHZmI8LfBa628t/Ez3i+4diQFa4QvigZWO7Bn3zuccx10RE8QS3n7op2
a0cX2z5u9KTacmOkCV1ShrqgODlB27RqmKG1ZsGzcmiBRINuQ9AFprg7f1R+iHOCrOrJz3seXxpQ
F1k+1pH4JdLsfL4x7BkOS7qtctpL27iYTRhpCZcI62pZ/2MFjlCzP2nnkcyUGj6IcqOjD9tKf7zO
94kOwjA+k0JKB7XGZ1oiVCcAbWkEQFgjJm500P+4iIhLjJzCGem+bbFa531zvrDxrPr+gWS75No8
cu0dNhDO7TrT4Vy/dri6XYImoPAKQ7Xq/vSM3mhhkiW5j9gKkCK/hMhJEtu/gKQeehwttFLqCiXs
WRDU8Oxhairf3yMhCAt/7DkojAHY/xSJt/2Gd/X4+tD9dfEtDdYw9vg5yLSRCYJZm9rLGBziTskV
Di5rR0y2i/Mk98LtE79mstnHxCdcvp0XL+uueTXsw9U85/kQFbyvXlguq14gD92/JxYpcOwHBSAL
WqJblRv8XAKqxwSl2MD/43TZLlgrqxVEw/R8pZVSL0rgP239mHPFMRiv7J9PcpulIRx5P1NgLIJr
SQo=
=59FY
-----END PGP SIGNATURE-----

--------------14SQUsxm06705p8tH2chcwLf--
