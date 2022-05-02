Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AA8517045
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F32A10E9DE;
	Mon,  2 May 2022 13:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEED10E9DE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 13:26:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98ECF1F38D;
 Mon,  2 May 2022 13:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651498006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7mYhzVIijfS2u6zKyiGE65SdMXrZnKk56ieyLXm2bM=;
 b=OQi8JYs6fQ97+yvu03rmQ2kh+3v6zp4y6dG7XwGWt70l0w/3H6WbDVrChl54Qk9v3KmkZg
 5/kvgrq129PzcQxz8QIx0Gb108yhh9EzocxNyZP6Vi8P9P/T0R0d72QJ0ijZfp6Ak/iiUx
 tjG5sdSLZ+E7Q1Ux0v7sTlSxQCZs8oI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651498006;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7mYhzVIijfS2u6zKyiGE65SdMXrZnKk56ieyLXm2bM=;
 b=TQqWk+L1WxWYM8vpryDBtz4mMLWFKq+ysXcyNXlQy9XTMbfOHuA0MGBo3ZLFQ4ZLqA928v
 iFg4DuZ+pR2uvQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61E7E133E5;
 Mon,  2 May 2022 13:26:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dRnxFhbcb2L1FQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 May 2022 13:26:46 +0000
Message-ID: <fa010244-b250-ea6d-275e-bfbe1bd8f212@suse.de>
Date: Mon, 2 May 2022 15:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] fbdev: Check in file_fb_info() if the fb_info was
 already been freed
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220502130944.363776-1-javierm@redhat.com>
 <20220502130944.363776-2-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220502130944.363776-2-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GxDwQo1TEarUTpectLcHvWN4"
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Helge Deller <deller@gmx.de>, Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GxDwQo1TEarUTpectLcHvWN4
Content-Type: multipart/mixed; boundary="------------ItrIdni06cTQRrs0VpNguz7k";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Helge Deller <deller@gmx.de>, Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <fa010244-b250-ea6d-275e-bfbe1bd8f212@suse.de>
Subject: Re: [PATCH 1/2] fbdev: Check in file_fb_info() if the fb_info was
 already been freed
References: <20220502130944.363776-1-javierm@redhat.com>
 <20220502130944.363776-2-javierm@redhat.com>
In-Reply-To: <20220502130944.363776-2-javierm@redhat.com>

