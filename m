Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C1244E58A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 12:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB0A6E43B;
	Fri, 12 Nov 2021 11:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8066E43B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 11:23:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F19FA1FD57;
 Fri, 12 Nov 2021 11:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636716201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QBv0IJ32FKaFzEGp7qDHmDeh1n1yyxz30LgFzxGXfcQ=;
 b=lK21GEvXfbXTQUZYOsLOpWBHDYnJl3qz34fF7kwq1NDG6fliugmRkkQElzDaBJj0JZMs/z
 gi/flzRRykJn6TzCrcfpHU75tMydfzz1jX3lrBW24icdNVLXuKjFDEVHT1E1dHP0YJ+gXU
 DRCnBx0VXD9HygWue1+FB8nJV4ZL3oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636716201;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QBv0IJ32FKaFzEGp7qDHmDeh1n1yyxz30LgFzxGXfcQ=;
 b=BPSX1BKZo5bi52fwkqMqlmH5HEOFHuxwM860fflYLQkHRGMHMYp9eqm4+/JKOwmsjAJq86
 rv5Yuhq0odSsivAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C220813BE4;
 Fri, 12 Nov 2021 11:23:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4pUALqlOjmGTYgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 11:23:21 +0000
Message-ID: <39c249d9-4366-4d34-c294-a111ab4a8bfd@suse.de>
Date: Fri, 12 Nov 2021 12:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
 <20211112105641.25a4e1a7@eldfell>
 <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
 <f215e009-94af-fdb5-9ab9-ec5806a0c526@suse.de>
 <20211112122239.26b3787c@eldfell>
 <5bd4ffa9-f44f-ca34-c346-6c530d31e5ec@suse.de>
 <a6014802-7ec0-0470-2dd1-ef650d995a53@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <a6014802-7ec0-0470-2dd1-ef650d995a53@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WPqiWkHmVR5VpgUZ3hpP3dts"
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WPqiWkHmVR5VpgUZ3hpP3dts
Content-Type: multipart/mixed; boundary="------------6elRfkBC45ikD5mFz5xRlQp1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>
Message-ID: <39c249d9-4366-4d34-c294-a111ab4a8bfd@suse.de>
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
 <20211112105641.25a4e1a7@eldfell>
 <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
 <f215e009-94af-fdb5-9ab9-ec5806a0c526@suse.de>
 <20211112122239.26b3787c@eldfell>
 <5bd4ffa9-f44f-ca34-c346-6c530d31e5ec@suse.de>
 <a6014802-7ec0-0470-2dd1-ef650d995a53@redhat.com>
In-Reply-To: <a6014802-7ec0-0470-2dd1-ef650d995a53@redhat.com>

