Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDF7729090
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 09:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E330F10E226;
	Fri,  9 Jun 2023 07:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6597810E226
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 07:09:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5C2121A21;
 Fri,  9 Jun 2023 07:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686294573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oIFojfmjNVkKTA0DSV4ol9D4jawBjVgmRf+InZbLG9w=;
 b=1mignKyanaWoTJjO6QNPdi4GBxbJPjNZ0UKLSV8q39tt0slIP0dTr0u7nI0eWXRbXc8nUN
 C/RWsKizXUhPsnhVS4VVLuTJROnoeDYsYNka01Dy2njiTXOBoReVd47HcD8oY1rCnWDJ59
 UJIrtGsBfOU/sW3lieLztEyhOgnL0Rw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686294573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oIFojfmjNVkKTA0DSV4ol9D4jawBjVgmRf+InZbLG9w=;
 b=ACzkcaZVpArUyOY6JEvPxuPu0LVEZrPtz3pTidg+JEVNL8PksuXwpWtILXweG0j9VRaEQ2
 LP2Lnf4n2D0NKwCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87736139C8;
 Fri,  9 Jun 2023 07:09:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sq8dIC3QgmTCQQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Jun 2023 07:09:33 +0000
Message-ID: <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
Date: Fri, 9 Jun 2023 09:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <873532eurg.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fr72hGe0H9cuMk5ZNtgmOcYw"
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
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fr72hGe0H9cuMk5ZNtgmOcYw
Content-Type: multipart/mixed; boundary="------------yetloRvem6ZjL7j2qRdsHdH0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 lee@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Message-ID: <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <873532eurg.fsf@minerva.mail-host-address-is-not-set>

