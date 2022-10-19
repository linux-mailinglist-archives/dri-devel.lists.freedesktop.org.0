Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A528A6042F8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 13:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D639610F116;
	Wed, 19 Oct 2022 11:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC26C10F116
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 11:12:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6FB5B22CF2;
 Wed, 19 Oct 2022 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666177959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6DNv6nOoZbv5oE/Fm1+OLody+8sWI1YqVwZWqRciZeQ=;
 b=pdNom9+uTIFB+4yptyHOiDQ7+Kn6k6aLss6DyqadaPmV0j9p9rZONgqvG2oSZ6DKL71/rU
 2rzETDCPUZVsH1NuwYmf+hAUXcNjbxhx+A5oy8X2xvIct5FDPa/ItJG5FEu+PmAbFHEq47
 QOliY+EZx9M/Y3sZjm9qzV5Gid+pOFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666177959;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6DNv6nOoZbv5oE/Fm1+OLody+8sWI1YqVwZWqRciZeQ=;
 b=XRoOZBJk+quWnWGdF1ebaEEc1d6eCD7whESiAGSghd+bi6xQlXuMHFCnrHK2ld02t2p9X2
 wlMCn+FrGIexCLBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C771813345;
 Wed, 19 Oct 2022 11:12:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xLvVL6bbT2MaPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Oct 2022 11:12:38 +0000
Message-ID: <29629b96-e46c-e157-e28f-9a754aa4e068@suse.de>
Date: Wed, 19 Oct 2022 13:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm: Remove drm_mode_config::fb_base
Content-Language: en-US
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
References: <20221018131754.351957-1-zack@kde.org>
 <27c535fe-6dfe-43a0-f915-324878798c36@suse.de>
 <f3241efec5b8f79a23e1780edca5ead841ad6532.camel@vmware.com>
 <f374944f-f374-d07c-2ac2-bb1e5598dea1@suse.de>
 <Y0/at6dIEzMIhTsO@smile.fi.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y0/at6dIEzMIhTsO@smile.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LvQg03gEV0OzGEC0Do6LDT4A"
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
Cc: "kherbst@redhat.com" <kherbst@redhat.com>,
 "xinliang.liu@linaro.org" <xinliang.liu@linaro.org>,
 "lijo.lazar@amd.com" <lijo.lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mairacanal@riseup.net" <mairacanal@riseup.net>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "Jerry.Zuo@amd.com" <Jerry.Zuo@amd.com>,
 "flora.cui@amd.com" <flora.cui@amd.com>, "etom@igel.co.jp" <etom@igel.co.jp>,
 "guchun.chen@amd.com" <guchun.chen@amd.com>,
 "bernard@vivo.com" <bernard@vivo.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Yuliang.Shi@amd.com" <Yuliang.Shi@amd.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>, "sean@poorly.run" <sean@poorly.run>,
 "tomba@kernel.org" <tomba@kernel.org>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "roman.li@amd.com" <roman.li@amd.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "tiantao6@hisilicon.com" <tiantao6@hisilicon.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LvQg03gEV0OzGEC0Do6LDT4A
Content-Type: multipart/mixed; boundary="------------LgZkGXntwZ8zAbg5jFhyzMos";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Cc: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kherbst@redhat.com" <kherbst@redhat.com>,
 "xinliang.liu@linaro.org" <xinliang.liu@linaro.org>,
 "lijo.lazar@amd.com" <lijo.lazar@amd.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "mairacanal@riseup.net" <mairacanal@riseup.net>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "flora.cui@amd.com" <flora.cui@amd.com>, "etom@igel.co.jp"
 <etom@igel.co.jp>, "guchun.chen@amd.com" <guchun.chen@amd.com>,
 "bernard@vivo.com" <bernard@vivo.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "Jerry.Zuo@amd.com" <Jerry.Zuo@amd.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "Yuliang.Shi@amd.com" <Yuliang.Shi@amd.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>, "sean@poorly.run"
 <sean@poorly.run>, "tomba@kernel.org" <tomba@kernel.org>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "roman.li@amd.com" <roman.li@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "tiantao6@hisilicon.com" <tiantao6@hisilicon.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Message-ID: <29629b96-e46c-e157-e28f-9a754aa4e068@suse.de>
