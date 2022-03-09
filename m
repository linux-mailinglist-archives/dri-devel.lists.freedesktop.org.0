Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C64D54D2AF5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 09:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3921E10E647;
	Wed,  9 Mar 2022 08:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2551D10E631
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 08:52:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C7DA4210F2;
 Wed,  9 Mar 2022 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646815968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hn9XmNz6ru7zu27fAF1V5T6KmOJe9KRELjpskA9moWU=;
 b=Ux/oCoCX+3skRO3xPqIbJkfqh/AJ+Ma+Qj9jLiekwg7PYHpSs3sOmBrTqKaoPZi6hNqs4W
 NynEhF79WbUjBWBVqrLKMaAsn7KWNieC6V+hHn5dmexzco2b89IZ2lZwGTxyp79tgUePFA
 fxgOeV6w7qp4MsIdl1LNFoxVEiRfrvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646815968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hn9XmNz6ru7zu27fAF1V5T6KmOJe9KRELjpskA9moWU=;
 b=ojMXDfOzCX2ATmAg6b62tOVSYSOA+29RgXxfURgt10vA2SY8062n6djj06vWxNI1VxE38g
 LCXKxxVk97itxQDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 94F8513B71;
 Wed,  9 Mar 2022 08:52:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M2dLI+BqKGJmFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Mar 2022 08:52:48 +0000
Message-ID: <971ff2e6-adda-17ee-d002-5b32403d344f@suse.de>
Date: Wed, 9 Mar 2022 09:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 9/9] drm/virtio: Implement dumb_create_fbdev with GEM
 SHMEM helpers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-10-tzimmermann@suse.de>
 <b1af16e7-a20f-5499-6234-c5090349305f@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b1af16e7-a20f-5499-6234-c5090349305f@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZDBwYEaWyJP59f8X0ssMNQPe"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZDBwYEaWyJP59f8X0ssMNQPe
Content-Type: multipart/mixed; boundary="------------PshAy3Sl7hBgC0ALJUdt0hAf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <971ff2e6-adda-17ee-d002-5b32403d344f@suse.de>
Subject: Re: [PATCH 9/9] drm/virtio: Implement dumb_create_fbdev with GEM
 SHMEM helpers
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-10-tzimmermann@suse.de>
 <b1af16e7-a20f-5499-6234-c5090349305f@redhat.com>
In-Reply-To: <b1af16e7-a20f-5499-6234-c5090349305f@redhat.com>

