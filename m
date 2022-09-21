Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FCF5BFC93
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 12:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB8710E902;
	Wed, 21 Sep 2022 10:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC8010E902
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 10:49:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7DFDD1F38D;
 Wed, 21 Sep 2022 10:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663757384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CKxuAaVIARBawYJoAsDzjIbYwjw6sHfZ1oFGDQCpIG8=;
 b=TPNKerdMKUSRVQTmdlvsFh2F8IVRRcNUshELg1/U0qRqf+WxcJEFdBUiILirjCoY7DM/lD
 h9VMP20DKdNsikkNwyBNDD1KwaeiBD+ww2oRvSX+EMUGKhu0Dl5xCZSFAJBRft6G1/vRMh
 I0AM1loiono/o+vtprdKdCgjhmvK3WA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663757384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CKxuAaVIARBawYJoAsDzjIbYwjw6sHfZ1oFGDQCpIG8=;
 b=FBzawrYURLDpHtVovEdJiIoOFYjuAQYun090PtkN4jaW3Ba8P63PcJpkNfyPT1zmDi07fP
 sR28f5GblVMJOMCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61F1513A89;
 Wed, 21 Sep 2022 10:49:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W57sFkjsKmPbbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Sep 2022 10:49:44 +0000
Message-ID: <311b3762-ffb3-0e6c-d858-cef6b3367664@suse.de>
Date: Wed, 21 Sep 2022 12:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de> <YynOvpMGbVKWiO8p@intel.com>
 <92ae6ffe-9fdd-35bb-48d0-a7cfe221282a@suse.de> <YyrNXSoZJdidfF0T@intel.com>
 <17203390-af02-0934-9d9f-df68be78c3a4@suse.de> <YyrlE22J4JT6bDu5@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YyrlE22J4JT6bDu5@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xpuGha7ZC4sYgAFptnyuMcUr"
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
Cc: airlied@linux.ie, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xpuGha7ZC4sYgAFptnyuMcUr
Content-Type: multipart/mixed; boundary="------------m8NsqNeaEJttfCP2EcgLljdl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: airlied@linux.ie, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org
Message-ID: <311b3762-ffb3-0e6c-d858-cef6b3367664@suse.de>
Subject: Re: [PATCH 4/5] drm/damage-helper: Do partial updates if framebuffer
 has not been changed
References: <20220920135619.9209-1-tzimmermann@suse.de>
 <20220920135619.9209-5-tzimmermann@suse.de> <YynOvpMGbVKWiO8p@intel.com>
 <92ae6ffe-9fdd-35bb-48d0-a7cfe221282a@suse.de> <YyrNXSoZJdidfF0T@intel.com>
 <17203390-af02-0934-9d9f-df68be78c3a4@suse.de> <YyrlE22J4JT6bDu5@intel.com>
In-Reply-To: <YyrlE22J4JT6bDu5@intel.com>

