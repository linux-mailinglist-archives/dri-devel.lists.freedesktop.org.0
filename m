Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4751A149FA
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 14:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB1C891AA;
	Mon,  6 May 2019 12:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2830B891AA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 12:40:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0E7A97E436;
 Mon,  6 May 2019 12:40:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2949D27193;
 Mon,  6 May 2019 12:40:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3AF5511AAA; Mon,  6 May 2019 14:40:31 +0200 (CEST)
Date: Mon, 6 May 2019 14:40:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 12/19] drm/bochs: Convert bochs driver to VRAM MM
Message-ID: <20190506124031.jwo5exbz6xk5fjan@sirius.home.kraxel.org>
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506082649.942-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506082649.942-13-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 06 May 2019 12:40:33 +0000 (UTC)
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
 zourongrong@gmail.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGJvY2hzX2ZvcHMg
PSB7Cj4gIAkub3duZXIJCT0gVEhJU19NT0RVTEUsCj4gLQkub3BlbgkJPSBkcm1fb3BlbiwKPiAt
CS5yZWxlYXNlCT0gZHJtX3JlbGVhc2UsCj4gLQkudW5sb2NrZWRfaW9jdGwJPSBkcm1faW9jdGws
Cj4gLQkuY29tcGF0X2lvY3RsCT0gZHJtX2NvbXBhdF9pb2N0bCwKPiAtCS5wb2xsCQk9IGRybV9w
b2xsLAo+IC0JLnJlYWQJCT0gZHJtX3JlYWQsCj4gIAkubGxzZWVrCQk9IG5vX2xsc2VlaywKPiAt
CS5tbWFwICAgICAgICAgICA9IGJvY2hzX21tYXAsCj4gKwlEUk1fVlJBTV9NTV9GSUxFX09QRVJB
VElPTlMKPiAgfTsKCldoYXQgYWJvdXQgbGxzZWVrPyAgSSB0aGluayBpdCBzaG91bGQgZWl0aGVy
IGJlIGRlbGV0ZWQgKGlmIG5vdCBuZWVkZWQpCm9yIGFkZGVkIHRvIERSTV9WUkFNX01NX0ZJTEVf
T1BFUkFUSU9OUyAoaWYgbmVlZGVkKS4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
