Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B3253AD8A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 21:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5390810FBCA;
	Wed,  1 Jun 2022 19:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B94D10FBCA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 19:56:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B54B21B10;
 Wed,  1 Jun 2022 19:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654113406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E6eLw934xOTLTw01EZ1tOfHaU8TmXmkxJ76cU5Spyrw=;
 b=Ov1g7+s7kFMRvhc0W7AC1vfidfgwphFLrT6nxAWej90cC/lIq5PWh18zdoSRUBfJD44bkw
 3EzWtW1gkHOZ7fv2AYZFHbZptvrkrsgd7AbpQWqsI9gKK2tvigp2SmmiX263CSO6no7Af2
 mxsMBo7ZnzSYS1xkHO/24Bp6AensVTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654113406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E6eLw934xOTLTw01EZ1tOfHaU8TmXmkxJ76cU5Spyrw=;
 b=IRnxrgIM2fzqSStZtcsetVVdKvU4qlpOC/q1Sw08zLmvj/SfiEiegWLlDs0YCRm6+mtgT8
 FnODv3NT4aizKGDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72B491330F;
 Wed,  1 Jun 2022 19:56:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ge/YGn7El2LdHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Jun 2022 19:56:46 +0000
Message-ID: <49d7203c-6640-60a9-f269-a7d19b0b8412@suse.de>
Date: Wed, 1 Jun 2022 21:56:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/8] Cleanup use of ddc i2c buses
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5WklyhiLKT7HBGDxvrWiL3Kd"
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
--------------5WklyhiLKT7HBGDxvrWiL3Kd
Content-Type: multipart/mixed; boundary="------------ZsGV7FDJUGSCoNwlAZgv9Ei3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel@ffwll.ch
Message-ID: <49d7203c-6640-60a9-f269-a7d19b0b8412@suse.de>
Subject: Re: [PATCH 0/8] Cleanup use of ddc i2c buses
References: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>

--------------ZsGV7FDJUGSCoNwlAZgv9Ei3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGF0cmlrDQoNCkFtIDAxLjA2LjIyIHVtIDExOjIzIHNjaHJpZWIgUGF0cmlrIEpha29i
c3NvbjoNCj4gVGhlIHZhcmlvdXMgY2hpcHMgaGF2ZSBzbGlnaHQgZGlmZmVyZW5jZXMgaW4g
aG93IHRoZXkgaGFuZGxlIGFuZCBzdG9yZQ0KPiBkZGMgaTJjIGJ1c2VzLiBUaGlzIHNlcmll
cyB0cmllcyB0byBwdXQgdGhlIG1haW4gaTJjIGFkYXB0ZXIgZm9yIGRkYw0KPiBpbnRvIHRo
ZSBkcm1fY29ubmVjdG9yLT5kZGMgcG9pbnRlci4gVGhpcyBtYWtlcyBpdCBlYXNpZXIgdG8g
dW5pZnkgdGhlDQo+IGNvZGUgZm9yIHRoZSBkaWZmZXJlbnQgZW5jb2RlcnMgaW4gdXBjb21p
bmcgc2VyaWVzLiBPYWt0cmFpbCBIRE1JIGFuZA0KPiBQU0IgU0RWTyBhcmUgbm90IGluY2x1
ZGVkLg0KDQpGb3IgdGhlIHNlcmllczoNCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpJIHJlY2VudGx5IHBvc3RlZCB0d28gcGF0Y2hl
cyBmb3Igc2ltcGxpZnlpbmcgRURJRCBoYW5kaW5nLiBUaGUgbmV3IERSTSANCmhlbHBlciBm
b3IgLmdldF9tb2RlcyBmZXRjaGVzIHRoZSBFRElEIGZyb20gY29uZW5jdG9yLT5kZGMuIFsx
XSBUaGUgDQpoZWxwZXIgZm9yIC5kZXRlY3RfY3R4IHVzZXMgLmdldF9tb2RlcyBhbmQgdGhl
IEVESUQgZGF0YSB0byBwb2xsIHRoZSANCmNvbm5lY3RvciBzdGF0dXMuIFsyXSAgZ21hNTAw
IGlzIG9uZSBvZiB0aGUgY2FuZGlkYXRlcyBmb3IgdXNpbmcgdGhlc2UgDQpoZWxwZXJzLiBJ
ZiB5b3UgbGlrZSB0aGUgaWRlYSwgSSdkIHdlbGNvbWUgYSBmb2xsb3ctdXAgcGF0Y2hzZXQu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2RyaS1kZXZlbC8yMDIyMDUxNjEzNDM0My42MDg1LTQtdHppbW1lcm1hbm5Ac3VzZS5k
ZS8NClsyXSANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIyMDUzMTEx
MTUwMi40NDcwLTQtdHppbW1lcm1hbm5Ac3VzZS5kZS8NCg0KPiANCj4gUGF0cmlrIEpha29i
c3NvbiAoOCk6DQo+ICAgIGRybS9nbWE1MDA6IFVzZSBnbWFfIHByZWZpeCBmb3Igb3VyIGky
YyBhYnN0cmFjdGlvbg0KPiAgICBkcm0vZ21hNTAwOiBNYWtlIGdtYV9pMmNfY2hhbiBhIHN1
YmNsYXNzIG9mIGkyY19hZGFwdGVyDQo+ICAgIGRybS9nbWE1MDA6IE1ha2UgY2R2IGx2ZHMg
dXNlIGRkYyBhZGFwdGVyIGZyb20gZHJtX2Nvbm5lY3Rvcg0KPiAgICBkcm0vZ21hNTAwOiBN
YWtlIGNkdiBoZG1pIHVzZSBkZGMgYWRhcHRlciBmcm9tIGRybV9jb25uZWN0b3INCj4gICAg
ZHJtL2dtYTUwMDogTWFrZSBwc2IgbHZkcyB1c2UgZGRjIGFkYXB0ZXIgZnJvbSBkcm1fY29u
bmVjdG9yDQo+ICAgIGRybS9nbWE1MDA6IE1ha2UgY2R2IGNydCB1c2UgZGRjIGFkYXB0ZXIg
ZnJvbSBkcm1fY29ubmVjdG9yDQo+ICAgIGRybS9nbWE1MDA6IE1ha2Ugb2FrdHJhaWwgbHZk
cyB1c2UgZGRjIGFkYXB0ZXIgZnJvbSBkcm1fY29ubmVjdG9yDQo+ICAgIGRybS9nbWE1MDA6
IFJlYWQgRURJRCBmcm9tIHRoZSBjb3JyZWN0IGkyYyBhZGFwdGVyDQo+IA0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVsX2NydC5jICAgICB8IDQ3ICsrKysrKy0tLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxfaGRtaS5jICAgIHwgOTgg
KysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2
X2ludGVsX2x2ZHMuYyAgICB8IDgwICsrKysrKysrLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9nbWE1MDAvaW50ZWxfaTJjLmMgICAgICAgICB8IDM2ICsrKystLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9sdmRzLmMgICAgIHwgNTAgKysrKysr
LS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2x2ZHNfaTJjLmMg
fCAzNiArKysrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5oICAg
ICAgICAgICB8ICAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfaW50ZWxf
ZHJ2LmggICAgIHwgMjQgKysrLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2Jf
aW50ZWxfbHZkcy5jICAgIHwgODYgKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgIDkgZmlsZXMg
Y2hhbmdlZCwgMjM3IGluc2VydGlvbnMoKyksIDIyMiBkZWxldGlvbnMoLSkNCj4gDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------ZsGV7FDJUGSCoNwlAZgv9Ei3--

