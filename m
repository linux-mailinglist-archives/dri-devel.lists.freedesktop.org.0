Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208E657F9F1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 09:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA9C113668;
	Mon, 25 Jul 2022 07:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862EA113668
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 07:12:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BEDE31FF5F;
 Mon, 25 Jul 2022 07:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658733162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z20IiefoMhfncJfc30biy13BgRU8X5NvmXBMIwh+NhI=;
 b=OeOrw2/WMLbfDy2a/2ZJb+0VHXUsesayqZkLgBFeWqr4rJInD5/LllXg6DimGUCx6EiLFv
 6/6r08rRJQzGs8UocGove5I5YVW5WMR3OiwFAI5ISR8U+pQBHUGlcAJlSjwhv0FNgH+xQe
 ZxkAA3u8glBEU99GxC+vX0mSqWflX+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658733162;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z20IiefoMhfncJfc30biy13BgRU8X5NvmXBMIwh+NhI=;
 b=lWRG2HU4pDeyIFs8nz+cDZepHIK2PCwoHcRmALSbh0vifh4P26kbZd0Pd5fkzM/kw/6UH4
 pnZpFP6dbC+Ub8Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E2B613A8D;
 Mon, 25 Jul 2022 07:12:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id w1WjJWpC3mJgTgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Jul 2022 07:12:42 +0000
Message-ID: <e66bc2ab-6495-044f-7e37-892de076095a@suse.de>
Date: Mon, 25 Jul 2022 09:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: Prevent modeset helpers to access an uninitialized
 drm_mode_config
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220724123741.1268536-1-javierm@redhat.com>
 <e6ed25b0-49d2-7e3b-91e5-72e431310610@suse.de>
 <38128880-5b47-7ba0-54f3-97c4d6e04028@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <38128880-5b47-7ba0-54f3-97c4d6e04028@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SyT9fXSDOaDauSbz8LF7TnjB"
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
Cc: David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SyT9fXSDOaDauSbz8LF7TnjB
Content-Type: multipart/mixed; boundary="------------vJo4p3O7qaGDsLGGGB1v9o0b";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org
Message-ID: <e66bc2ab-6495-044f-7e37-892de076095a@suse.de>
Subject: Re: [PATCH] drm: Prevent modeset helpers to access an uninitialized
 drm_mode_config
References: <20220724123741.1268536-1-javierm@redhat.com>
 <e6ed25b0-49d2-7e3b-91e5-72e431310610@suse.de>
 <38128880-5b47-7ba0-54f3-97c4d6e04028@redhat.com>
In-Reply-To: <38128880-5b47-7ba0-54f3-97c4d6e04028@redhat.com>

