Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD3D674FB2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BCE10E0DB;
	Fri, 20 Jan 2023 08:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DB110E0DA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 08:47:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1A66F5D9C4;
 Fri, 20 Jan 2023 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674204432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6hR3Puyuod1yY/APrjsySLHm6tzinky2+FcJ7tHq4x4=;
 b=NuEiQ28myh7WTMlWhHOnPi5zxMZ8Isge8oht9YdNkKCtAu7wTnvjQxBn2UuS9OL/88tInY
 5SpQUK4khb7nDG7e9tKXvy2aMuWpd1dxWVgWPxTH1hLQbK7tLheDEB5NnnjR3EnkpLQFlG
 e5reYQg1vCU7Pl83LmjOlg4r6+6Y/qo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674204432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6hR3Puyuod1yY/APrjsySLHm6tzinky2+FcJ7tHq4x4=;
 b=dKYa4Pyxr6Elz9nESurAJ3qzvlR1Fx2MMOww3iv4VzAaInG4UOzJ69DfSwYtxJv3K4YPYj
 12b+XwFNkvKf79Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF44813251;
 Fri, 20 Jan 2023 08:47:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k2iwNQ9VymNXGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 20 Jan 2023 08:47:11 +0000
Message-ID: <a3631d9a-41ad-8568-21c1-bc2fe243824e@suse.de>
Date: Fri, 20 Jan 2023 09:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND][PATCH] MAINTAINERS: Add Sumit Semwal and Yongqin Liu as
 reviwers for kirin DRM driver
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
References: <20230120060956.1244187-1-jstultz@google.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230120060956.1244187-1-jstultz@google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kdv3iHpHtt72he5sdGxGt3fV"
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Yongqin Liu <yongqin.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 kernel-team@android.com, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kdv3iHpHtt72he5sdGxGt3fV
Content-Type: multipart/mixed; boundary="------------Icg6nY7tqpMCH9reilALsxYS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Yongqin Liu <yongqin.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 kernel-team@android.com, Sumit Semwal <sumit.semwal@linaro.org>
Message-ID: <a3631d9a-41ad-8568-21c1-bc2fe243824e@suse.de>
Subject: Re: [RESEND][PATCH] MAINTAINERS: Add Sumit Semwal and Yongqin Liu as
 reviwers for kirin DRM driver
References: <20230120060956.1244187-1-jstultz@google.com>
In-Reply-To: <20230120060956.1244187-1-jstultz@google.com>

