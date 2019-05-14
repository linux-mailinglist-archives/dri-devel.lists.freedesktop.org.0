Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 367E91C40F
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8AB8926A;
	Tue, 14 May 2019 07:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD38892AC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 07:31:47 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w22so8155868pgi.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 00:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:to:cc:subject:mime-version
 :content-disposition:user-agent;
 bh=s/sQlqp99nJA/7VNGTPHqYbSkGF5LqoG/HcNRpQv3Nk=;
 b=KwHxNpAgPF72xQpodCxsW053pWkHbXCcxr0kyHzdRleHNFw5zvrktv1zkjkzS1u+Qp
 NF4I769fBxosHK8pX2/4HVDgI/FO3r0LyCbtY2/+vfYuwRoV/HrBH8tiIyiVV7q2YpJ6
 HN4xkhIfWAHGYNVJkcTTrmDql5mjTVaXlBgEX4KrbHULpiQ3qNQVJpQSh+pf+bE31NsK
 mJGZ/rHIvoHDdgz4/1m4Z+YvkmWyff5vxiYVhxBjgapdYyY5RBaSa0V2HD2mzoZhi79p
 35KlwAWUJVYqscNchzehr/LCDhq7ApwRqsRP02z53z749BMZN1oRbxSII/A70fdZrJlb
 HfIA==
X-Gm-Message-State: APjAAAWvkrdy/+DK2bo2/du3N8xs/4sNTNrd3O6OEq7JkrlCkBCaHHSv
 tSbrU0fW0N1sxSa+NyI35zwQq3ab
X-Google-Smtp-Source: APXvYqyBzzYvLZ+Pvf4kW5/ghr5RDfsFaIP4txDqRiWRkUKnEmS4jWZnLlSnc+i+ja/3theR44iHjg==
X-Received: by 2002:a63:555a:: with SMTP id f26mr36910942pgm.197.1557819107219; 
 Tue, 14 May 2019 00:31:47 -0700 (PDT)
Received: from sabyasachi ([2405:205:641d:f30a:5511:e7cb:49d8:c4c3])
 by smtp.gmail.com with ESMTPSA id z6sm4527479pfr.135.2019.05.14.00.31.45
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 14 May 2019 00:31:46 -0700 (PDT)
Message-ID: <5cda6ee2.1c69fb81.2949b.d3e7@mx.google.com>
X-Google-Original-Message-ID: <20190514073141.GA6446@sabyasachi.linux@gmail.com>
Date: Tue, 14 May 2019 13:01:41 +0530
From: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
To: architt@codeaurora.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, airlied@linux.ie
Subject: [PATCH] drm/bridge: Remove duplicate header
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 14 May 2019 07:40:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:date:from:to:cc:subject:mime-version:content-disposition
 :user-agent;
 bh=s/sQlqp99nJA/7VNGTPHqYbSkGF5LqoG/HcNRpQv3Nk=;
 b=f3/bLx0YYNpy6z0dOLKo6LV1cUhkhK9f9VbG9O2g/twcl+paKF47Ro0iLj3XEydSbY
 IRPeeEkj05Hs6KIZaEeDreBRMWvCD+cGPrPcm6B0CaILWzyvUlj+19RVF28MIZl/nDvF
 xSJE4/flkQCkDNOZzCERY123sqWTYLt6PP4dnvzlPc+bVF4fxvy0kqSw1nFD9UxgiKT5
 Vcy+ziDvYHtjQ2lvfQCeM/S3MdBv2qqS07OgrIIgtbIDWuKOtHQiSYFPC+pO4WUESobg
 5EGxVNHY0VPCg7olywfXOolqyZbfATL3qycYIK3/5uQur4BbSx5fyRHgx236fpEPcl9r
 jPew==
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
Cc: jrdr.linux@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIGRybS9kcm1fcGFuZWwuaCB3aGljaCBpcyBpbmNsdWRlZCBtb3JlIHRoYW4gb25jZQoK
U2lnbmVkLW9mZi1ieTogU2FieWFzYWNoaSBHdXB0YSA8c2FieWFzYWNoaS5saW51eEBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jIHwgMSAtCiAxIGZpbGUgY2hh
bmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
cGFuZWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwppbmRleCA3Y2JhYmEyLi40
MDJiMzE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jCkBAIC0xNSw3ICsxNSw2IEBACiAjaW5jbHVk
ZSA8ZHJtL2RybV9jcnRjX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZW5jb2Rlci5oPgog
I2luY2x1ZGUgPGRybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oPgotI2luY2x1ZGUgPGRy
bS9kcm1fcGFuZWwuaD4KIAogc3RydWN0IHBhbmVsX2JyaWRnZSB7CiAJc3RydWN0IGRybV9icmlk
Z2UgYnJpZGdlOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
