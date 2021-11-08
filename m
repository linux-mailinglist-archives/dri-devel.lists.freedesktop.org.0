Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA96447FC1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01C36E145;
	Mon,  8 Nov 2021 12:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4186E145
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:48:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E30B81FD73;
 Mon,  8 Nov 2021 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636375704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wpL7eas8ZEkLYqRjohr9s4ICMOI421YUYA52Z5JeLpM=;
 b=wTYc7XYNzD3wCYHpjBxnMQ2P2Da5+AXMdjZpXdolFzQUhOLvbskspSrrAEuKq4S14Pi54C
 dVa6jhXIok/FenTDaV9fW60jXMdFSmIFa93TBV4r/PHZBH91lft/5kxdPkxCrGUy+BK+Zo
 4jC++8vkZgeuVA5ZrfhdppZCmalQ9Ck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636375704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wpL7eas8ZEkLYqRjohr9s4ICMOI421YUYA52Z5JeLpM=;
 b=FSXs15+wUQsZ9gb7aSwtNTLRATTDC3R0FrN86GtBTPFZr2vF5uRBvY/wGJ7HMXS5dZsq7h
 VLTkE/BFDtzsZxDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE02113BA0;
 Mon,  8 Nov 2021 12:48:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 12vHKJgciWEhbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 12:48:24 +0000
Message-ID: <0f152d33-6362-b04b-6661-1d5cd7f32015@suse.de>
Date: Mon, 8 Nov 2021 13:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 5/6] Documentation/admin-guide: Document nomodeset
 kernel parameter
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20211108121544.776590-1-javierm@redhat.com>
 <20211108121544.776590-6-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211108121544.776590-6-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mAxN61UkgB8epFULRIfOhFM7"
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mAxN61UkgB8epFULRIfOhFM7
Content-Type: multipart/mixed; boundary="------------wQg70e0YtgvVA0QCoyyPEGAo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Peter Robinson <pbrobinson@gmail.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <0f152d33-6362-b04b-6661-1d5cd7f32015@suse.de>
Subject: Re: [PATCH v3 5/6] Documentation/admin-guide: Document nomodeset
 kernel parameter
References: <20211108121544.776590-1-javierm@redhat.com>
 <20211108121544.776590-6-javierm@redhat.com>
In-Reply-To: <20211108121544.776590-6-javierm@redhat.com>

