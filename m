Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5B5386B3
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 19:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7706410F3DA;
	Mon, 30 May 2022 17:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B1510F3D6;
 Mon, 30 May 2022 17:20:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8199121B8D;
 Mon, 30 May 2022 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653931255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CJyIwtAg/jNa1Bodfbo+azB/rtZUEVRWLEsBdgvem4o=;
 b=eN/Aw00vrTRgT2BOLWw/JDT1z2FMyBqFCvkxqN047x6wpYqerwESI2flL/xN7tDuLPvq06
 LpvkVgYaCzMu+IeE48wBpFcfGNOlQ4jzxcVVTJ6wY+kAiLBH4boQq4buyH8h8rZuy48lnC
 1gHRYmoblI3jrbHuqMkEmFm5yfVeXw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653931255;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CJyIwtAg/jNa1Bodfbo+azB/rtZUEVRWLEsBdgvem4o=;
 b=jm5Dgvsqv9X8LG2KtQkUe8+T4CEetvyfUp60KRcgK+WUlrWPWdY3gsxs+oxXspCckBf9e5
 dTkQnlswuSkNQJCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5115F13AFD;
 Mon, 30 May 2022 17:20:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8KXREvf8lGIbKAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 30 May 2022 17:20:55 +0000
Message-ID: <df7de69a-47b3-1a28-f673-8f9a94f70a97@suse.de>
Date: Mon, 30 May 2022 19:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/prime: Ensure mmap offset is initialized
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20220529162936.2539901-1-robdclark@gmail.com>
 <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
 <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>
 <CAKMK7uG9=EcmD4hPqm4zYsDHiS9Mr=y_5tUa_R1veDxSSK-P-Q@mail.gmail.com>
 <CAF6AEGuLeLmD4m+yi5csGdb0XZbnAOfYOKx6c-wEgMGt6rj7Cw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAF6AEGuLeLmD4m+yi5csGdb0XZbnAOfYOKx6c-wEgMGt6rj7Cw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------F0cE3sBzn3h7KklEgauifnUx"
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------F0cE3sBzn3h7KklEgauifnUx
Content-Type: multipart/mixed; boundary="------------VCCzzrsxShmwjk0tRjIOQdtW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 freedreno <freedreno@lists.freedesktop.org>
Message-ID: <df7de69a-47b3-1a28-f673-8f9a94f70a97@suse.de>
Subject: Re: [PATCH] drm/prime: Ensure mmap offset is initialized
References: <20220529162936.2539901-1-robdclark@gmail.com>
 <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
 <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>
 <CAKMK7uG9=EcmD4hPqm4zYsDHiS9Mr=y_5tUa_R1veDxSSK-P-Q@mail.gmail.com>
 <CAF6AEGuLeLmD4m+yi5csGdb0XZbnAOfYOKx6c-wEgMGt6rj7Cw@mail.gmail.com>
In-Reply-To: <CAF6AEGuLeLmD4m+yi5csGdb0XZbnAOfYOKx6c-wEgMGt6rj7Cw@mail.gmail.com>

