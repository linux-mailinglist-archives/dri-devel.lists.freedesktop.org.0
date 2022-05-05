Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830E351B9B2
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF0910F7AD;
	Thu,  5 May 2022 08:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5256B10F702
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:11:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B3EF2210E7;
 Thu,  5 May 2022 08:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651737933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DyFvKk/4W60YxjAcVzDWN45Rwd9cCqYosDJPWwfh4ak=;
 b=pvrOwLGXTEp+Ew9xOFHC//eYd03F8eROA9mXou6FTfb9tKF2XsY9FUQ1ybUc427NWCKFqD
 gK+XokyvtMNxVEGj+rxjxwlo9YtQo543qwPLEzt5ZTDdH6qt148eDtx1v7RnNIQ7+tX9Y1
 pObQIEq1tIEl5a6UrJT4vcwRvWK+pcI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651737933;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DyFvKk/4W60YxjAcVzDWN45Rwd9cCqYosDJPWwfh4ak=;
 b=HPWN8OVCi9cC9x+W7mKhzFEFWklVhgE1U/J7LQbcLVQMmrqEUvwQNQfDCtbqSoVGdLvWPL
 FLr1wS7G+2ee+XCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9081313A65;
 Thu,  5 May 2022 08:05:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n592Ik2Fc2JIAgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 May 2022 08:05:33 +0000
Message-ID: <78167587-fd2e-354c-485b-db4ee9251178@suse.de>
Date: Thu, 5 May 2022 10:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215722.56970-1-javierm@redhat.com>
 <974f4d00-89bc-a2da-6d65-ca4207300794@suse.de>
 <d9a5cb30-2d9b-50b5-d287-0ead0fe252f3@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <d9a5cb30-2d9b-50b5-d287-0ead0fe252f3@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zyMl9rGKFT3zaRjt2DtqjCrf"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zyMl9rGKFT3zaRjt2DtqjCrf
Content-Type: multipart/mixed; boundary="------------Cxs6xXOI46IUhSlhHJMDFV5H";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <78167587-fd2e-354c-485b-db4ee9251178@suse.de>
Subject: Re: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215722.56970-1-javierm@redhat.com>
 <974f4d00-89bc-a2da-6d65-ca4207300794@suse.de>
 <d9a5cb30-2d9b-50b5-d287-0ead0fe252f3@redhat.com>
In-Reply-To: <d9a5cb30-2d9b-50b5-d287-0ead0fe252f3@redhat.com>

