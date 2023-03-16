Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4F56BD23D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 15:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A3810E24A;
	Thu, 16 Mar 2023 14:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E2D10E22F;
 Thu, 16 Mar 2023 14:20:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D8A071FE03;
 Thu, 16 Mar 2023 14:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1678976453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7rqzkqoekOUFHTE5TG0JkRVzH2ov10W0GK0gS8eKwlw=;
 b=Gv7jTC449UZeiVLbSbJ5VL8ibGpzRyS9Xftv+4ZMCeB4OxZvt4U+VEYdm9PjUH2ouFrdLK
 0dUFcOtQYUKajc1M0ssbk/syB0/8uWnIlcab3dyweh9uzmAmrw6TF2gMXOJEVp1H47+ms0
 o8DOWZlatURdA1FxEDGRY3ZEIwuhFxg=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 55BCA133E0;
 Thu, 16 Mar 2023 14:20:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KDQlE8UlE2SCZAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 16 Mar 2023 14:20:53 +0000
Message-ID: <d256a967-f50e-2e19-1985-aa9cfc0e8b18@suse.com>
Date: Thu, 16 Mar 2023 15:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com>
 <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
 <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
 <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>
 <dcb54275-b21f-a837-76bb-e19e331a0666@suse.com>
 <CADnq5_PpCWrZzQdE_X6ZnuNU3ktVeC6TbmE5vq3K6rCAdB8GTg@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
In-Reply-To: <CADnq5_PpCWrZzQdE_X6ZnuNU3ktVeC6TbmE5vq3K6rCAdB8GTg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------snWYocCElH8aj08SzfxiNqji"
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
Cc: Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 Jan Beulich <jbeulich@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------snWYocCElH8aj08SzfxiNqji
Content-Type: multipart/mixed; boundary="------------Ehfs40kqb3RztTpecUkkpx7N";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Honglei Huang <honglei1.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Message-ID: <d256a967-f50e-2e19-1985-aa9cfc0e8b18@suse.com>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com>
 <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
 <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
 <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>
 <dcb54275-b21f-a837-76bb-e19e331a0666@suse.com>
 <CADnq5_PpCWrZzQdE_X6ZnuNU3ktVeC6TbmE5vq3K6rCAdB8GTg@mail.gmail.com>
In-Reply-To: <CADnq5_PpCWrZzQdE_X6ZnuNU3ktVeC6TbmE5vq3K6rCAdB8GTg@mail.gmail.com>

--------------Ehfs40kqb3RztTpecUkkpx7N
Content-Type: multipart/mixed; boundary="------------1b41NgLaiQsjMb7RKLLGi4fU"