--------------m8NsqNeaEJttfCP2EcgLljdl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDkuMjIgdW0gMTI6MTggc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQpb
Li4uXQ0KPj4NCj4+Pg0KPj4+IFRob3VnaCBJIGRvbid0IHJlYWxseSBrbm93IGlmIGEgdGhl
cmUgaXMgc29mdHdhcmUgcmVseWluZyBvbg0KPj4+IHRoYXQgYmVoYXZpdW9yLiBJIHN1cHBv
c2Ugb25lIGlkZWEgY291bGQgYmUgdG8ga2VlcCB0aGF0DQo+Pj4gYmVoYXZpb3VyIGZvciB0
aGUgbGVnYWN5IGlvY3RscyBidXQgbm90IGZvciBhdG9taWMuIEVlLiBhbnkNCj4+PiBmYiBk
aXJlY3RseSBzcGVjaWZpZWQgaW4gYSBsZWdhY3kgc2V0Y3J0Yy9zZXRwbGFuZS9wYWdlZmxp
cA0KPj4+IGlzIGFsd2F5cyBjb25zaWRlcmVkIGZ1bGx5IGRhbWFnZWQuIEJ1dCBpbmNsdWRp
bmcgYW4gdGhlIHNhbWUNCj4+DQo+PiBBc3N1bWluZyB0aGUgc3BlY2lmaWVkIGZiIHRvIGJl
IGRhbWFnZWQgc2VlbXMgbGlrZSBhIG5vbi1pc3N1ZSB0byBtZS4NCj4+DQo+PiBUaGUgcHJv
YmxlbSBpcyB3aXRoIHRoZSBvdGhlciBmcmFtZWJ1ZmZlcnM6IGlmIHVzZXJzcGFjZSBzZW5k
cyB1cyBhDQo+PiBDVVJTT1JfTU9WRSBpb2N0bCwgd2UgY2FuIHNhZmVseSBhc3N1bWUgdGhl
IGN1cnNvciBmYiB0byBiZSBkYW1hZ2VkLiBCdXQNCj4+IHdlIGRvbid0IHdhbnQgdGhlIHBy
aW1hcnkgcGxhbmUncyBmYiB0byBiZSBkYW1hZ2VkLiBPciBlbHNlIHdlJ2QgcmVkcmF3DQo+
PiB0aGUgZnVsbCBwcmltYXJ5IHBsYW5lLg0KPj4NCj4+DQo+Pj4gZmIgaW4gdGhlIGF0b21p
YyBpb2N0bCBkb2VzIG5vdCBpbXBseSBkYW1hZ2UuIFRoYXQgd291bGQNCj4+PiBtZWFuIGF0
b21pYyBoYXMgdG8gcmVseSBvbiBzcGVjaWZ5aW5nIGRhbWFnZSBleHBsaWNpdGx5LCBhbmQN
Cj4+PiBhbnkgdXNlcnNwYWNlIHRoYXQgZG9lc24ndCBkbyB0aGF0IHdpbGwgYmUgYnJva2Vu
Lg0KPj4NCj4+IFRoZSBwcm9ibGVtIGFnYWluIGlzIG5vdCBpbiB0aGUgZGFtYWdlIGluZm9y
bWF0aW9uIG9uIHBsYW5lcyB0aGF0DQo+PiBsZWdpdGltYXRlbHkgbmVlZCBhIHJlZHJhdy4g
SXQncyBhbGwgdGhlIG90aGVyIHBsYW5lcyB0aGF0IGFyZSBiZWluZw0KPj4gcmVkcmF3biBh
cyB3ZWxsLiBPciBpcyB0aGVyZSBzb21lIHNjZW5hcmlvIHRoYXQgSSBkb24ndCBzZWU/DQo+
IA0KPiBJIHRob3VnaHQgd2UncmUgdGFsa2luZyBhYm91dCBlZy4gYSBjdXJzb3IgdXBkYXRl
IHRoYXQgYWxzbw0KPiBpbmNsdWRlcyB0aGUgcHJpbWFyeSBwbGFuZSBiZWNhdXNlIGFwcGFy
ZW50bHkgdXNlcnNwYWNlIGlzIGxhenkuDQo+IA0KPiBJIHRoaW5rIHdoYXQgeW91J3JlIHNh
eWluZyBpcyB0aGF0IGN1cnJlbnRseSB0aGVyZSBpcyBubw0KPiBkYW1hZ2UgaW5mb3JtYXRp
b24gZm9yIHRoZSBwcmltYXJ5IHBsYW5lIHNvIHlvdSdyZSBhdHRlbXB0aW5nDQo+IHRvIGlu
ZmVyIGl0IGJhc2VkIG9uIHdoZXRoZXIgdGhlIGZiIHByb3BlcnR5IGNoYW5nZWQgb3Igbm90
Lg0KDQpDb3JyZWN0Lg0KDQo+IA0KPiBBbmQgd2hhdCBJIHdhcyBzYXlpbmcgaXMgdGhhdCBJ
SVJDIGhpc3RvcmljYWxseSBzcGVjaWZ5aW5nDQo+IHRoZSBzYW1lIGZiIGFnYWluIGhhcyBz
dGlsbCBpbXBsaWVkIGZ1bGwgZGFtYWdlLiBDaGFuZ2luZw0KPiB0aGF0IGJlaGF2aW91ciBt
YXkgb3IgbWF5IG5vdCBicmVhayBleGlzaW5nIHVzZXJzcGFjZS4NCg0KSSBjYW5ub3QgYW5z
d2VyIHRoZSBxdWVzdGlvbi4gVGhlIHRocmVlIGNhc2VzIEkndmUgc2VlbiBhdCBsZWFzdCB3
b3JrZWQgDQp3aXRoIHRoZSBuZXcgc2VtYW50aWNzLiBJIHRoaW5rIERhbmllbCBvbmNlIG1l
bnRpb25lZCB0aGF0IHdlIGFscmVhZHkgDQpleHBlY3QgdXNlcnNwYWNlIHRvIGNhbGwgdGhl
IERJUlRZRkIgaW9jdGwgYWZ0ZXIgY2hhbmdpbmcgYSANCmZyYW1lYnVmZmVyJ3MgY29udGVu
dC4NCg0KPiANCj4+DQo+Pj4NCj4+PiBPciB3ZSBjb3VsZCBpbnRyb2R1Y2UgYSBjbGllbnQg
Y2FwIGZvciBpdCBJIGd1ZXNzLCBidXQgdGhhdA0KPj4+IHdvdWxkIHJlcXVpcmUgKG1pbmlt
YWwpIHVzZXJzcGFjZSBjaGFuZ2VzLg0KPj4+DQo+Pj4+DQo+Pj4+IEkga25vdyB0aGF0IHdl
IGRvbid0IGdpdmUgcGVyZm9ybWFuY2UgZ3VhcmFudGVlcyB0byB1c2Vyc3BhY2UuIEJ1dCB1
c2luZw0KPj4+PiBjdXJzb3Ivb3ZlcmxheSBwbGFuZXMgc2hvdWxkIGJlIGZhc3RlciB0aGVu
IG5vdCB1c2luZyB0aGVtLiBJIHRoaW5rDQo+Pj4+IHRoYXQncyBhIHJlYXNvbmFibGUgYXNz
dW1wdGlvbiBmb3IgdXNlcnNwYWNlIHRvIG1ha2UuDQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4gQW5v
dGhlciB0aGluZyB0aGUgaW9jdGxzIGhhdmUgYWx3YXlzIGRvbmUgaXMgYWN0dWFsbHkgcGVy
Zm9ybQ0KPj4+Pj4gdGhlIGNvbW1pdCB3aGV0aGVyIGFueXRoaW5nIGNoYW5nZWQgb3Igbm9y
LiBUaGF0IGlzLCB0aGV5DQo+Pj4+PiBzdGlsbCBkbyBhbGwgdGhlIHNhbWUgdGhlIHNhbWUg
dmJsYW5reSBzdHVmZiBhbmQgdGhlIGNvbW1pdA0KPj4+Pj4gdGFrZXMgdGhlIHNhbWUgYW1v
dW50IG9mIHRpbWUuIE5vdCBzdXJlIGlmIHlvdXIgaWRlYSBpcw0KPj4+Pj4gdG8gcG90ZW50
aWFsbHkgc2hvcnQgY2lyY3VpdCB0aGUgZW50aXJlIHRoaW5nIGFuZCBtYWtlIGl0DQo+Pj4+
PiB0YWtlIG5vIHRpbWUgYXQgYWxsPw0KPj4+Pg0KPj4+PiBUaGUgcGF0Y2hlcyBkb24ndCBj
aGFuZ2UgdGhlIG92ZXJhbGwgY29tbWl0IGxvZ2ljcy4gQWxsIHRoZXkgZG8gaXMgdG8NCj4+
Pj4gc2V0IGRhbWFnZSB1cGRhdGVzIHRvIGEgc2l6ZSBvZiAwIGlmIGEgcGxhbmUgcmVsaWFi
bHkgZG9lcyBub3QgbmVlZCBhbg0KPj4+PiB1cGRhdGUuDQo+Pj4NCj4+PiBXaGF0IEkgZ2F0
aGVyZWQgaXMgdGhhdCB5b3Ugc2VlbWVkIHRvIG9ubHkgY29uc2lkZXIgdGhlIGZiDQo+Pj4g
Y29udGVudHMgYXMgc29tZXRoaW5nIHRoYXQgbmVlZHMgZGFtYWdlIGhhbmRsaW5nLiBUaGF0
IGlzIG5vdA0KPj4+IHRoZSBjYXNlIGZvciBzdHVmZiBsaWtlIGVEUCBQU1IgYW5kIERTSSBj
b21tYW5kIG1vZGUgZGlzcGxheXMNCj4+PiB3aGVyZSB3ZSBuZWVkIHRvIHVwbG9hZCBhIG5l
dyBmdWxsIGZyYW1lIHdoZW5ldmVyIGFsc28gdGhlDQo+Pj4gbm9uLWRhbWFnZWQgZmIgY29u
dGVudHMgd291bGQgZ2V0IHRyYW5zZm9ybWVkIGJ5IHRoZSBoYXJkd2FyZQ0KPj4+IG9uIHRo
ZSB3YXkgdG8gdGhlIHJlbW90ZSBmcmFtYnVmZmVyLiBUaGF0IHdvdWxkIG1lYW4gYW55IGNo
YW5nZQ0KPj4+IGluIGVnLiBzY2Fub3V0IGNvb3JkaW5hdGVzLCBjb2xvciBtYW5hZ2VtZW50
LCBldGMuDQo+Pg0KPj4gVGhlcmUgaXMgc3VwcG9ydCBmb3IgY2hhbmdpbmcgc2Nhbm91dCBj
b29yZGluYXRlcyBpbg0KPj4gZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0ZXJfaW5pdCgp
IGluIHBhdGNoIDIuIEluIGdlbmVyYWwsIG1heWJlIHRoZQ0KPj4gaGV1cmlzdGljIG5lZWRz
IHRvIGJlIHN0cmljdGVyIHRvIG9ubHkgaGFuZGxlIHVwZGF0ZXMgdGhhdCBvbmx5IGNoYW5n
ZQ0KPj4gZGFtYWdlLg0KPj4NCj4+IEZvciBub3csIHRoZSBwcm9ibGVtIG9ubHkgaGFwcGVu
cyBhZnRlciBjb252ZXJ0aW5nIGFzdCB0byBTSE1FTS4gQWxsIHRoZQ0KPj4gb3RoZXIgU0hN
RU0tYmFzZWQgZHJpdmVycyB1c2UgYSBzaW5nbGUgcGxhbmUgd2hlcmUgdGhlIHByb2JsZW0g
ZG9lc24ndA0KPj4gaGFwcGVuOyBvciBvbmx5IHJlcHJvZ3JhbSB0aGUgc2Nhbm91dCBhZGRy
ZXNzLCB3aGljaCBpcyBmYXN0LiBJZiB0aGUNCj4+IGRhbWFnZS1oYW5kbGluZyBsb2dpYyBp
bXBvc2VzIHByb2JsZW1zIG9uIG90aGVyIGRyaXZlcnMsIHNvbWUgb2YgaXQNCj4+IGNvdWxk
IHBvc3NpYmx5IGJlIG1vdmVkIGludG8gYXN0IGl0c2VsZi4NCj4gDQo+IE1heWJlIHdlIGhh
dmUgdHdvIGNsZWFybHkgc2VwYXJhdGUgY2xhc3NlcyBvZiB1c2VzIGNhc2U6DQo+IDEuIGRl
dmljZXMgd2hlcmUgb25seSBkYW1hZ2UgdG8gdGhlIGZiIGNvbnRlbnRzIG1hdHRlciAoZWcu
IHNvbWUga2luZCBvZg0KPiAgICAgc2hhZG93IGZiIHRoYXQgaXMgdGhlIHNhbWUgc2l6ZSBh
cyB0aGUgcmVhbCBmYikuDQo+IDIuIGRldmljZXMgd2hlcmUgZXZlcnl0aGluZyBhYm91dCB0
aGUgc2Nhbm91dCBwcm9jZXNzIG1hdHRlcnMgKGVnLiBQU1IpDQo+ID8NCj4gDQo+IE1heWJl
IHRoZXJlIHNob3VsZCBiZSBoZWxwZXJzIHRvIGRlYWwgd2l0aCBqdXN0IHRoZSBmaXJzdCBj
YXNlLA0KPiBhbmQgdGhlbiBzb21lIG1vcmUgaGVscGVycyAob3IganVzdCBkcml2ZXIgY29k
ZSkgdG8gcGlsZSB0aGUgcmVzdA0KPiBvbiB0b3AgYXMgd2VsbCB3aGVuIG5lZWRlZD8NCg0K
TWFrZXMgc2Vuc2UuDQoNCkkga25vdyB0aGF0IHRoZXNlIHBsYW5lLXN0YXRlIGFyZSBub3Qg
Z29vZCBzdHlsZSwgYnV0IHdpdGggdGhlbSBpbiANCnBsYWNlLCBtdWNoIG9mIHRoZSBoZXVy
aXN0aWMgY291bGQgYmUgbW92ZWQgZnJvbSANCmRybV9hdG9taWNfaGVscGVyX2NoZWNrX3Bs
YW5lX2RhbWFnZSgpIGludG8gdGhlIGRyaXZlciBpZiBuZWNlc3NhcnkuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------m8NsqNeaEJttfCP2EcgLljdl--

