Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC5C79882A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 15:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0409810E8C6;
	Fri,  8 Sep 2023 13:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F41C10E8B8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 13:56:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A4A9F21A0A;
 Fri,  8 Sep 2023 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694181412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PtKGFF/2qauDBn8BURUlfWx3I7thMLqaYlv/Kkbr8Mk=;
 b=v+vbddS3EFHp8zdgkAEPfGKmdfWhjrxblYsNKDFgXQ1lB42LVDc7hYHBROlbdtGc+9iwGo
 UdowQ3V/wExghJW3jtY2OwGzG7RXSg2et7hsKCyHRjG7EjVhbfIlY7FfXjQqpHEZzSGKTJ
 UUGLCn+ZarJBoHmpBsSHFTH0ZaQ5Dhg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694181412;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PtKGFF/2qauDBn8BURUlfWx3I7thMLqaYlv/Kkbr8Mk=;
 b=/6My9OF7lqC4BRQBaOOZtELeNnPX9Q+aP/BcgkRH0j66MozZumY16CVr5Ba23olNGa6MZN
 5Ubuhj8Gy8QAQNBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65366132F2;
 Fri,  8 Sep 2023 13:56:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u56tFyQo+2SkaAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Sep 2023 13:56:52 +0000
Message-ID: <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
Date: Fri, 8 Sep 2023 15:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230908141638.79b31d1e@eldfell>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VmHyts1ZjcQhtyrNHpFZpbRk"
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VmHyts1ZjcQhtyrNHpFZpbRk
Content-Type: multipart/mixed; boundary="------------ldTVBrTcdpbqkMlmpnV8o2Z3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, contact@emersion.fr, dri-devel@lists.freedesktop.org
Message-ID: <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
In-Reply-To: <20230908141638.79b31d1e@eldfell>