--------------VCCzzrsxShmwjk0tRjIOQdtW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDUuMjIgdW0gMTc6NDEgc2NocmllYiBSb2IgQ2xhcms6DQo+IE9uIE1v
biwgTWF5IDMwLCAyMDIyIGF0IDc6NDkgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPiB3cm90ZToNCj4+DQo+PiBPbiBNb24sIDMwIE1heSAyMDIyIGF0IDE1OjU0LCBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+IHdyb3RlOg0KPj4+DQo+Pj4gT24gTW9uLCBN
YXkgMzAsIDIwMjIgYXQgMTI6MjYgQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+IHdyb3RlOg0KPj4+Pg0KPj4+PiBIaQ0KPj4+Pg0KPj4+PiBBbSAyOS4wNS4y
MiB1bSAxODoyOSBzY2hyaWViIFJvYiBDbGFyazoNCj4+Pj4+IEZyb206IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGNocm9taXVtLm9yZz4NCj4+Pj4+DQo+Pj4+PiBJZiBhIEdFTSBvYmplY3Qg
aXMgYWxsb2NhdGVkLCBhbmQgdGhlbiBleHBvcnRlZCBhcyBhIGRtYS1idWYgZmQgd2hpY2gg
aXMNCj4+Pj4+IG1tYXAnZCBiZWZvcmUgb3Igd2l0aG91dCB0aGUgR0VNIGJ1ZmZlciBiZWlu
ZyBkaXJlY3RseSBtbWFwJ2QsIHRoZQ0KPj4+Pj4gdm1hX25vZGUgY291bGQgYmUgdW5pdGlh
bGl6ZWQuICBUaGlzIGxlYWRzIHRvIGEgc2l0dWF0aW9uIHdoZXJlIHRoZSBDUFUNCj4+Pj4+
IG1hcHBpbmcgaXMgbm90IGNvcnJlY3RseSB0b3JuIGRvd24gaW4gZHJtX3ZtYV9ub2RlX3Vu
bWFwKCkuDQo+Pj4+DQo+Pj4+IFdoaWNoIGRyaXZlcnMgYXJlIGFmZmVjdGVkIGJ5IHRoaXMg
cHJvYmxlbT8NCj4+Pj4NCj4+Pj4gSSBjaGVja2VkIHNldmVyYWwgZHJpdmVycyBhbmQgbW9z
dCBhcHBlYXIgdG8gYmUgaW5pdGlhbGl6aW5nIHRoZSBvZmZzZXQNCj4+Pj4gZHVyaW5nIG9i
amVjdCBjb25zdHJ1Y3Rpb24sIHN1Y2ggYXMgR0VNIFNITUVNLiBbMV0gVFRNLWJhc2VkIGRy
aXZlcnMNCj4+Pj4gYWxzbyBzZWVtIHVuYWZmZWN0ZWQuIFsyXQ0KPj4+Pg0KPj4+PiAgIEZy
b20gYSBxdWljayBncmVwLCBvbmx5IGV0bmF2aXYsIG1zbSBhbmQgb21hcGRybSBhcHBlYXIg
dG8gYmUgYWZmZWN0ZWQ/DQo+Pj4+IFRoZXkgb25seSBzZWVtIHRvIHJ1biBkcm1fZ2VtX2Ny
ZWF0ZV9tbWFwX29mZnNldCgpIGZyb20gdGhlaXINCj4+Pj4gaW9jdGwtaGFuZGxpbmcgY29k
ZS4NCj4+Pj4NCj4+Pj4gSWYgc28sIEknZCBzYXkgaXQncyBwcmVmZXJhYmxlIHRvIGZpeCB0
aGVzZSBkcml2ZXJzIGFuZCBwdXQgYQ0KPj4+PiBkcm1fV0FSTl9PTkNFKCkgaW50byBkcm1f
Z2VtX3ByaW1lX21tYXAoKS4NCj4+Pg0KPj4+IFRoYXQgaXMgZ29vZCBpZiBmZXdlciBkcml2
ZXJzIGFyZSBhZmZlY3RlZCwgaG93ZXZlciBJIGRpc2FncmVlIHdpdGgNCj4+PiB5b3VyIHBy
b3Bvc2FsLiAgQXQgbGVhc3QgZm9yIGZyZWVkcmVubyB1c2Vyc3BhY2UsIGEgbG90IG9mIGJv
J3MgbmV2ZXINCj4+PiBnZXQgbW1hcCdkIChlaXRoZXIgZGlyZWN0bHkgb2YgdmlhIGRtYWJ1
ZiksIHNvIHdlIHNob3VsZCBub3QgYmUNCj4+PiBhbGxvY2F0aW5nIGEgbW1hcCBvZmZzZXQg
dW5uZWNlc3NhcmlseS4NCj4+DQo+PiBEb2VzIHRoaXMgYWN0dWFsbHkgbWF0dGVyIGluIHRo
ZSBncmFuZCBzY2hlbWUgb2YgdGhpbmdzPyBXZSBvcmlnaW5hbGx5DQo+PiBhbGxvY2F0ZWQg
bW1hcCBvZmZzZXQgb25seSBvbiBkZW1hbmQgYmVjYXVzZSB1c2Vyc3BhY2Ugb25seSBoYWQg
MzJiaXQNCj4+IGxvZmZfdCBzdXBwb3J0IGFuZCBzbyBzaW1wbHkgY291bGRuJ3QgbW1hcCBh
bnl0aGluZyBpZiB0aGUgb2Zmc2V0DQo+PiBlbmRlZCB1cCBhYm92ZSAzMmJpdCAoZXZlbiBp
ZiB0aGVyZSB3YXMgc3RpbGwgdmEgc3BhY2UgYXZhaWxhYmxlKS4NCj4+DQo+PiBCdXQgdGhv
c2UgZGF5cyBhcmUgbG9uZyBnb25lIChhYm91dCAxMCB5ZWFycyBvciBzbykgYW5kIHRoZSBh
bGxvY2F0aW9uDQo+PiBvdmVyaGVhZCBmb3IgYW4gbW1hcCBvZmZzZXQgaXMgdGlueS4gU28g
SSB0aGluayB1bmxlc3MgeW91IGNhbg0KPj4gYmVuY2htYXJrIGFuIGltcGFjdCBhbGxvY2F0
aW5nIGl0IGF0IGJvIGFsbG9jIHNlZW1zIGxpa2UgdGhlIHNpbXBsZXN0DQo+PiBkZXNpZ24g
b3ZlcmFsbCwgYW5kIGhlbmNlIHdoYXQgd2Ugc2hvdWxkIGJlIGRvaW5nLiBBbmQgaWYgdGhl
IHZtYQ0KPj4gb2Zmc2V0IGFsbG9jYXRpb24gZXZlcnkgZ2V0cyB0b28gc2xvdyBkdWUgdG8g
ZnJhZ21lbnRhdGlvbiB3ZSBjYW4gbGlmdA0KPj4gdGhlIGhvbGUgdHJlZSBmcm9tIGk5MTUg
aW50byBkcm1fbW0gYW5kIHRoZSBqb2Igc2hvdWxkIGJlIGRvbmUuIEF0DQo+PiB0aGF0IHBv
aW50IHdlIGNvdWxkIGFsc28gYWxsb2NhdGUgdGhlIG9mZnNldCB1bmNvbmRpdGlvbmFsbHkg
aW4gdGhlDQo+PiBnZW1faW5pdCBmdW5jdGlvbiBhbmQgYmUgZG9uZSB3aXRoIGl0Lg0KPj4N
Cj4+IElvdyBJIGNvbmN1ciB3aXRoIFRob21hcyBoZXJlLCB1bmxlc3MgdGhlcmUncyBoYXJk
IGRhdGEgY29udHJhcnkNCj4+IHNpbXBsaWNpdHkgaW1vIHRydW1wcyBoZXJlLg0KPiANCj4g
MzJiIHVzZXJzcGFjZSBpcyBzdGlsbCBhbGl2ZSBhbmQgd2VsbCwgYXQgbGVhc3Qgb24gYXJt
IGNocm9tZWJvb2tzIDstKQ0KDQpJIG1vc3RseSBkaXNsaWtlIHRoZSBpbmNvbnNpc3RlbmN5
IGFtb25nIGRyaXZlcnMuIElmIHdlIHdhbnQgdG8gY3JlYXRlIA0KdGhlIG9mZnNldCBvbi1k
ZW1hbmQgaW4gdGhlIERSTSBoZWxwZXJzLCB3ZSBzaG91bGQgZG8gc28gZm9yIGFsbCANCmRy
aXZlcnMuIEF0IGxlYXN0IG91ciBnZW5lcmljIEdFTSBoZWxwZXJzIGFuZCBUVE0gc2hvdWxk
IGltcGxlbWVudCB0aGlzIA0KcGF0dGVybi4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gQlIsDQo+IC1SDQo+IA0KPj4gLURhbmllbA0KPj4NCj4+Pg0KPj4+IEJSLA0KPj4+
IC1SDQo+Pj4NCj4+Pj4gQmVzdCByZWdhcmRzDQo+Pj4+IFRob21hcw0KPj4+Pg0KPj4+PiBb
MV0NCj4+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTgvc291cmNl
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jI0w4NQ0KPj4+PiBbMl0N
Cj4+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTgvc291cmNlL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMjTDEwMDINCj4+Pj4NCj4+Pj4+DQo+Pj4+PiBG
aXhlczogZTU1MTY1NTM5OTlmICgiZHJtOiBjYWxsIGRybV9nZW1fb2JqZWN0X2Z1bmNzLm1t
YXAgd2l0aCBmYWtlIG9mZnNldCIpDQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+DQo+Pj4+PiAtLS0NCj4+Pj4+IE5vdGUsIGl0J3Mg
cG9zc2libGUgdGhlIGlzc3VlIGV4aXN0ZWQgaW4gc29tZSByZWxhdGVkIGZvcm0gcHJpb3Ig
dG8gdGhlDQo+Pj4+PiBjb21taXQgdGFnZ2VkIHdpdGggRml4ZXMuDQo+Pj4+Pg0KPj4+Pj4g
ICAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgNSArKysrKw0KPj4+Pj4gICAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3By
aW1lLmMNCj4+Pj4+IGluZGV4IGUzZjA5ZjE4MTEwYy4uODQ5ZWVhMTU0ZGZjIDEwMDY0NA0K
Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jDQo+Pj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4+Pj4+IEBAIC03MTYsNiArNzE2LDExIEBA
IGludCBkcm1fZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPj4+Pj4gICAgICAgIHN0cnVjdCBmaWxlICpm
aWw7DQo+Pj4+PiAgICAgICAgaW50IHJldDsNCj4+Pj4+DQo+Pj4+PiArICAgICAvKiBFbnN1
cmUgdGhhdCB0aGUgdm1hX25vZGUgaXMgaW5pdGlhbGl6ZWQ6ICovDQo+Pj4+PiArICAgICBy
ZXQgPSBkcm1fZ2VtX2NyZWF0ZV9tbWFwX29mZnNldChvYmopOw0KPj4+Pj4gKyAgICAgaWYg
KHJldCkNCj4+Pj4+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+Pj4+ICsNCj4+Pj4+
ICAgICAgICAvKiBBZGQgdGhlIGZha2Ugb2Zmc2V0ICovDQo+Pj4+PiAgICAgICAgdm1hLT52
bV9wZ29mZiArPSBkcm1fdm1hX25vZGVfc3RhcnQoJm9iai0+dm1hX25vZGUpOw0KPj4+Pj4N
Cj4+Pj4NCj4+Pj4gLS0NCj4+Pj4gVGhvbWFzIFppbW1lcm1hbm4NCj4+Pj4gR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KPj4+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCj4+Pj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+
Pj4+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4+Pj4gR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0KPj4NCj4+DQo+Pg0KPj4gLS0NCj4+IERhbmllbCBWZXR0ZXINCj4+IFNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbg0KPj4gaHR0cDovL2Jsb2cuZmZ3
bGwuY2gNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------VCCzzrsxShmwjk0tRjIOQdtW--

