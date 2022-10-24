Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F1A60A378
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 13:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E8F10E3E2;
	Mon, 24 Oct 2022 11:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113EC10E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:55:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C272022151;
 Mon, 24 Oct 2022 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666612557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0/B42P//vbH9o9jU3OTgEgJkODpPdMjmF6G/UQJEZA=;
 b=ajejL/6+gmxHWM3hJainDmqqnfgn/iKC4Uw93ajFEQ0W3T6FE4dK7CyvtO1ll48ki1fBiQ
 pZdhLRHCZ6YVfORKtnSZV6xYPedxCRVn0sG752UG2+Fr2PtKAVEG1P1t3GQmq7AnlbE+CC
 bSmdORPJpip0AHuO2D7yXO7HchSVdTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666612557;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0/B42P//vbH9o9jU3OTgEgJkODpPdMjmF6G/UQJEZA=;
 b=Zfq/1jrlLI8aZ4KFle640M4AAlheP6PWWmzuAjDQDMrW6idvda1Ol4wylOsTZQGDNgFFZN
 3OL4T4+XEkit9LAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F4B313A79;
 Mon, 24 Oct 2022 11:55:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ei9aFk19VmPaRgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Oct 2022 11:55:57 +0000
Message-ID: <af4c71cb-be60-e354-ca4f-23e834aca6e1@suse.de>
Date: Mon, 24 Oct 2022 13:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH 0/3] new subsystem for compute accelerator devices
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20221022214622.18042-1-ogabbay@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221022214622.18042-1-ogabbay@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------76aPfJh2VVAwv6Ip0RET7ACr"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jiho Chu <jiho.chu@samsung.com>,
 Christoph Hellwig <hch@infradead.org>, Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------76aPfJh2VVAwv6Ip0RET7ACr
Content-Type: multipart/mixed; boundary="------------09mWeBzGlwIlNwaqtclMmriZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>, Jiho Chu
 <jiho.chu@samsung.com>, Daniel Stone <daniel@fooishbar.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Christoph Hellwig
 <hch@infradead.org>, Kevin Hilman <khilman@baylibre.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Message-ID: <af4c71cb-be60-e354-ca4f-23e834aca6e1@suse.de>
Subject: Re: [RFC PATCH 0/3] new subsystem for compute accelerator devices
References: <20221022214622.18042-1-ogabbay@kernel.org>
In-Reply-To: <20221022214622.18042-1-ogabbay@kernel.org>

