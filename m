Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D22675FF28
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 20:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B601E10E0F6;
	Mon, 24 Jul 2023 18:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF4010E0F6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 18:34:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 041191FDAD;
 Mon, 24 Jul 2023 18:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690223660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O9oTJrhKV5D4Haz708f8csnBdp2DqKT7PmGSG88VgFA=;
 b=V0gfNYW+So/f+iHwMqzPeRcvprKV8K4D+GyilbVArYNmabh9UWy0p6djVxhU7FbCw58ftA
 PsOSE8ebaDlQ9uYFHJfoeYYHl25gYWBVoUUSNN6UpQZN7lfV8egYCZLXTXQnNAfCuwybo2
 2VdJYltQ0Zc7BJUW/C/elP0Zs5Fu1/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690223660;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O9oTJrhKV5D4Haz708f8csnBdp2DqKT7PmGSG88VgFA=;
 b=JoQXiB+/CvWJSxx+a/WSXs3Ay5UI3q5IqjhVuSIwgk+uu0sXGYwQruFlfiY4f2DqSrAvMN
 +CCOAOpgEI2cc+Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D379C13476;
 Mon, 24 Jul 2023 18:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BbGOMivEvmRXXAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jul 2023 18:34:19 +0000
Message-ID: <bb3b4288-9ee0-8d24-4a77-50630a76ac7c@suse.de>
Date: Mon, 24 Jul 2023 20:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: drm/ast: Do not enable PCI resources multiple times
To: suijingfeng <suijingfeng@loongson.cn>, jfalempe@redhat.com,
 airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch
References: <20230712130826.3318-1-tzimmermann@suse.de>
 <5d51f17e-138c-fbc1-c1f7-b0d3f09bcf7a@loongson.cn>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5d51f17e-138c-fbc1-c1f7-b0d3f09bcf7a@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6W8VDYwmSDVwVx3lUBIloPzR"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6W8VDYwmSDVwVx3lUBIloPzR
Content-Type: multipart/mixed; boundary="------------SVuUPIyijKq4pMzypfAwNeZl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: suijingfeng <suijingfeng@loongson.cn>, jfalempe@redhat.com,
 airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <bb3b4288-9ee0-8d24-4a77-50630a76ac7c@suse.de>
Subject: Re: drm/ast: Do not enable PCI resources multiple times
References: <20230712130826.3318-1-tzimmermann@suse.de>
 <5d51f17e-138c-fbc1-c1f7-b0d3f09bcf7a@loongson.cn>
In-Reply-To: <5d51f17e-138c-fbc1-c1f7-b0d3f09bcf7a@loongson.cn>

