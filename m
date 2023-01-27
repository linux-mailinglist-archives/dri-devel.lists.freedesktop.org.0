Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFAA67E642
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 14:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA84F10E46D;
	Fri, 27 Jan 2023 13:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5803110E46A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 13:12:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 19BF51FF60;
 Fri, 27 Jan 2023 13:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674825165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7GXdYunwaqI0U70FJD/fIEpfWGRu+u4A+3judcUiv50=;
 b=OZsHA6GV7vXqVgFuSEKiS3FCX01lb6B10SUceJYwOnBwLbSynm4c5oVrkHCZvK42cZ1vjV
 4H43cwD8mfojdlVKipRprxGTJ3KJfPnU4bHOav4uzeyWvTkP47rzSovPSVtM5hKEux9L2T
 jFZNPZj+gn0pJFvOkZ/V1UuvDq3MYSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674825165;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7GXdYunwaqI0U70FJD/fIEpfWGRu+u4A+3judcUiv50=;
 b=qPOE/a0NFsN/tA89Oy/pigsd4eAuCgD/hqQA8ITD9NBh9Xc9zx+39zR31PcMnLVOKyBCnE
 Y7y7XRkAZ1ZhTwDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED81A1336F;
 Fri, 27 Jan 2023 13:12:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EB7kOMzN02MTGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Jan 2023 13:12:44 +0000
Message-ID: <e6f4ffc2-5cfe-5ffb-2363-54dcdd9be834@suse.de>
Date: Fri, 27 Jan 2023 14:12:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 5/7] drm/vmwgfx: Cleanup the vmw bo usage in the cursor
 paths
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230126173813.602748-1-zack@kde.org>
 <20230126173813.602748-6-zack@kde.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230126173813.602748-6-zack@kde.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jMzDExm5mebhFAOPYmoowY7s"
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jMzDExm5mebhFAOPYmoowY7s
Content-Type: multipart/mixed; boundary="------------Y40qfs6cOg3EtmaFav3ZhuEc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Message-ID: <e6f4ffc2-5cfe-5ffb-2363-54dcdd9be834@suse.de>
Subject: Re: [PATCH 5/7] drm/vmwgfx: Cleanup the vmw bo usage in the cursor
 paths
References: <20230126173813.602748-1-zack@kde.org>
 <20230126173813.602748-6-zack@kde.org>
In-Reply-To: <20230126173813.602748-6-zack@kde.org>

