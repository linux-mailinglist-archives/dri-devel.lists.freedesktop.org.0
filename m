Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A2465FC74
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 09:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1909010E4F3;
	Fri,  6 Jan 2023 08:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0231B10E4D5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 08:10:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FD5223CD6;
 Fri,  6 Jan 2023 08:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672992618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3pO1aHADbGGGnyxUGVTWRrASD7GTtNbPPtWRk/bkQR0=;
 b=CTuJHvozB1sAupSJIET/6T5UdGVK4UTnnRrB9gis8i4uNaY5R5vxqPOMdJqRgNJCBpD+i3
 k9TUuuoSZPORiuwOyoHvRK54QKkIYsLn9bafjPBoMzvpj5en468E6/XJzwnpm/34YvJ+Qp
 wxCi8CGEt5DP8CfKgaiMaaJVhYTHe/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672992618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3pO1aHADbGGGnyxUGVTWRrASD7GTtNbPPtWRk/bkQR0=;
 b=ntDrEiXCwp06ouWaASwrgl3JsL1FOm/00CImxEaccD3z16BOISk6+wqyNJ6WppiMLZS97D
 CLgfE3byBwrInwBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26061139D5;
 Fri,  6 Jan 2023 08:10:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Q1VNCGrXt2P2RAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Jan 2023 08:10:18 +0000
Message-ID: <e1ba3ad8-a6fe-4279-1d98-e060fc845fea@suse.de>
Date: Fri, 6 Jan 2023 09:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/vkms: introduce prepare_fb and cleanup_fb functions
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>
References: <20230105162148.234218-1-mcanal@igalia.com>
 <20230105184313.uziimfnsk3cu3gzd@mail.igalia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230105184313.uziimfnsk3cu3gzd@mail.igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8kCkEurSQ1dgrPUgRyERu5sJ"
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8kCkEurSQ1dgrPUgRyERu5sJ
Content-Type: multipart/mixed; boundary="------------db0SCGEefrmMab0pRm9SizOC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>
Message-ID: <e1ba3ad8-a6fe-4279-1d98-e060fc845fea@suse.de>
Subject: Re: [PATCH] drm/vkms: introduce prepare_fb and cleanup_fb functions
References: <20230105162148.234218-1-mcanal@igalia.com>
 <20230105184313.uziimfnsk3cu3gzd@mail.igalia.com>
In-Reply-To: <20230105184313.uziimfnsk3cu3gzd@mail.igalia.com>

