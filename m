Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FACD7A93C4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 13:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D03110E5C1;
	Thu, 21 Sep 2023 11:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A12710E5C1;
 Thu, 21 Sep 2023 11:11:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4CF1A338A4;
 Thu, 21 Sep 2023 11:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695294669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ahSDka+ud/ArrkTUsJLPgqW+LRcwqhCWgbQCB+rwDsI=;
 b=KI+WiC/Jkz8t6aYBX30t3uf2bg2qpPW9bvtpwE7nBDHP21bpqpUSClRyFN0inVFn3ON1ZD
 ZMDfZGX7HSnUL9pPw11xVml2HJ+d8Q+aNkwvc0takFHOIWzIW2Mx8NnFjXfdbuLwS8+O+H
 mhtUp4Up2uCcyFUShwNrms+djOAHuzA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695294669;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ahSDka+ud/ArrkTUsJLPgqW+LRcwqhCWgbQCB+rwDsI=;
 b=bvuq9gZEONaEtkfHUBLEz9zRL0BlI7KNzEMEkX9fv0WVf2+EMyt5X86nT8G6GNkXIFb2ib
 0gs+QT04NU8eHMBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E451134B0;
 Thu, 21 Sep 2023 11:11:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PQ6gIcwkDGXHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Sep 2023 11:11:08 +0000
Message-ID: <f6413268-5fa5-440e-b35b-98195df150b3@suse.de>
Date: Thu, 21 Sep 2023 13:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: Update drm-misc entry to match all drivers
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20230921105743.2611263-1-mripard@kernel.org>
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
In-Reply-To: <20230921105743.2611263-1-mripard@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dSxprB7Srgjr0Bp5MLVnm0oc"
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Edmund Dea <edmund.j.dea@intel.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-renesas-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dSxprB7Srgjr0Bp5MLVnm0oc
Content-Type: multipart/mixed; boundary="------------tN9WGv9Sm3bW15FJqXQwj9oC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Edmund Dea <edmund.j.dea@intel.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jani Nikula
 <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Message-ID: <f6413268-5fa5-440e-b35b-98195df150b3@suse.de>
Subject: Re: [PATCH v2] MAINTAINERS: Update drm-misc entry to match all
 drivers
References: <20230921105743.2611263-1-mripard@kernel.org>
In-Reply-To: <20230921105743.2611263-1-mripard@kernel.org>

