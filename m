Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8ED605FA0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 14:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D7D10EBEC;
	Thu, 20 Oct 2022 12:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4983 seconds by postgrey-1.36 at gabe;
 Thu, 20 Oct 2022 12:01:01 UTC
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7460D10EA81;
 Thu, 20 Oct 2022 12:01:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2CEEE20A43;
 Thu, 20 Oct 2022 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666267260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xkVVGkBtQDyTBLM0kpfBsn85EfLgvqE9XvpjJpebKS0=;
 b=jH0AvdmQ5Sn82qm3xMDUFxEtzQ8Afd86NNzn7lSCGUrsJFLaw9SnOVNSzFWgYotcUsDNAg
 GKaqBJMmMrfij+SPe7P8hnpSwt/PMM4kACWzGqryH9FajEaW0KkQM86idJuP32rsTloZ7/
 EQO0HWAxraWBomxhUiO5JqjhYu4FO/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666267260;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xkVVGkBtQDyTBLM0kpfBsn85EfLgvqE9XvpjJpebKS0=;
 b=vHl/tg1vlnnTCoJtjSfQJbaUEq4mIb+x/G13qkx57QzPLCFuuxyt3aozzSXnhYTqv6SF/Y
 S/MUxJREit23oWCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E08013494;
 Thu, 20 Oct 2022 12:00:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FxuXIXs4UWMgFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Oct 2022 12:00:59 +0000
Message-ID: <8f3a7b67-d193-eb47-a5a6-8826e9c82f83@suse.de>
Date: Thu, 20 Oct 2022 14:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 01/21] drm/amdgpu: Don't set struct drm_driver.lastclose
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221020103755.24058-1-tzimmermann@suse.de>
 <20221020103755.24058-2-tzimmermann@suse.de>
 <b26e508b-7599-3953-6803-7db00b3cfbcb@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b26e508b-7599-3953-6803-7db00b3cfbcb@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WYrb0xK08aT03AsuaxFIILPE"
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
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WYrb0xK08aT03AsuaxFIILPE
Content-Type: multipart/mixed; boundary="------------gwXK6OaLfaQ8iAMdjblSoB42";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Message-ID: <8f3a7b67-d193-eb47-a5a6-8826e9c82f83@suse.de>
Subject: Re: [PATCH 01/21] drm/amdgpu: Don't set struct drm_driver.lastclose
References: <20221020103755.24058-1-tzimmermann@suse.de>
 <20221020103755.24058-2-tzimmermann@suse.de>
 <b26e508b-7599-3953-6803-7db00b3cfbcb@amd.com>
In-Reply-To: <b26e508b-7599-3953-6803-7db00b3cfbcb@amd.com>

