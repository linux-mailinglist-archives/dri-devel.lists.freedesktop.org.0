Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A913E65FCC6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 09:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0A610E515;
	Fri,  6 Jan 2023 08:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEF710E515
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 08:31:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B17738A6E;
 Fri,  6 Jan 2023 08:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672993892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HG1VqAwzoLeMkfon6c+nZLmv9coQSK3o4+pfHb3CeAw=;
 b=NoX5RFb6zK2YVm2+vR3LiHdW4UBKWSh3wN/nD0QeDs2C+rje7RfMG5BQsUxNYP/h7Qh5Rt
 l7aLOMgSCiwFeuvLfO2LGxV8a8sIubJoszqvXYzaDxYbniK4ljpMPSzuoj4ijuLiCTRimV
 3wcTSscD19vSYcYwnLEvOpiTJt8MyLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672993892;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HG1VqAwzoLeMkfon6c+nZLmv9coQSK3o4+pfHb3CeAw=;
 b=yrp1I4d1sGrbzbllhID7u+FA43a1VUOLvW7ruw2EiVKKe/CwuIJuizJvLP7K+GMYQHJCUV
 GAh2nL0gCL0+kKDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE83B139D5;
 Fri,  6 Jan 2023 08:31:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2ydUMWPct2PiTgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Jan 2023 08:31:31 +0000
Message-ID: <98a30f00-c98f-cecb-d681-30b55caf2f8a@suse.de>
Date: Fri, 6 Jan 2023 09:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/msm: Set preferred depth.
Content-Language: en-US
To: Steev Klimaszewski <steev@kali.org>
References: <20230106071609.3948-1-steev@kali.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230106071609.3948-1-steev@kali.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JI9jOwOV1NZL9FyAbPKlkCdo"
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JI9jOwOV1NZL9FyAbPKlkCdo
Content-Type: multipart/mixed; boundary="------------M0Cns4x27DWohdLULB6u10DY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Steev Klimaszewski <steev@kali.org>
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <98a30f00-c98f-cecb-d681-30b55caf2f8a@suse.de>
Subject: Re: [PATCH] drm/msm: Set preferred depth.
References: <20230106071609.3948-1-steev@kali.org>
In-Reply-To: <20230106071609.3948-1-steev@kali.org>