--------------6elRfkBC45ikD5mFz5xRlQp1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMTEuMjEgdW0gMTI6MjAgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDExLzEyLzIxIDExOjU3LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToN
Cj4gDQo+IFtzbmlwXQ0KPiANCj4+Pj4NCj4+Pj4gVGhpcyBpcyB3aGF0IEhXLXNwZWNpZmlj
IGRyaXZlcnMgd2FudCB0byBxdWVyeSBpbiB0aGVpciBpbml0L3Byb2JpbmcNCj4+Pj4gY29k
ZS4gVGhlIGFjdHVhbCBzZW1hbnRpY3Mgb2YgdGhpcyBkZWNpc2lvbiBpcyBoaWRkZW4gZnJv
bSB0aGUgZHJpdmVyLg0KPj4+PiBJdCdzIGFsc28gZWFzaWVyIHRvIHJlYWQgdGhhbiB0aGUg
b3RoZXIgbmFtZSBJTUhPDQo+Pj4NCj4+PiBPaywgYnV0IHdoYXQgaXMgYSAibmF0aXZlIGRy
aXZlciI/IE9yIGEgIm5vbi1uYXRpdmUgZHJpdmVyIj8NCj4+PiBJcyB0aGF0IGVzdGFibGlz
aGVkIGtlcm5lbCB0ZXJtaW5vbG9neT8NCj4+Pg0KPj4+IEknZCB0aGluayBhIG5vbi1uYXRp
dmUgZHJpdmVyIGlzIHNvbWV0aGluZyB0aGF0IGUuZy4gbmRpc3dyYXBwZXIgaXMNCj4+PiBs
b2FkaW5nLiBJcyBzaW1wbGVkcm0gbGlrZSBuZGlzd3JhcHBlciBpbiBhIHNlbnNlPyBJSVJD
LCBzaW1wbGVkcm0gaXMNCj4+PiB0aGUgZHJpdmVyIHRoYXQgd291bGQgbm90IGNvbnN1bHQg
dGhpcyBmdW5jdGlvbiwgcmlnaHQ/DQo+Pg0KPj4gV2UgdXNlIHRoYXQgdGVybSBmb3IgaHct
c3BlY2lmaWMgZHJpdmVycy4gQSAnbm9uLW5hdGl2ZScgZHJpdmVyIHdvdWxkIGJlDQo+PiBj
YWxsZWQgZ2VuZXJpYyBvciBmaXJtd2FyZSBkcml2ZXIuDQo+Pg0KPj4gTXkgY29uY2VybiB3
aXRoIHRoZSAnbW9kZXNldCcgdGVybSBpcyB0aGF0IGl0IGV4cG9zZXMgYW4gaW1wbGVtZW50
YXRpb24NCj4+IGRldGFpbCwgd2hpY2ggY2FuIG1pc2xlYWQgYSBkcml2ZXIgdG8gdG8gdGhl
IHdyb25nIHRoaW5nOiBhIEhXLXNwZWNpZmMNCj4+IGRyaXZlciB0aGF0IGRpc2FibGVzIGl0
J3MgbW9kZXNldHRpbmcgZnVuY3Rpb25hbGl0eSB3b3VsZCBwYXNzIHRoZSB0ZXN0DQo+PiBm
b3IgKCFtb2Rlc2V0KS4gQnV0IHRoYXQncyBub3Qgd2hhdCB3ZSB3YW50LCB3ZSB3YW50IHRv
IGRpc2FibGUgYWxsIG9mDQo+PiB0aGUgZHJpdmVyIGFuZCBub3QgZXZlbiBsb2FkIGl0Lg0K
Pj4NCj4+IEhvdyBhYm91dCB3ZSBpbnZlcnQgdGhlIHRlc3QgZnVuY3Rpb24gYW5kIHVzZSBz
b21ldGhpbmcgbGlrZQ0KPj4NCj4+ICAgIGJvb2wgZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25s
eSgpDQo+Pg0KPiANCj4gVGhhdCBuYW1lIEkgdGhpbmsgaXMgbW9yZSBzZWxmIGV4cGxhbmF0
b3J5LCBzbyBpdCB3b3JrcyBmb3IgbWUuDQo+IA0KPiBUaGVyZSB3YXMgYWxzbyBhbm90aGVy
IGJpa2VzaGVkIGFib3V0IHdoZXJlIHRvIHB1dCB0aGUgZnVuY3Rpb24gZGVjbGFyYXRpb24s
DQo+IEkgYWRkZWQgdG8gPGRybS9kcm1fbW9kZV9jb25maWcuaD4gYnV0IHdpdGggdGhhdCBu
YW1lIEkgYmVsaWV2ZSB0aGF0IHNob3VsZA0KPiBiZSBpbiA8ZHJtL2RybV9kcnYuaD4gaW5z
dGVhZC4NCg0KSSBhZ3JlZSB3aXRoIGRybV9kcnYuaC4gSXQncyBhIERSTS13aWRlIGZ1bmN0
aW9uIGFuZCBpdCBmaXQncyB0aGVyZSANCmJlc3QsIEknZCBzYXkuDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywgLS0NCj4gSmF2aWVyIE1hcnRpbmV6
IENhbmlsbGFzDQo+IExpbnV4IEVuZ2luZWVyaW5nDQo+IFJlZCBIYXQNCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------6elRfkBC45ikD5mFz5xRlQp1--

--------------WPqiWkHmVR5VpgUZ3hpP3dts
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGOTqkFAwAAAAAACgkQlh/E3EQov+Bu
HRAAoDBopJ1D1I5ch2zGrB0BFmkUtNifVJ6xcu/SN1OX2HpzU6RvCM4RNOXBKvTFJaPamxrn/RJS
4twjASFewGk9lMGPJ3hgmwsKqS/ol/UoFeH1vtP3VQoEQV1HVSBgbTrD0sQKK6+AH8smz+pUvPf0
woktuDYzljsygtRxok6FMGN2OqlosWkt947N58ye4dtMJio56gjGG+2+CKYWQDNrX93CsUyl6B2v
5rB+ZeJW7oYrHUh7llR4/lixMtRFgeo3oNnHPUaiKCcaeZjRD6TcMCivIdQI7azYIiFZckC6zjFT
dRrIotlTzT6JIb0bKXoe4Datv2pDhmuOnXbTI5xIseSSr/V91v6nAZWXqUU5BU67xUB5LYs64Y3z
pTy283YPzCDRe3gVeoF70NyBFUM/ypSHS9fL6MoQcFjgDY6oZdvyKlrBPQyk2mXE0tz8BLzEYNiO
WEgeWaNuKkHeLUyvsCLtVz9HtchliHW30fMwWgmTeAZwDlOpbyu0inK5GPo+OhoDgQjmxcHfcxIo
eASj7fAJlqqT0dZRIaZxGiFt3Clgca/LCnlVmIiAEiIyccrCVoclNn1T/q+idK9WqNv/Xb4s1gc7
sf9h7K12RCS+jHzxULpg8fqNCijueU3XaE5TVpjpc2TxYtlxTZZckoaaGXREl71v+lGO6ppO34Am
uMA=
=5Jyd
-----END PGP SIGNATURE-----

--------------WPqiWkHmVR5VpgUZ3hpP3dts--
