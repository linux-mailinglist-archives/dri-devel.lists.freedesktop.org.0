Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E943350
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD75892AE;
	Thu, 13 Jun 2019 07:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D022C8945B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:33:18 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id a93so6340221pla.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NNIcg/6FzHv0SaLr8o+2YXmb6sNSUGijrDWegBfUk58=;
 b=MI1Vy8jI5IRZ743Hz6m+HY5imw6moIVHZcqHPVOtJPPZmObD2tP8+DcMEnjKwPqGFN
 IfUtZ4loON25an2MfWh2jjvTLkRyNw/XNIERXe09iOz8IZ2+20Bz45Ox7bIHWDG8eHQH
 viSel6g3A4WEGXpb+/wPqh7IymYxRSe8CFNIiYjec9UVZoDhSRiHbXSNSCyd43oNCKdt
 QiVc5/BfntOA3SId3H6qpOQGLkoJgZSsFoelzLE7izcviPfQ0pCw8D8e+xJ59slDp06P
 jAQ+d9Eqcu8zsStHeJYr4Krgm/vjkZ/JU3L7S0wfRtTZrCOb9kuiPY0y7MpcWx/rFT8n
 WIXw==
X-Gm-Message-State: APjAAAW2+uO7Vk8JVqCDZov5MgGzbG2WxSJhyk/zImtk8XdXftxefUhp
 /jlUYK6/TLLe/MXAHbG0BPpikaJqs9w=
X-Google-Smtp-Source: APXvYqwx+IeAH5nURjmn+nAtr3THKqSpmGJOJTcW7P1j0EIpbWFp1Xgjqw3+CYbo4iwQey8e9QkC5g==
X-Received: by 2002:a17:902:20e9:: with SMTP id
 v38mr39306822plg.62.1560328398066; 
 Wed, 12 Jun 2019 01:33:18 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d21sm18845991pfr.162.2019.06.12.01.33.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 01:33:16 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 08/15] drm/bridge: tc358767: Increase AUX transfer length
 limit
Date: Wed, 12 Jun 2019 01:32:45 -0700
Message-Id: <20190612083252.15321-9-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NNIcg/6FzHv0SaLr8o+2YXmb6sNSUGijrDWegBfUk58=;
 b=mOvvwzHPXtbeJQJgKDqkLn87pkjQYbEZSLBgDdPr55YYhw+JQsnz0osXnx9SgcHM5D
 gSzYvEVPSL8B+n/X+xXWESg15Z+8sGqkJxi79mI3UsMehPqzERZvOp/WNs6E/j9Xlsyq
 Rp/vsYZ4C62qzKb5k6grCJPVN9VToVF+hpYC28tEPuMZQ3m0ZXeWmXqxT5OIOTY8RcTM
 zzhd6hX9TnBrH1POf6+nxLfSXP2oRx7wcA3cPU0QhtPQ5TB4iflsgGyDcj0C/nMEHKhA
 FqCw4FjJwh91q/jqWkWUE2bA50rFcvRtZ5cn58PHtFeo+2L3qqSaWS4m77U6XRxTIkQ0
 pBVg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgdGMzNTg3NjcgY2FuIHRyYW5zZmVyIHVwIHRvIDE2
IGJ5dGVzIHZpYQppdHMgQVVYIGNoYW5uZWwsIHNvIHRoZSBhcnRpZmljaWFsIGxpbWl0IG9mIDgg
YXBwZWFycyB0byBiZSB0b28KbG93LiBIb3dldmVyIG9ubHkgdXAgdG8gMTUtYnl0ZXMgc2VlbSB0
byBiZSBhY3R1YWxseSBzdXBwb3J0ZWQgYW5kCnRyeWluZyB0byB1c2UgMTYtYnl0ZSB0cmFuc2Zl
cnMgcmVzdWx0cyBpbiB0cmFuc2ZlcnMgZmFpbGluZwpzcG9yYWRpY2FsbHkgKHdpdGggYm9ndXMg
c3RhdHVzIGluIGNhc2Ugb2YgSTJDIHRyYW5zZmVycyksIHNvIGxpbWl0IGl0CnRvIDE1LgoKU2ln
bmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KUmV2
aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBBbmRyemVq
IEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFs
a2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRl
bWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpD
YzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5IDxjcGhl
YWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYwppbmRleCBlNjA2OTJiOGNkNjkuLjhiNTNkYzg5MDhkMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMzU0LDcgKzM1NCw3IEBAIHN0YXRpYyBzc2l6ZV90
IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogCQkJICAgICAgIHN0cnVj
dCBkcm1fZHBfYXV4X21zZyAqbXNnKQogewogCXN0cnVjdCB0Y19kYXRhICp0YyA9IGF1eF90b190
YyhhdXgpOwotCXNpemVfdCBzaXplID0gbWluX3Qoc2l6ZV90LCA4LCBtc2ctPnNpemUpOworCXNp
emVfdCBzaXplID0gbWluX3Qoc2l6ZV90LCBEUF9BVVhfTUFYX1BBWUxPQURfQllURVMgLSAxLCBt
c2ctPnNpemUpOwogCXU4IHJlcXVlc3QgPSBtc2ctPnJlcXVlc3QgJiB+RFBfQVVYX0kyQ19NT1Q7
CiAJaW50IHJldDsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
