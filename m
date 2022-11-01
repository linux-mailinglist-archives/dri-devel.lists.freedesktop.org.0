Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CDA614616
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 09:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6796C10E338;
	Tue,  1 Nov 2022 08:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B4B10E330
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 08:58:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 32C7E201B7;
 Tue,  1 Nov 2022 08:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667293089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fX1gmgzfV2CKJzeEiSIOHGKLGdKfU3MCDN/a1jV6JA8=;
 b=IuM9iU/rkC0GCZ+Vvdynda62B5QpmcDSInjGHxRDFJrrG5Jiuan/4B/JzypqfKfxzRZb7t
 kRGzevTaZSCNFBlBkR9LJqhXQJtvG1gpbP8Loq4xlF/ES3NCYg3XCNqmxG/yF/t0SoZYDW
 ZJ9XNUedaF9BZvOcLuagLyYExOQ4e+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667293089;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fX1gmgzfV2CKJzeEiSIOHGKLGdKfU3MCDN/a1jV6JA8=;
 b=wQNZjJ3Pg07pu9V215M5BwjSj0+FRjufh8vTWHmDddDg+YO58scr22pd8oz+LhKFSCAS9c
 mkxexXDqFJd8QNBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC3E31346F;
 Tue,  1 Nov 2022 08:58:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TALQLKDfYGOELgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Nov 2022 08:58:08 +0000
Message-ID: <49050012-a53b-98bb-16ec-bc84000cf969@suse.de>
Date: Tue, 1 Nov 2022 09:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 RESEND 0/7] New DRM driver for Intel VPU
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C4AlPPrRehyYUfFhFDNk4LOG"
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C4AlPPrRehyYUfFhFDNk4LOG
Content-Type: multipart/mixed; boundary="------------MeMpUli5d4Q3YXIEfPd1VWs0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Message-ID: <49050012-a53b-98bb-16ec-bc84000cf969@suse.de>
Subject: Re: [PATCH v3 RESEND 0/7] New DRM driver for Intel VPU
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
In-Reply-To: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>

