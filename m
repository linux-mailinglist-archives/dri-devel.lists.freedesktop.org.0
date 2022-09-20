Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF3D5BDE19
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 09:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052D510E322;
	Tue, 20 Sep 2022 07:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15EB10E330
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 07:26:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E49A21B36;
 Tue, 20 Sep 2022 07:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663658777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3PeCS/yBFSZVyNXhKYUrSHHlEDqJEiucYvQEA/FX+MM=;
 b=1XP0JjaIiHPqIlDGU+CDILW0SOWYmXhDuJJYJi9hbjMjWeThLG2b6XCDVQwrTXvhKSEQJM
 UVJF6aq1p80EePK/yY4GTKxmlT+J3VR8y5d/PwBGpPwsmN13q4WmHlA7G4oEq2ibfAuxZN
 FNBHW3wILWstgR0dmGALYl3e7OjSTn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663658777;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3PeCS/yBFSZVyNXhKYUrSHHlEDqJEiucYvQEA/FX+MM=;
 b=ejXPnUyV+XHReXT0o5UsVq6lvZFhm6p05ramBKj/cjdQ98jXxvO6T5qXWVOiwuJLvfo+4i
 q5MLeXKc80ZsZbBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35AC91346B;
 Tue, 20 Sep 2022 07:26:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /xD9CxlrKWPRSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Sep 2022 07:26:17 +0000
Message-ID: <0a5b956a-44fe-0f52-3aa7-8c56478f151c@suse.de>
Date: Tue, 20 Sep 2022 09:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/atomic-helper: Fix kernel-doc
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 maarten.lankhorst@linux.intel.com
References: <20220919103058.25561-1-jiapeng.chong@linux.alibaba.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220919103058.25561-1-jiapeng.chong@linux.alibaba.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------j02J4B0XSmBUzA8rrkUSw8XB"
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
Cc: airlied@linux.ie, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------j02J4B0XSmBUzA8rrkUSw8XB
Content-Type: multipart/mixed; boundary="------------OcB80JGl96eFA8X4jK2Ftjcg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
Message-ID: <0a5b956a-44fe-0f52-3aa7-8c56478f151c@suse.de>
Subject: Re: [PATCH] drm/atomic-helper: Fix kernel-doc
References: <20220919103058.25561-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220919103058.25561-1-jiapeng.chong@linux.alibaba.com>

--------------OcB80JGl96eFA8X4jK2Ftjcg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE5LjA5LjIyIHVtIDEyOjMwIHNjaHJpZWIgSmlhcGVuZyBDaG9uZzoNCj4gZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmM6ODAyOiB3YXJuaW5nOiBleHBlY3Rp
bmcgcHJvdG90eXBlIGZvciBkcm1fYXRvbWljX2hlbHBlcl9jaGVja193Yl9jb25uZWN0b3Jf
c3RhdGUoKS4gUHJvdG90eXBlIHdhcyBmb3IgZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfd2Jf
ZW5jb2Rlcl9zdGF0ZSgpIGluc3RlYWQuDQo+IA0KPiBMaW5rOiBodHRwczovL2J1Z3ppbGxh
Lm9wZW5hbm9saXMuY24vc2hvd19idWcuY2dpP2lkPTIyMTYNCj4gUmVwb3J0ZWQtYnk6IEFi
YWNpIFJvYm90IDxhYmFjaUBsaW51eC5hbGliYWJhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
SmlhcGVuZyBDaG9uZyA8amlhcGVuZy5jaG9uZ0BsaW51eC5hbGliYWJhLmNvbT4NCg0KQXBw
bGllZCwgdGhhbmtzIGEgbG90Lg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
YXRvbWljX2hlbHBlci5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fYXRvbWljX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVs
cGVyLmMNCj4gaW5kZXggZWU1ZmVhNDhiNWNiLi45OGNjMzEzN2MwNjIgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jDQo+IEBAIC03ODYsNyArNzg2LDcgQEAg
ZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfbW9kZXNldChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LA0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfbW9kZXNldCk7
DQo+ICAgDQo+ICAgLyoqDQo+IC0gKiBkcm1fYXRvbWljX2hlbHBlcl9jaGVja193Yl9jb25u
ZWN0b3Jfc3RhdGUoKSAtIENoZWNrIHdyaXRlYmFjayBlbmNvZGVyIHN0YXRlDQo+ICsgKiBk
cm1fYXRvbWljX2hlbHBlcl9jaGVja193Yl9lbmNvZGVyX3N0YXRlKCkgLSBDaGVjayB3cml0
ZWJhY2sgZW5jb2RlciBzdGF0ZQ0KPiAgICAqIEBlbmNvZGVyOiBlbmNvZGVyIHN0YXRlIHRv
IGNoZWNrDQo+ICAgICogQGNvbm5fc3RhdGU6IGNvbm5lY3RvciBzdGF0ZSB0byBjaGVjaw0K
PiAgICAqDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------OcB80JGl96eFA8X4jK2Ftjcg--

--------------j02J4B0XSmBUzA8rrkUSw8XB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMpaxgFAwAAAAAACgkQlh/E3EQov+Dq
JQ//dHk4evyfD1V/iW6nZZV9FPPGW7hcP/86IBtemPTfygoV+aZTYJ9RxQ5IbZAGojo7YyRTrYPE
DqFTO9aX6yZXYyxpBOOrfHXwIhxBqsjyLzn6V6EDWXFN4IJRJmHCgW7/LeeJd51Yjy6opQr7eezo
8fAkSoIw9hXQyDgRDl1M7TphuEHGc6cyKvtc5rIM4A9/xzDp/JlTeeMFiieJ8Fsfbt7Tzy+OQRdu
t5BIjzK4EZ3Bztfcbr/s72jMZ7UvgQMKo9AKeFimZAYx9Dt/zkOQgR6SDxkISMkoLIhxyGD0upx1
QGD8FVIgXY2ZPNDvcly2XwuucmnDGiuRLVTBEezGrgBXyQJ5Z57YouCEvj7ZHyqbY7CoaON3N8JP
I00F84GCUah74G5adRFE/zRCwUiWF191kL3W+6B8Py5OB0c3PGUNpblRWQkucAYxe2IEduQ/0jLc
deFjcbQKlCu23yrrkF8t3/HjdWFvujFGwuyLq8BDvPV4Gm0lCpYihtRrQwSq2uIIC3u0/P87WxX2
5LD8lv/k44OK2QsDgaeCiYu/juGVheNK793gJezHyTqmK858kE0yS1R0OluexgTBVPj2U2dsuFfV
fkKYLyqii8E+HMXgTDZibvAp6QzrpNwAugOsYK8Y5/HqQ6XMp/JRznX5+absdBy3j0+NIZbV823u
7Lc=
=OvmC
-----END PGP SIGNATURE-----

--------------j02J4B0XSmBUzA8rrkUSw8XB--
