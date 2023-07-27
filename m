Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C52B765688
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA6810E5A9;
	Thu, 27 Jul 2023 14:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8256610E5A9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:55:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2680C21A75;
 Thu, 27 Jul 2023 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690469748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kxn87MMoVlJ7V6lVSDhI4Hb3rBvxr4w0zcK+4BNMTIM=;
 b=kGxlASPeoL72rS2CLxXywtzZcS63OejBrc4vRFXFquGtaidxNdlUxEv06Jh/xWu3W8MaTw
 hNGZqcYDJ2Q2WZRjwJjQ2jNcfu5DgptuI7CsCKJwt7AAKB1m13u/r2ZP6crZ2tqGj8HcbV
 IFDQBuxfbZAR8snvC0RO27qXz2x/Czw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690469748;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kxn87MMoVlJ7V6lVSDhI4Hb3rBvxr4w0zcK+4BNMTIM=;
 b=W7Kb0doezbuWNWbmj3sDsVpI3houzdYjOsPBnJmp64gQkNQi9ICAzUNVWnb0K/M9zeZ3zi
 ukXh7TzA9XetSzAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 075EC13902;
 Thu, 27 Jul 2023 14:55:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8QS/AHSFwmS9HAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jul 2023 14:55:48 +0000
Message-ID: <897822f7-90a8-edd0-9c84-fb5a1f5ce5eb@suse.de>
Date: Thu, 27 Jul 2023 16:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
Content-Language: en-US
To: Maxime Ripard <mripard@redhat.com>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <7f6fd614-5910-6c94-2c55-110223b61b5f@redhat.com>
 <8f0ee2da-0a06-a78d-ab74-c552da822b97@suse.de>
 <hnyzo4cldffz6rzntmuvblissfrw7ig6qidnc2f3iortcdagid@fi5bn44asg2v>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <hnyzo4cldffz6rzntmuvblissfrw7ig6qidnc2f3iortcdagid@fi5bn44asg2v>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Svo1nZrZK53I83eyz2UUSFmQ"
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
Cc: Roger Sewell <roger.sewell@cantab.net>, airlied@redhat.com,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Svo1nZrZK53I83eyz2UUSFmQ
Content-Type: multipart/mixed; boundary="------------geXpDMmMm0tvWc5xbQQfd9F2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@redhat.com>
Cc: Roger Sewell <roger.sewell@cantab.net>, airlied@redhat.com,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Message-ID: <897822f7-90a8-edd0-9c84-fb5a1f5ce5eb@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <7f6fd614-5910-6c94-2c55-110223b61b5f@redhat.com>
 <8f0ee2da-0a06-a78d-ab74-c552da822b97@suse.de>
 <hnyzo4cldffz6rzntmuvblissfrw7ig6qidnc2f3iortcdagid@fi5bn44asg2v>
In-Reply-To: <hnyzo4cldffz6rzntmuvblissfrw7ig6qidnc2f3iortcdagid@fi5bn44asg2v>

