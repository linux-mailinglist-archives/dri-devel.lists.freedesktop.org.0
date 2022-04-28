Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E108512C28
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D62910E345;
	Thu, 28 Apr 2022 07:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B120110E345
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:02:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2831D1F37F;
 Thu, 28 Apr 2022 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651129353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yv/GAIx/8nETe4kCc4L+SSgXvQ1n5epRd4fqCoWrYmc=;
 b=dYe3x0GhIPZUxYzZbcTFFZ1VHjZHgMKRNndSeEd8Q8mupCdL0wWgX439hmAFWveOFpTFdj
 mu63IwYtdrbXJJGOZALoZgoApGOq9flonip7Ot4yUp1g97jHw511Y/ULpiOqxOtPj8my6I
 DdO9QK5hbSEtFLP2k6RFS7Zm6ebhgHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651129353;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yv/GAIx/8nETe4kCc4L+SSgXvQ1n5epRd4fqCoWrYmc=;
 b=zctHkSC7I1dtYLurWhPSL97e6MapO2UTCMWlvoXyikxIFXl6yg8xvQ7T0zH/rS0bPs8RuF
 ckciGSUzvIwsYMCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0079E13A8C;
 Thu, 28 Apr 2022 07:02:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BkiiOgg8amJKXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Apr 2022 07:02:32 +0000
Message-ID: <46446e78-60a6-1b8c-1bb6-1c005489d58c@suse.de>
Date: Thu, 28 Apr 2022 09:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220427215528.237861-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220427215528.237861-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fWDwLqO6HwfernA4whKEzwFE"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fWDwLqO6HwfernA4whKEzwFE
Content-Type: multipart/mixed; boundary="------------UvUZ02dQorqjjUjIPmecZju0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Message-ID: <46446e78-60a6-1b8c-1bb6-1c005489d58c@suse.de>
Subject: Re: [PATCH v2] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
References: <20220427215528.237861-1-javierm@redhat.com>
In-Reply-To: <20220427215528.237861-1-javierm@redhat.com>