--------------SVuUPIyijKq4pMzypfAwNeZl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDcuMjMgdW0gMDc6NDAgc2NocmllYiBzdWlqaW5nZmVuZzoNCj4gSGks
DQo+IA0KPiANCj4gQWN0dWFsbHkswqAgSSdtIG9ubHkgYSBsaXR0bGUgYml0IHdvcnJ5IGFi
b3V0IHRoZSBhc3RfcG1fdGhhdygpIGNvZGUgcGF0aC4NCj4gDQo+IHwtIGFzdF9wbV90aGF3
KCkNCj4gDQo+IHwtLSBhc3RfZHJtX3RoYXcoKQ0KPiANCj4gfC0tLSBhc3RfcG9zdF9ncHUo
KQ0KDQpJJ20gbm90IHF1aXRlIHN1cmUgd2hhdCBtZWFuIGhlcmUsIGJlY2F1c2UgdGhlIHBv
c3QtR1BVIGNvZGUgaXMgbm90IA0KaW52b2x2ZWQgaW4gdGhpcyBwYXRjaC4gQWxsIHRoaXMg
cGF0Y2ggZG9lcyBpcyB0byByZW1vdmUgZHVwbGljYXRlZCBjb2RlLg0KDQpJcyB0aGVyZSBh
IGJ1ZyBpbiB0aGUgcG9zdC1HUFUgaGFuZGxpbmc/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQo+IA0KPiBFeGNlcHQgdGhpcywgYWxsIG90aGVyIGNvZGUgcGF0aCBoYXZlIHBj
aV9lbmFibGVfZGV2aWNlKCkgb3IgDQo+IHBjaW1fZW5hYmxlX2RldmljZSgpIGNhbGxlZC4N
Cj4gDQo+IFNvLCB0aGlzIHBhdGNoIHNlZW1zIE9LLg0KPiANCj4gDQo+IE9uIDIwMjMvNy8x
MiAyMTowOCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBSZW1vdmUgYXN0X2luaXRf
cGNpX2NvbmZpZygpIGFzIHRoZSBhc3QgZHJpdmVyIGFscmVhZHkgZW5hYmxlcyB0aGUgUENJ
DQo+PiByZXNvdXJjZXMgYnkgY2FsbGluZyBwY2ltX2VuYWJsZV9kZXZpY2UoKS4NCj4+DQo+
PiBTdWdnZXN0ZWQtYnk6IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4+IFJldmlld2VkLWJ5OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhh
dC5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyB8
IDIxIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIxIGRl
bGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9tYWluLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYw0KPj4gaW5k
ZXggOGJmYmRmZDg2ZDc3Li5kYWUzNjVlZDM5NjkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3Qv
YXN0X21haW4uYw0KPj4gQEAgLTM1LDIzICszNSw2IEBADQo+PiDCoCAjaW5jbHVkZSAiYXN0
X2Rydi5oIg0KPj4gLXN0YXRpYyBpbnQgYXN0X2luaXRfcGNpX2NvbmZpZyhzdHJ1Y3QgcGNp
X2RldiAqcGRldikNCj4+IC17DQo+PiAtwqDCoMKgIGludCBlcnI7DQo+PiAtwqDCoMKgIHUx
NiBwY2lzMDQ7DQo+PiAtDQo+PiAtwqDCoMKgIGVyciA9IHBjaV9yZWFkX2NvbmZpZ193b3Jk
KHBkZXYsIFBDSV9DT01NQU5ELCAmcGNpczA0KTsNCj4+IC3CoMKgwqAgaWYgKGVycikNCj4+
IC3CoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsNCj4+IC0NCj4+IC3CoMKgwqAgcGNpczA0IHw9
IFBDSV9DT01NQU5EX01FTU9SWSB8IFBDSV9DT01NQU5EX0lPOw0KPj4gLQ0KPj4gLcKgwqDC
oCBlcnIgPSBwY2lfd3JpdGVfY29uZmlnX3dvcmQocGRldiwgUENJX0NPTU1BTkQsIHBjaXMw
NCk7DQo+PiAtDQo+PiAtb3V0Og0KPj4gLcKgwqDCoCByZXR1cm4gcGNpYmlvc19lcnJfdG9f
ZXJybm8oZXJyKTsNCj4+IC19DQo+PiAtDQo+PiDCoCBzdGF0aWMgYm9vbCBhc3RfaXNfdmdh
X2VuYWJsZWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+IMKgIHsNCj4+IMKgwqDCoMKg
wqAgc3RydWN0IGFzdF9kZXZpY2UgKmFzdCA9IHRvX2FzdF9kZXZpY2UoZGV2KTsNCj4+IEBA
IC00ODMsMTAgKzQ2Niw2IEBAIHN0cnVjdCBhc3RfZGV2aWNlICphc3RfZGV2aWNlX2NyZWF0
ZShjb25zdCBzdHJ1Y3QgDQo+PiBkcm1fZHJpdmVyICpkcnYsDQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUigtRUlPKTsNCj4+IMKgwqDCoMKgwqAgfQ0K
Pj4gLcKgwqDCoCByZXQgPSBhc3RfaW5pdF9wY2lfY29uZmlnKHBkZXYpOw0KPj4gLcKgwqDC
oCBpZiAocmV0KQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKHJldCk7DQo+
PiAtDQo+PiDCoMKgwqDCoMKgIGlmICghYXN0X2lzX3ZnYV9lbmFibGVkKGRldikpIHsNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1faW5mbyhkZXYsICJWR0Egbm90IGVuYWJsZWQgb24g
ZW50cnksIHJlcXVlc3RpbmcgY2hpcCANCj4+IFBPU1RcbiIpOw0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIG5lZWRfcG9zdCA9IHRydWU7DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJt
YW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91
ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------SVuUPIyijKq4pMzypfAwNeZl--

--------------6W8VDYwmSDVwVx3lUBIloPzR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmS+xCsFAwAAAAAACgkQlh/E3EQov+B+
shAA0JLkN96pKq7Kt6CqgLOQdF3DG8NgMoG8/zFLd1kotJMzS6SlmPfbZ6sATfp/axbEa2iYy/ES
4TOjCzPZo6Fw7Ajv3Pp0sxL/4e8WevFyWjqje++uGHNBdTkur/RcUTCHJOljwWNgrSUWCtg0mH/d
NA07oXCWuRyexX4dVPxggpISwDtOEL5uixn0Mv8ZqRXDkWytODey/t1faPmmV1oXtiwjI8ZCSSNn
vABaNSq/UQgI7xu8aWiKO6QhLe4QIHzow04xj5IHeOB275if5KVf5IQntiEygcSIxNt1njYPScQQ
HF6I2itJtSWyHANPYCRw3btsKMl6K6qvTzI6V5ypBRSiBsuLnrD3iDNfNXX4Ca0qGCZiGGgx9tOx
2Sda4lpG7d5ZbAmM4yqGqgrtuSn7ze82u+xfdZk39hfo7JFuKTG6rlOnLnZmTKyhCav9v46IGEQR
Q1i/wwd6Nhzuszz1Cs3cHOAtf1ER3x9RXu7HQAXDihZjz/bH+2roc7VhajtfDDvnluVomyBpK+YT
gFKVSDC6XmexbHSCK4I3WqGO+rIctATZMpXukVGog0BUaO7J0Sw0D0X/RyR4YhwrkIBDFdkHXLdB
/DbvIZgvWD9yn7Wrnjinsr0kxeZ+NyfhUWdEAfjYEftCsN4bVwSQzyYgYZmNTZJY2kMIJJK5rvCU
Yg8=
=TFfI
-----END PGP SIGNATURE-----

--------------6W8VDYwmSDVwVx3lUBIloPzR--
