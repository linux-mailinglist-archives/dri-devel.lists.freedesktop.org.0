Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE6537F08
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 16:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125D810E243;
	Mon, 30 May 2022 14:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2497D10E243;
 Mon, 30 May 2022 14:16:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE81F1F929;
 Mon, 30 May 2022 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653920170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tTii8oW6HgjN0H3GaZ7/EVE91VV1R88qvcxgCuUoU2E=;
 b=V8JHqsIBU7CZ3jLsLi0qfoXjUg8mpQpS6OUNpvrVIMUceLX6xlLgT7FoAiOmEspAFcYi0D
 J4H4OXMYzeh4rxkkKkxBBDzSqgOtundDUHHDrdZl0cNuasU4lAgJq1qdA/saS7kAgS6+kW
 buAZeSgjlib3rxiSg+e9aPVTXX8yUf0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653920170;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tTii8oW6HgjN0H3GaZ7/EVE91VV1R88qvcxgCuUoU2E=;
 b=tI7klourrQ4wJ4gHtcWrMRbopOavuf5zKO3GRhSMJGMXTW9KnHnVeQE5V0dZV/v+EswrkC
 Mrq13ySEfB7sZnDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D5E513A84;
 Mon, 30 May 2022 14:16:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yYasHarRlGLCTwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 30 May 2022 14:16:10 +0000
Message-ID: <6169ea6b-7452-e8e3-f253-1329f4924a67@suse.de>
Date: Mon, 30 May 2022 16:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/prime: Ensure mmap offset is initialized
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220529162936.2539901-1-robdclark@gmail.com>
 <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
 <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hc0fa0reMYQjQXwWx2Y0uhJE"
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
--------------hc0fa0reMYQjQXwWx2Y0uhJE
Content-Type: multipart/mixed; boundary="------------VdWsP9NZV1AcBf9IfDLiDlXf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 freedreno <freedreno@lists.freedesktop.org>
Message-ID: <6169ea6b-7452-e8e3-f253-1329f4924a67@suse.de>
Subject: Re: [PATCH] drm/prime: Ensure mmap offset is initialized
References: <20220529162936.2539901-1-robdclark@gmail.com>
 <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
 <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>
In-Reply-To: <CAF6AEGthAfWyAvbuE4EP+u52LEKS2Fs6X=gG8qUjc7gci6oh-A@mail.gmail.com>