--------------09mWeBzGlwIlNwaqtclMmriZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMTAuMjIgdW0gMjM6NDYgc2NocmllYiBPZGVkIEdhYmJheToNCj4gSW4g
dGhlIGxhc3QgY291cGxlIG9mIG1vbnRocyB3ZSBoYWQgYSBkaXNjdXNzaW9uIFsxXSBhYm91
dCBjcmVhdGluZyBhIG5ldw0KPiBzdWJzeXN0ZW0gZm9yIGNvbXB1dGUgYWNjZWxlcmF0b3Ig
ZGV2aWNlcyBpbiB0aGUga2VybmVsLg0KPiANCj4gQWZ0ZXIgYW4gYW5hbHlzaXMgdGhhdCB3
YXMgZG9uZSBieSBEUk0gbWFpbnRhaW5lcnMgYW5kIG15c2VsZiwgYW5kIGZvbGxvd2luZw0K
PiBhIEJPRiBzZXNzaW9uIGF0IHRoZSBMaW51eCBQbHVtYmVycyBjb25mZXJlbmNlIGEgZmV3
IHdlZWtzIGFnbyBbMl0sIHdlDQo+IGRlY2lkZWQgdG8gY3JlYXRlIGEgbmV3IHN1YnN5c3Rl
bSB0aGF0IHdpbGwgdXNlIHRoZSBEUk0gc3Vic3lzdGVtJ3MgY29kZSBhbmQNCj4gZnVuY3Rp
b25hbGl0eS4gaS5lLiB0aGUgYWNjZWwgY29yZSBjb2RlIHdpbGwgYmUgcGFydCBvZiB0aGUg
RFJNIHN1YnN5c3RlbS4NCj4gDQo+IFRoaXMgd2lsbCBhbGxvdyB1cyB0byBsZXZlcmFnZSB0
aGUgZXh0ZW5zaXZlIERSTSBjb2RlLWJhc2UgYW5kDQo+IGNvbGxhYm9yYXRlIHdpdGggRFJN
IGRldmVsb3BlcnMgdGhhdCBoYXZlIGV4cGVyaWVuY2Ugd2l0aCB0aGlzIHR5cGUgb2YNCj4g
ZGV2aWNlcy4gSW4gYWRkaXRpb24sIG5ldyBmZWF0dXJlcyB0aGF0IHdpbGwgYmUgYWRkZWQg
Zm9yIHRoZSBhY2NlbGVyYXRvcg0KPiBkcml2ZXJzIGNhbiBiZSBvZiB1c2UgdG8gR1BVIGRy
aXZlcnMgYXMgd2VsbCAoZS5nLiBSQVMpLg0KPiANCj4gQXMgYWdyZWVkIGluIHRoZSBCT0Yg
c2Vzc2lvbiwgdGhlIGFjY2VsZXJhdG9yIGRldmljZXMgd2lsbCBiZSBleHBvc2VkIHRvDQo+
IHVzZXItc3BhY2Ugd2l0aCBhIG5ldywgZGVkaWNhdGVkIGRldmljZSBjaGFyIGZpbGVzIGFu
ZCBhIGRlZGljYXRlZCBtYWpvcg0KPiBudW1iZXIgKDI2MSksIHRvIGNsZWFybHkgc2VwYXJh
dGUgdGhlbSBmcm9tIGdyYXBoaWMgY2FyZHMgYW5kIHRoZSBncmFwaGljDQo+IHVzZXItc3Bh
Y2Ugcy93IHN0YWNrLiBGdXJ0aGVybW9yZSwgdGhlIGRyaXZlcnMgd2lsbCBiZSBsb2NhdGVk
IGluIGEgc2VwYXJhdGUNCj4gcGxhY2UgaW4gdGhlIGtlcm5lbCB0cmVlIChkcml2ZXJzL2Fj
Y2VsLykuDQo+IA0KPiBUaGlzIHNlcmllcyBvZiBwYXRjaGVzIGlzIHRoZSBmaXJzdCBzdGVw
IGluIHRoaXMgZGlyZWN0aW9uIGFzIGl0IGFkZHMgdGhlDQo+IG5lY2Vzc2FyeSBpbmZyYXN0
cnVjdHVyZSBmb3IgYWNjZWxlcmF0b3IgZGV2aWNlcyB0byBEUk0uIFRoZSBuZXcgZGV2aWNl
cyB3aWxsDQo+IGJlIGV4cG9zZWQgd2l0aCB0aGUgZm9sbG93aW5nIGNvbnZlbnRpb246DQo+
IA0KPiBkZXZpY2UgY2hhciBmaWxlcyAtIC9kZXYvYWNjZWwvYWNjZWwqDQo+IHN5c2ZzICAg
ICAgICAgICAgIC0gL3N5cy9jbGFzcy9hY2NlbC9hY2NlbCovDQo+IGRlYnVnZnMgICAgICAg
ICAgIC0gL3N5cy9rZXJuZWwvZGVidWcvYWNjZWwvYWNjZWwqLw0KDQpJIGtub3cgSSdtIHJl
YWxseSBsYXRlIHRvIHRoaXMgZGlzY3Vzc2lvbiwgYnV0IHdvdWxkbid0ICdjb21wdXRlJyBi
ZSBhIA0KYmV0dGVyIG5hbWU/DQoNCihJIGFncmVlIHRoYXQgc2t5bmV0IHdvdWxkIGFsc28g
YmUgbmljZSA6KQ0KDQo+IA0KPiBJIHRyaWVkIHRvIHJldXNlIHRoZSBleGlzdGluZyBEUk0g
Y29kZSBhcyBtdWNoIGFzIHBvc3NpYmxlLCB3aGlsZSBrZWVwaW5nIGl0DQo+IHJlYWRhYmxl
IGFuZCBtYWludGFpbmFibGUuDQo+IA0KPiBPbmUgdGhpbmcgdGhhdCBpcyBtaXNzaW5nIGZy
b20gdGhpcyBzZXJpZXMgaXMgZGVmaW5pbmcgYSBuYW1lc3BhY2UgZm9yIHRoZQ0KPiBuZXcg
YWNjZWwgc3Vic3lzdGVtLCB3aGlsZSBJJ2xsIGFkZCBpbiB0aGUgbmV4dCBpdGVyYXRpb24g
b2YgdGhpcyBwYXRjaC1zZXQsDQo+IGFmdGVyIEkgd2lsbCByZWNlaXZlIGZlZWRiYWNrIGZy
b20gdGhlIGNvbW11bml0eS4NCj4gDQo+IEFzIGZvciBkcml2ZXJzLCBvbmNlIHRoaXMgc2Vy
aWVzIHdpbGwgYmUgYWNjZXB0ZWQgKGFmdGVyIGFkZGluZyB0aGUgbmFtZXNwYWNlKSwNCj4g
SSB3aWxsIHN0YXJ0IHdvcmtpbmcgb24gbWlncmF0aW5nIHRoZSBoYWJhbmFsYWJzIGRyaXZl
ciB0byB0aGUgbmV3IGFjY2VsDQo+IHN1YnN5c3RlbS4gSSBoYXZlIHRhbGtlZCBhYm91dCBp
dCB3aXRoIERhdmUgYW5kIHdlIGFncmVlZCB0aGF0IGl0IHdpbGwgYmUNCj4gYSBnb29kIHN0
YXJ0IHRvIHNpbXBseSBtb3ZlIHRoZSBkcml2ZXIgYXMtaXMgd2l0aCBtaW5pbWFsIGNoYW5n
ZXMsIGFuZCB0aGVuDQo+IHN0YXJ0IHdvcmtpbmcgb24gdGhlIGRyaXZlcidzIGluZGl2aWR1
YWwgZmVhdHVyZXMgdGhhdCB3aWxsIGJlIGVpdGhlciBhZGRlZA0KPiB0byB0aGUgYWNjZWwg
Y29yZSBjb2RlICh3aXRoIG9yIHdpdGhvdXQgY2hhbmdlcyksIG9yIHdpbGwgYmUgcmVtb3Zl
ZCBhbmQNCj4gaW5zdGVhZCB0aGUgZHJpdmVyIHdpbGwgdXNlIGV4aXN0aW5nIERSTSBjb2Rl
Lg0KDQpXaGF0J3MgeW91ciBvcGluaW9uIG9uIHRoZSBsb25nLXRlcm0gcHJvc3BlY3Qgb2Yg
RFJNIHZzIGFjY2VsPyBJIGFzc3VtZSANCnRoYXQgb3ZlciB0aW1lLCBEUk0gaGVscGVycyB3
aWxsIG1vdmUgaW50byBhY2NlbCBhbmQgc29tZSBEUk0gZHJpdmVycyANCndpbGwgc3RhcnQg
ZGVwZW5kaW5nIG9uIGFjY2VsPw0KDQpBZnRlciByZWFkaW5nIHRoZSBwcm92aWRlZCBsaW5r
cywgSSB3b25kZXJlZCBpZiB3ZSBzaG91bGRuJ3QgcmVuYW1lIA0KZHJpdmVycy9ncHUgdG8g
ZHJpdmVycy9hY2NlbCBhbmQgcHV0IHRoZSBuZXcgc3Vic3lzdGVtIGludG8gDQpkcml2ZXJz
L2FjY2VsL2NvbXB1dGUuIFdlJ2QgaGF2ZSBEUk0gYW5kIGNvbXB1dGUgZGV2aWNlcyBuZXh0
IHRvIGVhY2ggDQpvdGhlciBhbmQgc2hhcmVkIGhlbHBlcnMgY291bGQgYmUgbG9jYXRlZCBp
biBvdGhlciBzdWJkaXJlY3RvcmllcyB3aXRoaW4gDQphY2NlbC8NCg0KQmVzdCByZWdhcmRz
DQpUaG9tYXMNCg0KPiANCj4gSW4gYWRkaXRpb24sIEkga25vdyBvZiBhdCBsZWFzdCAzIG9y
IDQgZHJpdmVycyB0aGF0IHdlcmUgc3VibWl0dGVkIGZvciByZXZpZXcNCj4gYW5kIGFyZSBn
b29kIGNhbmRpZGF0ZXMgdG8gYmUgaW5jbHVkZWQgaW4gdGhpcyBuZXcgc3Vic3lzdGVtLCBp
bnN0ZWFkIG9mIGJlaW5nDQo+IGEgZHJtIHJlbmRlciBub2RlIGRyaXZlciBvciBhIG1pc2Mg
ZHJpdmVyLg0KPiANCj4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIyLzcvMzEvODMN
Cj4gWzJdIGh0dHBzOi8vYWlybGllZC5ibG9nc3BvdC5jb20vMjAyMi8wOS9hY2NlbGVyYXRv
cnMtYm9mLW91dGNvbWVzLXN1bW1hcnkuaHRtbA0KPiANCj4gVGhhbmtzLA0KPiBPZGVkDQo+
IA0KPiBPZGVkIEdhYmJheSAoMyk6DQo+ICAgIGRyaXZlcnMvYWNjZWw6IGFkZCBuZXcga2Nv
bmZpZyBhbmQgdXBkYXRlIE1BSU5UQUlORVJTDQo+ICAgIGRybTogZGVmaW5lIG5ldyBhY2Nl
bCBtYWpvciBhbmQgcmVnaXN0ZXIgaXQNCj4gICAgZHJtOiBhZGQgZGVkaWNhdGVkIG1pbm9y
IGZvciBhY2NlbGVyYXRvciBkZXZpY2VzDQo+IA0KPiAgIERvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUvZGV2aWNlcy50eHQgfCAgIDUgKw0KPiAgIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDggKw0KPiAgIGRyaXZlcnMvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDIgKw0KPiAgIGRyaXZlcnMvYWNjZWwvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgfCAgMjQgKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYyAgICAg
ICAgICAgICB8IDIxNCArKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZmlsZS5jICAgICAgICAgICAgfCAgNjkgKysrKysrLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5oICAgICAgICB8ICAgNSArLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fc3lzZnMuYyAgICAgICAgICAgfCAgODEgKysrKysrKysrLQ0KPiAg
IGluY2x1ZGUvZHJtL2RybV9kZXZpY2UuaCAgICAgICAgICAgICAgfCAgIDMgKw0KPiAgIGlu
Y2x1ZGUvZHJtL2RybV9kcnYuaCAgICAgICAgICAgICAgICAgfCAgIDggKw0KPiAgIGluY2x1
ZGUvZHJtL2RybV9maWxlLmggICAgICAgICAgICAgICAgfCAgMjEgKystDQo+ICAgaW5jbHVk
ZS9kcm0vZHJtX2lvY3RsLmggICAgICAgICAgICAgICB8ICAgMSArDQo+ICAgMTIgZmlsZXMg
Y2hhbmdlZCwgMzc0IGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygtKQ0KPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2FjY2VsL0tjb25maWcNCj4gDQo+IC0tDQo+IDIuMzQu
MQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------09mWeBzGlwIlNwaqtclMmriZ--

