Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C1B7A92E3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B6A10E590;
	Thu, 21 Sep 2023 08:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7725A10E590
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:57:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 206F51FE2C;
 Thu, 21 Sep 2023 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695286678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UkiG2vTZWW0GwuBNvKPJgirkzFdAdGIrp52V1fuHE+I=;
 b=rqRdtBK5Qrjt0TSnRdeoT7cqAToWrILALfvTsnU1hdPDtJZMnauSsOBHcgOvjoN4DrWOxr
 hyIMzyF/cb3JU4scuxivFqEuykHvC5FDjWOrHYX5Vv3afd1FQjO+yKpk9CbbvSDNcqYy39
 Ti2+ipzHRVUENzFPzfVlRRLlPpmBPLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695286678;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UkiG2vTZWW0GwuBNvKPJgirkzFdAdGIrp52V1fuHE+I=;
 b=/TctH1SjVzED25yKRaKrW0l4unaK1oKT3W5Q9/Y7Lo2f8JR5ZEgKDFMvmsVwGFz8osf15q
 A7AHY6EcuHTPhmBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1E3A134B0;
 Thu, 21 Sep 2023 08:57:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2jMnOpUFDGXAKAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Sep 2023 08:57:57 +0000
Message-ID: <98716df2-c0d8-4b7d-8379-5bac815577ec@suse.de>
Date: Thu, 21 Sep 2023 10:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update drm-misc entry to match all drivers
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20230919131235.759959-1-mripard@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20230919131235.759959-1-mripard@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iwyI1r84PB81ubqRu0UONH0Z"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iwyI1r84PB81ubqRu0UONH0Z
Content-Type: multipart/mixed; boundary="------------KbsoFcLf493NrJXo0gpkZFdG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <98716df2-c0d8-4b7d-8379-5bac815577ec@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Update drm-misc entry to match all drivers
References: <20230919131235.759959-1-mripard@kernel.org>
In-Reply-To: <20230919131235.759959-1-mripard@kernel.org>

