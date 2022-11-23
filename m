Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FBF635511
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055AC10E1F1;
	Wed, 23 Nov 2022 09:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C5310E1F1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:15:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E43A21ED8;
 Wed, 23 Nov 2022 09:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669194899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TesqVfjMyNRFZFKfI6zWUWytkJUgK9xbWRtb3/3CsfM=;
 b=NSTnR9kBmaaDrBVbM0RO48aKmKophuPcefBAL1Bz1PjAfFQA+5mlrpG1/041L5KUzheK5e
 a9Ve1gwsmm/jjoJg962sbKy6i1N31Q90jGleunjABnUVfqedop2ty7JO3rjhS5QCmHbkPz
 cFDURSaBc9WQGL9tjxZLjH+WHyFtPQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669194899;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TesqVfjMyNRFZFKfI6zWUWytkJUgK9xbWRtb3/3CsfM=;
 b=83KSUKnUIiNvYq2SU5VWRpwkjTutUMtYo9Ur4kUd4A8ffqOao7LJsX8T1eTAOnURece+Is
 DZ/cRFCp+sTKFlCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65FB513A37;
 Wed, 23 Nov 2022 09:14:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CfUZF5PkfWPqCQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 09:14:59 +0000
Message-ID: <1ad9d5e4-8097-1545-787a-81197c020195@suse.de>
Date: Wed, 23 Nov 2022 10:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/6] drm/gud: Fix UBSAN warning
Content-Language: en-US
To: noralf@tronnes.org, stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-2-9de3afa3383e@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221122-gud-shadow-plane-v1-2-9de3afa3383e@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0a4uJaEKVX775OSOc6hxrNEt"
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
--------------0a4uJaEKVX775OSOc6hxrNEt
Content-Type: multipart/mixed; boundary="------------oZWpsheGohW0PaQxQCFRvJAp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: noralf@tronnes.org, stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <1ad9d5e4-8097-1545-787a-81197c020195@suse.de>
Subject: Re: [PATCH 2/6] drm/gud: Fix UBSAN warning
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-2-9de3afa3383e@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v1-2-9de3afa3383e@tronnes.org>

