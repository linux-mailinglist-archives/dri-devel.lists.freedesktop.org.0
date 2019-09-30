Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5F8C1BDB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 08:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FE66E395;
	Mon, 30 Sep 2019 06:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B60E6E2CD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 06:40:15 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id F3421609F3; Mon, 30 Sep 2019 06:40:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from kgunda-linux.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kgunda@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 01D5560128;
 Mon, 30 Sep 2019 06:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01D5560128
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>, Andy Gross <agross@kernel.org>,
 linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH V6 1/8] backlight: qcom-wled: Rename pm8941-wled.c to
 qcom-wled.c
Date: Mon, 30 Sep 2019 12:09:06 +0530
Message-Id: <1569825553-26039-2-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
X-Mailman-Approved-At: Mon, 30 Sep 2019 06:57:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1569825615;
 bh=OMqRx5N2rWXTmv93+Wi9xzjrf7Um3LYjyZ6ahSUawb0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BLxxa52GtpY6nvByOFCQCUpZFyuZ1DYeAeRbq8ObXB3z1FhXhCf9qMaJuNuHGeyVO
 cKpJP+Wp7MwA4BveOKECBi4RHqwfqeW3CCdV9W3xCZ9AO80OjqM6x5f1lRKjdvLStK
 RMjm2YyzIwDMCsPftRS1zcXnG2KuFikWDu9hDQa0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1569825613;
 bh=OMqRx5N2rWXTmv93+Wi9xzjrf7Um3LYjyZ6ahSUawb0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cJVsXzcFVqliWkEFvHj7th7mM6/KLtxjSndaN758PIUWK4RsVTWLMeJxrl/r7U03g
 TcEJiZcU8fUCwTjqi/ME7upsZ38+Sa9rdUA0VlAOFEmObgopPsOe4p+bhTsW5wtCCe
 bmxaKSFJwp4Cy4JNIDXgCNaFhSf5+lJdZc5XxslI=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=kgunda@codeaurora.org
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
Cc: Kiran Gunda <kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cG04OTQxLXdsZWQuYyBkcml2ZXIgaXMgc3VwcG9ydGluZyB0aGUgV0xFRCBwZXJpcGhlcmFsCm9u
IHBtODk0MS4gUmVuYW1lIGl0IHRvIHFjb20td2xlZC5jIHNvIHRoYXQgaXQgY2FuIHN1cHBvcnQK
V0xFRCBvbiBtdWx0aXBsZSBQTUlDcy4KClNpZ25lZC1vZmYtYnk6IEtpcmFuIEd1bmRhIDxrZ3Vu
ZGFAY29kZWF1cm9yYS5vcmc+ClJldmlld2VkLWJ5OiBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFu
ZGVyc3NvbkBsaW5hcm8ub3JnPgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+
CkFja2VkLWJ5OiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KLS0tCiAuLi4vYmluZGluZ3Mv
bGVkcy9iYWNrbGlnaHQve3BtODk0MS13bGVkLnR4dCA9PiBxY29tLXdsZWQudHh0fSAgICB8IDIg
Ky0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgOCArKysrLS0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC97cG04OTQxLXdsZWQuYyA9PiBxY29tLXdsZWQuY30gICAgICAgICAgICB8IDAK
IDQgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1l
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC97cG04OTQx
LXdsZWQudHh0ID0+IHFjb20td2xlZC50eHR9ICg5NSUpCiByZW5hbWUgZHJpdmVycy92aWRlby9i
YWNrbGlnaHQve3BtODk0MS13bGVkLmMgPT4gcWNvbS13bGVkLmN9ICgxMDAlKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9wbTg5
NDEtd2xlZC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNr
bGlnaHQvcWNvbS13bGVkLnR4dApzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvcG04OTQxLXdsZWQu
dHh0CnJlbmFtZSB0byBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNr
bGlnaHQvcWNvbS13bGVkLnR4dAppbmRleCBlNWIyOTRkLi5mYjM5ZTMyIDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvcG04OTQxLXds
ZWQudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2ts
aWdodC9xY29tLXdsZWQudHh0CkBAIC0xLDQgKzEsNCBAQAotQmluZGluZyBmb3IgUXVhbGNvbW0g
UE04OTQxIFdMRUQgZHJpdmVyCitCaW5kaW5nIGZvciBRdWFsY29tbSBUZWNobm9sb2dpZXMsIElu
Yy4gV0xFRCBkcml2ZXIKIAogUmVxdWlyZWQgcHJvcGVydGllczoKIC0gY29tcGF0aWJsZTogc2hv
dWxkIGJlICJxY29tLHBtODk0MS13bGVkIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvS2NvbmZpZyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcKaW5kZXggOGIw
ODFkNi4uNmZmMzE3NiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZp
ZworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9LY29uZmlnCkBAIC0yODQsMTIgKzI4NCwx
MiBAQCBjb25maWcgQkFDS0xJR0hUX1RPU0EKIAkgIElmIHlvdSBoYXZlIGFuIFNoYXJwIFNMLTYw
MDAgWmF1cnVzIHNheSBZIHRvIGVuYWJsZSBhIGRyaXZlcgogCSAgZm9yIGl0cyBiYWNrbGlnaHQK
IAotY29uZmlnIEJBQ0tMSUdIVF9QTTg5NDFfV0xFRAotCXRyaXN0YXRlICJRdWFsY29tbSBQTTg5
NDEgV0xFRCBEcml2ZXIiCitjb25maWcgQkFDS0xJR0hUX1FDT01fV0xFRAorCXRyaXN0YXRlICJR
dWFsY29tbSBQTUlDIFdMRUQgRHJpdmVyIgogCXNlbGVjdCBSRUdNQVAKIAloZWxwCi0JICBJZiB5
b3UgaGF2ZSB0aGUgUXVhbGNvbW0gUE04OTQxLCBzYXkgWSB0byBlbmFibGUgYSBkcml2ZXIgZm9y
IHRoZQotCSAgV0xFRCBibG9jay4KKwkgIElmIHlvdSBoYXZlIHRoZSBRdWFsY29tbSBQTUlDLCBz
YXkgWSB0byBlbmFibGUgYSBkcml2ZXIgZm9yIHRoZQorCSAgV0xFRCBibG9jay4gQ3VycmVudGx5
IGl0IHN1cHBvcnRzIFBNODk0MSBhbmQgUE1JODk5OC4KIAogY29uZmlnIEJBQ0tMSUdIVF9TQUhB
UkEKIAl0cmlzdGF0ZSAiVGFibGV0a2lvc2sgU2FoYXJhIFRvdWNoLWlUIEJhY2tsaWdodCBEcml2
ZXIiCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9NYWtlZmlsZSBiL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L01ha2VmaWxlCmluZGV4IDYzYzUwN2MuLjZmODc3NzAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L01ha2VmaWxlCisrKyBiL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L01ha2VmaWxlCkBAIC00OCw4ICs0OCw4IEBAIG9iai0kKENPTkZJR19CQUNL
TElHSFRfT01BUDEpCQkrPSBvbWFwMV9ibC5vCiBvYmotJChDT05GSUdfQkFDS0xJR0hUX09UMjAw
KQkJKz0gb3QyMDBfYmwubwogb2JqLSQoQ09ORklHX0JBQ0tMSUdIVF9QQU5ET1JBKQkJKz0gcGFu
ZG9yYV9ibC5vCiBvYmotJChDT05GSUdfQkFDS0xJR0hUX1BDRjUwNjMzKQkrPSBwY2Y1MDYzMy1i
YWNrbGlnaHQubwotb2JqLSQoQ09ORklHX0JBQ0tMSUdIVF9QTTg5NDFfV0xFRCkJKz0gcG04OTQx
LXdsZWQubwogb2JqLSQoQ09ORklHX0JBQ0tMSUdIVF9QV00pCQkrPSBwd21fYmwubworb2JqLSQo
Q09ORklHX0JBQ0tMSUdIVF9RQ09NX1dMRUQpCSs9IHFjb20td2xlZC5vCiBvYmotJChDT05GSUdf
QkFDS0xJR0hUX1NBSEFSQSkJCSs9IGtiMzg4Nl9ibC5vCiBvYmotJChDT05GSUdfQkFDS0xJR0hU
X1NLWTgxNDUyKQkrPSBza3k4MTQ1Mi1iYWNrbGlnaHQubwogb2JqLSQoQ09ORklHX0JBQ0tMSUdI
VF9UT1NBKQkJKz0gdG9zYV9ibC5vCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9wbTg5NDEtd2xlZC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKc2lt
aWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Bt
ODk0MS13bGVkLmMKcmVuYW1lIHRvIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5j
Ci0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2Yg
dGhlIENvZGUgQXVyb3JhIEZvcnVtLAogYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUg
UHJvamVjdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
