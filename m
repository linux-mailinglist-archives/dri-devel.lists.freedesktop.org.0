Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0186C1223
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 13:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE3010E05F;
	Mon, 20 Mar 2023 12:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BDE10E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 12:44:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9DF751F86C;
 Mon, 20 Mar 2023 12:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679316258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Y3Or3PJWhcTymysyC/xHrHVgoRe3EQ5n5YDf278P/E=;
 b=pWhr1s0jNhleryAidYddumgKKD6nLT5a+PnQFi/uja3nYHgMW3p1bN0UcGSztOWQjBeb0D
 0gEho12vgAi1/xC5ilDPmJc3gXAgd358D1UJaeXePvgwihzNsZ5cUfkso44sNhfaHbO/ua
 kxOACpanUokBHur3/6iVVREAaEaC2tM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679316258;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Y3Or3PJWhcTymysyC/xHrHVgoRe3EQ5n5YDf278P/E=;
 b=0j+FgXac0a2XIkU2Xy88T8CkECYkS+Mva2WUwkGKo6nP7UiucfbhoJnLQQQh1kDy1BU18v
 GVEmc/Hm430i2oDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61C1413A00;
 Mon, 20 Mar 2023 12:44:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RzPzFiJVGGT1ZAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 12:44:18 +0000
Message-ID: <df4a4f28-b775-9149-71ba-3edaf2cd5f42@suse.de>
Date: Mon, 20 Mar 2023 13:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/6] drm/fbdev-generic: Clean up after failed probing
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-5-tzimmermann@suse.de>
 <87sfe3pnv0.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87sfe3pnv0.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A0xxOFVLPKI6SiZcCX0hEFX3"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------A0xxOFVLPKI6SiZcCX0hEFX3
Content-Type: multipart/mixed; boundary="------------VhMpXjpe5km95WbOFI0nm90t";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Message-ID: <df4a4f28-b775-9149-71ba-3edaf2cd5f42@suse.de>
Subject: Re: [PATCH 4/6] drm/fbdev-generic: Clean up after failed probing
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-5-tzimmermann@suse.de>
 <87sfe3pnv0.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87sfe3pnv0.fsf@minerva.mail-host-address-is-not-set>

