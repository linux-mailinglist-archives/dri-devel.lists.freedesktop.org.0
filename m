Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E2734E23
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3708510E1BE;
	Mon, 19 Jun 2023 08:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D153F10E1BE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 08:42:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 483751F45A;
 Mon, 19 Jun 2023 08:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687164135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SOKhXmilt88fh3PH69dqWXrHOU75W6OLJmOPOMDb65A=;
 b=hqwR1LHoJ/MGt4KUFnwRE3sdb8oZ/60DMUSBxyAKyMZHyAK1Uvi0fSf6BaTng1dwigxoGI
 +KwikHzcuLd9DGYXF19PFZrb8ePudNcUCCT2+m/2rKTY2XYhPgt6AtbrMcBYgU6VPF/CU3
 WXf5TL1esz78++EnfrFfr/dnIn7E8sU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687164135;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SOKhXmilt88fh3PH69dqWXrHOU75W6OLJmOPOMDb65A=;
 b=sm+nEFoa3Al6c2EaK7mZ0IpjVbhOZDVheZ7ODRIX+kF2rfutvLdCZMBNqWEm5ODydrlan+
 f1mdjFDaUkgd04DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAFBA139C2;
 Mon, 19 Jun 2023 08:42:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4NgxOOYUkGS4GgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Jun 2023 08:42:14 +0000
Message-ID: <c3dcf033-64f6-3352-98eb-7fa8f9fd9952@suse.de>
Date: Mon, 19 Jun 2023 10:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 01/38] backlight/bd6107: Compare against struct
 fb_info.device
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
References: <20230613110953.24176-1-tzimmermann@suse.de>
 <20230613110953.24176-2-tzimmermann@suse.de>
 <20230614135157.GU3635807@google.com>
 <5720dbc1-a3e4-2b23-28cd-f889d3a5a4fc@suse.de>
 <9f74b8de-9a1b-2547-5eab-d4b4349a6a81@suse.de>
 <20230619083124.GO3635807@google.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230619083124.GO3635807@google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x2uTMyNaWILr0059uzJaxuqD"
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
Cc: daniel.thompson@linaro.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, javierm@redhat.com, michael.j.ruhl@intel.com,
 stable@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------x2uTMyNaWILr0059uzJaxuqD
Content-Type: multipart/mixed; boundary="------------FfrcJLINIay9mSvujcOdSA7r";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lee Jones <lee@kernel.org>
Cc: daniel.thompson@linaro.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linux-staging@lists.linux.dev, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 michael.j.ruhl@intel.com, stable@vger.kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org, dan.carpenter@linaro.org
Message-ID: <c3dcf033-64f6-3352-98eb-7fa8f9fd9952@suse.de>
Subject: Re: [PATCH v3 01/38] backlight/bd6107: Compare against struct
 fb_info.device
References: <20230613110953.24176-1-tzimmermann@suse.de>
 <20230613110953.24176-2-tzimmermann@suse.de>
 <20230614135157.GU3635807@google.com>
 <5720dbc1-a3e4-2b23-28cd-f889d3a5a4fc@suse.de>
 <9f74b8de-9a1b-2547-5eab-d4b4349a6a81@suse.de>
 <20230619083124.GO3635807@google.com>
In-Reply-To: <20230619083124.GO3635807@google.com>

--------------FfrcJLINIay9mSvujcOdSA7r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE5LjA2LjIzIHVtIDEwOjMxIHNjaHJpZWIgTGVlIEpvbmVzOg0KPiBPbiBGcmks
IDE2IEp1biAyMDIzLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4gDQo+PiBIaSBMZWUN
Cj4+DQo+PiBBbSAxNC4wNi4yMyB1bSAxNjoxMyBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5u
Og0KPj4gWy4uLl0NCj4+Pj4gQ2FuIHRoZSBCYWNrbGlnaHQgcGF0Y2hlcyBiZSBhcHBsaWVk
IHdpdGhvdXQgdGhlIG90aGVycyBhbmQgdmlzYSB2ZXJzYT8NCj4+Pg0KPj4+IFVuZm9ydHVu
YXRlbHkgbm90LiBUaGUgcmVzdCBvZiB0aGUgc2VyaWVzIHJlcXVpcmVzIHRoZSBiYWNrbGln
aHQgcGF0Y2hlcy4NCj4+DQo+PiBBcmUgeW91IE9LIHdpdGggdGhlIHBhdGNoZXMgZ29pbmcg
dGhyb3VnaCBkcm0/DQo+IA0KPiBTaG91bGRuJ3QgYmUgYW4gaXNzdWUuDQo+IA0KPiBQbGVh
c2UgZW5zdXJlIG15IEFjayBpcyBhZGRlZCB0byBlYWNoIHBhdGNoLCBldmVuIGlmIHlvdSBo
YXZlIHRvIFJFU0VORC4NCj4gDQoNClRoYW5rIHlvdSBzbyBtdWNoLg0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVl
cm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBN
Y0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==


--------------FfrcJLINIay9mSvujcOdSA7r--

--------------x2uTMyNaWILr0059uzJaxuqD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSQFOYFAwAAAAAACgkQlh/E3EQov+Ch
BQ/+JflJsQuMzXECPK9VFU7zEi53QUx+vcXje64q3GmMHSTW9fdVYOmGbymvWuX6fBVe8dKb0mRD
qWkSo1eIVuB529fujKvvUv1aYyaeXeClVcfr7tBttmcvaB59aLRjQd9ZY/g6ESubE6sRFhyDr/XU
ACjE7JDXd4c4cb3c7Oxh4BJbCUMIQy3SEdPdAORSRszkWu3l1mh8SUjsebxJjWNLciriJOgqU/AP
w3hQKcFjtouXKZD6ABevwyUT0ONCUma5EwVNDdRpzcx3hy+BJQ2r/eo5A6tWVEtEJYjiuEPIk/Lo
hn19NLelNf/iJk2iX/4eKCz2iIYEr2hb9UO9SgevpaCzSCJHUEwSsN1oo3g8zlKpJcToX9dzBknx
3yzyNKelgmwBqaLxmUKQv/pACJBvTFiee4rcjp/NvK6aOB3dWT/QUpGZy2zDkLQjMtMVbMkeEmrD
+8/syCKWxf/U5f+O7INzTply1L6zOt/u+Ck4ZF8FRpFsQlUovJdnyZy682OmwERwYmEHr6KCZs+8
ufThfC8y7P9/h1vrW+esO8WVFC82xVTKGHR9p0oUZ+NWPKps1PLKftYENFMuSf+JkMcjkdkub9YQ
JwYAIVxKVZnqTwOtb4AirhbO8SkP+9l3gB3aemfLAmnsqcA9gqk/XHAyWHtTCkhUSOpQPzS2sBQ7
Ehw=
=SeiA
-----END PGP SIGNATURE-----

--------------x2uTMyNaWILr0059uzJaxuqD--
