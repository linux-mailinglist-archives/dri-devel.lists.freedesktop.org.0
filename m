Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB2D7054B0
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 19:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECFF10E27D;
	Tue, 16 May 2023 17:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB2110E27D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 17:07:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 72DFE1FF99;
 Tue, 16 May 2023 17:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684256819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GLJwqDRnucPiIOCdP1LOpKIguO92nsV79bSvk0vBV9s=;
 b=DL+W19jWFFMgbb4BOS8cYPUyVSjG3A4/BPCvQI0xmDObTZPqj7US6iTs2FzJR6cXSPTsLe
 LeHPnz53Jp7pEtczBO6yMurac9McwSPcw6cv8N+yEcvspXDtriWu2YY/TgqO6k6w2itr0i
 8LXB8sGDb458cfn5wj7esGgBPSGEqz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684256819;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GLJwqDRnucPiIOCdP1LOpKIguO92nsV79bSvk0vBV9s=;
 b=VYOazX1oJm9oT0yXaiLPB/8iemrBHjQuGMpW3mVvh+pWmY9s+PkKRel9xEw3HBVeDpExtF
 JPCESCuDXwmdqOBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38423138F9;
 Tue, 16 May 2023 17:06:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pwRYDDO4Y2RCNAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 16 May 2023 17:06:59 +0000
Message-ID: <c4a08b01-6d81-a21f-ba9f-ade2b447ff6d@suse.de>
Date: Tue, 16 May 2023 19:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>, suijingfeng <15330273260@189.cn>
References: <20230516165931.2989639-1-suijingfeng@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230516165931.2989639-1-suijingfeng@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BIhPft8T0eXt8khy7vIbGkgb"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BIhPft8T0eXt8khy7vIbGkgb
Content-Type: multipart/mixed; boundary="------------XjPHFYEDtJytg9d9mxL19DXY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, suijingfeng <15330273260@189.cn>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <c4a08b01-6d81-a21f-ba9f-ade2b447ff6d@suse.de>
Subject: Re: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
References: <20230516165931.2989639-1-suijingfeng@loongson.cn>
In-Reply-To: <20230516165931.2989639-1-suijingfeng@loongson.cn>