--------------Y40qfs6cOg3EtmaFav3ZhuEc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDEuMjMgdW0gMTg6Mzggc2NocmllYiBaYWNrIFJ1c2luOg0KPiBGcm9t
OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiANCj4gQmFzZSBtYXBwZWQgY291
bnQgaXMgdXNlbGVzcyBiZWNhdXNlIHRoZSB0dG0gdW5tYXAgZnVuY3Rpb25zIGhhbmRsZQ0K
PiBudWxsIG1hcHMganVzdCBmaW5lIHNvIGNvbXBsZXRlbHkgcmVtb3ZlIGFsbCB0aGUgY29k
ZSByZWxhdGVkIHRvIGl0Lg0KPiBSZW5hbWUgZHVtbXkgdG8gaXNfaW9tZW0gYmVjYXVzZSB0
aGF0J3Mgd2hhdCBpdCBpcyBldmVuIGlmIHdlJ3JlIG5vdA0KPiBhY3RpdmVsbHkgdXNpbmcg
aXQuIE1ha2VzIHRoZSBjb2RlIGVhc2llciB0byByZWFkLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uaCAgfCAgNCAtLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMgfCAyOCArKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2JvLmggYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5oDQo+IGluZGV4IGRi
ODU2MDllYzAxYy4uNGRjZjM3MjM1Y2IwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9iby5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2JvLmgNCj4gQEAgLTQ0LDcgKzQ0LDYgQEAgc3RydWN0IHZtd19yZXNvdXJjZTsN
Cj4gICAgKiBzdHJ1Y3Qgdm13X2JvIC0gVFRNIGJ1ZmZlciBvYmplY3Qgd2l0aCB2bXdnZngg
YWRkaXRpb25zDQo+ICAgICogQGJhc2U6IFRoZSBUVE0gYnVmZmVyIG9iamVjdA0KPiAgICAq
IEByZXNfdHJlZTogUkIgdHJlZSBvZiByZXNvdXJjZXMgdXNpbmcgdGhpcyBidWZmZXIgb2Jq
ZWN0IGFzIGEgYmFja2luZyBNT0INCj4gLSAqIEBiYXNlX21hcHBlZF9jb3VudDogdHRtIEJP
IG1hcHBpbmcgY291bnQ7IHVzZWQgYnkgS01TIGF0b21pYyBoZWxwZXJzLg0KPiAgICAqIEBj
cHVfd3JpdGVyczogTnVtYmVyIG9mIHN5bmNjcHUgd3JpdGUgZ3JhYnMuIFByb3RlY3RlZCBi
eSByZXNlcnZhdGlvbiB3aGVuDQo+ICAgICogaW5jcmVhc2VkLiBNYXkgYmUgZGVjcmVhc2Vk
IHdpdGhvdXQgcmVzZXJ2YXRpb24uDQo+ICAgICogQGR4X3F1ZXJ5X2N0eDogRFggY29udGV4
dCBpZiB0aGlzIGJ1ZmZlciBvYmplY3QgaXMgdXNlZCBhcyBhIERYIHF1ZXJ5IE1PQg0KPiBA
QCAtNTUsOCArNTQsNiBAQCBzdHJ1Y3Qgdm13X3Jlc291cmNlOw0KPiAgIHN0cnVjdCB2bXdf
Ym8gew0KPiAgIAlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgYmFzZTsNCj4gICAJc3RydWN0
IHJiX3Jvb3QgcmVzX3RyZWU7DQo+IC0JLyogRm9yIEtNUyBhdG9taWMgaGVscGVyczogdHRt
IGJvIG1hcHBpbmcgY291bnQgKi8NCj4gLQlhdG9taWNfdCBiYXNlX21hcHBlZF9jb3VudDsN
Cj4gICANCj4gICAJYXRvbWljX3QgY3B1X3dyaXRlcnM7DQo+ICAgCS8qIE5vdCByZWYtY291
bnRlZC4gIFByb3RlY3RlZCBieSBiaW5kaW5nX211dGV4ICovDQo+IEBAIC02Nyw3ICs2NCw2
IEBAIHN0cnVjdCB2bXdfYm8gew0KPiAgIAlzdHJ1Y3Qgdm13X2JvX2RpcnR5ICpkaXJ0eTsN
Cj4gICB9Ow0KPiAgIA0KPiAtDQo+ICAgaW50IHZtd19ib19jcmVhdGVfa2VybmVsKHN0cnVj
dCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYsDQo+ICAgCQkJIHVuc2lnbmVkIGxvbmcgc2l6ZSwN
Cj4gICAJCQkgc3RydWN0IHR0bV9wbGFjZW1lbnQgKnBsYWNlbWVudCwNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMNCj4gaW5kZXggNjc4MDM5MWM1N2VhLi5lODMyODZl
MDg4MzcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2tt
cy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jDQo+IEBA
IC0xNTMsOSArMTUzLDkgQEAgc3RhdGljIHZvaWQgdm13X2N1cnNvcl91cGRhdGVfbW9iKHN0
cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYsDQo+ICAgCVNWR0FHQkN1cnNvckhlYWRlciAq
aGVhZGVyOw0KPiAgIAlTVkdBR0JBbHBoYUN1cnNvckhlYWRlciAqYWxwaGFfaGVhZGVyOw0K
PiAgIAljb25zdCB1MzIgaW1hZ2Vfc2l6ZSA9IHdpZHRoICogaGVpZ2h0ICogc2l6ZW9mKCpp
bWFnZSk7DQo+IC0JYm9vbCBkdW1teTsNCj4gKwlib29sIGlzX2lvbWVtOw0KDQpJdCBzZWVt
cyB0aG9zZSByZW5hbWVzIGFyZSBvYmZ1c2NhdGluZyB0aGUgcGF0Y2guIE1heWJlIHRoZXkg
Y2FuIGdldCANCnRoZWlyIG93biBjb21taXQ/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gICANCj4gLQloZWFkZXIgPSB0dG1fa21hcF9vYmpfdmlydHVhbCgmdnBzLT5jdXJzb3Iu
bWFwLCAmZHVtbXkpOw0KPiArCWhlYWRlciA9IHR0bV9rbWFwX29ial92aXJ0dWFsKCZ2cHMt
PmN1cnNvci5tYXAsICZpc19pb21lbSk7DQo+ICAgCWFscGhhX2hlYWRlciA9ICZoZWFkZXIt
PmhlYWRlci5hbHBoYUhlYWRlcjsNCj4gICANCj4gICAJbWVtc2V0KGhlYWRlciwgMCwgc2l6
ZW9mKCpoZWFkZXIpKTsNCj4gQEAgLTE4NSwxMyArMTg1LDEzIEBAIHN0YXRpYyB1MzIgdm13
X2R1X2N1cnNvcl9tb2Jfc2l6ZSh1MzIgdywgdTMyIGgpDQo+ICAgICovDQo+ICAgc3RhdGlj
IHUzMiAqdm13X2R1X2N1cnNvcl9wbGFuZV9hY3F1aXJlX2ltYWdlKHN0cnVjdCB2bXdfcGxh
bmVfc3RhdGUgKnZwcykNCj4gICB7DQo+IC0JYm9vbCBkdW1teTsNCj4gKwlib29sIGlzX2lv
bWVtOw0KPiAgIAlpZiAodnBzLT5zdXJmKSB7DQo+ICAgCQlpZiAodnBzLT5zdXJmX21hcHBl
ZCkNCj4gICAJCQlyZXR1cm4gdm13X2JvX21hcF9hbmRfY2FjaGUodnBzLT5zdXJmLT5yZXMu
YmFja3VwKTsNCj4gICAJCXJldHVybiB2cHMtPnN1cmYtPnNub29wZXIuaW1hZ2U7DQo+ICAg
CX0gZWxzZSBpZiAodnBzLT5ibykNCj4gLQkJcmV0dXJuIHR0bV9rbWFwX29ial92aXJ0dWFs
KCZ2cHMtPmJvLT5tYXAsICZkdW1teSk7DQo+ICsJCXJldHVybiB0dG1fa21hcF9vYmpfdmly
dHVhbCgmdnBzLT5iby0+bWFwLCAmaXNfaW9tZW0pOw0KPiAgIAlyZXR1cm4gTlVMTDsNCj4g
ICB9DQo+ICAgDQo+IEBAIC0zNjQsNyArMzY0LDcgQEAgdm9pZCB2bXdfa21zX2N1cnNvcl9z
bm9vcChzdHJ1Y3Qgdm13X3N1cmZhY2UgKnNyZiwNCj4gICAJU1ZHQTNkQ29weUJveCAqYm94
Ow0KPiAgIAl1bnNpZ25lZCBib3hfY291bnQ7DQo+ICAgCXZvaWQgKnZpcnR1YWw7DQo+IC0J
Ym9vbCBkdW1teTsNCj4gKwlib29sIGlzX2lvbWVtOw0KPiAgIAlzdHJ1Y3Qgdm13X2RtYV9j
bWQgew0KPiAgIAkJU1ZHQTNkQ21kSGVhZGVyIGhlYWRlcjsNCj4gICAJCVNWR0EzZENtZFN1
cmZhY2VETUEgZG1hOw0KPiBAQCAtNDI0LDcgKzQyNCw3IEBAIHZvaWQgdm13X2ttc19jdXJz
b3Jfc25vb3Aoc3RydWN0IHZtd19zdXJmYWNlICpzcmYsDQo+ICAgCWlmICh1bmxpa2VseShy
ZXQgIT0gMCkpDQo+ICAgCQlnb3RvIGVycl91bnJlc2VydmU7DQo+ICAgDQo+IC0JdmlydHVh
bCA9IHR0bV9rbWFwX29ial92aXJ0dWFsKCZtYXAsICZkdW1teSk7DQo+ICsJdmlydHVhbCA9
IHR0bV9rbWFwX29ial92aXJ0dWFsKCZtYXAsICZpc19pb21lbSk7DQo+ICAgDQo+ICAgCWlm
IChib3gtPncgPT0gVk1XX0NVUlNPUl9TTk9PUF9XSURUSCAmJiBjbWQtPmRtYS5ndWVzdC5w
aXRjaCA9PSBpbWFnZV9waXRjaCkgew0KPiAgIAkJbWVtY3B5KHNyZi0+c25vb3Blci5pbWFn
ZSwgdmlydHVhbCwNCj4gQEAgLTY1OCwxOSArNjU4LDE4IEBAIHZtd19kdV9jdXJzb3JfcGxh
bmVfY2xlYW51cF9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gICB7DQo+ICAgCXN0
cnVjdCB2bXdfY3Vyc29yX3BsYW5lICp2Y3AgPSB2bXdfcGxhbmVfdG9fdmNwKHBsYW5lKTsN
Cj4gICAJc3RydWN0IHZtd19wbGFuZV9zdGF0ZSAqdnBzID0gdm13X3BsYW5lX3N0YXRlX3Rv
X3ZwcyhvbGRfc3RhdGUpOw0KPiAtCWJvb2wgZHVtbXk7DQo+ICsJYm9vbCBpc19pb21lbTsN
Cj4gICANCj4gICAJaWYgKHZwcy0+c3VyZl9tYXBwZWQpIHsNCj4gICAJCXZtd19ib191bm1h
cCh2cHMtPnN1cmYtPnJlcy5iYWNrdXApOw0KPiAgIAkJdnBzLT5zdXJmX21hcHBlZCA9IGZh
bHNlOw0KPiAgIAl9DQo+ICAgDQo+IC0JaWYgKHZwcy0+Ym8gJiYgdHRtX2ttYXBfb2JqX3Zp
cnR1YWwoJnZwcy0+Ym8tPm1hcCwgJmR1bW15KSkgew0KPiArCWlmICh2cHMtPmJvICYmIHR0
bV9rbWFwX29ial92aXJ0dWFsKCZ2cHMtPmJvLT5tYXAsICZpc19pb21lbSkpIHsNCj4gICAJ
CWNvbnN0IGludCByZXQgPSB0dG1fYm9fcmVzZXJ2ZSgmdnBzLT5iby0+YmFzZSwgdHJ1ZSwg
ZmFsc2UsIE5VTEwpOw0KPiAgIA0KPiAgIAkJaWYgKGxpa2VseShyZXQgPT0gMCkpIHsNCj4g
LQkJCWlmIChhdG9taWNfcmVhZCgmdnBzLT5iby0+YmFzZV9tYXBwZWRfY291bnQpID09IDAp
DQo+IC0JCQkgICAgdHRtX2JvX2t1bm1hcCgmdnBzLT5iby0+bWFwKTsNCj4gKwkJCXR0bV9i
b19rdW5tYXAoJnZwcy0+Ym8tPm1hcCk7DQo+ICAgCQkJdHRtX2JvX3VucmVzZXJ2ZSgmdnBz
LT5iby0+YmFzZSk7DQo+ICAgCQl9DQo+ICAgCX0NCj4gQEAgLTc0NCw5ICs3NDMsNiBAQCB2
bXdfZHVfY3Vyc29yX3BsYW5lX3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUs
DQo+ICAgDQo+ICAgCQlyZXQgPSB0dG1fYm9fa21hcCgmdnBzLT5iby0+YmFzZSwgMCwgUEZO
X1VQKHNpemUpLCAmdnBzLT5iby0+bWFwKTsNCj4gICANCj4gLQkJaWYgKGxpa2VseShyZXQg
PT0gMCkpDQo+IC0JCQlhdG9taWNfaW5jKCZ2cHMtPmJvLT5iYXNlX21hcHBlZF9jb3VudCk7
DQo+IC0NCj4gICAJCXR0bV9ib191bnJlc2VydmUoJnZwcy0+Ym8tPmJhc2UpOw0KPiAgIA0K
PiAgIAkJaWYgKHVubGlrZWx5KHJldCAhPSAwKSkNCj4gQEAgLTc4Niw3ICs3ODIsNiBAQCB2
bXdfZHVfY3Vyc29yX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUsDQo+ICAgCXN0cnVjdCB2bXdfcGxhbmVfc3RhdGUgKnZwcyA9IHZtd19wbGFuZV9zdGF0
ZV90b192cHMobmV3X3N0YXRlKTsNCj4gICAJc3RydWN0IHZtd19wbGFuZV9zdGF0ZSAqb2xk
X3ZwcyA9IHZtd19wbGFuZV9zdGF0ZV90b192cHMob2xkX3N0YXRlKTsNCj4gICAJczMyIGhv
dHNwb3RfeCwgaG90c3BvdF95Ow0KPiAtCWJvb2wgZHVtbXk7DQo+ICAgDQo+ICAgCWhvdHNw
b3RfeCA9IGR1LT5ob3RzcG90X3g7DQo+ICAgCWhvdHNwb3RfeSA9IGR1LT5ob3RzcG90X3k7
DQo+IEBAIC04MjgsMTEgKzgyMyw2IEBAIHZtd19kdV9jdXJzb3JfcGxhbmVfYXRvbWljX3Vw
ZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gICAJCQkJCQlob3RzcG90X3gsIGhv
dHNwb3RfeSk7DQo+ICAgCX0NCj4gICANCj4gLQlpZiAodnBzLT5ibykgew0KPiAtCQlpZiAo
dHRtX2ttYXBfb2JqX3ZpcnR1YWwoJnZwcy0+Ym8tPm1hcCwgJmR1bW15KSkNCj4gLQkJCWF0
b21pY19kZWMoJnZwcy0+Ym8tPmJhc2VfbWFwcGVkX2NvdW50KTsNCj4gLQl9DQo+IC0NCj4g
ICAJZHUtPmN1cnNvcl94ID0gbmV3X3N0YXRlLT5jcnRjX3ggKyBkdS0+c2V0X2d1aV94Ow0K
PiAgIAlkdS0+Y3Vyc29yX3kgPSBuZXdfc3RhdGUtPmNydGNfeSArIGR1LT5zZXRfZ3VpX3k7
DQo+ICAgDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------Y40qfs6cOg3EtmaFav3ZhuEc--

