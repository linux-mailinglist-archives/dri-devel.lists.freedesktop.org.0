Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A42743C0F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9279610E162;
	Fri, 30 Jun 2023 12:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B748210E161
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 12:41:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 54FCD1F8C3;
 Fri, 30 Jun 2023 12:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688128909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZRDE59lhoj9yY6+rtH+IwvrIz4rEf86xzXp5wWCIh2Q=;
 b=p1PHRkWHsiPCOHBUHHIxosOT0i0wQWlC332d8sLIymglqS+NPAl/X1b4hOEgR1OqNQNAZH
 HsuAeM0Z9pJhaHqosh/ZGaFuUTpNHza0o0cV1ri4LHegpYOmjBahViU8oQMmDHdRxy6TDk
 tdp/n1l99uOpWtyxrqBQ1zbAuiEWUwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688128909;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZRDE59lhoj9yY6+rtH+IwvrIz4rEf86xzXp5wWCIh2Q=;
 b=qb0jR7ta9z1fTwgmTtSGBo9Z9tWSFe9JeFSYt+riFgFqKQmYyIwya0x2mSnYgk8vdYqLBp
 t++JfdK1StLyjhDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D50D113915;
 Fri, 30 Jun 2023 12:41:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +r4HM4zNnmRlUAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Jun 2023 12:41:48 +0000
Message-ID: <b3e22a11-f711-2073-03b5-f9f38b1e626d@suse.de>
Date: Fri, 30 Jun 2023 14:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230629225113.297512-1-javierm@redhat.com>
 <d231d0fe-c5f5-073a-3b8c-9441e1674c24@suse.de>
 <87bkgxdt9h.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87bkgxdt9h.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vT6i0b8ShapC7s9pXaFsLrF2"
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
Cc: linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vT6i0b8ShapC7s9pXaFsLrF2
Content-Type: multipart/mixed; boundary="------------Y9OrJGcOPLL6spGyqROT9ni0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
 Ingo Molnar <mingo@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, x86@kernel.org
Message-ID: <b3e22a11-f711-2073-03b5-f9f38b1e626d@suse.de>
Subject: Re: [PATCH 0/2] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
References: <20230629225113.297512-1-javierm@redhat.com>
 <d231d0fe-c5f5-073a-3b8c-9441e1674c24@suse.de>
 <87bkgxdt9h.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87bkgxdt9h.fsf@minerva.mail-host-address-is-not-set>

