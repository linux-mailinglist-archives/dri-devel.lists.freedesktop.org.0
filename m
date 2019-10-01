Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF61C4465
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 01:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564846E8C7;
	Tue,  1 Oct 2019 23:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3133B897B4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 23:39:46 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q1so52682913ion.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 16:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IviJQ2N622ovMvnAFQ5UMMPkhv4vjXzkXpkg1vsAmBc=;
 b=ihU+9bnZ8xox+w3doctF9I91LK5Ac4roWslu16rM0QctEOLUOswMEs1vnlrKOZUy2H
 jpKPLh2329gA7OhStHn98u6rgE6LReJJfYip+wzO1jQU0ZeTXgFMrPEbu9lE8/qtjglR
 r42Hn4r/lzILSxqJ+aLYUfIO27sXXXvAXT4JWPvx/hI9g+1GA1ObGgCGuAPXavE1FqhT
 t4OEj024hRRYUGMJ1O2FqmUEO63IR+TGesMNHp+3sB62tlMhcX4Tx0KOUuFO0VLhviE+
 bUkA+kIwIB5eN5lfmnoJYOK+23rK0u1pBCxxRSZ4m9O8VHFJSz8hHvk5gcBeY0BS6jUW
 qCbA==
X-Gm-Message-State: APjAAAXuVp0EdtpHkgeYD4rjeI8HZ2X51b/PnRkBQBVHfNXIzwwjR3RK
 1KF7OvW7du1GRsI8+tH1MAviI9CPk/Q=
X-Google-Smtp-Source: APXvYqwj5fYuoeZ35KUVEgXhV7iupye+0WvMu/YojybjzHirO2F5K8m7QcrHeuzMoeCJOqpoXkWrDw==
X-Received: by 2002:a02:698d:: with SMTP id e135mr1021533jac.128.1569973184814; 
 Tue, 01 Oct 2019 16:39:44 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 16:39:44 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new DRM
 panel
Date: Tue,  1 Oct 2019 18:39:20 -0500
Message-Id: <20191001233923.16514-3-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001233923.16514-1-aford173@gmail.com>
References: <20191001233923.16514-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IviJQ2N622ovMvnAFQ5UMMPkhv4vjXzkXpkg1vsAmBc=;
 b=s2y/BjDkHUKyKzAQzrjAl1VabgJ9k0XGxXiVy6NWUZZemcNMVPPt/spkxXU0oIKctW
 SYIPQ7qHvvvnBNHnmcxkZ2x+FDdNUqmwT3GrpkD/0F9+y4DsfjK8lBYowHyj8rWLxDkD
 4OrSusi/2U2CyqTxs6p8I0VrFbedvkUNAOnJ2NCBxufnMO6JE4T65mX0sc35waKtuLhG
 hE01QxJ+yH6QkqN4+fCdx4ojwIKqFwhvjdNL7NbOqE1z+RRmC4/q8gd+5P2j0417wpSi
 EhXEabn2qUIEvVSwgV5I8a0IB8CLqwnIpMoyh6dXV//zRUL/HUX4kGkgitcpnWZ4bKxn
 7Gxg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 adam.ford@logicpd.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgcmVtb3ZhbCBvZiB0aGUgcGFuZWwtZHBpIGZyb20gdGhlIG9tYXAgZHJpdmVycywg
dGhlCkxDRCBubyBsb25nZXIgd29ya3MuICBUaGlzIHBhdGNoIHBvaW50cyB0aGUgZGV2aWNlIHRy
ZWUgdG8KYSBuZXdseSBjcmVhdGVkIHBhbmVsIG5hbWVkICJsb2dpY3BkLHR5cGUyOCIKCkZpeGVz
OiA4YmY0YjE2MjExNzggKCJkcm0vb21hcDogUmVtb3ZlIHBhbmVsLWRwaSBkcml2ZXIiKQoKU2ln
bmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+CkFja2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQpWNDogIE5vIENoYW5nZQpWMzogIE5vIGNo
YW5nZQpWMjogIFJlbW92ZSBsZWdhY3kgJ2xhYmVsJyBmcm9tIGJpbmRpbmcKCmRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQtMjguZHRzIGIv
YXJjaC9hcm0vYm9vdC9kdHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2a2l0LTI4LmR0cwppbmRl
eCAwN2FjOTliOWNkYTYuLmNkYjg5YjNlMmE5YiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2a2l0LTI4LmR0cworKysgYi9hcmNoL2FybS9ib290
L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQtMjguZHRzCkBAIC0xMSwyMiArMTEsNiBA
QAogI2luY2x1ZGUgImxvZ2ljcGQtdG9ycGVkby0zN3h4LWRldmtpdC5kdHMiCiAKICZsY2QwIHsK
LQotCWxhYmVsID0gIjI4IjsKLQotCXBhbmVsLXRpbWluZyB7Ci0JCWNsb2NrLWZyZXF1ZW5jeSA9
IDw5MDAwMDAwPjsKLQkJaGFjdGl2ZSA9IDw0ODA+OwotCQl2YWN0aXZlID0gPDI3Mj47Ci0JCWhm
cm9udC1wb3JjaCA9IDwzPjsKLQkJaGJhY2stcG9yY2ggPSA8Mj47Ci0JCWhzeW5jLWxlbiA9IDw0
Mj47Ci0JCXZiYWNrLXBvcmNoID0gPDM+OwotCQl2ZnJvbnQtcG9yY2ggPSA8Mj47Ci0JCXZzeW5j
LWxlbiA9IDwxMT47Ci0JCWhzeW5jLWFjdGl2ZSA9IDwxPjsKLQkJdnN5bmMtYWN0aXZlID0gPDE+
OwotCQlkZS1hY3RpdmUgPSA8MT47Ci0JCXBpeGVsY2xrLWFjdGl2ZSA9IDwwPjsKLQl9OworCS8q
IFRvIG1ha2UgaXQgd29yaywgc2V0IENPTkZJR19PTUFQMl9EU1NfTUlOX0ZDS19QRVJfUENLPTQg
Ki8KKwljb21wYXRpYmxlID0gImxvZ2ljcGQsdHlwZTI4IjsKIH07Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
