Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5E9BB5B1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9FE6E914;
	Mon, 23 Sep 2019 13:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3246E913
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:45:19 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q1so33584880ion.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 06:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=II3Z/ePw+kluHJAh79jkfAHhBKN0+PEn+7sKnI4/9O4=;
 b=LRABbZJo74OmEPchvD+M7+XDN+adsufCYmhC4CoXFx314DASZJ4s82dyUsUYX7WLbq
 NJJKvAcjFEa22zWRI4UnW9dbsJvp56MliRsx2jf8VW98/fPWEM7/RuW7gI/oU95v9NNE
 kH5106jnfRLXNckto1WZtz3GARVGM0zW8EVkuuMOA1bD1HARSf/0/dnU5KlOHfEvWqFg
 KyArxRbBZQJ/ior/pWOsEh+sYbon0Hr4F+8PkBzheTEOXeNK43BlbT2p0mktf85YHU22
 svBpnmqWKQ3UWlfPDfxhZrR5jgFcwonIxhP5gLvk8WRbmsEJCWETOithdq+qH49YmcTW
 Eu2w==
X-Gm-Message-State: APjAAAX3KwL98U+GpZ7zdrKbdrnwWfmopPV9jpB7Hk9gvyGG5J0OfINb
 jli2BYS4xMYnwm8cJnfxsQRoVFonQSA=
X-Google-Smtp-Source: APXvYqyL7wQoJ473oflZEdH5F1MQH5u5UVaHY3bRwruszPd0fFxVNFp6Y7enr88bqIkoM2DZxCPn8Q==
X-Received: by 2002:a6b:7509:: with SMTP id l9mr127293ioh.34.1569246317680;
 Mon, 23 Sep 2019 06:45:17 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
 by smtp.gmail.com with ESMTPSA id x2sm8844474iob.74.2019.09.23.06.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 06:45:15 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new DRM
 panel
Date: Mon, 23 Sep 2019 08:44:49 -0500
Message-Id: <20190923134449.22326-3-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923134449.22326-1-aford173@gmail.com>
References: <20190923134449.22326-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=II3Z/ePw+kluHJAh79jkfAHhBKN0+PEn+7sKnI4/9O4=;
 b=LRIxgemCeo1xWi9guI7emc3IqoiMCWFHvsGEbD3szsHx+S8v43Ax2NGNrtoREyn2Bz
 vhnkmPK37M8KzQsgFNpeQ+BcY5h/4VC72ASTQkmKZFETngnZgV1M86XBfzG60leuCeYs
 563KI6gOtg2Ce7d1NMNGrrAYJiU2WaB9WV23rE+x6LA9JhY1eytJKSG14aTC/KvjYA1n
 gjRa5pf0opTGYsQOJAhOHxgr15AJXj9sfeSKMd5XroMv52TCQgRkb0VoaDoZ7IBXq97v
 aw8aj0jbzaySkiFHq/CcsyQl8tAs8gEdCDPa3DgVSik6vPjiWbrz6fWg/2rzp9h/8uh8
 vXNQ==
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
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQpWMjogIFJlbW92ZSBsZWdhY3kgJ2xhYmVs
JyBmcm9tIGJpbmRpbmcKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9sb2dpY3BkLXRv
cnBlZG8tMzd4eC1kZXZraXQtMjguZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvbG9naWNwZC10b3Jw
ZWRvLTM3eHgtZGV2a2l0LTI4LmR0cwppbmRleCAwN2FjOTliOWNkYTYuLmNkYjg5YjNlMmE5YiAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2a2l0
LTI4LmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZr
aXQtMjguZHRzCkBAIC0xMSwyMiArMTEsNiBAQAogI2luY2x1ZGUgImxvZ2ljcGQtdG9ycGVkby0z
N3h4LWRldmtpdC5kdHMiCiAKICZsY2QwIHsKLQotCWxhYmVsID0gIjI4IjsKLQotCXBhbmVsLXRp
bWluZyB7Ci0JCWNsb2NrLWZyZXF1ZW5jeSA9IDw5MDAwMDAwPjsKLQkJaGFjdGl2ZSA9IDw0ODA+
OwotCQl2YWN0aXZlID0gPDI3Mj47Ci0JCWhmcm9udC1wb3JjaCA9IDwzPjsKLQkJaGJhY2stcG9y
Y2ggPSA8Mj47Ci0JCWhzeW5jLWxlbiA9IDw0Mj47Ci0JCXZiYWNrLXBvcmNoID0gPDM+OwotCQl2
ZnJvbnQtcG9yY2ggPSA8Mj47Ci0JCXZzeW5jLWxlbiA9IDwxMT47Ci0JCWhzeW5jLWFjdGl2ZSA9
IDwxPjsKLQkJdnN5bmMtYWN0aXZlID0gPDE+OwotCQlkZS1hY3RpdmUgPSA8MT47Ci0JCXBpeGVs
Y2xrLWFjdGl2ZSA9IDwwPjsKLQl9OworCS8qIFRvIG1ha2UgaXQgd29yaywgc2V0IENPTkZJR19P
TUFQMl9EU1NfTUlOX0ZDS19QRVJfUENLPTQgKi8KKwljb21wYXRpYmxlID0gImxvZ2ljcGQsdHlw
ZTI4IjsKIH07Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