--------------Cxs6xXOI46IUhSlhHJMDFV5H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDUuMjIgdW0gMDk6Mzggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDUvNS8yMiAwOToyOSwgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6DQo+IA0KPiBbc25pcF0NCj4gDQo+Pj4gICAgc3RhdGljIHZv
aWQgc2ltcGxlZmJfZGVzdHJveShzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4+PiAgICB7DQo+
Pj4gICAgCXN0cnVjdCBzaW1wbGVmYl9wYXIgKnBhciA9IGluZm8tPnBhcjsNCj4+PiBAQCAt
OTQsNiArOTgsOCBAQCBzdGF0aWMgdm9pZCBzaW1wbGVmYl9kZXN0cm95KHN0cnVjdCBmYl9p
bmZvICppbmZvKQ0KPj4+ICAgIAlpZiAoaW5mby0+c2NyZWVuX2Jhc2UpDQo+Pj4gICAgCQlp
b3VubWFwKGluZm8tPnNjcmVlbl9iYXNlKTsNCj4+PiAgICANCj4+PiArCWZyYW1lYnVmZmVy
X3JlbGVhc2UoaW5mbyk7DQo+Pj4gKw0KPj4+ICAgIAlpZiAobWVtKQ0KPj4+ICAgIAkJcmVs
ZWFzZV9tZW1fcmVnaW9uKG1lbS0+c3RhcnQsIHJlc291cmNlX3NpemUobWVtKSk7DQo+Pg0K
Pj4gVGhlIG9yaWdpbmFsIHByb2JsZW0gd2l0aCBmYmRldiBob3QtdW5wbHVnIHdhcyB0aGF0
IHZtd2dmeCBuZWVkZWQgdGhlDQo+PiBmcmFtZWJ1ZmZlciByZWdpb24gdG8gYmUgcmVsZWFz
ZWQuIElmIHdlIHJlbGVhc2UgaXQgb25seSBhZnRlciB1c2Vyc3BhY2UNCj4+IGNsb3NlZCBp
dCdzIGZpbmFsIGZpbGUgZGVzY3JpcHRvciwgdm13Z2Z4IGNvdWxkIGhhdmUgYWxyZWFkeSBm
YWlsZWQuDQo+Pg0KPj4gSSBzdGlsbCBkb24ndCBmdWxseSBnZXQgd2h5IHRoaXMgY29kZSBh
cHBhcmVudGx5IHdvcmtzIG9yIGF0IGxlYXN0DQo+PiBkb2Vzbid0IGJsb3cgdXAgb2NjYXNp
b25hbGx5LiBBbnkgaWRlYXM/DQo+Pg0KPiANCj4gSSBiZWxpZXZlIHRoYXQgdm13Z2Z4IGRv
ZXNuJ3QgZmFpbCB0byBwcm9iZSAob3IgYW55IG90aGVyIERSTSBkcml2ZXIpDQo+IG9ubHkg
d2hlbiB0aGVyZSBhcmUgbm90IHVzZXItc3BhY2UgcHJvY2Vzc2VzIHdpdGggYSBmYmRldiBu
b2RlIG9wZW5lZA0KPiBzaW5jZSBvdGhlcndpc2UgYXMgeW91IHNhaWQgdGhlIG1lbW9yeSB3
b3VsZG4ndCBiZSByZWxlYXNlZCB5ZXQuDQo+IA0KPiB1bnJlZ2lzdGVyX2ZyYW1lYnVmZmVy
KCkgaXMgY2FsbGVkIGZyb20gdGhlIGRyaXZlcidzIC5yZW1vdmUgaGFuZGxlcg0KPiBhbmQg
dGhhdCBkZWNyZW1lbnQgdGhlIGZiX2luZm8gcmVmY291bnQsIHNvIGlmIHJlYWNoZXMgemVy
byBpdCB3aWxsDQo+IGNhbGwgdG8gdGhlIGZiIGZvcHMgLmRlc3Ryb3koKSBoYW5kbGVyIGFu
ZCByZWxlYXNlIHRoZSBJL08gbWVtb3J5Lg0KPiANCj4gSW4gb3RoZXIgd29yZHMsIGluIG1v
c3QgY2FzZXMgKGkuZTogb25seSBmYmNvbiBib3VuZCB0byB0aGUgZmJkZXYpDQo+IHRoZSBk
cml2ZXIncyByZW1vdmFsLyBkZXZpY2UgdW5iaW5kIGFuZCB0aGUgbWVtb3J5IHJlbGVhc2Ug
d2lsbCBiZQ0KPiBhdCB0aGUgc2FtZSB0aW1lLg0KPiANCg0KV2UncmUgb25lIHRoZSBzYW1l
IHBhZ2UgaGVyZSwgYnV0IGl0J3Mgc3RpbGwgc29ydCBvZiBhIG15c3RlcnkgdG8gbWUgd2h5
IA0KdGhpcyB3b3JrcyBpbiBwcmFjdGljZS4NCg0KSSdtIHNwZWNpZmljYWxseSB0YWxraW5n
IGFib3V0IHBjaV9yZXF1ZXN0X3JlZ2lvbnMoKSBpbiB2bXdnZnggWzFdLiBJSVJDIA0KdGhp
cyB3b3VsZCBmYWlsIGlmIHNpbXBsZWZiIHN0aWxsIG93bnMgdGhlIGZyYW1lYnVmZmVyIHJl
Z2lvbi4gTG90cyBvZiANCnN5c3RlbXMgcnVuIFBseW1vdXRoIGR1cmluZyBib290IGFuZCB0
aGlzIHNob3VsZCByZXN1bHQgaW4gZmFpbHVyZXMgDQpvY2Nhc2lvbmFsbHkuIFN0aWxsLCB3
ZSBuZXZlciBoZWFyZCBhYm91dCBhbnl0aGluZy4NCg0KT2YgY291cnNlLCBpdCdzIGFsd2F5
cyBiZWVuIGJyb2tlbiAoZXZlbiBsb25nIGJlZm9yZSByZWFsIGZiZGV2IA0KaG90dW5wbHVn
Z2luZykuIFN3aXRjaGluZyB0byBzaW1wbGVkcm0gcmVzb2x2ZXMgdGhlIHByb2JsZW0uDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y1LjE3LjUvc291cmNlL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2Rydi5jI0w3MjcNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------Cxs6xXOI46IUhSlhHJMDFV5H--

--------------zyMl9rGKFT3zaRjt2DtqjCrf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJzhU0FAwAAAAAACgkQlh/E3EQov+Dk
MhAAgVKNyY2VlGbZxaBKoIwT/U7WDVYz3/SL6RFDoJKuuACkdIu3/xLRru2pBCw2w+gDpaQRes6n
gRoF9KOXXgt/rsWnVXlHMi2gkA7oi/dDBrz814qAA2xHNwmKMSOyeVTZrSzAoViCkpj7n5YOhhet
1EeFdDsttuzdrBsbzY4FsomAiIke/OM2d3X+rdr0iUElUz0WOd1059CvPj/aNgWeDCImVkeXwid7
nZRIDVEdvULSZqufXY6vsE8bhYpR6XaJ3MgyTTmMrueOtqDWooGTTm8/0S6E+OJzsWso3i15PPp/
ZFln0qNdhtuVrEKfO2badkyOmoR+yyTHYG0w1NTi1FuRXhdCKUNJXHNbI+tMReoHbIGmnH+gdMUO
u7U64ZXTUsY8Jx+XmvkeAEgWldbn23KKi2zdkKgkcsaJuGOtHMVNfjmyVwBIHdgMYo3Fw8fcW8j7
dnnAxH7axl67RIyvxYz8/SBp/FR2x1T7lb7c4L+38re7dF24uWIG9sU501lWSTS7RcApGEf/1p0u
p8hJ2UXlBjhdKSVBlO4fT+Pxtsx1jWoCwnsPsEAzHRn1K3dusRuJ/C7sBb1fqLnduRxjY1V9HG7L
5jMgHePfw2zNu6qaJmiYRheZM3iX6PlrpLTX7UKIc3XxgfnUewJYugEk5UnLZ+OaNDiSwfqqAl0p
CSw=
=P1yn
-----END PGP SIGNATURE-----

--------------zyMl9rGKFT3zaRjt2DtqjCrf--
