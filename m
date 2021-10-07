Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B14425583
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 16:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7359D6F4A5;
	Thu,  7 Oct 2021 14:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C167C6F64D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 14:33:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2A52F22415;
 Thu,  7 Oct 2021 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633617214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0kPHCIwOi6yOaCscKFUvZxr3E139xXkUk3nwqYFUxz4=;
 b=oKTEOQskEQU0aKd1HxqbqVqjt3iUS3Nt0AgXdS8uqgdHyXaGuufu39K5xwLiI8LNdcJ9tk
 CVivdl4kq2hTgxNvydXSOuq52Udn8oCCUV0Eu/GSDwoGBL1BSXeBv4E9sFb36DTN8Cp23G
 T1jbXNQmNVZS3rhYpZOve21YpD9ucog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633617214;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0kPHCIwOi6yOaCscKFUvZxr3E139xXkUk3nwqYFUxz4=;
 b=QvzadQVxDJkNVrPvCNmNPMZ2FFnyLamTc7FUVMZMgbVYrDWXyFSH0uyCYiAqk4b7HcfO9r
 NNldXwuAUnygTHBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F08D613CE5;
 Thu,  7 Oct 2021 14:33:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AH60OT0FX2EmXAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Oct 2021 14:33:33 +0000
Message-ID: <3353e013-6716-ea90-2eb1-8352279ed685@suse.de>
Date: Thu, 7 Oct 2021 16:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2] drm/hyperv: Fix double mouse pointers
Content-Language: en-US
To: Dexuan Cui <decui@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210916193644.45650-1-decui@microsoft.com>
 <BYAPR21MB1270B4AB0AFC1668C9D9009FBFB09@BYAPR21MB1270.namprd21.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <BYAPR21MB1270B4AB0AFC1668C9D9009FBFB09@BYAPR21MB1270.namprd21.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EGwy7DhMFr9056g8B08VlDj0"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EGwy7DhMFr9056g8B08VlDj0
Content-Type: multipart/mixed; boundary="------------A2jFUXct9OonL9tnO0ep48x8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dexuan Cui <decui@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <3353e013-6716-ea90-2eb1-8352279ed685@suse.de>
Subject: Re: [PATCH v2] drm/hyperv: Fix double mouse pointers
References: <20210916193644.45650-1-decui@microsoft.com>
 <BYAPR21MB1270B4AB0AFC1668C9D9009FBFB09@BYAPR21MB1270.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB1270B4AB0AFC1668C9D9009FBFB09@BYAPR21MB1270.namprd21.prod.outlook.com>

