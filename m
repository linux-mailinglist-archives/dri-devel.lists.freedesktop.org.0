Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D4162F6E5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0913D10E74E;
	Fri, 18 Nov 2022 14:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F8C10E74D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 14:11:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9C312293B;
 Fri, 18 Nov 2022 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668780683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mYrwsorFjhZWgjMeMAOC/5kWOEJDBlixkwnbC57ed+U=;
 b=FjDoBvZUKr3bcGRvYLjxDYJ23FahF/oB5liTyV9OVSFRmJOIC+N73GJyZogPmtNCL1Od5h
 q6kJ3wIM54S7aZ62EJywNfDKFZPsoqptPTpv+5W1SxorONZocML3dZbnDbOObNKJstQ1IJ
 1+Qizz00VACDWIxRvTTnkh280kCz4aQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668780683;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mYrwsorFjhZWgjMeMAOC/5kWOEJDBlixkwnbC57ed+U=;
 b=/w+sIVUKSVFSYRv/ExDRVpd9y8woCaawBZEk6pNubH3RghgVLVNk3xYsVaGzH/jpc3D/Cy
 NKH3Jy6KsXeOgpAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADA271345B;
 Fri, 18 Nov 2022 14:11:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pBtyKYuSd2MRQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 14:11:23 +0000
Message-ID: <9550a02f-6858-41e8-d45a-9e05cec19d78@suse.de>
Date: Fri, 18 Nov 2022 15:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 5/8] drm/simpledrm: Add support for system memory
 framebuffers
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-6-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221117184039.2291937-6-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VDt4iJy4ytPc040AVt0BUUZ5"
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VDt4iJy4ytPc040AVt0BUUZ5
Content-Type: multipart/mixed; boundary="------------LzIcAIolqeifnhP3apFjLE0y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9550a02f-6858-41e8-d45a-9e05cec19d78@suse.de>
Subject: Re: [PATCH v3 5/8] drm/simpledrm: Add support for system memory
 framebuffers
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-6-thierry.reding@gmail.com>
In-Reply-To: <20221117184039.2291937-6-thierry.reding@gmail.com>

