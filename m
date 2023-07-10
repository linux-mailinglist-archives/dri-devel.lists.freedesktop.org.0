Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED19C74D4DA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 13:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9369710E241;
	Mon, 10 Jul 2023 11:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FF010E241
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 11:59:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E5901FF0E;
 Mon, 10 Jul 2023 11:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688990366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aULb6K93sg3Ih4opxCSOWF5nXnLPwALdHFb2APcKkWU=;
 b=lttRnlpuRTIpiibdAwDgr/Vq8pdXPQrh9mD7dDI37fhOhlBDpkvsWFTudHdRIQukU4wSDu
 x7QqHOwKonu7dy7+Hp8wPRXnAD5LmqPpjVDTaEyzKgI78J7pYww2HzTUuJB+r4e94Y02VG
 Zbh+lX2y9RRd2XCN5QHMplTn2yZrOxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688990366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aULb6K93sg3Ih4opxCSOWF5nXnLPwALdHFb2APcKkWU=;
 b=CvVJCQGBb30k8jY5PN46r/Xr/dbvgThKyB6bsxX1dV1vr5xKDDpXTaKtmHkEydvIFRHX0C
 2G2a+6+/fw0nR7Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED99813A05;
 Mon, 10 Jul 2023 11:59:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XS2vOJ3yq2SRcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 11:59:25 +0000
Message-ID: <13d4c853-ed7b-f0f5-dffb-a7811f2da249@suse.de>
Date: Mon, 10 Jul 2023 13:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/loongson: Remove a useless check in
 cursor_plane_atomic_async_check()
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>
References: <20230710102411.257970-1-suijingfeng@loongson.cn>
 <6c7bbce7-5521-b868-019f-bce26f309730@suse.de>
 <8182fecd-d290-293a-d963-ddbea79dbf03@loongson.cn> <87r0pghtu9.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87r0pghtu9.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3wSbXI0PX1n3j1pHqk1CnxXN"
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
Cc: loongson-kernel@lists.loongnix.cn, Dan Carpenter <dan.carpenter@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3wSbXI0PX1n3j1pHqk1CnxXN
Content-Type: multipart/mixed; boundary="------------iNh77Gx20Fj0eUW5OG4MCHPb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>
Cc: loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <13d4c853-ed7b-f0f5-dffb-a7811f2da249@suse.de>
Subject: Re: [PATCH] drm/loongson: Remove a useless check in
 cursor_plane_atomic_async_check()
References: <20230710102411.257970-1-suijingfeng@loongson.cn>
 <6c7bbce7-5521-b868-019f-bce26f309730@suse.de>
 <8182fecd-d290-293a-d963-ddbea79dbf03@loongson.cn> <87r0pghtu9.fsf@intel.com>
In-Reply-To: <87r0pghtu9.fsf@intel.com>

