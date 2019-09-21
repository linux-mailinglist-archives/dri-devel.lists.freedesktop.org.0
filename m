Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB79BAE10
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA836E0FD;
	Mon, 23 Sep 2019 06:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084F56E075
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 18:40:46 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.64.44]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LkPnr-1hebHM20Al-00cQL7; Sat, 21
 Sep 2019 20:40:19 +0200
To: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Zheng Yang <zhengyang@rock-chips.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/rockchip/rk3066: Use devm_platform_ioremap_resource() in
 rk3066_hdmi_bind()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0666bc0b-6624-21a0-47c4-b78e2a3b3ad5@web.de>
Date: Sat, 21 Sep 2019 20:40:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:5I3KuHcCJx+Ogtmv8TkE+aOUJZQhTM3hWEdytOtIg94XcoRHXwC
 8yQ5Vmf68D9oCgcXp+HmU9gj4qeO98DxGjMCbZ1ppeQ4x+B6HID151IVmVk8W4TmWKbCdbJ
 ojRXBpR86dRNY/b4Ab+bVKTjNSlv50SVKc+l+ueTnsraKxfntPYIY+v9ww63xXEJC7LMP8v
 1hgw5woFymUdqEDVnx62w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K5heBjx4d+Y=:fXuxZ2pnoPj0CdmC3JlDEZ
 CbsPctl5Dv4ymI1Gq83euUzsXwR8fnbxQlDP+6mp6yPoStGj6ZuQn2d9sDHkhc2nkJhrMo/x/
 j/F/gYf3osfiSYY0Qm1cLdUagAMSjpBRlRMPKmB6vifQpKrTHdJc3clRgmNqNmITDmXHKcyHB
 myvzRAA5hXz9sCMrBkcUkoSb15f4ynbNReKzQpZrAiMat/jijqK+FOHr525rgDLz6A2lOHCry
 P6nNmaMcqsm60nw8AnV2waLeuvuv8J1CK4fb3QciefjMhL+K/vRdaY0AkK8r8itIjERyIDk3U
 bT4Qtvab5BCWoCgVOEmRq/StQmri5DEjY1rDd68CfU+qQozdoomT/NbgYmPYPV5xjAZny30C8
 /cPD4C+PwCRRQ/4CJh+KkvlSKbB3aWHRdGAvfKteDQ17R0C/N/RY64Jzd97huCMkv696rkT6p
 uLVthZ9xtrlu1fuMqGHRUaa+UD/58GfMlcngQkO7FtxXuzKcSf2/Rh7LpcgS/w/47RdyX0MrL
 BfqCYskBrYJgeF+iHtVxYLXE0jfUI36FvluE0JTH53pQNUGwN9ZDitRNQrSRMNtJYWs3FoR5A
 Y8O9bRtyPcp8qYRfkSPsxReFGB5SOlfa85Zxl9ASaOLulY5VEDRNXtbCZkceWAfFw0CDGM3W0
 s/xyrLPADuy6v2KFwo+TImvJBNs/TXQz4DrT2MV9TeQsXkda4RcZfBLRT0z5/lJ2wC2BV1Gwi
 W6t2IjKPFW5bYFFdRF7sTgJjWD2+jcsEYQKSZx/kGbXTr+6DeF+BlaFMiRAggHfwcP7k6hJ0l
 a+oB6oU+W/cUT/cZC+ACBybyCQFsi1iYF2/GEQJEabc/sjUJSgMFtfjdlNWyWHas5cmZt++C7
 2MjM6UiVheaR5Msu6ssQBX3eYehRvGwV84dzZel36ID+qEwgo2Ff96z+9BNKrKRA0t3QED4BH
 HFJvJ31PAshjBK/Uj4TCyDjNkwLVcGegGqTaSPAg4dQHJeOXK1U/YHPxLBsrCkB3YJSc7yt8G
 KdPMkfR2B1ff4HeIuANRjyo/ubt1u0yD7rLa4t3rFKZMlRq10mx/DsPBDF83JjNzRBUG6cXMz
 O1YctSmIXp8W2SO8bVJVblEitOoA5b5Z0vwVX/zRofYmnITrjI6TqsJPTwoI0u2AAgA8ZqFg/
 4c64q5b0u+ShwgIHuCo9fjrjX6wlEnSaJHI00WU7gHd63CwLpl/UGFr/UjKvC2AIe5CT50tDo
 3oEk4kmbOkHN6ms4R2t9KecIokfQPjnO1XXf69e45uQuar0rzR9RHeAXoMqQ=
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1569091219;
 bh=Twq1fj2lQc3nmfC187jBrB33/1QwxY+fy4X0HS5AHhE=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=KJw7POip/zrplKUQwCoIyGHOd6wUfMqr5wf0nR9Oh9gfI6S5CaOuzaW6BuiMm/FSK
 aZEUenAMLauMrLPjOIGDSLWjIuwRC76aETAuFCiqtY3HfhUZcegJlDpqZL4lSIYiix
 DM9kEdaI8yoQy6iQVmvYcYcymNxcU885GyoRe/lY=
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
Cc: Johan Jonker <jbx6244@gmail.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTYXQsIDIxIFNlcCAyMDE5IDIwOjMyOjI1ICswMjAwCgpTaW1wbGlmeSB0aGlzIGZ1bmN0aW9u
IGltcGxlbWVudGF0aW9uIGJ5IHVzaW5nIGEga25vd24gd3JhcHBlciBmdW5jdGlvbi4KClRoaXMg
aXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgoKU2ln
bmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yazMwNjZfaGRtaS5jIHwgOCArLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yazMwNjZfaGRtaS5jIGIvZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL3JrMzA2Nl9oZG1pLmMKaW5kZXggODVmYzVmMDFmNzYxLi5jZGI0MDFm
NDI4M2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yazMwNjZfaGRtaS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yazMwNjZfaGRtaS5jCkBAIC03NDMsNyAr
NzQzLDYgQEAgc3RhdGljIGludCByazMwNjZfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldmljZSAqbWFzdGVyLAogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0
b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGF0YTsK
IAlzdHJ1Y3QgcmszMDY2X2hkbWkgKmhkbWk7Ci0Jc3RydWN0IHJlc291cmNlICppb3JlczsKIAlp
bnQgaXJxOwogCWludCByZXQ7CgpAQCAtNzUzLDEyICs3NTIsNyBAQCBzdGF0aWMgaW50IHJrMzA2
Nl9oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCgog
CWhkbWktPmRldiA9IGRldjsKIAloZG1pLT5kcm1fZGV2ID0gZHJtOwotCi0JaW9yZXMgPSBwbGF0
Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwotCWlmICghaW9yZXMp
Ci0JCXJldHVybiAtRU5YSU87Ci0KLQloZG1pLT5yZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNl
KGRldiwgaW9yZXMpOworCWhkbWktPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3Vy
Y2UocGRldiwgMCk7CiAJaWYgKElTX0VSUihoZG1pLT5yZWdzKSkKIAkJcmV0dXJuIFBUUl9FUlIo
aGRtaS0+cmVncyk7CgotLQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
