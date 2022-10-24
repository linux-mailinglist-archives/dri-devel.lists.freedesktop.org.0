Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679BC60A199
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 13:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74A510E35C;
	Mon, 24 Oct 2022 11:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB8810E35C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:29:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D3A81FD89;
 Mon, 24 Oct 2022 11:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666610959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t+yBCU/n5OQeanZ8RYIG7YqAogONgHtII+xcHgYeJsI=;
 b=tWX1dnW2/OzEOd/0go7yG4cw0L6VgHFK6tFnjB6y6RXhRGr6gGe8aAHlRhc86HM1tEIk6Q
 OvNMSaMI4qHZpUL804lSiYON8zRIK1L5wLeaLFaRNdPv8xZOMKuYZ142HKUDY4CuJ/5YDH
 FFcqIbQUbs9SpLSSo7m3d6lNL6y5a7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666610959;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t+yBCU/n5OQeanZ8RYIG7YqAogONgHtII+xcHgYeJsI=;
 b=9rjXRyW8w8ypmWgnRtWgFiuQi7Ru0I3/NWttfTkLZNc7JnWhARlqrNDbJOJarqlgsXiR7w
 JvGKVbIzKweHY0Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 049D813357;
 Mon, 24 Oct 2022 11:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4gIcAA93VmOnNwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Oct 2022 11:29:19 +0000
