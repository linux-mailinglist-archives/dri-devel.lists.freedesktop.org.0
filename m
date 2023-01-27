Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6867E7E0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 15:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F5010E992;
	Fri, 27 Jan 2023 14:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8933910E98F;
 Fri, 27 Jan 2023 14:13:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48BE32205E;
 Fri, 27 Jan 2023 14:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674828831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xnty0YewjjZGntfA5Jezh1stOqjzMINOZh3MNW1NGRE=;
 b=XILFmXDhp2Rkm3Gt877yc+9GZnJqZCsgfbsIdjM1dV/FG2uTDvUxt8XOjlNNCRjr4Six1J
 SsvVjSV3PtGynLAuTblPJndStDJir8dFn/tOZtXUMn+Agp1eaMeT5UgXg+lM5h0lqmajpA
 pqe6dqMaDqdDs/bUiTO/GpLk9M7GYBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674828831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xnty0YewjjZGntfA5Jezh1stOqjzMINOZh3MNW1NGRE=;
 b=jutVM9bPYO31A6tbeYAXpAfj4PSLyPGa8PWW6ZJzmfKvcHn/lBJlgvTOG5wJP1dXtL0OBx
 YEKvcx1sYQCvGKCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16CB9138E3;
 Fri, 27 Jan 2023 14:13:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id txeIBB/c02NCPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Jan 2023 14:13:51 +0000
Message-ID: <bf1aa950-3b58-3e33-4849-2ee7fbefcfcc@suse.de>
Date: Fri, 27 Jan 2023 15:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/10] drm/client: Test for connectors before sending
 hotplug event
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-2-tzimmermann@suse.de> <Y9GWfi4EiCDPa6BJ@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y9GWfi4EiCDPa6BJ@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5rxgPFJ3j2KL4oJ65FD8FXSd"
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5rxgPFJ3j2KL4oJ65FD8FXSd
Content-Type: multipart/mixed; boundary="------------heOeejt6LNNDwxF4fkjBknOr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <bf1aa950-3b58-3e33-4849-2ee7fbefcfcc@suse.de>
Subject: Re: [PATCH v3 01/10] drm/client: Test for connectors before sending
 hotplug event
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-2-tzimmermann@suse.de> <Y9GWfi4EiCDPa6BJ@ravnborg.org>
In-Reply-To: <Y9GWfi4EiCDPa6BJ@ravnborg.org>