--------------gwXK6OaLfaQ8iAMdjblSoB42
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTAuMjIgdW0gMTM6NDggc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAyMC4xMC4yMiB1bSAxMjozNyBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
RG9uJ3Qgc2V0IHN0cnVjdCBkcm1fZHJpdmVyLmxhc3RjbG9zZS4gSXQncyB1c2VkIHRvIHJl
c3RvcmUgdGhlDQo+PiBmYmRldiBjb25zb2xlLiBCdXQgYXMgYW1kZ3B1IHVzZXMgZ2VuZXJp
YyBmYmRldiBlbXVsYXRpb24sIHRoZQ0KPj4gY29uc29sZSBpcyBiZWluZyByZXN0b3JlZCBi
eSB0aGUgRFJNIGNsaWVudCBoZWxwZXJzIGFscmVhZHkuIFNlZQ0KPj4gdGhlIGNhbGwgdG8g
ZHJtX2NsaWVudF9kZXZfcmVzdG9yZSgpIGluIGRybV9sYXN0Y2xvc2UoKS4NCj4gDQo+ID8/
Pw0KPiANCj4gVGhlIGNvbW1pdCBtZXNzYWdlIGRvZXNuJ3QgbWF0Y2ggd2hhdCB0aGUgcGF0
Y2ggaXMgZG9pbmcuIFlvdSBhcmUgDQo+IHJlbW92aW5nIG91dHB1dF9wb2xsX2NoYW5nZWQg
aW5zdGVhZCBvZiBsYXN0Y2xvc2UgaGVyZS4NCj4gDQo+IERpZCBzb21ldGhpbmcgZ290IG1p
eGVkIHVwPw0KDQpBcmdoaC4gVGhlcmUgYXJlIHBhdGNoZXMgZm9yIGxhc3RjbG9zZSBhbmQg
b3V0cHV0X3BvbGxfY2hhbmdlZC4gVGhlIA0KcmVhc29uIGZvciByZW1vdmluZyB0aGVtIGlz
IHRoZSBzYW1lLCBidXQgdGhhbmtzIHRvIGNvcHkgYW5kIHBhc3RlIHRoZSANCm5hbWVzIGFy
ZSB3cm9uZy4gU28gdGhlIHBhdGNoIGlzIGNvcnJlY3QsIGJ1dCB0aGUgZGVzY3JpcHRpb24g
aXNuJ3QuIA0KV2lsbCBiZSBmaXhlZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAN
Cj4gQ2hlZXJzLA0KPiBDaHJpc3RpYW4uDQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiDCoCBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jwqDCoMKgwqDCoMKg
IHwgMSAtDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIHwgMiAtLQ0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGlzcGxheS5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGlzcGxheS5jDQo+PiBpbmRleCAyMzk5OGY3MjdjN2Y5Li5mYjcxODZjNWFkZTJhIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXku
Yw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXku
Yw0KPj4gQEAgLTEyMjQsNyArMTIyNCw2IEBAIGFtZGdwdV9kaXNwbGF5X3VzZXJfZnJhbWVi
dWZmZXJfY3JlYXRlKHN0cnVjdCANCj4+IGRybV9kZXZpY2UgKmRldiwNCj4+IMKgIGNvbnN0
IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgYW1kZ3B1X21vZGVfZnVuY3MgPSB7DQo+
PiDCoMKgwqDCoMKgIC5mYl9jcmVhdGUgPSBhbWRncHVfZGlzcGxheV91c2VyX2ZyYW1lYnVm
ZmVyX2NyZWF0ZSwNCj4+IC3CoMKgwqAgLm91dHB1dF9wb2xsX2NoYW5nZWQgPSBkcm1fZmJf
aGVscGVyX291dHB1dF9wb2xsX2NoYW5nZWQsDQo+PiDCoCB9Ow0KPj4gwqAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fcHJvcF9lbnVtX2xpc3QgYW1kZ3B1X3VuZGVyc2Nhbl9lbnVtX2xp
c3RbXSA9DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4gaW5kZXggZjZhOWU4ZmRkODdkNi4uZTlhMjhh
NTM2M2I5YSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4+IEBAIC04Miw3ICs4Miw2IEBADQo+PiDC
oCAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfdWFwaS5oPg0KPj4gwqAgI2luY2x1ZGUgPGRy
bS9kcm1fYXRvbWljX2hlbHBlci5oPg0KPj4gwqAgI2luY2x1ZGUgPGRybS9kcm1fYmxlbmQu
aD4NCj4+IC0jaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4NCj4+IMKgICNpbmNsdWRl
IDxkcm0vZHJtX2ZvdXJjYy5oPg0KPj4gwqAgI2luY2x1ZGUgPGRybS9kcm1fZWRpZC5oPg0K
Pj4gwqAgI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+DQo+PiBAQCAtMjgxMCw3ICsyODA5
LDYgQEAgY29uc3Qgc3RydWN0IGFtZGdwdV9pcF9ibG9ja192ZXJzaW9uIGRtX2lwX2Jsb2Nr
ID0NCj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIGFt
ZGdwdV9kbV9tb2RlX2Z1bmNzID0gew0KPj4gwqDCoMKgwqDCoCAuZmJfY3JlYXRlID0gYW1k
Z3B1X2Rpc3BsYXlfdXNlcl9mcmFtZWJ1ZmZlcl9jcmVhdGUsDQo+PiDCoMKgwqDCoMKgIC5n
ZXRfZm9ybWF0X2luZm8gPSBhbWRfZ2V0X2Zvcm1hdF9pbmZvLA0KPj4gLcKgwqDCoCAub3V0
cHV0X3BvbGxfY2hhbmdlZCA9IGRybV9mYl9oZWxwZXJfb3V0cHV0X3BvbGxfY2hhbmdlZCwN
Cj4+IMKgwqDCoMKgwqAgLmF0b21pY19jaGVjayA9IGFtZGdwdV9kbV9hdG9taWNfY2hlY2ss
DQo+PiDCoMKgwqDCoMKgIC5hdG9taWNfY29tbWl0ID0gZHJtX2F0b21pY19oZWxwZXJfY29t
bWl0LA0KPj4gwqAgfTsNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------gwXK6OaLfaQ8iAMdjblSoB42--

--------------WYrb0xK08aT03AsuaxFIILPE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNROHsFAwAAAAAACgkQlh/E3EQov+Af
qg/8DLfmRUYvAEkOGUdb+UPWlqwaao88s9cPeIA3h2HV6bYLuN3tcbcDWHFeQuAGVFYRgYLVboNR
UtD8lzBIfELkuzD83B+VRxYJBSUdOWNVr5cmES8vFHFcFPQKMLAl/NCnOZOkXBa2xbSyfsJ9t/t4
yXi4FqFTtRT4SWIfAHVY2cduEA/oRkqwmhB1nu+Nv+dWdMxKlWT5W5cc9D/tV7PNyU0D43q/xC3U
UPqtz6yMg2u6UXyQ4smF0HltdBU+CjGDnCKVwKfW1JHy3eo2ONTt3ORu7QnXAGImozT2vrN3G3rF
9FxNTpfh6Hv15QQMOPJqlCicq4nVRIXFHA2Za5jvGWa4m+bLzS4OH7KB+KqeWUEtX+QKl3eqgC56
HBs9QpM0tp9VLVX4ws1GcGoJ48BWHSSNQv2suBrtz7yhdrquiPhXM4+XqWo/MZAxS1jnki7QdBhj
PgYr3LQM68v3qRoLkKoAvqpkMDCUeAP7Sql6H1EmSBYcKupo8RvWEi0xTIoeHWA3WMXS+Lst+3uT
gOVa/gN0OgRYykGJ6NRHykDPW2fBb50tDngSNH9Mh6zxabnKGwbgzG6q6w+SZy4uEceuLu9yfkv7
bc/vqXu6UkH5/6ofgivW2hkPpkiyjQj5u9L55R67jqYOZCZfVsG2nGCNPoWHmDSbMdO1Fgmx46g4
koE=
=eccN
-----END PGP SIGNATURE-----

--------------WYrb0xK08aT03AsuaxFIILPE--