--------------PshAy3Sl7hBgC0ALJUdt0hAf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDMuMjIgdW0gMjA6Mzcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDMvMy8yMiAyMTo1OCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBJbXBsZW1lbnQgc3RydWN0IGRybV9kcml2ZXIuZHVtYl9jcmVhdGVfZmJkZXYgd2l0aCB0
aGUgaGVscGVycw0KPj4gcHJvdmlkZWQgYnkgR0VNIFNITUVNLiBGYmRldiBkZWZlcnJlZCBJ
L08gd2lsbCBub3cgd29yayB3aXRob3V0DQo+PiBhbiBpbnRlcm1lZGlhdGUgc2hhZG93IGJ1
ZmZlciBmb3IgbW1hcC4NCj4+DQo+PiBBcyB0aGUgdmlydGlvIGRyaXZlciByZXBsYWNlcyBz
ZXZlcmFsIG9mIHRoZSByZWd1bGFyIEdFTSBTSE1FTQ0KPj4gZnVuY3Rpb25zIHdpdGggaXRz
IG93biBpbXBsZW1lbnRhdGlvbiwgc29tZSBhZGRpdGlvbmFsIGNvZGUgaXMNCj4+IG5lY2Vz
c2FyeSBtYWtlIGZiZGV2IG9wdGltaXphdGlvbiB3b3JrLiBFc3BlY2lhbGx5LCB0aGUgZHJp
dmVyDQo+PiBoYXMgdG8gcHJvdmlkZSBidWZmZXItb2JqZWN0IGZ1bmN0aW9ucyBmb3IgZmJk
ZXYuIEFkZCB0aGUgaG9vaw0KPj4gc3RydWN0IGRybV9kcml2ZXIuZ2VtX2NyZWF0ZV9vYmpl
Y3RfZmJkZXYsIHdoaWNoIGlzIHNpbWlsYXIgdG8NCj4+IHN0cnVjdCBkcm1fZHJpdmVyLmdl
bV9jcmVhdGVfb2JqZWN0IGFuZCBhbGxvd3MgZm9yIHRoZSBjcmVhdGlvbg0KPj4gb2YgZGVk
aWNhdGVkIGZiZGV2IGJ1ZmZlciBvYmplY3RzLiBXaXJlIHRoaW5ncyB1cCB3aXRoaW4gR0VN
DQo+PiBTSE1FTS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV9zaG1lbV9oZWxwZXIuYyAgfCAgNyArKystDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9kcnYuYyAgICB8ICAyICsNCj4+ICAgZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2Rydi5oICAgIHwgIDIgKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfb2JqZWN0LmMgfCA1NCArKysrKysrKysrKysrKysrKysrKysrKy0tDQo+
PiAgIGluY2x1ZGUvZHJtL2RybV9kcnYuaCAgICAgICAgICAgICAgICAgICB8IDEwICsrKysr
DQo+PiAgIDUgZmlsZXMgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1f
aGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPj4g
aW5kZXggYWI3Y2I3ZDg5NmMzLi4yMjVhYTE3ODk1YmQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMNCj4+IEBAIC03MSw3ICs3MSwxMiBAQCBf
X2RybV9nZW1fc2htZW1fY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHNpemVfdCBz
aXplLCBib29sIHByaXZhdGUsIGJvb2wgZg0KPj4gICANCj4+ICAgCXNpemUgPSBQQUdFX0FM
SUdOKHNpemUpOw0KPj4gICANCj4+IC0JaWYgKGRldi0+ZHJpdmVyLT5nZW1fY3JlYXRlX29i
amVjdCkgew0KPj4gKwlpZiAoZGV2LT5kcml2ZXItPmdlbV9jcmVhdGVfb2JqZWN0X2ZiZGV2
ICYmIGZiZGV2KSB7DQo+IA0KPiBTYW1lIGNvbW1lbnQgaGVyZSB0byBjaGVjayBpZiBmYmRl
diBlbXVsYXRpb24gaXMgZW5hYmxlZCBvciBtYXliZSBpcyBub3QNCj4gd29yaHQgaXQgPyBC
dXQgSSB0aGluayB0aGlzIGhpbnRzIHRoZSBjb21waWxlciB0byBvcHRpbWl6ZSB0aGUgaWYg
YnJhbmNoLg0KPiANCj4gW3NuaXBdDQo+IA0KPj4gK30NCj4+ICsjZWxzZQ0KPj4gK3N0cnVj
dCBkcm1fZ2VtX29iamVjdCAqdmlydGlvX2dwdV9jcmVhdGVfb2JqZWN0X2ZiZGV2KHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsDQo+PiArCQkJCQkJICAgICAgc2l6ZV90IHNpemUpDQo+PiAr
ew0KPj4gKwlyZXR1cm4gRVJSX1BUUigtRU5PU1lTKTsNCj4+ICt9DQo+IA0KPiBBcyBtZW50
aW9uZWQsIEkgYmVsaWV2ZSB0aGlzIHNob3VsZCBiZSBFUlJfUFRSKC1FTk9UU1VQUCkgaW5z
dGVhZC4NCg0KSSd2ZSBiZWVuIHdvbmRlcmluZyBhYm91dCB0aGlzIGFzIHdlbGwuIEkgZmlu
YWxseSB3ZW50IHdpdGggdGhlIHJ1bGVzIGF0IA0KWzFdLiAgQWxsIHRoZSB2YXJpYW50cyBv
ZiBFTk9UT1AvRU5PVFNVUFAgc2VlbSB0byBiZSBmb3Igc3BlY2lmaWMgdXNlIA0KY2FzZXMs
IHN1Y2ggYXMgYSBjZXJ0YWluIGZlYXR1cmUgaXMgbm90IGltcGxlbWVudGVkIGJlIGEgc3Bl
Y2lmaWMgDQppbnRlcmZhY2UgKGUuZy4sIHNvY2tldHMgZm9yIEVPUE5PVFNVUFApLiAgRU5P
U1lTIGlzIHRoZSBvbmx5IGdlbmVyYWwgDQplcnJvciB0aGF0IGluZGljYXRlcyB0aGF0IGFu
IGVudGlyZSBpbnRlcmZhY2UgaXMgbWlzc2luZy4gRXZlbiB0aG91Z2ggDQpjaGVja3BhdGNo
LnBsIHdhcm5zIHRoYXQgaXQncyBvbmx5IGZvciBzeXN0ZW0gY2FsbHMuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNClsxXSBodHRwczovL3d3dy5jcy5oZWxzaW5raS5maS9saW51eC9s
aW51eC1rZXJuZWwvMjAwMi0zMC8xMTM1Lmh0bWwNCg0KPiANCj4gRmVlbCBmcmVlIHRvIGln
bm9yZSBhbGwgdGhpcyBuaXRzIGlmIHlvdSBjb25zaWRlciB0aGF0IGFyZSBub3QgYXBwbGlj
YWJsZS4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGph
dmllcm1AcmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------PshAy3Sl7hBgC0ALJUdt0hAf--

--------------ZDBwYEaWyJP59f8X0ssMNQPe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIoauAFAwAAAAAACgkQlh/E3EQov+A4
iRAAhBZOLAQHrxMVtSWAu8blye5r02ntG8z1B6hx1vA6pWoKLKhm0HnQ5uQgsMnx6E5JG5UIqu95
jNmPfLum0/bceTY5l/27MQlGCxAdrt/sQGUodqIhne9pmaR9F9x7ceRp6nivZPJ+JKQkaU6Gp0oF
I91uHTMzAhz4whil62eSS7w4phUS37di2y6ZtLckI6oBQvGnc7+PfYIy399yqpqeUOAZuGiGstAh
xwn3bvGA/Wa3X4kzvIU69n2BJnJh2oa+t7PElOBAPegypWkZdFnxhTExznKnXsf2cyGVsyKVLN7h
LWBY1PkGpDYlAxdPDLzIpxnRdJGd7SSY/CUXJV6HEYTEBye3j3elzsHqvdw233vK0RN5Xioqa+lC
BkR2jS317FMHJ4cFeC0+Nwo0tkIOiY/tk+CDSbhEMEbz7Tj9cRO0JIngKhZxUkFhHV/w6LWQ8cio
tbN/d+bFNENF+vc9e+Jq2uKzn/UV5yEU9TT3WrYFPZnTUiK931HvM+6JhUnFilVGYyn/4gXMrMxy
ym9X99prRI35TSC5OQoGXv1DzfkRGiprhCavomJc+Iq5H5epO1408vFCv8AFFsz3jqj9F6DM1omo
Sf/O/AMVJ8o301DhykoSsvA33Ze+MMPOtm1WAVC/YE5RAJPO5ivr163iqwOkUdENb7v8+ZJx7ev8
RKQ=
=3n1F
-----END PGP SIGNATURE-----

--------------ZDBwYEaWyJP59f8X0ssMNQPe--
