Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FF2AB2F0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7D26E186;
	Fri,  6 Sep 2019 07:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267A46E121
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:17 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id x127so2068307pfb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ny7YX6BxIHZBg/a0IXvofczDmYcoW0RMjpIj9iNxGYI=;
 b=PvIYlTQONXvVry7Wfr8LXZ2iJVPT2AlUMx38bshPpaUKKnpbLydhMDVKkeOUp4ma3c
 58DyXfBxdYbuXIF1/J6lByUpS0SpDrsXs5qveR7D7SdsninGkyYHt3ko3A8qc7vTeOxJ
 1rPnkIGuSWGHIZykUOUQ++fDhPQfwh5F4VRoVCXzdjM3g75zvqNdWP9pf78DgSIkrxS7
 rJ4glA7in6ts4Lf2idsO7HA+74qRV320tL0cjII9dYm6SHqFAzTP38gwq0XhWvX7V3Qx
 +AAaraRS1rt/Bh0j+PRvTmvsWkXj+HsL0zNt6BSE4qD15CNBKCVW2ZId71nG79bRczkz
 k8dQ==
X-Gm-Message-State: APjAAAUB2SfVUjhPCjjDX23rkhXDaR+Pd0m5jHz+XsiL6D8CAIdqsvEx
 Sr9OKwZ/MUZ09q83sfYDfjOzDw==
X-Google-Smtp-Source: APXvYqwKA9IK1vUfcaYpjMN+OcoAuPYIhWjw5YDLjt28SgdQJQGNYVmg1+PKFIED4Sz9PCGNnWl8iw==
X-Received: by 2002:aa7:920b:: with SMTP id 11mr4734304pfo.231.1567700296683; 
 Thu, 05 Sep 2019 09:18:16 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:16 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 13/18] ASoC: tlv320dac31xx: mark expected switch
 fall-through
Date: Thu,  5 Sep 2019 10:17:54 -0600
Message-Id: <20190905161759.28036-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ny7YX6BxIHZBg/a0IXvofczDmYcoW0RMjpIj9iNxGYI=;
 b=YlFW1oYkgedY1H7kdvtntMbQozGn3kOxCMqp2NIumUNGka9YZY56mm/5JnjNo8a6sg
 BpG6Faq+3L6/s3liaVWlfJHdXuBMamArc6Tke+yxoc3WFo/JaJ3GGn7dtJ+2eGI/ZSPm
 WmOtxGPCrHlhUdg0lKZxrCxzFFciRcVyZ4C2H/w5nX6/ePlCd5vC7MVmOunp7NW+n+KY
 kwRBcBObjxbXwA0p2AO+21wka8/782dXgpI6hfmtYJ3uAgtu6VJVYXFKQIJ0U+B9Jx+a
 cnY4OkG7/6sBLkpOWgOpybs5Q6WX+6CfltrwCTUB6XO+nb6zY7AjGP6RiFK/d+51XXVM
 jSow==
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

RnJvbTogIkd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxnYXJzaWx2YUBlbWJlZGRlZG9yLmNvbT4KCmNv
bW1pdCAwOWZjMzhjMWFmNGNiODg4MjU1ZTllY2YyNjdiZjk3NTdjMTI4ODVkIHVwc3RyZWFtCgpJ
biBwcmVwYXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBtYXJrIHN3
aXRjaCBjYXNlcwp3aGVyZSB3ZSBhcmUgZXhwZWN0aW5nIHRvIGZhbGwgdGhyb3VnaC4KCkFkZHJl
c3Nlcy1Db3Zlcml0eS1JRDogMTE5NTIyMApTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNp
bHZhIDxnYXJzaWx2YUBlbWJlZGRlZG9yLmNvbT4KU2lnbmVkLW9mZi1ieTogTWFyayBCcm93biA8
YnJvb25pZUBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBNYXRoaWV1IFBvaXJpZXIgPG1hdGhp
ZXUucG9pcmllckBsaW5hcm8ub3JnPgotLS0KIHNvdW5kL3NvYy9jb2RlY3MvdGx2MzIwYWljMzF4
eC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy90bHYzMjBhaWMzMXh4LmMgYi9zb3VuZC9z
b2MvY29kZWNzL3RsdjMyMGFpYzMxeHguYwppbmRleCBkM2JkMGJmMTVkZGIuLmNjOTVjMTVjZWNl
YiAxMDA2NDQKLS0tIGEvc291bmQvc29jL2NvZGVjcy90bHYzMjBhaWMzMXh4LmMKKysrIGIvc291
bmQvc29jL2NvZGVjcy90bHYzMjBhaWMzMXh4LmMKQEAgLTk0MSw3ICs5NDEsNyBAQCBzdGF0aWMg
aW50IGFpYzMxeHhfc2V0X2RhaV9mbXQoc3RydWN0IHNuZF9zb2NfZGFpICpjb2RlY19kYWksCiAJ
Y2FzZSBTTkRfU09DX0RBSUZNVF9JMlM6CiAJCWJyZWFrOwogCWNhc2UgU05EX1NPQ19EQUlGTVRf
RFNQX0E6Ci0JCWRzcF9hX3ZhbCA9IDB4MTsKKwkJZHNwX2FfdmFsID0gMHgxOyAvKiBmYWxsIHRo
cm91Z2ggKi8KIAljYXNlIFNORF9TT0NfREFJRk1UX0RTUF9COgogCQkvKgogCQkgKiBOT1RFOiBU
aGlzIENPREVDIHNhbXBsZXMgb24gdGhlIGZhbGxpbmcgZWRnZSBvZiBCQ0xLIGluCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
