Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9065549F789
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 11:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FB910E692;
	Fri, 28 Jan 2022 10:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE6410E6BF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 10:46:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B27C212BB;
 Fri, 28 Jan 2022 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643366810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OD8nEPA3sVQza8mJuydHMBADe6lH+Ya/yaTN+xwoc/Q=;
 b=UffG6f5PXP8ahy6qql7Xutw+HwAaTgwYLIsu9EwQERso0lIBQNivdhdwUil/RI0TiU3Csi
 zbWsHyM2Izn/APD+GeXRl9G+KvcnUrE7b1/UwNFK0zRo1HkJBKx9NbO5B5tbT9i8kVRQPX
 QQMW3BV2/H3ls8Z9JnxuzhQWfgJ769Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643366810;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OD8nEPA3sVQza8mJuydHMBADe6lH+Ya/yaTN+xwoc/Q=;
 b=+7rsNw52SiNmHEWxftmBvpenuP+XCygSNtOP2zgkvjwyRXnkArC8DXYx80dCarF/40dUxq
 JIyy3I72NUWLfBCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A3FA13D17;
 Fri, 28 Jan 2022 10:46:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aGWOAZrJ82GbJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jan 2022 10:46:50 +0000
Message-ID: <584f1343-b285-bf8e-e48c-764c2a56bce3@suse.de>
Date: Fri, 28 Jan 2022 11:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 31/37] drm: rcar-du: Add support for the nomodeset
 kernel parameter
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-32-javierm@redhat.com>
 <164336121612.533872.1685181669511488706@Monstersaurus>
 <eb27fa44-2972-4a6e-465f-b9e4775820f4@suse.de>
 <YfPGnfly3GOAOlfp@pendragon.ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YfPGnfly3GOAOlfp@pendragon.ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JYw8Xy64K8VFllBbYPzDs6zz"
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JYw8Xy64K8VFllBbYPzDs6zz
Content-Type: multipart/mixed; boundary="------------biTK0euxeLwrKMKHOb70092S";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <584f1343-b285-bf8e-e48c-764c2a56bce3@suse.de>
Subject: Re: [PATCH v2 31/37] drm: rcar-du: Add support for the nomodeset
 kernel parameter
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-32-javierm@redhat.com>
 <164336121612.533872.1685181669511488706@Monstersaurus>
 <eb27fa44-2972-4a6e-465f-b9e4775820f4@suse.de>
 <YfPGnfly3GOAOlfp@pendragon.ideasonboard.com>
In-Reply-To: <YfPGnfly3GOAOlfp@pendragon.ideasonboard.com>

