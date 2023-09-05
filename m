Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4B57923C4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 17:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0B810E555;
	Tue,  5 Sep 2023 15:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52C810E0CA;
 Tue,  5 Sep 2023 15:05:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D89C21BF0;
 Tue,  5 Sep 2023 15:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693926349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yL7vKFCuU9gFwa/unYOwi9wzbVXkvYU3aqRbQyT8Gus=;
 b=b8VHu/2czqgm/jmiZpYjZpPEehbQRFM4Ly2p4esFGo5Ph/eT/5r6G9DSOUEQteux1RI1mr
 nxbugG8wNLEQSzEMQ0M4y5dphRpWwgHcbuvjEQDCBZIm6TdDzIwJ8K7z52fpCaAyf2e7/C
 lqstsNz5Sf+AIfmFPdfhOYRY/V2mD0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693926349;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yL7vKFCuU9gFwa/unYOwi9wzbVXkvYU3aqRbQyT8Gus=;
 b=ea6cxcwO4+lDwSqKY+jZGQjjnaPihIUrZN9TnlJjZZ7Ah4zjOhpAOanjf11qr1H+EQhrZL
 +cIydNcN1hYd1JCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E763613911;
 Tue,  5 Sep 2023 15:05:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mi71NsxD92QlbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 05 Sep 2023 15:05:48 +0000
Message-ID: <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
Date: Tue, 5 Sep 2023 17:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ch6ZUqyGbC16Kocl2SoKs5dE"
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ch6ZUqyGbC16Kocl2SoKs5dE
Content-Type: multipart/mixed; boundary="------------E1SccwAwSE3ywLUeZdRDmZ6V";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: suijingfeng <suijingfeng@loongson.cn>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Message-ID: <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
In-Reply-To: <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>

