Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DF767CB5D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 13:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F1B10E8E0;
	Thu, 26 Jan 2023 12:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB00910E8E0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 12:54:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A6E91FF40;
 Thu, 26 Jan 2023 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674737660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UHL4xLniND+/uMmTLU+LIqnn/8hrL66zjXI12AKF660=;
 b=FbUPmcwDHfrdVKa1to6Bm5eTEhTwei70b/GnhNQvOZruT5+VK/3BPgiBE5hCR0Mo0V3xtG
 3yCfjmiTCshV13lNFdILBCZot4DuvOkVBWyd8EVDPZ6eL0EXCc9yEWcHpgge7B2m2HxC1r
 ujW6UaQWVlgNIu7PcjHm4iP2JJKIv1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674737660;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UHL4xLniND+/uMmTLU+LIqnn/8hrL66zjXI12AKF660=;
 b=OLSHsaz7n6rAALXpnCppFSclqfPm+JKhH4jZoecs08EZFmGmua6/CbjYIkJeKzqBmWbT6y
 v8FoSUVBcqf+6iCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69850139B3;
 Thu, 26 Jan 2023 12:54:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kvLZGPx30mOyTwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Jan 2023 12:54:20 +0000
Message-ID: <9408e026-feba-618e-d64f-198da41d4fa6@suse.de>
Date: Thu, 26 Jan 2023 13:54:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Amdgpu module is references even after unbinding the vtcon
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Slivka, Danijel" <Danijel.Slivka@amd.com>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
 <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
 <817fcd6b-4823-6fcd-ea5b-8068a261a3bf@suse.de>
 <d0401ae6-b38e-19ff-b681-945db1c36c95@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <d0401ae6-b38e-19ff-b681-945db1c36c95@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mvOkXcVyhdl29HGOAXgbNJKI"
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mvOkXcVyhdl29HGOAXgbNJKI
Content-Type: multipart/mixed; boundary="------------wD9DkAwfDm80lSUqCBLIqsNF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Slivka, Danijel" <Danijel.Slivka@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Message-ID: <9408e026-feba-618e-d64f-198da41d4fa6@suse.de>
Subject: Re: Amdgpu module is references even after unbinding the vtcon
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
 <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
 <817fcd6b-4823-6fcd-ea5b-8068a261a3bf@suse.de>
 <d0401ae6-b38e-19ff-b681-945db1c36c95@amd.com>
In-Reply-To: <d0401ae6-b38e-19ff-b681-945db1c36c95@amd.com>