--------------biTK0euxeLwrKMKHOb70092S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDEuMjIgdW0gMTE6MzQgc2NocmllYiBMYXVyZW50IFBpbmNoYXJ0Og0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBGcmksIEphbiAyOCwgMjAyMiBhdCAxMDozMzoyMUFN
ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEFtIDI4LjAxLjIyIHVtIDEw
OjEzIHNjaHJpZWIgS2llcmFuIEJpbmdoYW06DQo+Pj4gUXVvdGluZyBKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMgKDIwMjEtMTItMTcgMDA6Mzc6NDYpDQo+Pj4+IEFjY29yZGluZyB0byBk
aXNhYmxlIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0
LCB0aGlzDQo+Pj4+IHBhcmFtZXRlciBjYW4gYmUgdXNlZCB0byBkaXNhYmxlIGtlcm5lbCBt
b2Rlc2V0dGluZy4NCj4+Pj4NCj4+Pj4gRFJNIGRyaXZlcnMgd2lsbCBub3QgcGVyZm9ybSBk
aXNwbGF5LW1vZGUgY2hhbmdlcyBvciBhY2NlbGVyYXRlZCByZW5kZXJpbmcNCj4+Pj4gYW5k
IG9ubHkgdGhlIHN5c3RlbSBmcmFtZWJ1ZmZlciB3aWxsIGJlIGF2YWlsYWJsZSBpZiBpdCB3
YXMgc2V0LXVwLg0KPj4+DQo+Pj4gV2hhdCBpcyB0aGUgJ3N5c3RlbSBmcmFtZWJ1ZmZlcicg
aW4gdGhpcyBpbnN0YW5jZT8gUmVhZGluZw0KPj4+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
ZG9jL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0DQo+
Pj4gaXQgc291bmRzIGxpa2UgdGhhdCBtZWFucyBhbnl0aGluZyBhbHJlYWR5IHNldCB1cCBi
eSB0aGUgYm9vdGxvYWRlci4NCj4+DQo+PiBFeGFjdGx5IHRoaXMuDQo+Pg0KPj4+PiBCdXQg
b25seSBhIGZldyBEUk0gZHJpdmVycyBjdXJyZW50bHkgY2hlY2sgZm9yIG5vbW9kZXNldCwg
bWFrZSB0aGlzIGRyaXZlcg0KPj4+PiB0byBhbHNvIHN1cHBvcnQgdGhlIGNvbW1hbmQgbGlu
ZSBwYXJhbWV0ZXIuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5l
eiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4+PiAtLS0NCj4+Pj4NCj4+Pj4g
KG5vIGNoYW5nZXMgc2luY2UgdjEpDQo+Pj4+DQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfZHJ2LmMgfCAzICsrKw0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9kdV9kcnYuYw0KPj4+PiBpbmRleCA1YTgxMzFlZjgxZDUuLjk4MmU0NTAyMzNlZCAxMDA2
NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYw0K
Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jDQo+Pj4+
IEBAIC03MDEsNiArNzAxLDkgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgcmNh
cl9kdV9wbGF0Zm9ybV9kcml2ZXIgPSB7DQo+Pj4+ICAgIA0KPj4+PiAgICBzdGF0aWMgaW50
IF9faW5pdCByY2FyX2R1X2luaXQodm9pZCkNCj4+Pj4gICAgew0KPj4+PiArICAgICAgIGlm
IChkcm1fZmlybXdhcmVfZHJpdmVyc19vbmx5KCkpDQo+Pj4+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT0RFVjsNCj4+Pj4gKw0KPj4+DQo+Pj4gVGhpcyB3aWxsIGNvbXBsZXRlbHkg
ZGlzYWJsZSBhbGwgY29udHJvbCBvZiB0aGUgZGlzcGxheSBkZXZpY2Ugd2hlbg0KPj4+IG5v
bW9kZXNldCBpcyBlbmFibGVkLg0KPj4+DQo+Pj4gSXMgdGhlcmUgYW55IHJlcXVpcmVtZW50
IGZvciB1cyB0byBzdXBwb3J0IG91dHB1dHRpbmcgdG8gdGhlIGRpc3BsYXkgaWYNCj4+PiBp
dCB3YXMgcHJldmlvdXNseSBzZXQgdXA/IHByZXN1bWFibHkgd2l0aG91dCBzZXR0aW5nIG9y
IGNoYW5naW5nIGFueQ0KPj4+IG1vZGVzLCBidXQgc2ltcGx5IGFsbG93aW5nIHRoZSBleGlz
dGluZyBmcmFtZSB0byBiZSB1cGRhdGVkPw0KPj4NCj4+IFRoZXJlJ3Mgbm8gcmVxdWlyZW1l
bnQgZm9yIHlvdXIgZHJpdmVyLiBXZSBqdXN0IHdhbnQgYSBwYXJhbWV0ZXIgd2hlcmUNCj4+
IHdlIGNhbiBjb252ZW5pZW50bHkgZGlzYWJsZSBtb3N0IG9mIERSTSdzIGRyaXZlcnMgYW5k
IHJlZHVjZSBpdCB0byBhDQo+PiBtaW5pbXVtLiBIZWxwcyBkaXN0cmlidXRpb25zIHRvIHBy
b3ZpZGUgYSBzaW1wbGUgZmFsbGJhY2sgbW9kZS4gIE1vc3QNCj4+IFBDSS1iYXNlZCBkcml2
ZXJzIGFscmVhZHkgc3VwcG9ydCB0aGF0LiBOb3cgd2UncmUgYWRkZWQgaXQgdG8gdGhlIG90
aGVyDQo+PiBkcml2ZXJzIGFzIHdlbGwuDQo+Pg0KPj4+DQo+Pj4gSSB0aGluayB0aGUgaW1w
bGljYXRpb24gaXMgdGhhdCAnZmlybXdhcmUgZHJpdmVycycgd291bGQgbWVhbiBhIGRpc3Bs
YXkNCj4+PiBjb3VsZCBiZSB1cGRhdGVkIHRocm91Z2ggc29tZSBmaXJtd2FyZSBpbnRlcmZh
Y2UsIHdoaWNoIHdlIHdvbid0IGhhdmUNCj4+PiAuLi4gc28gaXQgc2VlbXMgcmVhc29uYWJs
ZSB0byBhY2NlcHQgdGhhdCB0aGlzIHdob2xlIGRyaXZlciBjYW4gYmUNCj4+PiBkaXNhYmxl
ZCBpbiB0aGF0IGluc3RhbmNlLg0KPj4NCj4+IEl0IGNhbm5vdCBiZSAnbW9kZS1zZXR0ZWQn
LiBXZSBnZXQgYSBwcmUtY29uZmlndXJlZCBmcmFtZWJ1ZmZlciBmcm9tIHRoZQ0KPj4gZmly
bXdhcmUgb3IgYm9vdGxvYWRlci4gV2hhdGV2ZXIgd2UgZHJhdyB0aGVyZSBzaG93cyB1cCBv
biB0aGUgc2NyZWVuLg0KPiANCj4gSSBkb3VidCB0aGF0J3MgZ29pbmcgdG8gd29yayBhcyB5
b3UgZXhwZWN0LCBjbG9ja3MgYW5kIHJlZ3VsYXRvcnMgd2lsbA0KPiBnZXQgZGlzYWJsZWQg
YXQgYm9vdCBpZiBub3QgdXNlZCBieSBhbnkgZHJpdmVyLg0KDQpTaW1wbGVkcm0gYW5kIHNp
bXBsZWZiIGF0dGFjaCB0byB0aGVzZSBmaXJtd2FyZSBmcmFtZWJ1ZmZlcnMuIEJvdGggDQpk
cml2ZXJzIGxvb2sgYXQgdGhlIGRldmljZSB0cmVlIG5vZGVzIHRvIGFjcXVpcmUgdGhlIHJl
bGV2YW50IGNsb2NrcyBhbmQgDQpyZWd1bGF0b3JzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPj4+IFJlYWRpbmcgeW91ciBtYWlsIHRoYXQgYnJvdWdodCB0aGlzIHRocmVh
ZCB1cCBpbiBteSBpbmJveCwgSSB0aGluaw0KPj4+IHlvdSd2ZSBhbHJlYWR5IGhpdCBtZXJn
ZSBvbiB0aGlzLCBzbyBkb24ndCB3b3JyeSBhYm91dCBhZGRpbmcgYSB0YWcgaW4NCj4+PiB0
aGF0IGluc3RhbmNlLCBidXQgSSB0aGluayB0aGlzIGlzIG9rLg0KPj4+DQo+Pj4gUmV2aWV3
ZWQtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25i
b2FyZC5jb20+DQo+Pj4NCj4+Pj4gICAgICAgICAgIHJjYXJfZHVfb2ZfaW5pdChyY2FyX2R1
X29mX3RhYmxlKTsNCj4+Pj4gICAgDQo+Pj4+ICAgICAgICAgICByZXR1cm4gcGxhdGZvcm1f
ZHJpdmVyX3JlZ2lzdGVyKCZyY2FyX2R1X3BsYXRmb3JtX2RyaXZlcik7DQo+IA0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------biTK0euxeLwrKMKHOb70092S--

