Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF168646C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 11:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D775510E3E1;
	Wed,  1 Feb 2023 10:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1267610E3E1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 10:37:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6CFF3370C;
 Wed,  1 Feb 2023 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675247868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7dknyLkO73ygt9vBhoceK7Ye2jngYAD05fHku6QQaSY=;
 b=K8StW1l2cdNxZxs+GDvb44NHOFDZYqjDdcHmqps9gFa5H8tNVUYPDcwKz9+lqX3+nkwE3C
 f7k8kplVFFtTj/Qj0ZZzvRn5VWUIphp5bIc74vfIKm9GxE36D8kI96gUFpvg9tSPTeUBmJ
 3J2aDJx1Rms9jrWBBUHswsvFslQykhQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675247868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7dknyLkO73ygt9vBhoceK7Ye2jngYAD05fHku6QQaSY=;
 b=23PuvmDkNBVnzIG2NJqs3GcM5hue36Pn8MrUBdTC4h/94lsKtt8LuW/L/y5/nZaKybqVmJ
 hF7gHaeCX2j4ucCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 983A313A10;
 Wed,  1 Feb 2023 10:37:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tZu8I/xA2mPcBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Feb 2023 10:37:48 +0000
Message-ID: <857f4b92-fba7-0afe-55d9-52e84543e58f@suse.de>
Date: Wed, 1 Feb 2023 11:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] accel/ivpu: avoid duplciate assignment
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20230126163804.3648051-1-arnd@kernel.org>
 <20230126163804.3648051-2-arnd@kernel.org>
 <92f5faec-7fd5-4205-0b0f-1ed15626c30b@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <92f5faec-7fd5-4205-0b0f-1ed15626c30b@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mbh0nDHae58PyReWvashjCa7"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mbh0nDHae58PyReWvashjCa7
Content-Type: multipart/mixed; boundary="------------mDyCDoTDlytybpA01dMLZzzG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <857f4b92-fba7-0afe-55d9-52e84543e58f@suse.de>
Subject: Re: [PATCH 2/2] accel/ivpu: avoid duplciate assignment
References: <20230126163804.3648051-1-arnd@kernel.org>
 <20230126163804.3648051-2-arnd@kernel.org>
 <92f5faec-7fd5-4205-0b0f-1ed15626c30b@linux.intel.com>
In-Reply-To: <92f5faec-7fd5-4205-0b0f-1ed15626c30b@linux.intel.com>