--------------ItrIdni06cTQRrs0VpNguz7k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDUuMjIgdW0gMTU6MDkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IElmIHJlYWwgZHJpdmVyIHByb2JlcywgdGhlIGZiZGV2IGNvcmUga2lja3Mg
b3V0IGFsbCBkcml2ZXJzIHRoYXQgYXJlIHVzaW5nDQo+IGEgZnJhbWVidWZmZXIgdGhhdCB3
ZXJlIHByb3ZpZGVkIGJ5IHRoZSBzeXN0ZW0gZmlybXdhcmUuIEJ1dCBpdCBjb3VsZCBiZSBh
DQo+IHVzZXItc3BhY2UgcHJvY2VzcyBzdGlsbCBoYXMgYSBmaWxlIGRlc2NyaXB0b3IgZm9y
IHRoZSBmYmRldiBkZXZpY2Ugbm9kZS4NCj4gDQo+IFRoaXMgY2FuIGxlYWQgdG8gYSBOVUxM
IHBvaW50ZXIgZGVyZWZlcmVuY2UsIGlmIHRoZSBmcmFtZWJ1ZmZlciBkZXZpY2UgaXMNCj4g
dW5yZWdpc3RlcmVkIGFuZCBhc3NvY2lhdGVkIGRhdGEgZnJlZWQsIGJ1dCBsYXRlciBpbiB0
aGUgLnJlbGVhc2UgY2FsbGJhY2sNCj4gaXMgYXR0ZW1wdGVkIHRvIGFjY2VzcyBpdHMgc3Ry
dWN0IGZiX2luZm8uDQo+IA0KPiBUbyBwcmV2ZW50IHRoaXMsIG1ha2UgZmlsZV9mYl9pbmZv
KCkgdG8gYWxzbyBjaGVjayB0aGUgZmJfaW5mbyByZWZlcmVuY2UNCj4gY291bnRlciBhbmQg
anVzdCByZXR1cm4gTlVMTCBpZiB0aGlzIGVxdWFscyB6ZXJvLiBTaW5jZSB0aGF0IG1lYW5z
IGl0IGhhcw0KPiBhbHJlYWR5IGJlZW4gZnJlZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBK
YXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gLS0tDQo+
IA0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIHwgOSArKysrKysrLS0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIGIv
ZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMNCj4gaW5kZXggODQ0Mjc0NzAzNjdi
Li4yMGQ4OTI5ZGY3OWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29y
ZS9mYm1lbS5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jDQo+
IEBAIC03NTEsOCArNzUxLDEzIEBAIHN0YXRpYyBzdHJ1Y3QgZmJfaW5mbyAqZmlsZV9mYl9p
bmZvKHN0cnVjdCBmaWxlICpmaWxlKQ0KPiAgIAlpbnQgZmJpZHggPSBpbWlub3IoaW5vZGUp
Ow0KPiAgIAlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IHJlZ2lzdGVyZWRfZmJbZmJpZHhdOw0K
PiAgIA0KPiAtCWlmIChpbmZvICE9IGZpbGUtPnByaXZhdGVfZGF0YSkNCj4gLQkJaW5mbyA9
IE5VTEw7DQo+ICsJaWYgKCFpbmZvKQ0KPiArCQlyZXR1cm4gTlVMTDsNCj4gKw0KPiArCS8q
IGNoZWNrIHRoYXQgdGhlIGZiX2luZm8gaGFzIG5vdCBjaGFuZ2VkIG9yIHdhcyBhbHJlYWR5
IGZyZWVkICovDQo+ICsJaWYgKGluZm8gIT0gZmlsZS0+cHJpdmF0ZV9kYXRhIHx8IHJlZmNv
dW50X3JlYWQoJmluZm8tPmNvdW50KSA9PSAwKQ0KPiArCQlyZXR1cm4gTlVMTDsNCj4gKw0K
DQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoN
Ckhvd2V2ZXIsIEknbSBoYXZpbmcgcHJvYmxlbXMgd2l0aCB0aGUgc2VtYW50aWNzIG9mIHRo
ZXNlIHZhcmlhYmxlczogaWYgDQp3ZSBoYXZlIGFuIGluZm8gZnJvbSByZWdpc3RlcmVkX2Zi
W2ZiaW54XSBhbmQgdGhlIHJlZmNvdW50IGluIA0KaW5mby0+Y291bnQgaXMgc3RpbGwgMCwg
aXNuJ3QgdGhhdCBhIGNvbnNpc3RlbmN5IHByb2JsZW0/IElmIHNvLCB3ZSANCnNob3VsZCBw
cmludCBhIFdBUk5fT04oKS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQo+ICAgCXJl
dHVybiBpbmZvOw0KPiAgIH0NCj4gICANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------ItrIdni06cTQRrs0VpNguz7k--

--------------GxDwQo1TEarUTpectLcHvWN4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJv3BYFAwAAAAAACgkQlh/E3EQov+D+
bxAAktuIMYX016QZSXR5Od44lyk39YY23fpUoPgSy+PHxbq/JQhL9XezZqHh5q2wJ1fCAmp9CV/I
XOJSmGhBh+eBHcop7dKjtJzA01P6EOhKNlh6hlYgtaD1N9wP3MMrb9xgzgtvl9py1dKTwH8aAoqg
lNWYzV4p0EIFUWtsR4XIX2dcN6upBjcDLnk83OtZWMlBmSbYKAMuJryA44CRAqPzGLu/bzCq7LKD
Cu5fhiFOPHH9dj55UJKQNpVrtHhjWiAFOc1ftqE2Gml24dkqVo7gdxgpb+ahfp6iIRH1TBl3EQTR
p475oVk5jHx05aaDbCrBPcr3A3vyM955BwiI3Vpg9bxsQ/NzADPxWxzHFSbdZHO/V6AbnLa4tThG
+LEPr2DUdVnHwOVVAP6DbdAAXf1yD61EpIL58/pThtHmCetHZLbgAvVWGThfEqHMJLGTifgh7jyt
jjkyXg2Q0fRyjvPRLmYn/ykj6C96mqkyffAzNChEx5t5NJWUQMrj7bHQFQkIYXCL0Kcv1pi+fdKl
a2KWg74n7r/WD5WI15VYtXA8/SLFyb+PnpVKNvA+vcEQWhTQzLS4w/Ui2mXYN1zRN2fG3SsELXVq
7392yHYKEPS3nXbRCst+9prlyFeFZPJNp1eIRIqD3L+fwRr1837QuCooXiRSPYX+8tx4D7YYuA1I
fkw=
=+q52
-----END PGP SIGNATURE-----

--------------GxDwQo1TEarUTpectLcHvWN4--
