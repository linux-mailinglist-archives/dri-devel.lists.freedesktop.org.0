Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FF1793AAB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934B410E60B;
	Wed,  6 Sep 2023 11:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2336A10E606;
 Wed,  6 Sep 2023 11:06:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BEEA8223AC;
 Wed,  6 Sep 2023 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693998392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9tYKkRQ9mPp6JNMw9LkTGp73JgcPUpkfF0VZrAfyckI=;
 b=MA6vpHdPcmP9bI6r6uGQ/xlVRozGBl+QQx15Cq3ihl0LYxlUBhRM1MKrScD+XUkC2w2OaC
 0MHEFqB6NtIc6SSsVjwnbM50n+NyDkwComqmDv/wZ1ZMkO0H30tpQeddv7BtbC/R+DC0Kt
 BcCjcaUWQXWBmr26g9SjNNIqZvvSGcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693998392;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9tYKkRQ9mPp6JNMw9LkTGp73JgcPUpkfF0VZrAfyckI=;
 b=FL5+Tp79kMy0zwKPuAy/zqRQtBhkeK15P/61akQ4/6t1UDoBY6AG9u0r0Zxtboql6SdnZD
 74q6TEYweJcrICAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81D941333E;
 Wed,  6 Sep 2023 11:06:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pr26Hjhd+GTERgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Sep 2023 11:06:32 +0000
Message-ID: <ffd99904-93b3-a8eb-246b-8fcaec35c9a7@suse.de>
Date: Wed, 6 Sep 2023 13:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <151c0429-dbc2-e987-1491-6c733ca159ac@suse.de>
 <3eced3f5-622f-31a6-f8a0-ff0812be74ff@loongson.cn>
 <6035cf27-1506-dda7-e1ca-d83ce5cb5340@suse.de>
 <3f41eea5-d441-304d-f441-eaf7ce63d3e1@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3f41eea5-d441-304d-f441-eaf7ce63d3e1@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3uQE1wu839OvEWNM6u0Y9lq3"
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3uQE1wu839OvEWNM6u0Y9lq3
Content-Type: multipart/mixed; boundary="------------Q4ssCx5a7cK0dGvcBqvei0df";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Message-ID: <ffd99904-93b3-a8eb-246b-8fcaec35c9a7@suse.de>
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <151c0429-dbc2-e987-1491-6c733ca159ac@suse.de>
 <3eced3f5-622f-31a6-f8a0-ff0812be74ff@loongson.cn>
 <6035cf27-1506-dda7-e1ca-d83ce5cb5340@suse.de>
 <3f41eea5-d441-304d-f441-eaf7ce63d3e1@loongson.cn>
In-Reply-To: <3f41eea5-d441-304d-f441-eaf7ce63d3e1@loongson.cn>