--------------F0cE3sBzn3h7KklEgauifnUx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKU/PYFAwAAAAAACgkQlh/E3EQov+BE
VRAAhMnp4FXmobeRVKi/auHmYMhzxIXd3wN5GCgKn9X/yYQXI4LxaY9OPl6We/kvgmNu7y4AW0Jt
w4S7ciT3sZH18lqVwmJyv9AbUiL2w9toGAkMClmiiOTIvU0hbaHIaNfG6Z5CCFXAlhy4xbA/MNjH
XFA/lcstS35eZX7iyP/0KPReQYlh8wPLONP0VoWx7nI3WOt9JhTyrF4I6zrvl774E3pSEE4NwpOG
l6KE20g0qJrNaETInfLswBwOC6rO++x6Kd10DWC8DiTwV1Hw8BocS52LrDKS6KTaV0z9purJvvKP
GFOv3vOANT3xZTSe+DbgMEZLWSEMZjwl3MDBsGBLMaU1jsuljo+iE6RfceVxQHmTUAKrFssFJ2rm
JcvjgetAJj+8Osaf4lNy2kaj0N4cxDr2IEsSSxn/RBOdTCBn7IpB/Ws+X4dXzZ+uqhM9Jd77oKTu
tepsbP4UybbFaLAGxOttXIkWLPl4BBVB+/Mp9VYZARugG0CbmfXCbjiuGB6OqIXucGxov5QKQYbw
kYllsVq1wh5aM7CQv6H8zpc/ZNpe6HBEpwiYydI3S/Iti6J3rg0si9cC7VlsrIxFr04p7yUclFNZ
Ceza+TQTE2ixDK7qYxG/rZtp4fe6l1Q4XDWcb21lN9IJUpQ5KhLxyY4cbDrjZ0Q6IkYdrmyh+J0I
wxs=
=eWIu
-----END PGP SIGNATURE-----

--------------F0cE3sBzn3h7KklEgauifnUx--
