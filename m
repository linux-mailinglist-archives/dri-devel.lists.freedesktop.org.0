Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF2F5B7190
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D0410E740;
	Tue, 13 Sep 2022 14:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8932C10E740
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 14:44:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 481885C281;
 Tue, 13 Sep 2022 14:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663080264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7JE6/DwSNktACsUTIcotoZT1B5EevR2xE2i6o8rtO0I=;
 b=jTpK7/Jclbrm+Nc0eUnbazqg/s+U8o0MhK/khWKT4vr5QW7kLPKJesfyoC7jUKB5ttLjFY
 NQ9+QyBVo0bxtik5JqwnB/7CQ4S51WxRH0Fvfoal4pGu/VuIFU+cbfeBqGRoB+Irth7BAX
 B+LC+XwJWCVNP4Po8qVPeSN+JktUVlA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663080264;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7JE6/DwSNktACsUTIcotoZT1B5EevR2xE2i6o8rtO0I=;
 b=McH8heTnIZHEVVmtipRDBPorKFsGL74MhPq7Z+NMQJ2ngujFVMLRoCbDqarGOwFg/8wdk1
 FLWzyUOLnRWDc7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34A7113AB5;
 Tue, 13 Sep 2022 14:44:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pv7oC0iXIGPbQQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Sep 2022 14:44:24 +0000
Message-ID: <613ca1d0-8680-9f45-9317-d6b316f307ce@suse.de>
Date: Tue, 13 Sep 2022 16:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
Content-Language: en-US
To: Wang Yugui <wangyugui@e16-tech.com>
References: <20220907121612.FBFC.409509F4@e16-tech.com>
 <5dbb416f-04dd-d2d7-a542-3d83b45a99a0@suse.de>
 <20220913222506.6C72.409509F4@e16-tech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220913222506.6C72.409509F4@e16-tech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jYRfkIYoxFzfU0FnsOOT6Dhk"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jYRfkIYoxFzfU0FnsOOT6Dhk
Content-Type: multipart/mixed; boundary="------------O7YAUr4Y4kHBmUeSwUZPc9Cv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <613ca1d0-8680-9f45-9317-d6b316f307ce@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
References: <20220907121612.FBFC.409509F4@e16-tech.com>
 <5dbb416f-04dd-d2d7-a542-3d83b45a99a0@suse.de>
 <20220913222506.6C72.409509F4@e16-tech.com>
In-Reply-To: <20220913222506.6C72.409509F4@e16-tech.com>

