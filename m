Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308E24D13A1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE04110E2DA;
	Tue,  8 Mar 2022 09:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AFA10E2DA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 09:45:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC5271F396;
 Tue,  8 Mar 2022 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646732698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kpHjumSWpKgMug35vEyl7CC/OVgTfDjtoHX6Y26cqiw=;
 b=10KHbdD9Ubm+xSRCRF6tRPSIvK8k3AxHjyeGsbuoUhZpMYJNMUhDK9HcQW1H3YCaAA+fw3
 OatRIDqB9BpAitClG/zCAxGB/A1wL6E2d62t8EIPR+aQvZYH4LDfg20n6RscCTGP4ZnYA1
 kIYNa2LLYQKVjneJXHF4EJ8i23yTgLM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646732698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kpHjumSWpKgMug35vEyl7CC/OVgTfDjtoHX6Y26cqiw=;
 b=mj+b5zDYRZs+ZpXV4zdL2/ENkDv93qV1upo9TDsImWHIvMf0aDgpQYE1fmYjn7zTCEG7y6
 +dlPvpclX8wMCuDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80E9313C24;
 Tue,  8 Mar 2022 09:44:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uKjCHZolJ2JUMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Mar 2022 09:44:58 +0000
Message-ID: <f94a6b14-e884-5af4-436b-37715a9c7693@suse.de>
Date: Tue, 8 Mar 2022 10:44:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 0/9] drm: Support GEM SHMEM fbdev without shadow FB
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <9ccf6f00-6611-7bbb-0ea8-ccf4f0a2920f@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <9ccf6f00-6611-7bbb-0ea8-ccf4f0a2920f@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------efYlL8xBs1Adf5KDbgqz5xaP"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------efYlL8xBs1Adf5KDbgqz5xaP
Content-Type: multipart/mixed; boundary="------------lbNzRd5Jc6xrvvxkgVyLKP5j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <f94a6b14-e884-5af4-436b-37715a9c7693@suse.de>
Subject: Re: [PATCH 0/9] drm: Support GEM SHMEM fbdev without shadow FB
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <9ccf6f00-6611-7bbb-0ea8-ccf4f0a2920f@redhat.com>
In-Reply-To: <9ccf6f00-6611-7bbb-0ea8-ccf4f0a2920f@redhat.com>

