Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F3F49C58D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 09:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22AE10E7BD;
	Wed, 26 Jan 2022 08:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F41010E7BD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 08:52:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78C56212BC;
 Wed, 26 Jan 2022 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643187130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rc8dMSAZuYIDxITwqoTP0fP7jdQ30Yfrvx+aVOSn6Qg=;
 b=Pkj55ILhmrUQwB9PALHh3Zr/MXSo/tH4A/sIOZG9PiYFsFw2aFo3ycFzUb01fEfp3NsN6I
 u2J9GNKmEe1nQF6Me1iX3Bl1DOQKhyvCPNFcNCtBc1gzFD7Sit4QKNVa7XfBXRM+1fo4Vk
 PBxQ+1c3/Lsqa3A/pO1HF09YnUVY3sU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643187130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rc8dMSAZuYIDxITwqoTP0fP7jdQ30Yfrvx+aVOSn6Qg=;
 b=Jf3sCNxT8LDoeDgoppBCMaI8rzvDXaMgBRTBcw7/c9Q/OSZjQLz3KiBOWX/u4Sf7FCQjTR
 gPG5WnOcDSTF04Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2893013B8A;
 Wed, 26 Jan 2022 08:52:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 12jYCLoL8WEPNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jan 2022 08:52:10 +0000
Message-ID: <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
Date: Wed, 26 Jan 2022 09:52:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Carlis <zhangxuezhi1@yulong.com>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ss4IOWOs2evvOxKOaeaeEM4j"
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
Cc: Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
 Michael Hennerich <michael.hennerich@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ss4IOWOs2evvOxKOaeaeEM4j
Content-Type: multipart/mixed; boundary="------------KBDUPyVWBHxZZLIASLWqyLo0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Carlis <zhangxuezhi1@yulong.com>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Helge Deller <deller@gmx.de>, Andy Shevchenko <andy@kernel.org>
Message-ID: <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>