--------------geXpDMmMm0tvWc5xbQQfd9F2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lDQoNCkFtIDI3LjA3LjIzIHVtIDE2OjMzIHNjaHJpZWIgTWF4aW1lIFJpcGFy
ZDoNCj4gSGkgVGhvbWFzLA0KPiANCj4gT24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgMDU6MzY6
MTVQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4gSSd2ZSBhbHJlYWR5
IHNlbnQgYSBwYXRjaCB0byB1c2UgaW50ZXJuYWxseSAyNGJpdCBjb2xvcnMsIHdoZW4gdXNl
cnNwYWNlDQo+Pj4gY2FuIHVzZSAzMmJpdCB0aGF0IHdvdWxkIHNvbHZlIHRoaXMgaXNzdWUg
YXMgd2VsbC4gSW4gdGhlIGVuZCwgb24gdGhlDQo+Pj4gVkdBIGxpbmssIDI0IG9yIDMyIGJp
dCBjb2xvcnMgYXJlIHRoZSBzYW1lLiBUaGF0IHdvdWxkIGFsbG93IG1vZGVybg0KPj4+IHVz
ZXJzcGFjZSB0byB3b3JrIG9uIHBhciB3aXRoIFhvcmcuIFNvIG1heWJlIHdlIGNhbiByZWNv
bnNpZGVyIGl0ID8NCj4+DQo+PiBObyB3YXkuIFdlJ3ZlIGhhZCBJUkMgZmxhbWV3YXJzIG92
ZXIgdGhpcyB0b3BpYyBhbHJlYWR5LiBQZW9wbGUgZGlkbid0IGdldA0KPj4gd29yayBkb25l
IHRoYXQgZGF5OyBvdGhlcnMgcmFnZXF1aXQtZWQgaW4gZnJ1c3RyYXRpb24uIEFzayBKYXZp
ZXIsIGhlJ2xsDQo+PiByZW1lbWJlci4gOikNCj4+DQo+PiBUaGUgY29uc2VudCBpbiBEUk0t
bGFuZCBpczogd2UncmUgbm90IGdvaW5nIHRvIG1lc3Mgd2l0aCBjb2xvciBmb3JtYXRzDQo+
PiBiZWhpbmQgdGhlIGJhY2sgb2YgdXNlcnNwYWNlLiBUaGUgb25seSBleGNlcHRpb24gaXMg
dGhlIGVtdWxhdGlvbiBvZg0KPj4gWFJHQjg4ODggaWZmIHRoZSBoYXJkd2FyZSBkb2VzIG5v
dCBzdXBwb3J0IHRoYXQuIEFuZCBvbmx5IGJlY2F1c2UgaXQncyB0aGUNCj4+IGZhbGxiYWNr
IGZvcm1hdCB0aGF0IGlzIHVuaXZlcnNhbGx5IHN1cHBvcnRlZC4NCj4gDQo+IEknbSBhd2Fy
ZSB0aGF0IEkgbWlnaHQgYmUgcmV2aXZpbmcgb2xkIGhlYXRlZCBkZWJhdGVzIGhlcmUsIGJ1
dCBJJ20gbm90DQo+IHN1cmUgd2hhdCBpcyB0aGUgcHJvYmxlbSBoZXJlLg0KPiANCj4gSSBn
dWVzcyBwYXJ0IG9mIHRoZSBwcm9ibGVtIGlzIHRoYXQgZHVlIHRvIHRoZSBtZW1jcHkgY2Fs
bCwgd2Ugd291bGQNCj4gaGF2ZSBpdCBpbiBzb2Z0d2FyZS4NCj4gDQo+IEJ1dCBpdCdzIG5v
dCBjbGVhciB0byBtZSBob3cgd2UncmUgbWVzc2luZyB3aXRoIGNvbG9yIGZvcm1hdHMgdGhl
cmU6IHRoZQ0KPiBtZW1jcHkgd291bGQgZHJvcCB0aGUgYWxwaGEgcGFydCB0aGF0IHdhcyBk
b2luZyB0byBiZSBkcm9wcGVkIGJ5IHRoZQ0KPiBoYXJkd2FyZSBhbnl3YXkgKGFuZCBsaWtl
bHkgd291bGQgaGF2ZSBkb25lIHNvIHRyYW5zcGFyZW50bHkgaWYgaXQNCj4gd2Fzbid0IGZv
ciB0aGUgbWVtY3B5KS4NCj4gDQo+IEl0IGRvZXNuJ3QgYWZmZWN0IHRoZSB1c2Vyc3BhY2Ug
YXQgYWxsLCBpdCBkb2Vzbid0IGNoYW5nZSB0aGUgd2F5IHdlDQo+IGludGVycHJldCB0aGUg
Zm9ybWF0IGVpdGhlciwgaXQganVzdCBpZ25vcmVzIGEgcGFydCBvZiB0aGUgZm9ybWF0IHRo
YXQNCj4gaXMgc3VwcG9zZWQgdG8gYmUgaWdub3JlZCBhbnl3YXkuIEFuZCBkb2luZyBzbyBm
cmVlcyB1cCBhIGJ1bmNoIG9mDQo+IHJlc291cmNlcz8NCj4gDQo+IFNvLCBBRkFJVSwgaXQg
ZG9lc24ndCBoYXZlIGFueSBzaWRlIGVmZmVjdCBleGNlcHQgZm9yIHRoZSBmYWN0IHRoYXQg
aXQNCj4gY29uc3VtZXMgbGVzcyBtZW1vcnkgYmFuZHdpZHRoIGFuZCBhbGxvd3MgZm9yIG1v
cmUgcGl4ZWxzIHRvIGdvIHRocm91Z2guDQo+IFRoYXQncyBub3QgcmVhbGx5ICJtZXNzaW5n
IHdpdGggdGhlIGZvcm1hdHMiIGluIG15IGJvb2suDQoNClRlY2huaWNhbGx5IG5vdCwgYnV0
IGl0J3Mgc3RpbGwgYSBkaWZmZXJlbmNlLiBFdmVuIGluIHN1Y2ggY2FzZXMgd2l0aG91dCAN
CnNpZGUgZWZmZWN0cywgaXQgd2FzIGRpc21pc3NlZCB3aGVuIGRpc2N1c3NlZCBpbiB0aGUg
Y29udGV4dCBvZiBzaW1wbGVkcm0uDQoNClRoZSByZWFzb25pbmcgaXMgdGhhdCB1c2Vyc3Bh
Y2Ugc2hvdWxkIGFsd2F5cyBiZSBpbiBjb250cm9sIG9mIHRoZSANCmZvcm1hdCAoc2FucyB0
aGF0IG9uZSBleGNlcHRpb24pLiBJZiB1c2Vyc3BhY2Ugd2FudHMgcGFja2VkIDI0LWJpdHMg
aXQgDQpjYW4gc3VwcG9ydCBSR0I4ODggZXhwbGljaXRseS4gIEZvciB0aGUgY29sb3ItZm9y
bWF0IHRyYW5zZm9ybWF0aW9uLCANCml0J3MgYmV0dGVyIHRvIGRvIHRoYXQgaW4gdXNlcnNw
YWNlIHdpdGggU1NFLWxpa2UgaW5zdHJ1Y3Rpb25zIHRoYW4gaW4gDQp0aGUga2VybmVsLg0K
DQpJIHdhc24ndCBzdXBlci1oYXBweSB3aXRoIHRoaXMsIGJ1dCBJIHRoaW5rIGl0J3MgYSBj
bGVhciBzdGF0ZW1lbnQgd2l0aCANCnNpbXBsZSBydWxlcyB0byBmb2xsb3cuIEknZCBwcmVm
ZXIgdGhhdCBvdmVyIHJlbGF4ZWQgcnVsZXMgd2hlcmUgZWFjaCANCmRyaXZlciBkb2VzIGl0
cyBvd24gdGhpbmcuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IE1heGltZQ0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0
NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXll
cnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51
ZXJuYmVyZykNCg==