--------------JYw8Xy64K8VFllBbYPzDs6zz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHzyZkFAwAAAAAACgkQlh/E3EQov+Am
zg/6A8KJhkMNQBM1+DacCQhe64x6r3n+FeYAFi5C8pS0I6rCH+Rgb6RZjJ0Zc7Rh7sc29i6D6sJy
fpVaEJnhnvdrpAb+h6VSyBKXsrwMzTlKfe5X2q1nFBbOZxb65lLfTS1aN1vnYwGI06tBId+aNi0i
uy+AF/dNjrjFvq/bGZbkxODIxTGc486Z16g1X24QgT1rvnFDUzuTBR427JQUkibobInS+7k8abFA
h0vvWKow02etvb0apT3XHhkBkr85I3pq7ge8CoqMB7PUJJcVwdEw9Rh2O3wltcctaAXesqu5dTbG
lkX7DzZsO2egLbP7DhN1X2f+K4I/jZKoEtcDr/aog0OSJca7y0cMPRbISVeKdicI7Oaj2GZXOoHI
XLS27ESzO7weJWjW+mJTiRQsOlXgZA6JTp1LkFv8dgSSC0GnVUyQa/fbvvLSTkfutiRMAa1+0kTW
sQMfX8olL05T8iE66U/E7lBA5k/3KClNr3atOmB80OSA4CBA+yRdk8Gq5xj+tvUtVVNb5qbp21Hq
M0EVsLR4Sw8+Sqw7QV/+kbnh9RKAdWKNr0Uj/4KNrogxWHlhrHBCsjmnaLq/9zfaJufkDJNZep/A
cU4tf/O14SC3hfknv1PyVM60eJTUICfdaQIv7PKq7TtMREXZzH0Bs966ygRrMMgZKRhdj1H9+1Rq
NLE=
=jLcU
-----END PGP SIGNATURE-----

--------------JYw8Xy64K8VFllBbYPzDs6zz--
