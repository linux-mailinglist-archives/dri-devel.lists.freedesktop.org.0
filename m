Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1371D514348
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 09:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F26410FCF7;
	Fri, 29 Apr 2022 07:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C5D10FCF7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 07:27:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 662A91F37F;
 Fri, 29 Apr 2022 07:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651217255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G13O3XnUu/L4LLGheRPalfSPMx0kK8p2Hk4oDfB73pw=;
 b=ZB/OWhKsamYck4/fs/df5IqG3vhXVX61YuJutyj0WbXVTmtROVJ6bMgvLjdUii0aU7Tant
 DFQflQ5E71KSP3RLdZPanmaXEaVNXlQzXHyd5DlIrTJxLuZJyFCZWSUQ9+cac+r5CcFHwB
 37IdrIOkcjPUujI44HFa6v0EQYaslb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651217255;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G13O3XnUu/L4LLGheRPalfSPMx0kK8p2Hk4oDfB73pw=;
 b=2cLmWfWd4uW4NuPAz5Ec+cWQqNz5dp1xiSgvlevz5/fXL/I/d09QtKSD18TMobBR7avmdB
 gQD6J265GCd+L4Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38CB013AE0;
 Fri, 29 Apr 2022 07:27:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id N0KxDGeTa2JvRgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Apr 2022 07:27:35 +0000
Message-ID: <91f562b5-1b8e-1445-b6b5-5aeb6cd7668a@suse.de>
Date: Fri, 29 Apr 2022 09:27:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 4/5] fbdev: Rename pagelist to pagereflist for deferred
 I/O
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 deller@gmx.de, airlied@linux.ie, maarten.lankhorst@linux.intel.com
References: <20220426120359.17437-1-tzimmermann@suse.de>
 <20220426120359.17437-5-tzimmermann@suse.de>
 <ac24d81e-f6c5-0763-909a-c15d223f1ea9@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ac24d81e-f6c5-0763-909a-c15d223f1ea9@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s3Wxp8c3NtGZUzGO6WyX35Ui"
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
Cc: linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------s3Wxp8c3NtGZUzGO6WyX35Ui
Content-Type: multipart/mixed; boundary="------------cFqm7jIwNKpW6APDWTq8bPrU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 deller@gmx.de, airlied@linux.ie, maarten.lankhorst@linux.intel.com
Cc: linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Message-ID: <91f562b5-1b8e-1445-b6b5-5aeb6cd7668a@suse.de>
Subject: Re: [PATCH v3 4/5] fbdev: Rename pagelist to pagereflist for deferred
 I/O
References: <20220426120359.17437-1-tzimmermann@suse.de>
 <20220426120359.17437-5-tzimmermann@suse.de>
 <ac24d81e-f6c5-0763-909a-c15d223f1ea9@redhat.com>
In-Reply-To: <ac24d81e-f6c5-0763-909a-c15d223f1ea9@redhat.com>

--------------cFqm7jIwNKpW6APDWTq8bPrU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDQuMjIgdW0gMDk6MjEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDQvMjYvMjIgMTQ6MDMsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gUmVuYW1lIHZhcmlvdXMgaW5zdGFuY2VzIG9mIHBh
Z2VsaXN0IHRvIHBhZ2VyZWZsaXN0LiBUaGUgbGlzdCBub3cNCj4+IHN0b3JlcyBwYWdlcmVm
IHN0cnVjdHVyZXMsIHNvIHRoZSBuZXcgbmFtZSBpcyBtb3JlIGFwcHJvcHJpYXRlLg0KPj4N
Cj4+IEluIHRoZWlyIHdyaXRlLWJhY2sgaGVscGVycywgc2V2ZXJhbCBmYmRldiBkcml2ZXJz
IHJlZmVyIHRvIHRoZQ0KPj4gcGFnZXJlZiBsaXN0IGluIHN0cnVjdCBmYl9kZWZlcnJlZF9p
byBpbnN0ZWFkIG9mIHVzaW5nIHRoZSBvbmUNCj4+IHN1cHBsaWVkIGFzIGFyZ3VtZW50IHRv
IHRoZSBmdW5jdGlvbi4gQ29udmVydCB0aGVtIG92ZXIgdG8gdGhlDQo+PiBzdXBwbGllZCBv
bmUuIEl0J3MgdGhlIHNhbWUgaW5zdGFuY2UsIHNvIG5vIGNoYW5nZSBvZiBiZWhhdmlvcg0K
Pj4gb2NjdXJzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KPj4gU3VnZ2VzdGVkLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+DQo+IA0KPiBJIHRob3VndCB0aGUgY29udmVudGlvbiB3YXMgdG8g
aGF2ZSBTdWdnZXN0ZWQtYnkgYmVmb3JlIHlvdXIgUy1vLUIuDQoNCkkgYWx3YXlzIHRob3Vn
aHQgdGhhdCB0aGUgY29udmVudGlvbiB3YXMgdGhhdCB0aGUgYXV0aG9ycyBTLW8tQiBnb2Vz
IA0KZmlyc3QuIEJ1dCAnZ2l0IGxvZycgaW5kZWVkIGluZGljYXRlcyBvdGhlcndpc2UuIEkg
d2lsbCBjaGFuZ2UgdGhpcyANCmJlZm9yZSBtZXJnaW5nIHRoZSBwYXRjaC4NCg0KPiANCj4g
VGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuDQo+IA0KPiBSZXZpZXdlZC1ieTogSmF2aWVy
IE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IA0KDQpUaGFua3MN
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------cFqm7jIwNKpW6APDWTq8bPrU--

--------------s3Wxp8c3NtGZUzGO6WyX35Ui
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJrk2YFAwAAAAAACgkQlh/E3EQov+DY
lBAAxJ5W7Rkt9gQ3/7mjo0W9Mn9lXSbDGKLvtVmxWxobxQz+bDuF/1/lB02IDQGRcy/4DKLgHLXo
5mCxeuwVAiH/suX1YVOtIuFRzDEQYItfMCKhnx7yUeaJoNCYbyW36XsUV5Kbwi7AR9+69nxNr7Au
uWoDYzVVu1fiotaQvFupTJvrRTzpk8/nrmoLclvGkBBB6UgXOl2XAz0U1ErZqn+b0wdFbejXy2lN
dOHW0JUxZ8S3ZRSWmVWyfAgO8SVQWWB4XrL/TZz50788M1IlTz5U8vZryxaWVNQ7/CAowTSoCPz2
ESVLmy6unZEXHqSskEtmcAYpF/KyROss+L3/9eRV6Sn9HMVtjuKS9k71FOxsYVXaECU2bK3HXBuh
QfVKUBxOS301wHa//Qb5eVZbMF1YYTubn1vlwrU1lfM9HeLD1z93uQwXKupbXovbs9/ptJVSjg7M
b4GncZaEQ1fAWmk3RfRZSu6OMh6DFf7k8KW7Uf8x/Ywx4lp/CXgGXlkR8vzKeQcPGkBg3u8g8OY+
oKaFxYQkeSNgBiGZMOkl6Nwa9GlVZb4qP82VVbE6aICFi6jmdCY5OSP2cxwOBG8r443d2p5saN2M
ZUEApQloOjc8aGaSuGsDrAYKYtoW7LFP+UjoMXdhtTMOm5kD7twUBbci/h7evcTnrZTN/vRhParQ
5Qg=
=qNSB
-----END PGP SIGNATURE-----

--------------s3Wxp8c3NtGZUzGO6WyX35Ui--
