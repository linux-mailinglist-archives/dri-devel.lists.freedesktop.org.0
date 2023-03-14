Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEAA6B9AB7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 17:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C684C10E84F;
	Tue, 14 Mar 2023 16:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8939010E84C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 16:09:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 19A741F8B5;
 Tue, 14 Mar 2023 16:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678810175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V34Gc2z7vPN8OnVeCrHSmsPv1GE4iORsCJqUxRIkUNs=;
 b=xcY6MkbQroZ6h/KfEa+dhUc28+jiAPtyeyk2DtovFjjGI5XwGSNkQ9MKoON5PJSXxHZqS6
 rIH7AYalheshR8xOXoGqmNupJMf1IbzEB3YBopCssAkqlHptVul0AJCZpiFaQCIwMyrpB7
 Da/wrg/JcA4ehZeNUyzSdoHF/L2b85U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678810175;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V34Gc2z7vPN8OnVeCrHSmsPv1GE4iORsCJqUxRIkUNs=;
 b=/GrjtSos3fy4VOf4ycEmrurt5GZTahAkaHL0OLZuugwapt8xtWVpeqEHlx0ywIeOgNgk6e
 Foqwrhg7VOSBwiDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC2B113A26;
 Tue, 14 Mar 2023 16:09:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3MPYMD6cEGRlWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Mar 2023 16:09:34 +0000
Message-ID: <85c3029e-796d-3c3f-7f4c-9c2552312e4c@suse.de>
Date: Tue, 14 Mar 2023 17:09:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/25] drm/dma-helper: Add dedicated fbdev emulation
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 linus.walleij@linaro.org
References: <20230313155138.20584-1-tzimmermann@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------en9l0DwBxcBWW0NhRIAsEb20"
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------en9l0DwBxcBWW0NhRIAsEb20
Content-Type: multipart/mixed; boundary="------------A0DTXeDh2q5iHYwnkuQuoTIq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 linus.walleij@linaro.org
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Message-ID: <85c3029e-796d-3c3f-7f4c-9c2552312e4c@suse.de>
Subject: Re: [PATCH v2 00/25] drm/dma-helper: Add dedicated fbdev emulation
References: <20230313155138.20584-1-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>