--------------geXpDMmMm0tvWc5xbQQfd9F2--

--------------Svo1nZrZK53I83eyz2UUSFmQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTChXMFAwAAAAAACgkQlh/E3EQov+Be
zQ/+LaU/I8Hwm1T/LYr2OzjbjwSwN3zdMEo3hEpdrQx8D9/444PEveRaTmAX+HTdgA9mHMDr95A3
N5SAtbTLIH6r/TRDLV1BzSK9pZznt/5ZnXFloDge+iDdkOGl1+N+GSvtHV9grfIWh7xtYaOo23m0
Pl1zbFRfJqajbH2EgzWiDQTPNAVQMcA+G6EuGT2xUT6aVR8C5Nw16o6gMuoWXIq7FWLCQ/EAFmG1
n8e7BCB0Guu+REMD78OPk/TVq0utFOLjVnWMY4hXxh5Bmr0P+NgRGlfOSXu/XzAOCNH5WKZ+8sMQ
BogealRkYRNc7/2XveqMYInnfEvaO6FpKW64YcilNHQ+++qxI4qJdPhq9ag0EBtJkMxDQ31zIcgh
rpkSIlJf4UAbfEm7ldlHFzqrSu5gfQo6mXIK2Lh+HJaCCtl3Yc+7q7WAHJB6hO8siJlkLY68osed
JdRSpm62IkGh2tm7AzuK3pIzVk2IQcNPREDmIBdOqVJh2HZHSQIH5Y/8kBnWfmreOdA8qrmqKsS6
JIPJrLB6aM4bfWClS9xTLLLFJBbOm1FD5r9TR0IIEqQK3rCa3FYQdsXsiteFKAGbc/EYeo/ioZXc
Q90OSVjai5QSv2RttmxB+t0QJRGwIt6LoloSy6XANSgvooqIDoIaHj/++AMWwwI+frSacSMnnL4S
dAI=
=Sv56
-----END PGP SIGNATURE-----

--------------Svo1nZrZK53I83eyz2UUSFmQ--
