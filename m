Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E2C632758
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 16:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E982E10E2E6;
	Mon, 21 Nov 2022 15:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719B810E2E6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:08:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1CEAE22050;
 Mon, 21 Nov 2022 15:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669043297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XZPs4RonxgREwk1cTKoTtvUSq1E7IKXuqLg1SevEyNo=;
 b=sw5SZiIoqsKc8+foAiRvyDoTlFj41LbmXrVFePmdq+vRr1k3hK0oMZC8cnLNUxWSzGeYzX
 aXF/zfsdvANtxQxGxMIspelwheP9v5ivqNIXAxQ7bUytH8q1V7dhujQg9bzgdIXQoPHGpm
 vfxwZ5SDEpYKDN3/CcPUElq2keua9yU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669043297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XZPs4RonxgREwk1cTKoTtvUSq1E7IKXuqLg1SevEyNo=;
 b=3wwZ+oewpUC2xX0Ic+lgI/CtfxeIp1PVOnWXWn81N8uGeg+gUAhqGB60hRs6F+wMD5SuH+
 bxVa5qSbAvec8KDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B19821376E;
 Mon, 21 Nov 2022 15:08:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ViRFKmCUe2NFNAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Nov 2022 15:08:16 +0000
Message-ID: <c321ba29-4de1-5517-514a-bb489d3c792b@suse.de>
Date: Mon, 21 Nov 2022 16:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20221119204435.97113-1-ogabbay@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221119204435.97113-1-ogabbay@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s5qUTgzlpoZ0MGGPNB4LCMlC"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiho Chu <jiho.chu@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------s5qUTgzlpoZ0MGGPNB4LCMlC
Content-Type: multipart/mixed; boundary="------------tXBKNrT2VYONmyy5XAPNe002";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Alex Deucher
 <alexander.deucher@amd.com>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <c321ba29-4de1-5517-514a-bb489d3c792b@suse.de>
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
References: <20221119204435.97113-1-ogabbay@kernel.org>
In-Reply-To: <20221119204435.97113-1-ogabbay@kernel.org>