--------------xpuGha7ZC4sYgAFptnyuMcUr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMq7EgFAwAAAAAACgkQlh/E3EQov+D7
lQ//SKi+YNa6SSUOYqtTvuywTa5KMPWqPRHeeJPaMluWm619JuVQgVnuFUP7DpqrFcAVp6Xb0iLu
4OG+Qn2oM0eFgnasF0u8C7o44dpV0q/l/K24k6hOPaMPyRbStisxIgP5RomLgL6+XxMZjv/JDqcm
+jGR3TfURBk9NlrPkFTBTmiutXWmuTAD9A2/CaN9K5nCYtP3+zuT/gPuKB7ygd75JNW3z8Df4Ezz
c4fmSDykVIswhvmo298mxm76mPK+l68Ro0EbQKkdZJOqApUr3IZMtlTnHH53KQBZp/d8oKup94BC
h1MMml9qrMqgFEV9uyq265u97gxb1srNQksw4shNfCz6LSfm5eYpTxgYaTw9vyBEAXtLmTn70jWf
dT1yFJs+aLA+NwXq1Yh4TyehQRPdM25R3YHWG122cSC5iUyFfmZtGgYPsCgdYHQwhlLsGLYlrooh
68dv5JMWHtXT1wmsQBai4Vgfpd0Vol831pETh/DDbPxsw7vYY9pcarbxybR7lk5lRQ50EPOMHvzK
Kv9OyAOJm4zJvF3wnzc7v3Bo/U/81KoqIH04znX/1BboaKJmhl+cyM1oVCxdexEIqusHeVD2IDSc
ig1FH18idC5SY2bdpyBIZAaq/+x0VZzPnbzDLDsCbADY0Q1b5F3N2KoB9BdWAvPmTrocvIyfKr0S
u+0=
=6xWy
-----END PGP SIGNATURE-----

--------------xpuGha7ZC4sYgAFptnyuMcUr--
