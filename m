Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFE1648056
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 10:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04E810E50C;
	Fri,  9 Dec 2022 09:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D6410E50C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 09:45:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A1A4337BA;
 Fri,  9 Dec 2022 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670579105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ywFrAR8XWLIwqbGvV0ueQZv5HYQt0w0GhLJeU8/s50=;
 b=iLmkw0qdA3ip3T4UzxPXg/v0Elm9XcTCi5Zv8X5CjAZPFLcjL/tFPklLhTpKWyvGW3jco6
 jMV+mX6mOYntaXsbWgYl/zRk2yt25DEQPHwO8l+RZz6mLtJH9GXN3C7CZG1xoZsOKq1cyd
 APL7HrHr8u+LcdJUosIZ09I4H0sCBWU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670579105;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ywFrAR8XWLIwqbGvV0ueQZv5HYQt0w0GhLJeU8/s50=;
 b=cnD4I8s7t8yXa05VeKo1w93p7fhlN5rPLmZCL+zaoxLBMqvzLqp3DEDNVv7xRKvXWVg12n
 H3+QRPRzk9266lCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D42C113597;
 Fri,  9 Dec 2022 09:45:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HhOiMqADk2N7bgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Dec 2022 09:45:04 +0000
Message-ID: <180babce-37e3-01b4-8f1a-03a82771bc8c@suse.de>
Date: Fri, 9 Dec 2022 10:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/ast: Fix no display at WayLand after power-off
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20221209091143.6290-1-jammy_huang@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221209091143.6290-1-jammy_huang@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0r0wzgwT8iqHMLqqaZPd2usX"
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
--------------0r0wzgwT8iqHMLqqaZPd2usX
Content-Type: multipart/mixed; boundary="------------DwlMbhWzGwCg1r0pCG4T4009";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <180babce-37e3-01b4-8f1a-03a82771bc8c@suse.de>
Subject: Re: [PATCH] drm/ast: Fix no display at WayLand after power-off
References: <20221209091143.6290-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20221209091143.6290-1-jammy_huang@aspeedtech.com>

