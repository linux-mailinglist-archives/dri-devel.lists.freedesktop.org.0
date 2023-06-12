Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6018772B904
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 09:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5407610E1B1;
	Mon, 12 Jun 2023 07:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2433610E1B1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 07:47:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B459D20485;
 Mon, 12 Jun 2023 07:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686556033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qFUfTp5dyanSRWR+sGdMXeA/CXCg3ZAIPJTntZRMNrk=;
 b=mKE5MF83aO64Nib5CAPZ1gQUZRpjsNIESHX77zsf3yfpGTIIPu3QCWAL14lep/6obcJ/T/
 SLKdsZBqYdYCcI4MQnYZnGJa7e5cFK/hmIdRWUjRNeseusbqcIshV6d2ZiJLvfHkcWF6D5
 xef7CUuKFFGQcsoiuOWpZnloQURU3aM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686556033;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qFUfTp5dyanSRWR+sGdMXeA/CXCg3ZAIPJTntZRMNrk=;
 b=ILA+aSItMRUaawhuhMFh1snhDwk5yvkn3t6arTvvSmdhyYCHoaDmpz0q4j3nvhCaZysQ4h
 fK4QaSPKCQi2rKBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7816F1357F;
 Mon, 12 Jun 2023 07:47:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YpdBHIHNhmSsZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 07:47:13 +0000
Message-ID: <d4828a3d-639a-a207-ff36-45c8c5d4d311@suse.de>
Date: Mon, 12 Jun 2023 09:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Remove default
 width and height values
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Conor Dooley <conor@kernel.org>
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-3-javierm@redhat.com>
 <20230610-opposite-quality-81d4a1561c88@spud>
 <87r0qj19zs.fsf@minerva.mail-host-address-is-not-set>
 <20230610-unused-engaged-c1f4119cff08@spud>
 <87jzwa29ff.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87jzwa29ff.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WO2qRLZnYZV0zUnQVYYFuGht"
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WO2qRLZnYZV0zUnQVYYFuGht
Content-Type: multipart/mixed; boundary="------------XFs4pygeHK0D17qDOzXZ91B7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Message-ID: <d4828a3d-639a-a207-ff36-45c8c5d4d311@suse.de>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Remove default
 width and height values
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-3-javierm@redhat.com>
 <20230610-opposite-quality-81d4a1561c88@spud>
 <87r0qj19zs.fsf@minerva.mail-host-address-is-not-set>
 <20230610-unused-engaged-c1f4119cff08@spud>
 <87jzwa29ff.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87jzwa29ff.fsf@minerva.mail-host-address-is-not-set>