--------------iNh77Gx20Fj0eUW5OG4MCHPb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDcuMjMgdW0gMTM6NDYgc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
TW9uLCAxMCBKdWwgMjAyMywgc3VpamluZ2ZlbmcgPHN1aWppbmdmZW5nQGxvb25nc29uLmNu
PiB3cm90ZToNCj4+IE9uIDIwMjMvNy8xMCAxODozOSwgVGhvbWFzIFppbW1lcm1hbm4gd3Jv
dGU6DQo+Pj4gYnV0IHRoYXQgZHJpdmVyIGlzIG5vdCB5ZXQgaW4gb3VyIHRyZWU/DQo+Pj4N
Cj4+DQo+PiBJIGFscmVhZHkgYXBwbGllZChwdXNoKSBkcm0vbG9vbmdzb24gZHJpdmVyIHRv
IGRybS1taXNjLW5leHQgYnJhbmNoLA0KPj4NCj4+IFdoYXQgZG8geW91IG1lYW5zIHRoYXQg
YnkgIm5vdCB5ZXQgaW4gb3VyIHRyZWUiLCBsaW51eCBrZXJuZWwgc2lkZT8NCj4+DQo+PiBB
bSBJIG1pc3Npbmcgc29tZXRoaW5nID8NCj4gDQo+IEhtbSwgaW5kZWVkIHRoZXJlJ3MgY29t
bWl0IGYzOWRiMjZjNTQyOCAoImRybTogQWRkIGttcyBkcml2ZXIgZm9yDQo+IGxvb25nc29u
IGRpc3BsYXkgY29udHJvbGxlciIpLi4uIGJ1dCBpdCBvbmx5IGhhcyBvbmUgQWNrZWQtYnkg
ZnJvbQ0KPiBUaG9tYXMgdGhhdCBJIGNhbid0IGZpbmQgb24gYW55IGxpc3RzLCBhbmQgemVy
byBSZXZpZXdlZC1ieS4NCj4gDQo+IFVzdWFsbHksIHRoZSBiaWdnZXIgdGhlIGNoYW5nZSwg
dGhlIG1vcmUgYWNrcy9yZXZpZXdzIHlvdSBuZWVkLiBEaWQNCj4gVGhvbWFzIHJlYWxseSBh
Y2sgdGhpcyB0byBiZSBtZXJnZWQgd2l0aG91dCByZWNvcmRlciByZXZpZXdzPyA6bw0KDQpT
aG91bGQgYmUgT0s7IGl0J3MgYW4gaXNvbGF0ZWQgZHJpdmVyLiBJIGRpZCBhIHJldmlldyBl
YXJseSBvbiBhbmQgYWZ0ZXIgDQp+MTMgcmV2aXNpb25zIEkgYXNrZWQgZm9yIGl0IHRvIGJl
IG1lcmdlZC4gSXQncyBhY3R1YWxseSBhIGJpdCBoYXJkIHRvIA0KZmluZCByZXZpZXdlcnMu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4g
DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJh
c3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRy
ZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkg
KEFHIE51ZXJuYmVyZykNCg==

--------------iNh77Gx20Fj0eUW5OG4MCHPb--

--------------3wSbXI0PX1n3j1pHqk1CnxXN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSr8p0FAwAAAAAACgkQlh/E3EQov+Ak
BhAAr8KF99OABlQvhA9Cr0d0jYOyBiVOoZ7JO8RmlIUewGsZr3jPKSKk0InpHeGwjNzmAfDP8zMt
fUQo5es2NbzPG4D6ok7SKzjTa/2ujbUzejrqIaH++qeLi1TVbl8ljAoi8XTp2tyeHXL93KZAv3Hz
d0pL90E0j14aourloeqQ2ujXv3RdiEKKHbzyOMy6ar1IOGFIVQBytcCsUjnYbWElefPIDaTy2OfR
jmxclWO53dryanVEOhG/XdBl5500DxHdXlOO8WwaBbV0CPCtARCjikabL8U3NIB8Pf4VP7c9EPxd
ltZpyNQCp112rBUU5087X+JoFM6piWkv84TnPNAD09zrU9ZoxpkNpolzHfTaIzKIBJcKSnSmhagK
tXe9XYcomwNkda2euaNHuuvQBhPwFvF4gLIQHo3YmDrXvuCPM14g9ERMO7fbwURUlI2JYN5HZFlr
D2nPawshTrVSe7sg69BL8cqDj1ZlBO+2DakXfZXm39X4y7HSTrRCATVGyCtzlED8/hvpVHbb7oAV
U42J3eJiZRp19FwChNJ1ryglbpHOhq40/MAb1QzmxK6RSYFwD8HU528Qt9vYorwid7xO7dAxp7VZ
h3vl/QDt5QemRuK1WG7pUF68GSwBZWNvMul0oQlGyvEilOf9SoQyiTCl0gyeEZwK1lQ5eiOBFMnH
ncE=
=HRk8
-----END PGP SIGNATURE-----

--------------3wSbXI0PX1n3j1pHqk1CnxXN--
