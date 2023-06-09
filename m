Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5321729208
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 10:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6877610E652;
	Fri,  9 Jun 2023 08:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB92210E652
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 08:00:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 37E99219FC;
 Fri,  9 Jun 2023 08:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686297650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZaVD/oGOq12nWqB3jmSiCI+YnT3mfvJIdOBaxkg8lM=;
 b=XeHdM9PD0ztnT9ubUOpRbpvx+UMENt+LvAKm2aC7bpISVjMTNdN0x9jVjUBTw3rwOzgS4z
 0aXEFvIB3ML57jkT6GfTHsV8+FRS5H9ihXwXNahLS1oQkYutFMVqeAUTe9WXxrOt+eu470
 mum2zT4ze+35v6+ck9eN7Flv1F0KHmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686297650;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZaVD/oGOq12nWqB3jmSiCI+YnT3mfvJIdOBaxkg8lM=;
 b=FDxFFea35L5dE5Gttf3HFSZqD6tu4UEhqbf94AQxh5e9PGCGDxtkSiX1guF4TKVpOJcZ7d
 zrtL+TKIoNwtU/Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED8FC13A47;
 Fri,  9 Jun 2023 08:00:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dp0BOTHcgmQNVQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Jun 2023 08:00:49 +0000
Message-ID: <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
Date: Fri, 9 Jun 2023 10:00:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9WWMu77xFnUD5RQsa52KUfuv"
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
Cc: daniel.thompson@linaro.org, lee@kernel.org, linux-sh@vger.kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9WWMu77xFnUD5RQsa52KUfuv
Content-Type: multipart/mixed; boundary="------------6yxa7mvS88S1iDNOJDxlT0o1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 lee@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Message-ID: <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
In-Reply-To: <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>

