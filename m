Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4760CB62
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 13:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A845510E34F;
	Tue, 25 Oct 2022 11:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA8D10E34F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 11:57:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 497192203C;
 Tue, 25 Oct 2022 11:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666699062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=skS+PlJBVY1Fe5Q+FBffukdEndCSqCEtqFTzQI42RXM=;
 b=ZR1FCh9PYr4svBwPN7pxt1S97TuKIi30LxC1v0/tLAE3xC6KYQfaZvTmUdRwSRMLIOF8gM
 WvJhdMjA2LqIOUQ+W4Ft6wspb3M7xyFjYF0FuQ3+JftqB78rdUALPRTWE85WE20jLvaIy8
 G+JCupiOQNWVTItdQSex+zzNqyfXOE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666699062;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=skS+PlJBVY1Fe5Q+FBffukdEndCSqCEtqFTzQI42RXM=;
 b=bTvyCBNVjYrNM3EKd/PRH4zxzBcRrd7AbmK2o1xFC4VU3nt/49D8LMN+4bsWeohaBUZLG7
 ZhjVZ2NaXeDKnTCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2233D134CA;
 Tue, 25 Oct 2022 11:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hpRaBzbPV2NTCQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Oct 2022 11:57:42 +0000
Message-ID: <c276b8c2-9639-37ff-9253-06cfa52d3fd7@suse.de>
Date: Tue, 25 Oct 2022 13:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 1/7] drm/ivpu: Introduce a new DRM driver for Intel VPU
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-2-jacek.lawrynowicz@linux.intel.com>
 <68171df1-1241-cd09-f3bf-12919828b868@quicinc.com>
 <d08ff59d-0a91-02bf-f08e-63b56e63df99@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <d08ff59d-0a91-02bf-f08e-63b56e63df99@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xt96isfYT8s8LOShXcg0MoSf"
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xt96isfYT8s8LOShXcg0MoSf
Content-Type: multipart/mixed; boundary="------------rST31Yz4XXZu9Q0uL8Ru7NMk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel@ffwll.ch
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Message-ID: <c276b8c2-9639-37ff-9253-06cfa52d3fd7@suse.de>
Subject: Re: [PATCH v3 1/7] drm/ivpu: Introduce a new DRM driver for Intel VPU
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-2-jacek.lawrynowicz@linux.intel.com>
 <68171df1-1241-cd09-f3bf-12919828b868@quicinc.com>
 <d08ff59d-0a91-02bf-f08e-63b56e63df99@linux.intel.com>
In-Reply-To: <d08ff59d-0a91-02bf-f08e-63b56e63df99@linux.intel.com>

