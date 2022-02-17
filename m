Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4234BA3D7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E4B10EB3B;
	Thu, 17 Feb 2022 14:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80D610EB3A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 14:58:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 76D96219A6;
 Thu, 17 Feb 2022 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645109916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gm/0DermuwZ9gOzpd7kCABJLyp4XfnHzwQRiRZkB4oQ=;
 b=zpLlnjR77rvzZfotVKgFeDgTl1XxYhh1OEr2Cgev9hvgfElxwdQl6NS9UGDW4NwNjnOziV
 XY4ZHceZ30we7knLBhJPSTf4d6QCFVQzqc4Qzh/Dmi0smGC784bGnrJHD8GxM2T1N90K/l
 DxMRfn5SQYRy0Nsk1HOynYCX+Q2Or3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645109916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gm/0DermuwZ9gOzpd7kCABJLyp4XfnHzwQRiRZkB4oQ=;
 b=IrgREaEWvJETlyocDyWC7JAUkgXxdeT7Z20MI5GzpaL+LgzOl6hTRAXdkA9zW4GzC82oXs
 Wn55OGpP0B/a0WCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B91B13C19;
 Thu, 17 Feb 2022 14:58:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OY6NDZxiDmKyTQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Feb 2022 14:58:36 +0000
Message-ID: <4e617aec-33b5-c437-9f69-ea2341d432b8@suse.de>
Date: Thu, 17 Feb 2022 15:58:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/8] drm/client: Use actual bpp when allocating frame
 buffers
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-5-geert@linux-m68k.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220215165226.2738568-5-geert@linux-m68k.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------f0rQO86WVT0bqVW7eV0DG68u"
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------f0rQO86WVT0bqVW7eV0DG68u
Content-Type: multipart/mixed; boundary="------------Po97X5mm8nlphmW9Hb2sl4W0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <4e617aec-33b5-c437-9f69-ea2341d432b8@suse.de>
Subject: Re: [PATCH 4/8] drm/client: Use actual bpp when allocating frame
 buffers
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-5-geert@linux-m68k.org>
In-Reply-To: <20220215165226.2738568-5-geert@linux-m68k.org>