--------------A2jFUXct9OonL9tnO0ep48x8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMTAuMjEgdW0gMjA6NDMgc2NocmllYiBEZXh1YW4gQ3VpOg0KPj4gRnJv
bTogRGV4dWFuIEN1aSA8ZGVjdWlAbWljcm9zb2Z0LmNvbT4NCj4+IFNlbnQ6IFRodXJzZGF5
LCBTZXB0ZW1iZXIgMTYsIDIwMjEgMTI6MzcgUE0NCj4+IFRvOiBkcmF3YXQuZmxvc3NAZ21h
aWwuY29tOyBIYWl5YW5nIFpoYW5nIDxoYWl5YW5nekBtaWNyb3NvZnQuY29tPjsNCj4+IGFp
cmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsgdHppbW1lcm1hbm5Ac3VzZS5kZTsN
Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IENjOiBsaW51eC1oeXBl
cnZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBEZXh1
YW4gQ3VpDQo+PiA8ZGVjdWlAbWljcm9zb2Z0LmNvbT4NCj4+IFN1YmplY3Q6IFtQQVRDSCB2
Ml0gZHJtL2h5cGVydjogRml4IGRvdWJsZSBtb3VzZSBwb2ludGVycw0KPj4NCj4+IEh5cGVy
LVYgc3VwcG9ydHMgYSBoYXJkd2FyZSBjdXJzb3IgZmVhdHVyZS4gSXQgaXMgbm90IHVzZWQg
YnkgTGludXggVk0sDQo+PiBidXQgdGhlIEh5cGVyLVYgaG9zdCBzdGlsbCBkcmF3cyBhIHBv
aW50IGFzIGFuIGV4dHJhIG1vdXNlIHBvaW50ZXIsDQo+PiB3aGljaCBpcyB1bndhbnRlZCwg
ZXNwZWNpYWxseSB3aGVuIFhvcmcgaXMgcnVubmluZy4NCj4+DQo+PiBUaGUgaHlwZXJ2X2Zi
IGRyaXZlciB1c2VzIHN5bnRodmlkX3NlbmRfcHRyKCkgdG8gaGlkZSB0aGUgdW53YW50ZWQg
cG9pbnRlci4NCj4+IFdoZW4gdGhlIGh5cGVydl9kcm0gZHJpdmVyIHdhcyBkZXZlbG9wZWQs
IHRoZSBmdW5jdGlvbiBzeW50aHZpZF9zZW5kX3B0cigpDQo+PiB3YXMgbm90IGNvcGllZCBm
cm9tIHRoZSBoeXBlcnZfZmIgZHJpdmVyLiBGaXggdGhlIGlzc3VlIGJ5IGFkZGluZyB0aGUN
Cj4+IGZ1bmN0aW9uIGludG8gaHlwZXJ2X2RybS4NCj4+DQo+PiBGaXhlczogNzZjNTZhNWFm
ZmViICgiZHJtL2h5cGVydjogQWRkIERSTSBkcml2ZXIgZm9yIGh5cGVydiBzeW50aGV0aWMg
dmlkZW8NCj4+IGRldmljZSIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBEZXh1YW4gQ3VpIDxkZWN1
aUBtaWNyb3NvZnQuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEhhaXlhbmcgWmhhbmcgPGhhaXlh
bmd6QG1pY3Jvc29mdC5jb20+DQo+PiBSZXZpZXdlZC1ieTogRGVlcGFrIFJhd2F0IDxkcmF3
YXQuZmxvc3NAZ21haWwuY29tPg0KPj4gLS0tDQo+Pg0KPj4gQ2hhbmdlcyBpbiB2MjoNCj4+
IAlSZW5hbWVkIGh5cGVydl9zZW5kX3B0cigpIHRvIGh5cGVydl9oaWRlX2h3X3B0cigpLg0K
Pj4gCUltcHJvdmVkIHRoZSBjb21tZW50cyBhbmQgdGhlIGdpdCBjb21taXQgbWVzc2FnZS4N
Cj4+IAlBZGRlZCBSZXZpZXdlZC1ieSdzIGZyb20gSGFpeWFuZyBhbmQgRGVlcGFrLg0KPj4N
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZfZHJtLmggICAgICAgICB8ICAx
ICsNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZfZHJtX21vZGVzZXQuYyB8
ICAxICsNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZfZHJtX3Byb3RvLmMg
ICB8IDU0DQo+PiArKysrKysrKysrKysrKysrKysrKy0NCj4+ICAgMyBmaWxlcyBjaGFuZ2Vk
LCA1NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBIaSBEUk0gbWFpbnRh
aW5lcnMsDQo+IENvdWxkIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sgYXQgdGhlIHBhdGNoPw0K
DQpJIHB1c2hlZCB0aGUgcGF0Y2ggaW50byBkcm0tbWlzYy1maXhlcy4gSXQgc2hvdWxkIHJl
YWNoIHVwc3RyZWFtIHNvb25lZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4g
VGhhbmtzLA0KPiAtLSBEZXh1YW4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJC
IDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTD
tnJmZmVyDQo=

--------------A2jFUXct9OonL9tnO0ep48x8--

--------------EGwy7DhMFr9056g8B08VlDj0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFfBT0FAwAAAAAACgkQlh/E3EQov+BU
6RAAogq8ib94GKJSAb5fLjIAWDYEcz7t5jbbjVZcxQile7oAlI3/0/BBwkkN1qRD9ndt5+tIcIAF
aouzdfU98LjJSpAT5E0KXQPRC7AdVAr37gPZPcEISrjzMFUCGAWKSjQbDCF4s+g8PmTdlaSITKl7
oyNrRepbPtiXAAWOacpsfX2pHWQamGTpmxUckDVN03XU7y+xQZBt6atyH9VJtQJb5BxB4xLUKWKD
xtyZN3rQSsl3H5AP2OEVePY/yqWToRy8MWDRqKd14jrfdm/wOJagZ+ewqoERo460z3LddzosbpRc
SF1T7XBzP/XJc/reMN5t11GCYqEw7wFG016kjOthImQC6pbkDeb6oiiuU1wJ0F8dVi+vTeZi8CcA
qdU+Zx8X4aDd9gsk5K9d1yIFs3usTKXpJZl3WQMJCRH7z62aXMrCI44uJUEoPSSEWW1kBAF4T+XK
IjqBHM/xvHvzEszmL+yIOPc2kVmTmVwIPyEj00Ifa2ofTcWkOEw/fY2CiTFZnQr8YIphpEjtXkEG
B7o9rmjNr6CcPjI5nFbWf6WEHMEXplrZrNoYH5GpOEocI1Nd6sLvp8f4zMjtgcSTEYEv+peLkXBh
AJbPYXxGF1JBVO/w50at6+CVt10pHuEqetoDJFMtbBIR72wyLBbYnmJ+zv8vM5yRpxy8AhdtCTGI
UxU=
=vjnW
-----END PGP SIGNATURE-----

--------------EGwy7DhMFr9056g8B08VlDj0--