--------------O7YAUr4Y4kHBmUeSwUZPc9Cv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDkuMjIgdW0gMTY6MjUgc2NocmllYiBXYW5nIFl1Z3VpOg0KPiBIaSwN
Cj4gDQo+PiBIaQ0KPj4NCj4+IEFtIDA3LjA5LjIyIHVtIDA2OjE2IHNjaHJpZWIgV2FuZyBZ
dWd1aToNCj4+PiBIaSwNCj4+Pg0KPj4+PiBBbSAwMi4wOS4yMiB1bSAwNzo1MiBzY2hyaWVi
IFdhbmcgWXVndWk6DQo+Pj4+PiBIaSwNCj4+Pj4+DQo+Pj4+PiBtZ2FnMjAwIGJyb2tlbiBv
biBrZXJuZWwtNi4wLXJjMyBvbiBERUxML1Q2MjAuDQo+Pj4+Pg0KPj4+Pj4gU2VlIHRoZSBh
dHRhY2hlbWVudG1lbnQgZmlsZSBmb3IgdGhlIGdyYXBoIG91dHB1dC4NCj4+Pj4NCj4+Pj4g
VGhhbmtzIGZvciByZXBvcnRpbmcgdGhlIGJ1Zy4gV2UgcmVjZW50bHkgcmVmYWN0b3JlZCBz
b21lIGNvZGUgb2YgdGhlIGRyaXZlci4gQ2FuIHlvdSBiaXNlY3QgdG8gdGhlIGNoYW5nZSB0
aGF0IGludHJvZHVjZWQgdGhlIHByb2JsZW0/DQo+Pj4NCj4+PiA1LjE5LjMgd29ya3Mgd2Vs
bCBvbiB0aGlzIERFTEwvVDYyMC4NCj4+Pg0KPj4+IHNvIHRoaXMgcHJvYmxlbSBzaG91bGQg
YmUgYSByZWdyZXNzaW9uIG9mIDYuMC4NCj4+Pg0KPj4+IG90aGVyIGJpc2VjdCBzZWVtIGRp
ZmZpY3VsdCBmb3IgbWUuDQo+Pg0KPj4gSSBsb29rZWQgZm9yIGNoYW5nZXMgYmV0d2VlbiA1
LjE5IGFuZCA2LjAtcmMzIHRoYXQgY291bGQgYWZmZWN0IEcyMDBFUiBzcGVjaWZpY2FsbHks
IGJ1dCBjb3VsZCBub3QgZmluZCBhbnl0aGluZy4gSXQgd291bGQgaGVscCBpZiBJJ2Qga25v
dyB0aGUgZmlyc3QgYnJva2VuIGNvbW1pdC4gSXMgdGhlcmUgYW55IGNoYW5jZSB0aGF0IHlv
dSBnZXQgdGhlIGdpdCBiaXNlY3RpbmcgdG8gd29yaz8NCj4+DQo+PiBUaGUgY29tbWFuZHMg
c2hvdWxkIGJlDQo+Pg0KPj4gICAgIGdpdCBiaXNlY3QgcmVzZXQNCj4+ICAgICBnaXQgYmlz
ZWN0IHN0YXJ0IHY2LjAtcmMzIHY1LjE5DQo+IA0KPiBBIGRpcnR5IHBhdGNoKGJlbG93KSB3
b3JrcyB3ZWxsLiAgYnV0IHdlIG5lZWQgYSBmaW5hbCBmaXguDQo+IA0KPiAjIGdpdCBkaWZm
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jDQo+IGluZGV4IDIy
NWNjYTJlZDYwZS4uY2Q5NzZiYWEyZjQ0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdh
ZzIwMC9tZ2FnMjAwX21vZGUuYw0KPiBAQCAtMTA3MCw3ICsxMDcwLDcgQEAgaW50IG1nYWcy
MDBfbW9kZXNldF9pbml0KHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2LCByZXNvdXJjZV9zaXpl
X3QgdnJhbV9hdmFpbGFibGUNCj4gDQo+ICAgICAgICAgIGRldi0+bW9kZV9jb25maWcubWF4
X3dpZHRoID0gTUdBRzIwMF9NQVhfRkJfV0lEVEg7DQo+ICAgICAgICAgIGRldi0+bW9kZV9j
b25maWcubWF4X2hlaWdodCA9IE1HQUcyMDBfTUFYX0ZCX0hFSUdIVDsNCj4gLSAgICAgICBk
ZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDI0Ow0KPiArICAgICAgIGRldi0+
bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMTY7DQo+ICAgICAgICAgIGRldi0+bW9k
ZV9jb25maWcuZmJfYmFzZSA9IG1kZXYtPnZyYW1fcmVzLT5zdGFydDsNCj4gICAgICAgICAg
ZGV2LT5tb2RlX2NvbmZpZy5mdW5jcyA9ICZtZ2FnMjAwX21vZGVfY29uZmlnX2Z1bmNzOw0K
PiANCj4gSSBmaXJzdGx5IHRyaWVkIHRvIGJ1aWxkIHdob2xlIGtlcm5lbCBiYXNlIG9uDQo+
IGM1NzdiMmY0M2U4MCBkcm0vbWdhZzIwMDogRW5hYmxlIGF0b21pYyBnYW1tYSBsdXQgdXBk
YXRlDQo+IGQ0NWUzMmM5ZDk4YyBkcm0vbWdhZzIwMDogQ2FsbCBtZ2FnMjAwX2RldmljZV9w
cm9iZV92cmFtKCkgZnJvbQ0KPiBwZXItbW9kZWwgaW5pdA0KPiANCj4gYm90aCBmYWlsZWQg
dG8gYm9vdCwgc28gZmFpbGVkIHRvIHRlc3QgbWdhZzIwMCBkcml2ZXIuDQo+IA0KPiBzbyBJ
IHRyaWVkIHRvIHJldmVydCBwYXRjaCBvZiBtZ2FnMjAwIGRyaXZlciBpbiBiYXRjaCBvZiAy
IG9yIDMsIHRoZSBJDQo+IG5vdGljZWQgdGhlIHBhdGNoICdTdWJqZWN0OiBkcm0vbWdhZzIw
MDogUmVtb3ZlIHNwZWNpYWwgY2FzZSBmb3IgRzIwMFNFDQo+IHdpdGggPDIgTWlCJyBhbmQg
dGhlbiB0cmllZCB0aGlzIGRpcnR5IGZpeC4NCg0KT2gsIGdyZWF0IHdvcmshIFRoYW5rIHlv
dS4gRnJvbSBsb29raW5nIGF0IHRoZSBzY3JlZW5zaG90IHRoYXQgeW91IA0KcHJvdmlkZWQs
IGl0IHNlZW1zIGFzIGlmIHRoZSAyNC1iaXQgbW9kZSBzZXR0aW5nIGlzIGJyb2tlbi4gSSdt
IG5vdCBzdXJlIA0Kd2h5IHRoZSBHMjAwU0Ugd29ya2Fyb3VuZCBhcHBsaWVzIHRvIGEgRzIw
MEVSLCBidXQgd2UnbGwgc2VlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBC
ZXN0IFJlZ2FyZHMNCj4gV2FuZyBZdWd1aSAod2FuZ3l1Z3VpQGUxNi10ZWNoLmNvbSkNCj4g
MjAyMi8wOS8xMw0KPiANCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+
DQo+Pj4NCj4+PiBCZXN0IFJlZ2FyZHMNCj4+PiBXYW5nIFl1Z3VpICh3YW5neXVndWlAZTE2
LXRlY2guY29tKQ0KPj4+IDIwMjIvMDkvMDcNCj4+Pg0KPj4+DQo+Pj4+DQo+Pj4+IEJlc3Qg
cmVnYXJkcw0KPj4+PiBUaG9tYXMNCj4+Pj4NCj4+Pj4+DQo+Pj4+PiBbcm9vdEBUNjIwIH5d
IyBkbWVzZyAgfGdyZXAgLWkgJ3ZnYVx8bWdhJw0KPj4+Pj4gWyAgICAwLjU4ODk0MF0gQ29u
c29sZTogY29sb3VyIFZHQSsgODB4MjUNCj4+Pj4+IFsgICAgNC45MTgyMTRdIHBjaSAwMDAw
OjBhOjAwLjA6IHZnYWFyYjogc2V0dGluZyBhcyBib290IFZHQSBkZXZpY2UNCj4+Pj4+IFsg
ICAgNC45MTkwMjhdIHBjaSAwMDAwOjBhOjAwLjA6IHZnYWFyYjogYnJpZGdlIGNvbnRyb2wg
cG9zc2libGUNCj4+Pj4+IFsgICAgNC45MTkwMjhdIHBjaSAwMDAwOjBhOjAwLjA6IHZnYWFy
YjogVkdBIGRldmljZSBhZGRlZDogZGVjb2Rlcz1pbyttZW0sb3ducz1pbyttZW0sbG9ja3M9
bm9uZQ0KPj4+Pj4gWyAgICA0Ljk0MTA1OF0gdmdhYXJiOiBsb2FkZWQNCj4+Pj4+IFsgICAg
OS4zODU0ODVdIG1nYWcyMDAgMDAwMDowYTowMC4wOiB2Z2FhcmI6IGRlYWN0aXZhdGUgdmdh
IGNvbnNvbGUNCj4+Pj4+IFsgICAgOS41MTA2ODhdIFtkcm1dIEluaXRpYWxpemVkIG1nYWcy
MDAgMS4wLjAgMjAxMTA0MTggZm9yIDAwMDA6MGE6MDAuMCBvbiBtaW5vciAwDQo+Pj4+PiBb
ICAgIDkuNTIzMTQ1XSBmYmNvbjogbWdhZzIwMGRybWZiIChmYjApIGlzIHByaW1hcnkgZGV2
aWNlDQo+Pj4+PiBbICAgIDkuNjQxNTQzXSBtZ2FnMjAwIDAwMDA6MGE6MDAuMDogW2RybV0g
ZmIwOiBtZ2FnMjAwZHJtZmIgZnJhbWUgYnVmZmVyIGRldmljZQ0KPj4+Pj4NCj4+Pj4+DQo+
Pj4+PiBtb3JlIGluZm86DQo+Pj4+PiAxLCBUaGlzIERFTEwvVDYyMCB3b3JrcyB3ZWxsIHdp
dGgga2VybmVsIDUuMTUuNjMsDQo+Pj4+PiAgICAgICAgc28gdGhpcyBpcyBub3QgYSAgaGFy
ZHdhcmUgZXJyb3IuDQo+Pj4+Pg0KPj4+Pj4gMiwgREVMTC9UNjQwIHdvcmtzIHdlbGwgd2l0
aCBrZXJuZWwgNi4wLXJjIGFuZCA1LjE1LjYzLg0KPj4+Pj4gICAgICAgIGJvdGggREVMTC9U
NjIwIGFuZCBERUxML1Q2NDAgdXNlIHRoZSBkcml2ZXIgJ21nYWcyMDAnLg0KPj4+Pj4NCj4+
Pj4+IFtyb290QFQ2NDAgfl0jICBkbWVzZyAgfGdyZXAgLWkgJ3ZnYVx8bWdhJw0KPj4+Pj4g
WyAgIDEwLjE2MTUwMF0gcGNpIDAwMDA6MDM6MDAuMDogdmdhYXJiOiBzZXR0aW5nIGFzIGJv
b3QgVkdBIGRldmljZQ0KPj4+Pj4gWyAgIDEwLjE2MjQ2M10gcGNpIDAwMDA6MDM6MDAuMDog
dmdhYXJiOiBWR0EgZGV2aWNlIGFkZGVkOiBkZWNvZGVzPWlvK21lbSxvd25zPWlvK21lbSxs
b2Nrcz1ub25lDQo+Pj4+PiBbICAgMTAuMTc2NTI3XSBwY2kgMDAwMDowMzowMC4wOiB2Z2Fh
cmI6IGJyaWRnZSBjb250cm9sIHBvc3NpYmxlDQo+Pj4+PiBbICAgMTAuMTgyNDY1XSB2Z2Fh
cmI6IGxvYWRlZA0KPj4+Pj4gWyAgIDExLjgzMjgzOV0gZmIwOiBFRkkgVkdBIGZyYW1lIGJ1
ZmZlciBkZXZpY2UNCj4+Pj4+IFsgICAyMS4zMDM4MjZdIG1nYWcyMDAgMDAwMDowMzowMC4w
OiB2Z2FhcmI6IGRlYWN0aXZhdGUgdmdhIGNvbnNvbGUNCj4+Pj4+IFsgICAyMS4zMTk0OThd
IFtkcm1dIEluaXRpYWxpemVkIG1nYWcyMDAgMS4wLjAgMjAxMTA0MTggZm9yIDAwMDA6MDM6
MDAuMCBvbiBtaW5vciAwDQo+Pj4+PiBbICAgMjEuMzMwMjIzXSBmYmNvbjogbWdhZzIwMGRy
bWZiIChmYjApIGlzIHByaW1hcnkgZGV2aWNlDQo+Pj4+PiBbICAgMjEuMzMyMTQwXSBtZ2Fn
MjAwIDAwMDA6MDM6MDAuMDogW2RybV0gZHJtX3BsYW5lX2VuYWJsZV9mYl9kYW1hZ2VfY2xp
cHMoKSBub3QgY2FsbGVkDQo+Pj4+PiBbICAgMjEuNzQxNjI5XSBtZ2FnMjAwIDAwMDA6MDM6
MDAuMDogW2RybV0gZmIwOiBtZ2FnMjAwZHJtZmIgZnJhbWUgYnVmZmVyIGRldmljZQ0KPj4+
Pj4NCj4+Pj4+IEJlc3QgUmVnYXJkcw0KPj4+Pj4gV2FuZyBZdWd1aSAod2FuZ3l1Z3VpQGUx
Ni10ZWNoLmNvbSkNCj4+Pj4+IDIwMjIvMDkvMDINCj4+Pj4+DQo+Pj4+IC0tIFRob21hcyBa
aW1tZXJtYW5uDQo+Pj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+Pj4gU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+Pj4+IE1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQo+Pj4+IEdlc2NoP2Z0c2bDvGhyZXI6IEl2byBUb3Rldg0KPj4+DQo+Pj4NCj4+IC0tIFRo
b21hcyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
Pj4gR2VzY2g/ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo+IA0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------O7YAUr4Y4kHBmUeSwUZPc9Cv--