--------------6yxa7mvS88S1iDNOJDxlT0o1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDYuMjMgdW0gMDk6Mjkgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIEZyaSwgSnVuIDksIDIwMjMgYXQgOTowOeKAr0FN
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+IEFt
IDA4LjA2LjIzIHVtIDAxOjA3IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzOg0K
Pj4+IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyaXRlczoN
Cj4+Pj4gT24gV2VkLCBKdW4gNywgMjAyMyBhdCA1OjE14oCvUE0gVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4+Pj4gQW0gMDcuMDYuMjMgdW0g
MTA6NDggc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46DQo+Pj4+Pj4gT24gTW9uLCBKdW4g
NSwgMjAyMyBhdCA0OjQ44oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+IHdyb3RlOg0KPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25m
aWcNCj4+Pj4+Pj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+Pj4+Pj4+
IEBAIC01Nyw2ICs1NywxNSBAQCBjb25maWcgRklSTVdBUkVfRURJRA0KPj4+Pj4+PiAgICAg
ICAgICAgICAgY29tYmluYXRpb24gd2l0aCBjZXJ0YWluIG1vdGhlcmJvYXJkcyBhbmQgbW9u
aXRvcnMgYXJlIGtub3duIHRvDQo+Pj4+Pj4+ICAgICAgICAgICAgICBzdWZmZXIgZnJvbSB0
aGlzIHByb2JsZW0uDQo+Pj4+Pj4+DQo+Pj4+Pj4+ICtjb25maWcgRkJfREVWSUNFDQo+Pj4+
Pj4+ICsgICAgICAgIGJvb2wgIlByb3ZpZGUgbGVnYWN5IC9kZXYvZmIqIGRldmljZSINCj4+
Pj4+Pg0KPj4+Pj4+IFBlcmhhcHMgImRlZmF1bHQgeSBpZiAhRFJNIiwgYWx0aG91Z2ggdGhh
dCBkb2VzIG5vdCBoZWxwIGZvciBhDQo+Pj4+Pj4gbWl4ZWQgZHJtL2ZiZGV2IGtlcm5lbCBi
dWlsZD8NCj4+Pj4+DQo+Pj4+PiBXZSBjb3VsZCBzaW1wbHkgc2V0IGl0IHRvICJkZWZhdWx0
IHkiLiAgQnV0IE9UT0ggaXMgaXQgd29ydGggbWFraW5nIGl0IGENCj4+Pj4+IGRlZmF1bHQ/
IERpc3RyaWJ1dGlvbnMgd2lsbCBzZXQgaXQgdG8gdGhlIHZhbHVlIHRoZXkgbmVlZC93YW50
LiBUaGUgdmVyeQ0KPj4+Pj4gZmV3IHBlb3BsZSB0aGF0IGJ1aWxkIHRoZWlyIG93biBrZXJu
ZWxzIHRvIGdldCBjZXJ0YWluIGZiZGV2IGRyaXZlcnMNCj4+Pj4+IHdpbGwgY2VydGFpbmx5
IGJlIGFibGUgdG8gZW5hYmxlIHRoZSBvcHRpb24gYnkgaGFuZCBhcyB3ZWxsLg0KPj4+Pg0K
Pj4+PiBEZWZhdWx0aW5nIHRvICJuIiAodGhlIGRlZmF1bHQpIG1lYW5zIGNhdXNpbmcgcmVn
cmVzc2lvbnMgd2hlbiB0aGVzZQ0KPj4+PiBmZXcgcGVvcGxlIHVzZSBhbiBleGlzdGluZyBk
ZWZjb25maWcuDQo+Pj4+DQo+Pj4NCj4+PiBIYXZpbmcgImRmYXVsdCB5IGlmICFEUk0iIG1h
a2VzIHNlbnNlIHRvIG1lLiBJIGd1ZXNzIGlzIGEgY29ybmVyIGNhc2UgYnV0DQo+Pj4gYXQg
bGVhc3QgaXQgd29uJ3Qgc2lsZW50bHkgYmUgZGlzYWJsZWQgZm9yIHVzZXJzIHRoYXQgb25s
eSB3YW50IGZiZGV2IGFzDQo+Pj4gR2VlcnQgbWVudGlvbmVkLg0KPj4NCj4+IElNSE8gdGhl
IHJhdGlvbmFsIGJlaGluZCBzdWNoIGNvbmRpdGlvbmFscyBhcmUgbW9zdGx5IHdoYXQgIndl
IG1ha2UgdXANCj4+IGhlcmUgaW4gdGhlIGRpc2N1c3Npb24iLCBidXQgbm90IHNvbWV0aGlu
ZyBiYXNlZCBvbiByZWFsLXdvcmxkIGZlZWRiYWNrLg0KPj4gU28gSSdkIHN0cm9uZ2x5IHBy
ZWZlciBhIGNsZWFyIG4gb3IgeSBzZXR0aW5nIGhlcmUuDQo+Pg0KPj4+DQo+Pj4gSSB3b3Vs
ZG4ndCBjYWxsIGl0IGEgcmVncmVzc2lvbiB0aG91Z2gsIGJlY2F1c2UgQUZBSUsgdGhlIEtj
b25maWcgb3B0aW9ucw0KPj4+IGFyZSBub3QgYSBzdGFibGUgQVBJID8NCj4+DQo+PiBJSVJD
IGluIHRoZSBwYXN0IHRoZXJlIGhhdmUgYmVlbiBjb25jZXJucyBhYm91dCBjaGFuZ2luZyBL
Y29uZmlnDQo+PiBkZWZhdWx0cy4gSWYgd2UgZ28gd2l0aCAiZGVmYXVsdCBuIiwgd2UnZCBh
cHBhcmVudGx5IGRvIHNvbWV0aGluZyBzaW1pbGFyLg0KPj4NCj4+Pg0KPj4+Pj4+IE9yIHJl
c2VydmUgIkZCIiBmb3IgcmVhbCBmYmRldiBkcml2ZXJzLCBhbmQgaW50cm9kdWNlIGEgbmV3
IEZCX0NPUkUsDQo+Pj4+Pj4gdG8gYmUgc2VsZWN0ZWQgYnkgYm90aCBGQiBhbmQgRFJNX0ZC
REVWX0VNVUxBVElPTj8NCj4+Pj4+PiBUaGVuIEZCX0RFVklDRSBjYW4gZGVwZW5kIG9uIEZC
X0NPUkUsIGFuZCBkZWZhdWx0IHRvIHkgaWYgRkIuDQo+Pj4NCj4+PiBGdW5ueSB0aGF0IHlv
dSBtZW50aW9uIGJlY2F1c2UgaXQncyBleGFjdGx5IHdoYXQgSSBhdHRlbXB0ZWQgaW4gdGhl
IHBhc3Q6DQo+Pj4NCj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTA4Mjcx
MDA1MzEuMTU3ODYwNC0xLWphdmllcm1AcmVkaGF0LmNvbS9ULyN1DQo+Pj4NCj4+Pj4+DQo+
Pj4+PiBUaGF0IHdvdWxkbid0IHdvcmsuIEluIFR1bWJsZXdlZWQsIHdlIHN0aWxsIGhhdmUg
ZWZpZmIgYW5kIHZlc2FmYg0KPj4+Pj4gZW5hYmxlZCB1bmRlciBjZXJ0YWluIGNvbmRpdGlv
bnM7IG1lcmVseSBmb3IgdGhlIGtlcm5lbCBjb25zb2xlLiBXZSdkDQo+Pj4+PiBoYXZlIHRv
IGVuYWJsZSBDT05GSUdfRkIsIHdoaWNoIHdvdWxkIGJyaW5nIGJhY2sgdGhlIGRldmljZS4N
Cj4+Pj4NCj4+Pj4gIkRlZmF1bHQgeSIgZG9lcyBub3QgbWVhbiB0aGF0IHlvdSBjYW5ub3Qg
ZGlzYWJsZSBGQl9ERVZJQ0UsIHNvDQo+Pj4+IHlvdSBhcmUgbm90IGZvcmNlZCB0byBicmlu
ZyBiYWNrIHRoZSBkZXZpY2U/DQo+Pj4NCj4+PiBJIHRoaW5rIHdlIGNhbiBoYXZlIGJvdGgg
dG8gbWFrZSB0aGUga2VybmVsIG1vcmUgY29uZmlndXJhYmxlOg0KPj4+DQo+Pj4gMSkgQWxs
b3cgdG8gb25seSBkaXNhYmxlIGZiZGV2IHVzZXItc3BhY2UgQVBJcyAoL2Rldi9mYj8sIC9w
cm9jL2ZiLCBldGMpLA0KPj4+ICAgICAgd2hpY2ggaXMgd2hhdCB0aGUgc2VyaWVzIGlzIGRv
aW5nIHdpdGggdGhlIG5ldyBGQl9ERVZJQ0UgY29uZmlnIHN5bWJvbC4NCj4+Pg0KPj4+IDIp
IEFsbG93IHRvIGRpc2FibGUgYWxsICJuYXRpdmUiIGZiZGV2IGRyaXZlcnMgYW5kIG9ubHkg
a2VlcCB0aGUgRFJNIGZiZGV2DQo+Pj4gICAgICBlbXVsYXRpb24gbGF5ZXIuIFRoYXQncyB3
aGF0IG15IHNlcmllcyBhdHRlbXB0ZWQgdG8gZG8gd2l0aCB0aGUgRkJfQ09SRQ0KPj4+ICAg
ICAgS2NvbmZpZyBzeW1ib2wuDQo+Pj4NCj4+PiBJIGJlbGlldmUgdGhhdCB0aGVyZSBhcmUg
dXNlIGNhc2VzIGZvciBib3RoLCBmb3IgZXhhbXBsZSBhcyBUaG9tYXMnIHNhaWQNCj4+PiBt
YW55IGRpc3Ryb3MgYXJlIGRpc2FibGluZyBhbGwgdGhlIGZiZGV2IGRyaXZlcnMgYW5kIHRo
ZWlyIHVzZXItc3BhY2Ugb25seQ0KPj4+IHJlcXVpcmVzIERSTS9LTVMsIHNvIG1ha2VzIHNl
bnNlIHRvIG5vdCBleHBvc2UgYW55IGZiZGV2IHVBUEkgYXQgYWxsLg0KPj4+DQo+Pj4gQnV0
IG1heSBiZSB0aGF0IG90aGVyIHVzZXJzIHdhbnQgdGhlIG9wcG9zaXRlLCB0aGV5IGhhdmUg
YW4gb2xkIHVzZXItc3BhY2UNCj4+PiB0aGF0IHJlcXVpcmVzIGZiZGV2LCBidXQgaXMgcnVu
bmluZyBvbiBuZXdlciBoYXJkd2FyZSB0aGF0IG9ubHkgaGF2ZSBhIERSTQ0KPj4+IGRyaXZl
ci4gU28gdGhleSB3aWxsIHdhbnQgRFJNIGZiZGV2IGVtdWxhdGlvbiBidXQgbm9uZSBmYmRl
diBkcml2ZXIgYXQgYWxsLg0KPj4+DQo+Pj4gVGhhdCdzIHdoeSBJIHRoaW5rIHRoYXQgRkJf
REVWSUNFIGFuZCBGQl9DT1JFIGFyZSBjb21wbGVtZW50YXJ5IGFuZCB3ZSBjYW4NCj4+PiBz
dXBwb3J0IGFueSBjb21iaW5hdGlvbiBvZiB0aGUgdHdvLCBpZiB5b3UgYWdyZWUgdGhlcmUg
YXJlIHVzZXMgZm9yIGVpdGhlci4NCj4+DQo+PiBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQg
dGhlIHZhbHVlIG9mIHN1Y2ggYW4gZXh0cmEgY29tcGlsZS10aW1lIG9wdGlvbj8NCj4+ICAg
IEVpdGhlciB5b3UgaGF2ZSBmYmRldiB1c2Vyc3BhY2UsIHRoZW4geW91IHdhbnQgdGhlIGRl
dmljZTsgb3IgeW91DQo+PiBkb24ndCB0aGVuIGl0J3MgYmV0dGVyIHRvIGRpc2FibGUgaXQg
ZW50aXJlbHkuIEkgZG9uJ3Qgc2VlIG11Y2ggb2YgYQ0KPj4gZGlmZmVyZW5jZSBiZXR3ZWVu
IERSTSBhbmQgZmJkZXYgZHJpdmVycyBoZXJlLg0KPiANCj4gSWYgeW91IGhhdmUgRFJNIGFu
ZCBhcmUgcnVubmluZyBhIExpbnV4IGRlc2t0b3AsIHlvdSBhcmUgcHJvYmFibHkNCj4gdXNp
bmcgRFJNIHVzZXJzcGFjZS4NCj4gSWYgeW91IGhhdmUgZmJkZXYsIGFuZCBhcmUgdXNpbmcg
Z3JhcGhpY3MsIHlvdSBoYXZlIG5vIGNob2ljZSBidXQNCj4gdXNpbmcgYW4gZmJkZXYgdXNl
cnNwYWNlLg0KPiANCj4gU28gd2l0aCBGQl9DT1JFLCB5b3UgY2FuIGhhdmUgZGVmYXVsdCB5
IGlmIHlvdSBoYXZlIGEgcmVhbCBmYmRldiBkcml2ZXIsDQo+IGFuZCBkZWZhdWx0IG4gaWYg
eW91IGhhdmUgb25seSBEUk0gZHJpdmVycy4NCj4gDQo+PiBJJ2QgYWxzbyBxdWVzdGlvbiB0
aGUgYXJndW1lbnQgdGhhdCB0aGVyZSdzIGV2ZW4gZmJkZXYgdXNlcnNwYWNlIG91dA0KPj4g
dGhlcmUuIEl0IHdhcyBuZXZlciBwb3B1bGFyIGluIGl0J3MgaGV5ZGF5IGFuZCBkZWZpbml0
ZWx5IGhhc24ndA0KPj4gaW1wcm92ZWQgc2luY2UgdGhlbi4gRXZlbiB0aGUgMyBwZW9wbGUg
d2hvIHN0aWxsIGFzayBmb3IgZmJkZXYgc3VwcG9ydA0KPiANCj4gVGhlcmUncyBYLm9yZywg
RGlyZWN0RkIsIFNETCwgLi4uDQoNCk5vbmUgb2YgdGhlc2UgZXhhbXBsZXMgaGFzIGEgZGVw
ZW5kZW5jeSBvbiBmYmRldi4gVGhleSBjYW4gZnJlZWx5IHN3aXRjaCANCmJhY2tlbmRzIGFu
ZCBoYXZlIG1vdmVkIHRvIERSTS4gQW55dGhpbmcgcHJvZ3JhbSB1dGlsaXppbmcgdGhlc2Ug
DQpleGFtcGxlcyBoYXMgbm8gZGVwZW5kZW5jeSBvbiBmYmRldiBlaXRoZXIuDQoNCldoZW4g
SSBzYXkgInVzZXJzcGFjZSIgaW4gdGhpcyBjb250ZXh0LCBpdCdzIHRoZSBvbmUgb2xkIHBy
b2dyYW0gdGhhdCANCnN1cHBvcnRzIG5vdGhpbmcgYnV0IGZiZGV2LiBUQkggSSdtIGhhdmlu
ZyBwcm9ibGVtcyB0byBjb21lIHVwIHdpdGggDQpleGFtcGxlcy4NCg0KPiANCj4gV2hhdCBk
byB5b3UgdGhpbmsgbG93LWVuZCBlbWJlZGRlZCBkZXZpY2VzIHdpdGggYW4gb3V0LW9mLXRy
ZWVbKl0NCj4gZmJkZXYgZHJpdmVyIGFyZSB1c2luZz8NCg0KQW5kIHRob3NlIGRvIG5vdCBj
b3VudCBlaXRoZXIuIElJUkMgQW5kcm9pZCB1c2VkIHRvIGJlIGJ1aWx0IG9uIHRvcCBvZiAN
CmZiZGV2IGRldmljZXMuIEknbSBub3Qgc3VyZSBpZiB0aGV5IGhhdmUgbW92ZWQgdG8gRFJN
IGJ5IG5vdy4gQnV0IA0KZW1iZWRkZWQgdXNlcyBkZWRpY2F0ZWQga2VybmVscyBhbmQga2Vy
bmVsIGNvbmZpZ3MuICBJdCdzIGVhc3kgZm9yIHRoZW0gDQp0byBzZXQgRkJfREVWSUNFPXku
ICBXZSdyZSBub3QgZ29pbmcgdG8gdGFrZSBhd2F5IHRoZSBmYmRldiBkZXZpY2UgZW50aXJl
bHkuDQoNCj4gDQo+IFsqXSBUaGVyZSdzIGJlZW4gYSBtb3JhdG9yaXVtIG9uIG5ldyBmYmRl
diBkcml2ZXJzIGZvciBhYm91dCBhIGRlY2FkZS4NCj4gDQo+PiBoZXJlIG9ubHkgc2VlbSB0
byBjYXJlIGFib3V0IHRoZSBwZXJmb3JtYW5jZSBvZiB0aGUgZnJhbWVidWZmZXIgY29uc29s
ZSwNCj4+IGJ1dCBuZXZlciBhYm91dCB1c2Vyc3BhY2UuDQo+IA0KPiBVbmxlc3MgeW91IGdv
IGZvciBoZWF2eSBncmFwaGljcyBhbmQgM0QsIGEgc2ltcGxlIEdVSSB3aXRoIHNvbWUNCj4g
YnV0dG9ucyBhbmQgdGV4dCByZXF1aXJlcyBsZXNzIHBlcmZvcm1hbmNlIHRoYW4gc2Nyb2xs
aW5nIGEgZnVsbC1zY3JlZW4NCj4gZ3JhcGhpY2FsIHRleHQgY29uc29sZS4uLg0KPiANCj4+
IFNvIEknZCBsaWtlIHRvIHByb3Bvc2UgYSBkaWZmZXJlbnQgc29sdXRpb246IG9uIHRvcCBv
ZiB0aGUgY3VycmVudA0KPj4gcGF0Y2hzZXQsIGxldCdzIG1ha2UgYW4gZmJkZXYgbW9kdWxl
IG9wdGlvbiB0aGF0IGVuYWJsZXMgdGhlIGRldmljZS4gSWYNCj4+IENPTkZJR19GQl9ERVZJ
Q0UgaGFzIGJlZW4gZW5hYmxlZCwgdGhlIG9wdGlvbiB3b3VsZCBzd2l0Y2ggdGhlDQo+PiBm
dW5jdGlvbmFsaXR5IG9uIGFuZCBvZmYuIEEgS2NvbmZpZyBvcHRpb24gd291bGQgc2V0IHRo
ZSBkZWZhdWx0LiAgV2l0aA0KPj4gc3VjaCBhIHNldHVwLCBkaXN0cmlidXRpb25zIGNhbiBk
aXNhYmxlIHRoZSBmYmRldiBkZXZpY2UgYnkgZGVmYXVsdC4NCj4+IEFuZCB0aGUgZmV3IHVz
ZXJzIHdpdGggdGhlIG9kZCBzeXN0ZW0gdGhhdCBoYXMgZmJkZXYgdXNlcnNwYWNlIGNhbiBz
dGlsbA0KPj4gZW5hYmxlIHRoZSBmYmRldiBkZXZpY2UgYXQgYm9vdCB0aW1lLg0KPiANCj4g
SG1tLi4uIFRoYXQgbWFrZXMgaXQgZXZlbiBtb3JlIGNvbXBsaWNhdGVkLi4uDQoNCk5vLCB0
aGF0IG1ha2VzIHRoaW5ncyBhIGxvdCBlYXNpZXIgZm9yIGRpc3Ryb3MuIEV2ZXJ5b25lIGVs
c2UgKGN1c3RvbSANCmJ1aWxkcywgZW1iZWRkZWQpIGlzIG5vdCBhZmZlY3RlZCBieSB0aGlz
IGNoYW5nZS4gRGVza3RvcCBkaXN0cm9zIGFyZSANCnJlYWxseSB0aGUgb25seSBhZmZlY3Rl
ZCBwYXJ0eSBJIHNlZSBoZXJlLiAiV2UiIChJJ20gYXQgU3VzZSkgaGF2ZSB0byANCnN1cHBv
cnQgYWxsIGtpbmRzIG9mIHVzZXJzIHdpdGgganVzdCBhIGZldyBnZW5lcmljIG9mZmVyaW5n
cy4gQW5kIGlmIEkgDQpjYW4gZGlzYWJsZSB0aGUgZmJkZXYgZGV2aWNlIGJ5IGRlZmF1bHQg
YW5kIGdpdmUgdGhlIHZlcnkgZmV3IGZiZGV2IA0KdXNlcnMgYSB3b3JrYXJvdW5kLCBpdCdz
IGEgdmVyeSBnb29kIHRyYWRlb2ZmLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
PiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------6yxa7mvS88S1iDNOJDxlT0o1--