--------------76aPfJh2VVAwv6Ip0RET7ACr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNWfUwFAwAAAAAACgkQlh/E3EQov+Bd
HxAAl/5K+GslyJ0nydGqq9cuuXwXOpe68zzie1S1JIojDbG0HuiYEe6eJW9BlhySLNl+blqtlnrY
1k+Lm2mqzqaL/p7fOmA0JRQ5hcJyCsqpFbg4kIn54F/YeYCZAhK+YQX5639v+uTjPGvBiq4TKzNi
5RAGWjQepEso/nwH7+CA6v0bk5ScF8VQdAYE3H/okVMBStfrQa439wigzTw9dVWQDWonpUqV9Oy/
xCpE7KBbLPmQrC0QaAZd9oS9zWJ/zLh/7IgXATVh8WsJEf6vdeLliUp6GznPvqdrzIfcNQIBtUQd
J6r6GfKjuNSHnKM8uV6BOX25CmBgg5ioQNPwCIw34Rr8XDgY0BTa+eex95hD6USh7QzWC19Xoksr
x6HcD9ulpgi/H9F2FmmPdfoCRseKXKYbTimL6gvJG2u0f+4XKB4ZNPaGg7ct/JJd8a+J/0dbLK2W
nxbjI7UcakK2biULNis+6p3y01YcaDVwQYuXgqM/o9u7jmN7/LK+V/8yW3KIq2ubFFMoBbP23gCh
V1fVbPpV0fuOJ9u9IRHNon9wyCNDKLDOWD4eWEcpB0XqnIPy2QCzZihvk3JQGgHx8kZgk3W0mGPz
C4bZUFDgtoyFmzS20n69SEtPv+lDZ6iUj6MdcV8ikd7wGs3CuazbVoPeydfm9bOMnmynuCLcS2Y3
1iU=
=Fis9
-----END PGP SIGNATURE-----

--------------76aPfJh2VVAwv6Ip0RET7ACr--