--------------KBDUPyVWBHxZZLIASLWqyLo0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDEuMjIgdW0gMjE6MjEgc2NocmllYiBBbmR5IFNoZXZjaGVua286DQo+
IFNpbmNlIHdlIGdvdCBhIG1haW50YWluZXIgZm9yIGZiZGV2LCBJIHdvdWxkIGxpa2UgdG8N
Cj4gdW5vcnBoYW4gZmJ0ZnQgKHdpdGggdGhlIGlkZWEgb2Ygc2VuZGluZyBQUnMgdG8gSGVs
Z2UpDQo+IGFuZCBtb3ZlIGl0IG91dCBvZiBzdGFnaW5nIHNpbmNlIHRoZXJlIGlzIG5vIG1v
cmUgY2xlYW4NCj4gdXAgd29yayBleHBlY3RlZCBhbmQgbm8gbW9yZSBkcml2ZXJzIGVpdGhl
ci4NCj4gDQo+IFRob3VnaHRzPw0KDQpCdXQgd2h5PyBXZSBhbHJlYWR5IGhhdmUgRFJNIGRy
aXZlcnMgZm9yIHNvbWUgb2YgdGhlc2UgZGV2aWNlcy4gUG9ydGluZyANCnRoZSBvdGhlcnMg
dG8gRFJNIGlzIHN1Y2ggYSBiZXR0ZXIgbG9uZy10ZXJtIHBsYW4uICBPVE9ILCBhcyBubyBv
bmUgaGFzIA0Kc2hvd24gdXAgYW5kIGNvbnZlcnRlZCB0aGVtLCBtYXliZSB0aGV5IHNob3Vs
ZCBiZSBsZWZ0IGRlYWQgb3IgcmVtb3ZlZCANCmVudGlyZWx5Lg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KPiBBbmR5IFNoZXZjaGVua28gKDQpOg0KPiAgICBmYnRmdDogVW5v
cnBoYW4gdGhlIGRyaXZlcg0KPiAgICBmYnRmdDogTW92ZSBkcml2ZXIgb3V0IGZyb20gc3Rh
Z2luZw0KPiAgICBmYnRmdDogS2lsbCBvdXRkYXRlZCBkb2N1bWVudGF0aW9uDQo+ICAgIGZi
dGZ0OiBSZXBsYWNlICdkZXBlbmRzIG9uIEZCX1RGVCcgYnkgJ2lmIEZCX1RGVCAuLi4gZW5k
aWYnDQo+IA0KPiAgIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA2ICsrLS0NCj4gICBkcml2ZXJzL3N0YWdpbmcvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiAtLQ0KPiAgIGRyaXZlcnMvc3RhZ2luZy9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvUkVB
RE1FICAgICAgICAgICAgICAgICAgfCAzMiAtLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBkcml2
ZXJzL3N0YWdpbmcvZmJ0ZnQvVE9ETyAgICAgICAgICAgICAgICAgICAgfCAgMyAtLQ0KPiAg
IGRyaXZlcnMvdmlkZW8vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsN
Cj4gICBkcml2ZXJzL3ZpZGVvL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSArDQo+ICAgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvS2NvbmZpZyAgICAg
IHwgMzMgKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlk
ZW99L2ZidGZ0L01ha2VmaWxlICAgICB8ICAwDQo+ICAgLi4uL3tzdGFnaW5nID0+IHZpZGVv
fS9mYnRmdC9mYl9hZ20xMjY0ay1mbC5jIHwgIDANCj4gICAuLi4ve3N0YWdpbmcgPT4gdmlk
ZW99L2ZidGZ0L2ZiX2JkNjYzNDc0LmMgICAgfCAgMA0KPiAgIC4uLi97c3RhZ2luZyA9PiB2
aWRlb30vZmJ0ZnQvZmJfaHg4MzQwYm4uYyAgICB8ICAwDQo+ICAgZHJpdmVycy97c3RhZ2lu
ZyA9PiB2aWRlb30vZmJ0ZnQvZmJfaHg4MzQ3ZC5jIHwgIDANCj4gICBkcml2ZXJzL3tzdGFn
aW5nID0+IHZpZGVvfS9mYnRmdC9mYl9oeDgzNTNkLmMgfCAgMA0KPiAgIGRyaXZlcnMve3N0
YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ZiX2h4ODM1N2QuYyB8ICAwDQo+ICAgZHJpdmVycy97
c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfaHg4MzU3ZC5oIHwgIDANCj4gICBkcml2ZXJz
L3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYl9pbGk5MTYzLmMgfCAgMA0KPiAgIGRyaXZl
cnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ZiX2lsaTkzMjAuYyB8ICAwDQo+ICAgZHJp
dmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfaWxpOTMyNS5jIHwgIDANCj4gICBk
cml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYl9pbGk5MzQwLmMgfCAgMA0KPiAg
IGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ZiX2lsaTkzNDEuYyB8ICAwDQo+
ICAgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfaWxpOTQ4MS5jIHwgIDAN
Cj4gICBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYl9pbGk5NDg2LmMgfCAg
MA0KPiAgIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ZiX3BjZDg1NDQuYyB8
ICAwDQo+ICAgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfcmE4ODc1LmMg
IHwgIDANCj4gICBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYl9zNmQwMmEx
LmMgfCAgMA0KPiAgIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ZiX3M2ZDEx
MjEuYyB8ICAwDQo+ICAgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfc2Vw
czUyNS5jIHwgIDANCj4gICBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYl9z
aDExMDYuYyAgfCAgMA0KPiAgIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2Zi
X3NzZDEyODkuYyB8ICAwDQo+ICAgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQv
ZmJfc3NkMTMwNS5jIHwgIDANCj4gICBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRm
dC9mYl9zc2QxMzA2LmMgfCAgMA0KPiAgIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2Zi
dGZ0L2ZiX3NzZDEzMjUuYyB8ICAwDQo+ICAgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRlb30v
ZmJ0ZnQvZmJfc3NkMTMzMS5jIHwgIDANCj4gICBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVv
fS9mYnRmdC9mYl9zc2QxMzUxLmMgfCAgMA0KPiAgIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlk
ZW99L2ZidGZ0L2ZiX3N0NzczNXIuYyB8ICAwDQo+ICAgZHJpdmVycy97c3RhZ2luZyA9PiB2
aWRlb30vZmJ0ZnQvZmJfc3Q3Nzg5di5jIHwgIDANCj4gICBkcml2ZXJzL3tzdGFnaW5nID0+
IHZpZGVvfS9mYnRmdC9mYl90aW55bGNkLmMgfCAgMA0KPiAgIGRyaXZlcnMve3N0YWdpbmcg
PT4gdmlkZW99L2ZidGZ0L2ZiX3RsczgyMDQuYyB8ICAwDQo+ICAgZHJpdmVycy97c3RhZ2lu
ZyA9PiB2aWRlb30vZmJ0ZnQvZmJfdWMxNjExLmMgIHwgIDANCj4gICBkcml2ZXJzL3tzdGFn
aW5nID0+IHZpZGVvfS9mYnRmdC9mYl91YzE3MDEuYyAgfCAgMA0KPiAgIC4uLi97c3RhZ2lu
ZyA9PiB2aWRlb30vZmJ0ZnQvZmJfdXBkMTYxNzA0LmMgICB8ICAwDQo+ICAgZHJpdmVycy97
c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJ0ZnQtYnVzLmMgIHwgIDANCj4gICBkcml2ZXJz
L3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYnRmdC1jb3JlLmMgfCAgMA0KPiAgIGRyaXZl
cnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ZidGZ0LWlvLmMgICB8ICAwDQo+ICAgLi4u
L3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYnRmdC1zeXNmcy5jICAgIHwgIDANCj4gICBk
cml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYnRmdC5oICAgICAgfCAgMA0KPiAg
IGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ludGVybmFsLmggICB8ICAwDQo+
ICAgNDggZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNjkgZGVsZXRpb25zKC0p
DQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9SRUFETUUN
Cj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zdGFnaW5nL2ZidGZ0L1RPRE8NCj4g
ICByZW5hbWUgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvS2NvbmZpZyAoODkl
KQ0KPiAgIHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9NYWtlZmls
ZSAoMTAwJSkNCj4gICByZW5hbWUgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQv
ZmJfYWdtMTI2NGstZmwuYyAoMTAwJSkNCj4gICByZW5hbWUgZHJpdmVycy97c3RhZ2luZyA9
PiB2aWRlb30vZmJ0ZnQvZmJfYmQ2NjM0NzQuYyAoMTAwJSkNCj4gICByZW5hbWUgZHJpdmVy
cy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfaHg4MzQwYm4uYyAoMTAwJSkNCj4gICBy
ZW5hbWUgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfaHg4MzQ3ZC5jICgx
MDAlKQ0KPiAgIHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYl9o
eDgzNTNkLmMgKDEwMCUpDQo+ICAgcmVuYW1lIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99
L2ZidGZ0L2ZiX2h4ODM1N2QuYyAoMTAwJSkNCj4gICByZW5hbWUgZHJpdmVycy97c3RhZ2lu
ZyA9PiB2aWRlb30vZmJ0ZnQvZmJfaHg4MzU3ZC5oICgxMDAlKQ0KPiAgIHJlbmFtZSBkcml2
ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYl9pbGk5MTYzLmMgKDEwMCUpDQo+ICAg
cmVuYW1lIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ZiX2lsaTkzMjAuYyAo
MTAwJSkNCj4gICByZW5hbWUgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJf
aWxpOTMyNS5jICgxMDAlKQ0KPiAgIHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVv
fS9mYnRmdC9mYl9pbGk5MzQwLmMgKDEwMCUpDQo+ICAgcmVuYW1lIGRyaXZlcnMve3N0YWdp
bmcgPT4gdmlkZW99L2ZidGZ0L2ZiX2lsaTkzNDEuYyAoMTAwJSkNCj4gICByZW5hbWUgZHJp
dmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfaWxpOTQ4MS5jICgxMDAlKQ0KPiAg
IHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYl9pbGk5NDg2LmMg
KDEwMCUpDQo+ICAgcmVuYW1lIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2Zi
X3BjZDg1NDQuYyAoMTAwJSkNCj4gICByZW5hbWUgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRl
b30vZmJ0ZnQvZmJfcmE4ODc1LmMgKDEwMCUpDQo+ICAgcmVuYW1lIGRyaXZlcnMve3N0YWdp
bmcgPT4gdmlkZW99L2ZidGZ0L2ZiX3M2ZDAyYTEuYyAoMTAwJSkNCj4gICByZW5hbWUgZHJp
dmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfczZkMTEyMS5jICgxMDAlKQ0KPiAg
IHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYl9zZXBzNTI1LmMg
KDEwMCUpDQo+ICAgcmVuYW1lIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2Zi
X3NoMTEwNi5jICgxMDAlKQ0KPiAgIHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVv
fS9mYnRmdC9mYl9zc2QxMjg5LmMgKDEwMCUpDQo+ICAgcmVuYW1lIGRyaXZlcnMve3N0YWdp
bmcgPT4gdmlkZW99L2ZidGZ0L2ZiX3NzZDEzMDUuYyAoMTAwJSkNCj4gICByZW5hbWUgZHJp
dmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfc3NkMTMwNi5jICgxMDAlKQ0KPiAg
IHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9mYl9zc2QxMzI1LmMg
KDEwMCUpDQo+ICAgcmVuYW1lIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2Zi
X3NzZDEzMzEuYyAoMTAwJSkNCj4gICByZW5hbWUgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRl
b30vZmJ0ZnQvZmJfc3NkMTM1MS5jICgxMDAlKQ0KPiAgIHJlbmFtZSBkcml2ZXJzL3tzdGFn
aW5nID0+IHZpZGVvfS9mYnRmdC9mYl9zdDc3MzVyLmMgKDEwMCUpDQo+ICAgcmVuYW1lIGRy
aXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ZiX3N0Nzc4OXYuYyAoMTAwJSkNCj4g
ICByZW5hbWUgZHJpdmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfdGlueWxjZC5j
ICgxMDAlKQ0KPiAgIHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9m
Yl90bHM4MjA0LmMgKDEwMCUpDQo+ICAgcmVuYW1lIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlk
ZW99L2ZidGZ0L2ZiX3VjMTYxMS5jICgxMDAlKQ0KPiAgIHJlbmFtZSBkcml2ZXJzL3tzdGFn
aW5nID0+IHZpZGVvfS9mYnRmdC9mYl91YzE3MDEuYyAoMTAwJSkNCj4gICByZW5hbWUgZHJp
dmVycy97c3RhZ2luZyA9PiB2aWRlb30vZmJ0ZnQvZmJfdXBkMTYxNzA0LmMgKDEwMCUpDQo+
ICAgcmVuYW1lIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ZidGZ0LWJ1cy5j
ICgxMDAlKQ0KPiAgIHJlbmFtZSBkcml2ZXJzL3tzdGFnaW5nID0+IHZpZGVvfS9mYnRmdC9m
YnRmdC1jb3JlLmMgKDEwMCUpDQo+ICAgcmVuYW1lIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlk
ZW99L2ZidGZ0L2ZidGZ0LWlvLmMgKDEwMCUpDQo+ICAgcmVuYW1lIGRyaXZlcnMve3N0YWdp
bmcgPT4gdmlkZW99L2ZidGZ0L2ZidGZ0LXN5c2ZzLmMgKDEwMCUpDQo+ICAgcmVuYW1lIGRy
aXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ZidGZ0LmggKDEwMCUpDQo+ICAgcmVu
YW1lIGRyaXZlcnMve3N0YWdpbmcgPT4gdmlkZW99L2ZidGZ0L2ludGVybmFsLmggKDEwMCUp
DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------KBDUPyVWBHxZZLIASLWqyLo0--

