Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36F7921F7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 12:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B3E10E49F;
	Tue,  5 Sep 2023 10:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3241710E49F;
 Tue,  5 Sep 2023 10:49:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E13721F750;
 Tue,  5 Sep 2023 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693910973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/h7vQ0p06iIl+9hlbDcAIadyTSEFhmGic1bBYO4Q3/U=;
 b=d0WQNptghpH8JEQ/z3U12QGuKi8R8J47rBUAWfHos0sw4if/RkcnufoEHpWZF8gbuyv3gt
 5Sd3dg58NZiju2B9c8GZZriXxRRSbPhlQ0mHL55Sfczs/JYCaxWC3QxJovkyhvHv3wEAff
 1N09fmfNW6I8xb7WwJrNmlxDsm6x0bM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693910973;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/h7vQ0p06iIl+9hlbDcAIadyTSEFhmGic1bBYO4Q3/U=;
 b=ayiwjRa2TRnCjH6mDcI3P4P9RIZ+Pvloje05zJyBie1NIp6o0QaHjzXDI9HzSd4UNLt2iY
 ZuCaYWgKa2oIMoCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF31913499;
 Tue,  5 Sep 2023 10:49:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qnzIKb0H92RuXAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 05 Sep 2023 10:49:33 +0000
Message-ID: <151c0429-dbc2-e987-1491-6c733ca159ac@suse.de>
Date: Tue, 5 Sep 2023 12:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230904195724.633404-1-sui.jingfeng@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SZftlnzSQEmkHrhKFKQvdI2G"
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SZftlnzSQEmkHrhKFKQvdI2G
Content-Type: multipart/mixed; boundary="------------a08JUWfqX04s0HL1577KPQKl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Message-ID: <151c0429-dbc2-e987-1491-6c733ca159ac@suse.de>
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
In-Reply-To: <20230904195724.633404-1-sui.jingfeng@linux.dev>

