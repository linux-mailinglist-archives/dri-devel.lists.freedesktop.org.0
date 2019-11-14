Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B2FD79F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 09:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8146F6E137;
	Fri, 15 Nov 2019 08:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Thu, 14 Nov 2019 13:24:24 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8696E225
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 13:24:24 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47DMVb5X6Fz1rD98;
 Thu, 14 Nov 2019 14:18:15 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47DMVb4RB2z1qqkC;
 Thu, 14 Nov 2019 14:18:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id K7cJ5rnNwN6r; Thu, 14 Nov 2019 14:18:14 +0100 (CET)
X-Auth-Info: zgbQ9/AblcSW7JvQo2f0HLMRb+wSIAufYE37T+mnqFQ=
Received: from chi.lan (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 14 Nov 2019 14:18:14 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/imx: parallel-display: Adjust bus_flags and bus_format
 handling
Date: Thu, 14 Nov 2019 14:17:51 +0100
Message-Id: <20191114131751.26746-1-marex@denx.de>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 Nov 2019 08:05:26 +0000
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGJ1c19mbGFncyBhbmQgYnVzX2Zvcm1hdCBoYW5kbGluZyBsb2dpYyBkb2VzIG5vdCBzZWVt
IHRvIGNvdmVyCmFsbCBwb3RlbnRpYWwgdXNlY2FzZXMuIFNwZWNpZmljYWxseSwgdGhpcyBzZWVt
cyB0byBmYWlsIHdpdGggYW4KImVkdCxldG0wNzAwZzBlZGg2IiBkaXNwbGF5IGF0dGFjaGVkIHRv
IGFuIDI0Yml0IGRpc3BsYXkgaW50ZXJmYWNlLAp3aXRoIGludGVyZmFjZS1waXgtZm10ID0gInJn
YjI0IiBzZXQgaW4gRFQuCgpJbiB0aGlzIHNwZWNpZmljIHNldHVwLCB0aGUgcGFuZWwtc2ltcGxl
LmMgZHJpdmVyIGVudHJ5IGZvciB0aGUgZGlzcGxheQpzZXRzIC5idXNfZmxhZ3MgdG8gbm9uLXpl
cm8gdmFsdWUuIEhvd2V2ZXIsIGFzIGlteHBkLT5idXNfZm9ybWF0IGlzIHNldApmcm9tIHRoZSBE
VCBwcm9wZXJ0eSAiaW50ZXJmYWNlLXBpeC1mbXQiLCBpbXhfcGRfZW5jb2Rlcl9hdG9taWNfY2hl
Y2soKQp3aWxsIHNldCBpbXhfY3J0Y19zdGF0ZS0+YnVzX2ZsYWdzID0gaW14cGQtPmJ1c19mbGFn
cyBldmVuIHRob3VnaCB0aGUKaW14cGQtPmJ1c19mbGFncyBpcyB6ZXJvLCB3aGlsZSB0aGUgZGkt
PmJ1c19mbGFncyBpcyBjb3JyZWN0bHkgc2V0IGJ5CnRoZSBwYW5lbC1zaW1wbGUuYyBhbmQgbm9u
LXplcm8uIFRoZSByZXN1bHQgaXMgaW5jb3JyZWN0IGZsYWdzIGJlaW5nCnVzZWQgZm9yIHRoZSBk
aXNwbGF5IGNvbmZpZ3VyYXRpb24gYW5kIHRodXMgYW4gaW1hZ2UgY29ycnVwdGlvbi4KKFNwZWNp
ZmljYWxseSwgRFJNX0JVU19GTEFHX1BJWERBVEFfUE9TRURHRSBpcyBub3QgcHJvcGFnYXRlZCBh
bmQgdGh1cwp0aGUgaXB1djMgY2xvY2tzIHBpeGVscyBvbiB0aGUgd3JvbmcgZWRnZSkuCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBwcm9ibGVtIGJ5IG92ZXJyaWRpbmcgdGhlIGlteF9jcnRjX3N0YXRl
LT5idXNfZm9ybWF0CmZyb20gdGhlIGlteHBkLT5idXNfZm9ybWF0IG9ubHkgaWYgdGhlIERUIHBy
b3BlcnR5ICJpbnRlcmZhY2UtcGl4LWZtdCIgaXMKcHJlc2VudCBvciBpZiB0aGUgREkgcHJvdmlk
ZXMgbm8gZm9ybWF0cy4gU2ltaWxhcmx5IGZvciBidXNfZmxhZ3MsIHdoaWNoCmFyZSBzZXQgZnJv
bSBpbXhwZC0+YnVzX2ZsYWdzIG9ubHkgaWYgdGhlIERJIHByb3ZpZGVzIG5vIGZvcm1hdHMuCgpT
aWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
Q2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KQ2M6IE5YUCBMaW51eCBUZWFt
IDxsaW51eC1pbXhAbnhwLmNvbT4KQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+CkNjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+CkNjOiBTaGF3
biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2
ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYyB8IDEzICsrKysrKysrLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9k
cm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYwppbmRleCAzNTUxOGU1ZGUzNTYuLjkyZjAwYjEyYzA2
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKQEAgLTExMywxMyArMTEz
LDE2IEBAIHN0YXRpYyBpbnQgaW14X3BkX2VuY29kZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1f
ZW5jb2RlciAqZW5jb2RlciwKIAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfaW5mbyAqZGkgPSAmY29ubl9z
dGF0ZS0+Y29ubmVjdG9yLT5kaXNwbGF5X2luZm87CiAJc3RydWN0IGlteF9wYXJhbGxlbF9kaXNw
bGF5ICppbXhwZCA9IGVuY190b19pbXhwZChlbmNvZGVyKTsKIAotCWlmICghaW14cGQtPmJ1c19m
b3JtYXQgJiYgZGktPm51bV9idXNfZm9ybWF0cykgewotCQlpbXhfY3J0Y19zdGF0ZS0+YnVzX2Zs
YWdzID0gZGktPmJ1c19mbGFnczsKKwlpZiAoaW14cGQtPmJ1c19mb3JtYXQgfHwgIWRpLT5udW1f
YnVzX2Zvcm1hdHMpCisJCWlteF9jcnRjX3N0YXRlLT5idXNfZm9ybWF0ID0gaW14cGQtPmJ1c19m
b3JtYXQ7CisJZWxzZQogCQlpbXhfY3J0Y19zdGF0ZS0+YnVzX2Zvcm1hdCA9IGRpLT5idXNfZm9y
bWF0c1swXTsKLQl9IGVsc2UgeworCisJaWYgKGRpLT5udW1fYnVzX2Zvcm1hdHMpCisJCWlteF9j
cnRjX3N0YXRlLT5idXNfZmxhZ3MgPSBkaS0+YnVzX2ZsYWdzOworCWVsc2UKIAkJaW14X2NydGNf
c3RhdGUtPmJ1c19mbGFncyA9IGlteHBkLT5idXNfZmxhZ3M7Ci0JCWlteF9jcnRjX3N0YXRlLT5i
dXNfZm9ybWF0ID0gaW14cGQtPmJ1c19mb3JtYXQ7Ci0JfQorCiAJaW14X2NydGNfc3RhdGUtPmRp
X2hzeW5jX3BpbiA9IDI7CiAJaW14X2NydGNfc3RhdGUtPmRpX3ZzeW5jX3BpbiA9IDM7CiAKLS0g
CjIuMjQuMC5yYzEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