--------------ss4IOWOs2evvOxKOaeaeEM4j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHxC7kFAwAAAAAACgkQlh/E3EQov+DO
eg/7Bn43gM75WL77a8UiXci9TjV2bCpDOQr6aC2L8J5Lt0M5lKjoVWZjqvAPXqeJjmyDVC5ycEN6
mCDBB+oUD/BxffmaibHSzhU0v8Y1HLRu8E6QuNU1Kr+T7PaX5MBZYJTcSPEtswHOVNkcDBl/1c2A
egUrbWRxwcoCw+gv0W5dAFEbml4pQquQEebH7NSQjgl3cWhEH9Jt8uGMcYTWA91P+D2fuTAvnisb
s18nUo3Z5hH/S5smxEHRn+ENRo+lNtG/wST8I/xBsq7aeumeHSK7c2ES5i1goiv2i53QqqgZttmi
LXwCzNyYrLg1c4uL7MgrU7WornhXG19XxMrW/ppmBZEr8lH/Z4L8RqbCq0RY/tJ44qawmYHCqnym
Q7iUwr+i78tRd9s/Bx18cGM3RwgKgPUdI8I9kRrHKeWLmhYXVgYFUK7rgtSHcWqBYDA+ko1EfOUd
lVMDkF477XYnVXjkgdx3eIP/GgXMxp4Y6u5aQvlxFQSl//JmiRVEWdSqmTATc8iUW2RTlIvUiECJ
vwLpVA4V6JaG0+oiAvbmA2NvSBEzG9fw1z751hBa66YFfG2Cl/jZOYHD7Uv5bArRs/enBYq7avEF
M0vo8GAn0d8bsUX4QjRYVkGgGeunxlHZYkHGoEhgeJ3zl96TTHB3c+4mKXJaSlIlMh++RtOpPcbh
1WA=
=xJph
-----END PGP SIGNATURE-----

--------------ss4IOWOs2evvOxKOaeaeEM4j--