--------------vJo4p3O7qaGDsLGGGB1v9o0b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDI0LjA3LjIyIHVtIDIwOjQxIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIg
ZmVlZGJhY2suDQo+IA0KPiBPbiA3LzI0LzIyIDIwOjI0LCBUaG9tYXMgWmltbWVybWFubiB3
cm90ZToNCj4+IEhpIEphdmllcg0KPj4NCj4+IEFtIDI0LjA3LjIyIHVtIDE0OjM3IHNjaHJp
ZWIgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzOg0KPj4+IERSTSBkcml2ZXJzIGluaXRpYWxp
emUgdGhlIG1vZGUgY29uZmlndXJhdGlvbiB3aXRoIGRybW1fbW9kZV9jb25maWdfaW5pdCgp
DQo+Pj4gYW5kIHRoYXQgZnVuY3Rpb24gKGFtb25nIG90aGVyIHRoaW5ncykgaW5pdGlhbGl6
ZXMgbXV0ZXhlcyB0aGF0IGFyZSBsYXRlcg0KPj4+IHVzZWQgYnkgbW9kZXNldCBoZWxwZXJz
Lg0KPj4+DQo+Pj4gQnV0IHRoZSBoZWxwZXJzIHNob3VsZCBvbmx5IGF0dGVtcHQgdG8gZ3Jh
YiB0aG9zZSBsb2NrcyBpZiB0aGUgbW9kZSBjb25maWcNCj4+PiB3YXMgcHJvcGVybHkgaW5p
dGlhbGl6ZWQuIE90aGVyd2lzZSBpdCBjYW4gbGVhZCB0byBrZXJuZWwgb29wcy4gQW4gZXhh
bXBsZQ0KPj4+IGlzIHdoZW4gYSBEUk0gZHJpdmVyIHVzaW5nIHRoZSBjb21wb25lbnQgZnJh
bWV3b3JrIGRvZXMgbm90IGluaXRpYWxpemUgdGhlDQo+Pj4gZHJtX21vZGVfY29uZmlnLCBi
ZWNhdXNlIGl0cyAuYmluZCBjYWxsYmFjayB3YXMgbm90IGJlaW5nIGV4ZWN1dGVkIGR1ZSBv
bmUNCj4+PiBvZiBpdHMgZXhwZWN0ZWQgc3ViLWRldmljZXMnIGRyaXZlciBmYWlsaW5nIHRv
IHByb2JlLg0KPj4+DQo+Pj4gU29tZSBkcml2ZXJzIGNoZWNrIHRoZSBzdHJ1Y3QgZHJtX2Ry
aXZlci5yZWdpc3RlcmVkIGZpZWxkIGFzIGFuIGluZGljYXRpb24NCj4+PiBvbiB3aGV0aGVy
IHRoZWlyIC5zaHV0ZG93biBjYWxsYmFjayBzaG91bGQgY2FsbCBoZWxwZXJzIHRvIHRlYXJu
IGRvd24gdGhlDQo+Pj4gbW9kZSBjb25maWd1cmF0aW9uIG9yIG5vdCwgYnV0IG1vc3QgZHJp
dmVycyBqdXN0IGFzc3VtZSB0aGF0IGl0IGlzIGFsd2F5cw0KPj4+IHNhZmUgdG8gY2FsbCBo
ZWxwZXJzIHN1Y2ggYXMgZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oKSBkdXJpbmcgc2h1
dGRvd24uDQo+Pj4NCj4+PiBMZXQgbWFrZSB0aGUgRFJNIGNvcmUgbW9yZSByb2J1c3QgYW5k
IHByZXZlbnQgdGhpcyB0byBoYXBwZW4sIGJ5IG1hcmtpbmcgYQ0KPj4+IHN0cnVjdCBkcm1f
bW9kZV9jb25maWcgYXMgaW5pdGlhbGl6ZWQgZHVyaW5nIGRybW1fbW9kZV9jb25maWdfaW5p
dCgpLiB0aGF0DQo+Pj4gd2F5IGhlbHBlcnMgY2FuIGNoZWNrIGZvciBpdCBhbmQgbm90IGF0
dGVtcHQgdG8gZ3JhYiB1bmluaXRpYWxpemVkIG11dGV4ZXMuDQo+Pg0KPj4gSSBkaXNhZ3Jl
ZS4gVGhpcyBwYXRjaCBsb29rcyBsaWtlIGNhcmdvLWN1bHQgcHJvZ3JhbW1pbmcgYW5kIGVu
dGlyZWx5DQo+PiBhcmJpdHJhcnkuICBUaGUgc29sdXRpb24gaGVyZSBpcyB0byBmaXggZHJp
dmVycy4gIFRoZSBhY3R1YWwgdGVzdCB0bw0KPj4gcGVyZm9ybSBpcyB0byBpbnN0cnVtZW50
IHRoZSBtdXRleCBpbXBsZW1lbnRhdGlvbiB0byBkZXRlY3QNCj4+IHVuaW5pdGlhbGl6ZWQg
bXV0ZXhlcy4NCj4+DQo+IA0KPiBXaGlsZSBJIGRvIGFncmVlIHRoYXQgZHJpdmVycyBzaG91
bGQgYmUgZml4ZWQsIElNTyB3ZSBzaG91bGQgdHJ5IHRvIG1ha2UgaXQNCj4gaGFyZCBmb3Ig
dGhlIGtlcm5lbCB0byBjcmFzaC4gV2UgYWxyZWFkeSBoYXZlIGNoZWNrcyBpbiBvdGhlciBE
Uk0gaGVscGVycyB0bw0KPiBhdm9pZCBhY2Nlc3NpbmcgdW5pbml0aWFsaXplZCBkYXRhLCBz
byBJIGRvbid0IHNlZSB3aHkgd2UgY291bGRuJ3QgZG8gdGhlDQo+IHNhbWUgaGVyZS4NCg0K
Q29kZSBzaG91bGQgc3RhbmQgb24gaXRzIG93biBtZXJpdHMsIGluc3RlYWQgb2YgZG9pbmcg
c29tZXRoaW5nIGJlY2F1c2UgDQpzb21ldGhpbmcgZWxzZSBkb2VzIGl0LiBUaGUgbGF0dGVy
IGlzIHdoYXQgaXMgcmVmZXJyZWQgdG8gYXMgY2FyZ28tY3VsdCANCnByb2dyYW1taW5nLg0K
DQpEb2luZyBzYW5pdHkgY2hlY2tzIG9uIHZhbHVlcyBpcyBub3QgYSBwcm9ibGVtLCBidXQg
cHV0dGluZyBmbGFnIA0KdmFyaWFibGVzIHRocm91Z2hvdXQgdGhlIGNvZGUgdG8gcXVlc3Rp
b24gb3RoZXIgY29kZSdzIHN0YXRlIGlzLiBUaGF0J3MgDQpub3QgJ1RoZSBXYXkgb2YgdGhl
IEMuJyBUaGVyZSdzIGFsc28gdGhlIHByb2JsZW0gdGhhdCBhIGdvb2QgcGFydCBvZiANCnN0
cnVjdCBkcm1fbW9kZV9jb25maWcncyBpbml0aWFsaXphdGlvbiBpcyBvcGVuLWNvZGVkIGlu
IGRyaXZlcnMuIFNvIHRoZSANCm1lYW5pbmcgb2YgaXNfaW5pdGlhbGl6ZWQgaXMgc29tZXdo
YXQgZnV6enkuDQoNCj4gDQo+IEkgd3JvdGUgdGhpcyBwYXRjaCBhZnRlciBmaXhpbmcgYSBi
dWcgaW4gdGhlIGRybS9tc20gZHJpdmVyIFswXS4gQnkgbG9va2luZw0KPiBhdCBob3cgb3Ro
ZXIgZHJpdmVycyBoYW5kbGVkIHRoaXMgY2FzZSwgSSdtIHByZXR0eSBzdXJlIHRoYXQgdGhl
eSBoYXZlIHRoZQ0KPiBzYW1lIHByb2JsZW0uIEEgd2FybmluZyBpcyBtdWNoIGJldHRlciB0
aGFuIGEga2VybmVsIGNyYXNoIGR1cmluZyBzaHV0ZG93bi4NCj4gDQo+IFswXTogaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2RyaS1kZXZlbC9wYXRjaC8yMDIyMDcy
NDExMTMyNy4xMTk1NjkzLTEtamF2aWVybUByZWRoYXQuY29tLw0KDQpJIHNlZS4gSSB3YXNu
J3QgYXdhcmUgdGhhdCBtaXNzaW5nIG1vZGVfY29uZmlnX2luaXQoKSBpcyBhIHByb2JsZW0u
IEZyb20gDQp0aGUgbGlua2VkIFVSTCwgSSBjYW5ub3QgcmVhbGx5IHVuZGVyc3RhbmQgaG93
IGl0J3MgcmVsYXRlZC4gbXNtIGFwcGVhcnMgDQp0byBiZSBjYWxsaW5nIGRybV9tb2RlX2Nv
bmZpZ19pbml0KCksIHJpZ2h0PyBUaGUgaWRpb21hdGljIHNvbHV0aW9uIA0Kd291bGQgYmUg
dG8gY29udmVydCBtc20gdG8gbWFuYWdlZCBjb2RlLiBCdXQgdGhhdCdzIGFuIGVudGlyZWx5
IA0KZGlmZmVyZW50IHBhdGNoc2V0LCBvZiBjb3Vyc2UuIChJIG9ubHkgdG9vayBhIGJyaWVm
IGxvb2sgYXQgdGhlIGxpbmsgVEJILikNCg0KSGVyZSdzIGEgc3VnZ2VzdGlvbiBvbiBob3cg
dG8gY29uc3RydWN0IHRoZSBtb2RlLWNvbmZpZyBjb2RlIGluIG9yZGVyIHRvIA0KbWFrZSBp
dCBoYXJkIHRvIG1pc3VzZTogIERyaXZlciBjdXJyZW50bHkgb3Blbi1jb2RlIHRoZSBpbml0
aWFsaXphdGlvbiANCm9mIG1hbnkgZmllbGRzIGluIGRybV9tb2RlX2NvbmZpZy4gRXhwYW5k
IHRoZSBhcmd1bWVudHMgb2YgDQpkcm1fbW9kZV9jb25maWdfaW5pdCgpIHRvIHRha2UgdGhl
IHBvaW50ZXIgdG8gdGhlIGRybV9tb2RlX2NvbmZpZ19mdW5jcy4gDQpUaGVzZSBmdW5jdGlv
bnMgYXJlIGVzc2VudGlhbCB0byBkbyBhbnl0aGluZywgc28gaXQncyBhIGdvb2QgY2FuZGlk
YXRlIA0KZm9yIGFuIGFyZ3VtZW50LiBEcml2ZXJzIGFyZSBlYXNpbHkgY29udmVydGVkIHRo
ZSB0aGUgbmV3IGludGVyZmFjZSANCkFGQUlDVC4gIEFmdGVyIHRoZSBjb252ZXJzaW9uLCBh
ZGQgYSB0ZXN0IHRvIGRybV9tb2RlX2NvbmZpZ19yZXNldCgpIA0KdGhhdCB0ZXN0cyBmb3Ig
dGhlIGZ1bmNzIHRvIGJlIHNldC4gIGRybV9tb2RlX2NvbmZpZ19yZXNldCgpIGlzIGFsc28g
DQplc3NlbnRpYWwgZHVyaW5nIGluaXRpYWxpemF0aW9uIG9yIHRoZSBkcml2ZXIgd2lsbCBm
YWlsIGltbWVkaWF0ZWx5IG9uIA0KdGhlIGZpcnN0IG1vZGVzZXQgb3BlcmF0aW9uLiBUaGF0
IGdpdmVzIGEgdGVzdCBmb3IgYW4gaW5pdGlhbGl6ZWQgDQptb2RlX2NvbmZpZyB3aXRob3V0
IGFkZGluZyBleHRyYSBmaWVsZHMuDQoNCkFzIGEgYml0IG9mIGEgc2lkZW5vdGU6IHdlIHNo
b3VsZCBjb25zaWRlciBtYWtpbmcgDQpkcm1fbW9kZV9jb25maWdfcmVzZXQoKSBhbmQgdGhl
IHJlc2V0IGNhbGxiYWNrcyByZXR1cm4gZXJyb3JzLiBUaGUgcmVzZXQgDQpmdW5jdGlvbnMg
YWxsb2NhdGUgbWVtb3J5IGZvciBzdGF0ZXMgYW5kIGlmIHRoaXMgZmFpbHMsIHdlIGhhdmUg
bm8gd2F5IA0Kb2YgcmVwb3J0aW5nIHRoZSBmYWlsdXJlLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQoNCg0KPiAgIA0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+IA0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------vJo4p3O7qaGDsLGGGB1v9o0b--

