Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6750862B6A1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 10:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51EA10E457;
	Wed, 16 Nov 2022 09:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2668810E455;
 Wed, 16 Nov 2022 09:33:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DDC10336E6;
 Wed, 16 Nov 2022 09:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668591230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q1IsvZUl7HYnJnie9y2o+f8QhGMSD21CRRKQ2C3TE9A=;
 b=pj3RXAxlM1xPg5EYAObU89b1lWOCeJsCBwa0PTuI7duj+AXck9YUxS6tFn0WkBluKN4py/
 nHeHHof1i92W92LwrbQd1QSDO/42F7L4InLndCPKBYS3o7GYMm5sjTwK91Fvh1aDbNCZuD
 A1QwsJoFsiMcWxd0AOT5Rj2r9uGMP60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668591230;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q1IsvZUl7HYnJnie9y2o+f8QhGMSD21CRRKQ2C3TE9A=;
 b=wHTx5nba3vOT9772CIYvZty5r4twcP1Ha1iYG0Zv+H0RNkl2v7T7MAoOpSngxVNPd40g77
 ByQWt6e628A4GQBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BAE5A134CE;
 Wed, 16 Nov 2022 09:33:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7GCeLH6udGMgOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Nov 2022 09:33:50 +0000
Message-ID: <0422ebb6-d4ff-52b0-b773-c643489e8fe9@suse.de>
Date: Wed, 16 Nov 2022 10:33:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RESEND] drm/edid/firmware: stop using a throwaway platform device
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20221114111709.434979-1-jani.nikula@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221114111709.434979-1-jani.nikula@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sfUUYAYjD0pv4FkFtZv0lw1a"
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
Cc: Matthieu CHARETTE <matthieu.charette@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sfUUYAYjD0pv4FkFtZv0lw1a
Content-Type: multipart/mixed; boundary="------------XgkZECgjJynamKN0gQ2TApdT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Matthieu CHARETTE <matthieu.charette@gmail.com>
Message-ID: <0422ebb6-d4ff-52b0-b773-c643489e8fe9@suse.de>
Subject: Re: [RESEND] drm/edid/firmware: stop using a throwaway platform
 device
References: <20221114111709.434979-1-jani.nikula@intel.com>
In-Reply-To: <20221114111709.434979-1-jani.nikula@intel.com>