--------------jYRfkIYoxFzfU0FnsOOT6Dhk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMgl0cFAwAAAAAACgkQlh/E3EQov+D/
Ag/9GkFutUhNK7zCR3/3XPMm5R/3jslXVS5aFeIUpmlDZm1bqNmFxeMumjapxxGhZaDY+i+etyDh
ROhsBWZQNfIudcSzYow4Uxz4m0MDJpwsireBiyWssEHGyhlF4xN7MaL1DrYOrxBrDH1f+hw9Em+S
+NlZOKeIPugTdHrTM96IOlAyhtfldp/OHQ5RUEefkWPphfm0TfGoRmXfgLqKyUb5j5a52idf9rRJ
tUHYcD62QSRzMYOmnIN26mG6Lfe7gPsDsCqTLnsDw7GhTFU5+KMFrWQ7Ofy6/b6mJ8TiLcSeVEzJ
kY7t+i7eLiFBxnktODOCDtxhBCt62E9YoXyMA1/VT/yrfu61SsNP7DKCQJe+95sUfLNYCIWowdOV
ZS+9l47hDn7SXPbyKViyi49ntnP8yoWl0u/yHrJDwjtAcAj2DYYMfZ88NTGtevhqXyHnAGwMtYHW
AgmA/oqmbFr8MD8QulBEiChZRcsw6jg8Bf1XW3weD7Cp3aNY+7J7+uk96WHDIed6Y4CEZn6sv1zx
9c8uLWStEn4MpDbt+A1iRxX9mscsJa4jdHnxhiXakL+5ylIo52ETShFE4rD1ru5yOCKRGHLROpiQ
2t45G6LKoCbcRW7fVBZ9g1sZ2WrRTiugl5Y19R2WBjNocv+jTXpbQbA4KLri1qNRSNwW9rj3y2BY
S/0=
=1Opb
-----END PGP SIGNATURE-----

--------------jYRfkIYoxFzfU0FnsOOT6Dhk--