--------------SyT9fXSDOaDauSbz8LF7TnjB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLeQmkFAwAAAAAACgkQlh/E3EQov+A+
3BAAvWB0jLFBjXmEGu8TTNvkJjCUFoxYe9+2VXOXaI6h+n+3i5eAXtA7J1ErZyIU7Y+EYB8EWEv3
++5XnhQHNvYDARIPtLYBYrb2lB3OT725DovXSB9Wg56QI+efuNKSUOLuN1rFdx5UaWZyukgIC9bq
Osb0WPUgHKhDG5+x8JCdgi6xJbxkV9uvIWXxryqcoBDyxBSXdd7aIFEXFvAxTT57dJGp6TmfsLfX
KDHL6tmYYLDVhBTWgnIK9PmZz1jy9Oax7VvztTSJqnKpAgnvXyV609uFo5U00a6ERUboWA/JcBBj
JCq2Zg/gW2NC7xSfw9+UA4wwUHRAPOgukdsVYhVIIu0WCxi1klIrDy2+HrrKuWIetsKw7K1xjUSe
OBpyHJRnS4orMVtfaV96akwa2BUyl6JRaOhYDvuqgTxS0Ts+GDGpN4bj4aFkc/VxXJOOjQfWXlM1
uughw8PoP1BTLEd/hlWENXewtuW4lVco+yq7kzn58mewhgAAOE2/ibMIx+TfLENb2Kq4cCJj66AA
BVRt/xmUHX5VAni9rRfZgMt7+LcQx8jxCCnR8DNwyZqeFEUim2MdRMpafA3wDvbADGa1eB4ppM9J
MdYAavWJhcDV8KqJplOgkN5o4jqQWmGC5UZuBtoH0VjExOOGf6z+fQKUQnmWpPtpRKkdujyhg0f3
7oE=
=K78D
-----END PGP SIGNATURE-----

--------------SyT9fXSDOaDauSbz8LF7TnjB--