--------------db0SCGEefrmMab0pRm9SizOC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDEuMjMgdW0gMTk6NDMgc2NocmllYiBNZWxpc3NhIFdlbjoNCj4gT24g
MDEvMDUsIE1hw61yYSBDYW5hbCB3cm90ZToNCj4+IFdpdGggY29tbWl0IDM1OWM2NjQ5Y2Q5
YSAoImRybS9nZW06IEltcGxlbWVudCBzaGFkb3ctcGxhbmUge2JlZ2luLA0KPj4gZW5kfV9m
Yl9hY2Nlc3Mgd2l0aCB2bWFwIiksIHRoZSBiZWhhdmlvciBvZiB0aGUgc2hhZG93LXBsYW5l
IGhlbHBlcnMNCj4+IGNoYW5nZWQgYW5kIHRoZSB2dW5tYXAgaXMgbm93IHBlcmZvcm1lZCBh
dCB0aGUgZW5kIG9mDQo+PiB0aGUgY3VycmVudCBwYWdlZmxpcCwgaW5zdGVhZCBvZiB0aGUg
ZW5kIG9mIHRoZSBmb2xsb3dpbmcgcGFnZWZsaXAuDQo+Pg0KPj4gQnkgcGVyZm9ybWluZyB0
aGUgdnVubWFwIGF0IHRoZSBlbmQgb2YgdGhlIGN1cnJlbnQgcGFnZWZsaXAsIGludmFsaWQN
Cj4+IG1lbW9yeSBpcyBhY2Nlc3NlZCBieSB0aGUgdmttcyBkdXJpbmcgdGhlIHBsYW5lIGNv
bXBvc2l0aW9uLCBhcyB0aGUgZGF0YQ0KPj4gaXMgYmVpbmcgdW5tYXBwZWQgYmVmb3JlIGJl
aW5nIHVzZWQuDQo+IA0KPiBIaSBNYcOtcmEsDQo+IA0KPiBUaGFua3MgZm9yIGludmVzdGln
YXRpbmcgdGhpcyBpc3N1ZS4gQ2FuIHlvdSBhZGQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlDQo+
IHRoZSBrZXJuZWwgT29wcyBjYXVzZWQgYnkgdGhpcyBjaGFuZ2U/DQo+IA0KPiBCZXNpZGVz
IHRoYXQsIEkgd29uZGVyIGlmIHRoZSByaWdodCB0aGluZyB3b3VsZCBiZSB0byByZXN0b3Jl
IHRoZQ0KPiBwcmV2aW91cyBiZWhhdmlvciBvZiB2dW5tYXAgaW4gc2hhZG93LXBsYW5lIGhl
bHBlcnMsIGluc3RlYWQgb2YNCj4gcmVpbnRyb2R1Y2UgZHJpdmVyLXNwZWNpZmljIGhvb2tz
IGZvciB2bWFwL3Z1bm1hcCBjb3JyZWN0bHkgdG8gdmttcy4NCj4gDQo+IE1heWJlIFRob21h
cyBoYXMgc29tZSBpbnB1dHMgb24gdGhpcyBzaGFkb3ctcGxhbmUgY2hhbmdpbmcgdG8gaGVs
cCB1cyBvbg0KPiBmaWd1cmluZyBvdXQgdGhlIHByb3BlciBmaXggKD8pDQoNClRoZSBmaXgg
bG9va3MgZ29vZC4gSSBsZWZ0IHNvbWUgbWlub3ItaW1wb3J0YW50IGNvbW1lbnRzIGJlbG93
Lg0KDQpJIHdvdWxkIHN1Z2dlc3QgdG8gcmV0aGluayB0aGUgb3ZlcmFsbCBkcml2ZXIgZGVz
aWduLiBJbnN0ZWFkIG9mIGtlZXBpbmcgDQp0aGVzZSBidWZmZXIgcGlubmVkIGZvciBsb25n
LiBJdCBtaWdodCBiZSBiZXR0ZXIgdG8gaGF2ZSBhIHBlci1wbGFuZSANCmludGVybWVkaWF0
ZSBidWZmZXIgdGhhdCB5b3UgdXBkYXRlIG9uIGVhY2ggY2FsbCB0byBhdG9taWNfdXBkYXRl
LiANClRoYXQncyBob3cgcmVhbCBkcml2ZXJzIGludGVyYWN0IHdpdGggdGhlaXIgaGFyZHdh
cmUuDQoNCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gDQo+IE1lbGlzc2ENCj4gDQo+Pg0KPj4g
VGhlcmVmb3JlLCBpbnRyb2R1Y2UgYWdhaW4gcHJlcGFyZV9mYiBhbmQgY2xlYW51cF9mYiBm
dW5jdGlvbnMgdG8gdGhlDQo+PiB2a21zLCB3aGljaCB3ZXJlIHByZXZpb3VzbHkgcmVtb3Zl
ZCBvbiBjb21taXQgYjQzZTJlYzAzYjBkICgiZHJtL3ZrbXM6DQo+PiBMZXQgc2hhZG93LXBs
YW5lIGhlbHBlcnMgcHJlcGFyZSB0aGUgcGxhbmUncyBGQiIpLg0KPj4NCj4+IEZpeGVzOiAz
NTljNjY0OWNkOWEgKCJkcm0vZ2VtOiBJbXBsZW1lbnQgc2hhZG93LXBsYW5lIHtiZWdpbiwg
ZW5kfV9mYl9hY2Nlc3Mgd2l0aCB2bWFwIikNCj4+IFNpZ25lZC1vZmYtYnk6IE1hw61yYSBD
YW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS92a21zL3ZrbXNfcGxhbmUuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19wbGFu
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19wbGFuZS5jDQo+PiBpbmRleCBjM2E4
NDUyMjBlMTAuLmIzZjhhMTE1Y2MyMyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS92a21zL3ZrbXNfcGxhbmUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmtt
c19wbGFuZS5jDQo+PiBAQCAtMTYwLDEwICsxNjAsNDQgQEAgc3RhdGljIGludCB2a21zX3Bs
YW5lX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4+IAlyZXR1cm4g
MDsNCj4+ICAgfQ0KPj4NCj4+ICtzdGF0aWMgaW50IHZrbXNfcHJlcGFyZV9mYihzdHJ1Y3Qg
ZHJtX3BsYW5lICpwbGFuZSwNCj4+ICsJCQkgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpz
dGF0ZSkNCj4+ICt7DQo+PiArCXN0cnVjdCBkcm1fc2hhZG93X3BsYW5lX3N0YXRlICpzaGFk
b3dfcGxhbmVfc3RhdGU7DQo+PiArCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gc3Rh
dGUtPmZiOw0KPj4gKwlpbnQgcmV0Ow0KPj4gKw0KPj4gKwlpZiAoIWZiKQ0KPj4gKwkJcmV0
dXJuIDA7DQoNCklJUkMgdGhpcyBjYW5ub3QgYmUgTlVMTC4gT25seSBhY3RpdmUgcGxhbmVz
IHdpbGwgYmUgJ3ByZXBhcmVkJy4NCg0KPj4gKw0KPj4gKwlzaGFkb3dfcGxhbmVfc3RhdGUg
PSB0b19kcm1fc2hhZG93X3BsYW5lX3N0YXRlKHN0YXRlKTsNCj4+ICsNCj4+ICsJcmV0ID0g
ZHJtX2dlbV9wbGFuZV9oZWxwZXJfcHJlcGFyZV9mYihwbGFuZSwgc3RhdGUpOw0KPj4gKwlp
ZiAocmV0KQ0KPj4gKwkJcmV0dXJuIHJldDsNCj4+ICsNCj4+ICsJcmV0dXJuIGRybV9nZW1f
ZmJfdm1hcChmYiwgc2hhZG93X3BsYW5lX3N0YXRlLT5tYXAsIHNoYWRvd19wbGFuZV9zdGF0
ZS0+ZGF0YSk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHZrbXNfY2xlYW51cF9m
YihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4+ICsJCQkgICAgc3RydWN0IGRybV9wbGFu
ZV9zdGF0ZSAqc3RhdGUpDQo+PiArew0KPj4gKwlzdHJ1Y3QgZHJtX3NoYWRvd19wbGFuZV9z
dGF0ZSAqc2hhZG93X3BsYW5lX3N0YXRlOw0KPj4gKwlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiA9IHN0YXRlLT5mYjsNCj4+ICsNCj4+ICsJaWYgKCFmYikNCj4+ICsJCXJldHVybjsN
Cg0KU2FtZSBoZXJlLiBUaGlzIGZ1bmN0aW9uIHdvbid0IGJlIGNhbGxlZCBpZiB0aGVyZSBo
YXMgbm90IGJlZW4gYSANCmZyYW1lYnVmZmVyLg0KDQo+PiArDQo+PiArCXNoYWRvd19wbGFu
ZV9zdGF0ZSA9IHRvX2RybV9zaGFkb3dfcGxhbmVfc3RhdGUoc3RhdGUpOw0KPj4gKw0KPj4g
Kwlkcm1fZ2VtX2ZiX3Z1bm1hcChmYiwgc2hhZG93X3BsYW5lX3N0YXRlLT5tYXApOw0KPj4g
K30NCj4+ICsNCj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfaGVscGVyX2Z1
bmNzIHZrbXNfcHJpbWFyeV9oZWxwZXJfZnVuY3MgPSB7DQo+PiAJLmF0b21pY191cGRhdGUJ
CT0gdmttc19wbGFuZV9hdG9taWNfdXBkYXRlLA0KPj4gCS5hdG9taWNfY2hlY2sJCT0gdmtt
c19wbGFuZV9hdG9taWNfY2hlY2ssDQo+PiAtCURSTV9HRU1fU0hBRE9XX1BMQU5FX0hFTFBF
Ul9GVU5DUywNCg0KWW91J3JlIHN0aWxsIGluc3RhbGxpbmcge2JlaW5nL2VuZH1fZmJfYWNj
ZXNzLCB3aGljaCBzaG91bGQgbm90IGJlIA0KbmVjZXNzYXJ5IG5vdy4gT3Blbi1jb2Rpbmcg
RFJNX0dFTV9TSEFET1dfUExBTkVfSEVMUEVSX0ZVTkNTIHdpdGhvdXQgDQp0aG9zZSBoZWxw
ZXJzIHdvdWxkIGZpeCB0aGF0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+PiArCS5w
cmVwYXJlX2ZiCQk9IHZrbXNfcHJlcGFyZV9mYiwNCj4+ICsJLmNsZWFudXBfZmIJCT0gdmtt
c19jbGVhbnVwX2ZiLA0KPj4gICB9Ow0KPj4NCj4+ICAgc3RydWN0IHZrbXNfcGxhbmUgKnZr
bXNfcGxhbmVfaW5pdChzdHJ1Y3Qgdmttc19kZXZpY2UgKnZrbXNkZXYsDQo+PiAtLQ0KPj4g
Mi4zOS4wDQo+Pg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------db0SCGEefrmMab0pRm9SizOC--