--------------LzIcAIolqeifnhP3apFjLE0y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMTEuMjIgdW0gMTk6NDAgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IFNpbXBs
ZSBmcmFtZWJ1ZmZlcnMgY2FuIGJlIHNldCB1cCBpbiBzeXN0ZW0gbWVtb3J5LCB3aGljaCBj
YW5ub3QgYmUNCj4gcmVxdWVzdGVkIGFuZC9vciBJL08gcmVtYXBwZWQgdXNpbmcgdGhlIEkv
TyByZXNvdXJjZSBoZWxwZXJzLiBBZGQgYQ0KPiBzZXBhcmF0ZSBjb2RlIHBhdGggdGhhdCBv
YnRhaW5zIHN5c3RlbSBtZW1vcnkgZnJhbWVidWZmZXJzIGZyb20gdGhlDQo+IHJlc2VydmVk
IG1lbW9yeSByZWdpb24gcmVmZXJlbmNlZCBpbiB0aGUgbWVtb3J5LXJlZ2lvbiBwcm9wZXJ0
eS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIHNpbXBsaWZ5IG1lbW9yeSBj
b2RlIGFuZCBtb3ZlIGJhY2sgdG8gc2ltcGxlZHJtX2RldmljZV9jcmVhdGUoKQ0KPiAtIGV4
dHJhY3Qgc2NyZWVuX2Jhc2UgaW9zeXNfbWFwIGZpeCBpbnRvIHNlcGFyYXRlIHBhdGNoDQo+
IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIG1ha2Ugc2NyZWVuIGJhc2UgYSBzdHJ1Y3QgaW9z
eXNfbWFwIHRvIGF2b2lkIHNwYXJzZSB3YXJuaW5ncw0KPiANCj4gICBkcml2ZXJzL2dwdS9k
cm0vdGlueS9zaW1wbGVkcm0uYyB8IDk5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gaW5kZXggMzY3M2E0
MmU0YmY0Li43ZjM5YmM1OGRhNTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
aW55L3NpbXBsZWRybS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jDQo+IEBAIC0zLDYgKzMsNyBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4g
ICAjaW5jbHVkZSA8bGludXgvb2ZfY2xrLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L21pbm1h
eC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gICAjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGF0YS9zaW1wbGVmYi5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9w
bGF0Zm9ybV9kZXZpY2UuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1
bWVyLmg+DQo+IEBAIC0xODQsNiArMTg1LDMxIEBAIHNpbXBsZWZiX2dldF9mb3JtYXRfb2Yo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpvZl9ub2RlKQ0K
PiAgIAlyZXR1cm4gc2ltcGxlZmJfZ2V0X3ZhbGlkYXRlZF9mb3JtYXQoZGV2LCBmb3JtYXQp
Ow0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBzdHJ1Y3QgcmVzb3VyY2UgKg0KPiArc2ltcGxl
ZmJfZ2V0X21lbW9yeV9vZihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm9mX25vZGUpDQo+ICt7DQo+ICsJc3RydWN0IGRldmljZV9ub2RlICpucDsNCj4g
KwlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gKwlpbnQgZXJyOw0KPiArDQo+ICsJbnAgPSBv
Zl9wYXJzZV9waGFuZGxlKG9mX25vZGUsICJtZW1vcnktcmVnaW9uIiwgMCk7DQo+ICsJaWYg
KCFucCkNCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICsNCj4gKwlyZXMgPSBkZXZtX2t6YWxsb2Mo
ZGV2LT5kZXYsIHNpemVvZigqcmVzKSwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFyZXMpDQo+
ICsJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiArDQo+ICsJZXJyID0gb2ZfYWRkcmVz
c190b19yZXNvdXJjZShucCwgMCwgcmVzKTsNCj4gKwlpZiAoZXJyKQ0KPiArCQlyZXR1cm4g
RVJSX1BUUihlcnIpOw0KPiArDQo+ICsJaWYgKG9mX2dldF9wcm9wZXJ0eShvZl9ub2RlLCAi
cmVnIiwgTlVMTCkpDQo+ICsJCWRybV93YXJuKGRldiwgInByZWZlcnJpbmcgXCJtZW1vcnkt
cmVnaW9uXCIgb3ZlciBcInJlZ1wiIHByb3BlcnR5XG4iKTsNCj4gKw0KPiArCXJldHVybiBy
ZXM7DQo+ICt9DQo+ICsNCj4gICAvKg0KPiAgICAqIFNpbXBsZSBGcmFtZWJ1ZmZlciBkZXZp
Y2UNCj4gICAgKi8NCj4gQEAgLTYyMyw4ICs2NDksNyBAQCBzdGF0aWMgc3RydWN0IHNpbXBs
ZWRybV9kZXZpY2UgKnNpbXBsZWRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1fZHJpdmVy
ICpkcnYsDQo+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXY7DQo+ICAgCWludCB3aWR0aCwg
aGVpZ2h0LCBzdHJpZGU7DQo+ICAgCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmZv
cm1hdDsNCj4gLQlzdHJ1Y3QgcmVzb3VyY2UgKnJlcywgKm1lbTsNCj4gLQl2b2lkIF9faW9t
ZW0gKnNjcmVlbl9iYXNlOw0KPiArCXN0cnVjdCByZXNvdXJjZSAqcmVzLCAqbWVtID0gTlVM
TDsNCj4gICAJc3RydWN0IGRybV9wbGFuZSAqcHJpbWFyeV9wbGFuZTsNCj4gICAJc3RydWN0
IGRybV9jcnRjICpjcnRjOw0KPiAgIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7DQo+
IEBAIC02NzYsNiArNzAxLDkgQEAgc3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpz
aW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LA0KPiAgIAkJ
Zm9ybWF0ID0gc2ltcGxlZmJfZ2V0X2Zvcm1hdF9vZihkZXYsIG9mX25vZGUpOw0KPiAgIAkJ
aWYgKElTX0VSUihmb3JtYXQpKQ0KPiAgIAkJCXJldHVybiBFUlJfQ0FTVChmb3JtYXQpOw0K
PiArCQltZW0gPSBzaW1wbGVmYl9nZXRfbWVtb3J5X29mKGRldiwgb2Zfbm9kZSk7DQo+ICsJ
CWlmIChJU19FUlIobWVtKSkNCj4gKwkJCXJldHVybiBFUlJfQ0FTVChtZW0pOw0KPiAgIAl9
IGVsc2Ugew0KPiAgIAkJZHJtX2VycihkZXYsICJubyBzaW1wbGVmYiBjb25maWd1cmF0aW9u
IGZvdW5kXG4iKTsNCj4gICAJCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOw0KPiBAQCAtNjk4
LDMyICs3MjYsNTUgQEAgc3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzaW1wbGVk
cm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LA0KPiAgIAkgKiBNZW1v
cnkgbWFuYWdlbWVudA0KPiAgIAkgKi8NCj4gICANCj4gLQlyZXMgPSBwbGF0Zm9ybV9nZXRf
cmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0KPiAtCWlmICghcmVzKQ0KPiAt
CQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gKwlpZiAobWVtKSB7DQo+ICsJCXZvaWQg
KnNjcmVlbl9iYXNlOw0KPiAgIA0KPiAtCXJldCA9IGRldm1fYXBlcnR1cmVfYWNxdWlyZV9m
cm9tX2Zpcm13YXJlKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMpKTsNCj4g
LQlpZiAocmV0KSB7DQo+IC0JCWRybV9lcnIoZGV2LCAiY291bGQgbm90IGFjcXVpcmUgbWVt
b3J5IHJhbmdlICVwcjogZXJyb3IgJWRcbiIsIHJlcywgcmV0KTsNCj4gLQkJcmV0dXJuIEVS
Ul9QVFIocmV0KTsNCj4gLQl9DQo+ICsJCXJldCA9IGRldm1fYXBlcnR1cmVfYWNxdWlyZV9m
cm9tX2Zpcm13YXJlKGRldiwgbWVtLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShtZW0pKTsNCj4g
KwkJaWYgKHJldCkgew0KPiArCQkJZHJtX2VycihkZXYsICJjb3VsZCBub3QgYWNxdWlyZSBt
ZW1vcnkgcmFuZ2UgJXByOiAlZFxuIiwgbWVtLCByZXQpOw0KPiArCQkJcmV0dXJuIEVSUl9Q
VFIocmV0KTsNCj4gKwkJfQ0KPiAgIA0KPiAtCW1lbSA9IGRldm1fcmVxdWVzdF9tZW1fcmVn
aW9uKCZwZGV2LT5kZXYsIHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSwgZHJ2LT5u
YW1lKTsNCj4gLQlpZiAoIW1lbSkgew0KPiAtCQkvKg0KPiAtCQkgKiBXZSBjYW5ub3QgbWFr
ZSB0aGlzIGZhdGFsLiBTb21ldGltZXMgdGhpcyBjb21lcyBmcm9tIG1hZ2ljDQo+IC0JCSAq
IHNwYWNlcyBvdXIgcmVzb3VyY2UgaGFuZGxlcnMgc2ltcGx5IGRvbid0IGtub3cgYWJvdXQu
IFVzZQ0KPiAtCQkgKiB0aGUgSS9PLW1lbW9yeSByZXNvdXJjZSBhcy1pcyBhbmQgdHJ5IHRv
IG1hcCB0aGF0IGluc3RlYWQuDQo+IC0JCSAqLw0KPiAtCQlkcm1fd2FybihkZXYsICJjb3Vs
ZCBub3QgYWNxdWlyZSBtZW1vcnkgcmVnaW9uICVwclxuIiwgcmVzKTsNCj4gLQkJbWVtID0g
cmVzOw0KPiAtCX0NCj4gKwkJZHJtX2luZm8oZGV2LCAidXNpbmcgc3lzdGVtIG1lbW9yeSBm
cmFtZWJ1ZmZlciBhdCAlcHJcbiIsIG1lbSk7DQoNCmRybV9kYmcoKSBwbGVhc2UuDQoNCj4g
ICANCj4gLQlzY3JlZW5fYmFzZSA9IGRldm1faW9yZW1hcF93YygmcGRldi0+ZGV2LCBtZW0t
PnN0YXJ0LCByZXNvdXJjZV9zaXplKG1lbSkpOw0KPiAtCWlmICghc2NyZWVuX2Jhc2UpDQo+
IC0JCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiArCQlzY3JlZW5fYmFzZSA9IGRldm1f
bWVtcmVtYXAoZGV2LT5kZXYsIG1lbS0+c3RhcnQsIHJlc291cmNlX3NpemUobWVtKSwgTUVN
UkVNQVBfV0IpOw0KPiArCQlpZiAoIXNjcmVlbl9iYXNlKQ0KPiArCQkJcmV0dXJuIEVSUl9Q
VFIoLUVOT01FTSk7DQo+ICsNCj4gKwkJaW9zeXNfbWFwX3NldF92YWRkcigmc2Rldi0+c2Ny
ZWVuX2Jhc2UsIHNjcmVlbl9iYXNlKTsNCj4gKwl9IGVsc2Ugew0KPiArCQl2b2lkIF9faW9t
ZW0gKnNjcmVlbl9iYXNlOw0KPiArDQo+ICsJCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJj
ZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+ICsJCWlmICghcmVzKQ0KPiArCQkJcmV0
dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ICAgDQo+IC0JaW9zeXNfbWFwX3NldF92YWRkcl9p
b21lbSgmc2Rldi0+c2NyZWVuX2Jhc2UsIHNjcmVlbl9iYXNlKTsNCj4gKwkJcmV0ID0gZGV2
bV9hcGVydHVyZV9hY3F1aXJlX2Zyb21fZmlybXdhcmUoZGV2LCByZXMtPnN0YXJ0LCByZXNv
dXJjZV9zaXplKHJlcykpOw0KPiArCQlpZiAocmV0KSB7DQo+ICsJCQlkcm1fZXJyKGRldiwg
ImNvdWxkIG5vdCBhY3F1aXJlIG1lbW9yeSByYW5nZSAlcHI6ICVkXG4iLCAmcmVzLCByZXQp
Ow0KPiArCQkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4gKwkJfQ0KPiArDQo+ICsJCWRybV9p
bmZvKGRldiwgInVzaW5nIEkvTyBtZW1vcnkgZnJhbWVidWZmZXIgYXQgJXByXG4iLCByZXMp
Ow0KDQpkcm1fZGJnKCkNCg0KV2l0aCB0aGUgc21hbGwgZml4ZXMsIHBsZWFzZSBhZGQNCg0K
UmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICsNCj4gKwkJbWVtID0gZGV2bV9yZXF1ZXN0
X21lbV9yZWdpb24oJnBkZXYtPmRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMp
LA0KPiArCQkJCQkgICAgICBkcnYtPm5hbWUpOw0KPiArCQlpZiAoIW1lbSkgew0KPiArCQkJ
LyoNCj4gKwkJCSAqIFdlIGNhbm5vdCBtYWtlIHRoaXMgZmF0YWwuIFNvbWV0aW1lcyB0aGlz
IGNvbWVzIGZyb20gbWFnaWMNCj4gKwkJCSAqIHNwYWNlcyBvdXIgcmVzb3VyY2UgaGFuZGxl
cnMgc2ltcGx5IGRvbid0IGtub3cgYWJvdXQuIFVzZQ0KPiArCQkJICogdGhlIEkvTy1tZW1v
cnkgcmVzb3VyY2UgYXMtaXMgYW5kIHRyeSB0byBtYXAgdGhhdCBpbnN0ZWFkLg0KPiArCQkJ
ICovDQo+ICsJCQlkcm1fd2FybihkZXYsICJjb3VsZCBub3QgYWNxdWlyZSBtZW1vcnkgcmVn
aW9uICVwclxuIiwgcmVzKTsNCj4gKwkJCW1lbSA9IHJlczsNCj4gKwkJfQ0KPiArDQo+ICsJ
CXNjcmVlbl9iYXNlID0gZGV2bV9pb3JlbWFwX3djKCZwZGV2LT5kZXYsIG1lbS0+c3RhcnQs
IHJlc291cmNlX3NpemUobWVtKSk7DQo+ICsJCWlmICghc2NyZWVuX2Jhc2UpDQo+ICsJCQly
ZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gKw0KPiArCQlpb3N5c19tYXBfc2V0X3ZhZGRy
X2lvbWVtKCZzZGV2LT5zY3JlZW5fYmFzZSwgc2NyZWVuX2Jhc2UpOw0KPiArCX0NCj4gICAN
Cj4gICAJLyoNCj4gICAJICogTW9kZXNldHRpbmcNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------LzIcAIolqeifnhP3apFjLE0y--