--------------wQg70e0YtgvVA0QCoyyPEGAo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTEuMjEgdW0gMTM6MTUgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSBub21vZGVzZXQga2VybmVsIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIg
aXMgbm90IGRvY3VtZW50ZWQuIEl0cyBuYW1lDQo+IGlzIHF1aXRlIHZhZ3VlIGFuZCBpcyBu
b3QgaW50dWl0aXZlIHdoYXQncyB0aGUgYmVoYXZpb3VyIHdoZW4gaXQgaXMgc2V0Lg0KPiAN
Cj4gRG9jdW1lbnQgaW4ga2VybmVsLXBhcmFtZXRlcnMudHh0IHdoYXQgYWN0dWFsbHkgaGFw
cGVucyB3aGVuIG5vbW9kZXNldA0KPiBpcyB1c2VkLiBUaGF0IHdheSwgdXNlcnMgY291bGQg
a25vdyBpZiB0aGV5IHdhbnQgdG8gZW5hYmxlIHRoaXMgb3B0aW9uLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+
DQo+IC0tLQ0KPiANCj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpDQo+IA0KPiAgIERvY3VtZW50
YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IHwgNCArKysrDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBEb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBEb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiBpbmRleCA5MWJhMzkx
ZjliMzIuLmVkOTg1OWZkMDczNCAxMDA2NDQNCj4gLS0tIERvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0DQo+ICsrKyBEb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiBAQCAtMzUyMSw2ICszNTIxLDEwIEBA
DQo+ICAgCQkJc2h1dGRvd24gdGhlIG90aGVyIGNwdXMuICBJbnN0ZWFkIHVzZSB0aGUgUkVC
T09UX1ZFQ1RPUg0KPiAgIAkJCWlycS4NCj4gICANCj4gKwlub21vZGVzZXQJRGlzYWJsZSBr
ZXJuZWwgbW9kZXNldHRpbmcuIERSTSBkcml2ZXJzIHdpbGwgbm90IGJlDQo+ICsJCQlsb2Fk
ZWQgd2hlbiB0aGlzIGtlcm5lbCBib290IHBhcmFtZXRlciBpcyB1c2VkLiBUaGUNCj4gKwkJ
CXNpbXBsZWRybSBkcml2ZXIgaXMgdGhlIG9ubHkgRFJNIGRyaXZlciB0aGF0IGxvYWRzLg0K
PiArDQoNClRoYXQncyBtaXNsZWFkaW5nIGFuZCB0byB0aGUgZ2VuZXJhbCBhZG1pbiBpdCBt
aWdodCBub3QgYmUgY2xlYXIgd2hhdCANCnNpbXBsZWRybSBpcyBhYm91dC4gUmF0aGVyIHNh
eSBzb21ldGhpbmcgbGlrZQ0KDQogIERpc2FibGUga2VybmVsIG1vZGVzZXR0aW5nLiBEUk0g
ZHJpdmVycyB3aWxsIG5vdCBwZXJmb3JtDQogIGRpc3BsYXktbW9kZSBjaGFuZ2VzIG9yIGFj
Y2VsZXJhdGVkIHJlbmRlcmluZy4gT25seSB0aGUNCiAgc3lzdGVtIGZyYW1lYnVmZmVyIHdp
bGwgYmUgYXZhaWxhYmxlIGZvciB1c2UuIFJlcXVpcmVzIHRoZQ0KICBmaXJtd2FyZSBvciBi
b290IGxvYWRlciB0byBzZXR1cCB0aGUgZGlzcGxheS4gVXNlZnVsIGFzDQogIGZhbGxiYWNr
LCBvciBmb3IgdGVzdGluZyBhbmQgZGVidWdnaW5nLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+ICAgCW5vbW9kdWxlCURpc2FibGUgbW9kdWxlIGxvYWQNCj4gICANCj4gICAJbm9w
YXQJCVtYODZdIERpc2FibGUgUEFUIChwYWdlIGF0dHJpYnV0ZSB0YWJsZSBleHRlbnNpb24g
b2YNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------wQg70e0YtgvVA0QCoyyPEGAo--

--------------mAxN61UkgB8epFULRIfOhFM7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGJHJgFAwAAAAAACgkQlh/E3EQov+Ag
dRAAohB0DRst8mFzOkp2loxGWm2/ktDwvNFwckT8BINW1xELvTIGOmxZUHNb3BNA1Q6N17h4qT7S
lnGKZVoBBLiHjz79UiQN/zKCuKYNKTcgxhvqMNUoX/fLJME9GoPD8+0Ft096HpQREMRaJS1APSNc
bIp+y8BVw3ZfL1HZCovXtq1e99ZERz0AVsRHl/ESZk+aVLmBOE6uc5s6k2DPNoAbsDfLQU6DVAYj
LuGgvs/TIeuYfMLi1cr1EILQtgZpqKvfgdUR1OyzdphzXmUhCaiJ0M9053kPXxdN032nMr+7gYj7
SJm2pPluIa2t9ffupSehi3efVslrDKxWFsacYpdjNn9UbjXh2iTTEQpRd/hF9Cexg2aT0a3vy/kt
dYASnGTAzhfXgzI1LYbFc6/fo+jAD92x84KVuT/5ynfmV3ShvwYmzng9uct4DqToVDo1rt82Hpc7
9B0LwpYkuzLCeA4NmPOjUUz3/40azTDVhfduU8N+cwOs055yitLpuzZfiapJfeox7CFmno6qWrrw
krBybNrAh5iMNNpSkxGaeI3g9cCjg94omT2EZe35Xh+kCKLOY6rYLzGvI1VpE6A1yyDoSko6LUag
1FxjoQzQDj4/3/MS0dV1JX5bgY1K/2aFRDwnXNiqRaL8enklm+CUl3f7bAhjazGaXm8KE+BUe8wr
ehQ=
=vmcp
-----END PGP SIGNATURE-----

--------------mAxN61UkgB8epFULRIfOhFM7--