--------------tXBKNrT2VYONmyy5XAPNe002
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoN
CkFtIDE5LjExLjIyIHVtIDIxOjQ0IHNjaHJpZWIgT2RlZCBHYWJiYXk6DQo+IFRoaXMgaXMg
dGhlIGZvdXJ0aCAoYW5kIGhvcGVmdWxseSBsYXN0KSB2ZXJzaW9uIG9mIHRoZSBwYXRjaC1z
ZXQgdG8gYWRkIHRoZQ0KPiBuZXcgc3Vic3lzdGVtIGZvciBjb21wdXRlIGFjY2VsZXJhdG9y
cy4gSSByZW1vdmVkIHRoZSBSRkMgaGVhZGxpbmUgYXMNCj4gSSBiZWxpZXZlIGl0IGlzIG5v
dyByZWFkeSBmb3IgbWVyZ2luZy4NCj4gDQo+IENvbXBhcmUgdG8gdjMsIHRoaXMgcGF0Y2gt
c2V0IGNvbnRhaW5zIG9uZSBhZGRpdGlvbmFsIHBhdGNoIHRoYXQgYWRkcw0KPiBkb2N1bWVu
dGF0aW9uIHJlZ2FyZGluZyB0aGUgYWNjZWwgc3Vic3lzdGVtLiBJIGhvcGUgaXQncyBnb29k
IGVub3VnaCBmb3INCj4gdGhpcyBzdGFnZS4gSW4gYWRkaXRpb24sIHRoZXJlIHdlcmUgZmV3
IHZlcnkgbWlub3IgZml4ZXMgYWNjb3JkaW5nIHRvDQo+IGNvbW1lbnRzIHJlY2VpdmVkIG9u
IHYzLg0KPiANCj4gVGhlIHBhdGNoZXMgYXJlIGluIHRoZSBmb2xsb3dpbmcgcmVwbzoNCj4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvb2dhYmJh
eS9hY2NlbC5naXQvbG9nLz9oPWFjY2VsX3Y0DQo+IA0KPiBBcyBpbiB2MywgVGhlIEhFQUQg
b2YgdGhhdCBicmFuY2ggaXMgYSBjb21taXQgYWRkaW5nIGEgZHVtbXkgZHJpdmVyIHRoYXQN
Cj4gcmVnaXN0ZXJzIGFuIGFjY2VsIGRldmljZSB1c2luZyB0aGUgbmV3IGZyYW1ld29yay4g
VGhpcyBjYW4gYmUgc2VydmVkDQo+IGFzIGEgc2ltcGxlIHJlZmVyZW5jZS4NCj4gDQo+IHYx
IGNvdmVyIGxldHRlcjoNCj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjIvMTAvMjIvNTQ0
DQo+IA0KPiB2MiBjb3ZlciBsZXR0ZXI6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xr
bWwvMjAyMjExMDIyMDM0MDUuMTc5NzQ5MS0xLW9nYWJiYXlAa2VybmVsLm9yZy9ULw0KPiAN
Cj4gdjMgY292ZXIgbGV0dGVyOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjIxMTA2MjEwMjI1LjIwNjUzNzEtMS1vZ2FiYmF5QGtlcm5lbC5vcmcvVC8NCj4gDQo+IFRo
YW5rcywNCj4gT2RlZC4NCj4gDQo+IE9kZWQgR2FiYmF5ICg0KToNCj4gICAgZHJpdmVycy9h
Y2NlbDogZGVmaW5lIGtjb25maWcgYW5kIHJlZ2lzdGVyIGEgbmV3IG1ham9yDQo+ICAgIGFj
Y2VsOiBhZGQgZGVkaWNhdGVkIG1pbm9yIGZvciBhY2NlbGVyYXRvciBkZXZpY2VzDQo+ICAg
IGRybTogaW5pdGlhbGl6ZSBhY2NlbCBmcmFtZXdvcmsNCj4gICAgZG9jOiBhZGQgZG9jdW1l
bnRhdGlvbiBmb3IgYWNjZWwgc3Vic3lzdGVtDQo+IA0KPiAgIERvY3VtZW50YXRpb24vYWNj
ZWwvaW5kZXgucnN0ICAgICAgICAgfCAgMTcgKysNCj4gICBEb2N1bWVudGF0aW9uL2FjY2Vs
L2ludHJvZHVjdGlvbi5yc3QgIHwgMTA5ICsrKysrKysrKw0KPiAgIERvY3VtZW50YXRpb24v
YWRtaW4tZ3VpZGUvZGV2aWNlcy50eHQgfCAgIDUgKw0KPiAgIERvY3VtZW50YXRpb24vc3Vi
c3lzdGVtLWFwaXMucnN0ICAgICAgfCAgIDEgKw0KPiAgIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDkgKw0KPiAgIGRyaXZlcnMvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDIgKw0KPiAgIGRyaXZlcnMvYWNjZWwvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgfCAgMjQgKysNCj4gICBkcml2ZXJzL2FjY2VsL2RybV9hY2NlbC5jICAg
ICAgICAgICAgIHwgMzIzICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAgICB8ICAgMSArDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2RybV9kcnYuYyAgICAgICAgICAgICB8IDEwMiArKysrKy0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZmlsZS5jICAgICAgICAgICAgfCAgIDIgKy0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vZHJtX3N5c2ZzLmMgICAgICAgICAgIHwgIDI0ICstDQo+ICAgaW5jbHVkZS9k
cm0vZHJtX2FjY2VsLmggICAgICAgICAgICAgICB8ICA5NyArKysrKysrKw0KPiAgIGluY2x1
ZGUvZHJtL2RybV9kZXZpY2UuaCAgICAgICAgICAgICAgfCAgIDMgKw0KPiAgIGluY2x1ZGUv
ZHJtL2RybV9kcnYuaCAgICAgICAgICAgICAgICAgfCAgIDggKw0KPiAgIGluY2x1ZGUvZHJt
L2RybV9maWxlLmggICAgICAgICAgICAgICAgfCAgMjEgKy0NCj4gICAxNiBmaWxlcyBjaGFu
Z2VkLCA3MTEgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vYWNjZWwvaW5kZXgucnN0DQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vYWNjZWwvaW50cm9kdWN0aW9uLnJzdA0KPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2FjY2VsL0tjb25maWcNCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9hY2NlbC9kcm1fYWNjZWwuYw0KPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBpbmNsdWRlL2RybS9kcm1fYWNjZWwuaA0KPiANCj4gLS0NCj4gMi4yNS4xDQo+IA0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------tXBKNrT2VYONmyy5XAPNe002--

--------------s5qUTgzlpoZ0MGGPNB4LCMlC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN7lGAFAwAAAAAACgkQlh/E3EQov+D5
jBAAwqCLFHp0hEtV6wSvRuEM6pdANaYCsJNrs9tSrCkEqr4zr8/RDikat6bF8GOxkYR2748Kk1bV
8B2lCBp2vWb7af/zeORyzHSoxPOycxiid7X4IFOuJ0W8zZ33fBLU0OQ1uJ5XfGz+8Nx1Z1B9pvow
x/ssXhviKzwvSvKi0uXuEXT0IOucjuBvBp6hXeHKh2TOzplt3+ns1K+lYOokzWfLfxuBoRGzaCEw
OgmozMBT9tdsgEAn0Ek1JG6dWqk5hVYMvfcRiQRX9y6A0IYkyFmX4F7pE/cBJSRylSTZJf23KQ8a
PgjFuUDHJlNeJZ9jSYyP6mzKquy2gx3XYwvJR7wcdnqo0aRWRD6EzeqSOeHMpdrAkMAjQUD8w+Y3
uS6H/Hcn7tRqTB2e/yJL+sJC4LRCwK3dmNi9DNoJlwhMju3t4W3vILwNPe0j4DlnZBh9T1He82md
yhiBXagxPKfXF0+FtcBiV3tZX4IGi0YGPR35FUkwgZYhYJnT6JwPn+os2ISh7lsiRknz0ePTjqnL
zcaz5BkK0AXsuCFw47GddVDyXtJQaHn1PLMC6T3dJle/zDG8Ct/pCoS+K2e/n3qOwRvuQ/CHoYPh
2VVPgnO15CPUdEpO0/MJ2czsG5kQkqz92/YzPIjz4V2eNKx9AyE07kAzrTlNzXhy/SsY0xOuKgU9
cM8=
=hrN2
-----END PGP SIGNATURE-----

--------------s5qUTgzlpoZ0MGGPNB4LCMlC--
