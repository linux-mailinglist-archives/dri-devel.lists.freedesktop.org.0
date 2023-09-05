Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B142E7921F0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 12:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF55110E4A0;
	Tue,  5 Sep 2023 10:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA5810E499;
 Tue,  5 Sep 2023 10:45:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1733921853;
 Tue,  5 Sep 2023 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693910716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hi9B89fg5HTXSyf3WMrSDcgO7uE0bPSzn7lT6dwsbIY=;
 b=oZ9ye6AE6Ox0fEdxccTPJizt6gUL+Jy1HDCbF0yTrI3j+Th/X+/rVY+CMWy8uPdxfHIU/4
 lNtmhTIYVny53NeNiop7FqkvP5wlWR6IGAxsKg4mVYC2YAkOdRj31pWQuplS75KN6kdLq6
 HwW/TUmCt0KR1Kjm9am9/3gratreBbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693910716;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hi9B89fg5HTXSyf3WMrSDcgO7uE0bPSzn7lT6dwsbIY=;
 b=hLW/r+BhmKquhYTGrl++IiYCC3720gATPfan7395kMKxnGkza7uZiQsCVXcrvOY5cQzJJw
 8EuQooxweBz7r7Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9ED513499;
 Tue,  5 Sep 2023 10:45:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id usUvNLsG92Q1WgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 05 Sep 2023 10:45:15 +0000
Message-ID: <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
Date: Tue, 5 Sep 2023 12:45:15 +0200
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
 boundary="------------BTstAG8q8zg5VW0v3P4ZzVup"
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
--------------BTstAG8q8zg5VW0v3P4ZzVup
Content-Type: multipart/mixed; boundary="------------3ZPp6QYt3D76sVOXL0p4Kqe0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Message-ID: <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
In-Reply-To: <20230904195724.633404-1-sui.jingfeng@linux.dev>

