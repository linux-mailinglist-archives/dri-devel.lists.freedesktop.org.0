Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA13D52497
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF91B89FE8;
	Tue, 25 Jun 2019 07:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4361289C28
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:47:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r16so14194621wrl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=dIRgQ3ynOpjhyuIVnVuPJTcE55pI12BhgO4qsYJmHWg=;
 b=NBXVcP8x0iCqLYJ+yJCkS44I0RswA32SlbAf+5c0QOWt1wt52A1Tb3mFVm1Dd87IbD
 eYCMceT1BiR/crIlXWG3waZoOQpBOIZ8LRt5Vtmvp158I8zq4hBcajjVTasH0Bc5Ngpg
 z073iTWASxi5wFwf2EI9x1EdG7WCFUDDIsdO4rnkLUW0wTFhthofj2mQZF7Cyhyql7VV
 ZN9RXa9iEWVd2Y7O6U9lM5/zrctGaPaA0kLzsg6xpk5Qcx9RHq0LN0m85yAGkpr+I5Os
 3129ZrXj66iEimKzTQMrGHYRPNAvxOc5Mg6I9fpZghpmCH+zHLzQ1PDRS4zKz5G293z4
 RlAQ==
X-Gm-Message-State: APjAAAUV3sY6uDRk/Efmk1uFzH80j0ebd12nqzTxTDFvq3ySJKdNO4s8
 irfd8HDpH8x16iWhRGZDCdvz+Q==
X-Google-Smtp-Source: APXvYqzAhY+ZzLqrg8P9+Gjky58V/7Mins9CYwy8HmsCLCi6hwSDb1K4orr31YS8ZR7Cuubi4to67Q==
X-Received: by 2002:a5d:4642:: with SMTP id j2mr11688565wrs.211.1561387676728; 
 Mon, 24 Jun 2019 07:47:56 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u6sm13228366wml.9.2019.06.24.07.47.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 07:47:55 -0700 (PDT)
From: Julien Masson <jmasson@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/9] drm: meson: global clean-up (use proper macros,
 update comments ...)
Date: Mon, 24 Jun 2019 16:20:42 +0200
Message-ID: <86zhm782g5.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=dIRgQ3ynOpjhyuIVnVuPJTcE55pI12BhgO4qsYJmHWg=;
 b=1t2stW6KFcusBgmgb+vjxCC6D/mAJkeo4PWwfQTJtiO7t+wgz+REk1m6xRvG5PdvpB
 N5Cfj0WIDM23ujK4DsoZ5o1ow097YCS3oiJGmCJJLc5kPXI9NQjDO+jaevjCq4y3MDyi
 RwKqbnu2Na54f0LI1M23VY8Iq8pGBws7IXzE5sNIaK7HzGq0HBb8ZEcyorT4YW2sK18x
 cQHHT0avopamkHoV1U0VKmXeQpKbSOAQpadRqHyELQS+oT5AGEeyL05nMQWknKwiEzY7
 kaNz21h3qkJfc4TfwevGKTNdhk0RfDvec7zs18vmX6VVcVS/qiaLjeq43dtTUSp9cngj
 BBqw==
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
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMgdG8gY2xlYW4tdXAgZGlmZmVyZW50cyBwYXJ0cyBvZiB0
aGUgZHJtIG1lc29uCmNvZGUgc291cmNlLgoKQ291cGxlIG1hY3JvcyBoYXZlIGJlZW4gZGVmaW5l
ZCBhbmQgdXNlZCB0byBzZXQgc2V2ZXJhbCByZWdpc3RlcnMKaW5zdGVhZCBvZiB1c2luZyBtYWdp
YyBjb25zdGFudHMuCgpJIGFsc28gdG9vayB0aGUgb3Bwb3J0dW5pdHkgdG86Ci0gYWRkL3JlbW92
ZS91cGRhdGUgY29tbWVudHMKLSByZW1vdmUgdXNlbGVzcyBjb2RlCi0gbWlub3IgZml4L2ltcHJv
dm1lbnQKCkp1bGllbiBNYXNzb24gKDkpOgogIGRybTogbWVzb246IG1hc2sgdmFsdWUgd2hlbiB3
cml0aW5nIGJpdHMgcmVsYXhlZAogIGRybTogbWVzb246IGNydGM6IHVzZSBwcm9wZXIgbWFjcm9z
IGluc3RlYWQgb2YgbWFnaWMgY29uc3RhbnRzCiAgZHJtOiBtZXNvbjogZHJ2OiB1c2UgbWFjcm8g
d2hlbiBpbml0aWFsaXppbmcgdnB1CiAgZHJtOiBtZXNvbjogdnBwOiB1c2UgcHJvcGVyIG1hY3Jv
cyBpbnN0ZWFkIG9mIG1hZ2ljIGNvbnN0YW50cwogIGRybTogbWVzb246IHZpdTogdXNlIHByb3Bl
ciBtYWNyb3MgaW5zdGVhZCBvZiBtYWdpYyBjb25zdGFudHMKICBkcm06IG1lc29uOiB2ZW5jOiB1
c2UgcHJvcGVyIG1hY3JvcyBpbnN0ZWFkIG9mIG1hZ2ljIGNvbnN0YW50cwogIGRybTogbWVzb246
IGdsb2JhbCBjbGVhbi11cAogIGRybTogbWVzb246IGFkZCBtYWNybyB1c2VkIHRvIGVuYWJsZSBI
RE1JIFBMTAogIGRybTogbWVzb246IHZlbmM6IHNldCB0aGUgY29ycmVjdCBtYWNyb3Zpc2lvbiBt
YXggYW1wbGl0dWRlIHZhbHVlCgogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2NydGMuYyAg
ICAgIHwgIDE3ICsrLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jICAgICAgIHwg
IDI2ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgICB8ICAgMiAr
CiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5oICAgfCAgMTIgKy0KIGRyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9wbGFuZS5jICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5oIHwgMTM2ICsrKysrKysrKysrKysrKystLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgICAgICB8ICAgNyArLQogZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX3ZlbmMuYyAgICAgIHwgMTY5ICsrKysrKysrKysrKysrKysrKy0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmNfY3Zicy5jIHwgICAzICstCiBk
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdml1LmMgICAgICAgfCAgODIgKysrKysrLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdnBwLmMgICAgICAgfCAgMjcgKystLQogMTEg
ZmlsZXMgY2hhbmdlZCwgMzYyIGluc2VydGlvbnMoKyksIDEyMSBkZWxldGlvbnMoLSkKCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