--------------rST31Yz4XXZu9Q0uL8Ru7NMk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMTAuMjIgdW0gMTM6NDIgc2NocmllYiBKYWNlayBMYXdyeW5vd2ljejoN
Cj4gSGksIHRoYW5rcyBmb3IgZGV0YWlsZWQgcmV2aWV3LiBNeSByZXNwb25zZXMgaW5saW5l
Lg0KPiANCj4gT24gMTAvMjUvMjAyMiAxOjAwIEFNLCBKZWZmcmV5IEh1Z28gd3JvdGU6DQo+
PiBPbiA5LzI0LzIwMjIgOToxMSBBTSwgSmFjZWsgTGF3cnlub3dpY3ogd3JvdGU6DQo+Pj4g
VlBVIHN0YW5kcyBmb3IgVmVyc2F0aWxlIFByb2Nlc3NpbmcgVW5pdCBhbmQgaXQncyBhIENQ
VS1pbnRlZ3JhdGVkDQo+Pj4gaW5mZXJlbmNlIGFjY2VsZXJhdG9yIGZvciBDb21wdXRlciBW
aXNpb24gYW5kIERlZXAgTGVhcm5pbmcNCj4+PiBhcHBsaWNhdGlvbnMuDQo+Pj4NCj4+PiBU
aGUgVlBVIGRldmljZSBjb25zaXN0IG9mIGZvbGxvd2luZyBjb21wb25lbnN0czoNCj4+PiAg
ICAgLSBCdXR0cmVzcyAtIHByb3ZpZGVzIENQVSB0byBWUFUgaW50ZWdyYXRpb24sIGludGVy
cnVwdCwgZnJlcXVlbmN5IGFuZA0KPj4+ICAgICAgIHBvd2VyIG1hbmFnZW1lbnQuDQo+Pj4g
ICAgIC0gTWVtb3J5IE1hbmFnZW1lbnQgVW5pdCAoYmFzZWQgb24gQVJNIE1NVS02MDApIC0g
dHJhbnNsYXRlcyBWUFUgdG8NCj4+PiAgICAgICBob3N0IERNQSBhZGRyZXNzZXMsIGlzb2xh
dGVzIHVzZXIgd29ya2xvYWRzLg0KPj4+ICAgICAtIFJJU0MgYmFzZWQgbWljcm9jb250cm9s
bGVyIC0gZXhlY3V0ZXMgZmlybXdhcmUgdGhhdCBwcm92aWRlcyBqb2INCj4+PiAgICAgICBl
eGVjdXRpb24gQVBJIGZvciB0aGUga2VybmVsLW1vZGUgZHJpdmVyDQo+Pj4gICAgIC0gTmV1
cmFsIENvbXB1dGUgU3Vic3lzdGVtIChOQ1MpIC0gZG9lcyB0aGUgYWN0dWFsIHdvcmssIHBy
b3ZpZGVzDQo+Pj4gICAgICAgQ29tcHV0ZSBhbmQgQ29weSBlbmdpbmVzLg0KPj4+ICAgICAt
IE5ldHdvcmsgb24gQ2hpcCAoTm9DKSAtIG5ldHdvcmsgZmFicmljIGNvbm5lY3RpbmcgYWxs
IHRoZSBjb21wb25lbnRzDQo+Pj4NCj4+PiBUaGlzIGRyaXZlciBzdXBwb3J0cyBWUFUgSVAg
djIuNyBpbnRlZ3JhdGVkIGludG8gSW50ZWwgTWV0ZW9yIExha2UNCj4+PiBjbGllbnQgQ1BV
cyAoMTR0aCBnZW5lcmF0aW9uKS4NCj4+Pg0KPj4+IE1vZHVsZSBzb3VyY2VzIGFyZSBhdCBk
cml2ZXJzL2dwdS9kcm0vaXZwdSBhbmQgbW9kdWxlIG5hbWUgaXMNCj4+PiAiaW50ZWxfdnB1
LmtvIi4NCj4+Pg0KPj4+IFRoaXMgcGF0Y2ggaW5jbHVkZXMgb25seSB2ZXJ5IGJlc2ljIGZ1
bmN0aW9uYWxpdHk6DQo+Pj4gICAgIC0gbW9kdWxlLCBQQ0kgZGV2aWNlIGFuZCBJUlEgaW5p
dGlhbGl6YXRpb24NCj4+PiAgICAgLSByZWdpc3RlciBkZWZpbml0aW9ucyBhbmQgbG93IGxl
dmVsIHJlZ2lzdGVyIG1hbmlwdWxhdGlvbiBmdW5jdGlvbnMNCj4+PiAgICAgLSBTRVQvR0VU
X1BBUkFNIGlvY3Rscw0KPj4+ICAgICAtIHBvd2VyIHVwIHdpdGhvdXQgZmlybXdhcmUNCj4+
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEtyeXN0aWFuIFByYWR6eW5za2kgPGtyeXN0aWFuLnBy
YWR6eW5za2lAbGludXguaW50ZWwuY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IEphY2VrIExh
d3J5bm93aWN6IDxqYWNlay5sYXdyeW5vd2ljekBsaW51eC5pbnRlbC5jb20+DQo+Pj4gLS0t
DQo+Pj4gICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA4
ICsNCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAg
IDIgKw0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAgIHwg
ICAgMSArDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2l2cHUvS2NvbmZpZyAgICAgICAgICAg
fCAgIDEyICsNCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vaXZwdS9NYWtlZmlsZSAgICAgICAg
ICB8ICAgIDggKw0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9pdnB1L1RPRE8gICAgICAgICAg
ICAgIHwgICAgNyArDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9kcnYuYyAg
ICAgICAgfCAgMzkyICsrKysrKysrKw0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2
cHVfZHJ2LmggICAgICAgIHwgIDE1MyArKysrDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2l2
cHUvaXZwdV9ody5oICAgICAgICAgfCAgMTY5ICsrKysNCj4+PiAgICBkcml2ZXJzL2dwdS9k
cm0vaXZwdS9pdnB1X2h3X210bC5jICAgICB8IDEwMjEgKysrKysrKysrKysrKysrKysrKysr
KysrDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9od19tdGxfcmVnLmggfCAg
NDY4ICsrKysrKysrKysrDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9od19y
ZWdfaW8uaCAgfCAgMTE1ICsrKw0KPj4+ICAgIGluY2x1ZGUvdWFwaS9kcm0vaXZwdV9kcm0u
aCAgICAgICAgICAgIHwgICA5NSArKysNCj4+PiAgICAxMyBmaWxlcyBjaGFuZ2VkLCAyNDUx
IGluc2VydGlvbnMoKykNCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL2l2cHUvS2NvbmZpZw0KPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vaXZwdS9NYWtlZmlsZQ0KPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vaXZwdS9UT0RPDQo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9pdnB1L2l2cHVfZHJ2LmMNCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL2l2cHUvaXZwdV9kcnYuaA0KPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X2h3LmgNCj4+PiAgICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9od19tdGwuYw0KPj4+ICAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X2h3X210bF9yZWcuaA0K
Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X2h3
X3JlZ19pby5oDQo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvdWFwaS9kcm0v
aXZwdV9kcm0uaA0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRB
SU5FUlMNCj4+PiBpbmRleCA5NDc1YWE3MDFhM2YuLmQ3MmNlZWYxMDdlNiAxMDA2NDQNCj4+
PiAtLS0gYS9NQUlOVEFJTkVSUw0KPj4+ICsrKyBiL01BSU5UQUlORVJTDQo+Pj4gQEAgLTcw
NDYsNiArNzA0NiwxNCBAQCBGOiAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZ3B1L3ZpdmFudGUsZ2MueWFtbA0KPj4+ICAgIEY6ICAgIGRyaXZlcnMvZ3B1L2RybS9l
dG5hdml2Lw0KPj4+ICAgIEY6ICAgIGluY2x1ZGUvdWFwaS9kcm0vZXRuYXZpdl9kcm0uaA0K
Pj4+ICAgICtEUk0gRFJJVkVSUyBGT1IgVlBVDQo+Pj4gK006ICAgIEphY2VrIExhd3J5bm93
aWN6IDxqYWNlay5sYXdyeW5vd2ljekBsaW51eC5pbnRlbC5jb20+DQo+Pj4gK006ICAgIFN0
YW5pc2xhdyBHcnVzemthIDxzdGFuaXNsYXcuZ3J1c3prYUBsaW51eC5pbnRlbC5jb20+DQo+
Pj4gK1M6ICAgIFN1cHBvcnRlZA0KPj4+ICtUOiAgICBnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZHJtL2RybS1taXNjDQo+Pj4gK0Y6ICAgIGRyaXZlcnMvZ3B1L2RybS9p
dnB1Lw0KPj4+ICtGOiAgICBpbmNsdWRlL3VhcGkvZHJtL2l2cHVfZHJtLmgNCj4+DQo+PiBO
byBtYWlsIGxpc3Q/DQo+IA0KPiBPSywgSSB3aWxsIGFkZCBhIGxpbmsgdG8gZHJpLWRldmVs
Lg0KPiANCj4+PiArDQo+Pj4gICAgRFJNIERSSVZFUlMgRk9SIFhFTg0KPj4+ICAgIE06ICAg
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFt
LmNvbT4NCj4+PiAgICBMOiAgICBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnIGIvZHJpdmVycy9ncHUv
ZHJtL0tjb25maWcNCj4+PiBpbmRleCAxOThiYTg0NmQzNGIuLjBhYWFjMGU1MzY2ZiAxMDA2
NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9LY29uZmlnDQo+Pj4gQEAgLTM2NCw2ICszNjQsOCBAQCBzb3VyY2UgImRy
aXZlcnMvZ3B1L2RybS92M2QvS2NvbmZpZyINCj4+PiAgICAgIHNvdXJjZSAiZHJpdmVycy9n
cHUvZHJtL3ZjNC9LY29uZmlnIg0KPj4+ICAgICtzb3VyY2UgImRyaXZlcnMvZ3B1L2RybS9p
dnB1L0tjb25maWciDQo+Pj4gKw0KPj4NCj4+IFdoeSBoZXJlIG9mIGFsbCBwbGFjZXM/ICBK
dXN0IHJhbmRvbWx5IGluIHRoZSBtaWRkbGUgb2YgdGhlIGxpc3Qgb2Ygc291cmNlZCBLY29u
Zmlncz8NCj4gDQo+IEknbGwgbW92ZSBpdCB0byB0aGUgZW5kLg0KDQpJIGtub3duIHRoYXQg
dGhlIEtjb25maWdzIGFuZCBNYWtlZmlsZXMgYXJlIGNoYW90aWMuIEJ1dCBpZiB5b3UgY2Fu
LCB0cnkgDQp0byBzb3J0IGl0IGFscGhhYmV0aWNhbGx5Lg0KDQo+IA0KPj4+ICAgIHNvdXJj
ZSAiZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvS2NvbmZpZyINCj4+PiAgICAgIHNvdXJjZSAi
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9LY29uZmlnIg0KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUNCj4+
PiBpbmRleCAyNWQwYmEzMTA1MDkuLjFiZmQ3NDE1YzJkMCAxMDA2NDQNCj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vTWFr
ZWZpbGUNCj4+PiBAQCAtOTQsNiArOTQsNyBAQCBvYmotJChDT05GSUdfRFJNX0tNQl9ESVNQ
TEFZKSAgKz0ga21iLw0KPj4+ICAgIG9iai0kKENPTkZJR19EUk1fTUdBRzIwMCkgKz0gbWdh
ZzIwMC8NCj4+PiAgICBvYmotJChDT05GSUdfRFJNX1YzRCkgICs9IHYzZC8NCj4+PiAgICBv
YmotJChDT05GSUdfRFJNX1ZDNCkgICs9IHZjNC8NCj4+PiArb2JqLSQoQ09ORklHX0RSTV9J
VlBVKSAgKz0gaXZwdS8NCj4+DQo+PiBBZ2Fpbiwgd2h5IGhlcmU/DQo+IA0KPiBJJ2xsIG1v
dmUgaXQgdG8gdGhlIGVuZC4NCg0KU2FtZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------rST31Yz4XXZu9Q0uL8Ru7NMk--