--------------UvUZ02dQorqjjUjIPmecZju0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDQuMjIgdW0gMjM6NTUgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSBEUk1fRFBfQVVYX0NIQVJERVYgYW5kIERSTV9EUF9DRUMgS2NvbmZp
ZyBzeW1ib2xzIGVuYWJsZSBjb2RlIHRoYXQgdXNlDQo+IERQIGhlbHBlciBmdW5jdGlvbnMs
IHRoYXQgYXJlIG9ubHkgcHJlc2VudCBpZiBDT05GSUdfRFJNX0RJU1BMQVlfRFBfSEVMUEVS
DQo+IGlzIGFsc28gZW5hYmxlZC4NCj4gDQo+IEJ1dCB0aGVzZSBkb24ndCBzZWxlY3QgdGhl
IERSTV9ESVNQTEFZX0RQX0hFTFBFUiBzeW1ib2wsIG1lYW5pbmcgdGhhdCBpdA0KPiBpcyBw
b3NzaWJsZSB0byBlbmFibGUgYW55IG9mIHRoZW0gd2l0aG91dCBDT05GSUdfRFJNX0RJU1BM
QVlfRFBfSEVMUEVSLg0KPiANCj4gVGhhdCB3aWxsIGxlYWQgdG8gdGhlIGZvbGxvd2luZyBs
aW5raW5nIGVycm9ycyB3aXRoIHRoZSBtZW50aW9uZWQgY29uZmlnOg0KPiANCj4gICAgTEQg
ICAgICB2bWxpbnV4Lm8NCj4gICAgTU9EUE9TVCB2bWxpbnV4LnN5bXZlcnMNCj4gICAgTU9E
SU5GTyBtb2R1bGVzLmJ1aWx0aW4ubW9kaW5mbw0KPiAgICBHRU4gICAgIG1vZHVsZXMuYnVp
bHRpbg0KPiAgICBMRCAgICAgIC50bXBfdm1saW51eC5rYWxsc3ltczENCj4gICAgS1NZTVMg
ICAudG1wX3ZtbGludXgua2FsbHN5bXMxLlMNCj4gICAgQVMgICAgICAudG1wX3ZtbGludXgu
a2FsbHN5bXMxLlMNCj4gICAgTEQgICAgICAudG1wX3ZtbGludXgua2FsbHN5bXMyDQo+ICAg
IEtTWU1TICAgLnRtcF92bWxpbnV4LmthbGxzeW1zMi5TDQo+ICAgIEFTICAgICAgLnRtcF92
bWxpbnV4LmthbGxzeW1zMi5TDQo+ICAgIExEICAgICAgdm1saW51eA0KPiAgICBTWVNNQVAg
IFN5c3RlbS5tYXANCj4gICAgU09SVFRBQiB2bWxpbnV4DQo+ICAgIE9CSkNPUFkgYXJjaC9h
cm02NC9ib290L0ltYWdlDQo+ICAgIE1PRFBPU1QgbW9kdWxlcy1vbmx5LnN5bXZlcnMNCj4g
RVJST1I6IG1vZHBvc3Q6ICJkcm1fZHBfZHBjZF93cml0ZSIgW2RyaXZlcnMvZ3B1L2RybS9k
aXNwbGF5L2RybV9kaXNwbGF5X2hlbHBlci5rb10gdW5kZWZpbmVkIQ0KPiBFUlJPUjogbW9k
cG9zdDogImRybV9kcF9yZWFkX2Rlc2MiIFtkcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1f
ZGlzcGxheV9oZWxwZXIua29dIHVuZGVmaW5lZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJkcm1f
ZHBfZHBjZF9yZWFkIiBbZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2Rpc3BsYXlfaGVs
cGVyLmtvXSB1bmRlZmluZWQhDQo+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5t
b2Rwb3N0OjEzNDogbW9kdWxlcy1vbmx5LnN5bXZlcnNdIEVycm9yIDENCj4gbWFrZVsxXTog
KioqIERlbGV0aW5nIGZpbGUgJ21vZHVsZXMtb25seS5zeW12ZXJzJw0KPiBtYWtlOiAqKiog
W01ha2VmaWxlOjE3NDk6IG1vZHVsZXNdIEVycm9yIDINCj4gDQo+IE5vdGU6IEl0IHNlZW1z
IHRoaXMgaGFzIGJlZW4gYW4gaXNzdWUgZm9yIGEgbG9uZyB0aW1lIGJ1dCB3YXMgbWFkZSBl
YXNpZXINCj4gdG8gcmVwcm9kdWNlIGFmdGVyIHRoZSBjb21taXQgMWUwZjY2NDIwYjEzICgi
ZHJtL2Rpc3BsYXk6IEludHJvZHVjZSBhIERSTQ0KPiBkaXNwbGF5LWhlbHBlciBtb2R1bGUi
KS4gQWRkaW5nIGEgRml4ZXM6IHRhZyBqdXN0IHRvIG1ha2Ugc3VyZSB0aGF0IHRoaXMNCj4g
Zml4IHdpbGwgYmUgcGlja2VkIGZvciBzdGFibGUgb25jZSB0aGUgbWVudGlvbmVkIGNoYW5n
ZSBhbHNvIGxhbmRzIHRoZXJlLg0KPiANCj4gRml4ZXM6IDFlMGY2NjQyMGIxMyAoImRybS9k
aXNwbGF5OiBJbnRyb2R1Y2UgYSBEUk0gZGlzcGxheS1oZWxwZXIgbW9kdWxlIikNCj4gU2ln
bmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5j
b20+DQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBFeHBsYWluIGJldHRlciB0
aGUgaXNzdWUgaW4gdGhlIGNoYW5nZSBkZXNjcmlwdGlvbi4NCj4gLSBPbmx5IHNlbGVjdCBE
Uk1fRElTUExBWV9EUF9IRUxQRVIgYW5kIG5vdCBEUk1fRElTUExBWV9IRUxQRVIuDQo+IA0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L0tjb25maWcgfCAyICsrDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kaXNwbGF5L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9LY29u
ZmlnDQo+IGluZGV4IGY4NGYxYjBjZDIzZi4uOWZlODBjNGU1NTVjIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kaXNwbGF5L0tjb25maWcNCj4gQEAgLTMyLDYgKzMyLDcgQEAgY29uZmlnIERSTV9E
SVNQTEFZX0hETUlfSEVMUEVSDQo+ICAgY29uZmlnIERSTV9EUF9BVVhfQ0hBUkRFVg0KPiAg
IAlib29sICJEUk0gRFAgQVVYIEludGVyZmFjZSINCj4gICAJZGVwZW5kcyBvbiBEUk0NCj4g
KwlzZWxlY3QgRFJNX0RJU1BMQVlfRFBfSEVMUEVSDQoNCllvdSBjYW5ub3Qgc2VsZWN0IERJ
U1BMQVlfRFBfSEVMUEVSIHdpdGhvdXQgRElTUExBWV9IRUxQRVIuDQoNCkNhbid0IHlvdSBz
aW1wbHkgbWFrZSBpdCBkZXBlbmQgb24gRElTUExBWV9EUF9IRUxQRVIuICBUaGUgbWVudSBl
bnRyeSANCndpbGwgc2hvdyB1cCBhcyBzb29uIGFzIHRoZXJlJ3MgYSBkcml2ZXIgdGhhdCBz
ZWxjZXRzIERJU1BMQVlfRFBfSEVMUEVSLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
ICAgCWhlbHANCj4gICAJICBDaG9vc2UgdGhpcyBvcHRpb24gdG8gZW5hYmxlIGEgL2Rldi9k
cm1fZHBfYXV4TiBub2RlIHRoYXQgYWxsb3dzIHRvDQo+ICAgCSAgcmVhZCBhbmQgd3JpdGUg
dmFsdWVzIHRvIGFyYml0cmFyeSBEUENEIHJlZ2lzdGVycyBvbiB0aGUgRFAgYXV4DQo+IEBA
IC00MCw2ICs0MSw3IEBAIGNvbmZpZyBEUk1fRFBfQVVYX0NIQVJERVYNCj4gICBjb25maWcg
RFJNX0RQX0NFQw0KPiAgIAlib29sICJFbmFibGUgRGlzcGxheVBvcnQgQ0VDLVR1bm5lbGlu
Zy1vdmVyLUFVWCBIRE1JIHN1cHBvcnQiDQo+ICAgCWRlcGVuZHMgb24gRFJNDQo+ICsJc2Vs
ZWN0IERSTV9ESVNQTEFZX0RQX0hFTFBFUg0KPiAgIAlzZWxlY3QgQ0VDX0NPUkUNCj4gICAJ
aGVscA0KPiAgIAkgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3Ugd2FudCB0byBlbmFibGUg
SERNSSBDRUMgc3VwcG9ydCBmb3INCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------UvUZ02dQorqjjUjIPmecZju0--