--------------XFs4pygeHK0D17qDOzXZ91B7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDYuMjMgdW0gMDE6MTggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JpdGVzOg0KPiAN
Cj4+IE9uIFNhdCwgSnVuIDEwLCAyMDIzIGF0IDA3OjUxOjM1UE0gKzAyMDAsIEphdmllciBN
YXJ0aW5leiBDYW5pbGxhcyB3cm90ZToNCj4+PiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5l
bC5vcmc+IHdyaXRlczoNCj4+Pg0KPj4+PiBPbiBGcmksIEp1biAwOSwgMjAyMyBhdCAwNzow
OTozN1BNICswMjAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgd3JvdGU6DQo+Pj4+PiBB
IGRlZmF1bHQgcmVzb2x1dGlvbiBpbiB0aGUgc3NkMTMweCBkcml2ZXIgaXNuJ3Qgc2V0IHRv
IGFuIGFyYml0cmFyeSA5NngxNg0KPj4+Pj4gYW55bW9yZS4gSW5zdGVhZCBpcyBzZXQgdG8g
YSB3aWR0aCBhbmQgaGVpZ2h0IHRoYXQncyBjb250cm9sbGVyIGRlcGVuZGVudC4NCj4+Pj4N
Cj4+Pj4gRGlkIHRoYXQgY2hhbmdlIHRvIHRoZSBkcml2ZXIgbm90IGJyZWFrIGJhY2t3YXJk
cyBjb21wYXRpYmlsaXR5IHdpdGgNCj4+Pj4gZXhpc3RpbmcgZGV2aWNldHJlZXMgdGhhdCBy
ZWxpZWQgb24gdGhlIGRlZmF1bHQgdmFsdWVzIHRvIGdldCA5NngxNj8NCj4+Pj4NCj4+Pg0K
Pj4+IEl0IHdvdWxkIGJ1dCBJIGRvbid0IHRoaW5rIGl0IGlzIGFuIGlzc3VlIGluIHByYXRp
Y2UuIE1vc3QgdXNlcnMgb2YgdGhlc2UNCj4+PiBwYW5lbHMgdXNlIG9uZSBvZiB0aGUgbXVs
dGlwbGUgbGlicmFyaWVzIG9uIHRvcCBvZiB0aGUgc3BpZGV2IGludGVyZmFjZS4NCj4+Pg0K
Pj4+IEZvciB0aGUgc21hbGwgdXNlcmJhc2UgdGhhdCBkb24ndCwgSSBiZWxpZXZlIHRoYXQg
dGhleSB3aWxsIHVzZSB0aGUgcnBpZg0KPj4+IGtlcm5lbCBhbmQgc3NkMTMwNi1vdmVybGF5
LmR0Ym8gRFRCIG92ZXJsYXksIHdoaWNoIGRlZmF1bHRzIHRvIHdpZHRoPTEyOA0KPj4+IGFu
ZCBoZWlnaHQ9NjQgWzFdLiBTbyB0aG9zZSB1c2VycyB3aWxsIGhhdmUgdG8gZXhwbGljaXRs
eSBzZXQgYSB3aWR0aCBhbmQNCj4+PiBoZWlnaHQgZm9yIGEgOTZ4MTYgcGFuZWwgYW55d2F5
cy4NCj4+Pg0KPj4+IFRoZSBpbnRlcnNlY3Rpb24gb2YgdXNlcnMgdGhhdCBoYXZlIGEgOTZ4
MTYgcGFuZWwsIGFzc3VtZWQgdGhhdCBkZWZhdWx0DQo+Pj4gYW5kIGNvbnNpZGVyIHRoZSBE
VEIgYSBzdGFibGUgQUJJLCBhbmQgb25seSB1cGRhdGUgdGhlaXIga2VybmVsIGJ1dCBub3QN
Cj4+PiB0aGUgIERUQiBzaG91bGQgYmUgdmVyeSBzbWFsbCBJTU8uDQo+Pg0KPj4gSXQncyB0
aGUgYWRkaW5nIG9mIG5ldyBkZWZhdWx0cyB0aGF0IG1ha2VzIGl0IGEgYml0IG1lc3NpZXIs
IHNpbmNlIHlvdQ0KPj4gY2FuJ3QgZXZlbiByZXZlcnQgd2l0aG91dCBwb3RlbnRpYWxseSBi
cmVha2luZyBhIG5ld2VyIHVzZXIuIEknZCBiZSBtb3JlDQo+PiBpbmNsaW5lZCB0byByZXF1
aXJlIHRoZSBwcm9wZXJ0aWVzLCByYXRoZXIgY2hhbmdlIHRoZWlyIGRlZmF1bHRzIGluIHRo
ZQ0KPj4gYmluZGluZywgbGVzdCB0aGVyZSBhcmUgcGVvcGxlIHJlbHlpbmcgb24gdGhlbS4N
Cj4gDQo+IEkgdGhpbmsgdGhhdCdzIE9LLCB0aGUgb2xkIGRyaXZlcnMvdmlkZW8vZmJkZXYv
c3NkMTMwN2ZiLmMgZmJkZXYgZHJpdmVyDQo+IHN0aWxsIGhhcyB0aGUgb2xkIGJlaGF2aW91
ciBzbyBpdCB3aWxsIG9ubHkgYmUgYSBwcm9ibGVtIGZvciB1c2VycyB0aGF0DQo+IHdhbnQg
dG8gbW92ZSB0byB0aGUgbmV3IHNzZDEzMHggZHJpdmVyIGFzIHdlbGwuDQo+IA0KPiBCeSBs
b29raW5nIGF0IHRoZSBnaXQgbG9nIGhpc3RvcnksIHRoZSA5NngxNiByZXNvbHV0aW9uIHdh
cyBjaG9zZW4gd2hlbg0KPiB0aGUgZHJpdmVyIHdhcyBtZXJnZWQgYmVjYXVzZSBNYXhpbWUg
dGVzdGVkIGl0IG9uIGEgQ0ZBMTAwMzYgYm9hcmQgWzFdDQo+IHRoYXQgaGFzIGEgOTZ4MTYg
cGFuZWwgdGhhdCB1c2VzIGFuIFNTRDEzMDcgY29udHJvbGxlci4NCj4gDQo+IEJ1dCBhcyBt
ZW50aW9uZWQsIHRoYXQgY2hpcCBjYW4gZHJpdmUgdXAgdG8gMTI4eDM5IHBpeGVscyBzbyB0
aGUgbWF4aW11bQ0KPiBtYWtlcyBtb3JlIHNlbnNlIGFzIGRlZmF1bHQgdG8gbWUuDQo+IA0K
PiBbMV06IGh0dHBzOi8vd3d3LmNyeXN0YWxmb250ei5jb20vcHJvZHVjdC9jZmExMDAzNg0K
PiANCj4+IElmIHlvdSBhbmQgdGhlIG90aGVyIGtub3dsZWRnZWFibGUgZm9sayBpbiB0aGUg
YXJlYSByZWFsbHkgZG8ga25vdyBzdWNoDQo+PiB1c2VycyBkbyBub3QgZXhpc3QgdGhlbiBJ
IHN1cHBvc2UgaXQgaXMgZmluZSB0byBkby4NCj4gDQo+IEkgYmVsaWV2ZSBpcyBmaW5lLCBz
aW5jZSBhcyBleHBsYWluZWQgYWJvdmUgdGhhdCBjaGFuZ2Ugd2FzIG9ubHkgZG9uZSBpbg0K
PiB0aGUgc3NkMTMweCBEUk0gZHJpdmVyLCBub3QgdGhlIHNzZDEzMDdmYiBmYmRldiBkcml2
ZXIgd2hvc2UgZGVmYXVsdCBpcw0KPiBzdGlsbCA5NngxNi4gQm90aCBkcml2ZXJzIHNoYXJl
IHRoZSBzYW1lIERUIGJpbmRpbmcgc2NoZW1lLCBJIHdhcyBhc2tlZA0KPiB0byBkbyB0aGF0
IHRvIG1ha2UgaXQgYXMgbXVjaCBiYWNrd2FyZCBjb21wYXRpYmxlIGFzIHBvc3NpYmxlIHdp
dGggdGhlDQo+IG9sZCBmYmRldiBkcml2ZXIuDQo+IA0KPiBCdXQgSSB3aWxsIGJlIE9LIHRv
IGRyb3AgdGhlICJzb2xvbW9uLHNzZDEzMD9mYi1pMmMiIGNvbXBhdGlibGUgc3RyaW5ncw0K
PiBmcm9tIHRoZSBEUk0gZHJpdmVyIGFuZCBvbmx5IG1hdGNoIGFnYWluc3QgdGhlIG5ldyAi
c29sb21vbixzc2QxMzA/LWkyYyINCj4gY29tcGF0aWJsZSBzdHJpbmdzLiBBbmQgYWRkIGEg
ZGlmZmVyZW50IERUIGJpbmRpbmcgc2NoZW1hIGZvciB0aGUgc3NkMTMweA0KPiBkcml2ZXIs
IGlmIHRoYXQgd291bGQgbWVhbiBiZWluZyBhYmxlIHRvIGZpeCB0aGluZ3MgbGlrZSB0aGUg
b25lIG1lbnRpb25lZA0KPiBpbiB0aGlzIHBhdGNoLg0KPiANCj4gSW4gbXkgb3Bpbmlvbiwg
dHJ5aW5nIHRvIGFsd2F5cyBtYWtlIHRoZSBkcml2ZXJzIGJhY2t3YXJkIGNvbXBhdGlibGUg
d2l0aA0KPiBvbGQgRFRCcyBvbmx5IG1ha2VzIHRoZSBkcml2ZXJzIGNvZGUgbW9yZSBjb21w
bGljYXRlZCBmb3IgdW5jbGVhciBiZW5lZml0Lg0KPiANCj4gVXN1YWxseSB0aGlzIGp1c3Qg
ZW5kcyBiZWluZyBjb2RlIHRoYXQgaXMgbmVpdGhlciB1c2VkIG5vciB0ZXN0ZWQuIEJlY2F1
c2UNCj4gaW4gcHJhY3RpY2UgbW9zdCBwZW9wbGUgdXBkYXRlIHRoZSBEVEJzIGFuZCBrZXJu
ZWxzLCBpbnN0ZWFkIG9mIHRyeWluZyB0bw0KPiBtYWtlIHRoZSBEVEIgYSBzdGFibGUgQUJJ
IGxpa2UgZmlybXdhcmUuDQo+IA0KDQogRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBmaXhpbmcg
dGhlIHJlc29sdXRpb24gaXMgdGhlIGNvcnJlY3QgdGhpbmcgdG8gZG8gDQpoZXJlLiBVc2Vy
c3BhY2UgbmVlZHMgdG8gYmUgYWJsZSB0byBoYW5kbGUgdGhlc2UgZGlmZmVyZW5jZXMuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdG
OiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1v
ZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------XFs4pygeHK0D17qDOzXZ91B7--

