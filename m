Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C54006EA593
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 10:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9E610E223;
	Fri, 21 Apr 2023 08:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D958610E298
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 08:08:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 894371FDDB;
 Fri, 21 Apr 2023 08:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682064529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AmnNAyzuHqdwISHb7fTuBeG1WtznHLjfBMs7lyqYNe0=;
 b=ykBdRGUESierwcrlyqUHS69ZiqIqpN16zYbrwfeUUqc/xptQoL4M60eGO6Qy5VGoGlQduR
 levtGlB9B8hJAgkS/Tofdq25ngIKZd15GUXIChNQZhBH0AsStuzoC+wiBOFZ6gPApvYOKi
 n1ISDGAkQpV9McBwPMnYJNWxsZeNw/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682064529;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AmnNAyzuHqdwISHb7fTuBeG1WtznHLjfBMs7lyqYNe0=;
 b=hlovQ8nfGtEvN9mw94ZIlBlhAgpdiW8bzYIP3FwmtYLwm5KcopVV/VQLQWDEqbmGG8zT/2
 ztuR3F9sNsH+3uCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F9401390E;
 Fri, 21 Apr 2023 08:08:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RHv/GZFEQmQHJgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Apr 2023 08:08:49 +0000
Message-ID: <024d4ec8-55f4-b9df-71e1-25a891e14c43@suse.de>
Date: Fri, 21 Apr 2023 10:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drm/ast: Fix ARM compatibility
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com
References: <20230421003354.27767-1-jammy_huang@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230421003354.27767-1-jammy_huang@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------E6y17sMEjqwF0O6XmO5yTkua"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------E6y17sMEjqwF0O6XmO5yTkua
Content-Type: multipart/mixed; boundary="------------qOOlcXX6fCv2HSU8Xmj2K6kP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <024d4ec8-55f4-b9df-71e1-25a891e14c43@suse.de>
Subject: Re: [PATCH v3] drm/ast: Fix ARM compatibility
References: <20230421003354.27767-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20230421003354.27767-1-jammy_huang@aspeedtech.com>

