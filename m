Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ED6472707
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA73510E6F8;
	Mon, 13 Dec 2021 09:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D11C10E6F8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:59:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1E97C212B5;
 Mon, 13 Dec 2021 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639389546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FgFiLzjgbXLZxTBe4GEz5aIIqbjYxRyytqqqX3mrDuE=;
 b=ZK9OuRFsw7ZuOWNC41adF8WxDztCAH4n/XqZRkfySE7WDRHZbdeLxgui1+bBRo/U3MjCWs
 c8o6/9UTEFK9gQcwMJbZE4CVWESxg/rA8qqCysBwLmgIxsB0xc1LATPUaNZbhlFuBhkjB7
 fCKwtzpfMAcpjPwL6Zopao5kxSS8vR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639389546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FgFiLzjgbXLZxTBe4GEz5aIIqbjYxRyytqqqX3mrDuE=;
 b=15MXXOfulmPEK8kcXwxrFsBqD0ENkARPnbaOAOtgPszH8LdEu1/Hy0pb9pwVVcBDlyTmJM
 ump/CoWRrgcopPBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF6E213BB2;
 Mon, 13 Dec 2021 09:59:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3OliOWkZt2GwMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Dec 2021 09:59:05 +0000
Message-ID: <c1006921-19b4-4cd4-2522-4d83af575ff7@suse.de>
Date: Mon, 13 Dec 2021 10:59:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/ast: potential dereference of null pointer
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20211213053912.2167066-1-jiasheng@iscas.ac.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211213053912.2167066-1-jiasheng@iscas.ac.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vgdy448xJ8wWkFJTMzeIyPCX"
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
--------------vgdy448xJ8wWkFJTMzeIyPCX
Content-Type: multipart/mixed; boundary="------------SLQLno00Mmt0cNjfmolt8nGu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <c1006921-19b4-4cd4-2522-4d83af575ff7@suse.de>
Subject: Re: [PATCH] drm/ast: potential dereference of null pointer
References: <20211213053912.2167066-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20211213053912.2167066-1-jiasheng@iscas.ac.cn>

--------------SLQLno00Mmt0cNjfmolt8nGu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQpBbSAxMy4xMi4yMSB1bSAwNjozOSBz
Y2hyaWViIEppYXNoZW5nIEppYW5nOg0KPiBoZSByZXR1cm4gdmFsdWUgb2Yga3phbGxvYygp
IG5lZWRzIHRvIGJlIGNoZWNrZWQuDQoNCidUaGUnDQoNCj4gVG8gYXZvaWQgdXNlIG9mIG51
bGwgcG9pbnRlciAnJmFzdF9zdGF0ZS0+YmFzZScgaW4gY2FzZSBvZiB0aGUNCj4gZmFpbHVy
ZSBvZiBhbGxvYy4NCj4gDQo+IEZpeGVzOiBmMGFkYmMzODJiOGIgKCJkcm0vYXN0OiBBbGxv
Y2F0ZSBpbml0aWFsIENSVEMgc3RhdGUgb2YgdGhlIGNvcnJlY3Qgc2l6ZSIpDQo+IFNpZ25l
ZC1vZmYtYnk6IEppYXNoZW5nIEppYW5nIDxqaWFzaGVuZ0Bpc2Nhcy5hYy5jbj4NCj4gLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIHwgMyArKy0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfbW9kZS5jDQo+IGluZGV4IDM2ZDk1NzVhYTI3Yi4uNjdmOGUzZjkwZWEy
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+IEBAIC0xMTIwLDcgKzExMjAs
OCBAQCBzdGF0aWMgdm9pZCBhc3RfY3J0Y19yZXNldChzdHJ1Y3QgZHJtX2NydGMgKmNydGMp
DQo+ICAgCWlmIChjcnRjLT5zdGF0ZSkNCj4gICAJCWNydGMtPmZ1bmNzLT5hdG9taWNfZGVz
dHJveV9zdGF0ZShjcnRjLCBjcnRjLT5zdGF0ZSk7DQo+ICAgDQo+IC0JX19kcm1fYXRvbWlj
X2hlbHBlcl9jcnRjX3Jlc2V0KGNydGMsICZhc3Rfc3RhdGUtPmJhc2UpOw0KPiArCWlmIChh
c3Rfc3RhdGUpDQo+ICsJCV9fZHJtX2F0b21pY19oZWxwZXJfY3J0Y19yZXNldChjcnRjLCAm
YXN0X3N0YXRlLT5iYXNlKTsNCg0KSWYgYXN0X3N0YXRlIGlzIE5VTEwsIF9fZHJtX2F0b21p
Y19oZWxwZXJfY3J0Y19yZXNldCgpIGhhcyB0byBiZSBjYWxsZWQgDQp3aXRoIGEgc3RhdGUg
b2YgTlVMTC4gT3RoZXJ3aXNlIHRoZSByZXNldCBtaWdodCBsZWF2ZSB0aGUgZGFuZ2xpbmcg
DQpwb2ludGVyIGluIHRoZSBDUlRDJ3Mgc3RhdGUgZmllbGQuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHN0cnVjdCBkcm1fY3J0Y19zdGF0
ZSAqDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------SLQLno00Mmt0cNjfmolt8nGu--

--------------vgdy448xJ8wWkFJTMzeIyPCX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG3GWkFAwAAAAAACgkQlh/E3EQov+De
zxAAnQjDWB6NElK8HofBKdqK3FhOM7r+wyTdOpOrW3w6wvpy4PGLaRIV6/rsW4OIno0fMYKeFvsr
tXUllbM2fEj2RS0trzrmBINwC6jTPRHEgKgYFDOk1T98y+yJ3giSH+7l6pLrNSuE5ZKv4Bs2yBFA
G6NOnwiaImByy23+Te2c1ZI0y1rwh2QtB+HvEVyEATJI0553ELdyWORKg6PvjccRiptwLzfC8W54
Qo/UixE9aGCl/4zu518fpe7dYtPHdFCXihRlXd9Ok5x2Jb9+cNXH3B+zACGNWF/hugHCAQfmCLg3
Go6nJWlISYp+L4Toil+b6VsP1t1TGpvDt/CFui8kcutOZOFPXuomyOmufsLVclSWgHPKVOc0Evcx
wZzVDTKR4lySoTQJ3mmLscBN1gNUKdI3/wtBDLaid5i+8MgAPXABgx8sELILeKrn/K4fDeRBNOru
sdnUFc8s8vrVswKW8FFp+OJ0zld0mZsk5bm28YC1ZwM92dta+ZNPLezafq1N21z4ALCj6uXBds1O
RK4Sda3fib5bFAQMe2cbPznGQJiudm8Yy/61hzvLLN4T0FgU/f8TSO0d8NJPxGj0o0OOgmnPJsDd
92+i/rARU/aOkO6xBnDDK1Q+IYMwxaENE1RqlbHOnLq+Uwrl2H29wM9hdX56sEdm+3ncOP69DZiF
Aeo=
=msep
-----END PGP SIGNATURE-----

--------------vgdy448xJ8wWkFJTMzeIyPCX--