Message-ID: <105c2c1c-bce7-637d-9d25-a58e68bbbbab@suse.de>
Date: Mon, 24 Oct 2022 13:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
Content-Language: en-US
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kHZfBEtkDlAMX763NZfwgHBd"
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
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kHZfBEtkDlAMX763NZfwgHBd
Content-Type: multipart/mixed; boundary="------------tSyUlf9N8D20WQWim5hZddVD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Message-ID: <105c2c1c-bce7-637d-9d25-a58e68bbbbab@suse.de>
Subject: Re: [PATCH v5 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>

--------------tSyUlf9N8D20WQWim5hZddVD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTAuMjIgdW0gMTk6NTMgc2NocmllYiBNYWNpZWogS3dhcHVsaW5za2k6
DQo+IERlYXIga2VybmVsIG1haW50YWluZXJzLA0KPiANCj4gVGhpcyBzdWJtaXNzaW9uIGlz
IGEga2VybmVsIGRyaXZlciB0byBzdXBwb3J0IEludGVsKFIpIEdhdXNzaWFuICYgTmV1cmFs
DQo+IEFjY2VsZXJhdG9yIChJbnRlbChSKSBHTkEpLiBJbnRlbChSKSBHTkEgaXMgYSBQQ0kt
YmFzZWQgbmV1cmFsIGNvLXByb2Nlc3Nvcg0KPiBhdmFpbGFibGUgb24gbXVsdGlwbGUgSW50
ZWwgcGxhdGZvcm1zLiBBSSBkZXZlbG9wZXJzIGFuZCB1c2VycyBjYW4gb2ZmbG9hZA0KPiBj
b250aW51b3VzIGluZmVyZW5jZSB3b3JrbG9hZHMgdG8gYW4gSW50ZWwoUikgR05BIGRldmlj
ZSBpbiBvcmRlciB0byBmcmVlDQo+IHByb2Nlc3NvciByZXNvdXJjZXMgYW5kIHNhdmUgcG93
ZXIuIE5vaXNlIHJlZHVjdGlvbiBhbmQgc3BlZWNoIHJlY29nbml0aW9uDQo+IGFyZSB0aGUg
ZXhhbXBsZXMgb2YgdGhlIHdvcmtsb2FkcyBJbnRlbChSKSBHTkEgZGVhbHMgd2l0aCB3aGls
ZSBpdHMgdXNhZ2UNCj4gaXMgbm90IGxpbWl0ZWQgdG8gdGhlIHR3by4NCj4gDQo+IEZvciBh
IGxpc3Qgb2YgcHJvY2Vzc29ycyBlcXVpcHBlZCB3aXRoIEludGVsKFIpIEdOQSBkZXZpY2Us
IHBsZWFzZSByZWZlciB0bw0KPiB0aGlzIGxpbms6DQo+IGh0dHBzOi8vZG9jcy5vcGVudmlu
b3Rvb2xraXQub3JnL2xhdGVzdC9vcGVudmlub19kb2NzX0lFX0RHX3N1cHBvcnRlZF9wbHVn
aW5zX0dOQS5odG1sDQo+IA0KPiBXZSB0aGluayBjb250cmlidXRpbmcgdGhpcyBkcml2ZXIg
dG8gdGhlIHVwc3RyZWFtIGtlcm5lbCBwcm9qZWN0IGlzIHRoZQ0KPiBiZXN0IHdheSBmb3Ig
ZGV2ZWxvcGVycyBhbmQgdXNlcnMgdG8gZ2V0IHRoZSBsYXRlc3QgSW50ZWwoUikgR05BIHN1
cHBvcnQgaW4NCj4gYSBMaW51eCBrZXJuZWwsIHRocm91Z2ggdGhlIG1haW5saW5lIHRvIGFu
eSBMaW51eCBkaXN0cmlidXRpb25zIGluc3RhbGxlZA0KPiBvbiB0aGVpciBzeXN0ZW1zLiBV
cHN0cmVhbWluZyBhbHNvIGVuYWJsZXMgY29udHJpYnV0aW9uIGZyb20gZGV2ZWxvcGVycw0K
PiBhcm91bmQgdGhlIHdvcmxkIHRvIHRoZSBkcml2ZXIgb25jZSBpdCBpcyBtZXJnZWQuDQo+
IA0KPiBUaGUgZHJpdmVyIHdvcmtzIHdpdGggSW50ZWwoUikgbGlicmFyaWVzIGluIHVzZXIg
c3BhY2UuIFRoZSBJbnRlbChSKSBkcml2ZXINCj4gZXhwb3NlcyBhIGZldyBJT0NUTCBpbnRl
cmZhY2VzIGZvciB1c2UgYnkgbGlicmFyaWVzIGluIHVzZXIgc3BhY2UuIFRoZQ0KPiBsaWJy
YXJpZXMgYXJlIG9wZW4gc291cmNlZCBhbmQgYXJlIGF2YWlsYWJsZSBhdDoNCj4gaHR0cHM6
Ly9naXRodWIuY29tL2ludGVsL2duYQ0KDQpUaGlzIGRyaXZlciBhcHBlYXJzIHRvIGJlIGEg
Y2FuZGlkYXRlIGZvciB0aGUgYWNjZWwgc3Vic3lzdGVtIHRoYXQgaGFzIA0KYmVlbiBwcm9w
b3NlZCBoZXJlLiBbMV0gQXQgYSBtaW5pbXVtLCB5b3UnZCBub3cgZ2V0IHN0YW5kYXJkaXpl
ZCBmaWxlIA0KbmFtZXMuIExvbmd0ZXJtLCBJJ2QgZXhwZWN0IGRlZGljYXRlZCBoZWxwZXJz
IGZvciBhY2NlbCBkZXZpY2VzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNClsxXSAN
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC9ZMVZNWDlKNDRGSlpwMGRsQGty
b2FoLmNvbS9ULyNtOTc3ZWZhZWIzOWZjNWJlNTgxYWUwNWUxZGNjYmQ4OTY1NDZkYjk0Mw0K
DQo+IA0KPiAtLS0NCj4gDQo+IENoYW5nZWxvZ3M6DQo+IA0KPiAgIHYxLT52MjoNCj4gICAt
IGRyaXZlcidzIG5ldyBsYXlvdXQ6DQo+ICAgICAtIGRyaXZlciBuYW1lOiBnbmEgLT4gaW50
ZWxfZ25hDQo+ICAgICAtIG1vZHVsZSBuYW1lOiBnbmEgLT4gaW50ZWxfZ25hDQo+ICAgICAt
IGRldmljZSBmaWxlIG5hbWU6IC9kZXYvZ25hTiAtPiAvZGV2L2ludGVsX2duYU4NCj4gICAg
IC0gZHJpdmVyJ3Mgc291cmNlIGRpcmVjdG9yeTogZHJpdmVycy9taXNjL2duYS8gLT4gZHJp
dmVycy9taXNjL2ludGVsL2duYS8NCj4gICAgIC0gVUFQSTogaW5jbHVkZS91YXBpL21pc2Mv
Z25hLmggLT4gaW5jbHVkZS91YXBpL21pc2MvaW50ZWwvZ25hLmgNCj4gICAgIC0gRE9DOiBE
b2N1bWVudGF0aW9uL21pc2MtZGV2aWNlcy9nbmEucnN0IC0+DQo+ICAgICAgICAgRG9jdW1l
bnRhdGlvbi9taXNjLWRldmljZXMvaW50ZWwvZ25hLnJzdA0KPiAgIC0gJ01JU0MnIGRldmlj
ZSBmcmFtZXdvcmsgdXNlZA0KPiAgIC0gZml4ZXMgdGhyb3VnaG91dCBHTkEgZGV2aWNlJ3Mg
UENJIG1hbmFnZW1lbnQNCj4gICAtIGhlYWRlciBmaWxlcycgaW5jbHVkZXMgYW5kIGZvcndh
cmQgZGVjbGFyYXRpb25zIGNsZWFudXANCj4gICAtIElTUiBtYWRlIHN0YXRpYw0KPiAgIC0g
dW51c2VkIGNvbW1lbnRzIGNsZWFudXANCj4gICAtICJfcHJpdl8iIHNlZ21lbnQgcmVtb3Zl
ZCBmcm9tIGZ1bmN0aW9uIG5hbWVzDQo+ICAgLSB0ZXN0ZWQ6IHY1LjExLXJjMyAtPiB2NS4x
MQ0KPiAgIC0gbnVtYmVyIG9mIG90aGVyL21pbm9yIGZpeGVzDQo+IA0KPiAgIHYyLT52MzoN
Cj4gICAtIFBDSSBnbHVlIGRyaXZlciBwYXJ0IHNwbGl0Lg0KPiAgIC0gR05BIHByb2JlIGZh
aWwgcGF0aCBtYWRlIGZ1bGx5IGltcGxpY2l0Lg0KPiAgIC0gJ3JlY292ZXJ5X3RpbWVvdXQn
IG1vZHVsZSBwYXJhbWV0ZXIgcHJlc2VudCB1bmRlciAnQ09ORklHX0RFQlVHX0lOVEVMX0dO
QScgZmxhZyBvbmx5Lg0KPiAgIC0gYnVpbGQgZm9yIFg4Nl8zMiBlbmFibGVkLg0KPiAgIC0g
bW9kdWxlIGluaXRpYWxpemF0aW9uIHRocm91Z2ggJ21vZHVsZV9wY2lfZHJpdmVyKCknLg0K
PiAgIC0gZ25hX3ByaXYtPmZpbGVfbGlzdCBjbGVhbnVwLg0KPiAgIC0gJ2duYV8nIHByZWZp
eCByZW1vdmVkIGZyb20gc291cmNlIGZpbGVzJyBuYW1lcy4NCj4gICAtIHBvd2VyIG1hbmFn
ZW1lbnQgaGFuZGxpbmcgYWRkZWQuDQo+ICAgLSBudW1iZXIgb2Ygb3RoZXIvbWlub3IgZml4
ZXMNCj4gICAtIHRlc3RzIHBlcmZvcm1lZCBvbiBrZXJuZWwgdjUuMTINCj4gDQo+ICAgdjMt
PnY0Og0KPiAgIC0gR05BIGRyaXZlciBhZGFwdGVkIHRvIERSTSBmcmFtZXdvcmsgKCt1c2Vy
c3BhY2UgR05BIGxpYnJhcnkgYWRhcHRlZCB0byB1c2UgdGhlIGRyaXZlcikNCj4gICAgIC0g
ZHJtX21hbmFnZWQgKGRybW0pIGZlYXR1cmUgaXMgdXNlZCBmb3Igb2JqZWN0cyBsaWZldGlt
ZSBtYW5hZ2VtZW50DQo+ICAgICAtIEdOQSBtZW1vcnkgb2JqZWN0cyB1c2UgfmRybV9nZW1f
c2htZW1fb2JqZWN0fiBvYmplY3RzIGFzIGEgYmFzZQ0KPiAgIC0gcGF0Y2hlcyByZW9yZ2Fu
aXplZCB0byBtZWV0IHN5bWJvbHMnIHVzYWdlIHdpdGggdGhlaXIgZGVjbGFyYXRpb25zL2Rl
ZmluaXRpb25zDQo+ICAgLSAncmVjb3ZlcnlfdGltZW91dCcgbW9kdWxlIHBhcmFtZXRlciBy
ZW1vdmVkDQo+ICAgLSBudW1iZXIgb2Ygb3RoZXIvbWlub3IgZml4ZXMgZnJvbSB2MyByZXZp
ZXcNCj4gICAtIHRlc3RzIHBlcmZvcm1lZCBvbiBrZXJuZWwgdjYuMA0KPiANCj4gICB2NC0+
djU6DQo+ICAgLSBpbmRlbnRhdGlvbiBmaXhlZCBpbiBkcml2ZXJzL2dwdS9kcm0vZ25hL0tj
b25maWcNCj4gDQo+IE1hY2llaiBLd2FwdWxpbnNraSAoNCk6DQo+ICAgIGduYTogYWRkIFBD
SSBkcml2ZXIgbW9kdWxlDQo+ICAgIGduYTogYWRkIEdOQSBEUk0gZGV2aWNlDQo+ICAgIGdu
YTogYWRkIEdOQV9HRU1fTkVXIGFuZCBHTkFfR0VNX0ZSRUUgaW9jdGxzDQo+ICAgIGduYTog
YWRkIHBvd2VyIG1hbmFnZW1lbnQNCj4gDQo+IFRvbWFzeiBKYW5rb3dza2kgKDYpOg0KPiAg
ICBnbmE6IHJlYWQgaGFyZHdhcmUgaW5mbw0KPiAgICBnbmE6IGluaXRpYWxpemUgTU1VDQo+
ICAgIGduYTogYWRkIEdOQV9HRVRfUEFSQU1FVEVSIGlvY3RsDQo+ICAgIGduYTogYWRkIEdO
QV9DT01QVVRFIGlvY3RsDQo+ICAgIGduYTogYWRkIEdOQV9XQUlUIGlvY3RsDQo+ICAgIGdu
YTogYWRkIG9wZW4gYW5kIGNsb3NlIG9wZXJhdGlvbnMgb24gR05BIGRldmljZQ0KPiANCj4g
ICBEb2N1bWVudGF0aW9uL2dwdS9kcml2ZXJzLnJzdCAgICAgfCAgIDEgKw0KPiAgIERvY3Vt
ZW50YXRpb24vZ3B1L2duYS5yc3QgICAgICAgICB8ICA2NCArKysrKw0KPiAgIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArDQo+ICAgZHJpdmVycy9ncHUvZHJt
L0tjb25maWcgICAgICAgICAgIHwgICAyICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZp
bGUgICAgICAgICAgfCAgIDEgKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9nbmEvS2J1aWxkICAg
ICAgICB8ICAgNSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2duYS9LY29uZmlnICAgICAgIHwg
IDE1ICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vZ25hL2duYV9kZXZpY2UuYyAgfCAzMTcgKysr
KysrKysrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2duYS9nbmFfZGV2aWNl
LmggIHwgMTE0ICsrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2duYS9nbmFfZ2VtLmgg
ICAgIHwgIDIyICsrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2duYS9nbmFfaHcuYyAgICAgIHwg
MTEwICsrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2duYS9nbmFfaHcuaCAgICAgIHwg
MTA3ICsrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2duYS9nbmFfaW9jdGwuYyAgIHwg
MjA4ICsrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2duYS9nbmFfbWVtLmMg
ICAgIHwgMjQ5ICsrKysrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2duYS9n
bmFfbWVtLmggICAgIHwgIDU4ICsrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vZ25hL2duYV9w
Y2kuYyAgICAgfCAxNDggKysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9nbmEvZ25h
X3BjaS5oICAgICB8ICAxMiArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2duYS9nbmFfcmVxdWVz
dC5jIHwgNDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9nbmEvZ25hX3JlcXVlc3QuaCB8ICA2NCArKysrKw0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9nbmEvZ25hX3Njb3JlLmMgICB8IDIyMiArKysrKysrKysrKysrKysNCj4gICBkcml2
ZXJzL2dwdS9kcm0vZ25hL2duYV9zY29yZS5oICAgfCAgMTEgKw0KPiAgIGluY2x1ZGUvdWFw
aS9kcm0vZ25hX2RybS5oICAgICAgICB8IDE2OSArKysrKysrKysrKysNCj4gICAyMiBmaWxl
cyBjaGFuZ2VkLCAyMzQ3IGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9ncHUvZ25hLnJzdA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vZ25hL0tidWlsZA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vZ25hL0tjb25maWcNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL2duYS9nbmFfZGV2aWNlLmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncHUvZHJtL2duYS9nbmFfZGV2aWNlLmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2duYS9nbmFfZ2VtLmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2duYS9nbmFfaHcuYw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vZ25hL2duYV9ody5oDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS9nbmEvZ25hX2lvY3RsLmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2duYS9nbmFfbWVtLmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2duYS9nbmFfbWVtLmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2duYS9nbmFfcGNpLmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2duYS9nbmFfcGNpLmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2duYS9nbmFfcmVxdWVzdC5jDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9nbmEvZ25hX3JlcXVlc3QuaA0KPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vZ25hL2duYV9zY29yZS5jDQo+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9nbmEvZ25hX3Njb3JlLmgNCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS91YXBpL2RybS9nbmFfZHJtLmgNCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------tSyUlf9N8D20WQWim5hZddVD--

--------------kHZfBEtkDlAMX763NZfwgHBd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNWdw4FAwAAAAAACgkQlh/E3EQov+Ba
kBAAud3VbZRmbyDavJJnAXNmFzUDCX4veoZGMNyvIQQ2iy3/pZdyg2ThQLNJUGqNkE7i64VILcYd
LjB9ww00V8utV03d3pyZCoogjOrc3dyDwGcxxulbQ4qRoyOQk478clzTs2EZIYd6kdurrasy1FI6
Gv1OrWLlkguxjEfoaS5z0iwf+Q04NU/swWOj6b1swlP+WGO/sTCba2JJ50hXTfRpTI0RAMOihzbl
hsZVCoR7nzu+oNMlN2oaoRxZBpjtImHBZ3n57U93miU0bWY0Jmq99W/qh3QOwVOYksp/bSd5JQsH
B6d7qZOcZkqcnhfRIB74/WLPkKt7cWE6Bz/U8AyU1n/6h4MrxzEUKt7nT/pZkanGHhPdmJ+nPe5T
dMx8s/wobQSzh6E3pAv3Dz7rPPWlYVC4Zq0NQ2UIswklI6wFZcipWroIjueX9Otl2WiS9dVXCopy
AyL5RQx2mFU48PjpRAkMr64SC6slkAmF4hhXAfZBeo9BuGMa2qOKUW3720XEtN/YWr32owHpKQk6
u8AbnthTdyETRBmbYqE3tVQURxHKXCwlj4pYh01MOQGEDhUYzIQMldQuRMy3rtprq9r0GWbaPl36
tcvnOvYdNQywcztdmHfpz34vkfXWItFuPhJ5mwn/fJj2pr/JPx4kUBpvBG1G3q7coW12zCD3y1FP
ESk=
=fCw+
-----END PGP SIGNATURE-----

--------------kHZfBEtkDlAMX763NZfwgHBd--
