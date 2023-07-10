Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CC274D269
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 11:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC20710E172;
	Mon, 10 Jul 2023 09:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AFA10E0F1;
 Mon, 10 Jul 2023 09:58:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A935121F0E;
 Mon, 10 Jul 2023 09:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688983131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GvnjoW3g/Yhbetf1CpEHHC9av6tL/nbCORcUKb9FiY0=;
 b=YUpm422VmaeMb/1/x0/I6LomqpN/khgdWLI/I4n4VSj8h8Qu0kBITuTFdrQNT81S+X0Ure
 cOAmS9PlFn5Td4kNpX5S4nmUmulEeVV0gJbiIqJbsC6zYV1VHtDGEu6qGAkCfl4/M81Sbl
 qF+t0IQSGwBU0Bp1F+7/LhHNGa23HJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688983131;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GvnjoW3g/Yhbetf1CpEHHC9av6tL/nbCORcUKb9FiY0=;
 b=ojUwtm56Y8O/npNBSENUt/NB+Ksi02uCMuwmqP/xkY7TN0zTWHelzUWRMlfajzKhMOf2wo
 3c4U9bolzMDxw9BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0FC3F13A05;
 Mon, 10 Jul 2023 09:58:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GaumAlvWq2SKNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 09:58:51 +0000
Message-ID: <72ddab83-abec-b096-6c91-9cb2083c4c0a@suse.de>
Date: Mon, 10 Jul 2023 11:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/client: Send hotplug event after registering a client
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, noralf@tronnes.org
References: <20230710091029.27503-1-tzimmermann@suse.de>
 <87edlghz5e.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87edlghz5e.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1vdugXBSagH09XaDcfo6AQRC"
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
 Thierry Reding <thierry.reding@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Paul Schyska <pschyska@gmail.com>,
 Torsten Krah <krah.tm@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Moritz Duge <MoritzDuge@kolahilft.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1vdugXBSagH09XaDcfo6AQRC
Content-Type: multipart/mixed; boundary="------------ogGQXvUxAG6vOXW98TdFWf32";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org, Moritz Duge <MoritzDuge@kolahilft.de>,
 Torsten Krah <krah.tm@gmail.com>, Paul Schyska <pschyska@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, stable@vger.kernel.org
Message-ID: <72ddab83-abec-b096-6c91-9cb2083c4c0a@suse.de>
Subject: Re: [PATCH] drm/client: Send hotplug event after registering a client
References: <20230710091029.27503-1-tzimmermann@suse.de>
 <87edlghz5e.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87edlghz5e.fsf@minerva.mail-host-address-is-not-set>

