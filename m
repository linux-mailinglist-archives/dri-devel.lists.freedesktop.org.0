Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5901F1DF65F
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090676E3FE;
	Sat, 23 May 2020 09:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 905 seconds by postgrey-1.36 at gabe;
 Fri, 22 May 2020 18:52:36 UTC
Received: from m132.mail.163.com (m132.mail.163.com [220.181.13.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E2889C1C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 18:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=FmqP4
 q7hdPhzqG8iOHFzDsTiQkB24wKS1Me387wCn5A=; b=i8EJtlMainOlM5g+t2+46
 l/HVzcljR1qodTqzxtOTI+YwqM0lF9VbkfORKnJl1STgqHtIFf2Wh/46vSHk4f4u
 5WnvddgYcIIGwtbX6Qpw8cTKYM3jHavXfwO2+5B/naRAlvPwpcT0JBbMHMqAUcud
 giWWyNby5gVIoBUjQx/vBA=
Received: from 99091cxb$163.com ( [153.99.123.36] ) by ajax-webmail-wmsvr2
 (Coremail) ; Sat, 23 May 2020 02:37:01 +0800 (CST)
X-Originating-IP: [153.99.123.36]
Date: Sat, 23 May 2020 02:37:01 +0800 (CST)
From: cxb <99091cxb@163.com>
To: airlied <airlied@linux.ie>
Subject: 0001-drm-fix-setting-of-plane_mask-in-pan_display_atomic-
X-Priority: 1
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
X-CM-CTRLDATA: DTsf8mZvb3Rlcl9odG09MTExOjU2
Content-Type: multipart/mixed; 
 boundary="----=_Part_958_1119347566.1590172621007"
MIME-Version: 1.0
Message-ID: <6164339a.105.1723dac98d0.Coremail.99091cxb@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AsGowACHTbXNG8he3_pFAA--.7611W
X-CM-SenderInfo: yzzqmixf0eqiywtou0bp/1tbiWBAsqVuHsOmRTAAAsV
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------=_Part_958_1119347566.1590172621007
Content-Type: multipart/alternative; 
	boundary="----=_Part_960_30534350.1590172621007"

------=_Part_960_30534350.1590172621007
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

Cg==
------=_Part_960_30534350.1590172621007
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46MDsiPjxicj48L3A+PC9kaXY+PGJy
Pjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_960_30534350.1590172621007--

------=_Part_958_1119347566.1590172621007
Content-Type: application/octet-stream; 
	name=0001-drm-fix-setting-of-plane_mask-in-pan_display_atomic-.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-drm-fix-setting-of-plane_mask-in-pan_display_atomic-.patch"

RnJvbSA5M2RkMTVkYjVjZDVlNDBjNWI0ZWE1ODQ5Yzg1MDdjN2FmZjA4ZDYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAieHVlYmluZy5jaGVuIiA8OTkwOTFjeGJAMTYzLmNvbT4KRGF0
ZTogRnJpLCAyMiBNYXkgMjAyMCAxMzozODoxMSAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIGRybTog
Zml4IHNldHRpbmcgb2YgcGxhbmVfbWFzayBpbiBwYW5fZGlzcGxheV9hdG9taWMoKQogZnVuY3Rp
b24KClRoZSA8aW5jbHVkZS9kcm0vZHJtX2NydGMuaD4gcHJvdmlkZXMgZHJtX2Zvcl9lYWNoX3Bs
YW5lX21hc2sgbWFjcm8gYW5kCnBsYW5lX21hc2sgaXMgZGVmaW5lZCBhcyBiaXRtYXNrIG9mIHBs
YW5lIGluZGljZXMsIHN1Y2ggYXMKMTw8ZHJtX3BsYW5lX2luZGV4KHBsYW5lKS4gVGhpcyBwYXRj
aCBmaXhlcyBlcnJvciBzZXR0aW5nIG9mIHBsYW5lX21hc2sKaW4gcGFuX2Rpc3BsYXlfYXRvbWlj
KCkgZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiB4dWViaW5nLmNoZW4gPDk5MDkxY3hiQDE2My5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBl
ci5jCmluZGV4IGU0NDlmMjIuLjZhOWY3ZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZmJfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwpAQCAt
MTI1Niw3ICsxMjU2LDcgQEAgcmV0cnk6CiAJCQlnb3RvIGZhaWw7CiAKIAkJcGxhbmUgPSBtb2Rl
X3NldC0+Y3J0Yy0+cHJpbWFyeTsKLQkJcGxhbmVfbWFzayB8PSBkcm1fcGxhbmVfaW5kZXgocGxh
bmUpOworCQlwbGFuZV9tYXNrIHw9IDEgPDwgZHJtX3BsYW5lX2luZGV4KHBsYW5lKTsKIAkJcGxh
bmUtPm9sZF9mYiA9IHBsYW5lLT5mYjsKIAl9CiAKLS0gCjIuNy40Cgo=
------=_Part_958_1119347566.1590172621007
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

------=_Part_958_1119347566.1590172621007--

