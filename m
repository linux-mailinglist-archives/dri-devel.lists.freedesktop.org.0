Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A0D5F9C0E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 11:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA8210E202;
	Mon, 10 Oct 2022 09:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2455F10E202
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 09:37:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BDB641F45B;
 Mon, 10 Oct 2022 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665394657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/CzLQqselFaO64Gr4MPH3pU6ari91gGhdizZb4SEU7E=;
 b=oM9oA8ZeB2JdD8sEtHzAKwhdXjHbwhuXEaP/wbGKGHC0hDx+9GtBATkLoXxBTtRPWPAqkl
 7ZKh/bhPOkX3pzAodXxs2Yp8149NUzTB31srnH/YsP7CGguQF8tOfcLDp1LH4kIPFNu6ln
 VNZBaesi6CtV4J5iNuMOKSjd1ty3RI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665394657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/CzLQqselFaO64Gr4MPH3pU6ari91gGhdizZb4SEU7E=;
 b=WcDsRWU1udA0MPUa4//GuVQkrBtWQsW+RInIzGq/FGRMkgyDuXea7UFwaOadzGQSCvut0U
 Ai3VPfZMn33eqXDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 810BF13479;
 Mon, 10 Oct 2022 09:37:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1346HuHnQ2MkEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Oct 2022 09:37:37 +0000
Message-ID: <44567457-2062-6e16-9a7f-c4ad23809ac9@suse.de>
Date: Mon, 10 Oct 2022 11:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/7] dt-bindings: display: simple-framebuffer: Support
 system memory framebuffers
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-2-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221007124946.406808-2-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a0wIL5ytpXFqM0nZv7pvRqjW"
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a0wIL5ytpXFqM0nZv7pvRqjW
Content-Type: multipart/mixed; boundary="------------sIbpmdC2orz54ETODCdR3EK0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Message-ID: <44567457-2062-6e16-9a7f-c4ad23809ac9@suse.de>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: simple-framebuffer: Support
 system memory framebuffers
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-2-thierry.reding@gmail.com>
In-Reply-To: <20221007124946.406808-2-thierry.reding@gmail.com>

--------------sIbpmdC2orz54ETODCdR3EK0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTAuMjIgdW0gMTQ6NDkgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IEluIG9y
ZGVyIHRvIHN1cHBvcnQgZnJhbWVidWZmZXJzIHJlc2lkaW5nIGluIHN5c3RlbSBtZW1vcnks
IGFsbG93IHRoZQ0KPiBtZW1vcnktcmVnaW9uIHByb3BlcnR5IHRvIG92ZXJyaWRlIHRoZSBm
cmFtZWJ1ZmZlciBtZW1vcnkgc3BlY2lmaWNhdGlvbg0KPiBpbiB0aGUgInJlZyIgcHJvcGVy
dHkuDQoNCldoYXQgaGFwcGVucyBpZiBib3RoIHByb3BlcnRpZXMgYXJlIHByZXNlbnQgYW5k
IHRoZXkgZGlzYWdyZWUgd2l0aCBlYWNoIA0Kb3RoZXI/DQoNCkkgdW5kZXJzdGFuZCB0aGF0
IHRoZSBmcmFtZWJ1ZmZlciBpcyBiZWhpbmQgJ21lbW9yeS1yZWdpb24nLCBidXQgZG9lcyAN
CidyZWcnIHN0aWxsIGNvbnRhaW4gZGV2aWNlIG1lbW9yeT8gIERvIHdlIG5lZWQgdG8gYWNx
dWlyZSBvd25lcnNoaXAgZnJvbSANCndpdGhpbiB0aGUgZHJpdmVyPw0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJl
ZGluZ0BudmlkaWEuY29tPg0KPiAtLS0NCj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3NpbXBsZS1mcmFtZWJ1ZmZlci55YW1sICAgICAgfCA1ICsrKysrDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3NpbXBsZS1mcmFtZWJ1ZmZl
ci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc2lt
cGxlLWZyYW1lYnVmZmVyLnlhbWwNCj4gaW5kZXggZGQ2NGY3MGI1MDE0Li4zZTk4NTdlYjAw
MmUgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3NpbXBsZS1mcmFtZWJ1ZmZlci55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3NpbXBsZS1mcmFtZWJ1ZmZlci55YW1sDQo+
IEBAIC02Myw2ICs2MywxMSBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgcmVnOg0KPiAgICAgICBk
ZXNjcmlwdGlvbjogTG9jYXRpb24gYW5kIHNpemUgb2YgdGhlIGZyYW1lYnVmZmVyIG1lbW9y
eQ0KPiAgIA0KPiArICBtZW1vcnktcmVnaW9uOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsg
ICAgZGVzY3JpcHRpb246IFBoYW5kbGUgdG8gYSBub2RlIGRlc2NyaWJpbmcgdGhlIG1lbW9y
eSB0byBiZSB1c2VkIGZvciB0aGUNCj4gKyAgICAgIGZyYW1lYnVmZmVyLiBJZiBwcmVzZW50
LCBvdmVycmlkZXMgdGhlICJyZWciIHByb3BlcnR5IChpZiBvbmUgZXhpc3RzKS4NCj4gKw0K
PiAgICAgY2xvY2tzOg0KPiAgICAgICBkZXNjcmlwdGlvbjogTGlzdCBvZiBjbG9ja3MgdXNl
ZCBieSB0aGUgZnJhbWVidWZmZXIuDQo+ICAgDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------sIbpmdC2orz54ETODCdR3EK0--

--------------a0wIL5ytpXFqM0nZv7pvRqjW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmND5+EFAwAAAAAACgkQlh/E3EQov+B9
+hAAhXAu898Lk0j0xMR/DP3Wv4Bt7o83ickLkgRKznHT3B7MTjurCOoXYovrdQ/bAwVq8o3PvvPa
18zhiOOaz0LJUs0oUD6F38KnmjxZYZa4Ag+YoOJvOOzGUZB6njpGlzF0+KqrWOvZGCZFyIvUUhaZ
pG4NbWGp9jcLs3c5KxQBeMcwxX36sip+m/EtEKtFCNiaFAnN11mgAgYfwfhW2hS1/tqE8ORPYokX
UfTZ+5O2/VMnsSiEwdY41jtglUGFExIuIjKD39qzQQ2oiSqf21KEbuauWw5JfmA3reX4TTUeOJLI
GFJKpD9fHhO8FxRgGTAeawSPZ0g2Z+FcHIJ+ZTXFl982hgTN87h+ljE+fyWb1+t1JEslHE3ASORO
hTlJ8h9C95VovbIIpKb7GrqfmvZ0ZWNWG4PxafEFVWVSKIMPaILRdNStzDnWtQxhctq0LqhEA5sW
8xM0v8OkXr+G7o7gVCYwz/Io68bSULH8kKJee0w+rmuQsZHkXkOpy7q3gQv7guZZsjHrd/0du8ab
KPrGwT4rNdmXOIsjW434cXjU20ZFZgjW0SZk6Qk4F/t5n8D7TZrf0AaQ3iIkxRwYQXmCr3KvEv4Y
hZUE6/wGk+Wtcgo0zNlr59TmQnV1+3lnfeM6vcgX4B/jOgW1ZxXqI78IfLpD9EsyOGQKYZYEx9js
vpA=
=JYB5
-----END PGP SIGNATURE-----

--------------a0wIL5ytpXFqM0nZv7pvRqjW--