--------------8kCkEurSQ1dgrPUgRyERu5sJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO312kFAwAAAAAACgkQlh/E3EQov+Ab
VRAAkn6mosZG3Wa4dqLrL50aN5Qj0eMHIlYeMWAj0LLQprBlq8BjKOQ28cxxyXDOzPA6Ddq3emRf
9NbAdT9rKEui/CubdxLYZx7Lev1VU62hvwxVFwJhHGzFM3Vx6ntjzKzICiXZ+o+pFK0ZyEVvqXyU
jSzR9E+GYAFvPi46DfbWmG5XgoabAlJ8PYzlRA3JP2AfyyQKxmnSIQbr+GhEbI9unr+mWom9VPc8
+ag8Oz674RzQJd2cv+/46ged5/UP5f3cHg0yuF567pYkl4QqaSU9/eWUIM8hE1a0qG35BK1Zv4x/
oeR9mzbWUCXmHU6SddH8fhMioSrbTzPJbFY6/R7YXdc4coOY4lXIAg9snb1TdFQUjI5dyQTKwH4q
se/uyYzvKHsoGXK8IuZLpHHwi9B8TgmSgeeEzg+m2b5GEt26GrdzEwYzcSpEVpN5z+KU3uIIVa1B
QNXRhR+ZohW3jvs74aALG+lMmT1l4Rt6ky1WaEdep85G4WtmITWp/ZnXo1g9uYHZ6ai1Z1u0+7Zv
pKBrwNRbX1lDtm3Q4zyKLfLgWuYDqKcVT8HbHYkJ8rRJFc8OXy/hQ9fYxB72bPPIb6lMCE+QZx0D
rmtB5pqisEiPXLTSl1M0sJnysujooUIJHvAaJFnC5n3PWsPJO5/zaz9LDuW4mWqRDnliLH+v6xP1
jWI=
=8r5C
-----END PGP SIGNATURE-----

--------------8kCkEurSQ1dgrPUgRyERu5sJ--
