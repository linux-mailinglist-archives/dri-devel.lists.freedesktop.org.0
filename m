Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DF953F7F6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 10:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B737412B031;
	Tue,  7 Jun 2022 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C67512B031
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 08:13:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 380021F88C;
 Tue,  7 Jun 2022 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654589589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZPU+Ixr44yslEkTBMf6xfc+4god9MNXIYPtsXYr8qo8=;
 b=I24ow9SRfOr/LJlnrPi/rbf1aiah3tnrvDwfBKXwjod3RjiEsRzGCLs6wgvuDa08F+BBmK
 jlPNxL8IuWKpIixgRKimRb1DtOkclHaE1PALyhiapnqvhr4DqDPCIibNeO7jwQK73ucac4
 +4CfMfGElEDvJ0i5FVJQ/B6wjMomynE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654589589;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZPU+Ixr44yslEkTBMf6xfc+4god9MNXIYPtsXYr8qo8=;
 b=sWC497iN0epGokpfzdWDexIoiwUjAP4b4mHfnAynVLyVQeDh/KlU7KS15L3z8N24vJuKGp
 Gt82LW+9YQa9WdCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00FF613A88;
 Tue,  7 Jun 2022 08:13:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1vTaOpQIn2IdEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Jun 2022 08:13:08 +0000
Message-ID: <9a6c51a1-6634-fd1b-3451-9d0cd0a68e47@suse.de>
Date: Tue, 7 Jun 2022 10:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/5] drm/ast: Fix updating the connector's EDID property
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-3-tzimmermann@suse.de>
 <CAMeQTsbfYsqM5V_HT6=SsqJ-Xiegz7R8ZDRdCV=GDDHXJbNBYQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMeQTsbfYsqM5V_HT6=SsqJ-Xiegz7R8ZDRdCV=GDDHXJbNBYQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lJfrjnnZp2MaAf3b0u5MtQOA"
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lJfrjnnZp2MaAf3b0u5MtQOA
Content-Type: multipart/mixed; boundary="------------VwUXNEQNWhUO6Os3w1xAiNFI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>, kuohsiang_chou@aspeedtech.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <9a6c51a1-6634-fd1b-3451-9d0cd0a68e47@suse.de>
Subject: Re: [PATCH v2 2/5] drm/ast: Fix updating the connector's EDID
 property
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-3-tzimmermann@suse.de>
 <CAMeQTsbfYsqM5V_HT6=SsqJ-Xiegz7R8ZDRdCV=GDDHXJbNBYQ@mail.gmail.com>
In-Reply-To: <CAMeQTsbfYsqM5V_HT6=SsqJ-Xiegz7R8ZDRdCV=GDDHXJbNBYQ@mail.gmail.com>