--------------yetloRvem6ZjL7j2qRdsHdH0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VlcnQgYW5kIEphdmllcg0KDQpBbSAwOC4wNi4yMyB1bSAwMTowNyBzY2hyaWViIEph
dmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBs
aW51eC1tNjhrLm9yZz4gd3JpdGVzOg0KPiANCj4gSGVsbG8gR2VlcnQgYW5kIFRob21hcywN
Cj4gDQo+PiBIaSBUaG9tYXMsDQo+Pg0KPj4gT24gV2VkLCBKdW4gNywgMjAyMyBhdCA1OjE1
4oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0K
Pj4+IEFtIDA3LjA2LjIzIHVtIDEwOjQ4IHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOg0K
Pj4+PiBPbiBNb24sIEp1biA1LCAyMDIzIGF0IDQ6NDjigK9QTSBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L0tjb25maWcNCj4+Pj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2Nv
bmZpZw0KPj4+Pj4gQEAgLTU3LDYgKzU3LDE1IEBAIGNvbmZpZyBGSVJNV0FSRV9FRElEDQo+
Pj4+PiAgICAgICAgICAgICBjb21iaW5hdGlvbiB3aXRoIGNlcnRhaW4gbW90aGVyYm9hcmRz
IGFuZCBtb25pdG9ycyBhcmUga25vd24gdG8NCj4+Pj4+ICAgICAgICAgICAgIHN1ZmZlciBm
cm9tIHRoaXMgcHJvYmxlbS4NCj4+Pj4+DQo+Pj4+PiArY29uZmlnIEZCX0RFVklDRQ0KPj4+
Pj4gKyAgICAgICAgYm9vbCAiUHJvdmlkZSBsZWdhY3kgL2Rldi9mYiogZGV2aWNlIg0KPj4+
Pg0KPj4+PiBQZXJoYXBzICJkZWZhdWx0IHkgaWYgIURSTSIsIGFsdGhvdWdoIHRoYXQgZG9l
cyBub3QgaGVscCBmb3IgYQ0KPj4+PiBtaXhlZCBkcm0vZmJkZXYga2VybmVsIGJ1aWxkPw0K
Pj4+DQo+Pj4gV2UgY291bGQgc2ltcGx5IHNldCBpdCB0byAiZGVmYXVsdCB5Ii4gIEJ1dCBP
VE9IIGlzIGl0IHdvcnRoIG1ha2luZyBpdCBhDQo+Pj4gZGVmYXVsdD8gRGlzdHJpYnV0aW9u
cyB3aWxsIHNldCBpdCB0byB0aGUgdmFsdWUgdGhleSBuZWVkL3dhbnQuIFRoZSB2ZXJ5DQo+
Pj4gZmV3IHBlb3BsZSB0aGF0IGJ1aWxkIHRoZWlyIG93biBrZXJuZWxzIHRvIGdldCBjZXJ0
YWluIGZiZGV2IGRyaXZlcnMNCj4+PiB3aWxsIGNlcnRhaW5seSBiZSBhYmxlIHRvIGVuYWJs
ZSB0aGUgb3B0aW9uIGJ5IGhhbmQgYXMgd2VsbC4NCj4+DQo+PiBEZWZhdWx0aW5nIHRvICJu
IiAodGhlIGRlZmF1bHQpIG1lYW5zIGNhdXNpbmcgcmVncmVzc2lvbnMgd2hlbiB0aGVzZQ0K
Pj4gZmV3IHBlb3BsZSB1c2UgYW4gZXhpc3RpbmcgZGVmY29uZmlnLg0KPj4NCj4gDQo+IEhh
dmluZyAiZGZhdWx0IHkgaWYgIURSTSIgbWFrZXMgc2Vuc2UgdG8gbWUuIEkgZ3Vlc3MgaXMg
YSBjb3JuZXIgY2FzZSBidXQNCj4gYXQgbGVhc3QgaXQgd29uJ3Qgc2lsZW50bHkgYmUgZGlz
YWJsZWQgZm9yIHVzZXJzIHRoYXQgb25seSB3YW50IGZiZGV2IGFzDQo+IEdlZXJ0IG1lbnRp
b25lZC4NCg0KSU1ITyB0aGUgcmF0aW9uYWwgYmVoaW5kIHN1Y2ggY29uZGl0aW9uYWxzIGFy
ZSBtb3N0bHkgd2hhdCAid2UgbWFrZSB1cCANCmhlcmUgaW4gdGhlIGRpc2N1c3Npb24iLCBi
dXQgbm90IHNvbWV0aGluZyBiYXNlZCBvbiByZWFsLXdvcmxkIGZlZWRiYWNrLiANClNvIEkn
ZCBzdHJvbmdseSBwcmVmZXIgYSBjbGVhciBuIG9yIHkgc2V0dGluZyBoZXJlLg0KDQo+IA0K
PiBJIHdvdWxkbid0IGNhbGwgaXQgYSByZWdyZXNzaW9uIHRob3VnaCwgYmVjYXVzZSBBRkFJ
SyB0aGUgS2NvbmZpZyBvcHRpb25zDQo+IGFyZSBub3QgYSBzdGFibGUgQVBJID8NCg0KSUlS
QyBpbiB0aGUgcGFzdCB0aGVyZSBoYXZlIGJlZW4gY29uY2VybnMgYWJvdXQgY2hhbmdpbmcg
S2NvbmZpZyANCmRlZmF1bHRzLiBJZiB3ZSBnbyB3aXRoICJkZWZhdWx0IG4iLCB3ZSdkIGFw
cGFyZW50bHkgZG8gc29tZXRoaW5nIHNpbWlsYXIuDQoNCj4gDQo+Pj4+IE9yIHJlc2VydmUg
IkZCIiBmb3IgcmVhbCBmYmRldiBkcml2ZXJzLCBhbmQgaW50cm9kdWNlIGEgbmV3IEZCX0NP
UkUsDQo+Pj4+IHRvIGJlIHNlbGVjdGVkIGJ5IGJvdGggRkIgYW5kIERSTV9GQkRFVl9FTVVM
QVRJT04/DQo+Pj4+IFRoZW4gRkJfREVWSUNFIGNhbiBkZXBlbmQgb24gRkJfQ09SRSwgYW5k
IGRlZmF1bHQgdG8geSBpZiBGQi4NCj4gDQo+IEZ1bm55IHRoYXQgeW91IG1lbnRpb24gYmVj
YXVzZSBpdCdzIGV4YWN0bHkgd2hhdCBJIGF0dGVtcHRlZCBpbiB0aGUgcGFzdDoNCj4gDQo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMDgyNzEwMDUzMS4xNTc4NjA0LTEt
amF2aWVybUByZWRoYXQuY29tL1QvI3UNCj4gDQo+Pj4NCj4+PiBUaGF0IHdvdWxkbid0IHdv
cmsuIEluIFR1bWJsZXdlZWQsIHdlIHN0aWxsIGhhdmUgZWZpZmIgYW5kIHZlc2FmYg0KPj4+
IGVuYWJsZWQgdW5kZXIgY2VydGFpbiBjb25kaXRpb25zOyBtZXJlbHkgZm9yIHRoZSBrZXJu
ZWwgY29uc29sZS4gV2UnZA0KPj4+IGhhdmUgdG8gZW5hYmxlIENPTkZJR19GQiwgd2hpY2gg
d291bGQgYnJpbmcgYmFjayB0aGUgZGV2aWNlLg0KPj4NCj4+ICJEZWZhdWx0IHkiIGRvZXMg
bm90IG1lYW4gdGhhdCB5b3UgY2Fubm90IGRpc2FibGUgRkJfREVWSUNFLCBzbw0KPj4geW91
IGFyZSBub3QgZm9yY2VkIHRvIGJyaW5nIGJhY2sgdGhlIGRldmljZT8NCj4+DQo+IA0KPiBJ
IHRoaW5rIHdlIGNhbiBoYXZlIGJvdGggdG8gbWFrZSB0aGUga2VybmVsIG1vcmUgY29uZmln
dXJhYmxlOg0KPiANCj4gMSkgQWxsb3cgdG8gb25seSBkaXNhYmxlIGZiZGV2IHVzZXItc3Bh
Y2UgQVBJcyAoL2Rldi9mYj8sIC9wcm9jL2ZiLCBldGMpLA0KPiAgICAgd2hpY2ggaXMgd2hh
dCB0aGUgc2VyaWVzIGlzIGRvaW5nIHdpdGggdGhlIG5ldyBGQl9ERVZJQ0UgY29uZmlnIHN5
bWJvbC4NCj4gDQo+IDIpIEFsbG93IHRvIGRpc2FibGUgYWxsICJuYXRpdmUiIGZiZGV2IGRy
aXZlcnMgYW5kIG9ubHkga2VlcCB0aGUgRFJNIGZiZGV2DQo+ICAgICBlbXVsYXRpb24gbGF5
ZXIuIFRoYXQncyB3aGF0IG15IHNlcmllcyBhdHRlbXB0ZWQgdG8gZG8gd2l0aCB0aGUgRkJf
Q09SRQ0KPiAgICAgS2NvbmZpZyBzeW1ib2wuDQo+IA0KPiBJIGJlbGlldmUgdGhhdCB0aGVy
ZSBhcmUgdXNlIGNhc2VzIGZvciBib3RoLCBmb3IgZXhhbXBsZSBhcyBUaG9tYXMnIHNhaWQN
Cj4gbWFueSBkaXN0cm9zIGFyZSBkaXNhYmxpbmcgYWxsIHRoZSBmYmRldiBkcml2ZXJzIGFu
ZCB0aGVpciB1c2VyLXNwYWNlIG9ubHkNCj4gcmVxdWlyZXMgRFJNL0tNUywgc28gbWFrZXMg
c2Vuc2UgdG8gbm90IGV4cG9zZSBhbnkgZmJkZXYgdUFQSSBhdCBhbGwuDQo+IA0KPiBCdXQg
bWF5IGJlIHRoYXQgb3RoZXIgdXNlcnMgd2FudCB0aGUgb3Bwb3NpdGUsIHRoZXkgaGF2ZSBh
biBvbGQgdXNlci1zcGFjZQ0KPiB0aGF0IHJlcXVpcmVzIGZiZGV2LCBidXQgaXMgcnVubmlu
ZyBvbiBuZXdlciBoYXJkd2FyZSB0aGF0IG9ubHkgaGF2ZSBhIERSTQ0KPiBkcml2ZXIuIFNv
IHRoZXkgd2lsbCB3YW50IERSTSBmYmRldiBlbXVsYXRpb24gYnV0IG5vbmUgZmJkZXYgZHJp
dmVyIGF0IGFsbC4NCj4gDQo+IFRoYXQncyB3aHkgSSB0aGluayB0aGF0IEZCX0RFVklDRSBh
bmQgRkJfQ09SRSBhcmUgY29tcGxlbWVudGFyeSBhbmQgd2UgY2FuDQo+IHN1cHBvcnQgYW55
IGNvbWJpbmF0aW9uIG9mIHRoZSB0d28sIGlmIHlvdSBhZ3JlZSB0aGVyZSBhcmUgdXNlcyBm
b3IgZWl0aGVyLg0KDQpJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgdGhlIHZhbHVlIG9mIHN1
Y2ggYW4gZXh0cmEgY29tcGlsZS10aW1lIG9wdGlvbj8gDQogIEVpdGhlciB5b3UgaGF2ZSBm
YmRldiB1c2Vyc3BhY2UsIHRoZW4geW91IHdhbnQgdGhlIGRldmljZTsgb3IgeW91IA0KZG9u
J3QgdGhlbiBpdCdzIGJldHRlciB0byBkaXNhYmxlIGl0IGVudGlyZWx5LiBJIGRvbid0IHNl
ZSBtdWNoIG9mIGEgDQpkaWZmZXJlbmNlIGJldHdlZW4gRFJNIGFuZCBmYmRldiBkcml2ZXJz
IGhlcmUuDQoNCkknZCBhbHNvIHF1ZXN0aW9uIHRoZSBhcmd1bWVudCB0aGF0IHRoZXJlJ3Mg
ZXZlbiBmYmRldiB1c2Vyc3BhY2Ugb3V0IA0KdGhlcmUuIEl0IHdhcyBuZXZlciBwb3B1bGFy
IGluIGl0J3MgaGV5ZGF5IGFuZCBkZWZpbml0ZWx5IGhhc24ndCANCmltcHJvdmVkIHNpbmNl
IHRoZW4uIEV2ZW4gdGhlIDMgcGVvcGxlIHdobyBzdGlsbCBhc2sgZm9yIGZiZGV2IHN1cHBv
cnQgDQpoZXJlIG9ubHkgc2VlbSB0byBjYXJlIGFib3V0IHRoZSBwZXJmb3JtYW5jZSBvZiB0
aGUgZnJhbWVidWZmZXIgY29uc29sZSwgDQpidXQgbmV2ZXIgYWJvdXQgdXNlcnNwYWNlLg0K
DQpTbyBJJ2QgbGlrZSB0byBwcm9wb3NlIGEgZGlmZmVyZW50IHNvbHV0aW9uOiBvbiB0b3Ag
b2YgdGhlIGN1cnJlbnQgDQpwYXRjaHNldCwgbGV0J3MgbWFrZSBhbiBmYmRldiBtb2R1bGUg
b3B0aW9uIHRoYXQgZW5hYmxlcyB0aGUgZGV2aWNlLiBJZiANCkNPTkZJR19GQl9ERVZJQ0Ug
aGFzIGJlZW4gZW5hYmxlZCwgdGhlIG9wdGlvbiB3b3VsZCBzd2l0Y2ggdGhlIA0KZnVuY3Rp
b25hbGl0eSBvbiBhbmQgb2ZmLiBBIEtjb25maWcgb3B0aW9uIHdvdWxkIHNldCB0aGUgZGVm
YXVsdC4gIFdpdGggDQpzdWNoIGEgc2V0dXAsIGRpc3RyaWJ1dGlvbnMgY2FuIGRpc2FibGUg
dGhlIGZiZGV2IGRldmljZSBieSBkZWZhdWx0LiANCkFuZCB0aGUgZmV3IHVzZXJzIHdpdGgg
dGhlIG9kZCBzeXN0ZW0gdGhhdCBoYXMgZmJkZXYgdXNlcnNwYWNlIGNhbiBzdGlsbCANCmVu
YWJsZSB0aGUgZmJkZXYgZGV2aWNlIGF0IGJvb3QgdGltZS4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rl
diwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJC
IDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------yetloRvem6ZjL7j2qRdsHdH0--

