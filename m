Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D761B15
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE01289B4D;
	Mon,  8 Jul 2019 07:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6656E2E1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:54:55 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id i8so4529472pgm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=L0b++Cz1DwGWHz8E2aHIDiGlzeh1G15jnzGEGv6N1Ps=;
 b=W6MgwLWx8/M9OubRRQa6HEAmjGUUttAq5Ftn9PuBTHtLNQZ6WfqLgpLZrMzXNZ+vnD
 ulw44CJE6BX7C+qI0rGhkvFs5+illD5pvE3n3tOjDJ8yoCKc0cFo3vIOjboIDSh+Gki5
 ZRL741V55KwplL7gETXe8/sjlCkYQH68WxGGgtmgbyttrExXl77AwzaVeN6cUQRx/Uww
 e3LveDTX7fnozv5IFTzfPpnDwFyKV4lLvNeun1Y0lf+HwR+MWjJJIX8Yv8Bbtbfzj4EC
 D1mqpN3VXwo440JwumGK0ldQzejVh5j7jhHwU4nzkHb3NwSsDVCHAtmFOUXhcQMevevV
 JnPQ==
X-Gm-Message-State: APjAAAUywm81eVnbuT6u/4+SKtJTjVuSS6enf5hpvB7p3gGSCQZ3kI8Z
 El3tLRB7mmyHDf7p2ULu3A0=
X-Google-Smtp-Source: APXvYqyyW8jKS41MUK89FU5reGeNsJZYJND8bEG5SSJ2bU/tlPCV9U3sQ4VgzxjWQuHQfXZRtNcTsw==
X-Received: by 2002:a63:5610:: with SMTP id k16mr6565617pgb.335.1562345695389; 
 Fri, 05 Jul 2019 09:54:55 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id b126sm11066744pfa.126.2019.07.05.09.54.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 09:54:54 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: 
Subject: [PATCH 0/2] Add Sharp panel option for Lenovo Miix 630
Date: Fri,  5 Jul 2019 09:54:50 -0700
Message-Id: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=L0b++Cz1DwGWHz8E2aHIDiGlzeh1G15jnzGEGv6N1Ps=;
 b=r8evzbtHvy2h/zqYmnDCCyQvt4RnwSQxMKEapzC+A3hoFUeqAbWZt4hsZqtLoeBxQl
 EVwT7iSyFNtnkWNqWnmn+GvUTetKo8BkVXiYAtEtUUyj5MaPS6F9FCQcpGgyjbXSUaCp
 ILN+BsrEu8QfBHKNV2AsgY8i/SJeqGJk5YTF6n9QPiw/fjmU/QZiRtsvJwLkLrDW1Bxx
 Bmg+AR4rjNJnGNIc6muTjci9aUduBqGvVMJ8CDAJHiv2EwAloA+KdaSEud7MGnoBUIV5
 UsfyezlvYuj+lvLVIeU012tTXnFG83JOTlskReNgxz3nPGImHj7Wo5tFv6ovRfprmvZO
 +jsw==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIExlbm92byBNaWl4IDYzMCBsYXB0b3AgY2FuIGJlIGZvdW5kIHdpdGggb25lIG9mIHR3byBw
YW5lbHMgLSBhIEJPRQpvciBTaGFycCBvcHRpb24uICBUaGlzIGxpa2VseSBwcm92aWRlcyBvcHRp
b25zIGR1cmluZyBtYW51ZmFjdHVyaW5nLgoKVGhlc2UgcGFuZWxzIGNvbm5lY3QgdmlhIGVEUCwg
aG93ZXZlciB0aGV5IHNpdCBiZWhpbmQgYSBEU0kgdG8gZURQCmJyaWRnZSBvbiB0aGUgbGFwdG9w
LCBzbyB0aGV5IGNhbiBlYXNpbHkgYmUgaGFuZGxlZCBieSB0aGUgZXhpc3RpbmcKc2ltcGxlIHBh
bmVsIGNvZGUuCgpUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBTaGFycCBvcHRpb24u
CgpKZWZmcmV5IEh1Z28gKDIpOgogIGR0LWJpbmRpbmdzOiBwYW5lbDogQWRkIFNoYXJwIExELUQ1
MTE2WjAxQgogIGRybS9wYW5lbDogc2ltcGxlOiBBZGQgc3VwcG9ydCBmb3IgU2hhcnAgTEQtRDUx
MTZaMDFCIHBhbmVsCgogLi4uL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbGQtZDUxMTZ6MDFiLnR4dCAg
ICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXNpbXBsZS5jICAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDUzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxsZC1kNTExNnowMWIudHh0Cgot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