--------------VwUXNEQNWhUO6Os3w1xAiNFI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDYuMjIgdW0gMDk6MjQgc2NocmllYiBQYXRyaWsgSmFrb2Jzc29uOg0K
PiBPbiBUdWUsIE1heSAzMSwgMjAyMiBhdCAxOjE1IFBNIFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+DQo+PiBSZWFkIHRoZSBkaXNwbGF5IG1v
ZGVzIGZyb20gdGhlIGNvbm5lY3RvcnMgRERDIGhlbHBlciwgd2hpY2ggYWxzbw0KPj4gdXBk
YXRlcyB0aGUgY29ubmVjdG9yJ3MgRURJRCBwcm9wZXJ0eS4gVGhlIGNvZGUgZm9yIHRoZSBj
b25uZWN0b3Incw0KPj4gLmdldF9tb2RlcyBoZWxwZXIgaXMgbm93IHNoYXJlZCBiZXR3ZWVu
IFZHQSBhbmQgU0lMMTY0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X21vZGUuYyB8IDU3ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPj4gaW5kZXggZTE5ZGQyZjli
M2NlLi40ZmY4ZWMxYzg5MzEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0K
Pj4gQEAgLTEzMDIsMzcgKzEzMDIsMTkgQEAgc3RhdGljIGludCBhc3RfY3J0Y19pbml0KHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+Pg0KPj4gICBzdGF0aWMgaW50IGFzdF92Z2FfY29u
bmVjdG9yX2hlbHBlcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
cikNCj4gDQo+IFNpbmNlIHRoaXMgZnVuY3Rpb24gaXMgbm93IGdlbmVyaWMgeW91IGNvdWxk
IGNvbnNpZGVyIHJlbW92aW5nIF92Z2ENCj4gZnJvbSB0aGUgbmFtZS4NCg0KSXQncyBub3Qg
ZnVsbHkgZ2VuZXJpYy4gVGhlcmUgYXJlIERpc3BsYXlQb3J0IGZ1bmN0aW9ucyB0aGF0IGRv
IHRoZWlyIA0Kb3duIHRoaW5nLg0KDQogRnJvbSBob3cgSSB1bmRlcnN0YW5kIHRoZSBkcml2
ZXIncyBzb3VyY2UgY29kZSwgdGhlcmUncyBhIGhhcmR3YXJlIA0Kc2V0dGluZyB0byBzd2l0
Y2ggYmV0d2VlbiBlaXRoZXIgYW5hbG9nIFZHQSBvciBTSUwxNjQtYmFzZWQgRFZJLiBCb3Ro
IA0KdXNlIHRoZSBzYW1lIHJlZ2lzdGVycy4gU28gdGhlIGdldF9tb2RlcyBmdW5jdGlvbiBj
YW4gYmUgc2hhcmVkLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBFaXRoZXIg
d2F5Og0KPiBSZXZpZXdlZC1ieTogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jz
c29uQGdtYWlsLmNvbT4NCj4gDQo+IA0KPj4gICB7DQo+PiAtICAgICAgIHN0cnVjdCBhc3Rf
dmdhX2Nvbm5lY3RvciAqYXN0X3ZnYV9jb25uZWN0b3IgPSB0b19hc3RfdmdhX2Nvbm5lY3Rv
cihjb25uZWN0b3IpOw0KPj4gICAgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNv
bm5lY3Rvci0+ZGV2Ow0KPj4gICAgICAgICAgc3RydWN0IGFzdF9wcml2YXRlICphc3QgPSB0
b19hc3RfcHJpdmF0ZShkZXYpOw0KPj4gLSAgICAgICBzdHJ1Y3QgZWRpZCAqZWRpZDsNCj4+
ICAgICAgICAgIGludCBjb3VudDsNCj4+DQo+PiAtICAgICAgIGlmICghYXN0X3ZnYV9jb25u
ZWN0b3ItPmkyYykNCj4+IC0gICAgICAgICAgICAgICBnb3RvIGVycl9kcm1fY29ubmVjdG9y
X3VwZGF0ZV9lZGlkX3Byb3BlcnR5Ow0KPj4gLQ0KPj4gICAgICAgICAgLyoNCj4+ICAgICAg
ICAgICAqIFByb3RlY3QgYWNjZXNzIHRvIEkvTyByZWdpc3RlcnMgZnJvbSBjb25jdXJyZW50
IG1vZGVzZXR0aW5nDQo+PiAgICAgICAgICAgKiBieSBhY3F1aXJpbmcgdGhlIEkvTy1yZWdp
c3RlciBsb2NrLg0KPj4gICAgICAgICAgICovDQo+PiAgICAgICAgICBtdXRleF9sb2NrKCZh
c3QtPmlvcmVnc19sb2NrKTsNCj4+IC0NCj4+IC0gICAgICAgZWRpZCA9IGRybV9nZXRfZWRp
ZChjb25uZWN0b3IsICZhc3RfdmdhX2Nvbm5lY3Rvci0+aTJjLT5hZGFwdGVyKTsNCj4+IC0g
ICAgICAgaWYgKCFlZGlkKQ0KPj4gLSAgICAgICAgICAgICAgIGdvdG8gZXJyX211dGV4X3Vu
bG9jazsNCj4+IC0NCj4+ICsgICAgICAgY291bnQgPSBkcm1fY29ubmVjdG9yX2hlbHBlcl9n
ZXRfbW9kZXNfZnJvbV9kZGMoY29ubmVjdG9yKTsNCj4+ICAgICAgICAgIG11dGV4X3VubG9j
aygmYXN0LT5pb3JlZ3NfbG9jayk7DQo+Pg0KPj4gLSAgICAgICBjb3VudCA9IGRybV9hZGRf
ZWRpZF9tb2Rlcyhjb25uZWN0b3IsIGVkaWQpOw0KPj4gLSAgICAgICBrZnJlZShlZGlkKTsN
Cj4+IC0NCj4+ICAgICAgICAgIHJldHVybiBjb3VudDsNCj4+IC0NCj4+IC1lcnJfbXV0ZXhf
dW5sb2NrOg0KPj4gLSAgICAgICBtdXRleF91bmxvY2soJmFzdC0+aW9yZWdzX2xvY2spOw0K
Pj4gLWVycl9kcm1fY29ubmVjdG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5Og0KPj4gLSAgICAg
ICBkcm1fY29ubmVjdG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5KGNvbm5lY3RvciwgTlVMTCk7
DQo+PiAtICAgICAgIHJldHVybiAwOw0KPj4gICB9DQo+Pg0KPj4gICBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIGFzdF92Z2FfY29ubmVjdG9yX2hl
bHBlcl9mdW5jcyA9IHsNCj4+IEBAIC0xNDA2LDQzICsxMzg4LDggQEAgc3RhdGljIGludCBh
c3RfdmdhX291dHB1dF9pbml0KHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0KQ0KPj4gICAgKiBT
SUwxNjQgQ29ubmVjdG9yDQo+PiAgICAqLw0KPj4NCj4+IC1zdGF0aWMgaW50IGFzdF9zaWwx
NjRfY29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikNCj4+IC17DQo+PiAtICAgICAgIHN0cnVjdCBhc3Rfc2lsMTY0X2Nvbm5lY3Rv
ciAqYXN0X3NpbDE2NF9jb25uZWN0b3IgPSB0b19hc3Rfc2lsMTY0X2Nvbm5lY3Rvcihjb25u
ZWN0b3IpOw0KPj4gLSAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gY29ubmVjdG9y
LT5kZXY7DQo+PiAtICAgICAgIHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0ID0gdG9fYXN0X3By
aXZhdGUoZGV2KTsNCj4+IC0gICAgICAgc3RydWN0IGVkaWQgKmVkaWQ7DQo+PiAtICAgICAg
IGludCBjb3VudDsNCj4+IC0NCj4+IC0gICAgICAgaWYgKCFhc3Rfc2lsMTY0X2Nvbm5lY3Rv
ci0+aTJjKQ0KPj4gLSAgICAgICAgICAgICAgIGdvdG8gZXJyX2RybV9jb25uZWN0b3JfdXBk
YXRlX2VkaWRfcHJvcGVydHk7DQo+PiAtDQo+PiAtICAgICAgIC8qDQo+PiAtICAgICAgICAq
IFByb3RlY3QgYWNjZXNzIHRvIEkvTyByZWdpc3RlcnMgZnJvbSBjb25jdXJyZW50IG1vZGVz
ZXR0aW5nDQo+PiAtICAgICAgICAqIGJ5IGFjcXVpcmluZyB0aGUgSS9PLXJlZ2lzdGVyIGxv
Y2suDQo+PiAtICAgICAgICAqLw0KPj4gLSAgICAgICBtdXRleF9sb2NrKCZhc3QtPmlvcmVn
c19sb2NrKTsNCj4+IC0NCj4+IC0gICAgICAgZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0
b3IsICZhc3Rfc2lsMTY0X2Nvbm5lY3Rvci0+aTJjLT5hZGFwdGVyKTsNCj4+IC0gICAgICAg
aWYgKCFlZGlkKQ0KPj4gLSAgICAgICAgICAgICAgIGdvdG8gZXJyX211dGV4X3VubG9jazsN
Cj4+IC0NCj4+IC0gICAgICAgbXV0ZXhfdW5sb2NrKCZhc3QtPmlvcmVnc19sb2NrKTsNCj4+
IC0NCj4+IC0gICAgICAgY291bnQgPSBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9yLCBl
ZGlkKTsNCj4+IC0gICAgICAga2ZyZWUoZWRpZCk7DQo+PiAtDQo+PiAtICAgICAgIHJldHVy
biBjb3VudDsNCj4+IC0NCj4+IC1lcnJfbXV0ZXhfdW5sb2NrOg0KPj4gLSAgICAgICBtdXRl
eF91bmxvY2soJmFzdC0+aW9yZWdzX2xvY2spOw0KPj4gLWVycl9kcm1fY29ubmVjdG9yX3Vw
ZGF0ZV9lZGlkX3Byb3BlcnR5Og0KPj4gLSAgICAgICBkcm1fY29ubmVjdG9yX3VwZGF0ZV9l
ZGlkX3Byb3BlcnR5KGNvbm5lY3RvciwgTlVMTCk7DQo+PiAtICAgICAgIHJldHVybiAwOw0K
Pj4gLX0NCj4+IC0NCj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hl
bHBlcl9mdW5jcyBhc3Rfc2lsMTY0X2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgPSB7DQo+PiAt
ICAgICAgIC5nZXRfbW9kZXMgPSBhc3Rfc2lsMTY0X2Nvbm5lY3Rvcl9oZWxwZXJfZ2V0X21v
ZGVzLA0KPj4gKyAgICAgICAuZ2V0X21vZGVzID0gYXN0X3ZnYV9jb25uZWN0b3JfaGVscGVy
X2dldF9tb2RlcywgLy8gc2FtZSBhcyBWR0EgY29ubmVjdG9yDQo+PiAgIH07DQo+Pg0KPj4g
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgYXN0X3NpbDE2NF9j
b25uZWN0b3JfZnVuY3MgPSB7DQo+PiAtLQ0KPj4gMi4zNi4xDQo+Pg0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------VwUXNEQNWhUO6Os3w1xAiNFI--

