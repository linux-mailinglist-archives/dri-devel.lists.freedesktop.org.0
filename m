Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF02370DB76
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 13:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8019D10E051;
	Tue, 23 May 2023 11:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F35410E051
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 11:29:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 701B921B09;
 Tue, 23 May 2023 11:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684841349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mvqkqOMb3CMYPLp2cVxAIz7L8yoF9r2lyWg7G3UMvCM=;
 b=n2cZzkZ2awo59klRexH1P+5Thd48Q9aEQNNXcQl3p0vr66fTHz8HEBqMTgJPZn6YX6cb+B
 91EAPPihH00cu1KP0nn0aKo42QYHYy6QNeTvT6ojWeloil3TpiN1CN4B7+vMMlDYJ82aUa
 HAogYJzC69oYr+KVyTuBEKSwthvh+FU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684841349;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mvqkqOMb3CMYPLp2cVxAIz7L8yoF9r2lyWg7G3UMvCM=;
 b=dp/RduJyu8HbzkCbFmDIODQ08jHj6j6ppnDrkEquRymnRWYZq8tUYakmBhA4KD/zoFx/pN
 evm0sUGcgXsLEyAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 587C813A10;
 Tue, 23 May 2023 11:29:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gZqoFIWjbGR0DgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 23 May 2023 11:29:09 +0000
Message-ID: <7c0b5d62-36d5-edae-ba50-b171538a488a@suse.de>
Date: Tue, 23 May 2023 13:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/gma500: Clear fbdev framebuffer with fb_memset_io()
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20230522190637.7039-1-tzimmermann@suse.de>
 <2x56vhkpjegqgjydnjji4xmvp3w4js66myw5kwngjsdpax7uma@x3fzwdbmrrny>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2x56vhkpjegqgjydnjji4xmvp3w4js66myw5kwngjsdpax7uma@x3fzwdbmrrny>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C4kFB71C8YbGJASGUDr0H91U"
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
--------------C4kFB71C8YbGJASGUDr0H91U
Content-Type: multipart/mixed; boundary="------------QZXvGhEj3uNXALMPiTN1kqc8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Message-ID: <7c0b5d62-36d5-edae-ba50-b171538a488a@suse.de>
Subject: Re: [PATCH] drm/gma500: Clear fbdev framebuffer with fb_memset_io()
References: <20230522190637.7039-1-tzimmermann@suse.de>
 <2x56vhkpjegqgjydnjji4xmvp3w4js66myw5kwngjsdpax7uma@x3fzwdbmrrny>
In-Reply-To: <2x56vhkpjegqgjydnjji4xmvp3w4js66myw5kwngjsdpax7uma@x3fzwdbmrrny>