--------------Q4ssCx5a7cK0dGvcBqvei0df
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDkuMjMgdW0gMTE6NDggc2NocmllYiBzdWlqaW5nZmVuZzoNClsuLi5d
DQo+IA0KPj4gVGhlcmUncyAnbm9tb2Rlc2V0Jywgd2hpY2ggZGlzYWJsZXMgYWxsIG5hdGl2
ZSBkcml2ZXJzLiBJdCdzIHVzZWZ1bCANCj4+IGZvciBkZWJ1Z2dpbmcgb3IgYXMgYSBxdWlj
ay1maXggaWYgdGhlIGdyYXBoaWNzIGRyaXZlciBicmVha3MuIElmIHlvdSANCj4+IHdhbnQg
dG8gZGlzYWJsZSBhIHNwZWNpZmljIGRyaXZlciwgcGxlYXNlIHVzZSBvbmUgb2YgdGhlIG9w
dGlvbnMgZm9yIA0KPj4gYmxhY2tsaXN0aW5nLg0KPj4NCj4gWWVhaCwgdGhlICdub21vZGVz
ZXQnIGRpc2FibGVzIGFsbCBuYXRpdmUgZHJpdmVycywNCj4gdGhpcyBpcyBhIGdvb2QgcG9p
bnQgb2YgaXQsIGJ1dCB0aGlzIGlzIGFsc28gdGhlIHdlYWsgcG9pbnQgb2YgaXQuDQoNCldl
bGwsIHRoYXQncyBieSBkZXNpZ24uIEdyYXBoaWNzIGlzIGF0IHRoZSBjb3JlIG9mIHRoZSB1
c2VyIGV4cGVyaWVuY2UuIA0KV2Ugb2Z0ZW4gY2Fubm90IF9ub3RfIHByb3ZpZGUgaXQuIEFu
ZCBpZiBpdCdzIGJyb2tlbiwgdGhlcmUgbmVlZHMgdG8gYmUgDQphIHJlbGlhYmxlIGZhbGxi
YWNrLiBUaGVyZSBuZWVkcyB0byBiZSBhdCBsZWFzdCBlbm91Z2ggZ3JhcGhpY3Mgc3VwcG9y
dCANCnRvIHJ1biBhIHRlcm1pbmFsIGFuZCByZXBhaXIgdGhlIHN5c3RlbS4gQW5kIGl0IGFs
c28gbmVlZHMgdG8gYmUgc2ltcGxlIA0KZW5vdWdoIGZvciB0aGUgYXZlcmFnZSB1c2VyLiBG
YWxsaW5nIGJhY2sgdG8gc2VyaWFsIHRlcm1pbmFscyBpZiBvZnRlbiANCm5vdCBhbiBvcHRp
b24uDQoNCkF0IGxlYXN0IGhlcmUgYXQgU1VTRSwgd2hlbiB1c2VycyBvciBjdXN0b21lcnMg
cmVwb3J0IGEgYnJva2VuIGdyYXBoaWNzIA0KZHJpdmVyLCB3ZSBjYW4gdGVsbCB0aGVtIHRv
IHN0YXJ0IHdpdGggJ25vbW9kZXNldCcgYW5kIGdldCBhdCBsZWFzdCB0aGUgDQpiYXNpYyBn
cmFwaGljcy4gVGhhdCdzIGdvb2QgZW5vdWdoIGZvciBtb3N0IHByb2R1Y3Rpdml0eS9vZmZp
Y2UgDQpzb2Z0d2FyZS4gSW4gdGhlIG1lYW50aW1lLCB3ZSBpbnZlc3RpZ2F0ZSB0aGUgcHJv
YmxlbS4NCg0KVGhlcmUgd2VyZSBjb25jZXJucyBhYm91dCB0aGUgbmVlZCBvZiBub21vZGVz
ZXQsIGJ1dCBJIHRoaW5rIGl0IGhhcyANCnByb3ZlbiB0byBiZSB1c2VmdWwgaW4gcHJhY3Rp
Y2UuDQoNCj4gU29tZXRpbWVzLCB3aGVuIHlvdSBhcmUgZGV2ZWxvcGluZyBhIGRybSBkcml2
ZXIgZm9yIGEgbmV3IGRldmljZS4NCj4gWW91IHdpbGwgc2VlIHRoZSBwYWluLiBJdHMgdG9v
IG9mdGVuIGEgcHJvZ3JhbW1lcidzIG1vZGlmaWNhdGlvbg0KPiBtYWtlIHRoZSBlbnRpcmUg
TGludXgga2VybmVsIGhhbmcgdGhlcmUuIFRoZSBwcm9ibGVtYXRpYyBkcm0NCj4gZHJpdmVy
IGtlcm5lbCBtb2R1bGUgYWxyZWFkeSBpbiB0aGUgaW5pdHJkLiBUaGVuLCB0aGUgcmVhbA0K
PiBuZWVkIHRvIGRpc2FibGUgdGhlIGlsbC1mdW5jdGlvbmFsIGRybSBkcml2ZXIga2VybmVs
IG1vZHVsZQ0KPiBvbmx5LiBXaGlsZSB3aGF0IHlvdSByZWNvbW1lbmQgdG8gZGlzYWJsZSB0
aGVtIGFsbC4gVGhlcmUNCj4gYXJlIHN1YnRsZSBkaWZmZXJlbmNlLg0KDQpJIGZvdW5kIHRo
YXQgaW5pdGNhbGxfYmxhY2tsaXN0PTxmdW5jIG5hbWU+IHdvcmtzIHJlbGlhYmxlIGZvciBt
ZS4NCg0KPiANCj4gQW5vdGhlciBsaW1pdGF0aW9uIG9mIHRoZSAnbm9tb2Rlc2V0JyBwYXJh
bWV0ZXIgaXMgdGhhdA0KPiBpdCBpcyBvbmx5IGF2YWlsYWJsZSBvbiByZWNlbnQgdXBzdHJl
YW0ga2VybmVsLiBMb3cgdmVyc2lvbg0KPiBkb3duc3RyZWFtIGtlcm5lbCBkb24ndCBoYXMg
dGhpcyBwYXJhbWV0ZXIgc3VwcG9ydGVkIHlldC4NCj4gU28gdGhpcyBjcmVhdGUgaW5jb25z
dGFudCBkZXZlbG9waW5nIGV4cGVyaWVuY2UuIEkgYmVsaWV2ZSB0aGF0DQo+IHRoZXJlIGFs
d2F5cyBzb21lIHBlb3BsZSBuZWVkIGRvIGJhY2stcG9ydCBhbmQgdXBzdHJlYW0gd29yaw0K
PiBmb3IgdmFyaW91cyByZWFzb25zLg0KDQpOb21vZGVzZXQgdXNlZCB0byBiZSB0aGVyZSwg
YnV0IGluIGEgZGlmZmVyZW50IGZvcm0uIEl0IGZvcmNlZCBWR0EgdGV4dCANCm1vZGUgSUlS
Qy4gJ2dpdCBncmVwJyBmb3IgdmdhX3RleHRfZm9yY2UoKSBpbiBhbiBvbGQga2VybmVsLiBX
ZSBhZG9wdGVkIA0KdGhlIHBhcmFtZXRlciBmb3IgYWxsIG9mIGdyYXBoaWNzLCBiZWNhdXNl
IGl0IGFscmVhZHkgZGlkIHdoYXQgd2UgbmVlZGVkLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPiBXaGlsZSAoa2luZGx5LCBubyBvZmZlbnNpdmUpIGRlYmF0aW5nLCBzaW5j
ZSB3ZSBoYXZlIHRoZSBtb2Rwcm9iZS5ibGFja2xpc3QNCj4gd2h5IHdlIHN0aWxsIG5lZWQg
dGhlICdub21vZGVzZXQnIHBhcmFtZXRlciA/DQo+IHdoeSBub3QgdHJ5IA0KPiBtb2Rwcm9i
ZS5ibGFja2xpc3Q9ImFtZGdwdSxyYWRlb24saTkxNSxhc3Qsbm91dmVhdSxnbWE1MDBfZ2Z4
LCAuLi4iDQo+IA0KPiA6LS8NCj4gDQo+IA0KPiBCdXQgT0sgaW4gb3ZlcmFsbCwgSSB3aWxs
IGxpc3RlbiB0byB5b3VyIGFkdmljZS4NCj4gDQo+IA0KPj4gQmVzdCByZWdhcmRzDQo+PiBU
aG9tYXMNCj4+DQo+PiBbMV0gDQo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92Ni41L3NvdXJjZS9pbmNsdWRlL2RybS9kcm1fbW9kdWxlLmgjTDgzDQo+Pg0KPj4NCj4+
PiBmb3IgdGhlIG1vZGVzZXQgcGFyYW1ldGVyLCBhdXRob3JzIG9mIHZhcmlvdXMgZGV2aWNl
IGRyaXZlciB0cnkgdG8gDQo+Pj4gbWFrZSB0aGUgdXNhZ2Ugbm90DQo+Pj4gY29uZmxpY3Qg
d2l0aCBvdGhlcnMuIEkgYmVsaWV2ZSB0aGF0IHRoaXMgaXMgZ29vZCB0aGluZyBmb3IgTGlu
dXggdXNlcnMuDQo+Pj4gSXQgaXMgcHJvYmFibHkgdGhlIHJlc3BvbnNpYmlsaXR5IG9mIHRo
ZSBkcm0gY29yZSBtYWludGFpbmVycyB0byANCj4+PiBmb3JjZSB2YXJpb3VzIGRybQ0KPj4+
IGRyaXZlcnMgdG8gcmVhY2ggYSBtaW5pbWFsIGNvbnNlbnN1cy4gUHJvYmFibHkgaXQgcGFp
bnMgdG8gZG8gc28gYW5kIA0KPj4+IGRvZXNuJ3QgcGF5IG9mZi4NCj4+PiBCdXQgcmVhY2gg
YSBtaW5pbWFsIGNvbnNlbnN1cyBkbyBiZW5lZml0IHRvIExpbnV4IHVzZXJzLg0KPj4+DQo+
Pj4NCj4+Pj4gWW91IGNhbiB1c2UgbW9kcHJvYmUuYmxhY2tsaXN0IG9yIGluaXRjYWxsX2Js
YWNrbGlzdCBvbiB0aGUga2VybmVsIA0KPj4+PiBjb21tYW5kIGxpbmUuDQo+Pj4+DQo+Pj4g
VGhlcmUgYXJlIHNvbWUgY2FzZXMgd2hlcmUgdGhlIG1vZHByb2JlLmJsYWNrbGlzdCBkb2Vz
bid0IHdvcmtzLA0KPj4+IEkgaGF2ZSBjb21lIGNyb3NzIHNldmVyYWwgdGltZSBkdXJpbmcg
dGhlIHBhc3QuDQo+Pj4gQmVjYXVzZSB0aGUgZGV2aWNlIHNlbGVjdGVkIGJ5IHRoZSBWR0FB
UkIgaXMgZGV2aWNlLWxldmVsIHRoaW5nLA0KPj4+IGl0IGlzIG5vdCB0aGUgZHJpdmVyJ3Mg
cHJvYmxlbS4NCj4+Pg0KPj4+IFNvbWV0aW1lcyB3aGVuIFZHQUFSQiBoYXMgYSBidWcsIGl0
IHdpbGwgc2VsZWN0IGEgd3JvbmcgZGV2aWNlIGFzIA0KPj4+IHByaW1hcnkuDQo+Pj4gQW5k
IHRoZSBYIHNlcnZlciB3aWxsIHVzZSB0aGlzIHdyb25nIGRldmljZSBhcyBwcmltYXJ5IGFu
ZCBjb21wbGV0ZWx5IA0KPj4+IGNyYXNoDQo+Pj4gdGhlcmUsIGR1ZSB0byBsYWNrIGEgZHJp
dmVyLiBUYWtlIG15IG9sZCBTMyBHcmFwaGljcyBhcyBhbiBleGFtcGxlOg0KPj4+DQo+Pj4g
JCBsc3BjaSB8IGdyZXAgVkdBDQo+Pj4NCj4+PiDCoMKgMDA6MDYuMSBWR0EgY29tcGF0aWJs
ZSBjb250cm9sbGVyOiBMb29uZ3NvbiBUZWNobm9sb2d5IExMQyBEQyANCj4+PiAoRGlzcGxh
eSBDb250cm9sbGVyKSAocmV2IDAxKQ0KPj4+IMKgwqAwMzowMC4wIFZHQSBjb21wYXRpYmxl
IGNvbnRyb2xsZXI6IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gDQo+Pj4gW0FNRC9B
VEldIENhaWNvcyBYVCBbUmFkZW9uIEhEIDc0NzAvODQ3MCAvIFI1IDIzNS8zMTAgT0VNXQ0K
Pj4+IMKgwqAwNzowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IFMzIEdyYXBoaWNz
IEx0ZC4gRGV2aWNlIDkwNzAgDQo+Pj4gKHJldiAwMSkNCj4+PiDCoMKgMDg6MDAuMCBWR0Eg
Y29tcGF0aWJsZSBjb250cm9sbGVyOiBTMyBHcmFwaGljcyBMdGQuIERldmljZSA5MDcwIA0K
Pj4+IChyZXYgMDEpDQo+Pj4NCj4+PiBCZWZvcmUgYXBwbHkgdGhpcyBwYXRjaDoNCj4+Pg0K
Pj4+IFvCoMKgwqAgMC4zNjE3NDhdIHBjaSAwMDAwOjAwOjA2LjE6IHZnYWFyYjogc2V0dGlu
ZyBhcyBib290IFZHQSBkZXZpY2UNCj4+PiBbwqDCoMKgIDAuMzYxNzUzXSBwY2kgMDAwMDow
MDowNi4xOiB2Z2FhcmI6IFZHQSBkZXZpY2UgYWRkZWQ6IA0KPj4+IGRlY29kZXM9aW8rbWVt
LG93bnM9aW8rbWVtLGxvY2tzPW5vbmUNCj4+PiBbwqDCoMKgIDAuMzYxNzY1XSBwY2kgMDAw
MDowMzowMC4wOiB2Z2FhcmI6IFZHQSBkZXZpY2UgYWRkZWQ6IA0KPj4+IGRlY29kZXM9aW8r
bWVtLG93bnM9bm9uZSxsb2Nrcz1ub25lDQo+Pj4gW8KgwqDCoCAwLjM2MTc3M10gcGNpIDAw
MDA6MDc6MDAuMDogdmdhYXJiOiBWR0EgZGV2aWNlIGFkZGVkOiANCj4+PiBkZWNvZGVzPWlv
K21lbSxvd25zPW5vbmUsbG9ja3M9bm9uZQ0KPj4+IFvCoMKgwqAgMC4zNjE3NzldIHBjaSAw
MDAwOjA4OjAwLjA6IHZnYWFyYjogVkdBIGRldmljZSBhZGRlZDogDQo+Pj4gZGVjb2Rlcz1p
byttZW0sb3ducz1ub25lLGxvY2tzPW5vbmUNCj4+PiBbwqDCoMKgIDAuMzYxNzgxXSB2Z2Fh
cmI6IGxvYWRlZA0KPj4+IFvCoMKgwqAgMC4zNjc4MzhdIHBjaSAwMDAwOjAwOjA2LjE6IE92
ZXJyaWRpbmcgYm9vdCBkZXZpY2UgYXMgMTAwMjo2Nzc4DQo+Pj4gW8KgwqDCoCAwLjM2Nzg0
MV0gcGNpIDAwMDA6MDA6MDYuMTogT3ZlcnJpZGluZyBib290IGRldmljZSBhcyA1MzMzOjkw
NzANCj4+PiBbwqDCoMKgIDAuMzY3ODQzXSBwY2kgMDAwMDowMDowNi4xOiBPdmVycmlkaW5n
IGJvb3QgZGV2aWNlIGFzIDUzMzM6OTA3MA0KPj4+DQo+Pj4NCj4+PiBGb3Iga25vd24gcmVh
c29uLCBvbmUgb2YgbXkgc3lzdGVtIHNlbGVjdCB0aGUgUzMgR3JhcGhpY3MgYXMgcHJpbWFy
eSANCj4+PiBHUFUuDQo+Pj4gQnV0IHRoaXMgUzMgR3JhcGhpY3Mgbm90IGV2ZW4gaGF2ZSBh
IGRlY2VudCBkcm0gdXBzdHJlYW0gZHJpdmVyIHlldC4NCj4+PiBVbmRlciBzdWNoIGEgY2Fz
ZSwgSSBiZWdpbiB0byBiZWxpZXZlIHRoYXQgb25seSB0aGUgZGV2aWNlIHdobyBoYXMgYQ0K
Pj4+IGRyaXZlciBkZXNlcnZlIHRoZSBwcmltYXJ5Lg0KPj4+DQo+Pj4gVW5kZXIgc3VjaCBh
IGNvbmRpdGlvbiwgSSB3YW50IHRvIHJlYm9vdCBhbmQgZW50ZXIgdGhlIGdyYXBoaWMgDQo+
Pj4gZW52aXJvbm1lbnQNCj4+PiB3aXRoIG90aGVyIHdvcmtpbmcgdmlkZW8gY2FyZHMuIEVp
dGhlciBwbGF0Zm9ybSBpbnRlZ3JhdGVkIGFuZCANCj4+PiBkaXNjcmV0ZSBHUFUuDQo+Pj4g
VGhpcyBkb24ndCBtZWFucyBJIHNob3VsZCBjb21wcm9taXNlIGJ5wqB1bi1tb3VudCB0aGUg
UzMgZ3JhcGhpY3MgY2FyZCANCj4+PiBmcm9tDQo+Pj4gdGhlIG1vdGhlcmJvYXJkLCB0aGlz
IGFsc28gZG9uJ3QgbWVhbnMgdGhhdCBJIHNob3VsZCB1cGRhdGUgbXkgQklPUyANCj4+PiBz
ZXR0aW5nLg0KPj4+IEFzIHNvbWV0aW1lcywgdGhlIEJJT1MgaXMgbW9yZSB3b3JzZS4NCj4+
Pg0KPj4+IFdpdGggdGhpcyBzZXJpZXMgYXBwbGllZCwgYWxsIEkgbmVlZCB0byBkbyBpcyB0
byByZWJvb3QgdGhlIGNvbXB1dGVyIGFuZA0KPj4+IHBhc3MgYSBjb21tYW5kIGxpbmUuIEJ5
IGZvcmNlIG92ZXJyaWRlIGFub3RoZXIgdmlkZW8gY2FyZCAod2hvIGhhcyBhDQo+Pj4gZGVj
ZW50IGRyaXZlciBzdXBwb3J0KSBhcyBwcmltYXJ5LCBJJ20gYWJsZSB0byBkbyB0aGUgZGVi
dWdnaW5nIHVuZGVyDQo+Pj4gZ3JhcGhpYyBlbnZpcm9ubWVudC4gSSB3b3VsZCBsaWtlIHRv
IGV4YW1pbmUgd2hhdCdzIHdyb25nIHdpdGggdGhlIA0KPj4+IHZnYWFyYg0KPj4+IG9uIGEg
c3BlY2lmaWMgcGxhdGZvcm0gdW5kZXIgWCBzZXJ2ZXIgZ3JhcGhpYyBlbnZpcm9ubWVudC4N
Cj4+Pg0KPj4+IFByb2JhYmx5IHRyeSBjb21waWxlIGEgZHJpdmVyIGZvciB0aGlzIGNhcmQg
YW5kIHNlZSBpdCB3b3Jrcywgc2ltcGx5IA0KPj4+IHJlYm9vdA0KPj4+IHdpdGhvdXQgdGhl
IG5lZWQgdG8gY2hhbmdlIGFueXRoaW5nLiBJdCBpcyBzbyBlZmZpY2llbnQuIFNvIHRoaXMg
aXMgDQo+Pj4gcHJvYmFibHkNCj4+PiB0aGUgc2Vjb25kIHVzYWdlIG9mIG15IHBhdGNoLiBJ
dCBoYW5kIHRoZSByaWdodCBvZiBjb250cm9sIGJhY2sgdG8gdGhlDQo+Pj4gZ3JhcGhpYyBk
ZXZlbG9wZXIuDQo+Pj4NCj4+Pg0KPj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1h
bnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3Vk
aWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------Q4ssCx5a7cK0dGvcBqvei0df--

