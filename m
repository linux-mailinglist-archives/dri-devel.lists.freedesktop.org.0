Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8D66A5546
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 10:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3217A10E4B4;
	Tue, 28 Feb 2023 09:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1257E10E4B4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 09:14:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C8E6E219C4;
 Tue, 28 Feb 2023 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677575682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kL664kkG+dMis5sIi6xKYHNRXSQgBnyCYWIvBB3XtpU=;
 b=ZUbb0bjEYCFYTfKS6GVYzYCm7u0TIfQ5UPPWr0fTsTOZYJjKcBTemQTrxOgFIjesCU/XwS
 ohD4vMfRKuXIazGOOpZHmDtRGvmZ+3M9SjfjHL80e6wTaoRGzyFIawn/tjjGeQG+IfWigA
 WTaH/gzfKvoiKa/HRxUUphNZv9KPmyo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677575682;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kL664kkG+dMis5sIi6xKYHNRXSQgBnyCYWIvBB3XtpU=;
 b=zzJ13vmTADmbJfrVfMqKkiwUZgMwV0SEGvtxG5yCsV/xtj9eKFqt+EKG6RGtGJ4WizEGTu
 v/CMy75vGjRjD8Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8624313440;
 Tue, 28 Feb 2023 09:14:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xxrMHwLG/WNnLgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Feb 2023 09:14:42 +0000
Message-ID: <2831bbfd-3c50-f13b-663b-86d8fffddece@suse.de>
Date: Tue, 28 Feb 2023 10:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/shmem-helper: Revert accidental non-GPL export
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230227-shmem-export-fix-v1-1-8880b2c25e81@asahilina.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230227-shmem-export-fix-v1-1-8880b2c25e81@asahilina.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------E71VpYn7gQDkQ3I9QS1HCmjh"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------E71VpYn7gQDkQ3I9QS1HCmjh
Content-Type: multipart/mixed; boundary="------------4PJvhnfl0kfPmxg5nS002phf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Rob Herring <robh@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <2831bbfd-3c50-f13b-663b-86d8fffddece@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Revert accidental non-GPL export
References: <20230227-shmem-export-fix-v1-1-8880b2c25e81@asahilina.net>
In-Reply-To: <20230227-shmem-export-fix-v1-1-8880b2c25e81@asahilina.net>

--------------4PJvhnfl0kfPmxg5nS002phf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QWRkZWQgdG8gZHJtLW1pc2MtbmV4dC1maXhlcy4NCg0KQW0gMjcuMDIuMjMgdW0gMTA6MDQg
c2NocmllYiBBc2FoaSBMaW5hOg0KPiBUaGUgcmVmZXJlbmNlZCBjb21taXQgYWRkZWQgYSB3
cmFwcGVyIGZvciBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3QoKSwNCj4gYnV0IGluIHRo
ZSBwcm9jZXNzIGl0IGFjY2lkZW50YWxseSBjaGFuZ2VkIHRoZSBleHBvcnQgdHlwZSBmcm9t
IEdQTCB0bw0KPiBub24tR1BMLiBTd2l0Y2ggaXQgYmFjayB0byBHUEwuDQo+IA0KPiBSZXBv
cnRlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNv
bT4NCj4gRml4ZXM6IGRkZGRlZGFhMGRiOSAoImRybS9zaG1lbS1oZWxwZXI6IEZpeCBsb2Nr
aW5nIGZvciBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3QoKSIpDQo+IFNpZ25lZC1vZmYt
Ynk6IEFzYWhpIExpbmEgPGxpbmFAYXNhaGlsaW5hLm5ldD4NCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCAyICstDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPiBpbmRleCA3ZTVjNmE4ZDAyMTIuLjc1
MTg1YTk2MGZjNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2ht
ZW1faGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVs
cGVyLmMNCj4gQEAgLTc0NCw3ICs3NDQsNyBAQCBzdHJ1Y3Qgc2dfdGFibGUgKmRybV9nZW1f
c2htZW1fZ2V0X3BhZ2VzX3NndChzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVt
KQ0KPiAgIA0KPiAgIAlyZXR1cm4gc2d0Ow0KPiAgIH0NCj4gLUVYUE9SVF9TWU1CT0woZHJt
X2dlbV9zaG1lbV9nZXRfcGFnZXNfc2d0KTsNCj4gK0VYUE9SVF9TWU1CT0xfR1BMKGRybV9n
ZW1fc2htZW1fZ2V0X3BhZ2VzX3NndCk7DQo+ICAgDQo+ICAgLyoqDQo+ICAgICogZHJtX2dl
bV9zaG1lbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgLSBQcm9kdWNlIGEgc2htZW0gR0VNIG9i
amVjdCBmcm9tDQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IGYzYTI0MzlmMjBkOTE4OTMw
Y2M0YWU4Zjc2ZmUxYzFhZmQyNjk1OGYNCj4gY2hhbmdlLWlkOiAyMDIzMDIyNy1zaG1lbS1l
eHBvcnQtZml4LTg1ZmRlMTM1MTEwNA0KPiANCj4gVGhhbmsgeW91LA0KPiB+fiBMaW5hDQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------4PJvhnfl0kfPmxg5nS002phf--

--------------E71VpYn7gQDkQ3I9QS1HCmjh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP9xgAFAwAAAAAACgkQlh/E3EQov+Ad
zQ//bNknRSzGQGWxmY+vV3koYBKDx7HjeYR5nXKmaSKJ1YAlgCRjIiKkY4HKwPmoMC6scO3mtqkU
FW/s2q8mwvaM6oPPIbmw2pLbvLVkNMXCxU/ksaj4/HeHzCbpfhqJ0XmCBQZpyfRvWc0Xq1AL5Lyq
wwl6ZFuqjYBDo57rw0JzKBq94CBO79knv+DSF/V8sxZNJ5yCvqMyw164Vn+PxJAti3XvVIjDfIL2
liX8LTFAtUMfjypSil71ojy6K/t+Pg+1i2611BUY8QtK1NCBfzPOPdisqA4rRABQ162MouAGE2tR
hayFDMCahS2O74nOwuQd6PxiQV1AbxmAm5yozq8eH+KR/QhHDXGYVqtpTdiPorDE6FSRUCH2cEMI
+STxgoRvDm8OLXlT2AaEjTw+YzovfxGY3Pw/70zjAIBoS8JxC/HCxpDiZ2QWL/8u+BlE6/XFcVT7
RWV/k3+lWi+DRfrfj3Febr5uo2/cvZ88ZwwkxsF8lw3tDqwjG8tJ5U5PYpGqstFL/avvqXmNTw1I
KFoSRerB+4oqH8LV9NjdGjH1+QFYyKBM9vvQprZ3ZaKMAOYPQef1pdXVNwg+jeAdlnfTetpFF0yZ
y6oKsy67fY3Hk/nd6oTW/7TFaRLqdHFiGmSbNewAaKrbGWgZunus4dF/MC7X4SvOTP4yVx8Rd28g
9g0=
=FQ2z
-----END PGP SIGNATURE-----

--------------E71VpYn7gQDkQ3I9QS1HCmjh--
