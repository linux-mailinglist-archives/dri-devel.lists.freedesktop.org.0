Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8034EF4014
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 06:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981DE6F834;
	Fri,  8 Nov 2019 05:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frontdoor.pr.hu (frontdoor.pr.hu
 [IPv6:2a02:808:1:101:250:56ff:fe8e:136b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674C66F834
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 05:44:25 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
 by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iSx4E-0002hl-BK; Fri, 08 Nov 2019 06:44:18 +0100
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
 helo=localhost.localdomain)
 by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <zboszor@pr.hu>)
 id 1iSx4A-0006o2-Eh; Fri, 08 Nov 2019 06:44:16 +0100
Subject: Re: [PATCH v3 0/4] drm/udl: Convert to SHMEM
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch, noralf@tronnes.org, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
References: <20191107094307.19870-1-tzimmermann@suse.de>
 <cd38b510-6914-ab38-677a-1ebce8c7d4d5@pr.hu>
Message-ID: <3eeb788e-40b6-4132-5467-652f15c776fb@pr.hu>
Date: Fri, 8 Nov 2019 06:44:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <cd38b510-6914-ab38-677a-1ebce8c7d4d5@pr.hu>
Content-Language: en-US
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 3be2f66aaf20b59cd4b0edf337d6e8f4
X-Spam-Tracer: backend.mail.pr.hu -1.9 20191108054416Z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=pr.hu; 
 s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Ggb7ALk6p4m7rrfM2I83718B7zDeaF3RsKRuSpml1c=; b=baTenOnI6coXBchIQgdrVteVqP
 z6oOw8C0K4qoH8psIVEm2YXrJI8GS9C0L4VdE3M1FoyyfLynn8T4wQUsCb0j2fp7xAmPgHQ0HowYX
 OMYrmVJux01DkiTAWWrecbkekQCRpeGP0QMSpfjZg1MCMzdcTJpgjhk9b0NlkMKkqK7E8UVi5/VEk
 XuswiaWJB5djNuZZiFCis55pcmIl7ZQeh7MeAcSM3ZdwMrq46Y2OUtMpmDV28L+ztEtneRoXJmCEb
 pwS4n2ozY6mFmFX2BQlWqMDY852RUGohXJprrxVxjljLnDOHUVxhQ0hIk3e4PhwFVczY2msnP6By1
 zJ7TVNAQ==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAxOS4gMTEuIDA3LiAxNjoxMCBrZWx0ZXrDqXNzZWwsIELDtnN6w7ZybcOpbnlpIFpvbHTDoW4g
w61ydGE6Cj4gd2hhdCdzIHRoZSB0cmljayB0byBhY3R1YWxseSBlbmFibGUgdGhlIFVETCBkZXZp
Y2U/Cj4gCj4gV2l0aCA1LjMuOCwgNS4zLjkgb3IgNS40LXJjNiArIGRybS1uZXh0IGFuZCB0aGlz
IHBhdGNoc2V0LCBJIGdldCB0aGlzOgo+IFtsb25nIG1lc3NhZ2VzXQoKSSBkaWRuJ3QgbWVudGlv
biB0aGF0IHRoZSBzeXN0ZW0gaXMgMzItYml0LCB1c2luZyBhIFBBRSBrZXJuZWwuCklzIGl0IGEg
cHJvYmxlbSBmb3Igc3dpb3RsYj8KClRoZSBtYWNoaW5lIGhhcyB0aGlzIENQVToKCm1vZGVsIG5h
bWUJOiBJbnRlbChSKSBDZWxlcm9uKFIpIENQVSBHNTQwIEAgMi41MEdIegoKQmVzdCByZWdhcmRz
LApab2x0w6FuIELDtnN6w7ZybcOpbnlpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