--------------VdWsP9NZV1AcBf9IfDLiDlXf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDUuMjIgdW0gMTU6NDcgc2NocmllYiBSb2IgQ2xhcms6DQo+IE9uIE1v
biwgTWF5IDMwLCAyMDIyIGF0IDEyOjI2IEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToNCj4+DQo+PiBIaQ0KPj4NCj4+IEFtIDI5LjA1LjIyIHVt
IDE4OjI5IHNjaHJpZWIgUm9iIENsYXJrOg0KPj4+IEZyb206IFJvYiBDbGFyayA8cm9iZGNs
YXJrQGNocm9taXVtLm9yZz4NCj4+Pg0KPj4+IElmIGEgR0VNIG9iamVjdCBpcyBhbGxvY2F0
ZWQsIGFuZCB0aGVuIGV4cG9ydGVkIGFzIGEgZG1hLWJ1ZiBmZCB3aGljaCBpcw0KPj4+IG1t
YXAnZCBiZWZvcmUgb3Igd2l0aG91dCB0aGUgR0VNIGJ1ZmZlciBiZWluZyBkaXJlY3RseSBt
bWFwJ2QsIHRoZQ0KPj4+IHZtYV9ub2RlIGNvdWxkIGJlIHVuaXRpYWxpemVkLiAgVGhpcyBs
ZWFkcyB0byBhIHNpdHVhdGlvbiB3aGVyZSB0aGUgQ1BVDQo+Pj4gbWFwcGluZyBpcyBub3Qg
Y29ycmVjdGx5IHRvcm4gZG93biBpbiBkcm1fdm1hX25vZGVfdW5tYXAoKS4NCj4+DQo+PiBX
aGljaCBkcml2ZXJzIGFyZSBhZmZlY3RlZCBieSB0aGlzIHByb2JsZW0/DQo+Pg0KPj4gSSBj
aGVja2VkIHNldmVyYWwgZHJpdmVycyBhbmQgbW9zdCBhcHBlYXIgdG8gYmUgaW5pdGlhbGl6
aW5nIHRoZSBvZmZzZXQNCj4+IGR1cmluZyBvYmplY3QgY29uc3RydWN0aW9uLCBzdWNoIGFz
IEdFTSBTSE1FTS4gWzFdIFRUTS1iYXNlZCBkcml2ZXJzDQo+PiBhbHNvIHNlZW0gdW5hZmZl
Y3RlZC4gWzJdDQo+Pg0KPj4gICBGcm9tIGEgcXVpY2sgZ3JlcCwgb25seSBldG5hdml2LCBt
c20gYW5kIG9tYXBkcm0gYXBwZWFyIHRvIGJlIGFmZmVjdGVkPw0KPj4gVGhleSBvbmx5IHNl
ZW0gdG8gcnVuIGRybV9nZW1fY3JlYXRlX21tYXBfb2Zmc2V0KCkgZnJvbSB0aGVpcg0KPj4g
aW9jdGwtaGFuZGxpbmcgY29kZS4NCj4+DQo+PiBJZiBzbywgSSdkIHNheSBpdCdzIHByZWZl
cmFibGUgdG8gZml4IHRoZXNlIGRyaXZlcnMgYW5kIHB1dCBhDQo+PiBkcm1fV0FSTl9PTkNF
KCkgaW50byBkcm1fZ2VtX3ByaW1lX21tYXAoKS4NCj4gDQo+IFRoYXQgaXMgZ29vZCBpZiBm
ZXdlciBkcml2ZXJzIGFyZSBhZmZlY3RlZCwgaG93ZXZlciBJIGRpc2FncmVlIHdpdGgNCj4g
eW91ciBwcm9wb3NhbC4gIEF0IGxlYXN0IGZvciBmcmVlZHJlbm8gdXNlcnNwYWNlLCBhIGxv
dCBvZiBibydzIG5ldmVyDQo+IGdldCBtbWFwJ2QgKGVpdGhlciBkaXJlY3RseSBvZiB2aWEg
ZG1hYnVmKSwgc28gd2Ugc2hvdWxkIG5vdCBiZQ0KPiBhbGxvY2F0aW5nIGEgbW1hcCBvZmZz
ZXQgdW5uZWNlc3NhcmlseS4NCg0KSSBzZWUuDQoNCkkgdGhlIHJlYXNvbiBJJ20gYXJndWlu
ZyBhZ2FpbnN0IHRoZSBjdXJyZW50IHBhdGNoIGlzIHRoYXQgdGhlIGZpeCANCmFwcGVhcnMg
bGlrZSBhIHdvcmthcm91bmQgYW5kIDYgbW9udGhzIGZyb20gbm93LCBmZXcgd2lsbCByZW1l
bWJlciB3aHkgDQppdCdzIHRoZXJlLiBFc3BlY2lhbGx5IHNpbmNlIG1vc3QgZHJpdmVycyBp
bml0aWFsaXplIHRoZSBvZmZzZXQgDQpjb3JyZWN0bHkuIChOb3QgdG9vIGxvbmcgYWdvLCBJ
IHJlZmFjdG9yZWQgdGhlIGhhbmRsaW5nIG9mIHRoZXNlIG1tYXAgDQpjYWxscyB0aHJvdWdo
b3V0IERSTSBkcml2ZXJzIGFuZCBpdCB3YXMgY29uZnVzaW5nIGF0IHRpbWVzLikNCg0KU28g
aGVyZSdzIGFub3RoZXIgc3VnZ2VzdGlvbjogIEkgZnVydGhlciBsb29rZWQgYXQgdGhlIDMg
ZHJpdmVycyB0aGF0IEkgDQptZW50aW9uZWQuIGV0bmF2aXYgYW5kIG1zbSBjYW4gZWFzaWx5
IHdyYXAgdGhlIGNhbGwgdG8gDQpkcm1fZ2VtX3ByaW1lX21tYXAoKSBhbmQgaW5pdCB0aGUg
b2Zmc2V0IGZpcnN0LiBbMV1bMl0gIG9tYXBkcm0gZG9lc24ndCANCmFjdHVhbGx5IHVzZSBk
cm1fZ2VtX3ByaW1lX21tYXAoKS4gVGhlIG9mZnNldCBjYW4gaW5zdGVhZCBiZSBpbml0aWFs
aXplZCANCmF0IHRoZSB0b3Agb2YgdGhlIGRyaXZlcidzIGRtYWJ1ZiBtbWFwIGZ1bmN0aW9u
LiBbM10NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjUuMTgvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2
L2V0bmF2aXZfZHJ2LmMjTDQ4MA0KWzJdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjUuMTgvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jI0w5NjEN
ClszXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE4L3NvdXJjZS9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbV9kbWFidWYuYyNMNjYNCg0KPiANCj4g
QlIsDQo+IC1SDQo+IA0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+PiBbMV0N
Cj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE4L3NvdXJjZS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyNMODUNCj4+IFsyXQ0KPj4gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTgvc291cmNlL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMjTDEwMDINCj4+DQo+Pj4NCj4+PiBGaXhlczogZTU1MTY1NTM5
OTlmICgiZHJtOiBjYWxsIGRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAgd2l0aCBmYWtlIG9m
ZnNldCIpDQo+Pj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPg0KPj4+IC0tLQ0KPj4+IE5vdGUsIGl0J3MgcG9zc2libGUgdGhlIGlzc3VlIGV4
aXN0ZWQgaW4gc29tZSByZWxhdGVkIGZvcm0gcHJpb3IgdG8gdGhlDQo+Pj4gY29tbWl0IHRh
Z2dlZCB3aXRoIEZpeGVzLg0KPj4+DQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmlt
ZS5jIHwgNSArKysrKw0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykN
Cj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4+PiBpbmRleCBlM2YwOWYxODExMGMuLjg0
OWVlYTE1NGRmYyAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4+PiBAQCAtNzE2
LDYgKzcxNiwxMSBAQCBpbnQgZHJtX2dlbV9wcmltZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4+PiAgICAgICAgc3Ry
dWN0IGZpbGUgKmZpbDsNCj4+PiAgICAgICAgaW50IHJldDsNCj4+Pg0KPj4+ICsgICAgIC8q
IEVuc3VyZSB0aGF0IHRoZSB2bWFfbm9kZSBpcyBpbml0aWFsaXplZDogKi8NCj4+PiArICAg
ICByZXQgPSBkcm1fZ2VtX2NyZWF0ZV9tbWFwX29mZnNldChvYmopOw0KPj4+ICsgICAgIGlm
IChyZXQpDQo+Pj4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4+ICsNCj4+PiAgICAg
ICAgLyogQWRkIHRoZSBmYWtlIG9mZnNldCAqLw0KPj4+ICAgICAgICB2bWEtPnZtX3Bnb2Zm
ICs9IGRybV92bWFfbm9kZV9zdGFydCgmb2JqLT52bWFfbm9kZSk7DQo+Pj4NCj4+DQo+PiAt
LQ0KPj4gVGhvbWFzIFppbW1lcm1hbm4NCj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
Cj4+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPj4gTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+PiAoSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQo+PiBHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------VdWsP9NZV1AcBf9IfDLiDlXf--