--------------fWDwLqO6HwfernA4whKEzwFE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJqPAgFAwAAAAAACgkQlh/E3EQov+BG
xQ/+JwljMIuuALeoCzPPjawd7nDTJj/mORV1W7b6JwFTAsQHHnvzPLOPUpTkPKx9noMpN/hGH64P
oNhTFSz8ZYaOnI2KjKUejbq4n6l8XayijZZqOYNAC5HIBaeLe2Bpo87CDBQG3VV5xDW9DPQ9PyFE
lf28sIEhyuT/TOcMd7AYRuUtundTRUEKLkeCzyelzFjtRJFI5S8U00eIRbVJPNJkAWSDXZ1fuO3w
Pad68Ki3AxZMJCECRwq1zkRsWSxEzE2h5rNWowrwgR4Fma2VmqYZcQwVxDkOPbm+6TbWGIC9tqSW
AaqPx1cwW4aAnCEyWtTVFCcGN910nug7BUqovWYmhv/AGls69Y4QjvdiJcOD0V5W4Gy6mM2A47an
qJoWNEkUUedhCeQWAgPUttCB0Ouo71vmFqa0l12k4kd+CxpKXMG0UdpN6/teii4W5t3k1t4RTQO6
iQy8zgFU9vF1xLUsfn/TtDdYsbRIgOUnr/iWoQMZQFCbOi1qgu6apnGtPkEZE+ySV1qxHK5ClGui
tDB9KvfsGdkWvIji/mD/L80CCiu8a+5KW3AR5EyrPnvRieq0mV70Ok8tJE+MP5dUEOafD4Fq5/U/
M4eyVFs82qrOwoNvPfiqXLESZWMCAjhLGgqogazqumC3bSNMMpPGmEonLAXtqsVLOGOQQKu7BoQF
Zmo=
=0UbS
-----END PGP SIGNATURE-----

--------------fWDwLqO6HwfernA4whKEzwFE--
