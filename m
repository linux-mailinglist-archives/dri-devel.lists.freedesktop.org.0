Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAAD4B0C18
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E45310E807;
	Thu, 10 Feb 2022 11:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE8610E802;
 Thu, 10 Feb 2022 11:17:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5790E1F38A;
 Thu, 10 Feb 2022 11:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644491823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qaooyu4Nb81yGZ9DFfBDmT32pNnVNgtVFQXDFuQbTA4=;
 b=hN+nLrL1PalurFF1yrllCaO7m2K1R2oXDoYf8Gjfy2xlTmmhH52gsseq/gQq6kLhtgebEd
 1AKq02wXfHEcJ5O04DYN2BsKqlgODyu/5txcawihe+lGIjAmyyuUnnyDW0V82+VnbJCuVA
 0/K1Veq9+TRRjn18RyKRV38BKlcHmEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644491823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qaooyu4Nb81yGZ9DFfBDmT32pNnVNgtVFQXDFuQbTA4=;
 b=enUuOAnfG8kKL9D3WUqhSyV8sgzGDmVRlfZLiLIrlCRH7Adv65mZxtgGdUHIY1MhIYFzUm
 r56A6bZv04MnMEDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00EC613B43;
 Thu, 10 Feb 2022 11:17:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z2ebOi70BGJdCAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 11:17:02 +0000
Message-ID: <03daab0b-979b-0a8d-3a80-514de646b2d0@suse.de>
Date: Thu, 10 Feb 2022 12:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/19] fbcon: delete a few unneeded forward decl
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-2-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220208210824.2238981-2-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cEN1KyUBu0mcocQ9omzXEtbb"
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
Cc: linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cEN1KyUBu0mcocQ9omzXEtbb
Content-Type: multipart/mixed; boundary="------------aSh4Fex3IobC0EHWCJhrYAFh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>,
 Daniel Vetter <daniel@ffwll.ch>, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <03daab0b-979b-0a8d-3a80-514de646b2d0@suse.de>
Subject: Re: [PATCH v2 01/19] fbcon: delete a few unneeded forward decl
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20220208210824.2238981-2-daniel.vetter@ffwll.ch>