--------------ogGQXvUxAG6vOXW98TdFWf32
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDcuMjMgdW0gMTE6NTIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPj4gR2VuZXJhdGUgYSBob3RwbHVnIGV2
ZW50IGFmdGVyIHJlZ2lzdGVyaW5nIGEgY2xpZW50IHRvIGFsbG93IHRoZQ0KPj4gY2xpZW50
IHRvIGNvbmZpZ3VyZSBpdHMgZGlzcGxheS4gUmVtb3ZlIHRoZSBob3RwbHVnIGNhbGxzIGZy
b20gdGhlDQo+PiBleGlzdGluZyBjbGllbnRzIGZvciBmYmRldiBlbXVsYXRpb24uIFRoaXMg
Y2hhbmdlIGZpeGVzIGEgY29uY3VycmVuY3kNCj4+IGJ1ZyBiZXR3ZWVuIHJlZ2lzdGVyaW5n
IGEgY2xpZW50IGFuZCByZWNlaXZpbmcgZXZlbnRzIGZyb20gdGhlIERSTQ0KPj4gY29yZS4g
VGhlIGJ1ZyBpcyBwcmVzZW50IGluIHRoZSBmYmRldiBlbXVsYXRpb24gb2YgYWxsIGRyaXZl
cnMuDQo+Pg0KPj4gVGhlIGZiZGV2IGVtdWxhdGlvbiBjdXJyZW50bHkgZ2VuZXJhdGVzIGEg
aG90cGx1ZyBldmVudCBiZWZvcmUNCj4+IHJlZ2lzdGVyaW5nIHRoZSBjbGllbnQgdG8gdGhl
IGRldmljZS4gRm9yIGVhY2ggbmV3IG91dHB1dCwgdGhlIERSTQ0KPj4gY29yZSBzZW5kcyBh
biBhZGRpdGlvbmFsIGhvdHBsdWcgZXZlbnQgdG8gZWFjaCByZWdpc3RlcmVkIGNsaWVudC4N
Cj4+DQo+PiBJZiB0aGUgRFJNIGNvcmUgZGV0ZWN0cyBmaXJzdCBvdXRwdXQgYmV0d2VlbiBz
ZW5kaW5nIHRoZSBhcnRpZmljaWFsDQo+PiBob3RwbHVnIGFuZCByZWdpc3RlcmluZyB0aGUg
ZGV2aWNlLCB0aGUgb3V0cHV0J3MgaG90cGx1ZyBldmVudCBnZXRzDQo+PiBsb3N0LiBJZiB0
aGlzIGlzIHRoZSBmaXJzdCBvdXRwdXQsIHRoZSBmYmRldiBjb25zb2xlIGRpc3BsYXkgcmVt
YWlucw0KPj4gZGFyay4gVGhpcyBoYXMgYmVlbiBvYnNlcnZlZCB3aXRoIGFtZGdwdSBhbmQg
ZmJkZXYtZ2VuZXJpYy4NCj4+DQo+PiBGaXggdGhpcyBieSBhZGRpbmcgaG90cGx1ZyBnZW5l
cmF0aW9uIGRpcmVjdGx5IHRvIHRoZSBjbGllbnQncw0KPj4gcmVnaXN0ZXIgaGVscGVyIGRy
bV9jbGllbnRfcmVnaXN0ZXIoKS4gUmVnaXN0ZXJpbmcgdGhlIGNsaWVudCBhbmQNCj4+IHJl
Y2VpdmluZyBldmVudHMgYXJlIHNlcmlhbGl6ZWQgYnkgc3RydWN0IGRybV9kZXZpY2UuY2xp
ZW50bGlzdF9tdXRleC4NCj4+IFNvIGFuIG91dHB1dCBpcyBlaXRoZXIgY29uZmlndXJlZCBi
eSB0aGUgaW5pdGlhbCBob3RwbHVnIGV2ZW50LCBvcg0KPj4gdGhlIGNsaWVudCBoYXMgYWxy
ZWFkeSBiZWVuIHJlZ2lzdGVyZWQuDQo+Pg0KPj4gVGhlIGJ1ZyB3YXMgb3JpZ2luYWxseSBh
ZGRlZCBpbiBjb21taXQgNmUzZjE3ZWU3M2Y3ICgiZHJtL2ZiLWhlbHBlcjoNCj4+IGdlbmVy
aWM6IENhbGwgZHJtX2NsaWVudF9hZGQoKSBhZnRlciBzZXR1cCBpcyBkb25lIiksIGluIHdo
aWNoIGFkZGluZw0KPj4gYSBjbGllbnQgYW5kIHJlY2VpdmluZyBhIGhvdHBsdWcgZXZlbnQg
c3dpdGNoZWQgb3JkZXIuIEl0IHdhcyBoaWRkZW4sDQo+PiBhcyBtb3N0IGhhcmR3YXJlIGFu
ZCBkcml2ZXJzIGhhdmUgYXQgbGVhc3Qgb24gc3RhdGljIG91dHB1dCBjb25maWd1cmVkLg0K
Pj4gT3RoZXIgZHJpdmVycyBkaWRuJ3QgdXNlIHRoZSBpbnRlcm5hbCBEUk0gY2xpZW50IG9y
IHN0aWxsIGhhZCBzdHJ1Y3QNCj4+IGRybV9tb2RlX2NvbmZpZ19mdW5jcy5vdXRwdXRfcG9s
bF9jaGFuZ2VkIHNldC4gVGhhdCBjYWxsYmFjayBoYW5kbGVkDQo+PiBob3RwbHVnIGV2ZW50
cyBhcyB3ZWxsLiBBZnRlciBub3Qgc2V0dGluZyB0aGUgY2FsbGJhY2sgaW4gYW1kZ3B1IGlu
DQo+PiBjb21taXQgMGUzMTcyYmFjM2Y0ICgiZHJtL2FtZGdwdTogRG9uJ3Qgc2V0IHN0cnVj
dA0KPj4gZHJtX2RyaXZlci5vdXRwdXRfcG9sbF9jaGFuZ2VkIiksIGFtZGdwdSBkaWQgbm90
IHNob3cgYSBmcmFtZWJ1ZmZlcg0KPj4gY29uc29sZSBpZiBvdXRwdXQgZXZlbnRzIGdvdCBs
b3N0LiBUaGUgYnVnIGdvdCBjb3B5LXBhc3RlZCBmcm9tDQo+PiBmYmRldi1nZW5lcmljIGlu
dG8gdGhlIG90aGVyIGZiZGV2IGVtdWxhdGlvbi4NCj4+DQo+PiBSZXBvcnRlZC1ieTogTW9y
aXR6IER1Z2UgPE1vcml0ekR1Z2VAa29sYWhpbGZ0LmRlPg0KPj4gQ2xvc2VzOiBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8yNjQ5DQo+IA0KPiBB
cmVuJ3QgeW91IG1pc3NpbmcgYSBGaXhlczogZm9yIDBlMzE3MmJhYzNmNCB0b28/IFNpbmNl
IHRoYXQncyB0aGUgY29tbWl0DQo+IHRoYXQgdW5tYXNrZWQgdGhlIGJ1ZyBmb3IgYW1kZ3B1
LCBJTU8gdGhhdCBpcyB0aGUgbW9zdCBpbXBvcnRhbnQgdG8gbGlzdC4NCg0KV2VsbCwgT0su
DQoNCj4gDQo+PiBGaXhlczogNmUzZjE3ZWU3M2Y3ICgiZHJtL2ZiLWhlbHBlcjogZ2VuZXJp
YzogQ2FsbCBkcm1fY2xpZW50X2FkZCgpIGFmdGVyIHNldHVwIGlzIGRvbmUiKQ0KPj4gRml4
ZXM6IDhhYjU5ZGEyNmJjMCAoImRybS9mYi1oZWxwZXI6IE1vdmUgZ2VuZXJpYyBmYmRldiBl
bXVsYXRpb24gaW50byBzZXBhcmF0ZSBzb3VyY2UgZmlsZSIpDQo+PiBGaXhlczogYjc5ZmU5
YWJkNThiICgiZHJtL2ZiZGV2LWRtYTogSW1wbGVtZW50IGZiZGV2IGVtdWxhdGlvbiBmb3Ig
R0VNIERNQSBoZWxwZXJzIikNCj4+IEZpeGVzOiA2M2MzODE1NTJmNjkgKCJkcm0vYXJtYWRh
OiBJbXBsZW1lbnQgZmJkZXYgZW11bGF0aW9uIGFzIGluLWtlcm5lbCBjbGllbnQiKQ0KPj4g
Rml4ZXM6IDQ5OTUzYjcwZTdkMyAoImRybS9leHlub3M6IEltcGxlbWVudCBmYmRldiBlbXVs
YXRpb24gYXMgaW4ta2VybmVsIGNsaWVudCIpDQo+PiBGaXhlczogOGYxYWFjY2IwNGI3ICgi
ZHJtL2dtYTUwMDogSW1wbGVtZW50IGNsaWVudC1iYXNlZCBmYmRldiBlbXVsYXRpb24iKQ0K
Pj4gRml4ZXM6IDk0MGI4NjljMmYyZiAoImRybS9tc206IEltcGxlbWVudCBmYmRldiBlbXVs
YXRpb24gYXMgaW4ta2VybmVsIGNsaWVudCIpDQo+PiBGaXhlczogOWU2OWJjZDg4ZTQ1ICgi
ZHJtL29tYXBkcm06IEltcGxlbWVudCBmYmRldiBlbXVsYXRpb24gYXMgaW4ta2VybmVsIGNs
aWVudCIpDQo+PiBGaXhlczogZTMxN2E2OWZlODkxICgiZHJtL3JhZGVvbjogSW1wbGVtZW50
IGNsaWVudC1iYXNlZCBmYmRldiBlbXVsYXRpb24iKQ0KPj4gRml4ZXM6IDcxZWMxNmY0NWVm
OCAoImRybS90ZWdyYTogSW1wbGVtZW50IGZiZGV2IGVtdWxhdGlvbiBhcyBpbi1rZXJuZWwg
Y2xpZW50IikNCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPg0KPj4gVGVzdGVkLWJ5OiBNb3JpdHogRHVnZSA8TW9yaXR6RHVnZUBr
b2xhaGlsZnQuZGU+DQo+PiBUZXN0ZWQtYnk6IFRvcnN0ZW4gS3JhaCA8a3JhaC50bUBnbWFp
bC5jb20+DQo+PiBUZXN0ZWQtYnk6IFBhdWwgU2NoeXNrYSA8cHNjaHlza2FAZ21haWwuY29t
Pg0KPj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+PiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4NCj4+IENjOiBOb3JhbGYgVHLD
uG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4NCj4+IENjOiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPj4gQ2M6IE1heGltZSBSaXBh
cmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4+IENjOiBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4+IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFy
bWxpbnV4Lm9yZy51az4NCj4+IENjOiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+
DQo+PiBDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNvbT4NCj4+IENj
OiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPg0KPj4gQ2M6IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4+
IENjOiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsuci5qYWtvYnNzb25AZ21haWwuY29tPg0K
Pj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4NCj4+IENjOiBBYmhpbmF2
IEt1bWFyIDxxdWljX2FiaGluYXZrQHF1aWNpbmMuY29tPg0KPj4gQ2M6IERtaXRyeSBCYXJ5
c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4+IENjOiBUb21pIFZhbGtl
aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4NCj4+IENjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+PiBDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+PiBDYzogIlBhbiwgWGluaHVp
IiA8WGluaHVpLlBhbkBhbWQuY29tPg0KPj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BnbWFpbC5jb20+DQo+PiBDYzogTWlra28gUGVydHR1bmVuIDxtcGVydHR1bmVu
QG52aWRpYS5jb20+DQo+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
Pj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4+IENjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2
Z2VyLmtlcm5lbC5vcmcNCj4+IENjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZw0K
Pj4gQ2M6IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IENjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gQ2M6IGxpbnV4LXRlZ3JhQHZnZXIua2VybmVs
Lm9yZw0KPj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IENjOiA8
c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS4yKw0KPiANCj4gV2hpbGUgaXQncyB0cnVl
IHRoYXQgdGhlIGJ1dCB3YXMgaW50cm9kdWNlZCBieSBjb21taXQgNmUzZjE3ZWU3M2Y3IGFu
ZCB0aGF0DQo+IGxhbmRlZCBpbiB2NS4yLCBJIHdvbmRlciBpZiB0aGlzIHBhdGNoIGNvdWxk
IGV2ZW4gYmUgYXBwbGllZCB0byBzdWNoIG9sZGVycw0KPiBMaW51eCB2ZXJzaW9ucy4gUHJv
YmFibHkgaW4gcHJhY3RpY2UgaXQgd291bGQgYmUgYXQgbW9zdCBiYWNrcG9ydGVkIHRvDQo+
IHY2LjIsIHdoaWNoIGlzIHRoZSByZWxlYXNlIHRoYXQgZXhwb3NlZCB0aGUgYnVnIGZvciB0
aGUgYW1kZ3B1IGRyaXZlci4NCg0KTm8gaWRlYS4gVGhlIGZpeCBsb29rcyBzaW1wbGUgZW5v
dWdoLCBidXQgYSBsb3QgaGFzIGNoYW5nZWQgaW4gdGhlIA0Kc3Vycm91bmRpbmcgY29kZS4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gWW91ciBleHBsYW5hdGlvbiBtYWtl
cyBzZW5zZSB0byBtZSBhbmQgdGhlIHBhdGNoIGxvb2tzIGdvb2QuDQo+IA0KPiBSZXZpZXdl
ZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3Nl
IDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcg
TXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFH
IE51ZXJuYmVyZykNCg==