--------------5WklyhiLKT7HBGDxvrWiL3Kd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKXxH0FAwAAAAAACgkQlh/E3EQov+Dq
QA/+KrdQZ2MxoQcKmV2r+qHBpwHGtJ0KfwJ+JMK9aKR3jJ9UxS1dHkLoMbBW+42tgf9FOpMC8NVP
lgpd/vh0ErxU7SPHQUw/FH2mFP0L/t5FLH9dMro2MjZnqJL4WMbb3gHAbnxMzjNSGWT9c1Q55zp3
r5k7NTi2+aGUuMDnHXxqmWWku9J0QCYZr5rjLTtFD6FBpv89A80gVvIYEBCsg61ZFKvLL4Ra7/Cg
BXP/roLNO1uugfnFO3dvqO78K43kuNxd+ZUiqpaQxV4vXRG/gj3NGXEEa0WKN/2IILODgHeqK41j
jRVOHhWLQotZ8CyqaFJ+z/MZYW0+0rC81pmbNqRcNtTDmN4BaylRN5RqvCEiP4qOA0pcb8omfjSL
Kv01PgGvjnk2WbDBYvmVXHddCUqo9SlEZdOF5N81J+0t29UnJt/skSaLPpZPugkbNs3TPKzEJmAa
gXOWZ9qasZtL7r0h4x3DX15wcOxBjl5yj54wAEDuK3ZD/fglepwuiPeHMT+N7WAE6Kk2sIYweM0o
6DNOvJVY2IvVqLs/Qb4TZij7EGqOqbPBImjCocEW+TxMUq6btDRVPaqisiKOEqWJy1hQCAl2a5A5
5deZT8Cf6foYzi5XDBDAQ7dASLCzBCUgfXcurv6kqO2xMrHavKb02fyskubKVNwtfKWVCVF3CjFo
2Bw=
=gVR/
-----END PGP SIGNATURE-----

--------------5WklyhiLKT7HBGDxvrWiL3Kd--