--------------WO2qRLZnYZV0zUnQVYYFuGht
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSGzYAFAwAAAAAACgkQlh/E3EQov+Av
Cg/9HU5bDa3K383KDwEnLeqVEo80PHBx+XYGk2uYWeNczqPk1dDt8SqQs+W0KP6plKi4CpBN4dBL
DjPUcPqQRmzf2ANb/vcHr8xWnZj0PvcLg2ZxkTKj2807u8jnpQAIWS38yjE1l6o5HUYYHThZYGjR
i+fnIXgIfo1Y5aF26VtkNeUmwXk9A6cub73kqNVvXmSZfGKm14H+aAs8tMLW0HvEiDnedLQqls2e
yrG+irGPTScPMWX6Mm0lxqYrwoMDrIMSa+1mW5OZ8R3ks1GbfeOfHVls0anRetrKHGc/5rlzrVJ3
KLGejxJUtkH0qMsZfv+DDSNCv8oqb8MAZPa5FkEiPU20VfUJfZ8Y+zz1+7D1ReQ+b2zl0YAmk75L
UcXL0fVpb6UaQcYuKE6l+PGqUr/NQodKsMrC6NydfJyl56Wogy+ejwUTR8CEQOJWRTOOcCw/1FfR
RzOV+0TbU9CCxeJC8R52M5pjL/aXYzvdXYyTMdSgEYjRaAJg7XIPvSxwTieQqNu1Gycf+TqD36Zr
aU4shfOWPj3zUsiajs6758gCO2MpiV6jF1sPa7LphS7c9BiJGifMkFAPyHBShgs7QBLM0uoSK8TF
Tel+gB+zB+x57FYJyhyBKTmCuPnCcetEPvxk2VPyMSdmqluOcuKvGcu+LW790tMiMhNjzS1unNVU
qBM=
=S+WN
-----END PGP SIGNATURE-----

--------------WO2qRLZnYZV0zUnQVYYFuGht--