--------------3uQE1wu839OvEWNM6u0Y9lq3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT4XTcFAwAAAAAACgkQlh/E3EQov+Bq
/xAAoByVUaz/Vl2+Su6f3jy9FpGnelX2tpDcDN+MSXZJDuVtz3J+1I6n+pxNB/Y8voLAYletQXuU
e9uEFCpjvMUya1NfRcQEmAGE77TWR85uW6r0FulmiIhs0p9hfTnJhkY+3dLMaIIKY8qnQbbBnaf5
otrZ3ytcBqouzac5cFm20gQf1b5sIQXgsqQI0w8xAut2PbMiA9T/qGBnu7q1EPb8kirQ57gRGvgs
HICO5l2rHYiUF/M/Y/f/tp2LwtcDViN61L7eJ8f3Ty5MQUKmUM3MFDTfPzWkDBWZzAcawCJonxag
cEpKQaswStTM/JRaF0ZfSl3hcm9lQBrFIURMZmnAq876yHK/zbxF+xipBV19gE0t4hMlD1kpL26h
nmHELdEfOpmqyC80rwYKr/HhZymLzvo773x0H4BdR49xpoyyBzrYsYxwmxnBSWdDdYWUpsOTC+1b
EUavDcPHlRAJCSN5RykU3YaeJVaMoF/5X4Hz1NE80e3u9p9lMU1XEonOAjyZGV+Jr+p/Aq9/Gq77
q/rGN1cfmCoxhpvpFzx5rruoCmxDJCUqzfMsnT+1TKtEhnMUFyCJaN1CL6VB1pOtz7WLUx7YGIYN
7HSv+7Aethahz91iVz28GIjoLpSe4FomoaYo9bnp5iNcmkeT9TURkj+gXfYiTuzXxOdOW2esdqU8
rso=
=sVWY
-----END PGP SIGNATURE-----

--------------3uQE1wu839OvEWNM6u0Y9lq3--