--------------ldTVBrTcdpbqkMlmpnV8o2Z3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDkuMjMgdW0gMTM6MTYgc2NocmllYiBQZWtrYSBQYWFsYW5lbjoNCj4g
T24gRnJpLCA4IFNlcCAyMDIzIDExOjIxOjUxICswMjAwDQo+IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4gDQo+PiBIaQ0KPj4NCj4+IEFtIDI1
LjA4LjIzIHVtIDE2OjA0IHNjaHJpZWIgSm9jZWx5biBGYWxlbXBlOg0KPj4gWy4uLl0NCj4+
PiArICoNCj4+PiArICogICAgIEJ1dCB0aGVyZSBhcmUgdHdvIGV4Y2VwdGlvbnMgb25seSBm
b3IgZHVtYiBidWZmZXJzOg0KPj4+ICsgKiAgICAgKiBUbyBzdXBwb3J0IFhSR0I4ODg4IGlm
IGl0J3Mgbm90IHN1cHBvcnRlZCBieSB0aGUgaGFyZHdhcmUuDQo+Pg0KPj4NCj4+PiArICog
ICAgICogQW55IGRyaXZlciBpcyBmcmVlIHRvIG1vZGlmeSBpdHMgaW50ZXJuYWwgcmVwcmVz
ZW50YXRpb24gb2YgdGhlIGZvcm1hdCwNCj4+PiArICogICAgICAgYXMgbG9uZyBhcyBpdCBk
b2Vzbid0IGFsdGVyIHRoZSB2aXNpYmxlIGNvbnRlbnQgaW4gYW55IHdheSwgYW5kIGRvZXNu
J3QNCj4+PiArICogICAgICAgbW9kaWZ5IHRoZSB1c2VyLXByb3ZpZGVkIGJ1ZmZlci4gQW4g
ZXhhbXBsZSB3b3VsZCBiZSB0byBkcm9wIHRoZQ0KPj4+ICsgKiAgICAgICBwYWRkaW5nIGNv
bXBvbmVudCBmcm9tIGEgZm9ybWF0IHRvIHNhdmUgc29tZSBtZW1vcnkgYmFuZHdpZHRoLg0K
Pj4NCj4+IEkgaGF2ZSBzdHJvbmcgb2JqZWN0aW9ucyB0byB0aGlzIHBvaW50LCBfZXNwZWNp
YWxseV8gYXMgeW91J3JlDQo+PiBhcHBhcmVudGx5IHRyeWluZyB0byBzbmVhayB0aGlzIGlu
IGFmdGVyIG91ciBkaXNjdXNzaW9uLiBOQUsgb24gdGhpcw0KPj4gcGFydCBmcm9tIG15IHNp
ZGUuDQo+Pg0KPj4gSWYgeW91IHdhbnQgdXNlcnNwYWNlIHRvIGJlIGFibGUgdG8gdXNlIGEg
Y2VydGFpbiBmb3JtYXQsIHRoZW4gZXhwb3J0DQo+PiB0aGUgY29ycmVzcG9uZGluZyA0Y2Mg
Y29kZS4gVGhlbiBsZXQgdXNlcnNwYWNlIGRlY2lkZSB3aGF0IHRvIGRvIGFib3V0DQo+PiBp
dC4gSWYgdXNlcnNwYWNlIHBpY2sgYSBjZXJ0YWluIGZvcm1hdCwgZ28gd2l0aCBpdC4NCj4g
DQo+IFdoYXQgaXMgdGhlIHJlYXNvbiBmb3IgeW91ciBvYmplY3Rpb24sIGV4YWN0bHk/DQo+
IA0KPj4gSGVuY2UsIG5vIGltcGxpY2l0IGNvbnZlcnNpb24gZnJvbSBYUkdCODg4IHRvIFJH
Qjg4OCwganVzdCBiZWNhdXNlIGl0J3MNCj4+IHBvc3NpYmxlLg0KPiANCj4gRm9yIHRoZSBw
YXJ0aWN1bGFyIGRyaXZlciBpbiBxdWVzdGlvbiB0aG91Z2gsIHRoZSBjb252ZXJzaW9uIGFs
bG93cw0KPiB1c2luZyBhIGRpc3BsYXkgcmVzb2x1dGlvbiB0aGF0IGlzIG90aGVyd2lzZSBu
b3QgcG9zc2libGUuIEkgYWxzbyBoZWFyDQo+IGl0IGltcHJvdmVzIHBlcmZvcm1hbmNlIHNp
bmNlIDI1JSBsZXNzIGRhdGEgbmVlZHMgdG8gdHJhdmVsIGFjcm9zcyBhDQo+IHNsb3cgYnVz
LiBUaGVyZSBpcyBhbHNvIHNvIGxpdHRsZSBWUkFNLCB0aGFuIGFsbCBkdW1iIGJ1ZmZlcnMg
bmVlZCB0bw0KPiBiZSBhbGxvY2F0ZWQgZnJvbSBzeXNyYW0gaW5zdGVhZCBhbnl3YXksIHNv
IGEgY29weSBpcyBhbHdheXMgbmVjZXNzYXJ5Lg0KPiANCj4gU2luY2UgWFJHQjg4ODggaXMg
dGhlIG9uZSBmb3JtYXQgdGhhdCBpcyByZWNvbW1lbmRlZCB0byBiZSBzdXBwb3J0ZWQgYnkN
Cj4gYWxsIGRyaXZlcnMsIEkgZG9uJ3Qgc2VlIGEgcHJvYmxlbSBoZXJlLiBEaWQgeW91IHRl
c3Qgb24geW91cg0KPiBpbmNyZWRpYmx5IHNsb3cgZzIwMCB0ZXN0IHJpZyBpZiB0aGUgY29u
dmVyc2lvbiBlbmRzIHVwIGh1cnRpbmcgaW5zdGVhZA0KPiBvZiBoZWxwaW5nIHBlcmZvcm1h
bmNlIHRoZXJlPw0KPiANCj4gSWYgaXQgaHVydHMsIHRoZW4gSSBzZWUgdGhhdCB5b3UgaGF2
ZSBhIGdvb2QgcmVhc29uIHRvIE5BSyB0aGlzLg0KPiANCj4gSXQncyBoYXJkIHRvIGltYWdp
bmUgaG93IGl0IHdvdWxkIGh1cnQsIHNpbmNlIHlvdSBhbHdheXMgbmVlZCBhIGNvcHkNCj4g
ZnJvbSBzeXNyYW0gZHVtYiBidWZmZXJzIHRvIFZSQU0gLSBvciBkbyB5b3U/DQoNCkkgaGF2
ZSBhIG51bWJlciBvZiBjb25jZXJucy4gTXkgcG9pbnQgaXQgbm90IHRoYXQgd2Ugc2hvdWxk
bid0IG9wdGltaXplLiANCkkganVzdCBkb24ndCB3YW50IGl0IGluIHRoZSBrZXJuZWwuIE1n
YWcyMDAgY2FuIGV4cG9ydCBEUk1fRk9STUFUX1JHQjg4OCANCmZvciB1c2Vyc3BhY2UgdG8g
dXNlLg0KDQpBRkFJQ1QgdGhlIG1haW4gYXJndW1lbnQgYWdhaW5zdCB1c2Vyc3BhY2UgaXMg
dGhhdCBNZXNhIGRvZXNuJ3QgbGlrZSANCjMtYnl0ZSBwaXhlbHMuIEJ1dCBJIGRvbid0IHNl
ZSBob3cgdGhpcyBjb252ZXJzaW9uIGNhbm5vdCBiZSBhIA0KcG9zdC1wcm9jZXNzaW5nIHN0
ZXAgd2l0aGluIE1lc2E6IGRvIHRoZSByZW5kZXJpbmcgaW4gUkdCMzIgYW5kIHRoZW4gDQpj
b252ZXJ0IHRvIGEgZnJhbWVidWZmZXIgaW4gUkdCMjQuIFVzZXJzcGFjZSBjYW4gZG8gdGhh
dCBtb3JlIA0KZWZmaWNpZW50bHkgdGhhbiB0aGUga2VybmVsLiBUaGlzIGhhcyBhbGwgb2Yg
dGhlIHVwc2lkZXMgb2YgcmVkdWNlZCANCmJhbmR3aWR0aCwgYnV0IG5vbmUgb2YgdGhlIGRv
d25zaWRlcyBvZiBrZXJuZWwgY29kZS4gQXBwbGljYXRpb25zIGFuZC9vciANCk1lc2Egd291
bGQgYmUgaW4gY29udHJvbCBvZiB0aGUgYnVmZmVyIGZvcm1hdCBhbmQgYXBwbHkgdGhlIG9w
dGltaXphdGlvbiANCndoZXJlIGl0IG1ha2VzIHNlbnNlLiBBbmQgaXQgd291bGQgYmUgYXZh
aWxhYmxlIGZvciBhbGwgZHJpdmVycyB0aGF0IGFyZSANCnNpbWlsYXIgdG8gbWdhZzIwMC4N
Cg0KTXkgbWFpbiBwb2ludCBpcyBzaW1wbGljaXR5IG9mIHRoZSBkcml2ZXI6IEkgcHJlZmVy
IHRoZSBkcml2ZXIgdG8gYmUgDQpzaW1wbGUgd2l0aG91dCB1bm5lY2Vzc2FyeSBpbmRpcmVj
dGlvbiBvciBvdmVyaGVhZC4gT3B0aW1pemF0aW9ucyBsaWtlIA0KdGhlc2UgbXkgb3IgbWF5
IG5vdCB3b3JrIG9uIGEgZ2l2ZW4gc3lzdGVtIHdpdGggYSBjZXJ0YWluIHdvcmtsb2FkLiBJ
J2QgDQpiZXR0ZXIgbGVhdmUgdGhpcyBoZXVyaXN0aWMgdG8gdXNlcnNwYWNlLg0KDQpBbm90
aGVyIHBvaW50IG9mIGNvbmNlcm4gaXMgQ1BVIGNvbnN1bXB0aW9uOiBTbG93IEkvTyBidXNl
cyBtYXkgc3RhbGwgDQp0aGUgZGlzcGxheSB0aHJlYWQsIGJ1dCB0aGUgQ1BVIGNvdWxkIGRv
IHNvbWV0aGluZyBlbHNlIGluIHRoZSBtZWFudGltZS4gDQpEb2luZyBmb3JtYXQgY29udmVy
c2lvbiBvbiB0aGUgQ1BVIHByZXZlbnRzIHRoYXQsIGhlbmNlIGFmZmVjdGluZyBvdGhlciAN
CnBhcnRzIG9mIHRoZSBzeXN0ZW0gbmVnYXRpdmVseS4gT2YgY291cnNlLCB0aGF0J3MgbW9y
ZSBvZiBhIGd1dCBmZWVsaW5nIA0KdGhhbiBoYXJkIGRhdGEuDQoNClBsZWFzZSBub3RlIHRo
YXQgdGhlIGtlcm5lbCdzIGNvbnZlcnNpb24gY29kZSB1c2VzIG1lbW9yeSBhbGxvY2F0aW9u
IG9mIA0KaW50ZXJtZWRpYXRlIGJ1ZmZlcnMuIFdlIGV2ZW4gcmVjZW50bHkgaGFkIGEgZGlz
Y3Vzc2lvbiBhYm91dCBhbGxvY2F0aW9uIA0Kb3ZlcmhlYWQgZHVyaW5nIGRpc3BsYXkgdXBk
YXRlcy4gVXNlcnNwYWNlIGNhbiBzdXJlbHkgZG8gYSBiZXR0ZXIgam9iIGF0IA0Ka2VlcGlu
ZyBzdWNoIGJ1ZmZlcnMgYXJvdW5kLg0KDQpBbmQgZmluYWxseSBhIG5vdGUgdGhlIGhhcmR3
YXJlIGl0c2VsZjogb24gbG93LWVuZCBoYXJkd2FyZSBsaWtlIHRob3NlIA0KTWF0cm94IGNo
aXBzLCBqdXN0IHN3aXRjaCB0byBSR0IxNi4gVGhhdCB3aWxsIGJlIHByZXR0eSBhbmQgZmFz
dCBlbm91Z2ggDQpmb3IgdGhlc2UgY2hpcHMnIHNlcnZlciBzeXN0ZW1zLiBBbnlvbmUgd2hv
IGNhcmVzIGFib3V0IGZhc3QgYW5kIA0KYmVhdXRpZnVsIHNob3VsZCBidXkgYSByZWFsIGdy
YXBoaWNzIGNhcmQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IA0KPiBUaGFu
a3MsDQo+IHBxDQo+IA0KPj4+ICsgKiAgICAgT24gbW9zdCBoYXJkd2FyZSwgVlJBTSByZWFk
IGFjY2VzcyBhcmUgc2xvdywgc28gd2hlbiBkb2luZyB0aGUgc29mdHdhcmUNCj4+PiArICog
ICAgIGNvbnZlcnNpb24sIHRoZSBkdW1iIGJ1ZmZlciBzaG91bGQgYmUgYWxsb2NhdGVkIGlu
IHN5c3RlbSBSQU0gaW4gb3JkZXIgdG8NCj4+PiArICogICAgIGhhdmUgZGVjZW50IHBlcmZv
cm1hbmNlLg0KPj4+ICsgKiAgICAgRXh0cmEgY2FyZSBzaG91bGQgYmUgdGFrZW4gd2hlbiBk
b2luZyBzb2Z0d2FyZSBjb252ZXJzaW9uIHdpdGgNCj4+PiArICogICAgIERSTV9DQVBfRFVN
Ql9QUkVGRVJfU0hBRE9XLCB0aGVyZSBhcmUgbW9yZSBkZXRhaWxlZCBleHBsYW5hdGlvbnMg
aGVyZToNCj4+PiArICogICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8y
MDIzMDgxODE2MjQxNS4yMTg1ZjhlM0BlbGRmZWxsLw0KPj4+ICAgICAqLw0KPj4+ICAgIA0K
Pj4+ICAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgZHJtX251bV9wbGFuZXMoc3RydWN0IGRybV9k
ZXZpY2UgKmRldikNCj4+Pg0KPj4+IGJhc2UtY29tbWl0OiA4MmQ3NTBlOWQyZjVkMDU5NGM4
ZjcwNTdjZTU5MTI3ZTcwMWFmNzgxDQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2Vy
bWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJv
dWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------ldTVBrTcdpbqkMlmpnV8o2Z3--

