Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC83474ED
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA166891D7;
	Sun, 16 Jun 2019 14:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8314088DF5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 19:02:32 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id l19so2037212pgh.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fIRh2XHogKOPzGlSMAfw0Y3R1r0WmYblJh7xr9zVEVM=;
 b=LsdUZidvTCm+PS8saofYbd28Xalk2Tbkyxlv4WsgI+ohaAsZqFsgXufQt3uvtioLaa
 zE6UVsmc3a1EPxEnuZrMHuWE9M6GuMlRmUAtsaD4h7tVybyykgWz98hl66n7poSfjdFP
 sL9xm272yLbPDVW1gLyfguqs2zyr7YyWM9Ewakl+4BtVV5g/CdYTpeikEd2mGyfjB/p/
 0VOa+5hE15pdPvTH125FI5gRwZ+E/asPo4RdiHNcEPbpdkLHVIsmsR0NH7WYItL0O6p0
 VAuhSjnw/ICVDHgY44buVbj2eCx9TqZYAoslbc8t3VYh/L/FbzvkSbyLUDkPFU6LZ+uF
 Is2Q==
X-Gm-Message-State: APjAAAVb6ZFnoTi8IYGUx/xwzhzBGzMaxbq8uDn1CfMaMpSL/eNIuO8N
 TaME5uXNozeMhlKeLmAvdWY=
X-Google-Smtp-Source: APXvYqxqU2TQ1aZVb8lHhD8nMe+2Zh0ButW4PhfN5GiSP/wc0SrsCnxeNKFnBk5L6Fx2LidQ8OE7fQ==
X-Received: by 2002:a17:90a:c481:: with SMTP id
 j1mr12504510pjt.96.1560538952188; 
 Fri, 14 Jun 2019 12:02:32 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id s15sm4503208pfd.183.2019.06.14.12.02.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 12:02:31 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, thierry.reding@gmail.com, sam@ravnborg.org
Subject: [PATCH 1/2] dt-bindings: display: truly: Add MSM8998 MTP panel
Date: Fri, 14 Jun 2019 12:02:20 -0700
Message-Id: <20190614190220.34568-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614185547.34518-1-jeffrey.l.hugo@gmail.com>
References: <20190614185547.34518-1-jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fIRh2XHogKOPzGlSMAfw0Y3R1r0WmYblJh7xr9zVEVM=;
 b=Kwr5imp1sJTDpaaM8ydTfG4xZ3PQB4I2YwQP92gtlJPjp+0ir+jnIGIh/kISuAyuId
 P0lUpzcW3H2YCFEWjyzrc2tL9dwGF/sb6aT53hdGH2IFP1CrbWmc2HNJHWbXb7UBVRy+
 hnZSbIbzuOwZ5VDeCXeJO4UU+qjD8Jm11L/j1Oj+PvgapNlr/FJHOKwxaSLTFN0PXFbh
 FwnNYlRxm5Gqg7ZOCc4HG/+l6PGbDnbRMgjY39WD1H4b+Gqk3XBsR87Wmc+Y3wyYtcSi
 jlE+8oS7hWoZaOo6jdUZqfJlqeqc/0i/igvoI17t1D/abAuJR2DISsHfKG1ND7pkXeYU
 mjHA==
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
Cc: devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1TTTg5OTggTVRQIHVzZXMgdGhlIFRydWx5IGRpc3BsYXkgZHJpdmVyIGZvciBpdHMgcGFu
ZWwsIGJ1dCB0aGUKY29uZmlndXJhdGlvbiBkaWZmZXJzIHNsaWdodGx5IGZyb20gdGhlIGV4aXN0
aW5nIFNETTg0NS4gIEFkZCBhIGNvbXBhdGlibGUKdG8gYWNjb3VudCBmb3IgdGhlIGRpZmZlcmVu
Y2VzLgoKU2lnbmVkLW9mZi1ieTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5j
b20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS90cnVseSxudDM1NTk3LnR4
dCAgICAgICAgICB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS90cnVseSxudDM1NTk3LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3RydWx5LG50MzU1OTcudHh0CmluZGV4IGYzOWM3N2VlMzZlYS4u
ZmRhMzZjMWFkM2MzIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS90cnVseSxudDM1NTk3LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS90cnVseSxudDM1NTk3LnR4dApAQCAtMSwxMCArMSwxMSBAQAog
VHJ1bHkgbW9kZWwgTlQzNTU5NyBEU0kgZGlzcGxheSBkcml2ZXIKIAotVGhlIFRydWx5IE5UMzU1
OTcgaXMgYSBnZW5lcmljIGRpc3BsYXkgZHJpdmVyLCBjdXJyZW50bHkgb25seSBjb25maWd1cmVk
Ci1mb3IgdXNlIGluIHRoZSAySyBkaXNwbGF5IG9uIHRoZSBRdWFsY29tbSBTRE04NDUgTVRQIGJv
YXJkLgorVGhlIFRydWx5IE5UMzU1OTcgaXMgYSBnZW5lcmljIGRpc3BsYXkgZHJpdmVyIHVzZWQg
Zm9yIHRoZSBRdWFsY29tbSByZWZlcmVuY2UKK3BsYXRmb3Jtcy4KIAogUmVxdWlyZWQgcHJvcGVy
dGllczoKLS0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJ0cnVseSxudDM1NTk3LTJLLWRpc3BsYXki
CistIGNvbXBhdGlibGU6IHNob3VsZCBiZSAidHJ1bHksbnQzNTU5Ny0ySy1kaXNwbGF5IiAoU0RN
ODQ1KQorCSAgICAgICJ0cnVseSxudDM1NTk3LXdxaGQtY21kLWRzYy1kaXNwbGF5IiAoTVNNODk5
OCkKIC0gdmRkYS1zdXBwbHk6IHBoYW5kbGUgb2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVz
IHRoZSBzdXBwbHkgdm9sdGFnZQogICBQb3dlciBJQyBzdXBwbHkKIC0gdmRpc3BwLXN1cHBseTog
cGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgdGhlIHN1cHBseSB2b2x0YWdl
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