--------------E1SccwAwSE3ywLUeZdRDmZ6V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDkuMjMgdW0gMTU6MzAgc2NocmllYiBzdWlqaW5nZmVuZzoNCj4gSGks
DQo+IA0KPiANCj4gT24gMjAyMy85LzUgMTg6NDUsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Og0KPj4gSGkNCj4+DQo+PiBBbSAwNC4wOS4yMyB1bSAyMTo1NyBzY2hyaWViIFN1aSBKaW5n
ZmVuZzoNCj4+PiBGcm9tOiBTdWkgSmluZ2ZlbmcgPHN1aWppbmdmZW5nQGxvb25nc29uLmNu
Pg0KPj4+DQo+Pj4gT24gYSBtYWNoaW5lIHdpdGggbXVsdGlwbGUgR1BVcywgYSBMaW51eCB1
c2VyIGhhcyBubyBjb250cm9sIG92ZXIgd2hpY2gNCj4+PiBvbmUgaXMgcHJpbWFyeSBhdCBi
b290IHRpbWUuIFRoaXMgc2VyaWVzIHRyaWVzIHRvIHNvbHZlIGFib3ZlIG1lbnRpb25lZA0K
Pj4NCj4+IElmIGFueXRoaW5nLCB0aGUgcHJpbWFyeSBncmFwaGljcyBhZGFwdGVyIGlzIHRo
ZSBvbmUgaW5pdGlhbGl6ZWQgYnkgDQo+PiB0aGUgZmlybXdhcmUuIEkgdGhpbmsgb3VyIGJv
b3QtdXAgZ3JhcGhpY3MgYWxzbyBtYWtlIHRoaXMgYXNzdW1wdGlvbiANCj4+IGltcGxpY2l0
bHkuDQo+Pg0KPiANCj4gWWVzLCBidXQgYnkgdGhlIHRpbWUgb2YgRFJNIGRyaXZlcnMgZ2V0
IGxvYWRlZCBzdWNjZXNzZnVsbHksdGhlIGJvb3QtdXAgDQo+IGdyYXBoaWNzIGFscmVhZHkg
ZmluaXNoZWQuDQo+IEZpcm13YXJlIGZyYW1lYnVmZmVyIGRldmljZSBhbHJlYWR5IGdldCBr
aWxsZWQgYnkgdGhlIA0KPiBkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9m
cmFtZWJ1ZmZlcnMoKQ0KPiBmdW5jdGlvbiAob3IgaXRzIHNpYmxpbmdzKS4gU28sIHRoaXMg
c2VyaWVzIGlzIGRlZmluaXRlbHkgbm90IHRvIA0KPiBpbnRlcmFjdCB3aXRoIHRoZSBmaXJt
d2FyZSBmcmFtZWJ1ZmZlcg0KDQpZZXMgYW5kIG5vLiBUaGUgaGVscGVycyB5b3UgbWVudGlv
biB3aWxsIGF0dGVtcHQgdG8gcmVtb3ZlIHRoZSBmaXJtd2FyZSANCmZyYW1lYnVmZmVyIG9u
IHRoZSBnaXZlbiBQQ0kgZGV2aWNlLiBJZiB5b3UgaGF2ZSBtdWx0aXBsZSBQQ0kgZGV2aWNl
cywgDQp0aGUgb3RoZXIgZGV2aWNlcyB3b3VsZCBub3QgYmUgYWZmZWN0ZWQuDQoNClRoaXMg
YWxzbyBtZWFucyB0aGF0IHByb2JpbmcgYSBub24tcHJpbWFyeSBjYXJkIHdpbGwgbm90IGFm
ZmVjdCB0aGUgDQpmaXJtd2FyZSBmcmFtZWJ1ZmZlciBvbiB0aGUgcHJpbWFyeSBjYXJkLiBZ
b3UgY2FuIGhhdmUgYWxsIHRoZXNlIGRyaXZlcnMgDQpjby1leGlzdCBuZXh0IHRvIGVhY2gg
b3RoZXIuIElmIHlvdSBsaW5rIGEgZnVsbCBEUk0gZHJpdmVyIGludG8gdGhlIA0Ka2VybmVs
IGltYWdlLCBpdCBtaWdodCBldmVuIGJlIGxvYWRlZCBiZWZvcmUgdGhlIGZpcm13YXJlLWZy
YW1lYnVmZmVyJ3MgDQpkcml2ZXIuICBXZSBoYWQgc29tZSBmdW5ueSBidWdzIGZyb20gdGhl
c2UgaW50ZXJhY3Rpb25zLg0KDQoNCj4gKG9yIG1vcmUgaW50ZWxsaWdlbnQgZnJhbWVidWZm
ZXIgZHJpdmVycykuwqAgSXQgaXMgZm9yIHVzZXIgc3BhY2UgDQo+IHByb2dyYW0sIHN1Y2gg
YXMgWCBzZXJ2ZXIgYW5kIFdheWxhbmQNCj4gY29tcG9zaXRvci4gSXRzIGZvciBMaW51eCB1
c2VyIG9yIGRybSBkcml2ZXJzIHRlc3RlcnMsIHdoaWNoIGFsbG93IHRoZW0gDQo+IHRvIGRp
cmVjdCBncmFwaGljIGRpc3BsYXkgc2VydmVyDQo+IHVzaW5nIHJpZ2h0IGhhcmR3YXJlIG9m
IGludGVyZXN0ZWQgYXMgcHJpbWFyeSB2aWRlbyBjYXJkLg0KPiANCj4gQWxzbywgSSBiZWxp
ZXZlIHRoYXQgWCBzZXJ2ZXIgYW5kIFdheWxhbmQgY29tcG9zaXRvciBhcmUgdGhlIGJlc3Qg
dGVzdCANCj4gZXhhbXBsZXMuDQo+IElmIGEgc3BlY2lmaWMgRFJNIGRyaXZlciBjYW4ndCB3
b3JrIHdpdGggWCBzZXJ2ZXIgYXMgYSBwcmltYXJ5LA0KPiB0aGVuIHRoZXJlIHByb2JhYmx5
IGhhdmUgc29tZXRoaW5nIHdyb25nLg0KDQpJZiB5b3Ugd2FudCB0byBydW4gYSB1c2Vyc3Bh
Y2UgY29tcG9zaXRvciBvciBYMTEgb24gYSBjZXJ0YWluIGRldmljZSwgDQp5b3UgYmVzdCBj
b25maWd1cmUgdGhpcyBpbiB0aGUgcHJvZ3JhbSdzIGNvbmZpZyBmaWxlcy4gQnV0IG5vdCBv
biB0aGUgDQprZXJuZWwgY29tbWFuZCBsaW5lLg0KDQpUaGUgd2hvbGUgY29uY2VwdCBvZiBh
ICdwcmltYXJ5JyBkaXNwbGF5IGlzIGJvZ3VzIElNSE8uIEl0IG9ubHkgZXhpc3RzIA0KYmVj
YXVzZSBvbGQgVkdBIGFuZCBCSU9TIChhbmQgdGhlaXIgZXF1aXZhbGVudHMgb24gbm9uLVBD
IHN5c3RlbXMpIHdlcmUgDQp1bmFibGUgdG8gdXNlIG1vcmUgdGhhbiBvbmUgZ3JhcGhpY3Mg
ZGV2aWNlLiBIZW5jZSwgYXMgeW91IHdyaXRlIGJlbG93LCANCm9ubHkgdGhlIGZpcnN0IGRl
dmljZSBnb3QgUE9TVGVkIGJ5IHRoZSBCSU9TLiBJZiB5b3UgaGFkIGFuIGFkZGl0aW9uYWwg
DQpjYXJkLCB0aGUgZGV2aWNlIGRyaXZlciBuZWVkZWQgdG8gcGVyZm9ybSB0aGUgUE9TVGlu
Zy4NCg0KSG93ZXZlciwgb24gbW9kZXJuIExpbnV4IHN5c3RlbXMgdGhlIHByaW1hcnkgZGlz
cGxheSBkb2VzIG5vdCByZWFsbHkgDQpleGlzdC4gJ1ByaW1hcnknIGlzIHRoZSBkZXZpY2Ug
dGhhdCBpcyBhdmFpbGFibGUgdmlhIFZHQSwgVkVTQSBvciBFRkkuIA0KT3VyIGRyaXZlcnMg
ZG9uJ3QgdXNlIHRoZXNlIGludGVyZmFjZXMsIGJ1dCB0aGUgbmF0aXZlIHJlZ2lzdGVycy4g
QXMgeW91IA0Kc2FpZCB5b3Vyc2VsZiwgdGhlc2UgZmlybXdhcmUgZGV2aWNlcyAoVkdBLCBW
RVNBLCBFRkkpIGFyZSByZW1vdmVkIEFTQVAgDQpieSB0aGUgbmF0aXZlIGRyaXZlcnMuDQoN
Cj4gDQo+IA0KPj4gQnV0IHdoYXQncyB0aGUgdXNlIGNhc2UgZm9yIG92ZXJyaWRpbmcgdGhp
cyBzZXR0aW5nPw0KPj4NCj4gDQo+IE9uIGEgc3BlY2lmaWMgbWFjaGluZSB3aXRoIG11bHRp
cGxlIEdQVXMgbW91bnRlZCwNCj4gb25seSB0aGUgcHJpbWFyeSBncmFwaGljcyBnZXQgUE9T
VC1lZCAoaW5pdGlhbGl6ZWQpIGJ5IHRoZSBmaXJtd2FyZS4NCj4gVGhlcmVmb3JlLCB0aGUg
RFJNIGRyaXZlcnMgZm9yIHRoZSByZXN0IHZpZGVvIGNhcmRzLCBoYXZlIHRvIGNob29zZSB0
bw0KPiB3b3JrIHdpdGhvdXQgdGhlIHByZXJlcXVpc2l0ZSBzZXR1cHMgZG9uZSBieSBmaXJt
d2FyZSwgVGhpcyBpcyBjYWxsZWQgYXMgDQo+IFBPU1QuDQo+IA0KPiBPbmUgb2YgdGhlIHVz
ZSBjYXNlcyBvZiB0aGlzIHNlcmllcyBpcyB0byB0ZXN0IGlmIGEgc3BlY2lmaWMgRFJNIGRy
aXZlciANCj4gY291bGQgd29ya3MgcHJvcGVybHksDQo+IGV2ZW4gdGhvdWdoIHRoZXJlIGlz
IG5vIHByZXJlcXVpc2l0ZSB3b3JrcyBoYXZlIGJlZW4gZG9uZSBieSBmaXJtd2FyZSBhdCAN
Cj4gYWxsLg0KPiBBbmQgaXQgc2VlbXMgdGhhdCB0aGUgcmVzdWx0cyBpcyBub3Qgc2F0aXNm
eWluZyBpbiBhbGwgY2FzZXMuDQo+IA0KPiBkcm0vYXN0IGlzIHRoZSBmaXJzdCBkcm0gZHJp
dmVycyB3aGljaCByZWZ1c2VkIHRvIHdvcmsgaWYgbm90IGJlaW5nIA0KPiBQT1NULWVkIGJ5
IHRoZSBmaXJtd2FyZS4NCg0KWW91IG1pZ2h0IGhhdmUgZm91bmQgYSBidWcgaW4gdGhlIGFz
dCBkcml2ZXIuIEFzdCBoYXMgbWVhbnMgdG8gZGV0ZWN0IGlmIA0KdGhlIGRldmljZSBoYXMg
YmVlbiBQT1NUZWQgYW5kIG1heWJlIGRvIHRoYXQuIElmIHRoaXMgZG9lc24ndCB3b3JrIA0K
Y29ycmVjdGx5LCBpdCBuZWVkcyBhIGZpeC4NCg0KQXMgQ2hyaXN0aWFuIG1lbnRpb25lZCwg
aWYgYW55dGhpbmcsIHlvdSBtaWdodCBhZGQgYW4gb3B0aW9uIHRvIHNwZWNpZnkgDQp0aGUg
ZGVmYXVsdCBjYXJkIHRvIHZnYWFyYiAoZS5nLiwgYXMgUENJIHNsb3QpLiBCdXQgdXNlcnNw
YWNlIHNob3VsZCANCmF2b2lkIHRoZSBpZGVhIG9mIGEgcHJpbWFyeSBjYXJkIElNSE8uDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEJlZm9yZSBhcHBseSB0aGlzIHNlcmll
cywgSSB3YXMgdW5hYmxlIG1ha2UgZHJtL2FzdCBhcyB0aGUgcHJpbWFyeSB2aWRlbyANCj4g
Y2FyZCBlYXNpbHkuIE9uIGENCj4gbXVsdGlwbGUgdmlkZW8gY2FyZCBjb25maWd1cmF0aW9u
LCB0aGUgbW9uaXRvciBjb25uZWN0ZWQgd2l0aCB0aGUgDQo+IEFTVDI0MDAgbm90IGxpZ2h0
IHVwLg0KPiBXaGlsZSBjb25mdXNpbmcsIGEgbmFpdmUgcHJvZ3JhbW1lciBtYXkgc3VzcGVj
dCB0aGUgUFJJTUUgaXMgbm90IHdvcmtpbmcuDQo+IA0KPiBBZnRlciBhcHBsaWVkIHRoaXMg
c2VyaWVzIGFuZCBwYXNzaW5nIGFzdC5tb2Rlc2V0PTEwIG9uIHRoZSBrZXJuZWwgY21kIA0K
PiBsaW5lLA0KPiBJIGZvdW5kIHRoYXQgdGhlIG1vbml0b3IgY29ubmVjdGVkIHdpdGggbXkg
YXN0MjQwMCB2aWRlbyBjYXJkIHN0aWxsIGJsYWNrLA0KPiBJdCBkb2Vzbid0IGRpc3BsYXkg
YW5kIGRvZXNuJ3Qgc2hvdyBpbWFnZSB0byBtZS4NCj4gDQo+IFdoaWxlIGluIHRoZSBwcm9j
ZXNzIG9mIHN0dWR5IGRybS9hc3QsIEkga25vdyB0aGF0IGRybS9hc3QgZHJpdmVyIGhhcyAN
Cj4gdGhlIFBPU1QgY29kZSBzaGlwcGVkLg0KPiBTZWUgdGhlIGFzdF9wb3N0X2dwdSgpIGZ1
bmN0aW9uLMKgdGhlbiwgSSB3YXMgd29uZGVyaW5nIHdoeSB0aGlzIGZ1bmN0aW9uIA0KPiBk
b2Vzbid0IHdvcmtzLg0KPiBBZnRlciBhIHNob3J0LXRpbWUgKGhhc3R5KSBkZWJ1Z2dpbmcs
IEkgZm91bmQgdGhhdCB0aGUgdGhlIA0KPiBhc3RfcG9zdF9ncHUoKSBmdW5jdGlvbg0KPiBk
aWRuJ3QgZ2V0IHJ1bi4gQmVjYXVzZSBpdCBoYXZlIHNvbWV0aGluZyB0byBkbyB3aXRoIHRo
ZSBhc3QtPmNvbmZpZ19tb2RlLg0KPiANCj4gV2l0aG91dCB0aGlua2luZyB0b28gbXVjaCwg
SSBoYXJkY29kZWQgdGhlIGFzdC0+Y29uZmlnX21vZGUgYXMgDQo+IGFzdF91c2VfcDJhIHRv
DQo+IGZvcmNlIHRoZSBhc3RfcG9zdF9ncHUoKSBmdW5jdGlvbiBnZXQgcnVuLg0KPiANCj4g
YGBgDQo+IA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+IEBAIC0xMzIsNiArMTMyLDgg
QEAgc3RhdGljIGludCBhc3RfZGV2aWNlX2NvbmZpZ19pbml0KHN0cnVjdCBhc3RfZGV2aWNl
IA0KPiAqYXN0KQ0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4gIMKg
wqDCoMKgwqDCoMKgIH0NCj4gDQo+ICvCoMKgwqDCoMKgwqAgYXN0LT5jb25maWdfbW9kZSA9
IGFzdF91c2VfcDJhOw0KPiArDQo+ICDCoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKGFzdC0+Y29u
ZmlnX21vZGUpIHsNCj4gIMKgwqDCoMKgwqDCoMKgIGNhc2UgYXN0X3VzZV9kZWZhdWx0czoN
Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1faW5mbyhkZXYsICJVc2lu
ZyBkZWZhdWx0IGNvbmZpZ3VyYXRpb25cbiIpOw0KPiANCj4gYGBgDQo+IA0KPiBUaGVuLCB0
aGUgbW9uaXRvciBsaWdodCB1cCwgaXQgZGlzcGxheSB0aGUgVWJ1bnR1IGdyZWV0ZXIgdG8g
bWUuDQo+IFRoZXJlZm9yZSwgbXkgcGF0Y2ggaXMgaGVscGZ1bCwgYXQgbGVhc2UgZm9yIHRo
ZSBMaW51eCBkcm0gZHJpdmVyIHRlc3RlciANCj4gYW5kIGRldmVsb3Blci4NCj4gSXQgYWxs
b3cgcHJvZ3JhbW1lcnMgdG8gdGVzdCB0aGUgc3BlY2lmaWMgcGFydCBvZiB0aGUgc3BlY2lm
aWMgZHJpdmUNCj4gd2l0aG91dCBjaGFuZ2luZyBhIGxpbmUgb2YgdGhlIHNvdXJjZSBjb2Rl
IGFuZCB3aXRob3V0IHRoZSBuZWVkIG9mIHN1ZG8gDQo+IGF1dGhvcml0eS4NCj4gSXQgaGVs
cHMgdG8gaW1wcm92ZSBlZmZpY2llbmN5IG9mIHRoZSB0ZXN0aW5nIGFuZCBwYXRjaCB2ZXJp
ZmljYXRpb24uDQo+IA0KPiBJIGtub3cgdGhlIFByaW1hcnlHUFUgb3B0aW9uIG9mIFhvcmcg
Y29uZiwgYnV0IHRoaXMgYXBwcm9hY2ggd2lsbCANCj4gcmVtZW1iZXIgdGhlIHNldHVwDQo+
IGhhdmUgYmVlbiBtYWRlLCB5b3UgbmVlZCBtb2RpZnkgaXQgd2l0aCByb290IGF1dGhvcml0
eSBlYWNoIHRpbWUgeW91IA0KPiB3YW50IHRvIHN3aXRjaA0KPiB0aGUgcHJpbWFyeS4gQnV0
IG9uIHJhcGlkIGRldmVsb3BpbmcgYW5kL29yIHRlc3RpbmcgbXVsdGlwbGUgdmlkZW8gDQo+
IGRyaXZlcnMsIHdpdGgNCj4gb25seSBvbmUgY29tcHV0ZXIgaGFyZHdhcmUgcmVzb3VyY2Ug
YXZhaWxhYmxlLiBXaGF0IHdlIHJlYWxseSB3YW50IA0KPiBwcm9iYWJseSBpcyBhDQo+IG9u
ZS1zaG9vdCBjb21tYW5kIGFzIHRoaXMgc2VyaWVzIHByb3ZpZGUuDQo+IA0KPiBTbywgdGhp
cyBpcyB0aGUgZmlyc3QgdXNlIGNhc2UuIFRoaXMgcHJvYmFibHkgYWxzbyBoZWxwIHRvIHRl
c3QgZnVsbCANCj4gbW9kZXNldCwNCj4gUFJJTUUgYW5kIHJldmVyc2UgUFJJTUUgb24gbXVs
dGlwbGUgdmlkZW8gY2FyZCBtYWNoaW5lLg0KPiANCj4gDQo+PiBCZXN0IHJlZ2FyZHMNCj4+
IFRob21hcw0KPj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
RnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8g
VG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4N
CkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------E1SccwAwSE3ywLUeZdRDmZ6V--