--------------VhMpXjpe5km95WbOFI0nm90t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDE3LjAzLjIzIHVtIDEzOjI0IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4gWy4uLl0NCj4gDQo+PiBAQCAtOTEsMzYgKzkzLDUyIEBAIHN0
YXRpYyBpbnQgZHJtX2ZiZGV2X2ZiX3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9o
ZWxwZXIsDQo+PiAgIA0KPj4gICAJZmJfaGVscGVyLT5idWZmZXIgPSBidWZmZXI7DQo+PiAg
IAlmYl9oZWxwZXItPmZiID0gYnVmZmVyLT5mYjsNCj4+IC0JZmIgPSBidWZmZXItPmZiOw0K
Pj4gKw0KPj4gKwlzY3JlZW5fc2l6ZSA9IGJ1ZmZlci0+Z2VtLT5zaXplOw0KPiANCj4gWy4u
Ll0NCj4gDQo+PiAtCWluZm8tPnNjcmVlbl9zaXplID0gc2l6ZXMtPnN1cmZhY2VfaGVpZ2h0
ICogZmItPnBpdGNoZXNbMF07DQo+IA0KPiBbLi4uXQ0KPiANCj4gSSB3b25kZXIgaWYgdGhp
cyBjaGFuZ2Ugc2hvdWxkIGJlIGEgc2VwYXJhdGUgcGF0Y2g/IEkga25vdyB0aGF0IGl0IHNo
b3VsZA0KPiBiZSB0aGUgc2FtZSBzaXplIGJ1dCBzdGlsbCBmZWVscyBsaWtlIGFuIHVucmVs
YXRlZCBjaGFuZ2UgdGhhdCBkZXNlcnZlcyBhDQo+IGRpZmZlcmVudCBwYXRjaCBhbmQgZGVz
Y3JpcHRpb24uDQoNClRoaXMgY29tbWVudCBtYWRlIG1lIGxvb2sgdXAgdGhlIGV4YWN0IG1l
YW5pbmcgaWYgc2NyZWVuX3NpemUsIHdoaWNoIGlzIA0KIkFtb3VudCBvZiBpb3JlbWFwcGVk
IFZSQU0gb3IgMCIuIFsxXSBPdGhlciBkcml2ZXJzIHdpdGggc2hhZG93IGJ1ZmZlcnMgDQoo
dWRsZmIsIG1ldHJvbm9tZWZiKSBhcHBhcmVudGx5IGRvbid0IHNldCB0aGlzIGZpZWxkLiBT
byB0aGUgZ2VuZXJpYyANCmZiZGV2IHByb2JhYmx5IHNob3VsZG4ndCBlaXRoZXIuIFRoZSBz
aXplIG9mIHRoZSB2aWRlbyBtZW1vcnkgKHBoeXNpY2FsIA0Kb3Igc2hhZG93ZWQpIGluIGlu
IGZpeC5zbWVtX2xlbi4gWzJdIEZyb20gZ3JlcCdpbmcgdGhyb3VnaCB0aGUgc291cmNlIA0K
Y29kZSwgaXQncyBub3QgY2xlYXIgdG8gbWUgd2h5IHNjcmVlbl9zaXplIGV4aXN0cyBpbiB0
aGUgZmlyc3QgcGxhY2UuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2luY2x1ZGUvbGludXgv
ZmIuaCNMNDk0DQpbMl0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNlL2luY2x1ZGUvdWFwaS9saW51eC9mYi5oI0wxNjENCg0KPiANCj4gWy4uLl0N
Cj4gICAgDQo+PiAtCS8qIFNldCBhIGRlZmF1bHQgZGVmZXJyZWQgSS9PIGhhbmRsZXIgKi8N
Cj4+ICsJLyogZGVmZXJyZWQgSS9PICovDQo+IA0KPiBJIHdvdWxkIGVpdGhlciBoYXZlIGl0
IGFzIC8qIEdlbmVyaWMgZmJkZXYgZGVmZXJyZWQgSS9PIGhhbmRsZXIgKi8gb3IganVzdA0K
PiByZW1vdmUgdGhlIGNvbW1lbnQuIEkgdW5kZXJzdGFuZCB3aHkgeW91IGFyZSByZW1vdmlu
ZyB0aGUgImRlZmF1bHQiLCBzaW5jZQ0KPiBpbXBsaWVzIHRoYXQgZHJpdmVycyBjYW4gY2hh
bmdlIHRoZSBoYW5kbGVyIGFuZCB0aGF0J3Mgbm90IHRoZSBjYXNlIGhlcmUuDQo+IA0KPiBC
dXQgSSB0aGluayB0aGF0IGp1c3QgbGVhdmluZyB0aGUgImRlZmVycmVkIEkvTyIgY29tbWVu
dCB0aGVyZSBkb2Vzbid0IHNheQ0KPiB0aGF0IG11Y2guDQo+IA0KPiBSZXZpZXdlZC1ieTog
SmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IA0KDQot
LSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jD
pGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------VhMpXjpe5km95WbOFI0nm90t--

--------------A0xxOFVLPKI6SiZcCX0hEFX3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQYVSEFAwAAAAAACgkQlh/E3EQov+AE
PQ//b0PE0GRPR8tWHTXGhWeaC8yC2YlzQuLsGBV9DIYxV0yAP8/WtMI6Q3kloxNKsZeZj3R45MZh
x9tjLXTzqmtXA8z8beMx8+w/cTOqnFlJ5sh0sZxp9GCe59/cafCDlEjl4JKuP6QuqLqFArsXqTEp
uWtz3jzNyOzT4FNKQJEzg7kNckCkRC0nsx6ppbj1q6IKDyq796nmK67jwFmimNOjLQNgGrXnNxUd
QfDvQrZ53b21nElMgurWv1Bpi4md+sjhTfIjSzM/9iYigaQycp9WJrdbuP3d/mkBwqIfLVi6psk7
boRQC7QiLt/K5YuPQEda/8GQVgQTrV+Ngj2xWK6PQqEOYrGn9teeR+4MVOHfwZhbJglZKknrb33l
N9XWH/LoYP5SFJ4tkfqa3YM1ENn8wTcUq7Z0J4GJ0gIX3EHhp3bCFl2cvE040OVCiuT8Oab6k/5Q
Zh1Q6Awp20RlGm8llU3Dl4qo3G8oFaWxYrQxRl4HogDmLBlRZYzj3qwFRYrL9JGjJgav1nbjoDUa
aA3749HePFR+5hHXx702I0iGT9VzbUn0/+DqTfJbYgYHnTPaUS2qAp4JPtJ/DAw8ZJeFq/RTujEH
tpG6rZOlQPPnUDSqyBfX/FmEfpiAuZgoNItvEt9TDdK2YYATCpAuZRTADw0wPpCWAVkr6XVXsg3C
KuI=
=VhFQ
-----END PGP SIGNATURE-----

--------------A0xxOFVLPKI6SiZcCX0hEFX3--