--------------Po97X5mm8nlphmW9Hb2sl4W0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE1LjAyLjIyIHVtIDE3OjUyIHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOg0K
PiBXaGVuIGFsbG9jYXRpbmcgYSBmcmFtZSBidWZmZXIsIHRoZSBudW1iZXIgb2YgYml0cyBw
ZXIgcGl4ZWwgbmVlZGVkIGlzDQo+IGRlcml2ZWQgZnJvbSB0aGUgZGVwcmVjYXRlZCBkcm1f
Zm9ybWF0X2luZm8uY3BwW10gZmllbGQuICBXaGlsZSB0aGlzDQo+IHdvcmtzIGZvciBmb3Jt
YXRzIHVzaW5nIGxlc3MgdGhhbiA4IGJpdHMgcGVyIHBpeGVsLCBpdCBkb2VzIGxlYWQgdG8g
YQ0KPiBsYXJnZSBvdmVyYWxsb2NhdGlvbi4NCj4gDQo+IFJlZHVjZSBtZW1vcnkgY29uc3Vt
cHRpb24gYnkgdXNpbmcgdGhlIGFjdHVhbCBudW1iZXIgb2YgYml0cyBwZXIgcGl4ZWwNCj4g
aW5zdGVhZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+DQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9jbGll
bnQuYyB8IDQgKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
bGllbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMNCj4gaW5kZXggY2U0NWUz
ODBmNGEyMDI4Zi4uYzZhMjc5ZTNkZTk1NTkxYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9jbGllbnQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVu
dC5jDQo+IEBAIC0yNjQsNyArMjY0LDcgQEAgZHJtX2NsaWVudF9idWZmZXJfY3JlYXRlKHN0
cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50LCB1MzIgd2lkdGgsIHUzMiBoZWlnaHQsIHUN
Cj4gICANCj4gICAJZHVtYl9hcmdzLndpZHRoID0gd2lkdGg7DQo+ICAgCWR1bWJfYXJncy5o
ZWlnaHQgPSBoZWlnaHQ7DQo+IC0JZHVtYl9hcmdzLmJwcCA9IGluZm8tPmNwcFswXSAqIDg7
DQo+ICsJZHVtYl9hcmdzLmJwcCA9IGRybV9mb3JtYXRfaW5mb19icHAoaW5mbywgMCk7DQo+
ICAgCXJldCA9IGRybV9tb2RlX2NyZWF0ZV9kdW1iKGRldiwgJmR1bWJfYXJncywgY2xpZW50
LT5maWxlKTsNCj4gICAJaWYgKHJldCkNCj4gICAJCWdvdG8gZXJyX2RlbGV0ZTsNCj4gQEAg
LTM3Miw3ICszNzIsNyBAQCBzdGF0aWMgaW50IGRybV9jbGllbnRfYnVmZmVyX2FkZGZiKHN0
cnVjdCBkcm1fY2xpZW50X2J1ZmZlciAqYnVmZmVyLA0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0K
PiAgIAlpbmZvID0gZHJtX2Zvcm1hdF9pbmZvKGZvcm1hdCk7DQo+IC0JZmJfcmVxLmJwcCA9
IGluZm8tPmNwcFswXSAqIDg7DQo+ICsJZmJfcmVxLmJwcCA9IGRybV9mb3JtYXRfaW5mb19i
cHAoaW5mbywgMCk7DQo+ICAgCWZiX3JlcS5kZXB0aCA9IGluZm8tPmRlcHRoOw0KPiAgIAlm
Yl9yZXEud2lkdGggPSB3aWR0aDsNCj4gICAJZmJfcmVxLmhlaWdodCA9IGhlaWdodDsNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------Po97X5mm8nlphmW9Hb2sl4W0--

--------------f0rQO86WVT0bqVW7eV0DG68u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIOYpsFAwAAAAAACgkQlh/E3EQov+AW
Rw//d948853dyMKjbROEjrYtlfWMVu3qcdqypusUfh3f3MVC7Tcxph+vosESVBagX5+uyMf1JVt+
mHYOoCwp7jPAwKbPh/Ud9u4HgSwnMLhtkZ49AUXiQuoXgS6p/RkmuZZngjG9HW4ug7wmD/QNCbUd
D++fTZGniiPEDxRSSfn62sjjpZzj1gAb7p/Lsv2Jlrr1KNFeDN8ZqAtQXEZZnnXPnFM50jjkd1Eo
qztZBCMaoPAUhA6918S6y6LZnK16phhKlINhQtCNSh12u29YJ3XEMRQs1zIDHwmLEtvMWKLqf/tb
6/pufxrTMBcM4JU+NqgX7zg4XHbR3KLW9J4wp2Zk6x/BXG79VsG1AaxbPy9jjHQFrmciKW/7UCLG
3Vg1ISeVXH50XpqzTRO6HfBqygu+EWDI/0hzAn0Xol7tvnKOnPwQwHwQrfYORtBGhD5l8Y9hZfmt
t8DsNz9c7XdDCA401dS2jqEC5e6RHkxAeLnBoREppSg4azP0ymvecEtmZgFVPf/9KQM9b0tsSgoL
B3GDmZBFN996h2KdBwe0VJhJrKKoF1DjHpN08vBp631MqNh5Xa5nXtWhW764oWUevw+0ubzJRqqd
6/8Ux2LnWkQ6SYRJtwcpHSgwwDKB/SpuSVCFcFvB6cq9S0IuWvx1X86rKl0IAhori/7kTzEmu5LI
VJY=
=r5wF
-----END PGP SIGNATURE-----

--------------f0rQO86WVT0bqVW7eV0DG68u--
