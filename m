Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEDDEBEEE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2876F747;
	Fri,  1 Nov 2019 08:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69F16F6DF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 06:27:37 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 89F9B60D80; Fri,  1 Nov 2019 06:27:37 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2132260B72;
 Fri,  1 Nov 2019 06:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2132260B72
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>, Andy Gross <agross@kernel.org>,
 linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH V10 1/8] backlight: qcom-wled: Rename pm8941-wled.c to
 qcom-wled.c
Date: Fri,  1 Nov 2019 11:56:57 +0530
Message-Id: <1572589624-6095-2-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572589657;
 bh=UyoJwvIa110PJasaK0nZFq0Mx0PvYN9KUjsCKGhuWEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kADhKO7OkffgS6C6JFePQYqQmgB4kl4+Bhhy8o4ME8YPZ2mJNDm3+nDqOXY3BzsAz
 GrvuYtsPMbA04JZ7XDiBJxy75/K9805ySWbPz3NkcZyMc+ZvENAcZgoioD0fjFsz+3
 0W74LP1mlFTPvtnXzuYEx3wkUV+BiXywEKZ0t+SY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1572589655;
 bh=UyoJwvIa110PJasaK0nZFq0Mx0PvYN9KUjsCKGhuWEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EE0xyh2eR4ER/2CLxWYwfAXMX2N/c4WvniUXnExV+3SPZ5QHjwlBP2dZFpM7SBDQs
 AWjaqfcwGBhxVH0weQ3LWiwr6Y9hyLXByTk6KSa7XtZjAOHTDkCc3Imm1l4fA/+H4H
 nefPvnl3WGO5vaJ5kGxMVMNuYecxcSjzEfXJbvIA=
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
bGlnaHQvS2NvbmZpZyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcKaW5kZXggNDA2
NzZiZS4uNzM0NDJiZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25m
aWcKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZwpAQCAtMjgyLDEyICsyODIs
MTIgQEAgY29uZmlnIEJBQ0tMSUdIVF9UT1NBCiAJICBJZiB5b3UgaGF2ZSBhbiBTaGFycCBTTC02
MDAwIFphdXJ1cyBzYXkgWSB0byBlbmFibGUgYSBkcml2ZXIKIAkgIGZvciBpdHMgYmFja2xpZ2h0
CiAKLWNvbmZpZyBCQUNLTElHSFRfUE04OTQxX1dMRUQKLQl0cmlzdGF0ZSAiUXVhbGNvbW0gUE04
OTQxIFdMRUQgRHJpdmVyIgorY29uZmlnIEJBQ0tMSUdIVF9RQ09NX1dMRUQKKwl0cmlzdGF0ZSAi
UXVhbGNvbW0gUE1JQyBXTEVEIERyaXZlciIKIAlzZWxlY3QgUkVHTUFQCiAJaGVscAotCSAgSWYg
eW91IGhhdmUgdGhlIFF1YWxjb21tIFBNODk0MSwgc2F5IFkgdG8gZW5hYmxlIGEgZHJpdmVyIGZv
ciB0aGUKLQkgIFdMRUQgYmxvY2suCisJICBJZiB5b3UgaGF2ZSB0aGUgUXVhbGNvbW0gUE1JQywg
c2F5IFkgdG8gZW5hYmxlIGEgZHJpdmVyIGZvciB0aGUKKwkgIFdMRUQgYmxvY2suIEN1cnJlbnRs
eSBpdCBzdXBwb3J0cyBQTTg5NDEgYW5kIFBNSTg5OTguCiAKIGNvbmZpZyBCQUNLTElHSFRfU0FI
QVJBCiAJdHJpc3RhdGUgIlRhYmxldGtpb3NrIFNhaGFyYSBUb3VjaC1pVCBCYWNrbGlnaHQgRHJp
dmVyIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvTWFrZWZpbGUgYi9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9NYWtlZmlsZQppbmRleCA2M2M1MDdjLi42Zjg3NzcwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9NYWtlZmlsZQorKysgYi9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9NYWtlZmlsZQpAQCAtNDgsOCArNDgsOCBAQCBvYmotJChDT05GSUdfQkFD
S0xJR0hUX09NQVAxKQkJKz0gb21hcDFfYmwubwogb2JqLSQoQ09ORklHX0JBQ0tMSUdIVF9PVDIw
MCkJCSs9IG90MjAwX2JsLm8KIG9iai0kKENPTkZJR19CQUNLTElHSFRfUEFORE9SQSkJCSs9IHBh
bmRvcmFfYmwubwogb2JqLSQoQ09ORklHX0JBQ0tMSUdIVF9QQ0Y1MDYzMykJKz0gcGNmNTA2MzMt
YmFja2xpZ2h0Lm8KLW9iai0kKENPTkZJR19CQUNLTElHSFRfUE04OTQxX1dMRUQpCSs9IHBtODk0
MS13bGVkLm8KIG9iai0kKENPTkZJR19CQUNLTElHSFRfUFdNKQkJKz0gcHdtX2JsLm8KK29iai0k
KENPTkZJR19CQUNLTElHSFRfUUNPTV9XTEVEKQkrPSBxY29tLXdsZWQubwogb2JqLSQoQ09ORklH
X0JBQ0tMSUdIVF9TQUhBUkEpCQkrPSBrYjM4ODZfYmwubwogb2JqLSQoQ09ORklHX0JBQ0tMSUdI
VF9TS1k4MTQ1MikJKz0gc2t5ODE0NTItYmFja2xpZ2h0Lm8KIG9iai0kKENPTkZJR19CQUNLTElH
SFRfVE9TQSkJCSs9IHRvc2FfYmwubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcG04OTQxLXdsZWQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jCnNp
bWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9w
bTg5NDEtd2xlZC5jCnJlbmFtZSB0byBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQu
YwotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9m
IHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwKIGEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZl
IFByb2plY3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