--------------fr72hGe0H9cuMk5ZNtgmOcYw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSC0CwFAwAAAAAACgkQlh/E3EQov+C9
4g/7Bd0l76fbA6Nipn+zezgJ3XBGdrypbbDKVi8kiPYkfNnPVruTtbl39yjRR0LXk34+foaJjefL
KRcB7yiMSsWHuYBwjB091M6bq4UNCJ+FLfQKYZIL0YRB3mbZIEcDWkLT3EkylQmhQCgC3lIJU9bt
2lX9Y83W09AWQGaBi+3pZbjvITdR6VhEXnwzRLBCuYSH3LLgFlBYW1oFiuS+D/2w5l95ezxA0o0e
0Rw+BZJ9Kpb3kLe24Cyst+fH6Khy1KlLTGGwqOEPMwZdHZg6ktDDT09W6324JwPTYFq9+JtsTSig
sz/VG4T/a2H7Ncpbo6QSUz2Veq8E11/5oU23aa8+v1mTMbEL6U2YAHlDHJiWqjm5iurA9hOD0FRV
lwOBQl/L7ytltmWSZNNPUNObjvx6nffgsN+hrP5YuACBL1f8Ianno0TFRNV36zh8RXWKTxYi2Q8I
aj+V4hTtLi3/7tM+AcyFgcsSSYyNr8YDswn39LHYLTtvLN2T/9qS+MRabIq0r5ZP4coUaRS5xYti
cZScMN4iOdAIcYh/TXGBP0zCup1A+cF6A50VZldiqGSnG6+La6m96FTRAstxfnG/G8q4HCJ2oYvg
nCVjS0gTXv5CrmkKqnIyJ0mBfSBoT3uO/GClS3QceFor+vcZRblvS+cK9RAXA63x7fvOLEed8vpi
cPU=
=N80a
-----END PGP SIGNATURE-----

--------------fr72hGe0H9cuMk5ZNtgmOcYw--