Subject: Re: [PATCH] drm: Remove drm_mode_config::fb_base
References: <20221018131754.351957-1-zack@kde.org>
 <27c535fe-6dfe-43a0-f915-324878798c36@suse.de>
 <f3241efec5b8f79a23e1780edca5ead841ad6532.camel@vmware.com>
 <f374944f-f374-d07c-2ac2-bb1e5598dea1@suse.de>
 <Y0/at6dIEzMIhTsO@smile.fi.intel.com>
In-Reply-To: <Y0/at6dIEzMIhTsO@smile.fi.intel.com>

--------------LgZkGXntwZ8zAbg5jFhyzMos
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE5LjEwLjIyIHVtIDEzOjA4IHNjaHJpZWIgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tOg0KPiBPbiBXZWQsIE9jdCAxOSwgMjAyMiBhdCAwOTozMjoyNkFNICsw
MjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEFtIDE4LjEwLjIyIHVtIDE3OjUy
IHNjaHJpZWIgWmFjayBSdXNpbjoNCj4gDQo+PiBJSVJDIFBTQiBoYXJkd2FyZSBpcyBvbmx5
IGF2YWlsYWJsZSBpbiAzMi1iaXQgc3lzdGVtcy4NCj4gDQo+IER1bm5vIGFib3V0IGRlZXAg
ZGV0YWlscywgYnV0IElJVUMgdGhlIEludGVsIFRhbmdpZXIgYW5kIEludGVsIEFubmlvZWRh
bGUNCj4gYXJlIDY0LWJpdCBTb0NzIHRoYXQgaGF2ZSBJbWFnaW5hdGlvbiArIEludGVsIElQ
cywgdGhlIGxhdHRlciBmcm9tIHRoaXMNCj4gR01BNXh4L0dNQTZ4eCBmYW1pbHkuDQoNCk9r
IDp8DQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------LgZkGXntwZ8zAbg5jFhyzMos--

--------------LvQg03gEV0OzGEC0Do6LDT4A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNP26YFAwAAAAAACgkQlh/E3EQov+CE
rA/+K7vl5tGESUwoz7ZFOhaf2IkCpmrBuVRXMzAvGFeUmiionyie2VQ1euJaLdS9x5hHQjGNGspM
BpdFpjRnhoV1SAJqL+QYaGlpP6UXF+K4Luk8kmWT4btIXC0x6pb23EZFoxozXCQ85skiWTK7U1Gy
fSKbxA8LeYuZVxhfaGoe4zTxKvcHD3k05t1YiBF/OtuLxpHkUJN5AfL7ZGC7DbNUvoyT22S9dvf/
dmkmkjC6/8hVQw6mdLomX0ZXxJVO2keFSoLdsJW3vLTgtim04Rux+8EJkFTzaFJ3kURuUY0Y09Rs
4ygrkubbTCgqMCuyC6GFOzGvkXFJDk6fGhnqTsXsgQ7aYUpbJOdaPXhrbL+3DxWWMPwsBXTZyUeH
XytF/YZRLsPak8LHdqSg9gZgVLe8xKflegMNs5SlyrRUMGM0K+fi38XXIhklLJcr485XjcQnP2K7
0eob7SXgGo0yzKmtvvXlEflvHFdWpZC7IuHYfUrQJ6WBLbi8IgfYd2wG3aGNd31lrJprY5u6tAJS
h4mtJnuFIOrsASMCwX0Db01SvtgbDPscJjxrqrkdwtuc9JMeWCCtnozZ2WNcPjEAJHZuY+UhYDCA
UVAFUwoyawC/peoDDsBGTJmr+InVE1vTxVkBXUfQHVQ0HhBEE25uCXQINhNsvB+7IyfIOutUA2cG
Xcw=
=50Nj
-----END PGP SIGNATURE-----

--------------LvQg03gEV0OzGEC0Do6LDT4A--