--------------XjPHFYEDtJytg9d9mxL19DXY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE2LjA1LjIzIHVtIDE4OjU5IHNjaHJpZWIgU3VpIEppbmdmZW5nOg0KPiBCb3Ro
IG1vZGUtPmNydGNfaHRvdGFsIGFuZCBtb2RlLT5jcnRjX3Z0b3RhbCBhcmUgdTE2IHR5cGUs
DQo+IG1vZGUtPmNydGNfaHRvdGFsICogbW9kZS0+Y3J0Y192dG90YWwgd2lsbCByZXN1bHRz
IGEgdW5zaWduZWQgdHlwZS4NCj4gVXNpbmcgYSB1MzIgaXMgZW5vdWdoIHRvIHN0b3JlIHRo
ZSByZXN1bHQsIGJ1dCBjb25zaWRlcmluZyB0aGF0IHRoZQ0KPiByZXN1bHQgd2lsbCBiZSBj
YXN0ZWQgdG8gdTY0IHNvb24gYWZ0ZXIuIFdlIHVzZSBhIHU2NCB0eXBlIGRpcmVjdGx5Lg0K
PiANCj4gU28gdGhlcmUgbm8gbmVlZCB0byBjYXN0IGl0IHRvIHNpZ25lZCB0eXBlIGFuZCBj
YXN0IGJhY2sgdGhlbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN1aSBKaW5nZmVuZyA8c3Vp
amluZ2ZlbmdAbG9vbmdzb24uY24+DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBDYzogTWF4aW1lIFJpcGFyZCA8bXJp
cGFyZEBrZXJuZWwub3JnPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPg0KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zw0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyB8IDQgKyst
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMNCj4gaW5kZXggODc3ZTIwNjc1MzRmLi5kOTlj
NDA0YjE4MWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYw0KPiBAQCAtNjIyLDcgKzYy
Miw3IEBAIHZvaWQgZHJtX2NhbGNfdGltZXN0YW1waW5nX2NvbnN0YW50cyhzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsDQo+ICAgDQo+ICAgCS8qIFZhbGlkIGRvdGNsb2NrPyAqLw0KPiAgIAlp
ZiAoZG90Y2xvY2sgPiAwKSB7DQo+IC0JCWludCBmcmFtZV9zaXplID0gbW9kZS0+Y3J0Y19o
dG90YWwgKiBtb2RlLT5jcnRjX3Z0b3RhbDsNCj4gKwkJdTY0IGZyYW1lX3NpemUgPSBtb2Rl
LT5jcnRjX2h0b3RhbCAqIG1vZGUtPmNydGNfdnRvdGFsOw0KPiAgIA0KPiAgIAkJLyoNCj4g
ICAJCSAqIENvbnZlcnQgc2NhbmxpbmUgbGVuZ3RoIGluIHBpeGVscyBhbmQgdmlkZW8NCj4g
QEAgLTYzMCw3ICs2MzAsNyBAQCB2b2lkIGRybV9jYWxjX3RpbWVzdGFtcGluZ19jb25zdGFu
dHMoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiAgIAkJICogaW4gbmFub3NlY29uZHM6DQo+
ICAgCQkgKi8NCj4gICAJCWxpbmVkdXJfbnMgID0gZGl2X3U2NCgodTY0KSBtb2RlLT5jcnRj
X2h0b3RhbCAqIDEwMDAwMDAsIGRvdGNsb2NrKTsNCj4gLQkJZnJhbWVkdXJfbnMgPSBkaXZf
dTY0KCh1NjQpIGZyYW1lX3NpemUgKiAxMDAwMDAwLCBkb3RjbG9jayk7DQo+ICsJCWZyYW1l
ZHVyX25zID0gZGl2X3U2NChmcmFtZV9zaXplICogMTAwMDAwMCwgZG90Y2xvY2spOw0KPiAg
IA0KPiAgIAkJLyoNCj4gICAJCSAqIEZpZWxkcyBvZiBpbnRlcmxhY2VkIHNjYW5vdXQgbW9k
ZXMgYXJlIG9ubHkgaGFsZiBhIGZyYW1lIGR1cmF0aW9uLg0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------XjPHFYEDtJytg9d9mxL19DXY--

--------------BIhPft8T0eXt8khy7vIbGkgb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRjuDIFAwAAAAAACgkQlh/E3EQov+Ct
bg/8DyHt49fiePtQiFDuqRj2mzuEBkTTaGSbeYNjmYFFqd61dEKNdtf2Tkym6ShJJkpYVcmhJHqO
dRS0B30kZlqFmDZnAHvEYP5S6RmzREG8bXzgDPwMbnyTfqNBT0YASa/gM+4IKSJLHvRB+CD49BrB
ASPBqYznmsK790z2NoIvsSVJ/Spw1r3lTlOCBmMsVX4Cb1CsKhV0L1OrRqer2NRVbjIyg0yUpNbQ
/jUBUtSgJ+KS/nYgZFHCOzrRZORHWmDkfFnIPsyZwYBtFxB4XAT3l+o+hSzHrBC0K9CW3xQleLRg
LnB/nY2yq03sOEDWISsXgY3VdOKA667v4scAPmYHJmFGQ0Qi2IfhpCq3I/ZrZzkysIKL1pm3PqLB
q6InUfslhnm/z/mVgI5wElRpSr8wjXCc0jxD05tu6K2KNR484zls1IYcL4xaYcIYv/+/wXkTnb3j
jLCTEf5c/u7VTH2wFAMBlXzP8K7RsVkeJBNaK3kFyUYRHY/NEQmpKSCfjwdseE92EO1qDUsTiPNl
wAokTalqlYfGod/DIVZrAvHYwHENQBE+7G5P1LPs+BFodL588FqBNhF4/9z1Ce6Ii0gDGyFswZaz
T0RZjXuNt8fjvmumkq/wFYgDy5/xwWZ35m90BSvmOy4qiDhOqmHelDgDLH7D0/CdoxQFV1Yf7x1B
R8M=
=fADI
-----END PGP SIGNATURE-----

--------------BIhPft8T0eXt8khy7vIbGkgb--