--------------VDt4iJy4ytPc040AVt0BUUZ5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN3kosFAwAAAAAACgkQlh/E3EQov+CG
1Q//as3fpeD5NMGNfAMKS6xjI2lcl9vDVJL3ALEs0bjhtJK/FVd3XBvnbEjh8UnE+DNaimVI4YR6
loCHnVtPhQdFIyWZfduQrJ6iZ3F7SkptBrb52rP1iKg1NOPqp+VJ2dZ02/Eevvtm8LWm9fWn1qrJ
4BeB2Q2gmkUw/OEFQavgYpciAA3klWJq3+P1O2za1RqD8OgYn5scZTi/WojWWirkBO+1gjHaTeZX
cN+ZoaqZBUhIo/PuvLD+u81bvqMIDjtvecZcGdVOkoehA1UFyobE3QycP835Kc0D9uVRaI09CGw3
hVw19AIsa3zVefr7cGoDAz5WWwDEAu1Wq2HZqRoxWn0ZAqFgOI0u5D/Jl0Y5Mzo30AP8BoBIFjOw
QJ+jRLVwlkmQkoxEZxGl68SjNskJ8WN936sT/brsU6X8VdiKMYOA8sPhsFjvK00kxDzt9yiC+uLN
hgsfLmO/mkZiMq5i3upKDqE6YpNHwJwgYboEIedl3gdi6y+ewxjdnf/nV0J4kDUZPRxCcOAJKCDH
BcLiKiF/lpHNzqG42BMfNR3fIzZcPPfuZRjjPeWGElT4HNJANbvmkrcVkfb99HjkrIGlCSaU/MH1
HMOi2+0Etl2KYUZe+9q+hca2ynmYQXtGOCQC5zBEifbagu3h9gnwq2xpPWh08644QbjNXPC13S6a
KYM=
=rNnT
-----END PGP SIGNATURE-----

--------------VDt4iJy4ytPc040AVt0BUUZ5--