--------------mDyCDoTDlytybpA01dMLZzzG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMxLjAxLjIzIHVtIDE1OjAwIHNjaHJpZWIgSmFjZWsgTGF3cnlub3dpY3o6DQo+
IEFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4gVGhhbmtzLg0KDQpJIGhhdmUgY2hlcnJ5LXBp
Y2tlZCB0aGUgcGF0Y2ggaW50byBkcm0tbWlzYy1uZXh0LWZpeGVzLg0KDQo+IA0KPiBPbiAy
Ni4wMS4yMDIzIDE3OjM3LCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0KPj4gRnJvbTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4+DQo+PiBXaXRoIGV4dHJhIHdhcm5pbmdzIGVu
YWJsZWQsIGdjYyB3YXJucyBhYm91dCB0d28gYXNzaWdubWVudHMNCj4+IG9mIHRoZSBzYW1l
IC5tbWFwIGNhbGxiYWNrOg0KPj4NCj4+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJz
L2FjY2VsL2l2cHUvaXZwdV9kcnYuYzoxMDoNCj4+IGluY2x1ZGUvZHJtL2RybV9hY2NlbC5o
OjMxOjI3OiBlcnJvcjogaW5pdGlhbGl6ZWQgZmllbGQgb3ZlcndyaXR0ZW4gWy1XZXJyb3I9
b3ZlcnJpZGUtaW5pdF0NCj4+ICAgICAzMSB8ICAgICAgICAgLm1tYXAgICAgICAgICAgID0g
ZHJtX2dlbV9tbWFwDQo+PiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fg0KPj4gZHJpdmVycy9hY2NlbC9pdnB1L2l2cHVfZHJ2LmM6MzYwOjk6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnRFJNX0FDQ0VMX0ZPUFMnDQo+PiAgICAzNjAg
fCAgICAgICAgIERSTV9BQ0NFTF9GT1BTLA0KPj4gICAgICAgIHwgICAgICAgICBefn5+fn5+
fn5+fn5+fg0KPj4NCj4+IFJlbW92ZSB0aGUgdW51c2VkIGxvY2FsIGFzc2lnbm1lbnQuDQo+
Pg0KPj4gRml4ZXM6IDIwNzA5YWE5NDM1YiAoImFjY2VsOiBBZGQgLm1tYXAgdG8gRFJNX0FD
Q0VMX0ZPUFMiKQ0KPj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2FjY2VsL2l2cHUvaXZwdV9kcnYuYyB8IDEg
LQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2FjY2VsL2l2cHUvaXZwdV9kcnYuYyBiL2RyaXZlcnMvYWNjZWwvaXZw
dS9pdnB1X2Rydi5jDQo+PiBpbmRleCAyYmMyZjFiOTA2NzEuLmEyOWU4ZWUwZGNlNiAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvYWNjZWwvaXZwdS9pdnB1X2Rydi5jDQo+PiArKysgYi9k
cml2ZXJzL2FjY2VsL2l2cHUvaXZwdV9kcnYuYw0KPj4gQEAgLTM1Niw3ICszNTYsNiBAQCBp
bnQgaXZwdV9zaHV0ZG93bihzdHJ1Y3QgaXZwdV9kZXZpY2UgKnZkZXYpDQo+PiAgIA0KPj4g
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBpdnB1X2ZvcHMgPSB7DQo+
PiAgIAkub3duZXIJCT0gVEhJU19NT0RVTEUsDQo+PiAtCS5tbWFwICAgICAgICAgICA9IGRy
bV9nZW1fbW1hcCwNCj4+ICAgCURSTV9BQ0NFTF9GT1BTLA0KPj4gICB9Ow0KPj4gICANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------mDyCDoTDlytybpA01dMLZzzG--

--------------mbh0nDHae58PyReWvashjCa7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPaQPwFAwAAAAAACgkQlh/E3EQov+Ai
6A//cMMsJ4AvQxwOKxpV+caBp18tLIC1n+76EBkATeS137PYg67IypnbTLqxGPHg49U7Lo8p+YUY
YZiXk68URCw7m+eNSHQ3+3cPXZMO83eEJA2DGcS3iX94rCmAzR0a/lb/B9wOeA8Tba6o0HS9lFa3
SVPCe8upp5atqd3NQWj5CFdXcu6OeDD2Raz/iCuAZab3rdBCDI9AE7yGCr6uvRVreG3Ux3Lb7NwC
VImhyreXRTkSJ0xJZ2LIqYgDVKqSp/W2SRTU0O4eR7n3amsKIkn2M0Lw1PDSLLXVXne5K8QEL5iw
ouoFnRuJvUyo9AFGPqkDu+fuf2uzksCUsQOb9ICMqTxBC7cfZJl5relVnUyh3kUYPk52sVuTz35p
zGcq7Ozvn2VPa8yj9zA0KnpyivPEoJbFu/Dafd4II8CcJ8QQxhpQ131GIeY45E/l7KS3AJPPB7//
guckXhSAFjTuH9twIgZPtqNX0rBhhlvxvpMQL23VG7q0PrG2zjITWIuN8hu8Za5e9sxZBSdU9K07
RSEze8DIZKR8m0M0PzJpTVX1Rqty8qubbwleddoEefq+kg/pUvD6vLyDWaR14DbIko+ohq1MGAM7
077FXhmU+Z86f3CRHvQjFCm5YR8hoxIJ7IOQqvfLsrhshns08sduPP3YndSvGp+q2wSsmRcVTabW
WBM=
=XwQL
-----END PGP SIGNATURE-----

--------------mbh0nDHae58PyReWvashjCa7--
