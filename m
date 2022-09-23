Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020C45E7893
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 12:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B9110E508;
	Fri, 23 Sep 2022 10:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A364710E508
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 10:43:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 637BF1F947;
 Fri, 23 Sep 2022 10:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663929835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r9oF833icN13obvBuvFytPV+LOJ4mqswmO8QSmEmqcg=;
 b=LI0Ei7YvlT9wS3t57eaRzTStL8RSK0NlXKHCuimMOAu6Y0xR/VLzZd6ljbH9w0RNbJ3zF5
 cClxMYd5ygSOKwbRB1bE+fl9xmmtCnlUUWWu+3ql366IsoQAQA8XsBD2phKzyFE2SN+Oxz
 vBetjIQJRMCCIxiEDFie4VpessZHUIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663929835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r9oF833icN13obvBuvFytPV+LOJ4mqswmO8QSmEmqcg=;
 b=hgwuwfRhOQGPbz5CmcFjscI5GamI+BHfDP0VW5t8SHKizubNhnO+am0dFdkZ4Iw8U1Xpkj
 K5ExxjUCTv+hfuCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4393113AA5;
 Fri, 23 Sep 2022 10:43:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8B82D+uNLWOSRQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Sep 2022 10:43:55 +0000
Message-ID: <fcd1d302-89af-62c9-0081-0717ad40e4ca@suse.de>
Date: Fri, 23 Sep 2022 12:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 5/5] drm/simpledrm: Synchronize access to GEM BOs
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-6-tzimmermann@suse.de>
 <2163b960-cfbe-7693-ba89-633cb36558a7@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2163b960-cfbe-7693-ba89-633cb36558a7@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NtDGSPYzDdgpAv6QBBr0E5Fh"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NtDGSPYzDdgpAv6QBBr0E5Fh
Content-Type: multipart/mixed; boundary="------------7TuBghu9myzHVBw4n8BAyOkf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <fcd1d302-89af-62c9-0081-0717ad40e4ca@suse.de>
Subject: Re: [PATCH 5/5] drm/simpledrm: Synchronize access to GEM BOs
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-6-tzimmermann@suse.de>
 <2163b960-cfbe-7693-ba89-633cb36558a7@redhat.com>
In-Reply-To: <2163b960-cfbe-7693-ba89-633cb36558a7@redhat.com>

