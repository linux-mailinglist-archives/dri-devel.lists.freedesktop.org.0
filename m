Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A30210DDC4
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212B16E124;
	Sat, 30 Nov 2019 13:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC246E891;
 Fri, 29 Nov 2019 07:05:10 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 29 Nov 2019 12:35:08 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.147])
 by ironmsg01-blr.qualcomm.com with ESMTP; 29 Nov 2019 12:35:07 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id CBBCC2346; Fri, 29 Nov 2019 12:35:06 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v1] drm/msm: add support for 2.4.1 DSI version for sc7180 soc
Date: Fri, 29 Nov 2019 12:35:05 +0530
Message-Id: <1575011105-28172-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
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
Cc: Harigovindan P <harigovi@codeaurora.org>, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdlcyBpbiB2MToKCS1Nb2RpZnkgY29tbWl0IHRleHQgdG8gaW5kaWNhdGUgRFNJIHZlcnNp
b24gYW5kIFNPQyBkZXRhaWwoSmVmZnJleSBIdWdvKS4KCS1TcGxpdHRpbmcgdmlzaW9ub3ggcGFu
ZWwgZHJpdmVyIGNvZGUgb3V0IGludG8gYQoJIGRpZmZlcmVudCBwYXRjaChzZXQpLCBzaW5jZSBw
YW5lbCBkcml2ZXJzIGFyZSBtZXJnZWQgaW50bwoJIGRybS1uZXh0IHZpYSBhIGRpZmZlcmVudCB0
cmVlKFJvYiBDbGFyaykuCgpTaWduZWQtb2ZmLWJ5OiBIYXJpZ292aW5kYW4gUCA8aGFyaWdvdmlA
Y29kZWF1cm9yYS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jIHwg
MjEgKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2Zn
LmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2RzaS9kc2lfY2ZnLmMKaW5kZXggYjdiN2MxYS4uN2I5NjdkZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L2RzaV9jZmcuYwpAQCAtMTMzLDYgKzEzMywxMCBAQCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0
IGRzaV9zZG04NDVfYnVzX2Nsa19uYW1lc1tdID0gewogCSJpZmFjZSIsICJidXMiLAogfTsKIAor
c3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBkc2lfc2M3MTgwX2J1c19jbGtfbmFtZXNbXSA9IHsK
KwkiaWZhY2UiLCAiYnVzIiwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9jb25m
aWcgc2RtODQ1X2RzaV9jZmcgPSB7CiAJLmlvX29mZnNldCA9IERTSV82R19SRUdfU0hJRlQsCiAJ
LnJlZ19jZmcgPSB7CkBAIC0xNDcsNiArMTUxLDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNt
X2RzaV9jb25maWcgc2RtODQ1X2RzaV9jZmcgPSB7CiAJLm51bV9kc2kgPSAyLAogfTsKIAorc3Rh
dGljIGNvbnN0IHN0cnVjdCBtc21fZHNpX2NvbmZpZyBzYzcxODBfZHNpX2NmZyA9IHsKKwkuaW9f
b2Zmc2V0ID0gRFNJXzZHX1JFR19TSElGVCwKKwkucmVnX2NmZyA9IHsKKwkJLm51bSA9IDEsCisJ
CS5yZWdzID0geworCQkJeyJ2ZGRhIiwgMjE4MDAsIDQgfSwJLyogMS4yIFYgKi8KKwkJfSwKKwl9
LAorCS5idXNfY2xrX25hbWVzID0gZHNpX3NjNzE4MF9idXNfY2xrX25hbWVzLAorCS5udW1fYnVz
X2Nsa3MgPSBBUlJBWV9TSVpFKGRzaV9zYzcxODBfYnVzX2Nsa19uYW1lcyksCisJLmlvX3N0YXJ0
ID0geyAweGFlOTQwMDAgfSwKKwkubnVtX2RzaSA9IDEsCit9OworCiBjb25zdCBzdGF0aWMgc3Ry
dWN0IG1zbV9kc2lfaG9zdF9jZmdfb3BzIG1zbV9kc2lfdjJfaG9zdF9vcHMgPSB7CiAJLmxpbmtf
Y2xrX2VuYWJsZSA9IGRzaV9saW5rX2Nsa19lbmFibGVfdjIsCiAJLmxpbmtfY2xrX2Rpc2FibGUg
PSBkc2lfbGlua19jbGtfZGlzYWJsZV92MiwKQEAgLTIwMSw2ICsyMTksOSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG1zbV9kc2lfY2ZnX2hhbmRsZXIgZHNpX2NmZ19oYW5kbGVyc1tdID0gewogCQkm
bXNtODk5OF9kc2lfY2ZnLCAmbXNtX2RzaV82Z192Ml9ob3N0X29wc30sCiAJe01TTV9EU0lfVkVS
X01BSk9SXzZHLCBNU01fRFNJXzZHX1ZFUl9NSU5PUl9WMl8yXzEsCiAJCSZzZG04NDVfZHNpX2Nm
ZywgJm1zbV9kc2lfNmdfdjJfaG9zdF9vcHN9LAorCXtNU01fRFNJX1ZFUl9NQUpPUl82RywgTVNN
X0RTSV82R19WRVJfTUlOT1JfVjJfNF8xLAorCQkmc2M3MTgwX2RzaV9jZmcsICZtc21fZHNpXzZn
X3YyX2hvc3Rfb3BzfSwKKwogfTsKIAogY29uc3Qgc3RydWN0IG1zbV9kc2lfY2ZnX2hhbmRsZXIg
Km1zbV9kc2lfY2ZnX2dldCh1MzIgbWFqb3IsIHUzMiBtaW5vcikKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuaCBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2Rz
aV9jZmcuaAppbmRleCBlMmI3YTdkLi45OTE5NTM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2RzaS9kc2lfY2ZnLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2Nm
Zy5oCkBAIC0xOSw2ICsxOSw3IEBACiAjZGVmaW5lIE1TTV9EU0lfNkdfVkVSX01JTk9SX1YxXzRf
MQkweDEwMDQwMDAxCiAjZGVmaW5lIE1TTV9EU0lfNkdfVkVSX01JTk9SX1YyXzJfMAkweDIwMDAw
MDAwCiAjZGVmaW5lIE1TTV9EU0lfNkdfVkVSX01JTk9SX1YyXzJfMQkweDIwMDIwMDAxCisjZGVm
aW5lIE1TTV9EU0lfNkdfVkVSX01JTk9SX1YyXzRfMQkweDIwMDQwMDAxCiAKICNkZWZpbmUgTVNN
X0RTSV9WMl9WRVJfTUlOT1JfODA2NAkweDAKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
