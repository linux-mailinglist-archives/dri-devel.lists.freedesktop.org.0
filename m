Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A9B5F9AB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 16:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026326E359;
	Thu,  4 Jul 2019 14:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28966E358
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 14:07:14 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id m23so2019765vso.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 07:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P90kgH7q9sXvK86t1MZ4NbDsLn806eYSQE5PzlGAARc=;
 b=NlFi35/usA+ujzoK9YcQ/+uVxvoYlQqxuLQ39Ttq9VpBmzUZ8dGpxKVd+Ia+tPIf7w
 9zCuyf1MG7A1k0AOpYKd/KIAcQY3rmth7feCF2N9dmacu3H8vZhje9CID8sTve5PWBKK
 st0mmIv2R2T78mJ/dAnZBdQTwdd1e0zonF/i2O870SjmuYPezswhyZVWvyVJAb9boN80
 8Jgn9DRguqscG0lbiZpuxiDtOh6SeTCQ6w9N+yRq5FawV/VeWQ0tJieEIrTD98r92y99
 pLJ9yEbDQphzdA0d+S8PJa1bwTDP9wBzfgk1YsU3fPut7Xoq2ruXSJ4dCvZYLofv7pom
 rfOw==
X-Gm-Message-State: APjAAAW70lChEYIJx6mG2FZLhVm7/Ht2Ok/ZFf7g7CLfnARuYvD15DQ4
 0q0Uy1k8fcoxVR0QCxz+D2MS7JD7cGTA4tz1At4=
X-Google-Smtp-Source: APXvYqxEoMd69cp5VHkgPtoEdfoRftzObUi4NGy1EBTWFUhvcqSK1+G87cS5PjbAiMBLFILHt22+c+yDiA4fc0F9Iao=
X-Received: by 2002:a67:7fd8:: with SMTP id a207mr21712067vsd.85.1562249233840; 
 Thu, 04 Jul 2019 07:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190703170150.32548-1-efremov@linux.com>
In-Reply-To: <20190703170150.32548-1-efremov@linux.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 4 Jul 2019 15:07:22 +0100
Message-ID: <CACvgo52N5v07qA_afJfw7vo1X6_Gt4cGqBZn3eBzQtokndjWxA@mail.gmail.com>
Subject: Re: [PATCH] drm/client: remove the exporting of drm_client_close
To: Denis Efremov <efremov@linux.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=P90kgH7q9sXvK86t1MZ4NbDsLn806eYSQE5PzlGAARc=;
 b=j1zYiDtki+YMl3ZvtZfvAuXTVlnDEStPBOtdkF9p0fPM6M7w/NBp1I1IRhHkSlnwyV
 GNTq9Em5g0gy+EkPxBhdvgbjqiI8YanKTJQqDEHlcKzUkIAUIiHyFJmSJNhES7QrQRX1
 j+5NDsgt/HY91cb34ryr7d1jgY3YDBZ+d1HElKoIikbOhI4KXWXVdlgP718Ig/4ROk9t
 iK/9AZib5cCpism8EIWqxizf4z6obLgGkbMtipU8ltVCVXU++1jDeGcvTBBAd7vNF9xm
 yQGRZsX2IXTLUilJe40E2WELAq4UufVd32hJH5tlAkMWNJGRuS3qM2Xg8ZaRCxL9PYIL
 oiqg==
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
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA0IEp1bCAyMDE5IGF0IDA4OjI3LCBEZW5pcyBFZnJlbW92IDxlZnJlbW92QGxpbnV4
LmNvbT4gd3JvdGU6Cj4KPiBUaGUgZnVuY3Rpb24gZHJtX2NsaWVudF9jbG9zZSBpcyBkZWNsYXJl
ZCBhcyBzdGF0aWMgYW5kIG1hcmtlZCBhcwo+IEVYUE9SVF9TWU1CT0wuIEl0J3MgYSBiaXQgY29u
ZnVzaW5nIGZvciBhbiBpbnRlcm5hbCBmdW5jdGlvbiB0byBiZQo+IGV4cG9ydGVkLiBUaGUgYXJl
YSBvZiB2aXNpYmlsaXR5IGZvciBzdWNoIGZ1bmN0aW9uIGlzIGl0cyAuYyBmaWxlCj4gYW5kIGFs
bCBvdGhlciBtb2R1bGVzLiBPdGhlciAqLmMgZmlsZXMgb2YgdGhlIHNhbWUgbW9kdWxlIGNhbid0
IHVzZSBpdCwKPiBkZXNwaXRlIGFsbCBvdGhlciBtb2R1bGVzIGNhbi4gUmVseWluZyBvbiB0aGUg
ZmFjdCB0aGF0IHRoaXMgaXMgdGhlCj4gaW50ZXJuYWwgZnVuY3Rpb24gYW5kIGl0J3Mgbm90IGEg
Y3J1Y2lhbCBwYXJ0IG9mIHRoZSBBUEksIHRoZSBwYXRjaAo+IHJlbW92ZXMgdGhlIEVYUE9SVF9T
WU1CT0wgbWFya2luZyBvZiBkcm1fY2xpZW50X2Nsb3NlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGVu
aXMgRWZyZW1vdiA8ZWZyZW1vdkBsaW51eC5jb20+CgpOaWNlIG9uZToKUmV2aWV3ZWQtYnk6IEVt
aWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgpPdXQgb2YgY3VyaW9zaXR5
OiBEaWQgeW91IHVzZSBzb21lIHRvb2wgdG8gc3BvdCB0aGlzPwoKLUVtaWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
