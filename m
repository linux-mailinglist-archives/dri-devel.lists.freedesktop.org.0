Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA28486218
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 10:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD4910E6B0;
	Thu,  6 Jan 2022 09:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E390F10E6B0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 09:28:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 56FE12113A;
 Thu,  6 Jan 2022 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641461318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0MpX4yMyDeZs/NVgBMJHdJP+mUfr/vDic6nYvSu/5AA=;
 b=h42UkRjr7FV6muRVxZJ+5XyOCRuKTi+lJmlRcU0j4mn5+/2HPHIar/7Ot7TkNi6auC25KW
 +3DhOt7GO+bELpuz7i1jXsd2Vcq45QTLWNOc5wl6o/WgroTWk289XoX0Sq2wxwDYlfqvyJ
 rK5qxiMgXKl1y40MwurtJdL8rGdef4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641461318;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0MpX4yMyDeZs/NVgBMJHdJP+mUfr/vDic6nYvSu/5AA=;
 b=uEXlYtlK3Ot7mtR/v7z/qt4KCZVr8XUSEZDaiUnqUAxMZVRH4mwPKd/k8degLlFg2r/Qke
 WRLEEKA125qTwTBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B19613BFF;
 Thu,  6 Jan 2022 09:28:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DcbDCEa21mG2aAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jan 2022 09:28:38 +0000
Message-ID: <6d61449c-50dc-e832-3cdc-ade6edfb6307@suse.de>
Date: Thu, 6 Jan 2022 10:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/ast: Enable the supporting of wide screen on AST2600
Content-Language: en-US
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211229082749.5415-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211229082749.5415-1-kuohsiang_chou@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uEBuZiefC1d4a10K7Nm6q56D"
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
Cc: airlied@linux.ie, airlied@redhat.com, arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uEBuZiefC1d4a10K7Nm6q56D
Content-Type: multipart/mixed; boundary="------------PtgtRcG6SDB5eWg7OPJHh1MF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@linux.ie, airlied@redhat.com, arc_sung@aspeedtech.com
Message-ID: <6d61449c-50dc-e832-3cdc-ade6edfb6307@suse.de>
Subject: Re: [PATCH] drm/ast: Enable the supporting of wide screen on AST2600
References: <20211229082749.5415-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20211229082749.5415-1-kuohsiang_chou@aspeedtech.com>

--------------PtgtRcG6SDB5eWg7OPJHh1MF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMTIuMjEgdW0gMDk6Mjcgc2NocmllYiBLdW9Ic2lhbmcgQ2hvdToNCj4g
RW5hYmxlIHRoZSBzdXBwb3J0aW5nIG9mIHdpZGUgc3NjcmVlbiBvbiBBU1QyNjAwLCBzbyB0
aGF0IHRoZSByZXNvbHV0aW9uDQo+IG9mIDE2OjkgYW5kIDE2OjEwIGFyZSBhYmxlIHRvIGJl
IHNlbGVjdGVkIG9uIERpc3BsYXkgU2V0dGluZ3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBL
dW9Ic2lhbmcgQ2hvdSA8a3VvaHNpYW5nX2Nob3VAYXNwZWVkdGVjaC5jb20+DQoNCkFkZGVk
IHRvIGRybS1taXNjLW5leHQuIFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4u
YyB8IDIgKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+IGluZGV4IDlmMjVmYTJjOC4uMTExM2VlMWNiIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+IEBAIC0yMDksNiArMjA5LDggQEAg
c3RhdGljIGludCBhc3RfZGV0ZWN0X2NoaXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgYm9v
bCAqbmVlZF9wb3N0KQ0KPiAgIAkJCWlmIChhc3QtPmNoaXAgPT0gQVNUMjUwMCAmJg0KPiAg
IAkJCSAgICBzY3VfcmV2ID09IDB4MTAwKSAgICAgICAgICAgLyogYXN0MjUxMCAqLw0KPiAg
IAkJCQlhc3QtPnN1cHBvcnRfd2lkZV9zY3JlZW4gPSB0cnVlOw0KPiArCQkJaWYgKGFzdC0+
Y2hpcCA9PSBBU1QyNjAwKQkJLyogYXN0MjYwMCAqLw0KPiArCQkJCWFzdC0+c3VwcG9ydF93
aWRlX3NjcmVlbiA9IHRydWU7DQo+ICAgCQl9DQo+ICAgCQlicmVhazsNCj4gICAJfQ0KPiAt
LQ0KPiAyLjI3LjANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------PtgtRcG6SDB5eWg7OPJHh1MF--

--------------uEBuZiefC1d4a10K7Nm6q56D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHWtkUFAwAAAAAACgkQlh/E3EQov+C6
iA/7BaRYi4Uiappu9xJ0l5oHH9O4K8RFQE/58GJ4QGSO4khELwnjZA6dfzCw5xwAcO9rZSrjnKgR
II7u5iTx+hYN/rUzYb7etEd11lmkq2OCsTnv9MrSizsGsx6YhfVCBYY71aZOFjz0OOSiALHlfZh8
tmgqdjA2v6WYB/ZfGZ42+O3h179Jv2zj2pkOaQABm9NH4b+30uOkE3hbPekx6KMCs/gCZp7X6z3w
egcT5ibM7NkTMOeuVNL1XweTu6uS+AlIw6JBI+ZpeERH+9uB0ar2heJrxGZF4QJKmpUdyxiF8MCX
xVJwG1Uy/1xiGo41xu+I9Add1nLe/0Sxr9imq4eJ1y3jlW6gvQ0A5tLVvhplLI+VUoF92CVaOtbN
bLfvR4rqVZPaCNNy0nw/HGc/8WPKtLWmolSHPD32LEyQphNGfoqCU1Nu5uSU+CrfosaX5b7z7j7Z
/c4BkK9OHptx8S88jQRlR+/8y1sVxK4YcrOc3Ch4yIv0Jt5nuJJ1V+QwilKebF2J983wIEnqNxkX
6E+aejWAcu4vg/rmdrFZdIY0eIwOjC9ZyP7OkkJ4cIXVIr53PhDCL7rFxMw1KuNOu8AGYW3080An
Ze7eSfiYkjuDuY03KKF6j/TS/luQBMmQPAgdZTNE96jD7b+hG/wPfntSmsBfqAZjKr4cZl9ivXOc
hms=
=z1DL
-----END PGP SIGNATURE-----

--------------uEBuZiefC1d4a10K7Nm6q56D--