--------------QZXvGhEj3uNXALMPiTN1kqc8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDUuMjMgdW0gMDk6MDAgc2NocmllYiBQYXRyaWsgSmFrb2Jzc29uOg0K
PiBPbiBNb24sIE1heSAyMiwgMjAyMyBhdCAwOTowNjozN1BNICswMjAwLCBUaG9tYXMgWmlt
bWVybWFubiB3cm90ZToNCj4+IFRoZSBmYmRldiBmcmFtZWJ1ZmZlciBpcyBJL08gbWVtb3J5
LCBzbyBjbGVhciBpdCB3aXRoIGZiX21lbXNldF9pbygpLg0KPj4gRml4ZXMgdGhlIGZvbGxv
d2luZyBzcGFyc2Ugd2FybmluZzoNCj4+DQo+PiAuLi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAw
L2ZiZGV2LmM6MjM0OjIwOiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhcmd1bWVudCAx
IChkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMpDQo+PiAuLi9kcml2ZXJzL2dwdS9kcm0vZ21h
NTAwL2ZiZGV2LmM6MjM0OjIwOiAgICBleHBlY3RlZCB2b2lkICpzDQo+PiAuLi9kcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL2ZiZGV2LmM6MjM0OjIwOiAgICBnb3QgY2hhciBbbm9kZXJlZl0g
X19pb21lbSAqc2NyZWVuX2Jhc2UNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gDQo+IExvb2tzIGdvb2QgYnV0IEkg
ZG9uJ3Qgc2VlIHRoZSBmYl9tZW0qKCkgaGVscGVyIGNoYW5nZSBiZWluZyBtZXJnZWQgeWV0
Lg0KPiBPciBhbSBJIGxvb2tpbmcgaW4gdGhlIHdyb25nIHBsYWNlPw0KDQpJdCdzIGhlcmUs
IGluIGRybS1taXNjLW5leHQ6DQoNCmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJt
L2RybS1taXNjL2NvbW1pdC8/aWQ9MjBkNTRlNDhkOWM3MDUwOTFhMDI1YWZmZjU4MzlkYTJl
YTYwNmY2Yg0KDQpUaGUgcGF0Y2ggd291bGQgZ28gdGhlcmUgYXMgd2VsbC4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZ21h
NTAwL2ZiZGV2LmMgfCAyICstDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL2ZiZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZiZGV2LmMNCj4+IGlu
ZGV4IDYyMjg3NDA3ZTcxNy4uNGYwMzA5NTQ4YjJiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9mYmRldi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21h
NTAwL2ZiZGV2LmMNCj4+IEBAIC0yMzEsNyArMjMxLDcgQEAgc3RhdGljIGludCBwc2JfZmJk
ZXZfZmJfcHJvYmUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4+ICAgCWlu
Zm8tPmZpeC5tbWlvX3N0YXJ0ID0gcGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsIDApOw0KPj4g
ICAJaW5mby0+Zml4Lm1taW9fbGVuID0gcGNpX3Jlc291cmNlX2xlbihwZGV2LCAwKTsNCj4+
ICAgDQo+PiAtCW1lbXNldChpbmZvLT5zY3JlZW5fYmFzZSwgMCwgaW5mby0+c2NyZWVuX3Np
emUpOw0KPj4gKwlmYl9tZW1zZXRfaW8oaW5mby0+c2NyZWVuX2Jhc2UsIDAsIGluZm8tPnNj
cmVlbl9zaXplKTsNCj4+ICAgDQo+PiAgIAkvKiBVc2UgZGVmYXVsdCBzY3JhdGNoIHBpeG1h
cCAoaW5mby0+cGl4bWFwLmZsYWdzID0gRkJfUElYTUFQX1NZU1RFTSkgKi8NCj4+ICAgDQo+
PiAtLSANCj4+IDIuNDAuMQ0KPj4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6
IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9l
cm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------QZXvGhEj3uNXALMPiTN1kqc8--

--------------C4kFB71C8YbGJASGUDr0H91U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRso4QFAwAAAAAACgkQlh/E3EQov+CT
5hAAgWn1qSckD4TbFosDmACnMo6UywmVFqQYaR6gCPMzklGNpvd1O6SsM9B0wowsZ8TM0sY9NaRx
3cFA36VhpToLBXdzt5wofKkP/4VmB7zqIXf2WwMZfGh82IyC00yuf6oDNS1lNHQQx+R8UETeyv9H
WQao7AeElR/Ec2tdmnEJCOlcdcP29YfvdPipDoSb+0/z0Ip6PEZVS4CQCpvkHO2zO/52KcOvYrS+
MOaCB8/osCHlTynUf4Flu05BZ3/uvLwmLgQROq44yTDQtUL8kY0WMqNbWcfHbjvNt4af9xUo74JU
OmYXexk4Vu4343ohJU5M+wxOljS7VbNbCAEhyLYq33agyiQ5EKWTfAtlHcZ8rJmPvnruaY2etvJ9
oVD57q06GIcOE3bbkm0R7mCukyJCr/nbsu03neSKyU14H+Mwou4Gl0n6yz440TNl0RzOvH6um0Uy
HUVVQyRcEqR4qAwS8rfQUb1nwMzxwYuMMhxAAM+twW/Ly07B1eUoeqhUdSUHoJMEI2XK/TXV3c3z
+9br9fm+yC+mhT8uDz0q4OsWN4QzdegTcJ4eDkSrRApxKYmoPCDXVdni1k896lWTVw8H8bBi0UDk
J7FRmaGOe/ZqH6jicH4zd+MdN0SVFerSL+5k+XTXirw1UIVLbeSH9QnwjA8ZZt+bDCMBqaQbFwMB
Fkc=
=SLxW
-----END PGP SIGNATURE-----

--------------C4kFB71C8YbGJASGUDr0H91U--
