Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 697ED637500
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 10:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EEC10E07A;
	Thu, 24 Nov 2022 09:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D71B10E6B9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 09:20:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08844218E8;
 Thu, 24 Nov 2022 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669281609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s/7F8eADxxuOwwriDK2YNEEpOz/q7Ino8iDqN6JvL0s=;
 b=YvCieqMpZAooSwCX8ItORw58TI9nYtJwE6+6Mt8Cp8R5nK1I5ZM+9V8ANf4LnJx7xJTx1K
 y+osm4ofVMhBW7TPKXGhRUaRAe0LpjYdgTWTeX55vvYiSvFXLwNSbUt8k10EcjVz6oku/X
 pNJNAqC/gnISgy+trERSw15Zf+GZUK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669281609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s/7F8eADxxuOwwriDK2YNEEpOz/q7Ino8iDqN6JvL0s=;
 b=UqWDfSu9b8oUGSLznW4rRoHQM9WOHdGFdjuWCnTLMgeLuKAKTQGgAMNg7OLyAAfyrjnt7g
 PziOhJVS9wcgY1DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD40A13B4F;
 Thu, 24 Nov 2022 09:20:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +bP5MEg3f2MyHQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Nov 2022 09:20:08 +0000
Message-ID: <9f069800-f536-e262-1914-bec03e11f57c@suse.de>
Date: Thu, 24 Nov 2022 10:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <e2ef753e-8527-1fc6-f2f0-bc10aa744463@suse.de>
 <CAMuHMdXHOGz6Q9jsp9+Y6Op5qw3E-qUnHzYv3rxkVO5Bd2bKjw@mail.gmail.com>
 <Y38znirlUpFoQRqX@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y38znirlUpFoQRqX@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vibJTMMx0PBal3kNQ4ePKayj"
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
--------------vibJTMMx0PBal3kNQ4ePKayj
Content-Type: multipart/mixed; boundary="------------PrkU5FZRWSZTwU4mrHPfAdT3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <9f069800-f536-e262-1914-bec03e11f57c@suse.de>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <e2ef753e-8527-1fc6-f2f0-bc10aa744463@suse.de>
 <CAMuHMdXHOGz6Q9jsp9+Y6Op5qw3E-qUnHzYv3rxkVO5Bd2bKjw@mail.gmail.com>
 <Y38znirlUpFoQRqX@phenom.ffwll.local>
In-Reply-To: <Y38znirlUpFoQRqX@phenom.ffwll.local>