--------------1b41NgLaiQsjMb7RKLLGi4fU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDMuMjMgMTQ6NTMsIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gT24gVGh1LCBNYXIg
MTYsIDIwMjMgYXQgOTo0OOKAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gT24gMTYuMDMuMjMgMTQ6NDUsIEFsZXggRGV1Y2hlciB3cm90ZToN
Cj4+PiBPbiBUaHUsIE1hciAxNiwgMjAyMyBhdCAzOjUw4oCvQU0gSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gMTYuMDMuMjAyMyAwMDoy
NSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4gT24gV2VkLCAxNSBNYXIgMjAy
MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMTUuMDMuMjAyMyAwMTo1MiwgU3Rl
ZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4+PiBPbiBNb24sIDEzIE1hciAyMDIzLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4+IE9uIDEyLjAzLjIwMjMgMTM6MDEsIEh1YW5n
IFJ1aSB3cm90ZToNCj4+Pj4+Pj4+PiBYZW4gUFZIIGlzIHRoZSBwYXJhdmlydHVhbGl6ZWQg
bW9kZSBhbmQgdGFrZXMgYWR2YW50YWdlIG9mIGhhcmR3YXJlDQo+Pj4+Pj4+Pj4gdmlydHVh
bGl6YXRpb24gc3VwcG9ydCB3aGVuIHBvc3NpYmxlLiBJdCB3aWxsIHVzaW5nIHRoZSBoYXJk
d2FyZSBJT01NVQ0KPj4+Pj4+Pj4+IHN1cHBvcnQgaW5zdGVhZCBvZiB4ZW4tc3dpb3RsYiwg
c28gZGlzYWJsZSBzd2lvdGxiIGlmIGN1cnJlbnQgZG9tYWluIGlzDQo+Pj4+Pj4+Pj4gWGVu
IFBWSC4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBCdXQgdGhlIGtlcm5lbCBoYXMgbm8gd2F5ICh5
ZXQpIHRvIGRyaXZlIHRoZSBJT01NVSwgc28gaG93IGNhbiBpdCBnZXQNCj4+Pj4+Pj4+IGF3
YXkgd2l0aG91dCByZXNvcnRpbmcgdG8gc3dpb3RsYiBpbiBjZXJ0YWluIGNhc2VzIChsaWtl
IEkvTyB0byBhbg0KPj4+Pj4+Pj4gYWRkcmVzcy1yZXN0cmljdGVkIGRldmljZSk/DQo+Pj4+
Pj4+DQo+Pj4+Pj4+IEkgdGhpbmsgUmF5IG1lYW50IHRoYXQsIHRoYW5rcyB0byB0aGUgSU9N
TVUgc2V0dXAgYnkgWGVuLCB0aGVyZSBpcyBubw0KPj4+Pj4+PiBuZWVkIGZvciBzd2lvdGxi
LXhlbiBpbiBEb20wLiBBZGRyZXNzIHRyYW5zbGF0aW9ucyBhcmUgZG9uZSBieSB0aGUgSU9N
TVUNCj4+Pj4+Pj4gc28gd2UgY2FuIHVzZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzZXMgaW5z
dGVhZCBvZiBtYWNoaW5lIGFkZHJlc3NlcyBmb3INCj4+Pj4+Pj4gRE1BLiBUaGlzIGlzIGEg
c2ltaWxhciBjYXNlIHRvIERvbTAgb24gQVJNIHdoZW4gdGhlIElPTU1VIGlzIGF2YWlsYWJs
ZQ0KPj4+Pj4+PiAoc2VlIGluY2x1ZGUveGVuL2FybS9zd2lvdGxiLXhlbi5oOnhlbl9zd2lv
dGxiX2RldGVjdCwgdGhlIGNvcnJlc3BvbmRpbmcNCj4+Pj4+Pj4gY2FzZSBpcyBYRU5GRUFU
X25vdF9kaXJlY3RfbWFwcGVkKS4NCj4+Pj4+Pg0KPj4+Pj4+IEJ1dCBob3cgZG9lcyBYZW4g
dXNpbmcgYW4gSU9NTVUgaGVscCB3aXRoLCBhcyBzYWlkLCBhZGRyZXNzLXJlc3RyaWN0ZWQN
Cj4+Pj4+PiBkZXZpY2VzPyBUaGV5IG1heSBzdGlsbCBuZWVkIGUuZy4gYSAzMi1iaXQgYWRk
cmVzcyB0byBiZSBwcm9ncmFtbWVkIGluLA0KPj4+Pj4+IGFuZCBpZiB0aGUga2VybmVsIGhh
cyBtZW1vcnkgYmV5b25kIHRoZSA0RyBib3VuZGFyeSBub3QgYWxsIEkvTyBidWZmZXJzDQo+
Pj4+Pj4gbWF5IGZ1bGZpbGwgdGhpcyByZXF1aXJlbWVudC4NCj4+Pj4+DQo+Pj4+PiBJbiBz
aG9ydCwgaXQgaXMgZ29pbmcgdG8gd29yayBhcyBsb25nIGFzIExpbnV4IGhhcyBndWVzdCBw
aHlzaWNhbA0KPj4+Pj4gYWRkcmVzc2VzIChub3QgbWFjaGluZSBhZGRyZXNzZXMsIHRob3Nl
IGNvdWxkIGJlIGFueXRoaW5nKSBsb3dlciB0aGFuDQo+Pj4+PiA0R0IuDQo+Pj4+Pg0KPj4+
Pj4gSWYgdGhlIGFkZHJlc3MtcmVzdHJpY3RlZCBkZXZpY2UgZG9lcyBETUEgdmlhIGFuIElP
TU1VLCB0aGVuIHRoZSBkZXZpY2UNCj4+Pj4+IGdldHMgcHJvZ3JhbW1lZCBieSBMaW51eCB1
c2luZyBpdHMgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzc2VzIChub3QgbWFjaGluZQ0KPj4+Pj4g
YWRkcmVzc2VzKS4NCj4+Pj4+DQo+Pj4+PiBUaGUgMzItYml0IHJlc3RyaWN0aW9uIHdvdWxk
IGJlIGFwcGxpZWQgYnkgTGludXggdG8gaXRzIGNob2ljZSBvZiBndWVzdA0KPj4+Pj4gcGh5
c2ljYWwgYWRkcmVzcyB0byB1c2UgdG8gcHJvZ3JhbSB0aGUgZGV2aWNlLCB0aGUgc2FtZSB3
YXkgaXQgZG9lcyBvbg0KPj4+Pj4gbmF0aXZlLiBUaGUgZGV2aWNlIHdvdWxkIGJlIGZpbmUg
YXMgaXQgYWx3YXlzIHVzZXMgTGludXgtcHJvdmlkZWQgPDRHQg0KPj4+Pj4gYWRkcmVzc2Vz
LiBBZnRlciB0aGUgSU9NTVUgdHJhbnNsYXRpb24gKHBhZ2V0YWJsZSBzZXR1cCBieSBYZW4p
LCB3ZQ0KPj4+Pj4gY291bGQgZ2V0IGFueSBhZGRyZXNzLCBpbmNsdWRpbmcgPjRHQiBhZGRy
ZXNzZXMsIGFuZCB0aGF0IGlzIGV4cGVjdGVkIHRvDQo+Pj4+PiB3b3JrLg0KPj4+Pg0KPj4+
PiBJIHVuZGVyc3RhbmQgdGhhdCdzIHRoZSAibm9ybWFsIiB3YXkgb2Ygd29ya2luZy4gQnV0
IHdoYXRldmVyIHRoZSBzd2lvdGxiDQo+Pj4+IGlzIHVzZWQgZm9yIGluIGJhcmVtZXRhbCBM
aW51eCwgdGhhdCB3b3VsZCBzaW1pbGFybHkgcmVxdWlyZSBpdHMgdXNlIGluDQo+Pj4+IFBW
SCAob3IgSFZNKSBhaXVpLiBTbyB1bmNvbmRpdGlvbmFsbHkgZGlzYWJsaW5nIGl0IGluIFBW
SCB3b3VsZCBsb29rIHRvDQo+Pj4+IG1lIGxpa2UgYW4gaW5jb21wbGV0ZSBhdHRlbXB0IHRv
IGRpc2FibGUgaXRzIHVzZSBhbHRvZ2V0aGVyIG9uIHg4Ni4gV2hhdA0KPj4+PiBkaWZmZXJl
bmNlIG9mIFBWSCB2cyBiYXJlbWV0YWwgYW0gSSBtaXNzaW5nIGhlcmU/DQo+Pj4NCj4+PiBz
d2lvdGxiIGlzIG5vdCB1c2FibGUgZm9yIEdQVXMgZXZlbiBvbiBiYXJlIG1ldGFsLiAgVGhl
eSBvZnRlbiBoYXZlDQo+Pj4gaHVuZHJlZHMgb3IgbWVncyBvciBldmVuIGdpZ3Mgb2YgbWVt
b3J5IG1hcHBlZCBvbiB0aGUgZGV2aWNlIGF0IGFueQ0KPj4+IGdpdmVuIHRpbWUuICBBbHNv
LCBBTUQgR1BVcyBzdXBwb3J0IDQ0LTQ4IGJpdCBETUEgbWFza3MgKGRlcGVuZGluZyBvbg0K
Pj4+IHRoZSBjaGlwIGZhbWlseSkuDQo+Pg0KPj4gQnV0IHRoZSBzd2lvdGxiIGlzbid0IHBl
ciBkZXZpY2UsIGJ1dCBzeXN0ZW0gZ2xvYmFsLg0KPiANCj4gU3VyZSwgYnV0IGlmIHRoZSBz
d2lvdGxiIGlzIGluIHVzZSwgdGhlbiB5b3UgY2FuJ3QgcmVhbGx5IHVzZSB0aGUgR1BVLg0K
PiBTbyB5b3UgZ2V0IHRvIHBpY2sgb25lLg0KDQpUaGUgc3dpb3RsYiBpcyB1c2VkIG9ubHkg
Zm9yIGJ1ZmZlcnMgd2hpY2ggYXJlIG5vdCB3aXRoaW4gdGhlIERNQSBtYXNrIG9mIGENCmRl
dmljZSAoc2VlIGRtYV9kaXJlY3RfbWFwX3BhZ2UoKSkuIFNvIGFuIEFNRCBHUFUgc3VwcG9y
dGluZyBhIDQ0IGJpdCBETUEgbWFzaw0Kd29uJ3QgdXNlIHRoZSBzd2lvdGxiIHVubGVzcyB5
b3UgaGF2ZSBhIGJ1ZmZlciBhYm92ZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIG9mDQoxNlRC
IChzbyBiYXNpY2FsbHkgbmV2ZXIpLg0KDQpEaXNhYmxpbmcgc3dpb3RsYiBpbiBzdWNoIGEg
Z3Vlc3Qgd291bGQgT1RPSCBtZWFuLCB0aGF0IGEgZGV2aWNlIHdpdGggb25seQ0KMzIgYml0
IERNQSBtYXNrIHBhc3NlZCB0aHJvdWdoIHRvIHRoaXMgZ3Vlc3QgY291bGRuJ3Qgd29yayB3
aXRoIGJ1ZmZlcnMNCmFib3ZlIDRHQi4NCg0KSSBkb24ndCB0aGluayB0aGlzIGlzIGFjY2Vw
dGFibGUuDQoNCg0KSnVlcmdlbg0K
--------------1b41NgLaiQsjMb7RKLLGi4fU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------1b41NgLaiQsjMb7RKLLGi4fU--

--------------Ehfs40kqb3RztTpecUkkpx7N--

--------------snWYocCElH8aj08SzfxiNqji
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQTJcQFAwAAAAAACgkQsN6d1ii/Ey9a
Cgf+NtMrsbKLxtEg0u5doZpUYGhlaT5lXs50IRjyg8b5KR1chByRTDNy3DQuyPbOz4AmeMgzsyT8
eJjKsUIFolwv6VODsTxe3nXk38UIsUdgNgPaeHIXwfbq//tmBSpU/w1MA4qs/aj7rvOlEM5/7qVz
scQK+B1R+FJqrCDr1RLniNcKgp1bAQHK8aYRTPpJhDpZEvV2p6YRhKjQdOXZjc3q2fnyySvuxG5J
IP7QjnBiwCFPR+8EVjYMySUutFhx3ZlcQopmTrZ+SBSxRJAKyus0N7QW3OWu8AvKm5U+IgeKjV47
sLmb7quNbt4h9jO8eqRhSD0reGeYvRhUNu+LBI3MNQ==
=mE+n
-----END PGP SIGNATURE-----

--------------snWYocCElH8aj08SzfxiNqji--