--------------Y9OrJGcOPLL6spGyqROT9ni0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDYuMjMgdW0gMTQ6MzMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBUaGFua3MgYSBsb3QgZm9yIHlvdXIg
cmV2aWV3Lg0KPiANCj4+IEhpIEphdmllcg0KPj4NCj4+IEFtIDMwLjA2LjIzIHVtIDAwOjUx
IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzOg0KPj4+IFRoaXMgcGF0Y2ggc2Vy
aWVzIHNwbGl0cyB0aGUgZmJkZXYgY29yZSBzdXBwb3J0IGluIHR3byBkaWZmZXJlbnQgS2Nv
bmZpZw0KPj4+IHN5bWJvbHM6IEZCIGFuZCBGQl9DT1JFLiBUaGUgbW90aXZhdGlvbiBmb3Ig
dGhpcyBpcyB0byBhbGxvdyBDT05GSUdfRkIgdG8NCj4+PiBiZSBkaXNhYmxlZCwgd2hpbGUg
c3RpbGwgaGF2aW5nIHRoZSB0aGUgY29yZSBmYmRldiBzdXBwb3J0IG5lZWRlZCBmb3IgdGhl
DQo+Pj4gQ09ORklHX0RSTV9GQkRFVl9FTVVMQVRJT04gdG8gYmUgZW5hYmxlZC4gVGhlIG1v
dGl2YXRpb24gaXMgYXV0b21hdGljYWxseQ0KPj4+IGRpc2FibGluZyBhbGwgZmJkZXYgZHJp
dmVycyBpbnN0ZWFkIG9mIGhhdmluZyB0byBiZSBkaXNhYmxlZCBpbmRpdmlkdWFsbHkuDQo+
Pj4NCj4+PiBUaGUgcmVhc29uIGZvciBkb2luZyB0aGlzIGlzIHRoYXQgbm93IHdpdGggc2lt
cGxlZHJtLCB0aGVyZSdzIG5vIG5lZWQgZm9yDQo+Pj4gdGhlIGxlZ2FjeSBmYmRldiAoZS5n
OiBlZmlmYiBvciB2ZXNhZmIpIGRyaXZlcnMgYW55bW9yZSBhbmQgbWFueSBkaXN0cm9zDQo+
Pj4gbm93IGRpc2FibGUgdGhlbS4gQnV0IGl0IHdvdWxkIHNpbXBsaWZ5IHRoZSBjb25maWcg
YSBsb3QgZm8gaGF2ZSBhIHNpbmdsZQ0KPj4+IEtjb25maWcgc3ltYm9sIHRvIGRpc2FibGUg
YWxsIGZiZGV2IGRyaXZlcnMuDQo+Pg0KPj4gSSBzdGlsbCBkb24ndCBnZXQgdGhlIHBvaW50
IG9mIHRoaXMgY2hhbmdlLiBXZSd2ZSBkaXNhYmxlZCB0aGUgZmJkZXYNCj4+IGRyaXZlcnMg
b25jZS4gQW5kIHRoZXkgYXJlIG9mZiBub3cgYW5kIHJlbWFpbiBvZmYuDQo+Pg0KPiANCj4g
WWVzLCBidXQgZG9pbmcgdGhhdCBtZWFucyB5b3UgaGF2ZSBhIGJ1bmNoIG9mIHRoZXNlIGlu
IHlvdXIga2VybmVsIGNvbmZpZzoNCj4gDQo+ICMNCj4gIyBGcmFtZSBidWZmZXIgaGFyZHdh
cmUgZHJpdmVycw0KPiAjDQo+ICMgQ09ORklHX0ZCX0NJUlJVUyBpcyBub3Qgc2V0DQo+ICMg
Q09ORklHX0ZCX1BNMiBpcyBub3Qgc2V0DQo+ICMgQ09ORklHX0ZCX0FSTUNMQ0QgaXMgbm90
IHNldA0KPiAuLi4NCj4gDQo+IEkgZG9uJ3Qga25vdyBob3cgdGhlIGtlcm5lbCBjb25maWd1
cmF0aW9uIG1hbmFnZW1lbnQgZm9yIHRoZSBPcGVuU1VTRQ0KPiBrZXJuZWwgcGFja2FnZSB3
b3JrcywgYnV0IGF0IGxlYXN0IGluIEZlZG9yYSB0aGlzIHRyYW5zbGF0ZXMgdG8gbmVlZGlu
ZyB0bw0KPiBoYXZlIGEgbG90IG9mIGV4cGxpY2l0IGRpc2FibGUgY29uZmlndXJhdGlvbnMg
aW4gdGhlIGZvcm0gb2Y6DQo+IA0KPiAkIGNhdCByZWRoYXQvY29uZmlncy9jb21tb24vZ2Vu
ZXJpYy9DT05GSUdfRkJfQ0lSUlVTDQo+ICMgQ09ORklHX0ZCX0NJUlJVUyBpcyBub3Qgc2V0
DQo+IA0KPiAkIGxzIHJlZGhhdC9jb25maWdzL2NvbW1vbi9nZW5lcmljL0NPTkZJR19GQl8q
IHwgd2MgLWwNCj4gNjENCj4gDQo+IEkgd2FudCB0byBnZXQgcmlkIG9mIGFsbCB0aG9zZSBh
bmQgdGhlIGdvYWwgb2YgdGhpcyBzZXJpZXMgaXMgdG8gcmVkdWNlDQo+IHRoYXQgY29uZmln
dXJhdGlvbiB0byBvbmx5Og0KPiANCj4gJCBjYXQgcmVkaGF0L2NvbmZpZ3MvY29tbW9uL2dl
bmVyaWMvQ09ORklHX0ZCDQo+ICMgQ09ORklHX0ZCIGlzIG5vdCBzZXQNCj4gDQo+ICQgY2F0
IHJlZGhhdC9jb25maWdzL2NvbW1vbi9nZW5lcmljL0NPTkZJR19GQl9DT1JFDQo+IENPTkZJ
R19GQl9DT1JFPXkNCg0KV2UgaGF2ZSB0aGVzZSAnaXMgbm90IHNldCcgbGluZXMgb24gb3Vy
IGtlcm5lbCBjb25maWdzLCBidXQgSSBkb24ndCANCnRoaW5rIHRoZXkgYm90aGVyIGFueW9u
ZSB0b28gbXVjaC4NCg0KV2VsbCwgdGhhbmtzIGZvciBleHBsYWluaW5nLiBBdCBsZWFzdCBJ
IG5vdyBzZWUgd2h5IHlvdSB3YW50IHRvIGRvIHRoaXMgDQpjaGFuZ2UuDQoNCj4gDQo+PiBU
aGUgcGF0Y2hzZXQgbm93IGludHJvZHVjZXMgRkJfQ09SRSwgd2hpY2gganVzdCBhZGRzIG1v
cmUgb3B0aW9ucy4gQnV0DQo+PiB5b3UncmUgbm90IHJlZHVjaW5nIHRoZSBjb2RlIG9yIGNv
bXBpbGUgdGltZSBvciBhbnkgdGhpbmcgc2ltaWxhci4NCj4+DQo+IA0KPiBObyBuZWVkIGZv
ciBhbnkgcmVkaGF0L2NvbmZpZ3MvY29tbW9uL2dlbmVyaWMvQ09ORklHX0ZCXyogYmVjYXVz
ZSB0aG9zZQ0KPiBkb24ndCBuZWVkIHRvIGJlIGV4cGxpY2l0bHkgZGlzYWJsZWQgYW55bW9y
ZSBzaW5jZSBDT05GSUdfRkIgaXNuJ3Qgc2V0Lg0KPiANCj4gQW5kIHRoZSAiRnJhbWUgYnVm
ZmVyIGhhcmR3YXJlIGRyaXZlcnMiIHNlY3Rpb24gaW4gdGhlIC5jb25maWcgZ29lcyBhd2F5
Lg0KPiANCj4gU28gaXQgaXMgYSBjb25maWd1cmF0aW9uIHNpbXBsaWZpY2F0aW9uIGV2ZW4g
d2hlbiB5b3UgY2FuIGFjaGlldmUgdGhlIHNhbWUNCj4gd2l0aCB0aGUgZXhpc3RpbmcgS2Nv
bmZpZyBzeW1ib2xzLg0KPiANCj4+IEknZCBsaWtlIHRvIHN1Z2dlc3QgYSBjaGFuZ2UgdG8g
dGhlc2UgcGF0Y2hlczogcmF0aGVyIHRoZW4gbWFraW5nIEZCIGFuZA0KPj4gRFJNX0ZCREVW
X0VNVUxBVElPTiBkZXBlbmQgb24gRkJfQ09SRSwgbWFrZSB0aGVtIHNlbGVjdCBGQl9DT1JF
LiBUaGF0DQo+PiB3aWxsIGFsbG93IHRoZSBEUk0gc3Vic3lzdGVtIHRvIGVuYWJsZSBmcmFt
ZWJ1ZmZlciBlbXVsYXRpb24NCj4+IGluZGVwZW5kZW50bHkgZnJvbSBmcmFtZWJ1ZmZlciBk
ZXZpY2VzLiBJZiBlaXRoZXIgaGFzIGJlZW4gc2V0LCB0aGUNCj4+IGZiZGV2IGNvcmUgd2ls
bCBiZSBzZWxlY3RlZC4NCj4+DQo+IA0KPiBZZXMsIEkgZ3Vlc3MgdGhhdCBtYWtpbmcgaXQg
YSBub24gdXNlci12aXNpYmxlIG9wdGlvbiBtYWtlcyBzZW5zZS4gSSdtDQo+IGp1c3Qgd2Fy
eSBvZiB1c2luZyBzZWxlY3QgYmVjYXVzZSBJJ3ZlIGJpdHRlbiBpbiB0aGUgcGFzdCBieSBj
aXJjdWxhcg0KPiBkZXBlbmRlbmNpZXMgd2hlbiBvdGhlciBzeW1ib2wgZGVwZW5kcyBvbiBp
dC4NCj4gDQo+IEJ1dCBJJ20gT0sgd2l0aCB0aGF0IGNoYW5nZSBhbmQgd2lsbCBkbyBpbiB2
Mi4NCg0KR3JlYXQsIHRoYW5rcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+
IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFzDQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywg
R2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQs
IEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------Y9OrJGcOPLL6spGyqROT9ni0--

