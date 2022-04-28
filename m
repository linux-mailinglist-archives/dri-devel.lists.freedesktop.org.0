Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F015512D53
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBDB10E94E;
	Thu, 28 Apr 2022 07:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF5010E963
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:50:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 200811F37F;
 Thu, 28 Apr 2022 07:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651132201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3AzBjIADUsSsiOtN9diAfWlBu0xxHsdY7KdH0cVpOkY=;
 b=bnYmrSfBosRU1uB3eQ3/Lq1SlMbfk6Yca2rFUCo5GbnIeTjMrQkWIcuiiJWkBcDp/o4CLb
 b5bvaUYqadzyoK6hrNtG+m88tGp2EpoLwxZFwE86R61tToHOVFpecFYLcQQjssLL9hBuB2
 bj2BiX9cLsi58A7023K1NlgRPpKtMCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651132201;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3AzBjIADUsSsiOtN9diAfWlBu0xxHsdY7KdH0cVpOkY=;
 b=n7WkukpPwI52bz6JlFYf/1kVmexsL31vim3JK0//Hv0vLV2nJkFooeJO6cXoKn/Q+/STds
 R9EOgvqat63r6cCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04DCD13AF8;
 Thu, 28 Apr 2022 07:50:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ITt4OyhHamJaGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Apr 2022 07:50:00 +0000
Message-ID: <a2dfa927-966f-167d-be92-fb3dd9bea80f@suse.de>
Date: Thu, 28 Apr 2022 09:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm: handle kernel fences in
 drm_gem_plane_helper_prepare_fb
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20220421191002.2251-1-christian.koenig@amd.com>
 <877dc0d9-c6c6-022c-20d8-14b33e863934@suse.de>
 <69a2da78-0325-c412-6b37-03d4242e5a5e@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <69a2da78-0325-c412-6b37-03d4242e5a5e@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s3YQTAOEE0UfxvbpYz20FLhi"
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
--------------s3YQTAOEE0UfxvbpYz20FLhi
Content-Type: multipart/mixed; boundary="------------HjQbeBpnDHFt7Zp96U0xD4rQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Message-ID: <a2dfa927-966f-167d-be92-fb3dd9bea80f@suse.de>
Subject: Re: [PATCH] drm: handle kernel fences in
 drm_gem_plane_helper_prepare_fb
References: <20220421191002.2251-1-christian.koenig@amd.com>
 <877dc0d9-c6c6-022c-20d8-14b33e863934@suse.de>
 <69a2da78-0325-c412-6b37-03d4242e5a5e@amd.com>
In-Reply-To: <69a2da78-0325-c412-6b37-03d4242e5a5e@amd.com>