--------------7TuBghu9myzHVBw4n8BAyOkf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDkuMjIgdW0gMTA6MDYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDkvMjIvMjIgMTU6MDksIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gU3luY2hyb25pemUgQ1BVIGFjY2VzcyB0byBHRU0gQk9zIHdpdGggb3RoZXIgZHJpdmVy
cyB3aGVuIHVwZGF0aW5nIHRoZQ0KPj4gc2NyZWVuIGJ1ZmZlci4gSW1wb3J0ZWQgYnVmZmVy
cyBtaWdodCBvdGhlcndpc2UgY29udGFpbiBzdGFsZSBkYXRhLg0KPj4NCj4gDQo+IENhbiB5
b3UgcGxlYXNlIGVsYWJvcmF0ZSB3aGF0IHRoZSBwcm9ibGVtIGlzPyBUaGUgZnJhbWVidWZm
ZXJzIG1lbW9yeSBpcw0KPiBzZXR1cCBieSB0aGUgZmlybXdhcmUgYW5kIHdvdWxkIG5ldmVy
IGNvbWUgZnJvbSBhbiBpbXBvcnRlZCBkbWEtYnVmLCBzbw0KPiBjb3VsZCB0aGUgR0VNIEJP
cyBldmVuIGJlIHNoYXJlZCB3aXRoIG90aGVyIGRyaXZlcnM/DQo+IA0KPiBPciBpcyB0aGlz
IGRvbmUganVzdCBmb3IgdGhlIHNha2Ugb2YgY29ycmVjdG5lc3MgPw0KDQpUaGlzIGlzbid0
IGFib3V0IHRoZSBzY2Fub3V0IGJ1ZmZlciB0aGF0IHdlIGdldCBmcm9tIHRoZSBmaXJtd2Fy
ZS4gVGhpcyANCmlzIGFib3V0IHN5bmNocm9uaXppbmcgYWNjZXNzIHRvIHRoZSBHRU0gQk8g
bWVtb3J5IGJ1ZmZlcnMuIE91ciBCT3MnIA0KbWVtb3J5IGJ1ZmZlciBhcmUgYWxsb2NhdGVk
IGZyb20gU0hNRU0gb3IgY291bGQgYmUgaW1wb3J0ZWQgdmlhIGRtYS1idWYuIA0KSW4gdGhl
IGxhdHRlciBjYXNlLCBhbm90aGVyIGRyaXZlciBvciBoYXJkd2FyZSBtaWdodCBtb2RpZnkg
dGhlaXIgDQpjb250ZW50IGNvbmN1cnJlbnRseS4gV2UgbmVlZCB0byBzeW5jaHJvbml6ZSBi
ZWZvcmUgcmVhZGluZyB0aGUgbWVtb3J5IA0KZnJvbSBvdXIgQ1BVLiBUaGUgcGF0dGVybiBp
cw0KDQogICAxKSBzeW5jIEJPIG1lbW9yeSBjb250ZW50IHZpYSBiZWdpbl9jcHVfYWNjZXNz
KCkNCiAgIDIpIGJsaXQgZnJvbSBCTyBtZW0gdG8gc2Nhbm91dCBidWZmZXINCiAgIDMpIHJl
bGVhc2UgQk8gbWVtb3J5IHZpYSBlbmRfY3B1X2FjY2VzcygpDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gICANCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+IA0KPiBUaGUgY2hhbmdlIGxvb2tzIGdv
b2QgdG8gbWUgdGhvdWdoIGlmIGlzIGZvciB0aGUgbGF0dGVyLg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------7TuBghu9myzHVBw4n8BAyOkf--

--------------NtDGSPYzDdgpAv6QBBr0E5Fh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMtjeoFAwAAAAAACgkQlh/E3EQov+A4
HhAAqB3gdh16OqBvNLyViBUrVGMmJ0lqwZRP/taaop+MHNb7ggAjmmYdNlIimSNUALMvUaZ9hNMh
R9RQCuJOsZLBopyPiap07cXcwem0DTglgTYdKWQXam1SEE0MzNBqdl/iHzMXx7FEX6hjpuN2SMSO
SEwFUSDQbR+4og+u8CcDjbWf3eOaiVqygwcE4/ysMK/ahHzugkZ+XPjqV/FWxHCMn38wHOPdJYKc
xnhcnFZ80PfNxjDtDJAVKbWLhTa4yGhk61WlXmIllV3qiMbRUcISQQbHIAUGhIuLCgkwQcQ30iYD
DdvqWYmsLjsw4YWwFrdVNOA2lUbJ4YqPGA/n5C2DhOs81GUh/a77ixZONgaBVjEmKCUxlXG7cT/v
w5PmGc5jkOzdBCnDhsQYDLVgdwtjHpp9FdUq3tdcruiOZBeJoPQcyWRfxB3In/+MERaydrJsnYVb
JLp/fPi66gdIz8ofZdkAa06akqJB9WsWtcm86YAWqHiop1g6ClIu4bD6rIKFOUx9H0j7idmc9y0w
w4y0gUojLDWOrd+8GACmTZ1fb3g8eND/i+FaRiHeq2C2wjVMrQLgVbyLPKgkiAAXvfc9xn3q/Ppj
ehIW4r3pSnIpvvtwjg+3ATtwWnThUTkh0DV2UTIuADJvZqboSxxg/JLVecWs2aIYaNE/81L1t0/j
xFw=
=bnnb
-----END PGP SIGNATURE-----

--------------NtDGSPYzDdgpAv6QBBr0E5Fh--