--------------vT6i0b8ShapC7s9pXaFsLrF2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSezYwFAwAAAAAACgkQlh/E3EQov+C9
xw//c+ufTqaE234uOGIyN4p1b0bNEwit90k5YX8cEvSAYtYDooKrDlZSZoCBTAVzCCi5NYKgiCfM
8Z2jl0434C+Zl22nv1nFU5hz6KG4hLpGQx+xzt1hRe8fOA+pCTKzPmccN9bYMsllP7zjBEztiKKG
aXWwimNpfQJrGz0hO9yCk+waAhXaGyM7N8eGohwB7kGaLbGB0XgGCULhFSxPNzFRhBtNTf1zKr2+
KPu180XwHG52ua4dd10qTVoDOnxMCExFV5rUR+onjuEBU2HlcdolpEx0dIE1vFZsDLOQU9OkKmOu
lPHab5GZPkvkSWmanWbDXIhfVpqpkRZlHtM2lLOf6wUbl+3VzYH/RUL5EVRfOf/yhRQ5WnMjFYsB
TCvXc/DqUHlpRO9TOYMLSU5PYYy54jiWla4Sq73ixBWFKjugq5Fj/bmhyAtggFEvhmWs3PoCAhq9
H4NM36b8v2LimDKa+VA/FMZcy5WEU+IKykEOWBjchD66/u6JzXiyXh4WKKwLxjb3+F27cC+fZlQD
xvZ5/jxZsIKiHjYQZx/nIk/uvT0iWcYSOl1GgfutJeKQBUurDlSzHhvTQZkUwzLZVnjOvzETqH8c
Q/xh0NEbLWnaVYS/WN1BHkX05ocgzpKaFKkQnmTiseLnoR0L8oBlddOdoDPKQjbkWyZ9W6uEdXFA
P8A=
=y6+9
-----END PGP SIGNATURE-----

--------------vT6i0b8ShapC7s9pXaFsLrF2--