--------------a08JUWfqX04s0HL1577KPQKl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDkuMjMgdW0gMjE6NTcgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEZy
b206IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+IA0KPiBPbiBh
IG1hY2hpbmUgd2l0aCBtdWx0aXBsZSBHUFVzLCBhIExpbnV4IHVzZXIgaGFzIG5vIGNvbnRy
b2wgb3ZlciB3aGljaA0KPiBvbmUgaXMgcHJpbWFyeSBhdCBib290IHRpbWUuIFRoaXMgc2Vy
aWVzIHRyaWVzIHRvIHNvbHZlIGFib3ZlIG1lbnRpb25lZA0KPiBwcm9ibGVtIGJ5IGludHJv
ZHVjZWQgdGhlIC0+YmVfcHJpbWFyeSgpIGZ1bmN0aW9uIHN0dWIuIFRoZSBzcGVjaWZpYw0K
PiBkZXZpY2UgZHJpdmVycyBjYW4gcHJvdmlkZSBhbiBpbXBsZW1lbnRhdGlvbiB0byBob29r
IHVwIHdpdGggdGhpcyBzdHViIGJ5DQo+IGNhbGxpbmcgdGhlIHZnYV9jbGllbnRfcmVnaXN0
ZXIoKSBmdW5jdGlvbi4NCj4gDQo+IE9uY2UgdGhlIGRyaXZlciBib3VuZCB0aGUgZGV2aWNl
IHN1Y2Nlc3NmdWxseSwgVkdBQVJCIHdpbGwgY2FsbCBiYWNrIHRvDQo+IHRoZSBkZXZpY2Ug
ZHJpdmVyLiBUbyBxdWVyeSBpZiB0aGUgZGV2aWNlIGRyaXZlcnMgd2FudCB0byBiZSBwcmlt
YXJ5IG9yDQo+IG5vdC4gRGV2aWNlIGRyaXZlcnMgY2FuIGp1c3QgcGFzcyBOVUxMIGlmIGhh
dmUgbm8gc3VjaCBuZWVkcy4NCj4gDQo+IFBsZWFzZSBub3RlIHRoYXQ6DQo+IA0KPiAxKSBU
aGUgQVJNNjQsIExvb25nYXJjaCwgTWlwcyBzZXJ2ZXJzIGhhdmUgYSBsb3QgUENJZSBzbG90
LCBhbmQgSSB3b3VsZA0KPiAgICAgbGlrZSB0byBtb3VudCBhdCBsZWFzdCB0aHJlZSB2aWRl
byBjYXJkcy4NCj4gDQo+IDIpIFR5cGljYWxseSwgdGhvc2Ugbm9uLTg2IG1hY2hpbmVzIGRv
bid0IGhhdmUgYSBnb29kIFVFRkkgZmlybXdhcmUNCj4gICAgIHN1cHBvcnQsIHdoaWNoIGRv
ZXNuJ3Qgc3VwcG9ydCBzZWxlY3QgcHJpbWFyeSBHUFUgYXMgZmlybXdhcmUgc3RhZ2UuDQo+
ICAgICBFdmVuIG9uIHg4NiwgdGhlcmUgYXJlIG9sZCBVRUZJIGZpcm13YXJlcyB3aGljaCBh
bHJlYWR5IG1hZGUgdW5kZXNpcmVkDQo+ICAgICBkZWNpc2lvbiBmb3IgeW91Lg0KPiANCj4g
MykgVGhpcyBzZXJpZXMgaXMgYXR0ZW1wdCB0byBzb2x2ZSB0aGUgcmVtYWluIHByb2JsZW1z
IGF0IHRoZSBkcml2ZXIgbGV2ZWwsDQo+ICAgICB3aGlsZSBhbm90aGVyIHNlcmllc1sxXSBv
ZiBtZSBpcyB0YXJnZXQgdG8gc29sdmUgdGhlIG1ham9yaXR5IG9mIHRoZQ0KPiAgICAgcHJv
YmxlbXMgYXQgZGV2aWNlIGxldmVsLg0KPiANCj4gVGVzdGVkIChsaW1pdGVkKSBvbiB4ODYg
d2l0aCBmb3VyIHZpZGVvIGNhcmQgbW91bnRlZCwgSW50ZWwgVUhEIEdyYXBoaWNzDQo+IDYz
MCBpcyB0aGUgZGVmYXVsdCBib290IFZHQSwgc3VjY2Vzc2Z1bGx5IG92ZXJyaWRlIGJ5IGFz
dDI0MDAgd2l0aA0KPiBhc3QubW9kZXNldD0xMCBhcHBlbmQgYXQgdGhlIGtlcm5lbCBjbWQg
bGluZS4NCg0KRllJOiBwZXItZHJpdmVyIG1vZGVzZXQgcGFyYW1ldGVycyBhcmUgZGVwcmVj
YXRlZCBhbmQgbm90IHRvIGJlIHVzZWQuIA0KUGxlYXNlIGRvbid0IHByb21vdGUgdGhlbS4g
WW91IGNhbiB1c2UgbW9kcHJvYmUuYmxhY2tsaXN0IG9yIA0KaW5pdGNhbGxfYmxhY2tsaXN0
IG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+IA0KPiAkIGxzcGNpIHwgZ3JlcCBWR0ENCj4gDQo+ICAgMDA6MDIuMCBWR0EgY29tcGF0
aWJsZSBjb250cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiBDb2ZmZWVMYWtlLVMgR1QyIFtV
SEQgR3JhcGhpY3MgNjMwXQ0KPiAgIDAxOjAwLjAgVkdBIGNvbXBhdGlibGUgY29udHJvbGxl
cjogQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLiBbQU1EL0FUSV0gQ2FpY29zIFhUWCBb
UmFkZW9uIEhEIDg0OTAgLyBSNSAyMzVYIE9FTV0NCj4gICAwNDowMC4wIFZHQSBjb21wYXRp
YmxlIGNvbnRyb2xsZXI6IEFTUEVFRCBUZWNobm9sb2d5LCBJbmMuIEFTUEVFRCBHcmFwaGlj
cyBGYW1pbHkgKHJldiAzMCkNCj4gICAwNTowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xs
ZXI6IE5WSURJQSBDb3Jwb3JhdGlvbiBHSzIwOEIgW0dlRm9yY2UgR1QgNzIwXSAocmV2IGEx
KQ0KPiANCj4gJCBzdWRvIGRtZXNnIHwgZ3JlcCB2Z2FhcmINCj4gDQo+ICAgcGNpIDAwMDA6
MDA6MDIuMDogdmdhYXJiOiBzZXR0aW5nIGFzIGJvb3QgVkdBIGRldmljZQ0KPiAgIHBjaSAw
MDAwOjAwOjAyLjA6IHZnYWFyYjogVkdBIGRldmljZSBhZGRlZDogZGVjb2Rlcz1pbyttZW0s
b3ducz1pbyttZW0sbG9ja3M9bm9uZQ0KPiAgIHBjaSAwMDAwOjAxOjAwLjA6IHZnYWFyYjog
VkdBIGRldmljZSBhZGRlZDogZGVjb2Rlcz1pbyttZW0sb3ducz1ub25lLGxvY2tzPW5vbmUN
Cj4gICBwY2kgMDAwMDowNDowMC4wOiB2Z2FhcmI6IFZHQSBkZXZpY2UgYWRkZWQ6IGRlY29k
ZXM9aW8rbWVtLG93bnM9bm9uZSxsb2Nrcz1ub25lDQo+ICAgcGNpIDAwMDA6MDU6MDAuMDog
dmdhYXJiOiBWR0EgZGV2aWNlIGFkZGVkOiBkZWNvZGVzPWlvK21lbSxvd25zPW5vbmUsbG9j
a3M9bm9uZQ0KPiAgIHZnYWFyYjogbG9hZGVkDQo+ICAgYXN0IDAwMDA6MDQ6MDAuMDogdmdh
YXJiOiBPdmVycmlkZSBhcyBwcmltYXJ5IGJ5IGRyaXZlcg0KPiAgIGk5MTUgMDAwMDowMDow
Mi4wOiB2Z2FhcmI6IGNoYW5nZWQgVkdBIGRlY29kZXM6IG9sZGRlY29kZXM9aW8rbWVtLGRl
Y29kZXM9bm9uZTpvd25zPWlvK21lbQ0KPiAgIHJhZGVvbiAwMDAwOjAxOjAwLjA6IHZnYWFy
YjogY2hhbmdlZCBWR0EgZGVjb2Rlczogb2xkZGVjb2Rlcz1pbyttZW0sZGVjb2Rlcz1ub25l
Om93bnM9bm9uZQ0KPiAgIGFzdCAwMDAwOjA0OjAwLjA6IHZnYWFyYjogY2hhbmdlZCBWR0Eg
ZGVjb2Rlczogb2xkZGVjb2Rlcz1pbyttZW0sZGVjb2Rlcz1ub25lOm93bnM9bm9uZQ0KPiAN
Cj4gdjI6DQo+IAkqIEFkZCBhIHNpbXBsZSBpbXBsZW1tZW50IGZvciBkcm0vaTkxNSBhbmQg
ZHJtL2FzdA0KPiAJKiBQaWNrIHVwIGFsbCB0YWdzIChNYXJpbykNCj4gdjM6DQo+IAkqIEZp
eCBhIG1pc3Rha2UgZm9yIGRybS9pOTE1IGltcGxlbWVudA0KPiAJKiBGaXggcGF0Y2ggY2Fu
IG5vdCBiZSBhcHBsaWVkIHByb2JsZW0gYmVjYXVzZSBvZiBtZXJnZSBjb25mbGVjdC4NCj4g
djQ6DQo+IAkqIEZvY3VzIG9uIHNvbHZlIHRoZSByZWFsIHByb2JsZW0uDQo+IA0KPiB2MSx2
MiBhdCBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyMDA1OS8N
Cj4gICAgIHYzIGF0IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
MTIwNTYyLw0KPiANCj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvMTIyODQ1Lw0KPiANCj4gU3VpIEppbmdmZW5nICg5KToNCj4gICAgUENJL1ZHQTog
QWxsb3dpbmcgdGhlIHVzZXIgdG8gc2VsZWN0IHRoZSBwcmltYXJ5IHZpZGVvIGFkYXB0ZXIg
YXQgYm9vdA0KPiAgICAgIHRpbWUNCj4gICAgZHJtL25vdXZlYXU6IEltcGxlbWVudCAuYmVf
cHJpbWFyeSgpIGNhbGxiYWNrDQo+ICAgIGRybS9yYWRlb246IEltcGxlbWVudCAuYmVfcHJp
bWFyeSgpIGNhbGxiYWNrDQo+ICAgIGRybS9hbWRncHU6IEltcGxlbWVudCAuYmVfcHJpbWFy
eSgpIGNhbGxiYWNrDQo+ICAgIGRybS9pOTE1OiBJbXBsZW1lbnQgLmJlX3ByaW1hcnkoKSBj
YWxsYmFjaw0KPiAgICBkcm0vbG9vbmdzb246IEltcGxlbWVudCAuYmVfcHJpbWFyeSgpIGNh
bGxiYWNrDQo+ICAgIGRybS9hc3Q6IFJlZ2lzdGVyIGFzIGEgVkdBIGNsaWVudCBieSBjYWxs
aW5nIHZnYV9jbGllbnRfcmVnaXN0ZXIoKQ0KPiAgICBkcm0vaGlibWM6IFJlZ2lzdGVyIGFz
IGEgVkdBIGNsaWVudCBieSBjYWxsaW5nIHZnYV9jbGllbnRfcmVnaXN0ZXIoKQ0KPiAgICBk
cm0vZ21hNTAwOiBSZWdpc3RlciBhcyBhIFZHQSBjbGllbnQgYnkgY2FsbGluZyB2Z2FfY2xp
ZW50X3JlZ2lzdGVyKCkNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jICAgIHwgMTEgKysrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kcnYuYyAgICAgICB8IDEzICsrKystDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfZHJ2LmMgICAgICAgICAgICAgICAgIHwgMzEgKysrKysrKysrKw0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5jICAgICAgICAgICAgICB8IDU3ICsrKysr
KysrKysrKysrKysrKy0NCj4gICAuLi4vZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNf
ZHJtX2Rydi5jICAgfCAxNSArKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfdmdhLmMgICAgICB8IDE1ICsrKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL2xv
b25nc29uL2xvb25nc29uX21vZHVsZS5jICAgIHwgIDIgKy0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vbG9vbmdzb24vbG9vbmdzb25fbW9kdWxlLmggICAgfCAgMSArDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2xvb25nc29uL2xzZGNfZHJ2LmMgICAgICAgICAgIHwgMTAgKysrLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdmdhLmMgICAgICAgICB8IDExICsrKy0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYyAgICAgICAgfCAx
MCArKystDQo+ICAgZHJpdmVycy9wY2kvdmdhYXJiLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgNDMgKysrKysrKysrKysrLS0NCj4gICBkcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNp
X2NvcmUuYyAgICAgICAgICAgICAgfCAgMiArLQ0KPiAgIGluY2x1ZGUvbGludXgvdmdhYXJi
LmggICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrLQ0KPiAgIDE0IGZpbGVzIGNoYW5n
ZWQsIDIxMCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------a08JUWfqX04s0HL1577KPQKl--

