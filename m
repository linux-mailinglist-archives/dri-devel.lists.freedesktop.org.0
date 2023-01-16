Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B2766BD8B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40C610E3F0;
	Mon, 16 Jan 2023 12:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A1D10E3DF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 12:13:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 447D637415;
 Mon, 16 Jan 2023 12:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673871228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=35GkjWhjiAuWBBTHy/SHb2THswB0YEB74S5rhaHezkY=;
 b=nXMV0hvuAd8amBYqQ08OCzjXMJ2Oq76DbsSpELsdF9tsxK9rZHUj8Cl2gyA4j0tpu46n7S
 xXxhQ7lRIwHogFkZtKpe4ckkExLhNc5q/5PwjuFQLB+q8SFElma64HaEAiuqa1hropw+mx
 42omW8XLIUhcjzHGl/kqq7MYVoLFG/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673871228;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=35GkjWhjiAuWBBTHy/SHb2THswB0YEB74S5rhaHezkY=;
 b=O8NEzo/NVnaelCBEh/lXMMpXo51OwyVVS+TiQ1w+KcxMArCY18C1UWPd7DreEoasEtSGW+
 /xdctgKWtcJaW+AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27620138FE;
 Mon, 16 Jan 2023 12:13:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QqDOCHw/xWPNEgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Jan 2023 12:13:48 +0000
Message-ID: <ee7ef7be-7d9d-d6eb-7adf-0b03a2abb3ab@suse.de>
Date: Mon, 16 Jan 2023 13:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/ttm: Include <linux/vmalloc.h> to fix MIPS build
To: christian.koenig@amd.com, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230116121023.14245-1-tzimmermann@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230116121023.14245-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SkxWzxinArGQKZ7uRVRHoEpM"
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
--------------SkxWzxinArGQKZ7uRVRHoEpM
Content-Type: multipart/mixed; boundary="------------D51u6L6NuwNR0sasxdQUzYkJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: christian.koenig@amd.com, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <ee7ef7be-7d9d-d6eb-7adf-0b03a2abb3ab@suse.de>
Subject: Re: [PATCH] drm/ttm: Include <linux/vmalloc.h> to fix MIPS build
References: <20230116121023.14245-1-tzimmermann@suse.de>
In-Reply-To: <20230116121023.14245-1-tzimmermann@suse.de>