--------------M0Cns4x27DWohdLULB6u10DY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDEuMjMgdW0gMDg6MTYgc2NocmllYiBTdGVldiBLbGltYXN6ZXdza2k6
DQo+IEFzIG9mIGNvbW1pdCAzN2M5MGQ1ODlkYzAgKCJkcm0vZmItaGVscGVyOiBGaXggc2lu
Z2xlLXByb2JlIGNvbG9yLWZvcm1hdA0KPiBzZWxlY3Rpb24iKSwgaWYgbm8gc3VwcG9ydGVk
IGNvbG9yIGZvcm1hdHMgYXJlIGZvdW5kLCBpdCB0cmllcyB0byB1c2UgdGhlDQo+IGRyaXZl
ciBwcm92aWRlZCBkZWZhdWx0LCB3aGljaCBtc20gZGlkbid0IGhhdmUgc2V0IGFuZCBsZWFk
cyB0byB0aGUNCj4gZm9sbG93aW5nIG91dHB1dDoNCj4gDQo+IG1zbV9kcHUgYWUwMTAwMC5k
aXNwbGF5LWNvbnRyb2xsZXI6IFtkcm1dIGJwcC9kZXB0aCB2YWx1ZSBvZiAzMi8wIG5vdCBz
dXBwb3J0ZWQNCj4gbXNtX2RwdSBhZTAxMDAwLmRpc3BsYXktY29udHJvbGxlcjogW2RybV0g
YnBwL2RlcHRoIHZhbHVlIG9mIDMyLzAgbm90IHN1cHBvcnRlZA0KPiBtc21fZHB1IGFlMDEw
MDAuZGlzcGxheS1jb250cm9sbGVyOiBbZHJtXSBicHAvZGVwdGggdmFsdWUgb2YgMzIvMCBu
b3Qgc3VwcG9ydGVkDQo+IG1zbV9kcHUgYWUwMTAwMC5kaXNwbGF5LWNvbnRyb2xsZXI6IFtk
cm1dIE5vIGNvbXBhdGlibGUgZm9ybWF0IGZvdW5kDQo+IC0tLS0tLS0tLS0tLVsgY3V0IGhl
cmUgXS0tLS0tLS0tLS0tLQ0KPiBXQVJOSU5HOiBDUFU6IDAgUElEOiA3MyBhdCBkcml2ZXJz
L2dwdS9kcm0vZHJtX2F0b21pYy5jOjE2MDQgX19kcm1fYXRvbWljX2hlbHBlcl9zZXRfY29u
ZmlnKzB4MjQwLzB4MzNjDQo+IE1vZHVsZXMgbGlua2VkIGluOiBleHQ0IG1iY2FjaGUgamJk
MiBtc20gbWR0X2xvYWRlciBvY21lbSBncHVfc2NoZWQgbGxjY19xY29tIGdwaW9fa2V5cyBx
cnRyDQo+IENQVTogMCBQSUQ6IDczIENvbW06IGt3b3JrZXIvdTE2OjIgTm90IHRhaW50ZWQg
Ni4yLjAtcmMyLW5leHQtMjAyMzAxMDYgIzUzDQo+IEhhcmR3YXJlIG5hbWU6IExFTk9WTyAy
MUJYMDAxNVVTLzIxQlgwMDE1VVMsIEJJT1MgTjNIRVQ3NFcgKDEuNDYgKSAxMC8xMi8yMDIy
DQo+IFdvcmtxdWV1ZTogZXZlbnRzX3VuYm91bmQgZGVmZXJyZWRfcHJvYmVfd29ya19mdW5j
DQo+IHBzdGF0ZTogODA0MDAwMDUgKE56Y3YgZGFpZiArUEFOIC1VQU8gLVRDTyAtRElUIC1T
U0JTIEJUWVBFPS0tKQ0KPiBwYyA6IF9fZHJtX2F0b21pY19oZWxwZXJfc2V0X2NvbmZpZysw
eDI0MC8weDMzYw0KPiBsciA6IF9fZHJtX2F0b21pY19oZWxwZXJfc2V0X2NvbmZpZysweDY4
LzB4MzNjDQo+IHNwIDogZmZmZjgwMDAwOGE3Yjc5MA0KPiB4Mjk6IGZmZmY4MDAwMDhhN2I3
OTAgeDI4OiBmZmZmNzNlZTNlMTMwYTAwIHgyNzogMDAwMDAwMDAwMDAwMDAwMA0KPiB4MjY6
IGZmZmY3M2VlM2QyNTZlMDAgeDI1OiAwMDAwMDAwMDAwMDAwMDM4IHgyNDogZmZmZjczZTZj
MGQ2NWUwMA0KPiB4MjM6IGZmZmY3M2U2YzE3YTc4MDAgeDIyOiBmZmZmNzNlNmMwZDY0ZTAw
IHgyMTogZmZmZjczZTc5YzAyNWUwMA0KPiB4MjA6IDAwMDAwMDAwYzBkNjRlMDAgeDE5OiBm
ZmZmNzNlZTNlMTMwYTAwIHgxODogZmZmZmZmZmZmZmZmZmZmZg0KPiB4MTc6IDY2MjA3NDYx
NmQ3MjZmNjYgeDE2OiAyMDY1NmM2MjY5NzQ2MTcwIHgxNTogMDAwMDAwMDAwMDAwMDAwMA0K
PiB4MTQ6IDAwMDAwMDAwMDAwMDAwMDAgeDEzOiAwMDAwMDAwMDAwMDAwMDAwIHgxMjogMDAw
MDAwMDAwMDAwMDAwMA0KPiB4MTE6IDAwMDAwMDAwMDAwMDAwMDAgeDEwOiAwMDAwMDAwMDAw
MDAwMDAwIHg5IDogZmZmZmE4MjkxNDRmZjhiYw0KPiB4OCA6IDAwMDAwMDAwMDAwMDAwMDAg
eDcgOiAwMDAwMDAwMDAwMDAwMDAwIHg2IDogMDAwMDAwMDAwMDAwMDAwMA0KPiB4NSA6IGZm
ZmY3M2U2YzBkNjVmNTAgeDQgOiBmZmZmNzNlZTNkMjU0OTUwIHgzIDogZmZmZjczZTZjMGQ2
NWVjMA0KPiB4MiA6IGZmZmY3M2VlM2M5NTNhMDAgeDEgOiBmZmZmNzNlNzljMDI1NTgwIHgw
IDogMDAwMDAwMDAwMDAwMDAwMA0KPiBDYWxsIHRyYWNlOg0KPiBfX2RybV9hdG9taWNfaGVs
cGVyX3NldF9jb25maWcrMHgyNDAvMHgzM2MNCj4gZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1p
dF9hdG9taWMrMHgxNjAvMHgyODANCj4gZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9sb2Nr
ZWQrMHg2NC8weDE5NA0KPiBkcm1fY2xpZW50X21vZGVzZXRfY29tbWl0KzB4MzgvMHg2MA0K
PiBfX2RybV9mYl9oZWxwZXJfaW5pdGlhbF9jb25maWdfYW5kX3VubG9jaysweDUyOC8weDYz
Yw0KPiBkcm1fZmJfaGVscGVyX2luaXRpYWxfY29uZmlnKzB4NTQvMHg2NA0KPiBtc21fZmJk
ZXZfaW5pdCsweDk0LzB4ZmMgW21zbV0NCj4gbXNtX2RybV9iaW5kKzB4NTQ4LzB4NjE0IFtt
c21dDQo+IHRyeV90b19icmluZ191cF9hZ2dyZWdhdGVfZGV2aWNlKzB4MWU0LzB4MmQwDQo+
IF9fY29tcG9uZW50X2FkZCsweGM0LzB4MWMwDQo+IGNvbXBvbmVudF9hZGQrMHgxYy8weDJj
DQo+IGRwX2Rpc3BsYXlfcHJvYmUrMHgyYTQvMHg0NjAgW21zbV0NCj4gcGxhdGZvcm1fcHJv
YmUrMHg3MC8weGNjDQo+IHJlYWxseV9wcm9iZSsweGM4LzB4M2UwDQo+IF9fZHJpdmVyX3By
b2JlX2RldmljZSsweDg0LzB4MTkwDQo+IGRyaXZlcl9wcm9iZV9kZXZpY2UrMHg0NC8weDEy
MA0KPiBfX2RldmljZV9hdHRhY2hfZHJpdmVyKzB4YzQvMHgxNjANCj4gYnVzX2Zvcl9lYWNo
X2RydisweDg0LzB4ZTANCj4gX19kZXZpY2VfYXR0YWNoKzB4YTQvMHgxY2MNCj4gZGV2aWNl
X2luaXRpYWxfcHJvYmUrMHgxYy8weDJjDQo+IGJ1c19wcm9iZV9kZXZpY2UrMHhhNC8weGIw
DQo+IGRlZmVycmVkX3Byb2JlX3dvcmtfZnVuYysweGMwLzB4MTE0DQo+IHByb2Nlc3Nfb25l
X3dvcmsrMHgxZWMvMHg0NzANCj4gd29ya2VyX3RocmVhZCsweDc0LzB4NDEwDQo+IGt0aHJl
YWQrMHhmYy8weDExMA0KPiByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMA0KPiAtLS1bIGVuZCB0
cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWV2
IEtsaW1hc3pld3NraSA8c3RlZXZAa2FsaS5vcmc+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX2Rydi5jIHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYw0KPiBpbmRleCA4YjBiMGFjNzRh
NmYuLjY1YzRjOTNjMzExZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMNCj4gQEAg
LTQ3OSw2ICs0NzksNyBAQCBzdGF0aWMgaW50IG1zbV9kcm1faW5pdChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyICpkcnYpDQo+ICAgDQo+ICAgCWRybV9o
ZWxwZXJfbW92ZV9wYW5lbF9jb25uZWN0b3JzX3RvX2hlYWQoZGRldik7DQo+ICAgDQo+ICsJ
ZGRldi0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMjQ7DQoNClJldmlld2VkLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiAgIAlkZGV2LT5tb2RlX2NvbmZpZy5mdW5jcyA9ICZtb2RlX2Nv
bmZpZ19mdW5jczsNCj4gICAJZGRldi0+bW9kZV9jb25maWcuaGVscGVyX3ByaXZhdGUgPSAm
bW9kZV9jb25maWdfaGVscGVyX2Z1bmNzOw0KPiAgIA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------M0Cns4x27DWohdLULB6u10DY--