--------------3ZPp6QYt3D76sVOXL0p4Kqe0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDkuMjMgdW0gMjE6NTcgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEZy
b206IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+IA0KPiBPbiBh
IG1hY2hpbmUgd2l0aCBtdWx0aXBsZSBHUFVzLCBhIExpbnV4IHVzZXIgaGFzIG5vIGNvbnRy
b2wgb3ZlciB3aGljaA0KPiBvbmUgaXMgcHJpbWFyeSBhdCBib290IHRpbWUuIFRoaXMgc2Vy
aWVzIHRyaWVzIHRvIHNvbHZlIGFib3ZlIG1lbnRpb25lZA0KDQpJZiBhbnl0aGluZywgdGhl
IHByaW1hcnkgZ3JhcGhpY3MgYWRhcHRlciBpcyB0aGUgb25lIGluaXRpYWxpemVkIGJ5IHRo
ZSANCmZpcm13YXJlLiBJIHRoaW5rIG91ciBib290LXVwIGdyYXBoaWNzIGFsc28gbWFrZSB0
aGlzIGFzc3VtcHRpb24gaW1wbGljaXRseS4NCg0KQnV0IHdoYXQncyB0aGUgdXNlIGNhc2Ug
Zm9yIG92ZXJyaWRpbmcgdGhpcyBzZXR0aW5nPw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+IHByb2JsZW0gYnkgaW50cm9kdWNlZCB0aGUgLT5iZV9wcmltYXJ5KCkgZnVuY3Rpb24g
c3R1Yi4gVGhlIHNwZWNpZmljDQo+IGRldmljZSBkcml2ZXJzIGNhbiBwcm92aWRlIGFuIGlt
cGxlbWVudGF0aW9uIHRvIGhvb2sgdXAgd2l0aCB0aGlzIHN0dWIgYnkNCj4gY2FsbGluZyB0
aGUgdmdhX2NsaWVudF9yZWdpc3RlcigpIGZ1bmN0aW9uLg0KPiANCj4gT25jZSB0aGUgZHJp
dmVyIGJvdW5kIHRoZSBkZXZpY2Ugc3VjY2Vzc2Z1bGx5LCBWR0FBUkIgd2lsbCBjYWxsIGJh
Y2sgdG8NCj4gdGhlIGRldmljZSBkcml2ZXIuIFRvIHF1ZXJ5IGlmIHRoZSBkZXZpY2UgZHJp
dmVycyB3YW50IHRvIGJlIHByaW1hcnkgb3INCj4gbm90LiBEZXZpY2UgZHJpdmVycyBjYW4g
anVzdCBwYXNzIE5VTEwgaWYgaGF2ZSBubyBzdWNoIG5lZWRzLg0KPiANCj4gUGxlYXNlIG5v
dGUgdGhhdDoNCj4gDQo+IDEpIFRoZSBBUk02NCwgTG9vbmdhcmNoLCBNaXBzIHNlcnZlcnMg
aGF2ZSBhIGxvdCBQQ0llIHNsb3QsIGFuZCBJIHdvdWxkDQo+ICAgICBsaWtlIHRvIG1vdW50
IGF0IGxlYXN0IHRocmVlIHZpZGVvIGNhcmRzLg0KPiANCj4gMikgVHlwaWNhbGx5LCB0aG9z
ZSBub24tODYgbWFjaGluZXMgZG9uJ3QgaGF2ZSBhIGdvb2QgVUVGSSBmaXJtd2FyZQ0KPiAg
ICAgc3VwcG9ydCwgd2hpY2ggZG9lc24ndCBzdXBwb3J0IHNlbGVjdCBwcmltYXJ5IEdQVSBh
cyBmaXJtd2FyZSBzdGFnZS4NCj4gICAgIEV2ZW4gb24geDg2LCB0aGVyZSBhcmUgb2xkIFVF
RkkgZmlybXdhcmVzIHdoaWNoIGFscmVhZHkgbWFkZSB1bmRlc2lyZWQNCj4gICAgIGRlY2lz
aW9uIGZvciB5b3UuDQo+IA0KPiAzKSBUaGlzIHNlcmllcyBpcyBhdHRlbXB0IHRvIHNvbHZl
IHRoZSByZW1haW4gcHJvYmxlbXMgYXQgdGhlIGRyaXZlciBsZXZlbCwNCj4gICAgIHdoaWxl
IGFub3RoZXIgc2VyaWVzWzFdIG9mIG1lIGlzIHRhcmdldCB0byBzb2x2ZSB0aGUgbWFqb3Jp
dHkgb2YgdGhlDQo+ICAgICBwcm9ibGVtcyBhdCBkZXZpY2UgbGV2ZWwuDQo+IA0KPiBUZXN0
ZWQgKGxpbWl0ZWQpIG9uIHg4NiB3aXRoIGZvdXIgdmlkZW8gY2FyZCBtb3VudGVkLCBJbnRl
bCBVSEQgR3JhcGhpY3MNCj4gNjMwIGlzIHRoZSBkZWZhdWx0IGJvb3QgVkdBLCBzdWNjZXNz
ZnVsbHkgb3ZlcnJpZGUgYnkgYXN0MjQwMCB3aXRoDQo+IGFzdC5tb2Rlc2V0PTEwIGFwcGVu
ZCBhdCB0aGUga2VybmVsIGNtZCBsaW5lLg0KPiANCj4gJCBsc3BjaSB8IGdyZXAgVkdBDQo+
IA0KPiAgIDAwOjAyLjAgVkdBIGNvbXBhdGlibGUgY29udHJvbGxlcjogSW50ZWwgQ29ycG9y
YXRpb24gQ29mZmVlTGFrZS1TIEdUMiBbVUhEIEdyYXBoaWNzIDYzMF0NCj4gICAwMTowMC4w
IFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIElu
Yy4gW0FNRC9BVEldIENhaWNvcyBYVFggW1JhZGVvbiBIRCA4NDkwIC8gUjUgMjM1WCBPRU1d
DQo+ICAgMDQ6MDAuMCBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVyOiBBU1BFRUQgVGVjaG5v
bG9neSwgSW5jLiBBU1BFRUQgR3JhcGhpY3MgRmFtaWx5IChyZXYgMzApDQo+ICAgMDU6MDAu
MCBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVyOiBOVklESUEgQ29ycG9yYXRpb24gR0syMDhC
IFtHZUZvcmNlIEdUIDcyMF0gKHJldiBhMSkNCj4gDQo+ICQgc3VkbyBkbWVzZyB8IGdyZXAg
dmdhYXJiDQo+IA0KPiAgIHBjaSAwMDAwOjAwOjAyLjA6IHZnYWFyYjogc2V0dGluZyBhcyBi
b290IFZHQSBkZXZpY2UNCj4gICBwY2kgMDAwMDowMDowMi4wOiB2Z2FhcmI6IFZHQSBkZXZp
Y2UgYWRkZWQ6IGRlY29kZXM9aW8rbWVtLG93bnM9aW8rbWVtLGxvY2tzPW5vbmUNCj4gICBw
Y2kgMDAwMDowMTowMC4wOiB2Z2FhcmI6IFZHQSBkZXZpY2UgYWRkZWQ6IGRlY29kZXM9aW8r
bWVtLG93bnM9bm9uZSxsb2Nrcz1ub25lDQo+ICAgcGNpIDAwMDA6MDQ6MDAuMDogdmdhYXJi
OiBWR0EgZGV2aWNlIGFkZGVkOiBkZWNvZGVzPWlvK21lbSxvd25zPW5vbmUsbG9ja3M9bm9u
ZQ0KPiAgIHBjaSAwMDAwOjA1OjAwLjA6IHZnYWFyYjogVkdBIGRldmljZSBhZGRlZDogZGVj
b2Rlcz1pbyttZW0sb3ducz1ub25lLGxvY2tzPW5vbmUNCj4gICB2Z2FhcmI6IGxvYWRlZA0K
PiAgIGFzdCAwMDAwOjA0OjAwLjA6IHZnYWFyYjogT3ZlcnJpZGUgYXMgcHJpbWFyeSBieSBk
cml2ZXINCj4gICBpOTE1IDAwMDA6MDA6MDIuMDogdmdhYXJiOiBjaGFuZ2VkIFZHQSBkZWNv
ZGVzOiBvbGRkZWNvZGVzPWlvK21lbSxkZWNvZGVzPW5vbmU6b3ducz1pbyttZW0NCj4gICBy
YWRlb24gMDAwMDowMTowMC4wOiB2Z2FhcmI6IGNoYW5nZWQgVkdBIGRlY29kZXM6IG9sZGRl
Y29kZXM9aW8rbWVtLGRlY29kZXM9bm9uZTpvd25zPW5vbmUNCj4gICBhc3QgMDAwMDowNDow
MC4wOiB2Z2FhcmI6IGNoYW5nZWQgVkdBIGRlY29kZXM6IG9sZGRlY29kZXM9aW8rbWVtLGRl
Y29kZXM9bm9uZTpvd25zPW5vbmUNCj4gDQo+IHYyOg0KPiAJKiBBZGQgYSBzaW1wbGUgaW1w
bGVtbWVudCBmb3IgZHJtL2k5MTUgYW5kIGRybS9hc3QNCj4gCSogUGljayB1cCBhbGwgdGFn
cyAoTWFyaW8pDQo+IHYzOg0KPiAJKiBGaXggYSBtaXN0YWtlIGZvciBkcm0vaTkxNSBpbXBs
ZW1lbnQNCj4gCSogRml4IHBhdGNoIGNhbiBub3QgYmUgYXBwbGllZCBwcm9ibGVtIGJlY2F1
c2Ugb2YgbWVyZ2UgY29uZmxlY3QuDQo+IHY0Og0KPiAJKiBGb2N1cyBvbiBzb2x2ZSB0aGUg
cmVhbCBwcm9ibGVtLg0KPiANCj4gdjEsdjIgYXQgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy8xMjAwNTkvDQo+ICAgICB2MyBhdCBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyMDU2Mi8NCj4gDQo+IFsxXSBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyMjg0NS8NCj4gDQo+IFN1aSBKaW5n
ZmVuZyAoOSk6DQo+ICAgIFBDSS9WR0E6IEFsbG93aW5nIHRoZSB1c2VyIHRvIHNlbGVjdCB0
aGUgcHJpbWFyeSB2aWRlbyBhZGFwdGVyIGF0IGJvb3QNCj4gICAgICB0aW1lDQo+ICAgIGRy
bS9ub3V2ZWF1OiBJbXBsZW1lbnQgLmJlX3ByaW1hcnkoKSBjYWxsYmFjaw0KPiAgICBkcm0v
cmFkZW9uOiBJbXBsZW1lbnQgLmJlX3ByaW1hcnkoKSBjYWxsYmFjaw0KPiAgICBkcm0vYW1k
Z3B1OiBJbXBsZW1lbnQgLmJlX3ByaW1hcnkoKSBjYWxsYmFjaw0KPiAgICBkcm0vaTkxNTog
SW1wbGVtZW50IC5iZV9wcmltYXJ5KCkgY2FsbGJhY2sNCj4gICAgZHJtL2xvb25nc29uOiBJ
bXBsZW1lbnQgLmJlX3ByaW1hcnkoKSBjYWxsYmFjaw0KPiAgICBkcm0vYXN0OiBSZWdpc3Rl
ciBhcyBhIFZHQSBjbGllbnQgYnkgY2FsbGluZyB2Z2FfY2xpZW50X3JlZ2lzdGVyKCkNCj4g
ICAgZHJtL2hpYm1jOiBSZWdpc3RlciBhcyBhIFZHQSBjbGllbnQgYnkgY2FsbGluZyB2Z2Ff
Y2xpZW50X3JlZ2lzdGVyKCkNCj4gICAgZHJtL2dtYTUwMDogUmVnaXN0ZXIgYXMgYSBWR0Eg
Y2xpZW50IGJ5IGNhbGxpbmcgdmdhX2NsaWVudF9yZWdpc3RlcigpDQo+IA0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgICB8IDExICsrKy0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgICAgICAgfCAxMyAr
KysrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jICAgICAgICAgICAgICAg
ICB8IDMxICsrKysrKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYu
YyAgICAgICAgICAgICAgfCA1NyArKysrKysrKysrKysrKysrKystDQo+ICAgLi4uL2dwdS9k
cm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYyAgIHwgMTUgKysrKysNCj4gICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3ZnYS5jICAgICAgfCAxNSArKysr
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9sb29uZ3Nvbi9sb29uZ3Nvbl9tb2R1bGUuYyAgICB8
ICAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2xvb25nc29uL2xvb25nc29uX21vZHVsZS5o
ICAgIHwgIDEgKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9sb29uZ3Nvbi9sc2RjX2Rydi5jICAg
ICAgICAgICB8IDEwICsrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X3ZnYS5jICAgICAgICAgfCAxMSArKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fZGV2aWNlLmMgICAgICAgIHwgMTAgKysrLQ0KPiAgIGRyaXZlcnMvcGNpL3ZnYWFy
Yi5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQzICsrKysrKysrKysrKy0tDQo+ICAg
ZHJpdmVycy92ZmlvL3BjaS92ZmlvX3BjaV9jb3JlLmMgICAgICAgICAgICAgIHwgIDIgKy0N
Cj4gICBpbmNsdWRlL2xpbnV4L3ZnYWFyYi5oICAgICAgICAgICAgICAgICAgICAgICAgfCAg
OCArKy0NCj4gICAxNCBmaWxlcyBjaGFuZ2VkLCAyMTAgaW5zZXJ0aW9ucygrKSwgMTkgZGVs
ZXRpb25zKC0pDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZy
YW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRv
dGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpI
UkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------3ZPp6QYt3D76sVOXL0p4Kqe0--