--------------MeMpUli5d4Q3YXIEfPd1VWs0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDkuMjIgdW0gMTc6MTEgc2NocmllYiBKYWNlayBMYXdyeW5vd2ljejoN
Cj4gSGksDQo+IA0KPiBUaGlzIHBhdGNoc2V0IGNvbnRhaW5zIGEgbmV3IExpbnV4KiBLZXJu
ZWwgRHJpdmVyIGZvciBJbnRlbMKuIFZQVXMuDQo+IA0KPiBWUFUgc3RhbmRzIGZvciBWZXJz
YXRpbGUgUHJvY2Vzc2luZyBVbml0IGFuZCBpdCBpcyBhbiBBSSBpbmZlcmVuY2UgYWNjZWxl
cmF0b3INCj4gaW50ZWdyYXRlZCB3aXRoIEludGVsIG5vbi1zZXJ2ZXIgQ1BVcyBzdGFydGlu
ZyBmcm9tIDE0dGggZ2VuZXJhdGlvbi4NCj4gVlBVIGVuYWJsZXMgZWZmaWNpZW50IGV4ZWN1
dGlvbiBvZiBEZWVwIExlYXJuaW5nIGFwcGxpY2F0aW9ucw0KPiBsaWtlIG9iamVjdCBkZXRl
Y3Rpb24sIGNsYXNzaWZpY2F0aW9uIGV0Yy4NCj4gDQo+IERyaXZlciBpcyBwYXJ0IG9mIGdw
dS9kcm0gc3Vic3lzdGVtIGJlY2F1c2UgVlBVIGlzIHNpbWlsYXIgaW4gb3BlcmF0aW9uIHRv
DQo+IGFuIGludGVncmF0ZWQgR1BVLiBSZXVzaW5nIGRybSBkcml2ZXIgaW5pdCwgaW9jdGwg
aGFuZGxpbmcsIGdlbSBhbmQgcHJpbWUNCj4gaGVscGVycyBhbmQgZHJtX21tIGFsbG93cyB0
byBtaW5pbWl6ZSBjb2RlIGR1cGxpY2F0aW9uIGluIHRoZSBrZXJuZWwuDQo+IA0KPiBUaGUg
d2hvbGUgZHJpdmVyIGlzIGxpY2Vuc2VkIHVuZGVyIEdQTC0yLjAtb25seSBleGNlcHQgZm9y
IHR3byBoZWFkZXJzIGltcG9ydGVkDQo+IGZyb20gdGhlIGZpcm13YXJlIHRoYXQgYXJlIE1J
VCBsaWNlbnNlZC4NCj4gDQo+IFVzZXIgbW9kZSBkcml2ZXIgc3RhY2sgY29uc2lzdHMgb2Yg
TGV2ZWwgWmVybyBBUEkgZHJpdmVyIGFuZCBPcGVuVklOTyBwbHVnaW4uDQo+IEJvdGggc2hv
dWxkIGJlIG9wZW4tc291cmNlZCBieSB0aGUgZW5kIG9mIFE0Lg0KPiBUaGUgZmlybXdhcmUg
Zm9yIHRoZSBWUFUgd2lsbCBiZSBkaXN0cmlidXRlZCBhcyBhIGNsb3NlZCBzb3VyY2UgYmlu
YXJ5Lg0KPiANCj4gSSdtIHJlc2VuZGluZyB2MyBwYXRjaHNldCB3aXRoIGNvcnJlY3QgRGF2
ZSdzIGVtYWlsLg0KPiANCj4gUmVnYXJkcywNCj4gSmFjZWsNCj4gDQo+IHYzOg0KPiAtIEZp
eGVkIGFsaWdubWVudCB3YXJuaW5nIGluIGl2cHVfaXBjLmMgd2hlbiBidWlsZGluZyB3aXRo
IFc9MQ0KPiANCj4gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDkxMzEy
MTAxNy45OTM4MjUtMS1qYWNlay5sYXdyeW5vd2ljekBsaW51eC5pbnRlbC5jb20vDQo+IC0g
UmVuYW1lIHRoZSBkcml2ZXIgZnJvbSAiZHJtL3ZwdSIgdG8gImRybS9pdnB1Ig0KPiAtIEFk
ZCBhIFRPRE8gZmlsZQ0KPiAtIEFkZCBzdXBwb3J0IGZvciBXQyBidWZmZXJzDQo+IA0KPiB2
MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNzI4MTMxNzA5LjEwODcxODgt
MS1qYWNlay5sYXdyeW5vd2ljekBsaW51eC5pbnRlbC5jb20vDQo+IA0KPiBKYWNlayBMYXdy
eW5vd2ljeiAoNyk6DQo+ICAgIGRybS9pdnB1OiBJbnRyb2R1Y2UgYSBuZXcgRFJNIGRyaXZl
ciBmb3IgSW50ZWwgVlBVDQo+ICAgIGRybS9pdnB1OiBBZGQgSW50ZWwgVlBVIE1NVSBzdXBw
b3J0DQo+ICAgIGRybS9pdnB1OiBBZGQgR0VNIGJ1ZmZlciBvYmplY3QgbWFuYWdlbWVudA0K
PiAgICBkcm0vaXZwdTogQWRkIElQQyBkcml2ZXIgYW5kIEpTTSBtZXNzYWdlcw0KPiAgICBk
cm0vaXZwdTogSW1wbGVtZW50IGZpcm13YXJlIHBhcnNpbmcgYW5kIGJvb3RpbmcNCj4gICAg
ZHJtL2l2cHU6IEFkZCBjb21tYW5kIGJ1ZmZlciBzdWJtaXNzaW9uIGxvZ2ljDQo+ICAgIGRy
bS9pdnB1OiBBZGQgUE0gc3VwcG9ydA0KPiANCj4gICBNQUlOVEFJTkVSUyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICA4ICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZp
ZyAgICAgICAgICAgICAgICAgfCAgICAyICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZp
bGUgICAgICAgICAgICAgICAgfCAgICAxICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vaXZwdS9L
Y29uZmlnICAgICAgICAgICAgfCAgIDEyICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vaXZwdS9N
YWtlZmlsZSAgICAgICAgICAgfCAgIDE2ICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vaXZwdS9U
T0RPICAgICAgICAgICAgICAgfCAgICA3ICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vaXZwdS9p
dnB1X2Rydi5jICAgICAgICAgfCAgNjQzICsrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2l2cHUvaXZwdV9kcnYuaCAgICAgICAgIHwgIDE3OCArKysrDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2l2cHUvaXZwdV9mdy5jICAgICAgICAgIHwgIDQyNiArKysrKysrKysNCj4g
ICBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X2Z3LmggICAgICAgICAgfCAgIDM4ICsNCj4g
ICBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X2dlbS5jICAgICAgICAgfCAgODM2ICsrKysr
KysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfZ2VtLmggICAg
ICAgICB8ICAxMjggKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9ody5oICAg
ICAgICAgIHwgIDE2OSArKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9od19t
dGwuYyAgICAgIHwgMTA2MCArKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9pdnB1L2l2cHVfaHdfbXRsX3JlZy5oICB8ICA0NjggKysrKysrKysrKw0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfaHdfcmVnX2lvLmggICB8ICAxMTUgKysrDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9pcGMuYyAgICAgICAgIHwgIDUwOCArKysr
KysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfaXBjLmggICAgICAgICB8
ICAgOTAgKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X2pvYi5jICAgICAgICAg
fCAgNjI5ICsrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9q
b2IuaCAgICAgICAgIHwgICA3MyArKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVf
anNtX21zZy5jICAgICB8ICAyMjAgKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vaXZwdS9p
dnB1X2pzbV9tc2cuaCAgICAgfCAgIDI1ICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vaXZwdS9p
dnB1X21tdS5jICAgICAgICAgfCAgODg4ICsrKysrKysrKysrKysrKysrKysNCj4gICBkcml2
ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X21tdS5oICAgICAgICAgfCAgIDUzICsrDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2l2cHUvaXZwdV9tbXVfY29udGV4dC5jIHwgIDQxOSArKysrKysrKysN
Cj4gICBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X21tdV9jb250ZXh0LmggfCAgIDQ5ICsr
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9wbS5jICAgICAgICAgIHwgIDM1MiAr
KysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfcG0uaCAgICAgICAgICB8
ICAgMzggKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pdnB1L3ZwdV9ib290X2FwaS5oICAgICB8
ICAyNDEgKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2l2cHUvdnB1X2pzbV9hcGkuaCAg
ICAgIHwgIDYxNiArKysrKysrKysrKysrDQo+ICAgaW5jbHVkZS91YXBpL2RybS9pdnB1X2Ry
bS5oICAgICAgICAgICAgIHwgIDM0MyArKysrKysrKw0KDQpZb3UgaGF2ZSB0byBhZGQgeW91
cnNlbGYgdG8gTUFJTlRBSU5FUlMuDQoNCkkgYXNzdW1lIHRoYXQgdGhlcmUncyBhIEZPU1Mg
dXNlcnNwYWNlIGF2YWlsYWJsZT8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIDMx
IGZpbGVzIGNoYW5nZWQsIDg2NTEgaW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vaXZwdS9LY29uZmlnDQo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9pdnB1L01ha2VmaWxlDQo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9pdnB1L1RPRE8NCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9kcnYuYw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X2Rydi5oDQo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfZncuYw0KPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X2Z3LmgNCj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9nZW0uYw0KPiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X2dlbS5oDQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfaHcuaA0KPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X2h3X210bC5jDQo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfaHdfbXRsX3JlZy5o
DQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfaHdf
cmVnX2lvLmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2l2cHUv
aXZwdV9pcGMuYw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaXZw
dS9pdnB1X2lwYy5oDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9p
dnB1L2l2cHVfam9iLmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L2l2cHUvaXZwdV9qb2IuaA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vaXZwdS9pdnB1X2pzbV9tc2cuYw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vaXZwdS9pdnB1X2pzbV9tc2cuaA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X21tdS5jDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfbW11LmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9tbXVfY29udGV4dC5jDQo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfbW11X2NvbnRleHQuaA0K
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X3BtLmMN
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9wbS5o
DQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pdnB1L3ZwdV9ib290
X2FwaS5oDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pdnB1L3Zw
dV9qc21fYXBpLmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2RybS9p
dnB1X2RybS5oDQo+IA0KPiAtLQ0KPiAyLjM0LjENCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------MeMpUli5d4Q3YXIEfPd1VWs0--

