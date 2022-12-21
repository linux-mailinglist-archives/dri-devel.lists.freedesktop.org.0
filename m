Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E99653078
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 12:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE3210E02A;
	Wed, 21 Dec 2022 11:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F5310E105;
 Wed, 21 Dec 2022 11:54:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7543D6BA97;
 Wed, 21 Dec 2022 11:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671623658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JFr0T9b+93w+N/WiKOv2+e5ZzrLsfHeGBEiqEsh18x8=;
 b=itLw8/ayh6J9uK39WHv+cdxNuAOZSHA2vHFV8BfJY0y8zwmUpxK9IqP1jQ+PMLQ7WOMdex
 leXG7XNLh/5pRsofL+KYaXRybdl81YmKfqB0KFDzzNm/odIak1KaFVMrS6JeaNjs6Ucg0s
 cHcbjqQXpVx0lb/sGrRKcBdBBEI7x5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671623658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JFr0T9b+93w+N/WiKOv2+e5ZzrLsfHeGBEiqEsh18x8=;
 b=Fn/upJTVSlRS70XomxdvsXm1J68DEOiyDjBU5uAuZCFe0MJiAbkRtIC367GThFnLCqx8yW
 NVjADO2kZj2rePCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A3FD13913;
 Wed, 21 Dec 2022 11:54:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KzYQFerzomNTTgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Dec 2022 11:54:18 +0000
Message-ID: <3a5ca3eb-cb45-dbff-790f-b8dadf53b5a6@suse.de>
Date: Wed, 21 Dec 2022 12:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] drm/i915/fbdev: Implement fb_dirty for intel custom
 fb helper
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20221221111902.1742095-1-jouni.hogander@intel.com>
 <20221221111902.1742095-2-jouni.hogander@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221221111902.1742095-2-jouni.hogander@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kEyCU0mxeCJCBcroGWNd5LrN"
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kEyCU0mxeCJCBcroGWNd5LrN
Content-Type: multipart/mixed; boundary="------------UfWqIC8d3SOBnlfrQz066YS2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Message-ID: <3a5ca3eb-cb45-dbff-790f-b8dadf53b5a6@suse.de>
Subject: Re: [PATCH 1/2] drm/i915/fbdev: Implement fb_dirty for intel custom
 fb helper
References: <20221221111902.1742095-1-jouni.hogander@intel.com>
 <20221221111902.1742095-2-jouni.hogander@intel.com>
In-Reply-To: <20221221111902.1742095-2-jouni.hogander@intel.com>