--------------ogGQXvUxAG6vOXW98TdFWf32--

--------------1vdugXBSagH09XaDcfo6AQRC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSr1loFAwAAAAAACgkQlh/E3EQov+Dk
OA//Urw1SwmtNCQyIjfKuDxewZlClwKMSRvtLW4DYNyyCykiwPNcRVVWytSlEuLztlk+njoelgSZ
4vJlkj1lm7p23KkKdGKI4x+i0LQcp46BqLbI9zmflh2bLaMigL5NqbddhHMZE/nkYmiTu0OSqhcZ
cLpYSd/hBD4/Ix+nBIWgwoaqyYwljO+WySPyveymijVNKwhCF5SDQUfbwiE/2cfAjKR0EwyAF+xV
S6unB8SWXb40QXPEQIUHIqs2c2Iww4fmI54AcuTnHx/8YjZdm0VQhGt99yAIgx3tsjaXfyKxgFRY
UdMzv1D3rnzNMyO4Sa1rw7LRQKdLUxI1i5ABmMBNGOaL2xrVkZf5WYOWM5AwWNybt0MvKpaQXCU2
2lO2VXd8snO0xp7zmtoOYZufdYgAOBFiGuyiCRZr4Tx8eddiQERK1hFPMb002GG1PrnSfcFQ37ta
qy6iCBUGUMzu0blDBG+9G4/Pj69sjB05P/az3BKx5oO0Dc5lLjjxLuywl8ZumvwzuDv2POrtHsJM
C81wrSo42y8B7Pz81r9oCJW+JY1LC9J0O0kszjzqeoiHJSi6q4xYmKUkANQ93Sh3XQs3w0crZQi9
1uiHQ3i9uhG7IgN5JUFy7UGckta4QpNewT+8WBv86N+O0KbwnaOFNqs43hFVyTszaW7tZO2oMgL5
Hes=
=4IC+
-----END PGP SIGNATURE-----

--------------1vdugXBSagH09XaDcfo6AQRC--
