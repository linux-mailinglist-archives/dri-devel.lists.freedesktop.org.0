Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F89174E6C9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 08:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D685F10E304;
	Tue, 11 Jul 2023 06:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F0A10E304;
 Tue, 11 Jul 2023 06:07:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7EC6C20462;
 Tue, 11 Jul 2023 06:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689055646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SNB82qjZdLZ7yUY3NNXPS6LIosP+r/Oq/i6spbJvFKk=;
 b=uGwAmGri6HCVTDVupX3AnI3pntTkCdCYgBe4MXKpKqrFFM9L58lddK9Gt4ijMk4oe12EKn
 wkZlNhXoT6cUArvw8yZhpNIa/MdNQ2aoLAzzkOX+GJZ8zZTBVtIho0NqepELBnDZss5J1q
 Qz4ED8AO8IXfoitx78CrV1zzRaCsFFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689055646;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SNB82qjZdLZ7yUY3NNXPS6LIosP+r/Oq/i6spbJvFKk=;
 b=GIPxzBl4JRtB2A6zRvJSVOga3qJTO27JVaOO67Q1PDgWQ8Q7AxmxjwVP1QcGLy5J5JrJYb
 2W+F1yRrdWlZNaBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F20F21391C;
 Tue, 11 Jul 2023 06:07:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fIv0OZ3xrGRCBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jul 2023 06:07:25 +0000
Message-ID: <117aea3d-c316-509d-7be7-ade155b4ae85@suse.de>
Date: Tue, 11 Jul 2023 08:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/client: Send hotplug event after registering a client
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, javierm@redhat.com,
 noralf@tronnes.org
References: <20230710091029.27503-1-tzimmermann@suse.de>
 <325dad0e-38ff-9f60-efc9-0fd711d63267@linaro.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <325dad0e-38ff-9f60-efc9-0fd711d63267@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kv6LGauRuWxMfjHq4DW99D2e"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Paul Schyska <pschyska@gmail.com>,
 Torsten Krah <krah.tm@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Moritz Duge <MoritzDuge@kolahilft.de>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kv6LGauRuWxMfjHq4DW99D2e
Content-Type: multipart/mixed; boundary="------------0zZdJ0TsnxmlWUefzoq8m39A";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, javierm@redhat.com,
 noralf@tronnes.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Paul Schyska
 <pschyska@gmail.com>, Torsten Krah <krah.tm@gmail.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Moritz Duge <MoritzDuge@kolahilft.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <117aea3d-c316-509d-7be7-ade155b4ae85@suse.de>
Subject: Re: [PATCH] drm/client: Send hotplug event after registering a client
References: <20230710091029.27503-1-tzimmermann@suse.de>
 <325dad0e-38ff-9f60-efc9-0fd711d63267@linaro.org>
In-Reply-To: <325dad0e-38ff-9f60-efc9-0fd711d63267@linaro.org>