--------------Ch6ZUqyGbC16Kocl2SoKs5dE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT3Q8wFAwAAAAAACgkQlh/E3EQov+Cd
thAAobRAcLxSGoUKpiaxky6Nmvf6z7oY5UqD8rLMZJDra6gbNaizDMdbfNUrpzl82RnDOeQ2yCee
BeQ7NKVFLkIT+DxYwuj7sfcP/FJ5faZcuzSMZRSJpMqUABGJvfwfEd/K0JhFEjqmujJb/iYng6XA
aZc0tfaANSuFOXTd+SxqC1fDlXN0NfCX4ITFRvFUP4fWMJMee4no5gymMvCHlvE9ZQFxQqvcCx+t
FzlxIf0ij1pWO+DqZQRxEPowyKVW0mph8/+SlWdIaZzpa/l5iHl3DorO8tHCLNR7lTueiBqzy8/R
+5pCpUZzOHWSMINqKhTFrcD7XKyJXFP2WRZuPiwHGaiQzFvXeCtn3/BoYRFH+lqBOXP6aetH0qS7
Muzxc1dx89eBvJrr3pH2TmIJPgZ2qEmTnYj1kn+pklRpGeZAl7d9L00Jt2wnXSzh6d5HdLlujYY8
hJh+HpbSVUcFMpH0LmZfY0t+HSj8krjb6fjjADOXxrWwL1WLNXdtH5CgPSl2sQxNbELeqoOKgAkL
dOZH/RLZG6TrvD/O4bZJu4p0tw065xC8kdIhRBoVe8RmPecaSyv0yNtsSHEaJDS2XRDDGMH4OgRf
s6ieNptXNstJf7j8dXxiFzrPNSFOWYofAJzfplA19RsZVsUy/q06ALc26ECL7z8EoxoZ38hIqZWc
Vjo=
=uIGG
-----END PGP SIGNATURE-----

--------------Ch6ZUqyGbC16Kocl2SoKs5dE--