--------------wD9DkAwfDm80lSUqCBLIqsNF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDEuMjMgdW0gMTM6NDUgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAyNi4wMS4yMyB1bSAxMzo0MCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
SGkNCj4+DQo+PiBBbSAyNi4wMS4yMyB1bSAxMDo0OSBzY2hyaWViIFNsaXZrYSwgRGFuaWpl
bDoNCj4+PiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0NCj4+Pg0KPj4+IEhp
IFRob21hcywNCj4+Pg0KPj4+IEkgaGF2ZSBjaGVja2VkIHdoYXQgeW91IG1lbnRpb25lZC4N
Cj4+PiBXaGVuIGxvYWRpbmcgYW1kZ3B1IHdlIGNhbGzCoCBkcm1fY2xpZW50X2luaXQoKSBk
dXJpbmcgZmJkZXYgc2V0dXAgDQo+Pj4gWzFdLCB0aGUgcmVmY250IGZvciBkcm1fa21zX2hl
bHBlciBpbmNyZWFzZXMgZnJvbSAzIC0+IDQuDQo+Pj4gV2hlbiB3ZSB1bmJpbmQgdnRjb24s
IHJlZmNudCBmb3IgZHJtX2ttc19oZWxwZXIgZHJvcHMgNCAtPiAzLCBidXQgdGhlIA0KPj4+
IGRybV9jbGllbnRfcmVsZWFzZSgpIFsyXSBpcyBub3QgY2FsbGVkLg0KPj4+IFRoZSBkcm1f
Y2xpZW50X3JlbGVhc2UoKSBpcyBjYWxsZWQgb25seSB3aGVuIHVubG9hZGluZyB0aGUgYW1k
Z3B1IA0KPj4+IGRyaXZlci4NCj4+Pg0KPj4+IElzIHRoaXMgZXhwZWN0ZWQ/DQo+Pj4NCj4+
PiBUaGVyZSBpcyBhIGNvbW1lbnQgZm9yIGRybV9jbGllbnRfcmVsZWFzZSB3aXRoIHJlZ2Fy
ZHMgdG8gZmJkZXYgOg0KPj4+ICogVGhpcyBmdW5jdGlvbiBzaG91bGQgb25seSBiZSBjYWxs
ZWQgZnJvbSB0aGUgdW5yZWdpc3RlciBjYWxsYmFjay4gDQo+Pj4gQW4gZXhjZXB0aW9uDQo+
Pj4gwqAgKiBpcyBmYmRldiB3aGljaCBjYW5ub3QgZnJlZSB0aGUgYnVmZmVyIGlmIHVzZXJz
cGFjZSBoYXMgb3BlbiBmaWxlIA0KPj4+IGRlc2NyaXB0b3JzLg0KPj4+DQo+Pj4gQ291bGQg
dGhpcyBiZSByZWxldmFudCBmb3Igb3VyIHVzZSBjYXNlLCBhbHRob3VnaCBhcyANCj4+PiBB
cHBsaWNhdGlvbi9YL0dETSBhcmUgc3RvcHBlZCBhdCB0aGF0IHBvaW50IGFuZCBubyBmZCBz
aG91bGQgYmUgb3Blbi4NCj4+DQo+PiBUaGlzIGxvb2tzIGxpa2UgdGhlIGJ1ZyB0byBtZS4N
Cj4+DQo+PiBJJ20gbm90IHN1cmUgd2h5IHRoZSBjbGllbnQgY29kZSB0YWtlcyB0aGUgbW9k
dWxlIHJlZmVyZW5jZSBpbiB0aGUgDQo+PiBmaXJzdCBwbGFjZS4gRHJpdmVycyBpbnZva2Ug
Y2xpZW50IGludGVyZmFjZSBkaXJlY3RseS4gU2hvdWxkbid0IHRoYXQgDQo+PiBpbXBseSB0
aGF0IHRoZXkgaGF2ZSBhIG1vZHVsZSByZWZlcmVuY2UgYWxyZWFkeT8NCj4gDQo+IEl0J3Mg
bm90IHRoZSBjbGllbnQgY29kZSB3aG8gdGFrZXMgdGhlIG1vZHVsZSByZWZlcmVuY2UsIGl0
J3MgdGhlIA0KPiBETUEtYnVmIGNvZGUuDQo+IA0KPiBBcyBmYXIgYXMgd2UgaGF2ZSBuYXJy
b3dlZCB0aGlzIGRvd24gR0RNL1ggaXMgaW5zcGVjdGluZyB0aGUgZXhpc3RpbmcgDQo+IGNv
bmZpZ3VyaW5nIGR1cmluZyBzdGFydHVwLCB3aGlsZSBkb2luZyBzbyB0aGV5IGV4cG9ydCB0
aGUgQk8gaW5pdGlhbGx5IA0KPiBjcmVhdGVkIGJ5IGZiZGV2IHdpdGggRE1BLWJ1ZiAocHJv
YmFibHkgdG8gZ2l2ZSBpdCB0byBFR0wgb3Igc29tZXRoaW5nIA0KPiBsaWtlIHRoaXMpLiBU
aGlzIERNQS1idWYgZXhwb3J0IGlzIHdoYXQncyBhZGRpbmcgdGhlIG1vZHVsZSByZWZlcmVu
Y2UuDQo+IA0KPiBUaGUgcHJvYmxlbSBpcyBub3cgdGhhdCB3aGVuIEdETS9YIGV4aXRzIHRo
ZSBETUEtYnVmIHNob3VsZCBiZSBkZXN0cm95ZWQgDQo+IGFnYWluLCBidXQgaXQgaXNuJ3Qg
YmVjYXVzZSBvYmotPmhhbmRsZV9jb3VudCBpc24ndCB6ZXJvIGJlY2F1c2UgdGhlIA0KPiBk
cm1fY2xpZW50IGludGVyZmFjZSBrZWVwcyB0aGUgaGFuZGxlIGFyb3VuZCBldmVuIGFmdGVy
IGNyZWF0aW5nIHRoZSBEUk0gDQo+IGZyYW1lYnVmZmVyIG9iamVjdC4NCg0KT0ssIHRoYW5r
cy4gSSBzYXcgeW91ciBwYXRjaCB0byBhZGRyZXNzIHRoZSBwcm9ibGVtLiBMZXQgbWUgZ2l2
ZSBpdCBhIHRlc3QuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFJlZ2FyZHMs
DQo+IENocmlzdGlhbi4NCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+
DQo+Pj4NCj4+PiBUaGFuayB5b3UsDQo+Pj4gQlIsDQo+Pj4gRGFuaWplbA0KPj4+DQo+Pj4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4+IEZyb206IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+PiBTZW50OiBXZWRuZXNkYXksIEphbnVh
cnkgMjUsIDIwMjMgODo0OCBQTQ0KPj4+PiBUbzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+Pj4+IENjOiBEZXVjaGVyLCBBbGV4YW5k
ZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBTbGl2a2EsIERhbmlqZWwNCj4+Pj4g
PERhbmlqZWwuU2xpdmthQGFtZC5jb20+OyBkcmktZGV2ZWwgDQo+Pj4+IDxkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgU2hhcm1hLA0KPj4+PiBTaGFzaGFuayA8U2hhc2hh
bmsuU2hhcm1hQGFtZC5jb20+DQo+Pj4+IFN1YmplY3Q6IFJlOiBBbWRncHUgbW9kdWxlIGlz
IHJlZmVyZW5jZXMgZXZlbiBhZnRlciB1bmJpbmRpbmcgdGhlIHZ0Y29uDQo+Pj4+DQo+Pj4+
IEhpIENocmlzdGlhbg0KPj4+Pg0KPj4+PiBBbSAyNC4wMS4yMyB1bSAxNToxMiBzY2hyaWVi
IENocmlzdGlhbiBLw7ZuaWc6DQo+Pj4+PiBIaSBUaG9tYXMsDQo+Pj4+Pg0KPj4+Pj4gd2Ug
cmFuIGludG8gYSBwcm9ibGVtIHdpdGggdGhlIGdlbmVyYWwgZmJjb24vZmJkZXYgaW1wbGVt
ZW50YXRpb24gYW5kDQo+Pj4+PiB0aG91Z2ggdGhhdCB5b3UgbWlnaHQgaGF2ZSBzb21lIGlk
ZWEuDQo+Pj4+Pg0KPj4+Pj4gV2hhdCBoYXBwZW5zIGlzIHRoZSBmb2xsb3dpbmc6DQo+Pj4+
PiAxLiBXZSBsb2FkIGFtZGdwdSBhbmQgZ2V0IG91ciBub3JtYWwgZmJjb24uDQo+Pj4+PiAy
LiBmYmNvbiBhbGxvY2F0ZXMgYSBkdW1wIEJPIGFzIGJhY2tpbmcgc3RvcmUgZm9yIHRoZSBj
b25zb2xlLg0KPj4+Pj4gMy4gR0RNL1gvQXBwbGljYXRpb25zIHN0YXJ0LCBuZXcgZnJhbWVi
dWZmZXJzIGFyZSBjcmVhdGVkIEJPcw0KPj4+Pj4gaW1wb3J0ZWQsIGV4cG9ydGVkIGV0Yy4u
Lg0KPj4+Pj4gNC4gU29tZWhvdyBYIG9yIEdETSBpdGVyYXRlZCBvdmVyIGFsbCB0aGUgZnJh
bWVidWZmZXIgb2JqZWN0cyB0aGUNCj4+Pj4+IGtlcm5lbHMga25vd3MgYWJvdXQgYW5kIGV4
cG9ydCB0aGVtIGFzIERNQS1idWYuDQo+Pj4+PiA1LiBBcHBsaWNhdGlvbi9YL0dETSBhcmUg
c3RvcHBlZCwgaGFuZGxlcyBjbG9zZWQsIGZyYW1lYnVmZmVycw0KPj4+Pj4gcmVsZWFzZWQg
ZXRjLi4uDQo+Pj4+PiA2LiBXZSB1bmJpbmQgdnRjb24uDQo+Pj4+Pg0KPj4+Pj4gQXQgdGhp
cyBwb2ludCB0aGUgYW1kZ3B1IG1vZHVsZSB1c3VhbGx5IGhhcyBhIHJlZmVyZW5jZSBjb3Vu
dCBvZiAwIGFuZA0KPj4+Pj4gY2FuIGJlIHVubG9hZGVkLCBidXQgc2luY2UgR0RNL1gvV2hv
ZXZlciBpdGVyYXRlZCBvdmVyIGFsbCB0aGUga25vd24NCj4+Pj4+IGZyYW1lYnVmZmVycyBh
bmQgZXhwb3J0ZWQgdGhlbSBhcyBETUEtYnVmIChmb3Igd2hhdGV2ZXIgcmVhc29uIGlkaykg
d2UNCj4+Pj4+IG5vdyBzdGlsbCBoYXZlIGFuIGV4cG9ydGVkIERNQS1idWYgYW5kIHdpdGgg
aXQgYSByZWZlcmVuY2UgdG8gdGhlIA0KPj4+Pj4gbW9kdWxlLg0KPj4+Pj4NCj4+Pj4+IEFu
eSBpZGVhIGhvdyB3ZSBjb3VsZCBwcmV2ZW50IHRoYXQ/DQo+Pj4+DQo+Pj4+IEhlcmUncyBh
bm90aGVyIHN0YWIgaW4gdGhlIGRhcmsuDQo+Pj4+DQo+Pj4+IFRoZSBiaWcgZGlmZmVyZW5j
ZSBiZXR3ZWVuIG9sZC1zdHlsZSBmYmRldiBhbmQgdGhlIG5ldyBvbmUgaXMgdGhhdCANCj4+
Pj4gdGhlIG9sZCBmYmRldg0KPj4+PiBzZXR1cCAoZS5nLiwgcmFkZW9uKSBhbGxvY2F0ZXMg
YSBHRU0gb2JqZWN0IGFuZCBwdXRzIHRvZ2V0aGVyIHRoZSANCj4+Pj4gZmJkZXYgZGF0YQ0K
Pj4+PiBzdHJ1Y3R1cmVzIGZyb20gdGhlIEJPIGluIGEgZmFpcmx5IGhhY2tpc2ggd2F5LiBU
aGUgbmV3IHN0eWxlIHVzZXMgDQo+Pj4+IGFuIGluLWtlcm5lbA0KPj4+PiBjbGllbnQgd2l0
aCBhIGZpbGUgdG8gYWxsb2NhdGUgdGhlIEJPIHZpYSBkdW1iIGJ1ZmZlcnM7IGFuZCBob2xk
cyBhIA0KPj4+PiByZWZlcmVuY2UgdG8gdGhlDQo+Pj4+IERSTSBtb2R1bGUuDQo+Pj4+DQo+
Pj4+IE1heWJlIHRoZSByZWZlcmVuY2UgY29tZXMgZnJvbSB0aGUgaW4ta2VybmVsIERSTSBj
bGllbnQgaXRzZWxmLiBbMV0gDQo+Pj4+IENoZWNrIGlmIHRoZQ0KPj4+PiBjbGllbnQgcmVz
b3VyY2VzIGdldCByZWxlYXNlZCBbMl0gd2hlbiB5b3UgdW5iaW5kIHZ0Y29uLg0KPj4+Pg0K
Pj4+PiBCZXN0IHJlZ2FyZHMNCj4+Pj4gVGhvbWFzDQo+Pj4+DQo+Pj4+IFsxXQ0KPj4+PiBo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY2xpZW50LmMjTDg3DQo+Pj4+IFsyXQ0KPj4+PiBodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y2xpZW50LmMjTDE2DQo+Pj4+IDANCj4+Pj4NCj4+Pj4+DQo+Pj4+PiBUaGFua3MsDQo+Pj4+
PiBDaHJpc3RpYW4uDQo+Pj4+DQo+Pj4+IC0tIA0KPj4+PiBUaG9tYXMgWmltbWVybWFubg0K
Pj4+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+Pj4+IFNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KPj4+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCj4+Pj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4+PiBHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------wD9DkAwfDm80lSUqCBLIqsNF--