--------------A0DTXeDh2q5iHYwnkuQuoTIq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TWVyZ2VkIGludG8gZHJtLW1pc2MtbmV4dC4gVGhhbmtzIGEgbG90IGZvciByZXZpZXdzIGFu
ZCBjb21tZW50cy4NCg0KQW0gMTMuMDMuMjMgdW0gMTY6NTEgc2NocmllYiBUaG9tYXMgWmlt
bWVybWFubjoNCj4gQWRkIGZiZGV2IGVtdWxhdGlvbiB0aGF0IGlzIG9wdGltaXplZCBmb3Ig
RE1BIGhlbHBlcnMsIGFzIHVzZWQgYnkgbW9zdA0KPiBkcml2ZXJzLiBJdCBvcGVyYXRlcyBk
aXJlY3RseSBvbiBHRU0gRE1BIGJ1ZmZlcnMgaW4gc3lzdGVtIG1lbW9yeS4NCj4gTWVtb3J5
IHBhZ2VzIGFyZSBtbWFwJ2VkIGRpcmVjdGx5IHRvIHVzZXJzcGFjZS4gTm8gaW1wbGljaXQg
c2hhZG93DQo+IGJ1ZmZlcnMgbmVlZCB0byBiZSBhbGxvY2F0ZWQ7IGFzIGNhbiBoYXBwZW4g
d2l0aCB0aGUgZ2VuZXJpYyBmYmRldg0KPiBlbXVsYXRpb24uIENvbnZlcnQgZHJpdmVycyB0
aGF0IGZ1bGZpbCB0aGUgcmVxdWlyZW1lbnRzLg0KPiANCj4gVGVzdGVkIHdpdGggZmJjb24g
YW5kIElHVCBvbiB2YzQuDQo+IA0KPiBGdXR1cmUgZGlyZWN0aW9uOiBwcm92aWRpbmcgYSBk
ZWRpY2F0ZWQgZmJkZXYgZW11bGF0aW9uIGZvciBHRU0gRE1BDQo+IGhlbHBlcnMgd2lsbCBh
bGxvdyB1cyB0byByZW1vdmUgdGhpcyBjYXNlIGZyb20gdGhlIGdlbmVyaWMgZmJkZXYgY29k
ZS4NCj4gVGhlIGxhdHRlciBjYW4gdGhlbiBiZSBzaW1wbGlmaWVkLg0KPiANCj4gdjI6DQo+
IAkqIHVwZGF0ZSBtY2RlIGFuZCBwbDExMSBhcyB3ZWxsIChMaW51cykNCj4gDQo+IExpbnVz
IFdhbGxlaWogKDEpOg0KPiAgICBkcm0vbWNkZTogRG8gbm90IHVzZSBkaXJ0eSBHRU0gRkIg
aGFuZGxpbmcNCj4gDQo+IFRob21hcyBaaW1tZXJtYW5uICgyNCk6DQo+ICAgIGRybS9mYmRl
di1kbWE6IEltcGxlbWVudCBmYmRldiBlbXVsYXRpb24gZm9yIEdFTSBETUEgaGVscGVycw0K
PiAgICBhcm0vaGRsY2Q6IFVzZSBHRU0gRE1BIGZiZGV2IGVtdWxhdGlvbg0KPiAgICBhcm0v
bWFsaWRwOiBVc2UgR0VNIERNQSBmYmRldiBlbXVsYXRpb24NCj4gICAgZHJtL2FzcGVlZDog
VXNlIEdFTSBETUEgZmJkZXYgZW11bGF0aW9uDQo+ICAgIGRybS9hdG1lbC1obGNkYzogVXNl
IEdFTSBETUEgZmJkZXYgZW11bGF0aW9uDQo+ICAgIGRybS9mc2wtZGN1OiBVc2UgR0VNIERN
QSBmYmRldiBlbXVsYXRpb24NCj4gICAgZHJtL2lteC9kY3NzOiBVc2UgR0VNIERNQSBmYmRl
diBlbXVsYXRpb24NCj4gICAgZHJtL2lteDogVXNlIEdFTSBETUEgZmJkZXYgZW11bGF0aW9u
DQo+ICAgIGRybS9rbWI6IFVzZSBHRU0gRE1BIGZiZGV2IGVtdWxhdGlvbg0KPiAgICBkcm0v
bG9naWN2YzogVXNlIEdFTSBETUEgZmJkZXYgZW11bGF0aW9uDQo+ICAgIGRybS9tZXNvbjog
VXNlIEdFTSBETUEgZmJkZXYgZW11bGF0aW9uDQo+ICAgIGRybS9teHNmYi9sY2RpZjogVXNl
IEdFTSBETUEgZmJkZXYgZW11bGF0aW9uDQo+ICAgIGRybS9teHNmYjogVXNlIEdFTSBETUEg
ZmJkZXYgZW11bGF0aW9uDQo+ICAgIGRybS9zdGk6IFVzZSBHRU0gRE1BIGZiZGV2IGVtdWxh
dGlvbg0KPiAgICBkcm0vc3RtOiBVc2UgR0VNIERNQSBmYmRldiBlbXVsYXRpb24NCj4gICAg
ZHJtL3N1bjRpOiBVc2UgR0VNIERNQSBmYmRldiBlbXVsYXRpb24NCj4gICAgZHJtL3RpZHNz
OiBVc2UgR0VNIERNQSBmYmRldiBlbXVsYXRpb24NCj4gICAgZHJtL3RpbGNkYzogVXNlIEdF
TSBETUEgZmJkZXYgZW11bGF0aW9uDQo+ICAgIGRybS9hcmNwZ3U6IFVzZSBHRU0gRE1BIGZi
ZGV2IGVtdWxhdGlvbg0KPiAgICBkcm0vdHZlMjAwOiBVc2UgR0VNIERNQSBmYmRldiBlbXVs
YXRpb24NCj4gICAgZHJtL3ZjNDogVXNlIEdFTSBETUEgZmJkZXYgZW11bGF0aW9uDQo+ICAg
IGRybS94bG54OiBVc2UgR0VNIERNQSBmYmRldiBlbXVsYXRpb24NCj4gICAgZHJtL21jZGU6
IFVzZSBHRU0gRE1BIGZiZGV2IGVtdWxhdGlvbg0KPiAgICBkcm0vcGwxMTE6IFVzZSBHRU0g
RE1BIGZiZGV2IGVtdWxhdGlvbg0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FybS9o
ZGxjZF9kcnYuYyAgICAgICAgICAgICAgfCAgIDQgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
YXJtL21hbGlkcF9kcnYuYyAgICAgICAgICAgICB8ICAgNCArLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hc3BlZWQvYXNwZWVkX2dmeF9kcnYuYyAgICAgIHwgICA0ICstDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMgfCAgIDQgKy0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2RtYS5jICAgICAgICAgICAgICB8IDI3NSArKysr
KysrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9k
cm1fZHJ2LmMgICAgfCAgIDQgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaW14L2Rjc3MvZGNz
cy1rbXMuYyAgICAgICAgICB8ICAgNCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1
djMvaW14LWRybS1jb3JlLmMgICAgIHwgICA0ICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2tt
Yi9rbWJfZHJ2LmMgICAgICAgICAgICAgICAgfCAgIDQgKy0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vbG9naWN2Yy9sb2dpY3ZjX2RybS5jICAgICAgICB8ICAgNCArLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9tY2RlL21jZGVfZHJ2LmMgICAgICAgICAgICAgIHwgICA2ICstDQo+ICAgZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jICAgICAgICAgICAgfCAgIDQgKy0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vbXhzZmIvbGNkaWZfZHJ2LmMgICAgICAgICAgICB8ICAgNCAr
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYyAgICAgICAgICAgIHwg
ICA0ICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rydi5jICAgICAgICAg
ICAgfCAgIDQgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYuYyAgICAgICAg
ICAgICAgICB8ICAgNCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMgICAgICAg
ICAgICAgICAgICAgIHwgICA0ICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRp
X2Rydi5jICAgICAgICAgICAgfCAgIDQgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlkc3Mv
dGlkc3NfZHJ2LmMgICAgICAgICAgICB8ICAgNCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90
aWxjZGMvdGlsY2RjX2Rydi5jICAgICAgICAgIHwgICA0ICstDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3RpbnkvYXJjcGd1LmMgICAgICAgICAgICAgICAgfCAgIDQgKy0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vdHZlMjAwL3R2ZTIwMF9kcnYuYyAgICAgICAgICB8ICAgNCArLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jICAgICAgICAgICAgICAgIHwgICA0ICstDQo+
ICAgZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2ttcy5jICAgICAgICAgICAgfCAgIDQg
Ky0NCj4gICBpbmNsdWRlL2RybS9kcm1fZmJkZXZfZG1hLmggICAgICAgICAgICAgICAgICB8
ICAxNSArDQo+ICAgMjYgZmlsZXMgY2hhbmdlZCwgMzM4IGluc2VydGlvbnMoKyksIDQ3IGRl
bGV0aW9ucygtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiZGV2X2RtYS5jDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2RybV9m
YmRldl9kbWEuaA0KPiANCj4gDQo+IGJhc2UtY29tbWl0OiBiMjFjZWQ3N2FlMWRiYzNkOGIw
MWQzYWVmM2M5OWJiYTczNzdhNjliDQo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogMGFhMzU5
ZjYxNDRjNDAxNWMxNDBjOGE2NzUwYmUxOTA5OWM2NzZmYg0KPiBwcmVyZXF1aXNpdGUtcGF0
Y2gtaWQ6IGM2N2U1ZDg4NmE0N2I3ZDAyNjZkODExMDA4Mzc1NTdmZGEzNGNiMjQNCj4gcHJl
cmVxdWlzaXRlLXBhdGNoLWlkOiAzZjIwNDUxMGZjYmY5NTMwZDY1NDBiZDhlNjEyOGNjZTU5
ODk4OGI2DQo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogNzVmMmViZjEyNjkzZjIzNTA4ZjAw
ZDU3NGIyYjU3NDg4NzIzZTQ3NA0KPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDcxODUzMWJm
NWNmMTU3MTY4MzRjZmFmMzAwOGVhMGUyMzY2ZWM5MjcNCj4gcHJlcmVxdWlzaXRlLXBhdGNo
LWlkOiBhNzkzYWEyODNjZjQxZjI5MGQ5NzA0MDQ4ODFmMjRiZmZjNDhjYWZmDQo+IHByZXJl
cXVpc2l0ZS1wYXRjaC1pZDogZTc0ZjI1OWQxOTIzMjQ3YTc0ZDViZjdkOTk2YWZiMGU2Y2Ew
MTg4Mw0KPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGExZDEyYjk1NDgxMTBiMWY1ZTlhYTM4
MDNiMjFlMmE3ZjlmOGMxOWQNCj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiAwMzNmMTBkYTcy
ZjEwZDgyZjExM2E1MDY2YTNiM2E3ZmY5MWQxM2FhDQo+IHByZXJlcXVpc2l0ZS1wYXRjaC1p
ZDogOTc2MjY0ZmFmYmQ2OWQwOTk2MjA5YTkwYTNkNTQ2ZDliZTNmMzc3OQ0KPiBwcmVyZXF1
aXNpdGUtcGF0Y2gtaWQ6IDYxN2M3NGFmNWUxNjcxNzg5OGEyM2NlZDljOGJhZGZmZjFlMGFk
ZTcNCj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiA1ZTBjZmE5YzgxYWE3Y2ViMmNjNDhjNWNi
Yzk5MzQ0OTYyNTFmYWM0DQo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogMTM1OTRjM2NjODEw
Mjk2MGJiMTk1YmM3ZjU3MmZlZmJhOGViMTlkNw0KPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6
IDk5ZDlkYTdlMDgzNjkwNTBkMTM1YzIzZDMyZGVhZDgxMWJiOWNmOTcNCj4gcHJlcmVxdWlz
aXRlLXBhdGNoLWlkOiA4MzNmOWQ4MzQxYTI4Nzk2MWVlNjUzYjA0NzMwZGE1N2NlOTg3YjA2
DQo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogNWQ1YzljYWFmOTQ4OWE2YzJmNjg4ZDYzMmE1
N2EwZmI2NWZjYjVmNw0KPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGI2NDc1OGVjZDY0ZWMw
YzBhY2Q5NmQwNzY2YmE4OTEzNzhjNWM1MzkNCj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiAz
N2E3ZDNlOWZiM2U0ZTJiN2ViZWFjM2Y3N2RhNjYxMGYxMmJlZWEzDQo+IHByZXJlcXVpc2l0
ZS1wYXRjaC1pZDogOTkwNzM0MjlkYWZkYzk4Y2RkMzE0NjRjZTI4ZTc5NTY5NmExNDlmOQ0K
PiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGMyMjQ3ZWNhNDQ5Mjc1NjljZDJiNmQ5ZjM3MDE5
NTk2NTM0NmFkYjQNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------A0DTXeDh2q5iHYwnkuQuoTIq--

