Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8D1AB2D6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13F36E160;
	Fri,  6 Sep 2019 07:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3076E125
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:11 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id y22so2082668pfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NoTtLr1lztWfrS92BUWnGWn3zk0jvQAYseg1lZWuSGs=;
 b=l9JwavoWveipF3zA07PDCHI1aZIn8HCRQwX/eOHDbF332Vnk45aaxx+GDYzpIyxtoo
 z4tFcUO4cychlLDdAkmJIPHKwgtm7g0KmKzf/5BgLPHrtF19uOOvnz3IouXHxGpdfEI0
 SAFnyk/QeDMX16E1guR05k6RMymJzotOSVoabTNJyjb6QYFuEXvSdZdUyJ2Hrx9Tt0N9
 +CyQsLRzOHImrmpH/2duGo1Xee+jmGI3qIOSxB7Im69WvPNLnevP3xRXreKLFG7/mJQ2
 Imj3iqg8Udl3lQ1kB5FiLqEeUH0bIwNNR4yRM9zyAu5o+Ybxr7ePyc4VOpIqjNz7LZtP
 fSSA==
X-Gm-Message-State: APjAAAVvLXqihxpwRsCBqimoDNHmVNAjefZphQX237s/++Z38aaIkiMv
 SLcgbbMspW5Rm0yYQmtbbuQOtQ==
X-Google-Smtp-Source: APXvYqxTYivq/efmoU5WtwxZv5cSxczPS7YC9boEJTkxinNAbnn0GjS2kdu7p4Li6YOQRyRvVr3Cpw==
X-Received: by 2002:a63:60a:: with SMTP id 10mr3873993pgg.381.1567700290813;
 Thu, 05 Sep 2019 09:18:10 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:10 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 08/18] mtd: spi-nor: cadence-quadspi: add a delay in
 write sequence
Date: Thu,  5 Sep 2019 10:17:49 -0600
Message-Id: <20190905161759.28036-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NoTtLr1lztWfrS92BUWnGWn3zk0jvQAYseg1lZWuSGs=;
 b=GFbERyZ9NRV2dkkLT4vQsg2O43TovjaGYNn6dZQb4zlipk1hrBEI93ONy4uCdy17BN
 qs6turZaX0cjL2hsvD0XQcPWWyT5eGXz7QIlN5q8rtchZ5viCWRBDwkHQ7obcrcC3Uar
 1ortXnAwgQMvUwFZEFdfF67Zd3yS6nt3iV9SSsbRUiIhAZwUvGND/emO1CKYf2KWOr28
 VxlM82pRtImf20eiipHbpwiiWXaq0nZI2+bBsKhiaerAHkOFKlpVyiIpgMWISCo/STX0
 lWqLo+YlveCj4WJwPQ/Qdyw/LyipxCRHxudVAm/baaKD40BYKWBjg0PjlTT0keABvYme
 Sx5g==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlnbmVzaCBSIDx2aWduZXNockB0aS5jb20+Cgpjb21taXQgNjFkYzg0OTNiYWU5YmE4
