Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D6C5AFDA5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 09:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E9710E3CF;
	Wed,  7 Sep 2022 07:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369C710E3CF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 07:36:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6F8933AF3;
 Wed,  7 Sep 2022 07:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662536166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lavx3pafSuCTnlel3bhLPHaCbT+Rc5YoltiGr/n9cVU=;
 b=ileNwZr2ilYDx2ez/9jRPOaYa9G4XRzXM4BWgv9ezWm8AeBVVj5Ys7HD5xzNWxJMlvjTLr
 Wwr+xn1b/k29JRU2ISk2nqkWw8vDTw1Nn1sI7OU+fSioxGwoKmQEvfBvg8O6Q4JZO9Bu13
 9XbTZ07uxnbfAnRbpzQHiRpSsrSpMCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662536166;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lavx3pafSuCTnlel3bhLPHaCbT+Rc5YoltiGr/n9cVU=;
 b=wUPzo3KmcrL+Xu4ETefwyhso6/lI+mm8HCqsX1joR+Nd6Rj5Gcl0bFs9iOhRR+UeHayeql
 zGFm+bUK41Rm3yCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A06E913A66;
 Wed,  7 Sep 2022 07:36:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YLFmJuZJGGOyfQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 07:36:06 +0000
Message-ID: <05d4b35a-7f07-ebf3-e378-69d1b5b47c53@suse.de>
Date: Wed, 7 Sep 2022 09:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/bochs: fix blanking
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20220906142957.2763577-1-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220906142957.2763577-1-kraxel@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PwqMPL33VVpqLfh0yvaUmOOr"
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PwqMPL33VVpqLfh0yvaUmOOr
Content-Type: multipart/mixed; boundary="------------xbTE40wtUSMN0RWOFlVesBQQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Takashi Iwai <tiwai@suse.de>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <05d4b35a-7f07-ebf3-e378-69d1b5b47c53@suse.de>
Subject: Re: [PATCH] drm/bochs: fix blanking
References: <20220906142957.2763577-1-kraxel@redhat.com>
In-Reply-To: <20220906142957.2763577-1-kraxel@redhat.com>

--------------xbTE40wtUSMN0RWOFlVesBQQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA2LjA5LjIyIHVtIDE2OjI5IHNjaHJpZWIgR2VyZCBIb2ZmbWFubjoNCj4gVkdB
X0lTMV9SQyBpcyB0aGUgY29sb3IgbW9kZSByZWdpc3RlciAoVkdBX0lTMV9STSB0aGUgb25l
IGZvciBtb25vY2hyb21lDQo+IG1vZGUsIG5vdGUgQyB2cy4gTSBhdCB0aGUgZW5kKS4gIFNv
IHdoZW4gdXNpbmcgVkdBX0lTMV9SQyBtYWtlIHN1cmUgdGhlDQo+IHZnYSBkZXZpY2UgaXMg
YWN0dWFsbHkgaW4gY29sb3IgbW9kZSBhbmQgc2V0IHRoZSBjb3JyZXNwb25kaW5nIGJpdCBp
biB0aGUNCj4gbWlzYyByZWdpc3Rlci4NCj4gDQo+IFJlcHJvZHVjaWJsZSB3aGVuIGJvb3Rp
bmcgVk1zIGluIFVFRkkgbW9kZSB3aXRoIHNvbWUgZWRrMiB2ZXJzaW9ucyAoZWRrMg0KPiBm
aXggaXMgb24gdGhlIHdheSB0b28pLiAgRG9lc24ndCBoYXBwZW4gaW4gQklPUyBtb2RlIGJl
Y2F1c2UgaW4gdGhhdA0KPiBjYXNlIHRoZSB2Z2FiaW9zIGFscmVhZHkgZmxpcHMgdGhlIGJp
dC4NCj4gDQo+IEZpeGVzOiAyNTBlNzQzOTE1ZDQgKCJkcm0vYm9jaHM6IEFkZCBzY3JlZW4g
Ymxhbmtpbmcgc3VwcG9ydCIpDQo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9j
aHMuYyB8IDIgKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYyBiL2RyaXZlcnMv
Z3B1L2RybS90aW55L2JvY2hzLmMNCj4gaW5kZXggMDhkZTEzNzc0ODYyLi5hNTEyNjIyODlh
ZWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2JvY2hzLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYw0KPiBAQCAtMzA5LDYgKzMwOSw4IEBA
IHN0YXRpYyB2b2lkIGJvY2hzX2h3X2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4g
ICBzdGF0aWMgdm9pZCBib2Noc19od19ibGFuayhzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2No
cywgYm9vbCBibGFuaykNCj4gICB7DQo+ICAgCURSTV9ERUJVR19EUklWRVIoImh3X2JsYW5r
ICVkXG4iLCBibGFuayk7DQo+ICsJLyogZW5hYmxlIGNvbG9yIGJpdCAoc28gVkdBX0lTMV9S
QyBhY2Nlc3Mgd29ya3MpICovDQo+ICsJYm9jaHNfdmdhX3dyaXRlYihib2NocywgVkdBX01J
U19XLCBWR0FfTUlTX0NPTE9SKTsNCj4gICAJLyogZGlzY2FyZCBhcl9mbGlwX2Zsb3AgKi8N
Cj4gICAJKHZvaWQpYm9jaHNfdmdhX3JlYWRiKGJvY2hzLCBWR0FfSVMxX1JDKTsNCj4gICAJ
LyogYmxhbmsgb3IgdW5ibGFuazsgd2UgbmVlZCBvbmx5IHVwZGF0ZSBpbmRleCBhbmQgc2V0
IDB4MjAgKi8NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------xbTE40wtUSMN0RWOFlVesBQQ--

--------------PwqMPL33VVpqLfh0yvaUmOOr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYSeYFAwAAAAAACgkQlh/E3EQov+Du
yA//fpPRnTHYgiUo1pMN3estyO1WJMP8n5t8x7yMjPBT+YosBrFkLhM+VESDxzOI/RP97/mAvRjT
SrvvrLZXsAasEnrSo5MiJ/x/LptFF2EG8UldbWCLpdOeL2S41Wh3UtL3Dihzr10t0GlQA+AlKeeC
J+KwJlt9FJoWM5IgmamxJvyIRKMi/Nm0jeDj/oANEHD4Cl++g5uQ2pM4QSILDnGbAQEMc1J/S519
UfJbiO7okcFITiPHQn41ahPsn2vrUbYejI3B4+UtWo8jU0xuFZxkgci7jEr3okQjTmVtFWYHMXQ3
7RHUli+3Yv+UB/RNIEXD4/QzsHoGGtobHvOB1auSImb5xTaJeNsbXbUYLWpaPya4tDniDs8eLa1f
seWqD/3awsCb23Dzkt2zoCI065xw5138ci+eMs3M2PI5W3Ll2WFYRffHwA+DmPzne3p5NXXVHX4F
yxwhaY1XpmMocWnWDveOXJX2iX9bx0EnqjbSi/U5cMAFoGwU/A3lLts5VsvDD5PJt0Z6Q+6rVi9w
HZhigKGFl3zRyr/ivtGJrkVAvAZYR/YPQ7TLpQQ+C9eH5d6IPQkzzMGbJjG2MNwTX74EYygDe+9h
eU6wsyAXEL44PkbW2XkMJu/jeIiwo0HMV8fm0jCMYNhGNfM3p8te1jbLcaTEDbCKSCpOR5XCHiQV
bck=
=01HH
-----END PGP SIGNATURE-----

--------------PwqMPL33VVpqLfh0yvaUmOOr--