--------------lJfrjnnZp2MaAf3b0u5MtQOA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKfCJQFAwAAAAAACgkQlh/E3EQov+CG
vA//S10dYxalJsaJJS6tBZEQfm3Scw6KZAf9EbKw8sUC9gbG5e88scdf4xCEEzAAGS2Gbj/Y8gbN
xbVK68VJSj0pLck5NGUOmtTa7ya0a32mAWgXnaGu/56hHgvy1paf5sqKo1Ywsvk5HbBwDkVEmgil
PKXSa+dNMKVXaGwRP7UwnOBrpKqlo07cKNDxmJO35qyNolaRyXhFzzUNAovw4PTWHlPfRKFs8GcP
MUObB42CPksDeoOxmBi7lnW4pJiGtrhRO+bhGXTIKPAhDOVxD7S7VXGDIhCr1azMQDaxmfJsUqgq
39Li9NLQjwfzRHOKMvGY9HREEsyuGp7Uc+RjOsbAUzEJ3qj7M6kvN9TAKjlR2L/ek+zNq1vHzGYC
NefbTN3dbtoB4g/u86y327syrCa4wf3u313erqyLmxRHqYXw/xy6xcljf61iczsB52yxX+ZH5wl6
gDrGbjla0vUch/4naxyElRMPD+HS4zf+4oh53Y4u4v4IuiVV45WVqWZ5UZCGgu13bXHOJJNV60QL
oSETN8tRsQbxvQmnJ+N84jtrPr5I5MwKZaevoL+LA4JrBgNZuCN/4woCeFlx6dUC2UBxTQ/9Ta66
HqOGc+OzUbgCijUFD91LkCnH8LcMyl4U9NnbnZYBq0d+Nxe27dfE8JVFn2i9rUHPBhmYpExL3a1y
hIg=
=YDde
-----END PGP SIGNATURE-----

--------------lJfrjnnZp2MaAf3b0u5MtQOA--