--------------aSh4Fex3IobC0EHWCJhrYAFh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjAyLjIyIHVtIDIyOjA4IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gSSBk
aWRuJ3QgYm90aGVyIHdpdGggYW55IGNvZGUgbW92ZW1lbnQgdG8gZml4IHRoZSBvdGhlcnMs
IHRoZXNlIGp1c3QNCj4gZ290IGEgYml0IGluIHRoZSB3YXkuDQo+IA0KPiB2MjogUmViYXNl
IG9uIHRvcCBvZiBIZWxnZSdzIHJldmVydHMuDQo+IA0KPiBBY2tlZC1ieTogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPiAodjEpDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiAodjEpDQo+IFNpZ25lZC1vZmYtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBDYzogSGVsZ2Ug
RGVsbGVyIDxkZWxsZXJAZ214LmRlPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQo+IENjOiBEdSBDaGVuZyA8ZHVjaGVuZzJAZ21haWwuY29tPg0KPiBDYzogVGV0c3VvIEhh
bmRhIDxwZW5ndWluLWtlcm5lbEBJLWxvdmUuU0FLVVJBLm5lLmpwPg0KPiBDYzogQ2xhdWRp
byBTdWFyZXogPGNzc2tAbmV0LWMuZXM+DQo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy92aWRlby9m
YmRldi9jb3JlL2ZiY29uLmMgfCAxNyArLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJjb24uYw0KPiBpbmRleCAyZmMxYjgwYTI2YWQuLjIzNWVhYWIzN2Q4
NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMNCj4g
KysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMNCj4gQEAgLTE2MywyOSAr
MTYzLDE0IEBAIHN0YXRpYyBpbnQgZmJjb25fY3Vyc29yX25vYmxpbms7DQo+ICAgICogIElu
dGVyZmFjZSB1c2VkIGJ5IHRoZSB3b3JsZA0KPiAgICAqLw0KPiAgIA0KPiAtc3RhdGljIGNv
bnN0IGNoYXIgKmZiY29uX3N0YXJ0dXAodm9pZCk7DQo+IC1zdGF0aWMgdm9pZCBmYmNvbl9p
bml0KHN0cnVjdCB2Y19kYXRhICp2YywgaW50IGluaXQpOw0KPiAtc3RhdGljIHZvaWQgZmJj
b25fZGVpbml0KHN0cnVjdCB2Y19kYXRhICp2Yyk7DQo+IC1zdGF0aWMgdm9pZCBmYmNvbl9j
bGVhcihzdHJ1Y3QgdmNfZGF0YSAqdmMsIGludCBzeSwgaW50IHN4LCBpbnQgaGVpZ2h0LA0K
PiAtCQkJaW50IHdpZHRoKTsNCj4gLXN0YXRpYyB2b2lkIGZiY29uX3B1dGMoc3RydWN0IHZj
X2RhdGEgKnZjLCBpbnQgYywgaW50IHlwb3MsIGludCB4cG9zKTsNCj4gLXN0YXRpYyB2b2lk
IGZiY29uX3B1dGNzKHN0cnVjdCB2Y19kYXRhICp2YywgY29uc3QgdW5zaWduZWQgc2hvcnQg
KnMsDQo+IC0JCQlpbnQgY291bnQsIGludCB5cG9zLCBpbnQgeHBvcyk7DQo+ICAgc3RhdGlj
IHZvaWQgZmJjb25fY2xlYXJfbWFyZ2lucyhzdHJ1Y3QgdmNfZGF0YSAqdmMsIGludCBib3R0
b21fb25seSk7DQo+IC1zdGF0aWMgdm9pZCBmYmNvbl9jdXJzb3Ioc3RydWN0IHZjX2RhdGEg
KnZjLCBpbnQgbW9kZSk7DQo+ICAgc3RhdGljIHZvaWQgZmJjb25fYm1vdmUoc3RydWN0IHZj
X2RhdGEgKnZjLCBpbnQgc3ksIGludCBzeCwgaW50IGR5LCBpbnQgZHgsDQo+ICAgCQkJaW50
IGhlaWdodCwgaW50IHdpZHRoKTsNCj4gLXN0YXRpYyBpbnQgZmJjb25fc3dpdGNoKHN0cnVj
dCB2Y19kYXRhICp2Yyk7DQo+IC1zdGF0aWMgaW50IGZiY29uX2JsYW5rKHN0cnVjdCB2Y19k
YXRhICp2YywgaW50IGJsYW5rLCBpbnQgbW9kZV9zd2l0Y2gpOw0KPiAgIHN0YXRpYyB2b2lk
IGZiY29uX3NldF9wYWxldHRlKHN0cnVjdCB2Y19kYXRhICp2YywgY29uc3QgdW5zaWduZWQg
Y2hhciAqdGFibGUpOw0KPiAgIA0KPiAgIC8qDQo+ICAgICogIEludGVybmFsIHJvdXRpbmVz
DQo+ICAgICovDQo+IC1zdGF0aWMgX19pbmxpbmVfXyB2b2lkIHl3cmFwX3VwKHN0cnVjdCB2
Y19kYXRhICp2YywgaW50IGNvdW50KTsNCj4gLXN0YXRpYyBfX2lubGluZV9fIHZvaWQgeXdy
YXBfZG93bihzdHJ1Y3QgdmNfZGF0YSAqdmMsIGludCBjb3VudCk7DQo+IC1zdGF0aWMgX19p
bmxpbmVfXyB2b2lkIHlwYW5fdXAoc3RydWN0IHZjX2RhdGEgKnZjLCBpbnQgY291bnQpOw0K
PiAtc3RhdGljIF9faW5saW5lX18gdm9pZCB5cGFuX2Rvd24oc3RydWN0IHZjX2RhdGEgKnZj
LCBpbnQgY291bnQpOw0KPiAgIHN0YXRpYyB2b2lkIGZiY29uX2Jtb3ZlX3JlYyhzdHJ1Y3Qg
dmNfZGF0YSAqdmMsIHN0cnVjdCBmYmNvbl9kaXNwbGF5ICpwLCBpbnQgc3ksIGludCBzeCwN
Cj4gICAJCQkgICAgaW50IGR5LCBpbnQgZHgsIGludCBoZWlnaHQsIGludCB3aWR0aCwgdV9p
bnQgeV9icmVhayk7DQo+ICAgc3RhdGljIHZvaWQgZmJjb25fc2V0X2Rpc3Aoc3RydWN0IGZi
X2luZm8gKmluZm8sIHN0cnVjdCBmYl92YXJfc2NyZWVuaW5mbyAqdmFyLA0KPiBAQCAtMTk0
LDggKzE3OSw4IEBAIHN0YXRpYyB2b2lkIGZiY29uX3JlZHJhd19tb3ZlKHN0cnVjdCB2Y19k
YXRhICp2Yywgc3RydWN0IGZiY29uX2Rpc3BsYXkgKnAsDQo+ICAgCQkJICAgICAgaW50IGxp
bmUsIGludCBjb3VudCwgaW50IGR5KTsNCj4gICBzdGF0aWMgdm9pZCBmYmNvbl9tb2RlY2hh
bmdlZChzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7DQo+ICAgc3RhdGljIHZvaWQgZmJjb25fc2V0
X2FsbF92Y3Moc3RydWN0IGZiX2luZm8gKmluZm8pOw0KPiAtc3RhdGljIHZvaWQgZmJjb25f
c3RhcnQodm9pZCk7DQo+ICAgc3RhdGljIHZvaWQgZmJjb25fZXhpdCh2b2lkKTsNCj4gKw0K
PiAgIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlICpmYmNvbl9kZXZpY2U7DQo+ICAgDQo+ICAgI2lm
ZGVmIENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX1JPVEFUSU9ODQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------aSh4Fex3IobC0EHWCJhrYAFh--