--------------qOOlcXX6fCv2HSU8Xmj2K6kP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDQuMjMgdW0gMDI6MzMgc2NocmllYiBKYW1teSBIdWFuZzoNCj4gQVJN
IGFyY2hpdGVjdHVyZSBvbmx5IGhhcyAnbWVtb3J5Jywgc28gYWxsIGRldmljZXMgYXJlIGFj
Y2Vzc2VkIGJ5DQo+IE1NSU8gaWYgcG9zc2libGUuDQoNCk1lcmdlZCBpbnRvIGRybS1taXNj
LWZpeGVzLiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFtbXkgSHVhbmcgPGphbW15X2h1YW5nQGFzcGVl
ZHRlY2guY29tPg0KPiBSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQo+IC0tLQ0KPiAgIHYyIGNoYW5nZXM6DQo+ICAgIC0gVXNlIE1NSU8g
YWZ0ZXIgQVNUMjUwMCB3aGljaCBlbmFibGUgTU1JTyBieSBkZWZhdWx0Lg0KPiAgIHYzIGNo
YW5nZXM6DQo+ICAgIC0gQ29ycmVjdCBjb21tZW50cw0KPiAtLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tYWluLmMgfCA5ICsrKysrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbWFpbi5jDQo+IGluZGV4IGY4M2NlNzcxMjdjYi4uYTZkMGVlNGRhMmI4IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+IEBAIC00MjUsMTEgKzQyNSwxMiBAQCBzdHJ1
Y3QgYXN0X3ByaXZhdGUgKmFzdF9kZXZpY2VfY3JlYXRlKGNvbnN0IHN0cnVjdCBkcm1fZHJp
dmVyICpkcnYsDQo+ICAgCQlyZXR1cm4gRVJSX1BUUigtRUlPKTsNCj4gICANCj4gICAJLyoN
Cj4gLQkgKiBJZiB3ZSBkb24ndCBoYXZlIElPIHNwYWNlIGF0IGFsbCwgdXNlIE1NSU8gbm93
IGFuZA0KPiAtCSAqIGFzc3VtZSB0aGUgY2hpcCBoYXMgTU1JTyBlbmFibGVkIGJ5IGRlZmF1
bHQgKHJldiAweDIwDQo+IC0JICogYW5kIGhpZ2hlcikuDQo+ICsJICogQWZ0ZXIgQVNUMjUw
MCwgTU1JTyBpcyBlbmFibGVkIGJ5IGRlZmF1bHQsIGFuZCBpdCBzaG91bGQgYmUgYWRvcHRl
ZA0KPiArCSAqIHRvIGJlIGNvbXBhdGlibGUgd2l0aCBBcm0uDQo+ICAgCSAqLw0KPiAtCWlm
ICghKHBjaV9yZXNvdXJjZV9mbGFncyhwZGV2LCAyKSAmIElPUkVTT1VSQ0VfSU8pKSB7DQo+
ICsJaWYgKHBkZXYtPnJldmlzaW9uID49IDB4NDApIHsNCj4gKwkJYXN0LT5pb3JlZ3MgPSBh
c3QtPnJlZ3MgKyBBU1RfSU9fTU1fT0ZGU0VUOw0KPiArCX0gZWxzZSBpZiAoIShwY2lfcmVz
b3VyY2VfZmxhZ3MocGRldiwgMikgJiBJT1JFU09VUkNFX0lPKSkgew0KPiAgIAkJZHJtX2lu
Zm8oZGV2LCAicGxhdGZvcm0gaGFzIG5vIElPIHNwYWNlLCB0cnlpbmcgTU1JT1xuIik7DQo+
ICAgCQlhc3QtPmlvcmVncyA9IGFzdC0+cmVncyArIEFTVF9JT19NTV9PRkZTRVQ7DQo+ICAg
CX0NCj4gDQo+IGJhc2UtY29tbWl0OiBlNjIyNTJiYzU1YjZkNGVkZGM2YzJiZGJmOTVhNDQ4
MTgwZDZhMDhkDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------qOOlcXX6fCv2HSU8Xmj2K6kP--

--------------E6y17sMEjqwF0O6XmO5yTkua
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRCRJAFAwAAAAAACgkQlh/E3EQov+CX
4RAAykVorU5qZSMANCpRjatEz4374wuRAOZtJGQtDOFnjchq/KpsNgwWy9aSYI9RnBXkgIyUSzua
1Qwjz8KBZdL89zj6VcoDtu380M7yfmqLTqWMiS2d/2ms0mhO2hXL16J2XpA1w3gvo4TOwXFNa0c/
odvogxTr8la2u7mR8/7X+9vQYFMCfqUdcOuB02zGi0H9ycUhLEsqSbYYpWgphDhjjR+iVT1g851W
SZ4TiLs8XKa6u44EO9hteQyNfw5h0h4cvKI7ZyE1n0K9ngCH1i7zSpX0dwSD+9/6KKy42eltD8h8
W1TLFjoLMeDhVbFmsDQmX2lwZrr2kPm9JtfXG3MAaqq6WnYjVGu74D377eSNXZLeYjfD/nVkMWVX
Uh1lSlBOd6x/l3wogERNqGppIxAqhWg14BQryX5d67dWMxa2kBuwFlVT1PJSbqPgW8psCht1Wz42
6T6sJjx6MDSTFHKI4Hz1au7vn1hzrsH7JaM3kOflMxtNM41QnVum/jD5OlzlRGH3V8aKeHYZI8wI
l3s73LBwkIwwckNOgvS3HEny+CuGf8VNHfCDdNZPRYUovxH5m3Z9OElUHVwqBWNJUiQsF0hVvmiX
0MySzaFz5F7+Xu+ujHiWOckRgrEBQ77pdTTNvUsYihOGBxnRyvhhhT75bS++zzWFLKYEh0eaUSGM
FuY=
=4LiN
-----END PGP SIGNATURE-----

--------------E6y17sMEjqwF0O6XmO5yTkua--