--------------hc0fa0reMYQjQXwWx2Y0uhJE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKU0aoFAwAAAAAACgkQlh/E3EQov+BJ
0xAAqWVnjfUcYRQHsVGDGE0WU3w+im6nm34OCB0ZCPmOTS5ryXbLd5y2XYPf7zPQ65rYRD9Upuy3
48Fq3EBn1dAhekTzDbRFIWWxbrE/kWEctzV6VQDE4qcU3rxEzJNXBwKDaPhMMTjLHouYr+A+Auct
1AHkq1HPRW3Im1iL08F1VjQ1iwowmc4S6wUGk4oRGGC4mvqpdn6Bov82M2BmqT7Y6kupTEIlHgQH
3sYLpF/NxbWk64IEOc2oJ11ksE867GRcTo06uqE09xwFquMzU90mvVqu70UtMCPoYys3YAi0jeA9
WaH8YMc8tVkwW4xggk4J4RoytRSXpXdXlA7csV5VoVQCHpEx7K4Rb5CUEH7q4T074786ornSq3QE
ZyAtDMIjAB9ak1iwhECaoSn2s+444lgapOr+ElnoQRrPXppZhIuRj40vbyaagi1DF+BfwNS5Y1NF
2r7DDb5sKi2pYoXT5d/3B+IYjyDuzKSBmT/JPnocXpkkTG9C70smlaSqSTuaR4N5Q7GsbIYHDOON
wwXy54O3IoyLdVPCceLChLMlWxuZhEqWhpcaFY1CN6yX9OBAWmqh7LUB2GJvoQyz9CjTlwuPhkgA
qGlWIXNcrj6G6wM2fNgW1yWnVGVn0uv+YsPuqEniZPZ4DHeW3kYN5uIpjt2MZKiQKSHjurtVBpvD
qAQ=
=BzrW
-----END PGP SIGNATURE-----

--------------hc0fa0reMYQjQXwWx2Y0uhJE--