--------------mvOkXcVyhdl29HGOAXgbNJKI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPSd/wFAwAAAAAACgkQlh/E3EQov+AV
XhAAwqrhgr2c/Uo2z+l75styy37Nw9CKImkjZcoPeMLnwfBFXxdbfrlHcsg4j3lkxx9whtkFAFPI
tbrcOB/XvDNFHqMT7+gDifrFNojFP5/JzmAtWjuIkOucshaks5GlD1DsPWePNejDRO7HmYMzRBnq
UXKDda368k2Ptt6J60tPfcNhqcJdDmJwXARAWBOKumLhDbZq69r4mQwSknYeLUrJw5Hesls4c+E3
W+KySen0wFtlF5uQw8Vi3pQNSl3BIALR/1WwVxvdGNqx1g5glrWiSGLepYUj/w/WeCZ3twgEJ58K
mZAjXOg6QgYQ4dvg/NnGI2/q5AND0u8ZPrHZ+Z+EpXLb36XUr1RNm4APiasJvBSP70qoAvVDL4jy
TeFh+b3YJjZQfU47JP02fSFe951La+oeOIgbr11opGj6fHRB0VtJqG5JstAAW9lL+3GKWgeoEAT6
ftwzxE4XoXHf9FPkqEfw5D8UpS6IX3L7BLK3GfpfS2PjUyWRmppA7gNOeMLvMfMq8y0ysCR4OQNW
ks5yPFJvR9dSahYhOSGT9UuQv1OtNDQLi1FdKaJFF3pGhACLHdrRGGQttaoSi/dijDPC2NOBmV2Q
HcFwWCj6j4mVLSb33vfK15zrR7P+c/0AsTthttR5fGwziUPqAV2lphguvuPrUc/ZYuM8RnBqP6kV
Ikc=
=lpqX
-----END PGP SIGNATURE-----

--------------mvOkXcVyhdl29HGOAXgbNJKI--