--------------oZWpsheGohW0PaQxQCFRvJAp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIyLjExLjIyIHVtIDIxOjU4IHNjaHJpZWIgTm9yYWxmIFRyw7hubmVzIHZpYSBC
NCBTdWJtaXNzaW9uIEVuZHBvaW50Og0KPiBGcm9tOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4NCj4gDQo+IFVCU0FOIGNvbXBsYWlucyBhYm91dCBpbnZhbGlkIHZh
bHVlIGZvciBib29sOg0KPiANCj4gWyAgMTAxLjE2NTE3Ml0gW2RybV0gSW5pdGlhbGl6ZWQg
Z3VkIDEuMC4wIDIwMjAwNDIyIGZvciAyLTMuMjoxLjAgb24gbWlub3IgMQ0KPiBbICAxMDEu
MjEzMzYwXSBndWQgMi0zLjI6MS4wOiBbZHJtXSBmYjE6IGd1ZGRybWZiIGZyYW1lIGJ1ZmZl
ciBkZXZpY2UNCj4gWyAgMTAxLjIxMzQyNl0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50
ZXJmYWNlIGRyaXZlciBndWQNCj4gWyAgMTAxLjk4OTQzMV0gPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCj4gWyAgMTAxLjk4OTQ0MV0gVUJTQU46IGludmFsaWQtbG9hZCBpbiAvaG9t
ZS9waS9saW51eC9pbmNsdWRlL2xpbnV4L2lvc3lzLW1hcC5oOjI1Mzo5DQo+IFsgIDEwMS45
ODk0NDddIGxvYWQgb2YgdmFsdWUgMTIxIGlzIG5vdCBhIHZhbGlkIHZhbHVlIGZvciB0eXBl
ICdfQm9vbCcNCj4gWyAgMTAxLjk4OTQ1MV0gQ1BVOiAxIFBJRDogNDU1IENvbW06IGt3b3Jr
ZXIvMTo2IE5vdCB0YWludGVkIDUuMTguMC1yYzUtZ3VkLTUuMTgtcmM1ICMzDQo+IFsgIDEw
MS45ODk0NTZdIEhhcmR3YXJlIG5hbWU6IEhld2xldHQtUGFja2FyZCBIUCBFbGl0ZUJvb2sg
ODIwIEcxLzE5OTEsIEJJT1MgTDcxIFZlci4gMDEuNDQgMDQvMTIvMjAxOA0KPiBbICAxMDEu
OTg5NDU5XSBXb3JrcXVldWU6IGV2ZW50c19sb25nIGd1ZF9mbHVzaF93b3JrIFtndWRdDQo+
IFsgIDEwMS45ODk0NzFdIENhbGwgVHJhY2U6DQo+IFsgIDEwMS45ODk0NzRdICA8VEFTSz4N
Cj4gWyAgMTAxLjk4OTQ3OV0gIGR1bXBfc3RhY2tfbHZsKzB4NDkvMHg1Zg0KPiBbICAxMDEu
OTg5NDg4XSAgZHVtcF9zdGFjaysweDEwLzB4MTINCj4gWyAgMTAxLjk4OTQ5M10gIHVic2Fu
X2VwaWxvZ3VlKzB4OS8weDNiDQo+IFsgIDEwMS45ODk0OThdICBfX3Vic2FuX2hhbmRsZV9s
b2FkX2ludmFsaWRfdmFsdWUuY29sZCsweDQ0LzB4NDkNCj4gWyAgMTAxLjk4OTUwNF0gIGRt
YV9idWZfdm1hcC5jb2xkKzB4MzgvMHgzZA0KPiBbICAxMDEuOTg5NTExXSAgPyBmaW5kX2J1
c2llc3RfZ3JvdXArMHg0OC8weDMwMA0KPiBbICAxMDEuOTg5NTIwXSAgZHJtX2dlbV9zaG1l
bV92bWFwKzB4NzYvMHgxYjAgW2RybV9zaG1lbV9oZWxwZXJdDQo+IFsgIDEwMS45ODk1Mjhd
ICBkcm1fZ2VtX3NobWVtX29iamVjdF92bWFwKzB4OS8weGIgW2RybV9zaG1lbV9oZWxwZXJd
DQo+IFsgIDEwMS45ODk1MzVdICBkcm1fZ2VtX3ZtYXArMHgyNi8weDYwIFtkcm1dDQo+IFsg
IDEwMS45ODk1OTRdICBkcm1fZ2VtX2ZiX3ZtYXArMHg0Ny8weDE1MCBbZHJtX2ttc19oZWxw
ZXJdDQo+IFsgIDEwMS45ODk2MzBdICBndWRfcHJlcF9mbHVzaCsweGMxLzB4NzEwIFtndWRd
DQo+IFsgIDEwMS45ODk2MzldICA/IF9yYXdfc3Bpbl9sb2NrKzB4MTcvMHg0MA0KPiBbICAx
MDEuOTg5NjQ4XSAgZ3VkX2ZsdXNoX3dvcmsrMHgxZTAvMHg0MzAgW2d1ZF0NCj4gWyAgMTAx
Ljk4OTY1M10gID8gX19zd2l0Y2hfdG8rMHgxMWQvMHg0NzANCj4gWyAgMTAxLjk4OTY2NF0g
IHByb2Nlc3Nfb25lX3dvcmsrMHgyMWYvMHgzZjANCj4gWyAgMTAxLjk4OTY3M10gIHdvcmtl
cl90aHJlYWQrMHgyMDAvMHgzZTANCj4gWyAgMTAxLjk4OTY3OV0gID8gcmVzY3Vlcl90aHJl
YWQrMHgzOTAvMHgzOTANCj4gWyAgMTAxLjk4OTY4NF0gIGt0aHJlYWQrMHhmZC8weDEzMA0K
PiBbICAxMDEuOTg5NjkwXSAgPyBrdGhyZWFkX2NvbXBsZXRlX2FuZF9leGl0KzB4MjAvMHgy
MA0KPiBbICAxMDEuOTg5Njk2XSAgcmV0X2Zyb21fZm9yaysweDIyLzB4MzANCj4gWyAgMTAx
Ljk4OTcwNl0gIDwvVEFTSz4NCj4gWyAgMTAxLjk4OTcwOF0gPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCj4gDQo+IFRoZSBzb3VyY2Ugb2YgdGhpcyB3YXJuaW5nIGlzIGluIGlvc3lz
X21hcF9jbGVhcigpIGNhbGxlZCBmcm9tDQo+IGRtYV9idWZfdm1hcCgpLiBJdCBjb25kaXRp
b25hbGx5IHNldHMgdmFsdWVzIGJhc2VkIG9uIG1hcC0+aXNfaW9tZW0uIFRoZQ0KPiBpb3N5
c19tYXAgdmFyaWFibGVzIGFyZSBhbGxvY2F0ZWQgdW5pbml0aWFsaXplZCBvbiB0aGUgc3Rh
Y2sgbGVhZGluZyB0bw0KPiAtPmlzX2lvbWVtIGhhdmluZyBhbGwga2luZHMgb2YgdmFsdWVz
IGFuZCBub3Qgb25seSAwLzEuDQo+IA0KPiBGaXggdGhpcyBieSB6ZXJvaW5nIHRoZSBpb3N5
c19tYXAgdmFyaWFibGVzLg0KPiANCj4gRml4ZXM6IDQwZTFhNzBiNGFlZCAoImRybTogQWRk
IEdVRCBVU0IgRGlzcGxheSBkcml2ZXIiKQ0KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc+ICMgdjUuMTgrDQo+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxm
QHRyb25uZXMub3JnPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRf
cGlwZS5jIHwgNCArKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ3Vk
L2d1ZF9waXBlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMNCj4gaW5kZXgg
N2M2ZGMyYmNkMTRhLi42MWY0YWJhZjE4MTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ndWQvZ3VkX3BpcGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9w
aXBlLmMNCj4gQEAgLTE1Nyw4ICsxNTcsOCBAQCBzdGF0aWMgaW50IGd1ZF9wcmVwX2ZsdXNo
KHN0cnVjdCBndWRfZGV2aWNlICpnZHJtLCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwN
Cj4gICB7DQo+ICAgCXN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmltcG9ydF9hdHRhY2gg
PSBmYi0+b2JqWzBdLT5pbXBvcnRfYXR0YWNoOw0KPiAgIAl1OCBjb21wcmVzc2lvbiA9IGdk
cm0tPmNvbXByZXNzaW9uOw0KPiAtCXN0cnVjdCBpb3N5c19tYXAgbWFwW0RSTV9GT1JNQVRf
TUFYX1BMQU5FU107DQo+IC0Jc3RydWN0IGlvc3lzX21hcCBtYXBfZGF0YVtEUk1fRk9STUFU
X01BWF9QTEFORVNdOw0KPiArCXN0cnVjdCBpb3N5c19tYXAgbWFwW0RSTV9GT1JNQVRfTUFY
X1BMQU5FU10gPSB7IH07DQo+ICsJc3RydWN0IGlvc3lzX21hcCBtYXBfZGF0YVtEUk1fRk9S
TUFUX01BWF9QTEFORVNdID0geyB9Ow0KPiAgIAlzdHJ1Y3QgaW9zeXNfbWFwIGRzdDsNCj4g
ICAJdm9pZCAqdmFkZHIsICpidWY7DQo+ICAgCXNpemVfdCBwaXRjaCwgbGVuOw0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------oZWpsheGohW0PaQxQCFRvJAp--