--------------heOeejt6LNNDwxF4fkjBknOr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDEuMjMgdW0gMjE6NTIgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIFdlZCwgSmFuIDI1LCAyMDIzIGF0IDA5OjA0OjA2UE0gKzAx
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gVGVzdCBmb3IgY29ubmVjdG9ycyBp
biB0aGUgY2xpZW50IGNvZGUgYW5kIHJlbW92ZSBhIHNpbWlsYXIgdGVzdA0KPj4gZnJvbSB0
aGUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24uIERvIG5vdGhpbmcgaWYgdGhlIHRlc3QgZmFp
bHMuDQo+PiBOb3QgaGF2aW5nIGNvbm5lY3RvcnMgaW5kaWNhdGVzIGEgZHJpdmVyIGJ1Zy4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGph
dmllcm1AcmVkaGF0LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Ns
aWVudC5jICAgICAgICB8IDUgKysrKysNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYmRl
dl9nZW5lcmljLmMgfCA1IC0tLS0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2NsaWVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYw0KPj4g
aW5kZXggMjYyZWM2NGQ0Mzk3Li4wOWFjMTkxYzIwMmQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2NsaWVudC5jDQo+PiBAQCAtMTk4LDYgKzE5OCwxMSBAQCB2b2lkIGRybV9jbGllbnRfZGV2
X2hvdHBsdWcoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+ICAgCWlmICghZHJtX2NvcmVf
Y2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9NT0RFU0VUKSkNCj4+ICAgCQlyZXR1cm47DQo+
PiAgIA0KPj4gKwlpZiAoIWRldi0+bW9kZV9jb25maWcubnVtX2Nvbm5lY3Rvcikgew0KPj4g
KwkJZHJtX2RiZ19rbXMoZGV2LCAiTm8gY29ubmVjdG9ycyBmb3VuZCwgd2lsbCBub3Qgc2Vu
ZCBob3RwbHVnIGV2ZW50cyFcbiIpOw0KPj4gKwkJcmV0dXJuOw0KPiBUaGlzIGRlc2VydmVz
IGEgbW9yZSB2aXNpYmxlIGxvZ2dpbmcgLSBpZiBhIGRyaXZlciBmYWlscyBoZXJlIGl0IHdv
dWxkDQo+IGJlIGdvb2QgdG8gc3BvdCBpdCBpbiB0aGUgbm9ybWFsIGtlcm5lbCBsb2cuDQo+
IGRybV9pbmZvIG9yIGRybV9ub3RpY2U/DQoNCkJ1dCBpcyB0aGF0IHJlYWxseSBub3Rld29y
dGh5PyBBRkFJSywgdGhpcyBzaXR1YXRpb24gY2FuIGxlZ2FsbHkgaGFwcGVuLiANClNvIGlm
IGl0J3MgZXhwZWN0ZWQsIHdoeSBzaG91bGQgd2UgcHJpbnQgYSBtZXNzYWdlIGFib3V0IGl0
Pw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBUaGUgb3JpZ2luYWwgY29kZSBo
YWQgdGhpcyBvbiB0aGUgZGVidWcgbGV2ZWwsIGJ1dCB3aGVuIG1vdmluZyB0aGUgbG9nDQo+
IGxldmVsIGNvdWxkIGFsc28gYmUgdXBkYXRlZC4NCj4gDQo+IAlTYW0NCj4gDQo+PiArCX0N
Cj4+ICsNCj4+ICAgCW11dGV4X2xvY2soJmRldi0+Y2xpZW50bGlzdF9tdXRleCk7DQo+PiAg
IAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGNsaWVudCwgJmRldi0+Y2xpZW50bGlzdCwgbGlzdCkg
ew0KPj4gICAJCWlmICghY2xpZW50LT5mdW5jcyB8fCAhY2xpZW50LT5mdW5jcy0+aG90cGx1
ZykNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+PiBpbmRleCAwYTRj
MTYwZTBlNTguLjNkNDU1YTJlM2ZiNSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
ZGV2X2dlbmVyaWMuYw0KPj4gQEAgLTM4OSwxMSArMzg5LDYgQEAgc3RhdGljIGludCBkcm1f
ZmJkZXZfY2xpZW50X2hvdHBsdWcoc3RydWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQpDQo+
PiAgIAlpZiAoZGV2LT5mYl9oZWxwZXIpDQo+PiAgIAkJcmV0dXJuIGRybV9mYl9oZWxwZXJf
aG90cGx1Z19ldmVudChkZXYtPmZiX2hlbHBlcik7DQo+PiAgIA0KPj4gLQlpZiAoIWRldi0+
bW9kZV9jb25maWcubnVtX2Nvbm5lY3Rvcikgew0KPj4gLQkJZHJtX2RiZ19rbXMoZGV2LCAi
Tm8gY29ubmVjdG9ycyBmb3VuZCwgd2lsbCBub3QgY3JlYXRlIGZyYW1lYnVmZmVyIVxuIik7
DQo+PiAtCQlyZXR1cm4gMDsNCj4+IC0JfQ0KPj4gLQ0KPj4gICAJZHJtX2ZiX2hlbHBlcl9w
cmVwYXJlKGRldiwgZmJfaGVscGVyLCAmZHJtX2ZiX2hlbHBlcl9nZW5lcmljX2Z1bmNzKTsN
Cj4+ICAgDQo+PiAgIAlyZXQgPSBkcm1fZmJfaGVscGVyX2luaXQoZGV2LCBmYl9oZWxwZXIp
Ow0KPj4gLS0gDQo+PiAyLjM5LjANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------heOeejt6LNNDwxF4fkjBknOr--

--------------5rxgPFJ3j2KL4oJ65FD8FXSd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPT3B4FAwAAAAAACgkQlh/E3EQov+Dc
WxAAon9oAW+n4SDkB6P3CQ+G/JHDXSh26ifvSOw9Psr06ZvDnaHGytExuF+cXV6Re7SQiz4rCCc4
0c4AKQqvMnCKdO2p8CPHkBjE2MdrNhsqQGCrhDWP3DRSnzjB3MmBPZMhaz3INiURYod42cTLnxG1
EeyarMIBH8k0nTor7oczo2a7HVvUuA3K3I0n7gCOn4seaocvvG7MM0RmhFmhF4lAfjnUQ2sOOLFy
LUVq20J4bVRB2ftF7C/xXoiTnoH+Vaht3o1D06Px0FGU0+e0sEMkkjPudg0mdZ3Kpf9xLQiQwGNo
dkF/BZSQS7SiXso4zu3T0BOMFK5uYizhc9fQfn3AAhPuDWhB+wqz9dQuDhwQB08NShXGhIQrJ/MW
q5I26mgWBcpOe5DNgI2l+Wefw/MrYrRvvzEbkuOXG6efMvnpmTL5BMYOPH3sKT8gl855v+ezShTq
hiYijcXkkaPNrFesBVG81zHnUOgi/HM0JDGDfhcFUde8YYpRcE0LptKMtOfRwkdZTxPPCXGp+aRJ
3bglCykbu7UpwF/gu8ywHCYDPRU06emQYWJCRr6BpzWDxxTLdsVn9Gd6Z3q5PYgrRbZkDlRxmgO+
qLxO7GNYcXpt34MiyUWdOaSc0M04I1SBTgVp0qExDLnwEcrf2EAQyGGuU5N2GDuPsnYKMQX2nYa+
v7c=
=Q75b
-----END PGP SIGNATURE-----

--------------5rxgPFJ3j2KL4oJ65FD8FXSd--