--------------XgkZECgjJynamKN0gQ2TApdT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMTEuMjIgdW0gMTI6MTcgc2NocmllYiBKYW5pIE5pa3VsYToNCj4gV2Un
dmUgdXNlZCBhIHRlbXBvcmFyeSBwbGF0Zm9ybSBkZXZpY2UgZm9yIGZpcm13YXJlIEVESUQg
bG9hZGluZyBzaW5jZQ0KPiBpdCB3YXMgaW50cm9kdWNlZCBpbiBjb21taXQgZGEwZGY5MmI1
NzMxICgiZHJtOiBhbGxvdyBsb2FkaW5nIGFuIEVESUQgYXMNCj4gZmlybXdhcmUgdG8gb3Zl
cnJpZGUgYnJva2VuIG1vbml0b3IiKSwgYnV0IHRoZXJlJ3Mgbm8gZXhwbGFuYXRpb24gd2h5
Lg0KPiANCj4gVXNpbmcgYSB0ZW1wb3JhcnkgZGV2aWNlIGRvZXMgbm90IHBsYXkgd2VsbCB3
aXRoIENPTkZJR19GV19DQUNIRT15LA0KPiB3aGljaCBjYWNoZXMgZmlybXdhcmUgaW1hZ2Vz
IChlLmcuIG9uIHN1c3BlbmQpIHNvIHRoYXQgZHJpdmVycyBjYW4NCj4gcmVxdWVzdCBmaXJt
d2FyZSB3aGVuIHRoZSBzeXN0ZW0gaXMgbm90IHJlYWR5IGZvciBpdCwgYW5kIHJldHVybiB0
aGUNCj4gaW1hZ2VzIGZyb20gdGhlIGNhY2hlIChlLmcuIGR1cmluZyByZXN1bWUpLiBUaGlz
IHdvcmtzIGF1dG9tYXRpY2FsbHkgZm9yDQo+IHJlZ3VsYXIgZGV2aWNlcywgYnV0IG9idmlv
dXNseSBub3QgZm9yIGEgdGVtcG9yYXJpbHkgY3JlYXRlZCBkZXZpY2UuDQo+IA0KPiBTdG9w
IHVzaW5nIHRoZSB0aHJvd2F3YXkgcGxhdGZvcm0gZGV2aWNlLCBhbmQgdXNlIHRoZSBkcm0g
ZGV2aWNlDQo+IGluc3RlYWQuDQo+IA0KPiBOb3RlIHRoYXQgdGhpcyBtYXkgc3RpbGwgYmUg
cHJvYmxlbWF0aWMgZm9yIGNhc2VzIHdoZXJlIHRoZSBkaXNwbGF5IHdhcw0KPiBwbHVnZ2Vk
IGluIGR1cmluZyBzdXNwZW5kLCBhbmQgdGhlIGZpcm13YXJlIHdhc24ndCBsb2FkZWQgYW5k
IHRoZXJlZm9yZQ0KPiBub3QgY2FjaGVkIGJlZm9yZSBzdXNwZW5kLg0KPiANCj4gUmVmZXJl
bmNlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIyMDcyNzA3NDE1Mi40MzA1OS0x
LW1hdHRoaWV1LmNoYXJldHRlQGdtYWlsLmNvbQ0KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzIwNjENCj4gUmVwb3J0ZWQtYnk6
IE1hdHRoaWV1IENIQVJFVFRFIDxtYXR0aGlldS5jaGFyZXR0ZUBnbWFpbC5jb20+DQo+IFRl
c3RlZC1ieTogTWF0dGhpZXUgQ0hBUkVUVEUgPG1hdHRoaWV1LmNoYXJldHRlQGdtYWlsLmNv
bT4NCj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5j
b20+DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCg0KSSBsb29rZWQgdGhyb3VnaCByZXF1ZXN0X2Zpcm13YXJlKCkgYnV0IGRpZCBub3Qg
c2VlIGFueSBzaWducyB0aGF0IGl0IA0Kc29tZWhvdyBkZXBlbmRzIG9uIGEgcGxhdGZvcm0g
ZGV2aWNlLiBJIGFzc3VtZSB0aGF0IHRoaXMgbWlnaHQgb25seSANCmFmZmVjdCB0aGUgZGV2
aWNlIG5hbWUgaW4gdGhlIGVycm9yIG1lc3NhZ2UuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQo+IC0tLQ0KPiANCj4gUmVzZW5kIHdpdGggYSBwcm9wZXIgY29tbWl0IG1lc3Nh
Z2U7IHBhdGNoIGl0c2VsZiBpcyB1bmNoYW5nZWQuDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZF9sb2FkLmMgfCAxMyArLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWRfbG9hZC5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkX2xvYWQuYw0KPiBpbmRleCBlZjRhYjU5ZDY5MzUuLjVkOWVmMjY3ZWJiMyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkX2xvYWQuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWRfbG9hZC5jDQo+IEBAIC0xNzIsMjAgKzE3Miw5
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VkaWQgKmVkaWRfbG9hZChzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yLCBjb25zdCBjDQo+ICAgCQlmd2RhdGEgPSBnZW5lcmlj
X2VkaWRbYnVpbHRpbl07DQo+ICAgCQlmd3NpemUgPSBzaXplb2YoZ2VuZXJpY19lZGlkW2J1
aWx0aW5dKTsNCj4gICAJfSBlbHNlIHsNCj4gLQkJc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldjsNCj4gICAJCWludCBlcnI7DQo+ICAgDQo+IC0JCXBkZXYgPSBwbGF0Zm9ybV9kZXZp
Y2VfcmVnaXN0ZXJfc2ltcGxlKGNvbm5lY3Rvci0+bmFtZSwgLTEsIE5VTEwsIDApOw0KPiAt
CQlpZiAoSVNfRVJSKHBkZXYpKSB7DQo+IC0JCQlkcm1fZXJyKGNvbm5lY3Rvci0+ZGV2LA0K
PiAtCQkJCSJbQ09OTkVDVE9SOiVkOiVzXSBGYWlsZWQgdG8gcmVnaXN0ZXIgRURJRCBmaXJt
d2FyZSBwbGF0Zm9ybSBkZXZpY2UgZm9yIGNvbm5lY3RvciBcIiVzXCJcbiIsDQo+IC0JCQkJ
Y29ubmVjdG9yLT5iYXNlLmlkLCBjb25uZWN0b3ItPm5hbWUsDQo+IC0JCQkJY29ubmVjdG9y
LT5uYW1lKTsNCj4gLQkJCXJldHVybiBFUlJfQ0FTVChwZGV2KTsNCj4gLQkJfQ0KPiAtDQo+
IC0JCWVyciA9IHJlcXVlc3RfZmlybXdhcmUoJmZ3LCBuYW1lLCAmcGRldi0+ZGV2KTsNCj4g
LQkJcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIocGRldik7DQo+ICsJCWVyciA9IHJlcXVl
c3RfZmlybXdhcmUoJmZ3LCBuYW1lLCBjb25uZWN0b3ItPmRldi0+ZGV2KTsNCj4gICAJCWlm
IChlcnIpIHsNCj4gICAJCQlkcm1fZXJyKGNvbm5lY3Rvci0+ZGV2LA0KPiAgIAkJCQkiW0NP
Tk5FQ1RPUjolZDolc10gUmVxdWVzdGluZyBFRElEIGZpcm13YXJlIFwiJXNcIiBmYWlsZWQg
KGVycj0lZClcbiIsDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------XgkZECgjJynamKN0gQ2TApdT--

