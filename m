Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1236E2B405
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E0789B22;
	Mon, 27 May 2019 12:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7832F89CE3;
 Sun, 26 May 2019 10:59:42 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id g21so5932120plq.0;
 Sun, 26 May 2019 03:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=2pMI0TxvbszUYLNen9JiMBX7dkFbg/aa3u3WzyR2uKI=;
 b=KS+r/8pJn2Ja3pOL2XCDCNs9HT+NcHtG1GiQB55zYK97qxLjnQyjQHO5WjsJrIJTlB
 78te3hVxsm7eEzD8iEuDqGl2sugWZ6muf0bAip2L8lIijDp1rKna1rWzpQpqL6BZveXv
 gh6f4nOAzEgzUtI88wrTpyz6XXWBwmR1ozHwYRfYJASpFkek5yoUVjE5XG7mofaX0Cl4
 PQmGViFDM/X7OK4lcfWeJPxXJCEEaRLx4Ln4bIO1bLpC/ljk/CRzGnA8BW+vVUeJW9L+
 LoquN237p6Cv5LslQcl84U3TQuRNqT/Hj1FFTTY7vUtxskeK1/Ho7qZDJP27VTWnT294
 0aHQ==
X-Gm-Message-State: APjAAAWZ4sJs1cXLubrI9BsGX4k/2fBlGwjkGrS4+jPCBn3MSwAzLxGb
 /uaNEnLBEK7IXse+6jlNeyY=
X-Google-Smtp-Source: APXvYqzZ/Ql4lxowsEEZVCxTIcuNT0XsMDFt0ghrVHkXu7ZIypKWI/BiwkKkceYcHwozVWeOxD7pNw==
X-Received: by 2002:a17:902:e40a:: with SMTP id
 ci10mr73060394plb.195.1558868382078; 
 Sun, 26 May 2019 03:59:42 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
 by smtp.gmail.com with ESMTPSA id d85sm9011325pfd.94.2019.05.26.03.59.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 03:59:41 -0700 (PDT)
Date: Sun, 26 May 2019 16:29:36 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/dispnv04: subdev/bios.h is included more than once
Message-ID: <20190526105935.GA2983@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=2pMI0TxvbszUYLNen9JiMBX7dkFbg/aa3u3WzyR2uKI=;
 b=rO2OJ6bUDdn6tVbaU9JLevvxpMRho/K0ImE8V7MP/hoeb0j8tancISakTvTwhJxSUi
 HqQ1L9zqv5raxhOOpIvvhFuUquFEVkT0zu929Byuil3v4RTy3I6v5p6h8jN7QvlKYBYr
 CZCo63eDlK0eF1Omb3y1Sq5JuCayY8yW7nuzh8FlvOzQwln621/3DWUX+LW0qvIJys6r
 U8Ty97aCxHfYqc2NNqVs0L2CkV6xJyJBjkBtbopzyuLo2UKVKwpUpui/c5DEWFlWpTNT
 dWaHAeK2KFxnHFQ3MUSkBqpbEAlwqtOAzcQIcBLJv6qRgpkxlIyqL4P+YiVwqI64NyZU
 UKbg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cmVtb3ZlIGR1cGxpY2F0ZSBpbmNsdXNpb24gb2Ygc3ViZGV2L2Jpb3MuaAoKSXNzdWUgaWRlbnRp
ZmllZCBieSBpbmNsdWRlY2hlY2sKClNpZ25lZC1vZmYtYnk6IEhhcmlwcmFzYWQgS2VsYW0gPGhh
cmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjA0L2Rpc3AuaCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9kaXNwLmggYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9kaXNwLmgKaW5kZXggYzZlZDIwYS4uMTk1ZDg5OSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvZGlzcC5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2Rpc3AuaApAQCAtMTYxLDcgKzE2MSw2
IEBAIG52X21hdGNoX2RldmljZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBkZXZp
Y2UsCiAJCWRldi0+cGRldi0+c3Vic3lzdGVtX2RldmljZSA9PSBzdWJfZGV2aWNlOwogfQogCi0j
aW5jbHVkZSA8c3ViZGV2L2Jpb3MuaD4KICNpbmNsdWRlIDxzdWJkZXYvYmlvcy9pbml0Lmg+CiAK
IHN0YXRpYyBpbmxpbmUgdm9pZAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