--------------0a4uJaEKVX775OSOc6hxrNEt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN95JIFAwAAAAAACgkQlh/E3EQov+C7
Iw/+LahG2rqbSM1QtwnQw0f64B9pQlbNK3tF7dXlnwX0b+TLCKBDLf0hOkb87HW6t7W2ruYnJ/Ui
5SlYeSsIS5YaNWLnpj8FlTA9H17n1RT5cFpiu5dJ7KmdxBzssSkuJIUXZbu73sXB4UZRmGw+q80Z
TykdhDu3YdwxHOrWVTFRhwGJATT2tiB++o96FpMzsROgmYeKV1t6ofVcSMe7zM2cZVgmuQEzl608
hmXFfyTfted+TP5laEhUD3aYwkjGUcfOSDTQjYHEtpPr2312pUAUWLc2Xn7yqhZJbXXbeOFeOdMN
GyWrdOo56n2rjPjsPc2pR5qx80KdBgv9ei+7+AUoHv8p0bPdpd654vWEECtFHKq5VfKXAwMT5gaP
+a5dOXNCgbxgqVrwFfuQc2QVdh58oeCktbHYcPr06aXPCTzarVBbyXuK0TB8C9W5XtMt6ce1BLY1
SD3qt39rbtCwB9h5z+eVLmzCIgJ5n9Lytkl+lPTP5T4G4vHqp/6R8kKGay+bB+kIeEjMwYp15+zV
FVSF+G+l6biMGIsNC0Rb7iTJfPQVw7A6nMF8berBEOl4OPvDRMopRVL26isatftifbksqUWhUEzI
1TgzlQNzuU2XuWKeRvD84NAT/sE3vUnv3brz6n9Ky5Y93YsJLEDqGjcql2cDqZCYVJ83xNB5JqFX
gvU=
=k9ct
-----END PGP SIGNATURE-----

--------------0a4uJaEKVX775OSOc6hxrNEt--
