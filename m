Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB13855F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F1789AEE;
	Fri,  7 Jun 2019 07:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1D1899DE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 04:46:39 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 83so476482pgg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 21:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NNIcg/6FzHv0SaLr8o+2YXmb6sNSUGijrDWegBfUk58=;
 b=RHlYkJObBjgxhlI8BKrjtYNb1l1HIESWRb0C+yojMviBOQ+XBHqDETYWzUFCKjvpzE
 1NaUC7wvgn16B4dW3AvUgkKR7f3XuydBfJntwVQs74TiWYp0mytrmQVm2Gm76LHoJKZ2
 uKZMpsF8B2Gq4g7i2ruObo06mDnJRyd7yawWYsBiXv5rZxYgnN+R+/8RJKJ+woE+alWO
 VOWlnE7CLTH4wjZ5lXAo4LqJ81cHVB4xWsSi9nMnzYJkLT7OSLSGNnt7WUsaSujW5h+A
 UmFSoT+KOtpeDstWz0KlBvNP9C2OhE3yBjfbVNDpO3gh5An4WfaDMb19XZMkApM+GaNi
 ur/Q==
X-Gm-Message-State: APjAAAUar2PUlGF0F6K7QUVB/TqNUJEVZPxDX6Pl2GFLx2lZzueg4f4v
 tgASMWbzOwLHXagekiEDaozYw8Ldo1E=
X-Google-Smtp-Source: APXvYqxhtmD8MwY1SN9meHAooF12SA/dpknHU/fATHAHPHjtZqm+E1Y1cCzspQ8puHBgKMzprCdtOw==
X-Received: by 2002:a17:90a:a397:: with SMTP id
 x23mr3542121pjp.118.1559882798281; 
 Thu, 06 Jun 2019 21:46:38 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id o13sm919516pfh.23.2019.06.06.21.46.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 21:46:37 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 08/15] drm/bridge: tc358767: Increase AUX transfer length
 limit
Date: Thu,  6 Jun 2019 21:45:43 -0700
Message-Id: <20190607044550.13361-9-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607044550.13361-1-andrew.smirnov@gmail.com>
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NNIcg/6FzHv0SaLr8o+2YXmb6sNSUGijrDWegBfUk58=;
 b=HoVJ+oYD8J4ULPS9O8lxZd8yvoPINb8pNDoitMPebyRoxetwy3X8gqUHTiCymIAA4x
 9FRpH6by3GCn4DvwoGa2vJ2dw1wxmwjj1PgmZkEILGuBiq5EKm+8RVetgs8ulQEqON/a
 1KNu4Zi3RLzCUhRuw6PbUvaRrlux/CKHaDsEpc3CYpTM+z7vpn4VcY+wotHFSrWQzcIB
 76nTrVbiWF31h288acQJXHUuKaNGEkHmG1P/xrQQvhTLUlK2KTsWacQMlvlBK4pZ8vjn
 o3rPtrbxfGy6n3Z2b1A/SBC6GLc/A+62Any+6k00II8vxT4ypfUa1x+8LK53rwmswWqE
 DXrQ==
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