--------------en9l0DwBxcBWW0NhRIAsEb20
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQQnD4FAwAAAAAACgkQlh/E3EQov+Ds
zA//eGDlQBjEUQR7gg0qMH1dwstBZ5Jd794YT7sYGGI2b3gCe8OevwaZxHi39cyvSAj88wxQoTlF
ZlZ6wfQs+TPZA4UpfPZmPIaT/XVUvMHXzUzE2FRvm05SkAht4DCXn+DZfhQGgKoqW/MvFM/WUkAe
dU0DphygusHBSU1++fdpzjXYTnYyEbtfziSVhyomvlqM/wOmn88OjK6zuuuBeiYOU5gtqkAU9shU
4cFNFYA4RGy+Acr7GL5tOFLKH5xkVljVZj+kQvwBymCHz+TXzG7oYUUcIyGGJ42zUmQuj2bAsHYD
8RyMEcTVOGAAG0R4pRIG/4x9uL2Wya3RW84aMjwAPcUavMK+XvfHLZz9dedVOjhcJjFn99iK5AKa
/r4hc/HjRa3wNOcXxYxVDd7GoiLqMH67vuQZVFTEwn9jwX9GiwrzzzJrAvELvfW80VH3aQZ1Z6OA
cvE5VNA/FvfENo0ESsl4vXpGm9TjJaHePCLDMVfwEYZAqkNcQghQwuIWRsRIg3IGh00V9K0rMqug
uwBhAVSzEpyg2vE9AvTkH5pXg1GZAFo+fXaK9J6SH1srRzeO/v/Qlg1R2915qQasBPYGd2W/eJ9/
qUXWQY43RLjONtodxXdwmCUDKJFvIJRCRpu3R7uIBNNzdCMqybTVVOj3j6CksM5kvdMDGyRg1ti4
les=
=24Iy
-----END PGP SIGNATURE-----

--------------en9l0DwBxcBWW0NhRIAsEb20--