--------------lbNzRd5Jc6xrvvxkgVyLKP5j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA4LjAzLjIyIHVtIDEwOjEzIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBPbiAzLzMvMjIgMjE6NTgs
IFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gUmV3b3JrIHRoZSBmYmRldiBkZWZlcnJl
ZC1JL08gdG8gbm90IGludGVyZmVyZSB3aXRoIGZpZWxkcyBvZiBzdHJ1Y3QNCj4+IHBhZ2Uu
IE1ha2UgdGhlIGNvZGUgbW9yZSBmbGV4aWJsZSBhbmQgaW1wbGVtZW50IEdFTSBTSE1FTSBt
bWFwIG9uIHRvcA0KPj4gb2YgaXQuDQo+Pg0KPj4gVGhpcyBwYXRjaHNldCByZW1vdmVzIHRo
ZSBuZWVkIGZvciBhIHNwZWNpYWwgc2hhZG93IGZyYW1lYnVmZmVyIGZvcg0KPj4gZmJkZXYg
bW1hcCB3aGVuIHVzaW5nIEdFTSBTSE1FTS4gU0hNRU0gcGFnZXMgYXJlIG5vdyBtbWFwJ2Vk
IGZyb20NCj4+IC9kZXYvZmIgZGlyZWN0bHkuDQo+Pg0KPiANCj4gSW50ZXJlc3RpbmcuIEkg
d29uZGVyIGlmIHlvdSBoYXZlIGFueSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudHMgYWZ0ZXIN
Cj4gZHJvcHBpbmcgdGhlIHNoYWRvdyBidWZmZXIuDQo+IA0KPj4gUGF0Y2hlcyAyIGFuZCAz
IHJld29yayB0aGUgZmJkZXYgZGVmZXJyZWQgSS9PIGNvZGUuIEl0IG5vdyBhbGxvd3MNCj4+
IGRyaXZlcnMgdG8gaGF2ZSBiZXR0ZXIgY29udHJvbCBvZiB0aGUgbW1hcCBvcGVyYXRpb25z
LiBBbGwgcmVmZXJlbmNlcw0KPj4gdG8gZmllbGRzIGluIHN0cnVjdCBwYWdlIGFyZSBnb25l
LiBUaGUgcnNwIHN0YXRlIGlzIGhlbHAgaW4gYQ0KPj4gc2VwYXJhdGUgcGFnZXJlZiBzdHJ1
Y3R1cmUuDQo+Pg0KPiANCj4gVGhhdCdzIGEgdmVyeSBuaWNlIGNsZWFudXAuIFRoaXMgcmVh
bGx5IHdhcyBhIGh1Z2UgbGF5ZXJpbmcgdmlvbGF0aW9uLg0KPiAgIA0KPj4gUGF0Y2hlcyA0
IHRvIDcgcHJvdmlkZSBjYWxsYmFja3MgYW4gaGVscGVycyB0byBpbXBsZW1lbnQgZGVmZXJy
ZWQgSS9PDQo+PiB3aXRoIERSTSBkcml2ZXJzLiBTcGVjaWZpY2FsbHksIHBhdGNoIDYgaW50
cm9kdWNlcyBhIGNhbGxiYWNrIHRvIGNyZWF0ZQ0KPj4gYSBkdW1iIGJ1ZmZlciBmb3IgZmJk
ZXYuIFRoaXMgd2lsbCBiZSB1c2VmdWwgZm9yIG1hbnkgZHJpdmVycyB0aGF0DQo+PiBjdXJy
ZW50bHkgY2Fubm90IHVzZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiBiZWNhdXNlIG9mIHNw
ZWNpYWwgcGxhY2VtZW50DQo+PiBuZWVkcyBvZiB0aGUgQk8sIHN1Y2ggYXMgYW1kZ3B1IG9y
IHJhZGVvbi4gVGhlIGRyaXZlcnMgY2FuIGhhbmRsZSB0aGUNCj4+IGRpZmZlcmVuY2VzIHRv
IHJlZ3VsYXIgZHVtYiBidWZmZXJzIGluIHRoZWlyIG5ldyBjYWxsYmFjayBpbXBsZW1lbnRh
dGlvbi4NCj4+DQo+PiBQYXRjaCA4IGV4dGVuZHMgdGhlIEdFTSBTSE1FTSBtZW1vcnkgbWFu
YWdlciB3aXRoIGEgbmV3IGhlbHBlciBmb3IgZmJkZXYNCj4+IGR1bWItYnVmZmVyIGNyZWF0
aW9uLiBUaGUgcmV0dXJuZWQgQk8gaGFzIGl0J3MgbW1hcCBzZXQgdXAgdG8gaW1wbGVtZW50
DQo+PiBkZWZlcnJlZCBJL08gd2l0aCBTSE1FTSBwYWdlcy4gTm8gYWRkaXRpb25hbCBzaGFk
b3cgYnVmZmVyIGlzIHJlcXVpcmVzDQo+PiBhbnkgbG9uZ2VyLiBNYW55IGRyaXZlcnMgY2Fu
IGltbWVkaWF0ZWxseSBiZW5lZml0IGZyb20gdGhpcyBjaGFuZ2UuDQo+Pg0KPj4gUGF0Y2gg
OSBleHRlbmRzIHZpcnRncHUgdG8gc3VwcG9ydCBmYmRldiBkdW1iIGJ1ZmZlcnMuIEl0J3Mg
YnVpbGQgb24NCj4+IHRvcCBvZiBHRU0gU0hNRU0sIGJ1dCBoYXMgc29tZSBtb2RpZmljYXRp
b25zIHRoYXQgbmVlZCB0byBiZSBpbXBsZW1lbnRlZA0KPj4gZm9yIGZiZGV2IGFzIHdlbGwu
DQo+Pg0KPj4gVGhlcmUncyBubyBpbW1lZGlhdGUgZmJkZXYgcGVyZm9ybWFuY2UgaW1wcm92
ZW1lbnQgZnJvbSB0aGlzIHBhdGNoc2V0Lg0KPj4gTW9zdCBvZiBhbGwsIGl0IHJlbW92ZXMg
dW5uZWNlc3Nhcnkgc2hhZG93IGZyYW1lYnVmZmVycyBhbmQgcnNwIG1lbWNweXMuDQo+PiBB
IHNoYWRvdyBmYiBmb3IgYSBGdWxsSEQgZGlzcGxheSBpcyB+OCBNaUIsIHdoaWNoIHdlIG5v
dyBzYXZlLiBUaGUgcGF0Y2hlcw0KPj4gZG8gcmVkdWNlIGxhdGVuY3kgYmV0d2VlbiBkcmF3
aW5nIHRvIHRoZSBmYmRldiBidWZmZXIgdG8gZGlzcGxheWluZw0KPj4gb24gdGhlIHNjcmVl
bi4gV2F0Y2hpbmcgYSB2aWRlbyBvbiB0aGUgZmJkZXYgY29uc29sZSBmZWx0IHNtb290aGVy
IGFuZA0KPj4gaGFkIGxlc3MgZmxpY2tlcmluZy4NCj4+DQo+IA0KPiBBd2Vzb21lLiBBbmQg
eW91IGFsc28gYW5zd2VyZWQgaGVyZSB0aGUgcXVlc3Rpb24gSSBoYWQgYWJvdmUuDQoNClRo
ZXJlJ3Mgbm8gc2lnbmlmaWNhbnQgaW1wcm92ZW1lbnQgaW4gcGVyZm9ybWFuY2UuDQoNCkJ1
dCB3aGVuIEkgcGxheSBCdWcgQnVjayBCdW5ueSBpbiBtcGxheWVyJ3MgYmVuY2htYXJrIG1v
ZGUsIHRoZSANCmRpc3BsYXllZCBhbmltYXRpb24gbG9va3Mgc21vb3RoZXIgdGhhbiBiZWZv
cmUuIFRoZSB0ZXN0IGZpbmlzaGVzIGluIDczIA0Kc2Vjb25kcyBpbnN0ZWFkIG9mIDc0LiBJ
IGd1ZXNzIHRoYXQgb25lLXNlY29uZCBpbXByb3ZlbWVudCBjb21lcyBmcm9tIA0KdGhlIG1l
bWNweSB0aGF0IHdlIG5vdyBzYXZlLiBJIHVzZSBhIHNvbWV3aGF0IHJlY2VudCBDb3JlIGk3
IGZvciANCnRlc3RpbmcuIE9uIG9sZCBoYXJkd2FyZSwgd2UgbWlnaHQgZ2V0IG1vcmUgcGVy
Zm9ybWFuY2Ugb3V0IG9mIGl0LiBJIGNhbiANCnJlYWxseSBvbmx5IGd1ZXNzIGhlcmUuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------lbNzRd5Jc6xrvvxkgVyLKP5j--