--------------D51u6L6NuwNR0sasxdQUzYkJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSdkIGFkZCBhIEZpeGVzIHRhZywgYnV0IGRvbid0IGtub3cgdGhlIGNvbW1pdCB3aGVuIHRo
aXMgd2FzIGludHJvZHVjZWQuDQoNCkFtIDE2LjAxLjIzIHVtIDEzOjEwIHNjaHJpZWIgVGhv
bWFzIFppbW1lcm1hbm46DQo+IE9uIE1JUFMsIHZtYXAoKSBhbmQgdnVubWFwKCkgYXJlIHVu
ZGVjbGFyZWQgaW4gdHRtX2JvX3V0aWwuYy4gQW4NCj4gZXJyb3IgbWVzc2FnZSBpcyBzaG93
biBiZWxvdy4NCj4gDQo+ICAgIENDICAgICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5vDQo+ICAgIC4uL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYzogSW4g
ZnVuY3Rpb24gJ3R0bV9ib19rbWFwX3R0bSc6DQo+ICAgIC4uL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvX3V0aWwuYzozNjQ6MzI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbiAndm1hcCc7IGRpZCB5b3UgbWVhbiAna21hcCc/IFstV2Vycm9yPWltcGxp
Y2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiAgICAgIDM2NCB8ICAgICAgICAgICAgICAg
ICBtYXAtPnZpcnR1YWwgPSB2bWFwKHR0bS0+cGFnZXMgKyBzdGFydF9wYWdlLCBudW1fcGFn
ZXMsDQo+IAl8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+DQo+IAl8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrbWFwDQo+ICAgIC4uL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvX3V0aWwuYzozNjQ6MzA6IHdhcm5pbmc6IGFzc2lnbm1lbnQgdG8g
J3ZvaWQgKicgZnJvbSAnaW50JyBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0
IGEgY2FzdCBbLVdpbnQtY29udmVyc2lvbl0NCj4gICAgICAzNjQgfCAgICAgICAgICAgICAg
ICAgbWFwLT52aXJ0dWFsID0gdm1hcCh0dG0tPnBhZ2VzICsgc3RhcnRfcGFnZSwgbnVtX3Bh
Z2VzLA0KPiAJfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4gICAgLi4vZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jOiBJbiBmdW5jdGlvbiAndHRtX2JvX2t1
bm1hcCc6DQo+ICAgIC4uL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYzo0Mjk6
MTc6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAndnVubWFwJzsg
ZGlkIHlvdSBtZWFuICdrdW5tYXAnPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbl0NCj4gICAgICA0MjkgfCAgICAgICAgICAgICAgICAgdnVubWFwKG1hcC0+dmly
dHVhbCk7DQo+IAl8ICAgICAgICAgICAgICAgICBefn5+fn4NCj4gCXwgICAgICAgICAgICAg
ICAgIGt1bm1hcA0KPiAgICAuLi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmM6
IEluIGZ1bmN0aW9uICd0dG1fYm9fdm1hcCc6DQo+ICAgIC4uL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvX3V0aWwuYzo1MDk6MjM6IHdhcm5pbmc6IGFzc2lnbm1lbnQgdG8gJ3ZvaWQg
KicgZnJvbSAnaW50JyBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2Fz
dCBbLVdpbnQtY29udmVyc2lvbl0NCj4gICAgICA1MDkgfCAgICAgICAgICAgICAgICAgdmFk
ZHIgPSB2bWFwKHR0bS0+cGFnZXMsIHR0bS0+bnVtX3BhZ2VzLCAwLCBwcm90KTsNCj4gCXwg
ICAgICAgICAgICAgICAgICAgICAgIF4NCj4gDQo+IEZpeCB0aGlzIGJ5IGluY2x1ZGluZyA8
bGludXgvdm1hbGxvYy5oPi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9ib191dGlsLmMgfCAyICsrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3V0aWwuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYw0KPiBpbmRleCAx
MjAxN2VjMjRkOWYuLjhlMTlhNDBjYjQxZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdXRpbC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3V0aWwuYw0KPiBAQCAtMjksNiArMjksOCBAQA0KPiAgICAqIEF1dGhvcnM6IFRob21h
cyBIZWxsc3Ryb20gPHRoZWxsc3Ryb20tYXQtdm13YXJlLWRvdC1jb20+DQo+ICAgICovDQo+
ICAgDQo+ICsjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPg0KPiArDQo+ICAgI2luY2x1ZGUg
PGRybS90dG0vdHRtX2JvLmg+DQo+ICAgI2luY2x1ZGUgPGRybS90dG0vdHRtX3BsYWNlbWVu
dC5oPg0KPiAgICNpbmNsdWRlIDxkcm0vdHRtL3R0bV90dC5oPg0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------D51u6L6NuwNR0sasxdQUzYkJ--

--------------SkxWzxinArGQKZ7uRVRHoEpM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPFP3sFAwAAAAAACgkQlh/E3EQov+Ad
wQ/+ICrQIPidKCswB3ng2lggy/JGj5PunuA7tlTo2yto0zwv9PlDg8YuHkM7EdmJSa7Jd5KAo8NL
759cIypjdyVP13CMAasHF/rCy426GM6j3P/IS1JKWhR8tRfxrL/ubs4NbjZbmYlSbj7MGvHIHhU7
MWTBPF07vcfzDO5+Q69+V8yCkICu+qfWFycho6bjwuT2hDwgFWpPg/lfEV5rEBn9vVlL81BY5oxR
qxzN03hsidPMt61IlqyEiAfHRFR/H2/44nfWICQQqq5yHAI3rsQaCtvBGo9k9D3Fmp/I2cwUkifH
tWCvWGdPbOq7i1Jg1rZ6WN/gBsrfLce4szce4eFVX7t0WcStNGDrkxCByRRZKAato9MWVwAbnYqh
CsOLFt+95E//OXp5/jz7nSLIS+xvnE02NvbB8snN6A5Iebb7IpPJH6YcMVGx2MJZiXqbMFzY5Ogt
ECNVgLHNcdHq9ttjH0urpax0twfMxz9RHNHOz9Y0/Y6m+7sf+SWgmQJxhc6jV+SZ8vJvGjbIpd6U
f2FBtW1im8HjKyhdYFEMdM/6TQI2ZfZoO0OlrSg2qMj3PhEJ5Hw5yjDBL4ghwN26+LPUhKft5RAq
x8uWrff2gB7qgFP7Ayp20oWXgr8wWKnRMzVs6WGecBFPiOohCqZHG+Zplnt6eJrE39XJB9w5FpwX
qng=
=vmF2
-----END PGP SIGNATURE-----

--------------SkxWzxinArGQKZ7uRVRHoEpM--