--------------0zZdJ0TsnxmlWUefzoq8m39A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDcuMjMgdW0gMjM6MTEgc2NocmllYiBEbWl0cnkgQmFyeXNoa292Og0K
Wy4uLl0NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZmJk
ZXYuY8KgwqDCoMKgIHzCoCA0IC0tLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xp
ZW50LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIxICsrKysrKysrKysrKysrKysr
KysrKw0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9kbWEuY8KgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCA0IC0tLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZf
Z2VuZXJpYy5jwqDCoMKgwqDCoMKgIHzCoCA0IC0tLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jIHzCoCA0IC0tLS0NCj4+IMKgIGRyaXZlcnMv
Z3B1L2RybS9nbWE1MDAvZmJkZXYuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgLS0t
LQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCA0IC0tLS0NCj4gDQo+IFJldmlld2VkLWJ5OiBEbWl0cnkgQmFyeXNoa292
IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+ICMgbXNtDQoNClRoYW5rcy4NCg0KPiAN
Cj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuY8KgwqDCoMKgwqAg
fMKgIDQgLS0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmJkZXYu
Y8KgwqDCoMKgIHzCoCA0IC0tLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYmRl
di5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0IC0tLS0NCj4+IMKgIDEwIGZpbGVz
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQ0KPiANCj4gQlRX
OiBBcyB5b3UgaGF2ZSBiZWVuIGNsZWFyaW5nIHRoaXMgYXJlYS4gSSBzZWUgdGhhdCBzaWdu
aWZpY2FudCBhbW91bnQgDQo+IG9mIERSTSBkcml2ZXJzIHVzZSBleGFjdGx5IHRoZSBzYW1l
IGNvZGUgZm9yIG1zbV9mYmRldl9jbGllbnRfZnVuY3MgYW5kIA0KPiBmb3IgdGhlIHNpZ25p
ZmljYW50IHBhcnQgb2YgZm9vX2ZiZGV2X3NldHVwKCkuIERvIHlvdSBoYXZlIGFueSBwbGFu
cyBmb3IgDQo+IG1vdmluZyB0aGF0IGludG8gYSBsaWJyYXJ5IC8gZ2VuZXJpYyBjb2RlPyBJ
ZiBub3QsIEkgY2FuIHRha2UgYSBsb29rIGF0IA0KPiBjcmFmdGluZyB0aGUgcGF0Y2guDQo+
IA0KDQpZb3UncmUgbm90IHRoZSBmaXJzdCB0byBhc2suIDopIEkndmUgc28gZmFyIG5vdCBh
dHRlbXB0ZWQgdG8gYWRkcmVzcyANCnRoaXMgZHVwbGljYXRpb24uIEkndmUgYmVlbiBiaXR0
ZW4gYnkgcHJlbWF0dXJlIGhlbHBlcml6YXRpb24gYmVmb3JlLCBzbyANCkkgd2FudGVkIHRv
IHdhaXQgYSBiaXQgbG9uZ2VyLiBBIGxvdCBvZiB0aGUgZmJkZXYgYW5kIGNsaWVudCBjb2Rl
IGlzIA0KY2hhbmdpbmcgcXVpdGUgYSBiaXQuIEFmdGVyIHRoaW5ncyBzdGFiaWxpemVkLCBJ
IHdhbnQgdG8gdG8gdHJ5IHRvIGRvIA0Kc29tZSBtb3JlIGNvZGUgc2hhcmluZy4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1h
bg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------0zZdJ0TsnxmlWUefzoq8m39A--

--------------kv6LGauRuWxMfjHq4DW99D2e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSs8Z0FAwAAAAAACgkQlh/E3EQov+Cd
3RAAplv7WxkxYt9N5gWJ/rlj3B0OIploEOnOdhJzsoMpnmg5IExLL5tbSbEydTMAZy4OV1UbFNlu
gB4XDUfES5IOfn/YMVl8L5uC+FXRrnZfbLqjBKsfycA6CdbMg3GEpiW0u/OUquqkTx7mT4+iICLD
IrLoigA9AHh5KCeXC8aj9TTntbujd8PNfrP0QbBdjOm/81BEVpQTRwHNaqnJcvKXiq9kxARrnZ/1
4TUkPXNiMLdVUX42yN5pEdnUESTsYu6aDCDGN2e67l86wZ4v2Wt5Pi2Y+F3Z5rRLVe0XU1vak1be
vDHhEM5ZSvnJhI/jfJWnx+025vHZ0JqX1jTZ+OrMlREn13ktSJ1R6lQwLSSEMAXAscvvhWEejSGj
xtWwmQ/bzfjuQ7/1TWZDu3MRqKby9U0LOcyOkUakhTKUX8VbZ3Rih7HFxZiEvloiYGVT68sfEyg+
e4z0ahGgZ7gOKpSuIoN6iFfIFg3BfOoGe1UqJKcQLzhmUCv+FutskpJ8ZVZZ+5JeOCFF0Kfe/0AT
kru8rxC7cOVpFqtUEtaX+PwdBAqM5sRLKBx4k+PpoqXzOSAfXgAQUk9Ga53GRQHgW3ekTBedj50a
uGhCCyQHr0fj7qlDjwAbv9hBQ4eN4cDTeeRaHj81jnEeDTldB5P0QZIa+HjgCA8NUHSUEWQJ74zS
dXk=
=E/ok
-----END PGP SIGNATURE-----

--------------kv6LGauRuWxMfjHq4DW99D2e--