--------------UfWqIC8d3SOBnlfrQz066YS2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMTIuMjIgdW0gMTI6MTkgc2NocmllYiBKb3VuaSBIw7ZnYW5kZXI6DQo+
IEFmdGVyIHNwbGl0dGluZyBnZW5lcmljIGRybV9mYl9oZWxwZXIgaW50byBpdCdzIG93biBm
aWxlIGl0J3MgbGVmdCB0bw0KPiBoZWxwZXIgaW1wbGVtZW50YXRpb24gdG8gaGF2ZSBmYl9k
aXJ0eSBmdW5jdGlvbi4gQ3VycmVudGx5IGludGVsDQo+IGZiIGRvZXNuJ3QgaGF2ZSBpdC4g
VGhpcyBpcyBjYXVzaW5nIHByb2JsZW1zIHRvIGZlYXR1cmVzIChQU1IsIEZCQywgRFJSUykN
Cj4gcmVseWluZyBvbiBkaXJ0eSBjYWxsYmFjay4NCj4gDQo+IEltcGxlbWVudCBzaW1wbGUg
ZmJfZGlydHkgY2FsbGJhY2sgdG8gZGVsaXZlciBub3RpZmljYXRpb25zIGFib3V0IHVwZGF0
ZXMNCj4gaW4gZmIgY29uc29sZS4NCg0KSWYgdGhpcyBpcyBvbmx5IHJlcXVpcmVkIGZvciB0
aGUga2VybmVsIGNvbnNvbGUsIHlvdSBtYXliZSB3YW50IHRvIA0KcmF0aGVyIGNoYW5nZSB0
aGUgZmJfb3BzLg0KDQpUaGUga2VybmVsIGNvbnNvbGUgb25seSB1c2VzIGZiX2ZpbGxyZWN0
LCBmYl9jb3B5YXJlYSBhbmQgZmJfaW1hZ2VibGl0LiANClsxXSBTb21ldGhpbmcgc2ltcGxl
IGFzDQoNCnZvaWQgaW50ZWxfZmJkZXZfZmlsbHJlY3QoLi4uKQ0Kew0KCWRybV9mYl9oZWxw
ZXJfY2ZiX2ZpbGxyZWN0KCk7DQoNCgkvKiBjb21tZW50IG9uIFBTUiBwcm9ibGVtcyAqLwkN
CglmYi0+ZnVuY3MtPmRpcnR5KCkNCn0NCg0Kc2hvdWxkIHdvcmsuIFNhbWUgZm9yIHRoZSBv
dGhlciB0d28gaGVscGVycy4NCg0KTm90IHVzaW5nIGZiX2RpcnR5IHdpbGwgYWxzbyBhdm9p
ZCB0aGUgZmJkZXYncyBpbnRlcm5hbCBkYW1hZ2Ugd29ya2VyLCANCndoaWNoIGlzIG90aGVy
d2lzZSBzY2hlZHVsZWQgZm9yIGVhY2ggY29uc29sZSB1cGRhdGUuDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2
LjEvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJkZXYuYyNM
MTI3DQoNCj4gDQo+IHYyOiBJbXByb3ZlZCBjb21taXQgbWVzc2FnZSBhbmQgYWRkZWQgRml4
ZXMgdGFnDQo+IA0KPiBGaXhlczogOGFiNTlkYTI2YmMwICgiZHJtL2ZiLWhlbHBlcjogTW92
ZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiBpbnRvIHNlcGFyYXRlIHNvdXJjZSBmaWxlIikN
Cj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
DQo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gQ2M6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMgfCA5ICsrKysr
KysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMNCj4gaW5kZXggMDNl
ZDQ2MDdhNDZkLi4yMGJiZGVhZjJlNmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJkZXYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMNCj4gQEAgLTMyOCw4ICszMjgsMTcgQEAgc3Rh
dGljIGludCBpbnRlbGZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyLA0K
PiAgIAlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbnQgaW50ZWxmYl9k
aXJ0eShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyLCBzdHJ1Y3QgZHJtX2NsaXBfcmVj
dCAqY2xpcCkNCj4gK3sNCj4gKwlpZiAoaGVscGVyLT5mYi0+ZnVuY3MtPmRpcnR5KQ0KPiAr
CQlyZXR1cm4gaGVscGVyLT5mYi0+ZnVuY3MtPmRpcnR5KGhlbHBlci0+ZmIsIE5VTEwsIDAs
IDAsIGNsaXAsIDEpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gICBzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9mYl9oZWxwZXJfZnVuY3MgaW50ZWxfZmJfaGVscGVyX2Z1
bmNzID0gew0KPiAgIAkuZmJfcHJvYmUgPSBpbnRlbGZiX2NyZWF0ZSwNCj4gKwkuZmJfZGly
dHkgPSBpbnRlbGZiX2RpcnR5LA0KPiAgIH07DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgaW50
ZWxfZmJkZXZfZGVzdHJveShzdHJ1Y3QgaW50ZWxfZmJkZXYgKmlmYmRldikNCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------UfWqIC8d3SOBnlfrQz066YS2--

--------------kEyCU0mxeCJCBcroGWNd5LrN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOi8+kFAwAAAAAACgkQlh/E3EQov+Bv
HRAAlwAk9umfudedNfPCpp4dRHdJ0Kp1DUogkXJm8rwTDWJmykQR3T3TzcZsMc+7zzSWaaTRcnya
gJaJuqqfTJWS5gxHdMtLxwSWNrITKxslSmpOEqr8PA/pxOQZ7vbbZtj1pgEgYa4YKmWUxR03R9JS
/pe3fsu2QSB4H3EzjYl0ZZCdVfU1qfd7z+auEjPwmt4kov/V4jUkFcCTzLaZEDprjfs+dCTrbHtn
rKeKkNYvKQZhmndWUDYaaexJmNGHqHrLKUZtBW8uqD8J26sqtUFhmpRl0uIis4dNa6p29ArfyKIF
mt2LaUvnXMtX0UqEsOMvHXQFB5Bh/U6i0gvFAaTS9AhpPQiku4sFNgk3mVjonCB06AJHXuDCzLLX
guEmUuwF19I1G8k7yUXYxHni4OQFEYSTolqawvImSN5m+52aQXsNHyT3He3qCXIR+QJjIK05gE2P
N3Fl7VLbikcrvBwRlbQzZN43k3j9yJxlzQ6krueGP9xMZ0j7x/jjfSvU+ibLTUcieD8OK8Vzos1T
EipayCnn1Q3e/a4FJzpJ5nYXBif33qnQRww1STpsSoiqZ/G1UQwxpI4F7/dnx4LynYqQm9tsCZrv
aEIgSwg10CwVjKItqPHwPuj4K72AZOL9fClSJg+fMOsxixTXt5NS9NbiCnrXTGeJON1LlGB2Wi6i
EX4=
=GmdQ
-----END PGP SIGNATURE-----

--------------kEyCU0mxeCJCBcroGWNd5LrN--