--------------BTstAG8q8zg5VW0v3P4ZzVup
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT3BrsFAwAAAAAACgkQlh/E3EQov+CS
8RAAiF0CggcJT9N2Ltb2z5+iPEE0JHOT7Qg60S1nY31dw/TchEcloYeqWymWzXj5BLYHgxTNzV2P
6BLpPqz/8kgb7RGb20atNYW+sHNMD2l8Y3fbUfBxgA1ZgDm3FGGkiOEYPWZrAuHuBqjUGvKbpxEc
67nqG+KapwZCpHZqF37yjzfpHKHVl6CNBIhlFAvNk1iZ61GQc/Pe/N9gINmdbP3iZfI70y0yK6mZ
uw8EE7Ihz4nf2+fYkKAUMe6dJKO1e6+3OyMzaCiXaIxJ8Q1zsaBmg+CDzZKULMVhJoHKsxlpurQx
SgKJ+4wHnQR7iPFU7RJuoScA3QdfqR7DRtVII86qhnGc9yRhecE786DGiCAeU8vkcOFFo+wty8q8
k7FhRjwdysEtsDvQIJSjrjwz1wHFsnikkOEKgqMwLiRwBizC1O5501jhgUDjorbRgR9b0Fa6ewM0
CiKDabNBoGqnTmCcJrBYtGhpqczwYjPv51IQtGfwZlyzbIJpQgYjzvV4BNe+z7jMCqMQl0jlpjET
2YsVfkQUWl8Xgl/+JG0LVKlUWh5QjAPOKozcCeT1NEYdhWnaIU85UXVjjskDsSiywE8YMFwYKFst
uWJktoqdgTJmCEblcE1eMsRyqbFlHOXfVT/FxSICyRnkavGM1oydu+Jo8bSoJPpCTdcnU4SFNRYV
g6A=
=Vpmn
-----END PGP SIGNATURE-----

--------------BTstAG8q8zg5VW0v3P4ZzVup--