--------------xt96isfYT8s8LOShXcg0MoSf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNXzzUFAwAAAAAACgkQlh/E3EQov+A4
ww//et4aP/vDLVr2K07zxg8XnYkPJHmaC1Nz6D9WztrDTQbG5iWRCF/PPYO7phtn6RWyXUQbSAIn
IdoQED+w7BqQD9ugUctOiMRJcX7jzikEiRtHmhvevQiYIUOsTbpgEzQJm7eCcnGG+pDGrdA3dIWw
HICfVzX1rtO+4oSr4UErPn6Q3AU45Gf5S5hhXPHR3rXlyk/h4hiSBl1BzMDe/+NCCnpwc1QaDlGu
leFEtmWXMz3sQ5aUTADqSj+8b4IX9nH3lOvTwyS2N/pSY/l0zg4nDzxutB4ZfwmsY7c7AuAPGMEL
HVM2UVyhvGc0OcQyzE2Tln703htgA9mggI5uQ2Av82Y+pAEJpiM+2i+l7tbPZsXkwrNSh/xDroFI
8z4cF/W4qg2Xq2Et3mGeQJPOTGC//j5jZkY3GKgLZp0EnSR55QEG6C1lmYKkAG79UEgO8j2PSqBl
6FQYrYfJ2guqGTMeBkSOStRqZmQZvs5Z6A4+ZbF/0DEKl+aPfmfubafo52BtJuhq6q1djBmbPd+I
XSqDXp5qrRcO2nQFCsAY5nXA8Xm89oabjPYUKT9SdlcaDq5nfbco1v+1kpCCnbxnyKySgot6or2a
Iomqn2OWOeRV1dGTEmu2Otf6FVVN2etdwYbR+NlRgF2FwB6mq2hc6W9fcf7kdi5+lWG8ctCNLcHt
rUA=
=Ln8e
-----END PGP SIGNATURE-----

--------------xt96isfYT8s8LOShXcg0MoSf--