--------------cEN1KyUBu0mcocQ9omzXEtbb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIE9C4FAwAAAAAACgkQlh/E3EQov+BE
cQ//Q2CaZBkIceF3bUoO9v3HwBzBvjDXynz1Z4g+9Lf9yY8avg8SSqYarwhXmwxBKgPDrpuvaFwt
QH+Tc8IbNxgpMF+6Qc2E11bBL//ux3NS4xHqbUxahepzMgai7AuluoEoik3x5LPMlr00CgPmFHDn
gcvlLvA+RgmGe2/O4prZFZlT1dT39bZRz5qq/8Ji9bt8mC1eK0jMz0vvb1PMPwfJHeW05URL+UVW
72gtN7HfMkXZxGqs0LojkSsH5sfNwex8Nw+fZlWUHCojdsIyuj1s/antcd2fMmeqbE1GTbEnWVQL
oHEbPzYzi2pG8jjv4D50QEVQiUBb6K3nIEwAWR01Z+usih7Fgi3Y+gVkedN4CoKugtdRShrN7b0Q
IKX011fQR8OblydwUoRcUBRKmLejvu72ivbtZP8DdETCmf+0OV59SwvLI2hmakeNY3N97k5BesjB
HP0SAI1go19iP6BByLYvC1zEflImpFvCvn81su1gcPS/d82eJZicA0Y6OuSJTQVYkv8XFf5JZ/Yr
M0RjemnAILfLbXPU386UpypkS6v1PgpPDLM87DREpbwlkuLNjZXorlLOFrl6bUdLc0ea2Ht6YVjR
ogMnjgjAHUiefCCO6AM8kuitxzbFpyEQAQnVmq4W0sB1tbrPpKSNEXnreQa1LyATschb7L7AY6cB
jIU=
=FdDm
-----END PGP SIGNATURE-----

--------------cEN1KyUBu0mcocQ9omzXEtbb--