--------------VmHyts1ZjcQhtyrNHpFZpbRk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT7KCMFAwAAAAAACgkQlh/E3EQov+Dv
XxAAz2G7MN7N5O3xCy66hrbZDsSFvmjspw+xZZOU/KVQDf5+x639cw/iW4AW59McdSidg/7ftVYQ
9NwtGy+V9GDleHBhd3UkZTxn0lDcLW5Mn+wdfgBJZ6CtT5pjeCbpQhjb6FpRPzOCKo+Nk1xTQjT/
QW7But/U1lNaZadRSiaqhND7GKkU8c5uQA+Pry4mt8AbUJ9Bh/qaHCwyH9prg9KaBC55X72f04sK
iKZSCVhVSuV1dlFuoFlpJIVJnvovEykXAxGHhalPUzSnpbPY562MWFFDOZQKfhqvJwCIrpQdRKjt
2TDwtorRZRIms7/rKss0OCK5kiZMYA2I0TZMyq0C+Ft0+pSao7lbkc84s8UWivGFRyfLkU5revf5
To3if+PAdvf0fKUhvTqGDHpVQJLL243VyFpB7zQjSQQyDQp9ChcW4lvJHR/kUScajfQmvEgA3DV7
RK9Jn23F5e2V93EZUpcYFg4b0pIGPncrjKmBx/m5DfGVnBXvQTEyA6tFcuR34Dos6vmlvkAXbNTM
7/u4qJdTviRbf+NXu1nUx/Xtvmly49k+ALNUUD9nd7RLodOCT39Wr+b4i4n6A4ng1bkTV2ResIo2
LPzAhS+kcEmDRkelDGfMXphsdoM/5qZQ1hcHnUU4gnUTogLI+oOkIaGc03BosKHPs5BmvBGe1hfj
26o=
=wXgo
-----END PGP SIGNATURE-----

--------------VmHyts1ZjcQhtyrNHpFZpbRk--