--------------PrkU5FZRWSZTwU4mrHPfAdT3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMTEuMjIgdW0gMTA6MDQgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIE5vdiAyNCwgMjAyMiBhdCAwOTo1NToxOEFNICswMTAwLCBHZWVydCBVeXR0ZXJo
b2V2ZW4gd3JvdGU6DQo+PiBIaSBUaG9tYXMsDQo+Pg0KPj4gT24gVGh1LCBOb3YgMjQsIDIw
MjIgYXQgOTo0NyBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4g
d3JvdGU6DQo+Pj4gQW0gMjMuMTEuMjIgdW0gMTc6NDMgc2NocmllYiBHZWVydCBVeXR0ZXJo
b2V2ZW46DQo+Pj4+IEFzIG9mIGNvbW1pdCBlYWUwNjEyMGYxOTc0ZTFhICgiZHJtOiByZWZ1
c2UgQURERkIyIGlvY3RsIGZvciBicm9rZW4NCj4+Pj4gYmlnZW5kaWFuIGRyaXZlcnMiKSwg
ZHJpdmVycyBtdXN0IHNldCB0aGUNCj4+Pj4gcXVpcmtfYWRkZmJfcHJlZmVyX2hvc3RfYnl0
ZV9vcmRlciBxdWlyayB0byBtYWtlIHRoZSBkcm1fbW9kZV9hZGRmYigpDQo+Pj4+IGNvbXBh
dCBjb2RlIHdvcmsgY29ycmVjdGx5IG9uIGJpZy1lbmRpYW4gbWFjaGluZXMuDQo+Pj4+DQo+
Pj4+IFdoaWxlIHRoYXQgd29ya3MgZmluZSBmb3IgYmlnLWVuZGlhbiBYUkdCODg4OCBhbmQg
QVJHQjg4ODgsIHdoaWNoIGFyZQ0KPj4+PiBtYXBwZWQgdG8gdGhlIGV4aXN0aW5nIGxpdHRs
ZS1lbmRpYW4gQkdSWDg4ODggYW5kIEJHUkE4ODg4IGZvcm1hdHMsIGl0DQo+Pj4+IGRvZXMg
bm90IHdvcmsgZm9yIGJpZy1lbmRpYW4gWFJHQjE1NTUgYW5kIFJHQjU2NSwgYXMgdGhlIGxh
dHRlciBhcmUgbm90DQo+Pj4+IGxpc3RlZCBpbiB0aGUgZm9ybWF0IGRhdGFiYXNlLg0KPj4+
Pg0KPj4+PiBGaXggdGhpcyBieSBhZGRpbmcgdGhlIG1pc3NpbmcgZm9ybWF0cy4gIExpbWl0
IHRoaXMgdG8gYmlnLWVuZGlhbg0KPj4+PiBwbGF0Zm9ybXMsIGFzIHRoZXJlIGlzIGN1cnJl
bnRseSBubyBuZWVkIHRvIHN1cHBvcnQgdGhlc2UgZm9ybWF0cyBvbg0KPj4+PiBsaXR0bGUt
ZW5kaWFuIHBsYXRmb3Jtcy4NCj4+Pj4NCj4+Pj4gRml4ZXM6IDY5NjBlNmRhOWNlYzNmNjYg
KCJkcm06IGZpeCBkcm1fbW9kZV9hZGRmYigpIG9uIGJpZyBlbmRpYW4gbWFjaGluZXMuIikN
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4NCj4+Pj4gLS0tDQo+Pj4+IHYyOg0KPj4+PiAgICAgLSBVc2UgIkRSTV9GT1JN
QVRfZm9vIHwgRFJNX0ZPUk1BVF9CSUdfRU5ESUFOIiBpbnN0ZWFkIG9mDQo+Pj4+ICAgICAg
ICJEUk1fRk9STUFUX0hPU1RfZm9vIiwNCj4+Pj4gICAgIC0gVHVybiBpbnRvIGEgbG9uZSBw
YXRjaCwgYXMgYWxsIG90aGVyIHBhdGNoZXMgZnJvbSBzZXJpZXMNCj4+Pj4gICAgICAgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9jb3Zlci4xNjU3MzAwNTMyLmdpdC5nZWVydEBsaW51
eC1tNjhrLm9yZw0KPj4+PiAgICAgICB3ZXJlIGFwcGxpZWQgdG8gZHJtLW1pc2MvZm9yLWxp
bnV4LW5leHQuDQo+Pj4+IC0tLQ0KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJj
Yy5jIHwgNCArKysrDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykN
Cj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jDQo+Pj4+IGluZGV4IGUwOTMzMWJiM2Jj
NzNmMjEuLjI2NTY3MWE3ZjkxMzRjMWYgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZm91cmNjLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3Vy
Y2MuYw0KPj4+PiBAQCAtMTkwLDYgKzE5MCwxMCBAQCBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1h
dF9pbmZvICpfX2RybV9mb3JtYXRfaW5mbyh1MzIgZm9ybWF0KQ0KPj4+PiAgICAgICAgICAg
ICAgICB7IC5mb3JtYXQgPSBEUk1fRk9STUFUX0JHUkE1NTUxLCAgICAgICAgLmRlcHRoID0g
MTUsIC5udW1fcGxhbmVzID0gMSwgLmNwcCA9IHsgMiwgMCwgMCB9LCAuaHN1YiA9IDEsIC52
c3ViID0gMSwgLmhhc19hbHBoYSA9IHRydWUgfSwNCj4+Pj4gICAgICAgICAgICAgICAgeyAu
Zm9ybWF0ID0gRFJNX0ZPUk1BVF9SR0I1NjUsICAgICAgICAgIC5kZXB0aCA9IDE2LCAubnVt
X3BsYW5lcyA9IDEsIC5jcHAgPSB7IDIsIDAsIDAgfSwgLmhzdWIgPSAxLCAudnN1YiA9IDEg
fSwNCj4+Pj4gICAgICAgICAgICAgICAgeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9CR1I1NjUs
ICAgICAgICAgIC5kZXB0aCA9IDE2LCAubnVtX3BsYW5lcyA9IDEsIC5jcHAgPSB7IDIsIDAs
IDAgfSwgLmhzdWIgPSAxLCAudnN1YiA9IDEgfSwNCj4+Pj4gKyNpZmRlZiBfX0JJR19FTkRJ
QU4NCj4+Pj4gKyAgICAgICAgICAgICB7IC5mb3JtYXQgPSBEUk1fRk9STUFUX1hSR0IxNTU1
IHwgRFJNX0ZPUk1BVF9CSUdfRU5ESUFOLCAuZGVwdGggPSAxNSwgLm51bV9wbGFuZXMgPSAx
LCAuY3BwID0geyAyLCAwLCAwIH0sIC5oc3ViID0gMSwgLnZzdWIgPSAxIH0sDQo+Pj4+ICsg
ICAgICAgICAgICAgeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9SR0I1NjUgfCBEUk1fRk9STUFU
X0JJR19FTkRJQU4sIC5kZXB0aCA9IDE2LCAubnVtX3BsYW5lcyA9IDEsIC5jcHAgPSB7IDIs
IDAsIDAgfSwgLmhzdWIgPSAxLCAudnN1YiA9IDEgfSwNCj4+Pg0KPj4+IEdldHRpbmcgYmFj
ayB0byB0aGUgZGlzY3Vzc2lvbiBvbiBlbmRpYW5lc3MsIEkgZG9uJ3QgdW5kZXJzdGFuZCB3
aHkgdGhlDQo+Pj4gQklHX0VORElBTiBmbGFnIGlzIHNldCBoZXJlLiAgQUZBSUsgdGhlc2Ug
Zm9ybWF0cyBhcmUgYWx3YXlzIGxpdHRsZQ0KPj4+IGVuZGlhbi4gIEFuZCB0aGUgQkUgZmxh
ZyBpcyBzZXQgYnkgZHJpdmVycy91c2Vyc3BhY2UgaWYgYSBmcmFtZWJ1ZmZlcg0KPj4+IGhh
cyBhIEJFIG9yZGVyaW5nLg0KPj4+DQo+Pj4gSXQgd291bGQgYmUgYmV0dGVyIHRvIGZpbHRl
ciB0aGUgQkUgZmxhZyBpbiBfX2RybV9mb3JtYXRfaW5mbygpIGJlZm9yZQ0KPj4+IHRoZSBm
dW5jdGlvbiBkb2VzIHRoZSBsb29rdXAuDQo+Pg0KPj4gSSBtZW50aW9uZWQgdGhhdCBhbHRl
cm5hdGl2ZSBpbiBbMl0sIGJ1dCByZWplY3RlZCBpdCBiZWNhdXNlIG9mIHRoZQ0KPj4gZGlz
YWR2YW50YWdlczoNCj4+ICAgIC0geyxfX31kcm1fZm9ybWF0X2luZm8oKSByZXR1cm5zIGEg
cG9pbnRlciB0byBhIGNvbnN0IG9iamVjdCwNCj4+ICAgICAgd2hvc2UgLmZvcm1hdCBmaWVs
ZCB3b24ndCBoYXZlIHRoZSBEUk1fRk9STUFUX0JJR19FTkRJQU4gZmxhZyBzZXQsDQo+PiAg
ICAgIGNvbXBsaWNhdGluZyBjYWxsZXJzLA0KPj4gICAgLSBBbGwgY2FsbGVycyBuZWVkIHRv
IGJlIHVwZGF0ZWQsDQo+PiAgICAtIEl0IGlzIGRpZmZpY3VsdCB0byBrbm93IHdoaWNoIGJp
Zy1lbmRpYW4gZm9ybWF0cyBhcmUgcmVhbGx5DQo+PiAgICAgIHN1cHBvcnRlZCwgZXNwZWNp
YWxseSBhcyBvbmx5IGEgZmV3IGFyZSBuZWVkZWQuDQo+IA0KPiBmd2l3IHRoaXMgbGFzdCBw
b2ludCBpcyB3aHkgSSB0aGluayB0aGlzIGlzIHRoZSByaWdodCBhcHByb2FjaC4gTG9uZyB0
ZXJtDQo+IHdlIG1pZ2h0IHdhbnQgdG8gYWRkIF9CRSB2YXJpYW50cyBvZiB0aGVzZSAjZGVm
aW5lcyBzbyB0aGF0IHRoZXkgY2FuIGJlDQo+IHVzZWQgZXZlcnl3aGVyZSBhbmQgYXJlIGVh
c3kgdG8gZ3JlcC4gQXMgbG9uZyBhcyBpdCdzIGp1c3QgYSBoYW5kZnVsIG9mDQo+IHBsYWNl
cyB0aGVuIHRoZSB2ZXJ5IHZlcmJveSB8IERSTV9GT1JNQVRfQklHX0VORElBTiBpcyBvayB0
b28uDQoNCkRvZXNuJ3QgdGhhdCBjb250cmFkaWN0IHRoZSBjb21tZW50IGF0IFsxXSB0byBz
b21lIGV4dGVuZD8gJ0RSTSBmb3JtYXRzIA0KYXJlIGxpdHRsZSBlbmRpYW4uJyBhbmQgZXh0
cmEgZGVmaW5lcyBhcmUgb25seSBtYWRlIGZvciBzaW1wbGlmeWluZyBkcml2ZXJzLg0KDQpb
MV0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2lu
Y2x1ZGUvZHJtL2RybV9mb3VyY2MuaCNMMzMNCg0KPiANCj4gV2l0aCB0aGlzIGFwcHJvYWNo
IHdlIGNhbiBtYWtlIGl0IF92ZXJ5XyBleHBsaWNpdCB3aGF0IGJpZyBlbmRpYW4gZm9ybWF0
cw0KPiBhcmUgc3VwcG9ydGVkIGJ5IGEgZHJpdmVyIG9yIG90aGVyIHBpZWNlIGluIHRoZSBz
dGFjayAobGlrZSBmYmRldg0KPiBlbXVsYXRpb24pLCBhbmQgSSB0aGluayBleHBsaWNpdCBp
cyB3aGF0IHdlIHdhbnQgd2l0aCBiZSBiZWNhdXNlIGl0J3MNCj4gYmVjb21lIHN1Y2ggYW4g
ZXhjZXB0aW9uLiBPdGhlcndpc2Ugd2UnbGwganVzdCBlbmQgdXAgd2l0aCBtb3JlIHRlcnJp
YmxlDQo+IGNydWZ0IGxpa2UgdGhlIGhvc3QgZW5kaWFuIGhhY2tzIGluIHRoZSBhZGRmYiBj
b21wYXQgY29kZS4NCg0KVG8gZ2l2ZSBhIGRpZmZlcmVudCBwZXJzcGVjdGl2ZSwgd2l0aCBm
b3JtYXQtY29udmVyc2lvbiBoZWxwZXJzIHRoZSANCmRlc3RpbmF0aW9uIGJ1ZmZlciBpcyB1
c3VhbGx5IGEgaGFyZHdhcmUgYnVmZmVyIHRoYXQgY2FuIGhhdmUgYmlnLWVuZGlhbiANCm9y
ZGVyaW5nLiBTbyB3ZSBzb21ldGltZXMgaGF2ZSB0byBzd2FwIGJ5dGVvcmRlciB0byBtYWtl
IG91dHB1dCBjb2xvcnMgDQpsb29rIGNvcnJlY3QuIFRoYXQgaXMgdGhlIGVhc2llc3QgaWYg
YWxsIGZvcm1hdHMgYXJlIGluIExFIGFuZCB0aGUgDQpCSUdfRU5ESUFOIGZsYWcgdGVsbHMg
dXMgd2hlbiB0aGUgc3dhcC4gV2l0aCB0aGUgY3VycmVudCBtdWx0aXR1ZGUgb2YgDQpmb3Jt
YXRzIGFuZCBCX0UgZmxhZ3MgdGhhdCBjYW4gZGVzY3JpYmUgdGhlIHNhbWUgcmVzdWx0LCBp
dCdzIGFsbCBqdXN0IA0KbW9yZSBjb21wbGljYXRlZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiAtRGFuaWVsDQo+Pg0KPj4gWzJdIFtQQVRDSCAxLzNdIGRybS9mb3VyY2M6IEFk
ZCBtaXNzaW5nIGJpZy1lbmRpYW4gWFJHQjE1NTUgYW5kIFJHQjU2NSBmb3JtYXRzDQo+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMDc0NDY3MWFjMDk2YTEyZjBkNTM4OTA2YmQz
MjRlZmE3MWIxMTQwMC4xNjU3MzAwNTMyLmdpdC5nZWVydEBsaW51eC1tNjhrLm9yZw0KPj4N
Cj4+IEdye29ldGplLGVldGluZ31zLA0KPj4NCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydA0KPj4NCj4+IC0tDQo+PiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+Pg0K
Pj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
Lg0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------PrkU5FZRWSZTwU4mrHPfAdT3--