--------------DwlMbhWzGwCg1r0pCG4T4009
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMTIuMjIgdW0gMTA6MTEgc2NocmllYiBKYW1teSBIdWFuZzoNCj4gV2l0
aCBXYXlMYW5kLCB0aGVyZSBpcyBlcnJvciBsb2cgd2hlbiBkaXNwbGF5IHdha2VuIHVwIGZy
b20gcG93ZXItb2ZmOg0KPiBnbm9tZS1zaGVsbDogRmFpbGVkIHRvIHBvc3QgS01TIHVwZGF0
ZTogQ1JUQyBwcm9wZXJ0eSAoR0FNTUFfTFVUKSBub3QgZm91bmQNCj4gZ25vbWUtc2hlbGw6
IFBhZ2UgZmxpcCBkaXNjYXJkZWQ6IENSVEMgcHJvcGVydHkgKEdBTU1BX0xVVCkgbm90IGZv
dW5kDQo+IA0KPiBUbyBmaXggdGhlIGlzc3VlLCBlbmFibGUgR0FNTUFfTFVUIHByb3BlcnR5
IG9uIENSVEMuDQoNClRoaXMgY29kZSBoYXMgbG9uZyBiZWVuIHJlcGxhY2VkIGJ5IGNvbW1p
dCBjZTdmY2Y3MDAzODYgKCJkcm0vYXN0OiBBZGQgDQpBdG9taWMgZ2FtbWEgbHV0IHN1cHBv
cnQgZm9yIGFzcGVlZCIpLCB3aGljaCBhZGRzIHByb3BlciBjb2xvciANCm1hbmFnZW1lbnQg
dG8gYXN0Lg0KDQpQbGVhc2Ugb25seSBzdWJtaXQgcGF0Y2hlcyBmb3IgdGhlIGxhdGVzdCBk
cml2ZXIgaW4gZHJtLW1pc2MtbmV4dC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFtbXkgSHVhbmcgPGphbW15X2h1YW5nQGFzcGVlZHRlY2gu
Y29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCAgfCAyICsr
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIHwgNSArKystLQ0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oIGIvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfZHJ2LmgNCj4gaW5kZXggMmU0NGI5NzFjM2E2Li5mZDlhZjFjZjA1
NjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oDQo+IEBAIC04Niw2ICs4Niw4IEBA
IGVudW0gYXN0X3R4X2NoaXAgew0KPiAgICNkZWZpbmUgQVNUX0RSQU1fNEd4MTYgICA3DQo+
ICAgI2RlZmluZSBBU1RfRFJBTV84R3gxNiAgIDgNCj4gICANCj4gKyNkZWZpbmUgTUFYX0NP
TE9SX0xVVF9FTlRSSUVTIDI1Ng0KPiArDQo+ICAgLyoNCj4gICAgKiBDdXJzb3IgcGxhbmUN
Cj4gICAgKi8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPiBpbmRleCAxYmMwMjIwZTY3
ODMuLjg3YmQ5Njk3YmI0NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPiBA
QCAtNzQsNyArNzQsNyBAQCBzdGF0aWMgdm9pZCBhc3RfY3J0Y19sb2FkX2x1dChzdHJ1Y3Qg
YXN0X3ByaXZhdGUgKmFzdCwgc3RydWN0IGRybV9jcnRjICpjcnRjKQ0KPiAgIAlnID0gciAr
IGNydGMtPmdhbW1hX3NpemU7DQo+ICAgCWIgPSBnICsgY3J0Yy0+Z2FtbWFfc2l6ZTsNCj4g
ICANCj4gLQlmb3IgKGkgPSAwOyBpIDwgMjU2OyBpKyspDQo+ICsJZm9yIChpID0gMDsgaSA8
IE1BWF9DT0xPUl9MVVRfRU5UUklFUzsgaSsrKQ0KPiAgIAkJYXN0X2xvYWRfcGFsZXR0ZV9p
bmRleChhc3QsIGksICpyKysgPj4gOCwgKmcrKyA+PiA4LCAqYisrID4+IDgpOw0KPiAgIH0N
Cj4gICANCj4gQEAgLTEzMjMsNyArMTMyMyw4IEBAIHN0YXRpYyBpbnQgYXN0X2NydGNfaW5p
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJcmV0dXJu
IHJldDsNCj4gICANCj4gLQlkcm1fbW9kZV9jcnRjX3NldF9nYW1tYV9zaXplKGNydGMsIDI1
Nik7DQo+ICsJZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQoY3J0YywgMCwgZmFsc2UsIE1B
WF9DT0xPUl9MVVRfRU5UUklFUyk7DQo+ICsJZHJtX21vZGVfY3J0Y19zZXRfZ2FtbWFfc2l6
ZShjcnRjLCBNQVhfQ09MT1JfTFVUX0VOVFJJRVMpOw0KPiAgIAlkcm1fY3J0Y19oZWxwZXJf
YWRkKGNydGMsICZhc3RfY3J0Y19oZWxwZXJfZnVuY3MpOw0KPiAgIA0KPiAgIAlyZXR1cm4g
MDsNCj4gDQo+IGJhc2UtY29tbWl0OiA4ZWQ3MTBkYTI4NzNjMmFlYjNiYjgwNTg2NGE2OTlh
ZmZhZjFkMDNiDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------DwlMbhWzGwCg1r0pCG4T4009--

--------------0r0wzgwT8iqHMLqqaZPd2usX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOTA6AFAwAAAAAACgkQlh/E3EQov+CN
Ug/7BimLztuoqyL5p9QtcMfRIvNacUKjXNCm7cG5WG11jKnWatGmjc0Sk1n2kBpON3aJfhLNmMY/
Besw07KpUdF4x2oKjSxzba+eNUGJYLVN1FNVMmyVKgaX0r+O23eRte/Ih5M5m9V0F9gS7vqCAYLv
o7WQI0McRDltpi8JiOFrr4pSMV7ilobxgTUMmeFTYOcH0SkumcH11MneCQusbOmpDXgFa3J1RPjS
adTMo6/f2jlbuNeJhL1lsKPVfkaR06W8xUHTq3hMlcx7OMqRBrlx6rIUlWh5epaVUAAeKMxxfQMU
zU3DSVNMbxVyghSx18V0ROBcrgY94KOriYWBU2NON84xq2pYd8n91h68oMHMhStZ9ojXmcqIlijA
bXsZ65H+cWR/WBM+I+FI/+ugVxGU4PB7D5wWdOnHxn0r1oy/T+m7B3dK2oFUAgCyqHOnsF+OjgKq
YV57foiBUgxtCFg8yJugxRPIxFCD2X6NmlybD77UlWYI+BHDCCm+OlnoPLBz5eFM8ddes4GncFy1
R5tbDyJ5g88hmnrK9NrUm8OYhqjJaJsZxCpfeelBZwcTU7jHK2xrkludpRbTtK+9F3CE1U+w/r3k
0kjDF90FolZmjuguw9a3UJUk9kTZCxZule5k9KRxs6jtiIiPdS5IgmKGLh0CC3e3L+ubSsH9rPRC
Ebk=
=Tk6G
-----END PGP SIGNATURE-----

--------------0r0wzgwT8iqHMLqqaZPd2usX--