--------------Icg6nY7tqpMCH9reilALsxYS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIwLjAxLjIzIHVtIDA3OjA5IHNjaHJpZWIgSm9obiBTdHVsdHo6DQo+IEkgbm8g
bG9uZ2VyIGhhdmUgYWNjZXNzIHRvIHRoZSBIaUtleSBib2FyZHMsIHNvIHdoaWxlIEknbSBo
YXBweSB0bw0KPiByZXZpZXcgY29kZSwgSSB3YW50ZWQgdG8gYWRkIFN1bWl0IGFuZCBZb25n
cWluIHRvIHRoZSByZXZpZXdlcnMgbGlzdA0KPiBzbyB0aGV5IHdvdWxkIGdldCBDQydlZCBv
biBmdXR1cmUgY2hhbmdlcyBhbmQgd291bGQgYmUgYWJsZSB0byBoYXZlDQo+IGEgY2hhbmNl
IHRvIHZhbGlkYXRlIGFuZCBwcm92aWRlIFRlc3RlZC1ieTogdGFncw0KPiANCj4gQ2M6IFhp
bmxpYW5nIExpdSA8eGlubGlhbmcubGl1QGxpbmFyby5vcmc+DQo+IENjOiBUaWFuIFRhbyAg
PHRpYW50YW82QGhpc2lsaWNvbi5jb20+DQo+IENjOiBZb25ncWluIExpdSA8eW9uZ3Fpbi5s
aXVAbGluYXJvLm9yZz4NCj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFy
by5vcmc+DQo+IENjOiBrZXJuZWwtdGVhbUBhbmRyb2lkLmNvbQ0KPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8
anN0dWx0ekBnb29nbGUuY29tPg0KDQpBZGRlZCB0byBkcm0tbWlzYy1uZXh0Lg0KDQo+IC0t
LQ0KPiAgIE1BSU5UQUlORVJTIHwgNCArKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMNCj4gaW5kZXggNDJmYzQ3YzZlZGZkLi44MmRmNTY2ZTY5MjUg
MTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+ICsrKyBiL01BSU5UQUlORVJTDQo+IEBA
IC03MDA3LDkgKzcwMDcsMTEgQEAgRjoJZHJpdmVycy9ncHUvZHJtL2dtYTUwMC8NCj4gICBE
Uk0gRFJJVkVSUyBGT1IgSElTSUxJQ09ODQo+ICAgTToJWGlubGlhbmcgTGl1IDx4aW5saWFu
Zy5saXVAbGluYXJvLm9yZz4NCj4gICBNOglUaWFuIFRhbyAgPHRpYW50YW82QGhpc2lsaWNv
bi5jb20+DQo+IC1SOglKb2huIFN0dWx0eiA8anN0dWx0ekBnb29nbGUuY29tPg0KPiAgIFI6
CVhpbndlaSBLb25nIDxrb25nLmtvbmd4aW53ZWlAaGlzaWxpY29uLmNvbT4NCj4gICBSOglD
aGVuIEZlbmcgPHB1Y2suY2hlbkBoaXNpbGljb24uY29tPg0KPiArUjoJU3VtaXQgU2Vtd2Fs
IDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4NCj4gK1I6CVlvbmdxaW4gTGl1IDx5b25ncWlu
LmxpdUBsaW5hcm8ub3JnPg0KPiArUjoJSm9obiBTdHVsdHogPGpzdHVsdHpAZ29vZ2xlLmNv
bT4NCj4gICBMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ICAgUzoJTWFp
bnRhaW5lZA0KPiAgIFQ6CWdpdCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0v
ZHJtLW1pc2MNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------Icg6nY7tqpMCH9reilALsxYS--

--------------kdv3iHpHtt72he5sdGxGt3fV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPKVQ8FAwAAAAAACgkQlh/E3EQov+CZ
aQ/8CvE8lH+IyjGJ0VqtnuuRFgLBzZ/q/5d+gI6dTUJCY81GVGWcKuhAu+5/lMgGsK7PjKUaxaWO
gB3Zy0XjuogejvYmLC+rttrh+dAgc7Ulzr363xQyf+fY2ZPCEwm09J2XWg0K3nmgPOF7AofjnjOq
K2kPJjJcVK0CXefWIXt2uY1oHM1g8PMlC7YL/jnYlNq6eYSKCJmD3UcvGBE1rfEJZInTPfEV7XIX
Z84q/VGTLgTIATKA/ZOt5OmihVCLq4cZ1g98E+/CX6oogDYsz2ybMp2cb1pOpE654ul9shOAnNrV
mUgIwolgTUSC28KGB/pFxY2vRrM7TkYwD2U/HbL/je0pg6P4Flkvb6Yzprzppn0j6j+KMi7Bry9F
6pSNbaS0JNLV6gjiE5Tg5m08bBtYBp7YqlEvh3+Qh77TYFN+uO1nU3S7VeIb2kD5YvcTm7g8P2tJ
couAQESrY5I9hXA//OZp0oluZJ8IKGaV5iMiW2eaqEHU2vj0XA7DlHZ0HpN8+337sXSG7TTGLzfc
PuwMZ/825AKq5KcbP5rN0VkFq2+DynYQte9mKb22TFk3H3wGmQa4mv22dO5MFXViYT1LEfTUSMKa
BxpE7n7VlBacsVXoyo/3GfG51ToJdYI9C7Tip7j57Nei1lPdKCAERR4BkIYtaHMlNMFPIr88zWwm
1ts=
=gc4L
-----END PGP SIGNATURE-----

--------------kdv3iHpHtt72he5sdGxGt3fV--