--------------jMzDExm5mebhFAOPYmoowY7s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPTzcsFAwAAAAAACgkQlh/E3EQov+DZ
CQ//SXnOH6mrCQxoVFMtir30rWW0gLQ6up5SBZaDuWrV3NhGqz40bzfzh9E8gl1hs6kCkBIGEB8a
vDFih43A3eU8rtQMnjp114ThwbJlgTPX72c4hkZjIdJr3Af3M5HXZ8IbtpwjCfSXtyoreQZE1bfM
3qihcv1WnwTeli3jLqL7cWpqgy57inw5XtBptP2J0jXu/sD1dBsUrB2EQVVA3aUtUjLxNHZ6nCGY
CwGHTj4w+w5bc/47gcPnqO3f2fRcbUJ4IrkLnelGz4bJ9zRS3ZIFz08mWbuT8LBy2U6WqL4UvYwh
GMyJD8j7ISEsUm1iDTmwyfCdbwcYWvruHn+4JKDYIzvjyxG6ssgvWYqcV/1/UKV0LiBs6YbzQkk0
kPdKxupQwv4pAu3EBQqppZcXZ++iAZvUikvBS3f3y0bUbwRpfilmkmBHKSrzfVCLtH5Kbg7Bazp6
I6JqV8MdTxm9f37sgV/46qvYXmeRVVlzc04kfA7rWVacX3yXSYm7WkBvlrCS22WIyj5cmoMiQNAu
0jsZiNY4IJO3FHC0MwmF9PDiixJvmKKhlR6AlznFE5hVgFAsggK77pwX7NhIUIMjzrd9oBe0V9bo
iuTnbOOevWOQgkmiUEODdem7OvQuoZeZ8ByScxNuKczFXjNGhWgjzgCie19X6BsDoVpSUSXBg43T
6bc=
=ayTt
-----END PGP SIGNATURE-----

--------------jMzDExm5mebhFAOPYmoowY7s--