--------------JI9jOwOV1NZL9FyAbPKlkCdo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO33GMFAwAAAAAACgkQlh/E3EQov+Cz
zg//U02GWbJfriXZpRxffIMuJBmMFNl6B4fhJnfUCaKP8qRYMsX8aFqj+IgeSDa+7eRKX7hp5MGS
sYQHzLEFTNspZhpjTkYjWnIlvtg5rALKMDZaE4G6ephEP9GoR350V8qKJsqMcI+2VlqnB7E7viNH
UXMqQur/HJhPcSoolUu2+OSBBgoARP9EISz+LPOP/EeHxT2+PnNw348WbHvz9ykS4M6d7QdRSgTt
6hVmbXMnENbH/oVut/S3WRT3RMgZzf7SYg0XCr7z9Eq8gBqBFroS6xam98x97I5Yh/1JWngHiaXv
H6oHVA4ADhOHimjMAZbC9j+veAUKsVzRDP6cvJniKreEAD2LOLQl7EuZZgmag97Bpphjd2Zh5vzi
XDsmL0NxFqAmNx/5rzKg6zyK7nMri9r4rN5c3oOiJCh0fyHd81miQOhgTmCwHUDliasUx03diV2s
m05LWxGS3JdtVUo5sKYqFnV3jqktBf336ayElRlaTwmYrYD8PRQQ1qIYDQ0Dxt+ykuxSKjdx2Ca7
GgSzhMXJ3au8u9pdLrVcRgtRThFq1FsktCu98KyJPIlFR7fB+AVxmaVHOWyYziJtiQzipHEzQc2D
Oo02YyDYYh3yDUhCrSFT+fI/IN4lQKHr5Y/rcp+CtrYNCXkWLTa62tefIH9I054j9ZxiZ/gV/SR6
EFo=
=mTAV
-----END PGP SIGNATURE-----

--------------JI9jOwOV1NZL9FyAbPKlkCdo--