--------------efYlL8xBs1Adf5KDbgqz5xaP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmInJZkFAwAAAAAACgkQlh/E3EQov+Dv
Mw/+LOC/WzJfPQQ7D38jyWkjwz5NUGY1IXZ31qV1QTsOrS7paUkg/KHiAGmjM03/uzIJrNgUijmR
h5Y95cpDZKMKxGke+4kzC9N9Gm1wWq1RCo5EB2XaEMUKumnUBWNtIyREa8l8SkMuV4jL+sJf0H2w
U7Vm96VmE2xlL4rWNG73Pt0Vx9Bjhtxbfz06YZ+kE/uUt+vpL+fL/USZcIMx+3DU063hqZkyC0nD
eKhuiwsgs1u/N8T7py3I4bKbZhai9z02xwIx7KSAhs15SraWOrsYpHQBvOOQv631FMDJpGdkGglY
6MsYgcTQ1Td0/TPD6tgkeyxtUCfZ4UvxJVNzmOsifseOlztsS94bgRHlkdqFQpQ7nz8EJtJbVxhu
lJh08gCQG/Ecmcs2x2PEUjoAEop9NEwQAdoyuleghfgqCRUGdtsddnfj6lNZB/IgcO7vCj7YF7tr
2sigWg3Y/q+BTlFeiYuudPpwiuzcNJgljT0w38ljW0qP4zYVSb+ykMP99qVMavOnsUPIARwdoIgf
dJY3FBRbtSsG7KEz+6T11dcpIC6m7Ot4K9dDHntOpw4QPHJXE1TupG4SNtvax9Sbe1HMzLs/Xqz7
3h6ttvmEKVJCBumUBhS+cKcCh5rybvo9o1lC+EKTFy6/Z0et6zU3zWKymoM2NsoJt5MTFIpBbGUn
PHk=
=OQ1v
-----END PGP SIGNATURE-----

--------------efYlL8xBs1Adf5KDbgqz5xaP--