--------------9WWMu77xFnUD5RQsa52KUfuv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSC3DEFAwAAAAAACgkQlh/E3EQov+Cx
Zw/+OdjDLP5trVwcidrvFgF6TKEUYGkaFFhqs8PM32L7NsoIasCZw1W6rw9O51fJRjFcA0g6S2Ey
dhBOPznPxxlgMH3YYKTlug65w3p4vwAzJb6+Q+U9hlUBUM3HM89skpbW+MDr40nru+gGOXnKXDXr
I6t5caMa89BWjN38Yn37mJCHYVpDvkkBP+nTR5niUmckz67Hm17m6px4oplW4i27QGum/QVH7Jca
1/J8xb04rr3IlCiLksFSGpTHMZprbm2qHmkJ3IdOYq2bIdOjXb0niQtemOBXK90lcn0603HhcRLS
LkcVDnzZXw9CFDSBkUTgT97hzdlJ/oPcCRDS0xSqi831xzZCUrPsWv6PWT92AzKVQRk7ObzZdN61
xMGdXDRFiHhVLSCzpVh25wVIsWlaXqmIMz4589qh+A+UQ54IREmNtNZG8dPPTmhw+Q6fmbLeH75V
deYlrS/0HMBV4nRVW9w0nZJgwjAY0HCMAcabzQ+g1cKW+2npIKqe7XRbI3kCosiL14cclrv6/hUn
xbKYAtgfRI5xA4D11nQWRPi9fnLsKRltt00A7Gu/CD6+7IVysDkWbivF3fnltqWjjVEpHLHDtfGV
c6kqsSImT8P3KKO/4tXKf1dbwsYgtt1A8+GoAeP1Djs7nkJNkUg3BgrkFoPA2D2ddwaMtH0JkpZl
ghk=
=RAJi
-----END PGP SIGNATURE-----

--------------9WWMu77xFnUD5RQsa52KUfuv--