MmExYzcyZWRiYzZjNjA2NWY2YTk0NDU2YSB1cHN0cmVhbQoKQXMgcGVyIDY2QUsyRzAyIFRSTVsx
XSBTUFJVSFk4RiBzZWN0aW9uIDExLjE1LjUuMyBJbmRpcmVjdCBBY2Nlc3MKQ29udHJvbGxlciBw
cm9ncmFtbWluZyBzZXF1ZW5jZSwgYSBkZWxheSBlcXVhbCB0byBjb3VwbGUgb2YgUVNQSSBtYXN0
ZXIKY2xvY2sofjVucykgaXMgcmVxdWlyZWQgYWZ0ZXIgc2V0dGluZyBDUVNQSV9SRUdfSU5ESVJF
Q1RXUl9TVEFSVCBiaXQgYW5kCndyaXRpbmcgZGF0YSB0byB0aGUgZmxhc2guIEludHJvZHVjZSBh
IHF1aXJrIGZsYWcgQ1FTUElfTkVFRFNfV1JfREVMQVkKdG8gaGFuZGxlIHRoaXMgYW5kIHNldCB0
aGlzIGZsYWcgZm9yIFRJIDY2QUsyRyBTb0MuCgpbMV1odHRwOi8vd3d3LnRpLmNvbS9saXQvdWcv
c3BydWh5OGYvc3BydWh5OGYucGRmCgpTaWduZWQtb2ZmLWJ5OiBWaWduZXNoIFIgPHZpZ25lc2hy
QHRpLmNvbT4KQWNrZWQtYnk6IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5jb20+ClNp
Z25lZC1vZmYtYnk6IEN5cmlsbGUgUGl0Y2hlbiA8Y3lyaWxsZS5waXRjaGVuQHdlZGV2NHUuZnI+
ClNpZ25lZC1vZmYtYnk6IE1hdGhpZXUgUG9pcmllciA8bWF0aGlldS5wb2lyaWVyQGxpbmFyby5v
cmc+Ci0tLQogZHJpdmVycy9tdGQvc3BpLW5vci9jYWRlbmNlLXF1YWRzcGkuYyB8IDI3ICsrKysr
KysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NhZGVuY2Ut
cXVhZHNwaS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jYWRlbmNlLXF1YWRzcGkuYwppbmRleCBm
MjJkZDM0ZjRmODMuLmZmNGVkZjRiYjIzYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9jYWRlbmNlLXF1YWRzcGkuYworKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NhZGVuY2UtcXVh
ZHNwaS5jCkBAIC0zOCw2ICszOCw5IEBACiAjZGVmaW5lIENRU1BJX05BTUUJCQkiY2FkZW5jZS1x
c3BpIgogI2RlZmluZSBDUVNQSV9NQVhfQ0hJUFNFTEVDVAkJMTYKIAorLyogUXVpcmtzICovCisj
ZGVmaW5lIENRU1BJX05FRURTX1dSX0RFTEFZCQlCSVQoMCkKKwogc3RydWN0IGNxc3BpX3N0Owog
CiBzdHJ1Y3QgY3FzcGlfZmxhc2hfcGRhdGEgewpAQCAtNzYsNiArNzksNyBAQCBzdHJ1Y3QgY3Fz
cGlfc3QgewogCXUzMgkJCWZpZm9fZGVwdGg7CiAJdTMyCQkJZmlmb193aWR0aDsKIAl1MzIJCQl0
cmlnZ2VyX2FkZHJlc3M7CisJdTMyCQkJd3JfZGVsYXk7CiAJc3RydWN0IGNxc3BpX2ZsYXNoX3Bk
YXRhIGZfcGRhdGFbQ1FTUElfTUFYX0NISVBTRUxFQ1RdOwogfTsKIApAQCAtNjIzLDYgKzYyNywx
NSBAQCBzdGF0aWMgaW50IGNxc3BpX2luZGlyZWN0X3dyaXRlX2V4ZWN1dGUoc3RydWN0IHNwaV9u
b3IgKm5vciwKIAlyZWluaXRfY29tcGxldGlvbigmY3FzcGktPnRyYW5zZmVyX2NvbXBsZXRlKTsK
IAl3cml0ZWwoQ1FTUElfUkVHX0lORElSRUNUV1JfU1RBUlRfTUFTSywKIAkgICAgICAgcmVnX2Jh
c2UgKyBDUVNQSV9SRUdfSU5ESVJFQ1RXUik7CisJLyoKKwkgKiBBcyBwZXIgNjZBSzJHMDIgVFJN
IFNQUlVIWThGIHNlY3Rpb24gMTEuMTUuNS4zIEluZGlyZWN0IEFjY2VzcworCSAqIENvbnRyb2xs
ZXIgcHJvZ3JhbW1pbmcgc2VxdWVuY2UsIGNvdXBsZSBvZiBjeWNsZXMgb2YKKwkgKiBRU1BJX1JF
Rl9DTEsgZGVsYXkgaXMgcmVxdWlyZWQgZm9yIHRoZSBhYm92ZSBiaXQgdG8KKwkgKiBiZSBpbnRl
cm5hbGx5IHN5bmNocm9uaXplZCBieSB0aGUgUVNQSSBtb2R1bGUuIFByb3ZpZGUgNQorCSAqIGN5
Y2xlcyBvZiBkZWxheS4KKwkgKi8KKwlpZiAoY3FzcGktPndyX2RlbGF5KQorCQluZGVsYXkoY3Fz
cGktPndyX2RlbGF5KTsKIAogCXdoaWxlIChyZW1haW5pbmcgPiAwKSB7CiAJCXNpemVfdCB3cml0
ZV93b3JkcywgbW9kX2J5dGVzOwpAQCAtMTE4NCw2ICsxMTk3LDcgQEAgc3RhdGljIGludCBjcXNw
aV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBjcXNwaV9zdCAq
Y3FzcGk7CiAJc3RydWN0IHJlc291cmNlICpyZXM7CiAJc3RydWN0IHJlc291cmNlICpyZXNfYWhi
OworCXVuc2lnbmVkIGxvbmcgZGF0YTsKIAlpbnQgcmV0OwogCWludCBpcnE7CiAKQEAgLTEyNDEs
NiArMTI1NSwxMCBAQCBzdGF0aWMgaW50IGNxc3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJfQogCiAJY3FzcGktPm1hc3Rlcl9yZWZfY2xrX2h6ID0gY2xrX2dldF9yYXRl
KGNxc3BpLT5jbGspOworCWRhdGEgID0gKHVuc2lnbmVkIGxvbmcpb2ZfZGV2aWNlX2dldF9tYXRj
aF9kYXRhKGRldik7CisJaWYgKGRhdGEgJiBDUVNQSV9ORUVEU19XUl9ERUxBWSkKKwkJY3FzcGkt
PndyX2RlbGF5ID0gNSAqIERJVl9ST1VORF9VUChOU0VDX1BFUl9TRUMsCisJCQkJCQkgICBjcXNw
aS0+bWFzdGVyX3JlZl9jbGtfaHopOwogCiAJcmV0ID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIGly
cSwgY3FzcGlfaXJxX2hhbmRsZXIsIDAsCiAJCQkgICAgICAgcGRldi0+bmFtZSwgY3FzcGkpOwpA
QCAtMTMxMiw3ICsxMzMwLDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBjcXNw
aV9fZGV2X3BtX29wcyA9IHsKICNlbmRpZgogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBjcXNwaV9kdF9pZHNbXSA9IHsKLQl7LmNvbXBhdGlibGUgPSAiY2Rucyxxc3BpLW5vciIs
fSwKKwl7CisJCS5jb21wYXRpYmxlID0gImNkbnMscXNwaS1ub3IiLAorCQkuZGF0YSA9ICh2b2lk
ICopMCwKKwl9LAorCXsKKwkJLmNvbXBhdGlibGUgPSAidGksazJnLXFzcGkiLAorCQkuZGF0YSA9
ICh2b2lkICopQ1FTUElfTkVFRFNfV1JfREVMQVksCisJfSwKIAl7IC8qIGVuZCBvZiB0YWJsZSAq
LyB9CiB9OwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