--------------HjQbeBpnDHFt7Zp96U0xD4rQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDQuMjIgdW0gMDk6MzIgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAyOC4wNC4yMiB1bSAwOToyMyBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
W1NOSVBdDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2F0b21p
Y19oZWxwZXIuYyANCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2F0b21pY19oZWxw
ZXIuYw0KPj4+IGluZGV4IGE2ZDg5YWVkMGJkYS4uOGZjMGI0MmFjZGZmIDEwMDY0NA0KPj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2F0b21pY19oZWxwZXIuYw0KPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2F0b21pY19oZWxwZXIuYw0KPj4+IEBAIC0x
LDYgKzEsNyBAQA0KPj4+IMKgIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9yLWxhdGVyDQo+Pj4gwqAgwqAgI2luY2x1ZGUgPGxpbnV4L2RtYS1yZXN2Lmg+DQo+Pj4g
KyNpbmNsdWRlIDxsaW51eC9kbWEtZmVuY2UtY2hhaW4uaD4NCj4+PiDCoCDCoCAjaW5jbHVk
ZSA8ZHJtL2RybV9hdG9taWNfc3RhdGVfaGVscGVyLmg+DQo+Pj4gwqAgI2luY2x1ZGUgPGRy
bS9kcm1fYXRvbWljX3VhcGkuaD4NCj4+PiBAQCAtMTQxLDI1ICsxNDIsNjcgQEANCj4+PiDC
oMKgICogU2VlIGRybV9hdG9taWNfc2V0X2ZlbmNlX2Zvcl9wbGFuZSgpIGZvciBhIGRpc2N1
c3Npb24gb2YgDQo+Pj4gaW1wbGljaXQgYW5kDQo+Pg0KPj4gVGhpcyBjb21tZW50IHN0aWxs
IHJlZmVycyB0byB0aGUgZnVuY3Rpb24geW91IGp1c3QgZGVsZXRlZC4gTWF5YmUgdGhlIA0K
Pj4gZGVsZXRlZCBkb2NzIGNvdWxkIGJlIGludGVncmF0ZWQgaGVyZSBzb21laG93LCBpZiBz
dGlsbCByZWxldmFudD8NCj4gDQo+IFllYWgsIERhbmllbCBwb2ludCB0aGF0IG91dCBhcyB3
ZWxsLg0KPiANCj4+DQo+Pj4gwqDCoCAqIGV4cGxpY2l0IGZlbmNpbmcgaW4gYXRvbWljIG1v
ZGVzZXQgdXBkYXRlcy4NCj4+PiDCoMKgICovDQo+Pj4gLWludCBkcm1fZ2VtX3BsYW5lX2hl
bHBlcl9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QgDQo+Pj4g
ZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkNCj4+PiAraW50IGRybV9nZW1fcGxhbmVfaGVscGVy
X3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0
YXRlKQ0KPj4NCj4+IFdlIGhhdmUgYSAxMDAtY2hhcmFjdGVyIGxpbWl0LiBQbGVhc2UgbGVh
dmUgdGhpcyBvbiB0aGUgc2FtZSBsaW5lLg0KPiANCj4gRGVzcGl0ZSBzb21lIGVmZm9ydHMg
dG8gY2hhbmdlIHRoaXMgdGhhdCBpcyBzdGlsbCBkb2N1bWVudGVkIGFzIA0KPiA4MC1jaGFy
YWN0ZXIgbGltaXQ6IA0KPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjE4
LXJjNC9wcm9jZXNzL2NvZGluZy1zdHlsZS5odG1sI2JyZWFraW5nLWxvbmctbGluZXMtYW5k
LXN0cmluZ3MgDQoNCkJ1dCBkaWRuJ3QgY2hlY2twYXRjaCBzdG9wIHdhcm5pbmcgYWJvdXQg
dGhlIDgwLWNoYXIgbGltaXQ/DQoNCj4gDQo+IA0KPj4NCj4+PiDCoCB7DQo+Pj4gK8KgwqDC
oCBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSA9IGRtYV9mZW5jZV9nZXQoc3RhdGUtPmZlbmNl
KTsNCj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOw0KPj4NCj4+
IEknZCBkZWNsYXJlIHRoaXMgdmFyaWFibGUgd2l0aGluIHRoZSBmb3IgbG9vcC4NCj4+DQo+
Pj4gLcKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZTsNCj4+PiArwqDCoMKgIGVudW0g
ZG1hX3Jlc3ZfdXNhZ2UgdXNhZ2U7DQo+Pj4gK8KgwqDCoCBzaXplX3QgaTsNCj4+PiDCoMKg
wqDCoMKgIGludCByZXQ7DQo+Pj4gwqAgwqDCoMKgwqDCoCBpZiAoIXN0YXRlLT5mYikNCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+Pj4gwqAgLcKgwqDCoCBvYmogPSBk
cm1fZ2VtX2ZiX2dldF9vYmooc3RhdGUtPmZiLCAwKTsNCj4+PiAtwqDCoMKgIHJldCA9IGRt
YV9yZXN2X2dldF9zaW5nbGV0b24ob2JqLT5yZXN2LCBETUFfUkVTVl9VU0FHRV9XUklURSwg
DQo+Pj4gJmZlbmNlKTsNCj4+PiAtwqDCoMKgIGlmIChyZXQpDQo+Pj4gLcKgwqDCoMKgwqDC
oMKgIHJldHVybiByZXQ7DQo+Pj4gLQ0KPj4+IC3CoMKgwqAgLyogVE9ETzogZHJtX2F0b21p
Y19zZXRfZmVuY2VfZm9yX3BsYW5lKCkgc2hvdWxkIGJlIGNoYW5nZWQgdG8gDQo+Pj4gYmUg
YWJsZQ0KPj4+IC3CoMKgwqDCoCAqIHRvIGhhbmRsZSBtb3JlIGZlbmNlcyBpbiBnZW5lcmFs
IGZvciBtdWx0aXBsZSBCT3MgcGVyIGZiLg0KPj4+ICvCoMKgwqAgLyoNCj4+PiArwqDCoMKg
wqAgKiBPbmx5IGFkZCB0aGUga2VybmVsIGZlbmNlcyBoZXJlIGlmIHRoZXJlIGlzIGFscmVh
ZHkgYSBmZW5jZSANCj4+PiBzZXQgdmlhDQo+Pj4gK8KgwqDCoMKgICogZXhwbGljaXQgZmVu
Y2luZyBpbnRlcmZhY2VzIG9uIHRoZSBhdG9taWMgaW9jdGwuDQo+Pj4gK8KgwqDCoMKgICoN
Cj4+PiArwqDCoMKgwqAgKiBUaGlzIHdheSBleHBsaWNpdCBmZW5jaW5nIGNhbiBiZSB1c2Vk
IHRvIG92ZXJydWxlIGltcGxpY2l0IA0KPj4+IGZlbmNpbmcsDQo+Pj4gK8KgwqDCoMKgICog
d2hpY2ggaXMgaW1wb3J0YW50IHRvIG1ha2UgZXhwbGljaXQgZmVuY2luZyB1c2UtY2FzZXMg
d29yazogT25lDQo+Pj4gK8KgwqDCoMKgICogZXhhbXBsZSBpcyB1c2luZyBvbmUgYnVmZmVy
IGZvciAyIHNjcmVlbnMgd2l0aCBkaWZmZXJlbnQgcmVmcmVzaA0KPj4+ICvCoMKgwqDCoCAq
IHJhdGVzLiBJbXBsaWNpdCBmZW5jaW5nIHdpbGwgY2xhbXAgcmVuZGVyaW5nIHRvIHRoZSBy
ZWZyZXNoIA0KPj4+IHJhdGUgb2YNCj4+PiArwqDCoMKgwqAgKiB0aGUgc2xvd2VyIHNjcmVl
biwgd2hlcmVhcyBleHBsaWNpdCBmZW5jZSBhbGxvd3MgMiBpbmRlcGVuZGVudA0KPj4+ICvC
oMKgwqDCoCAqIHJlbmRlciBhbmQgZGlzcGxheSBsb29wcyBvbiBhIHNpbmdsZSBidWZmZXIu
IElmIGEgZHJpdmVyIGFsbG93cw0KPj4+ICvCoMKgwqDCoCAqIG9iZXlzIGJvdGggaW1wbGlj
aXQgYW5kIGV4cGxpY2l0IGZlbmNlcyBmb3IgcGxhbmUgdXBkYXRlcywgDQo+Pj4gdGhlbiBp
dA0KPj4+ICvCoMKgwqDCoCAqIHdpbGwgYnJlYWsgYWxsIHRoZSBiZW5lZml0cyBvZiBleHBs
aWNpdCBmZW5jaW5nLg0KPj4+IMKgwqDCoMKgwqDCoCAqLw0KPj4+IC3CoMKgwqAgZHJtX2F0
b21pY19zZXRfZmVuY2VfZm9yX3BsYW5lKHN0YXRlLCBmZW5jZSk7DQo+Pj4gK8KgwqDCoCB1
c2FnZSA9IGZlbmNlID8gRE1BX1JFU1ZfVVNBR0VfS0VSTkVMIDogRE1BX1JFU1ZfVVNBR0Vf
V1JJVEU7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
c3RhdGUtPmZiLT5vYmopOyArK2kpIHsNCj4+DQo+PiBJbnN0ZWFkIG9mIEFSUkFZX1NJWkUs
IHJhdGhlciB1c2Ugc3RhdGUtPmZiLT5mb3JtYXQtPm51bV9wbGFuZXMuIEl0J3MgDQo+PiB0
aGUgbnVtYmVyIG9mIHBsYW5lcyAoaS5lLiwgR0VNIG9iamVjdHMpIGluIHRoZSBmcmFtZWJ1
ZmZlci4NCj4+DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKm5ldzsN
Cj4+PiArDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIG9iaiA9IGRybV9nZW1fZmJfZ2V0X29iaihz
dGF0ZS0+ZmIsIGkpOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIW9iaikNCj4+DQo+PiBX
aXRoIHRoZSB1c2Ugb2YgbnVtX3BsYW5lcyBpbiB0aGUgZm9yIGxvb3AsIHRoZXJlIHNob3Vs
ZCBwcm9iYWJseSBiZSBhIA0KPj4gZHJtX1dBUk5fT05fT05DRSgpIGFyb3VuZCB0aGlzIHRl
c3QuDQo+Pg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0KPj4NCj4+
IGdvdG8gZXJyb3IgaGFuZGxpbmcuDQo+Pg0KPj4gT3IgaXMgdGhlcmUgYSB1c2UgY2FzZSBm
b3IgZnJhbWVidWZmZXJzIHdpdGggZW1wdHkgcGxhbmVzPyBBdCBsZWFzdCANCj4+IGl0J3Mg
bm90IHBvc3NpYmxlIHRvIGluc3RhbnRpYXRlIG9uZSB2aWEgZHJtX2dlbV9mYl9pbml0X3dp
dGhfZnVuY3MoKS4NCj4+DQo+IA0KPiBJIHdhcyBhc2tpbmcgbXlzZWxmIHRoZSBzYW1lIHRo
aW5nLCBidXQgZm91bmQgdGhpcyBoYW5kbGluZyBiZSB1c2VkIGF0IA0KPiBvdGhlciBwbGFj
ZXMgYXMgd2VsbC4NCg0KSSd2ZSBncmFkdWFsbHkgY2hhbmdlZCB0aGUgY29kZSB0b3dhcmRz
IHRoZSB1c2Ugb2YgbnVtX3BsYW5lcyBhbmQgDQpzdHJpY3RlciBlcnJvciByZXBvcnRpbmcu
ICBJTUhPIGF0IHNvbWUgcG9pbnQsIHdlIHNob3VsZCB3YXJuIGFib3V0IA0KZW1wdHkgcGxh
bmUgQk9zIGRpcmVjdGx5IHdpdGhpbiBkcm1fZ2VtX2ZiX2dldF9vYmooKS4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rLA0KPiBD
aHJpc3RpYW4uDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------HjQbeBpnDHFt7Zp96U0xD4rQ--