--------------C4AlPPrRehyYUfFhFDNk4LOG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNg36AFAwAAAAAACgkQlh/E3EQov+Cv
aBAAjNhhIRwqOmE8X+S9xC7aIBnJFCbleDIOFAnMWORu4FVXXWcO7Uc3ve+fWJ5+tTYP9RTgwz7J
1DhUt3V1raVaQE/rhqxDV06tDV+NTpVsHEvoukN6kb2gCO+PYfoC4tXYzfBozAl5iynTF6/ldH+b
AlSeGyFwVoQ1qUuSpiu5mn3viBB1xLr9xRFKej5ZbU0pR5HHxtfQ0f6s86amrpqqRCM6dpstQx/V
+6Fk0xqixGtagMXGv3CIkUVNOk/bEhCM33OX5V/7Qv/tcY7g+bvL5Bc1BOEyQ51e9g5vY1ZM080e
NeNWTyUa6I9pBwjRO07b967lP21ROmYsonopX2zTCdO7ngSSdU7NCkBTIIVDKcq6PMQLVj6eJ9KI
Iy6P52G+SUq+vLtG/fOzQO8Yst9vgLkzf9LB7/hRvmTpQekpXhnacEJ2s2ub22k13VpOrt1HfAOu
qjmqn0IBQ2+6zUjMX9DioUi2lMYYUDNnMVHWtfp2SgfH/HVGIqHmNxN5m5ux6Jq18nu9EfbhFlYP
fN91qRAYa6/Z8JfsSU/FezDa/Ue5ru6UO4XMsHibaDLwp5AYRiRC76WSINcczrsZ6ILdxOo1Mm4U
FnDBzdJqOzmDOEbc9omV9dwAtlJS6hdFZ0lekK7/20ufo0Dzz1n0k+KpVtjoN8cNa2yj988C8iQu
bzI=
=mPux
-----END PGP SIGNATURE-----

--------------C4AlPPrRehyYUfFhFDNk4LOG--