--------------KbsoFcLf493NrJXo0gpkZFdG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lDQoNCkFtIDE5LjA5LjIzIHVtIDE1OjEyIHNjaHJpZWIgTWF4aW1lIFJpcGFy
ZDoNCj4gV2UndmUgaGFkIGEgbnVtYmVyIG9mIHRpbWVzIHdoZW4gYSBwYXRjaCBzbGlwcGVk
IHRocm91Z2ggYW5kIHdlIGNvdWxkbid0DQo+IHBpY2sgdGhlbSB1cCBlaXRoZXIgYmVjYXVz
ZSBvdXIgTUFJTlRBSU5FUlMgZW50cnkgb25seSBjb3ZlcnMgdGhlDQo+IGZyYW1ld29yayBh
bmQgdGh1cyB3ZSB3ZXJlbid0IENjJ2QuDQo+IA0KPiBMZXQncyB0YWtlIGFub3RoZXIgYXBw
cm9hY2ggd2hlcmUgd2UgbWF0Y2ggZXZlcnl0aGluZywgYW5kIHJlbW92ZSBhbGwNCj4gdGhl
IGRyaXZlcnMgdGhhdCBhcmUgbm90IG1haW50YWluZWQgdGhyb3VnaCBkcm0tbWlzYy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4N
Cj4gLS0tDQo+ICAgTUFJTlRBSU5FUlMgfCAyMyArKysrKysrKysrKysrKysrKysrKy0tLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gaW5kZXgg
OTBmMTMyODFkMjk3Li43NTdkNGYzM2UxNTggMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJT
DQo+ICsrKyBiL01BSU5UQUlORVJTDQo+IEBAIC02ODYwLDEyICs2ODYwLDI5IEBAIE06CVRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiAgIFM6CU1haW50YWlu
ZWQNCj4gICBXOglodHRwczovLzAxLm9yZy9saW51eGdyYXBoaWNzL2dmeC1kb2NzL21haW50
YWluZXItdG9vbHMvZHJtLW1pc2MuaHRtbA0KPiAgIFQ6CWdpdCBnaXQ6Ly9hbm9uZ2l0LmZy
ZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MNCj4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5Lw0KPiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2dwdS8NCj4gICBGOglEb2N1bWVudGF0aW9uL2dwdS8NCj4gLUY6CWRyaXZl
cnMvZ3B1L2RybS8qDQo+ICtGOglkcml2ZXJzL2dwdS9kcm0vDQo+ICAgRjoJZHJpdmVycy9n
cHUvdmdhLw0KPiAtRjoJaW5jbHVkZS9kcm0vZHJtKg0KPiArRjoJaW5jbHVkZS9kcm0vZHJt
DQo+ICAgRjoJaW5jbHVkZS9saW51eC92Z2EqDQo+IC1GOglpbmNsdWRlL3VhcGkvZHJtL2Ry
bSoNCj4gK0Y6CWluY2x1ZGUvdWFwaS9kcm0vDQo+ICtYOglkcml2ZXJzL2dwdS9kcm0vYW1k
Lw0KPiArWDoJZHJpdmVycy9ncHUvZHJtL2FybWFkYS8NCj4gK1g6CWRyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2Lw0KPiArWDoJZHJpdmVycy9ncHUvZHJtL2V4eW5vcy8NCg0KPiArWDoJZHJp
dmVycy9ncHUvZHJtL2dtYTUwMC8NCg0KV2UgYWx3YXlzIGhhZCBnbWE1MDAgaW4gZHJtLW1p
c2MuIFdoZXJlIGVsc2Ugd291bGQgdGhlc2UgZ28/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gK1g6CWRyaXZlcnMvZ3B1L2RybS9pOTE1Lw0KPiArWDoJZHJpdmVycy9ncHUvZHJt
L2lteC8NCj4gK1g6CWRyaXZlcnMvZ3B1L2RybS9pbmdlbmljLw0KPiArWDoJZHJpdmVycy9n
cHUvZHJtL2ttYi8NCj4gK1g6CWRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay8NCj4gK1g6CWRy
aXZlcnMvZ3B1L2RybS9tc20vDQo+ICtYOglkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS8NCj4g
K1g6CWRyaXZlcnMvZ3B1L2RybS9yYWRlb24vDQo+ICtYOglkcml2ZXJzL2dwdS9kcm0vcmVu
ZXNhcy8NCj4gK1g6CWRyaXZlcnMvZ3B1L2RybS90ZWdyYS8NCj4gICANCj4gICBEUk0gRFJJ
VkVSUyBGT1IgQUxMV0lOTkVSIEExMA0KPiAgIE06CU1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rl
diwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJC
IDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------KbsoFcLf493NrJXo0gpkZFdG--

--------------iwyI1r84PB81ubqRu0UONH0Z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUMBZUFAwAAAAAACgkQlh/E3EQov+DG
tg/+NtS5HRTfkn1xI1O3IQXJkSdmBjpZwunwX25zInH6eRAbVxstTdHZiu54nPDgdTyPQPD1M5kR
8MnWHpDPCxbhRkfXtVTRFywy7asSlGq2aOCxOKdXKgYJNZ6guSJD0vgGm5WJlGy56kmDNgyB++W0
ikwtdGq0SmsJW6EoRS+2TtiiQ2LDLMDaKjl8rV87NWr5VFcEXMq5d7xUMk142rrY9ORvWF221Io8
TFIocuFyA7g05+FbtH6OpF2oGsyz+MMIcg/ot9OWx7h4B000gNOTOiA4zt7VcQWT+fgVyaCftMsu
ro9JhvN8s/5GVOip7e12CImX53nnCTgJ7NXYPcMZ6hOPjnx8fleaFCxkp1aDoDEMKiNUV6caE21R
PbERAYkJzEBAxwb09NC0RY0a9YUZrmIXhrRTBFF5s1zuh059RIgq7P1nQpbcZE1H2+Jost4K9ARo
dvUW+tsooRxeA3HXfGnkisZ22wZOTSaFCRemuB09r8cIhLRvYI+1Y68q2AkBEC6M5GSybH1Fzyz7
va4QozvKsKPCt+T+T5EfeKRjm75kmDWmP1fvpatDeJj6/RI0RxepZ/HIb4Qtfo3LgU8qVJwnWDQS
1+ttR4SYSIwm8HPUdNhiz6hHm6AKm75wbMYwWk1/10XvzbX9HERyMKTzP8ildsvnEhJxiv4X+oSo
7/Q=
=57bj
-----END PGP SIGNATURE-----

--------------iwyI1r84PB81ubqRu0UONH0Z--