--------------s3YQTAOEE0UfxvbpYz20FLhi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJqRygFAwAAAAAACgkQlh/E3EQov+CP
6w//X/atSGPs0hFOgPIunkKVVU1epgAmXrbHBLSULuVqeDzRW9XNXaI7FONP2qQk+rFekRppDDAn
RWiZdzawLcFxEcx0fuITVRjVqblv0832IiAgFgML9A1GA5uzadAmZqZfYH/Rk9Cy4ro3+XFPneiT
zvSfXIedtL+G+BDxO2F1zJQaO+wKgfz9t6EUDGcHnE/MuM2EluLMnOZp62lkl7g03r31GylECpUV
/j0NeJH4YnUadIlHn7pcuhKfM4+Cwm2SO9wLJED4ne/ETwf5Sz/P7D3abGAKQwXnHOofFW6uH7tS
lMJrHdgZQdP1Q7pJJf6jBns7LxiKLxwxa1C3cbLZ1di40nXibhz3fPyhj/xO0eZ/3sSO1p1Mm+VD
hgQBSXLcadpimXv66WOYhwp5MP7+V2Kb8hx4torXGLKc0BlhAZMNOtWwCLIPcmFxCtVRC7fcwUjz
m4ZssVh3nbjg1QyWqQAvnyjkNoJaRWk7c+DWC4XV/7+RD3WQKynLkpDQF5drGqlEyMY5FTk5cgb3
gnfQGlwtVswZTlzH3DGuZTg1vtImReTDcHXVzNjCXxJOj6tm4rozEKyYCqqtkDuPMVVhZ43DUqi1
dcLaYhYrDYnr3MCmcpQFGur/ESH70kjX9beM+iN4uRcwh302JcSig9ZlQOodNEpJacH1BRHY6/Rt
sBg=
=+0v4
-----END PGP SIGNATURE-----

--------------s3YQTAOEE0UfxvbpYz20FLhi--