--------------SZftlnzSQEmkHrhKFKQvdI2G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT3B70FAwAAAAAACgkQlh/E3EQov+AX
Lw/9F0C7Gkxj5ijEeIjnoVFjFuSwWlTKeLdkEE58cXv1FKXsjLhJvkmU9CJp3Y/QDQO7JEgBX8F9
ZvuF18ILOyh6+a3GMMN2YhdV123ZhDICHdqlZ0LcszorCLPfmOwkIGVpuqmt0Mhh5x5MF3WkKaF1
RHrog7KcO5r9xluX2BDlrASgsne8cEfGhwUTMxy6TglgIAgo7RV3A92aRAfCNw+QljxYFLFGUmI5
Zo74+ULVn7ozCgUM23csJ8YSgPVEnXEKa+PWAlGbwhOnncqYNlFlsICfkFk1/npP9ErPlGyfX2pK
jwat7ueFnQ1fxwUUtTdx7YZC1KJQCINBuQtwfSTRFt7FQbnZki90hRPk+hCNo0wLx90hc7g29kWC
kBVDdW73zVC2IPTJ1ZnGseLZnVwdX9rD3RVVlbZ5bOt0GoItFsT6L+MQzB2BL3jpuyjgFzU/HRZP
LduQUIqUZkKwIpMXpOQIH1fjvxpr0WaSo3zj96BkIJLO7i6dEytc1zSTVJhJaIX6mKzJtIBhyLIS
LUa5nN9ylr7Qz6Ly/Sc/FhLnsEpn+RESQWZCGJeZmIBmg6IkmuUWErjP9KOyFYb/XFCg5ddHxC9N
yRI+qx6bv9Cp/WnznUYx+HsSNJ/DesvT1IcUyfjREIiaDDzioKRre/pKkfZ3vln/qHqU+8TaxdYI
pJ4=
=Yl0Q
-----END PGP SIGNATURE-----

--------------SZftlnzSQEmkHrhKFKQvdI2G--