--------------tN9WGv9Sm3bW15FJqXQwj9oC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIxLjA5LjIzIHVtIDEyOjU3IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gV2Un
dmUgaGFkIGEgbnVtYmVyIG9mIHRpbWVzIHdoZW4gYSBwYXRjaCBzbGlwcGVkIHRocm91Z2gg
YW5kIHdlIGNvdWxkbid0DQo+IHBpY2sgdGhlbSB1cCBlaXRoZXIgYmVjYXVzZSBvdXIgTUFJ
TlRBSU5FUlMgZW50cnkgb25seSBjb3ZlcnMgdGhlDQo+IGZyYW1ld29yayBhbmQgdGh1cyB3
ZSB3ZXJlbid0IENjJ2QuDQo+IA0KPiBMZXQncyB0YWtlIGFub3RoZXIgYXBwcm9hY2ggd2hl
cmUgd2UgbWF0Y2ggZXZlcnl0aGluZywgYW5kIHJlbW92ZSBhbGwNCj4gdGhlIGRyaXZlcnMg
dGhhdCBhcmUgbm90IG1haW50YWluZWQgdGhyb3VnaCBkcm0tbWlzYy4NCj4gDQo+IEFja2Vk
LWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQoNCkFja2VkLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiANCj4gLS0tDQo+
IA0KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBD
YzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzog
IlBhbiwgWGluaHVpIiA8WGluaHVpLlBhbkBhbWQuY29tPg0KPiBDYzogUnVzc2VsbCBLaW5n
IDxsaW51eEBhcm1saW51eC5vcmcudWs+DQo+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBw
ZW5ndXRyb25peC5kZT4NCj4gQ2M6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21l
aW5lckBnbWFpbC5jb20+DQo+IENjOiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+
DQo+IENjOiBTZXVuZy1Xb28gS2ltIDxzdzAzMTIua2ltQHNhbXN1bmcuY29tPg0KPiBDYzog
S3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4NCj4gQ2M6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBKb29uYXMgTGFo
dGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBSb2RyaWdv
IFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IENjOiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPg0KPiBDYzogUGhpbGlwcCBaYWJlbCA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT4NCj4gQ2M6IExhdXJlbnRpdSBQYWxjdSA8bGF1cmVu
dGl1LnBhbGN1QG9zcy5ueHAuY29tPg0KPiBDYzogQW5pdGhhIENocmlzYW50aHVzIDxhbml0
aGEuY2hyaXNhbnRodXNAaW50ZWwuY29tPg0KPiBDYzogRWRtdW5kIERlYSA8ZWRtdW5kLmou
ZGVhQGludGVsLmNvbT4NCj4gQ2M6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJu
ZWwub3JnPg0KPiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPg0KPiBDYzog
QWJoaW5hdiBLdW1hciA8cXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbT4NCj4gQ2M6IERtaXRy
eSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gQ2M6IFNlYW4g
UGF1bCA8c2VhbkBwb29ybHkucnVuPg0KPiBDYzogTWFyaWpuIFN1aWp0ZW4gPG1hcmlqbi5z
dWlqdGVuQHNvbWFpbmxpbmUub3JnPg0KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRo
YXQuY29tPg0KPiBDYzogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+DQo+IENj
OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPg0KPiBDYzogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBDYzogS2llcmFuIEJp
bmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gQ2M6
IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+DQo+IENjOiBNaWtr
byBQZXJ0dHVuZW4gPG1wZXJ0dHVuZW5AbnZpZGlhLmNvbT4NCj4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiBldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0KPiBD
YzogbGludXgtdGVncmFAdmdlci5rZXJuZWwub3JnDQo+IA0KPiBDaGFuZ2VzIGZyb20gdjE6
DQo+IC0gUmVtb3ZlIGluZ2VuaWMgYW5kIGdtYTUwMCBmcm9tIHRoZSBleGNsdWRlZCBsaXN0
DQo+IC0tLQ0KPiAgIE1BSU5UQUlORVJTIHwgMjEgKysrKysrKysrKysrKysrKysrLS0tDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiBpbmRleCA5
MGYxMzI4MWQyOTcuLjEwMTI0MDJkYWRhNSAxMDA2NDQNCj4gLS0tIGEvTUFJTlRBSU5FUlMN
Cj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTY4NjAsMTIgKzY4NjAsMjcgQEAgTToJVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+ICAgUzoJTWFpbnRhaW5l
ZA0KPiAgIFc6CWh0dHBzOi8vMDEub3JnL2xpbnV4Z3JhcGhpY3MvZ2Z4LWRvY3MvbWFpbnRh
aW5lci10b29scy9kcm0tbWlzYy5odG1sDQo+ICAgVDoJZ2l0IGdpdDovL2Fub25naXQuZnJl
ZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYw0KPiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvDQo+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3B1Lw0KPiAgIEY6CURvY3VtZW50YXRpb24vZ3B1Lw0KPiAtRjoJZHJpdmVy
cy9ncHUvZHJtLyoNCj4gK0Y6CWRyaXZlcnMvZ3B1L2RybS8NCj4gICBGOglkcml2ZXJzL2dw
dS92Z2EvDQo+IC1GOglpbmNsdWRlL2RybS9kcm0qDQo+ICtGOglpbmNsdWRlL2RybS9kcm0N
Cj4gICBGOglpbmNsdWRlL2xpbnV4L3ZnYSoNCj4gLUY6CWluY2x1ZGUvdWFwaS9kcm0vZHJt
Kg0KPiArRjoJaW5jbHVkZS91YXBpL2RybS8NCj4gK1g6CWRyaXZlcnMvZ3B1L2RybS9hbWQv
DQo+ICtYOglkcml2ZXJzL2dwdS9kcm0vYXJtYWRhLw0KPiArWDoJZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvDQo+ICtYOglkcml2ZXJzL2dwdS9kcm0vZXh5bm9zLw0KPiArWDoJZHJpdmVy
cy9ncHUvZHJtL2k5MTUvDQo+ICtYOglkcml2ZXJzL2dwdS9kcm0vaW14Lw0KPiArWDoJZHJp
dmVycy9ncHUvZHJtL2ttYi8NCj4gK1g6CWRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay8NCj4g
K1g6CWRyaXZlcnMvZ3B1L2RybS9tc20vDQo+ICtYOglkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS8NCj4gK1g6CWRyaXZlcnMvZ3B1L2RybS9yYWRlb24vDQo+ICtYOglkcml2ZXJzL2dwdS9k
cm0vcmVuZXNhcy8NCj4gK1g6CWRyaXZlcnMvZ3B1L2RybS90ZWdyYS8NCj4gICANCj4gICBE
Uk0gRFJJVkVSUyBGT1IgQUxMV0lOTkVSIEExMA0KPiAgIE06CU1heGltZSBSaXBhcmQgPG1y
aXBhcmRAa2VybmVsLm9yZz4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1h
bg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------tN9WGv9Sm3bW15FJqXQwj9oC--

--------------dSxprB7Srgjr0Bp5MLVnm0oc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUMJMwFAwAAAAAACgkQlh/E3EQov+BH
2BAA0LTZSFZq+OJZiKl/+R8oepbkvZ/YaNFEU74lc3D+RIvllgrlIP9+j8eyt4SXHLeoX19RTPU8
KB5HM0rSezTANhqPiNO5rb96Bzk/yFmrKXhrLJfRUcFBYrprGlmTcXrDrjtTNEGTB9CE50bcLjeR
XcOuz7VRyuUbq2gtLv9SI7gWQIuMpfDaTaO10Xt034fad7wI+aFbvB7vWuC2cST8f2zDDpzR799l
R5k6CHGFSad12dlO0DaXJ2f6jGmj2b5icRKLzYFYt+A3cuTJKKbATQ5Fkl6/3T3Oij2R/q1Y2qZc
Ojgd5+b7nlC05oartvMGihHyGwHVLnJqbjXCzkJgah8eLZXaW10TnNsLt7EY+4FGI9DfRfQSmBvu
Fap/MWzMqVdbhSEePpkA5nuPMN0KkzjrLg5yExrYCboj6/YJoVeaWn0qXjVlwJeb4CVahVnxQs0I
1+rAZ8vpWqhM0GR/6s1kjpzB6SEv8J+NDArsvOC/0nwxxiT9T9KaLAfGRSWU0UFRmZ/ezO9CdHHA
oD0zFJG4Mhs/yKLo9976evNdoi8EEmmMkyMdsqsyCzP98c+gOuTYrKGvz0lCNzujzk9aeHP8H5SZ
8W2V7MFPOhaaJJgFdCDv9U+uwxKMOm1K9o2qDqQ1kjXcJhKkBoATfptOou431V2fazE1RMGssLcq
A/s=
=AdlW
-----END PGP SIGNATURE-----

--------------dSxprB7Srgjr0Bp5MLVnm0oc--