--------------vibJTMMx0PBal3kNQ4ePKayj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN/N0gFAwAAAAAACgkQlh/E3EQov+Dj
5A/9GEOXLySBSpLy1jKBEbR02Ox1QE/RkQsbv0OqITUpgX7YOzmU0VjhkARKZ2U5YaP4es2tnwXN
T7JZW6Qfk1h2QeIZ7lsmqY7ZTDIg1lMcRaKBQz98Vpw9LDhVj9p7mgG7Z+oc1u8kqk9Lr9GCAkOH
SOSXAqpi/+p6E0gORZNA1w0QUmkYPwBXoy2wV32sQ7NOra6xEXJyDTu1ANivs39RKovjDgeu083M
3kWvrfH4e/KA3/B8Nr+VoxIKVhqpB3L8K4mt47+6L5C5xt3akGODtNNEA5CEeXJaQGdtNHgn0gwB
zal1kAiya2WMmcWhwgAvn4haBgJ6A1DIcvvox8EhPF/YQNVlj+nAPYr/lpxXmoZ5Ck6W557XCFSS
MBDlZ40U3KFm2e6FMOSOTfOkTRzgGcJK9SvUK5FJonoIZPCwz+WgP7UovIEMSYDCdtWcI7JgydS3
lmRphQvvEtLY34uup9zR+zMG96k6OiVElFeCkl70NjdkpcPeMRDUTRmJxSvKE4nh7hjjNDLaAYoc
6PhHx694yVoI3sHQZvqtYf+/DdAMTLA5RSyLiKfjdoQnvIdfnKspUeWkLt9V654yu/9kUK6gq08P
XRIJqKbB6aHtcxr5c90KW2eDdzrNxgOf46jvTJEaF08s7kwKr/5ybTTOewxN+hh4R+X+OXL66pO+
ZQg=
=cWgj
-----END PGP SIGNATURE-----

--------------vibJTMMx0PBal3kNQ4ePKayj--