--------------sfUUYAYjD0pv4FkFtZv0lw1a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN0rn4FAwAAAAAACgkQlh/E3EQov+DK
txAAgXqNThEIsrASJTjiHRC79iAIcsCVO+mFoZEQ2HUQQjnouNVcKkXu1jXfavh9YGmVYOziNyGH
IMwUWjZ1iHgmK2id+MIWU+BQTMPT4SduEY0MpcVrs+acJzIbD8+4U8DTPQPCQw6oHu6w8nHwOtJw
mjT4j37ulmoN1UxbnO4geKxhFm/q53vOgZqNCDP/Eab/iOKRaHG68kPa+qzGVGSp2eJpbed7GSUS
1uI5hnsdCK49AWnIcBSfU7g2cRP9RhbiAUGt2Jriz7GCcaZOomGyQR1ttztrmvqlzIf0ne715Mpn
p06yw9i3hr9szDl6YP8z62/2CwXT3gL2wfICd5b4AWuVfTr+IyeVLt3MSnr4g9RkYKupZpptRTrj
Qw+n6u45xPcYPbrjVaNQUyR3130Fwx3zdP1LRqpr7cMDPvsaG6RNU3cs1G3XjnzR1IxF4vjoAMNc
iP1Rrr5GS8TTzs0peN/Fib/pRQY8282OOUUafth8lbYfO7GIxU0edununN6ent2l73/nMqEtCcAu
dR0JhuABcT26NQraPtURDdNnOptfMCCuawQZkS/2s6eEUZQsqLBMJmY4p2hDX41s7E+RTyWqfWcf
oKtWF4djdH8AUhBqvVDMMfypoiE2zAP1F+2fRoGdUGuAZ0E0uzkewx5PcIwI4Od4ZrqX+Xe/NILA
3as=
=NPI7
-----END PGP SIGNATURE-----

--------------sfUUYAYjD0pv4FkFtZv0lw1a--
