Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8768C4B2D8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167EC6E2F5;
	Wed, 19 Jun 2019 07:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233006E29A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:45 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 81so9009768pfy.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I9w3vbYRNonfWwiM3GpCHW7GL5rSQ3YHcxXb/k2AGzQ=;
 b=dzwGlhl6GCmqwuIUJ/MVFpXSg/dWEgieIFdT1jMHMNx8m8X2mP+X5q58bvgoONJrul
 UZlmew0QGld7KyIICc3k+4VZ+8H/Sl4XQN7U9zLu+k6OvWdiOQSVIrtzOaCpl5/BVV1C
 XZdbmRT7ox1V3SHUf266p1WrOUOJNI+lL0zye1Cav5o/skRCn4hv0dQUF7F0os9k491/
 bwd36ZMWPijyxwJEf9Pkcq0I/Mb+V+KWhqRCdRiJNRYcZhZ3LxUQVDtwNSYFJkWN8DXt
 sJMESuwTaD4qmt1H12iRWFzk4QF8x2PMTiX72YvgOx7EXLuV0nzEC8wqJs0qxDAOmfK6
 pm7w==
X-Gm-Message-State: APjAAAUQDk9Hm6N49bjsb3yMdhhAo4N6QZ22bqksIdygC/UJMDgTuReS
 Oi2wr3oa2I4K9ZPidXs1hbHrXTbCz7s=
X-Google-Smtp-Source: APXvYqz1q735f/rQV+0Af9T5y76kSlcoPs77OeglZPrfHTAGXQwp2lSRMMEYN8SJvQKfZfqtlR3dMw==
X-Received: by 2002:a65:508b:: with SMTP id r11mr5840715pgp.387.1560922064349; 
 Tue, 18 Jun 2019 22:27:44 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:43 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 08/15] drm/bridge: tc358767: Increase AUX transfer length
 limit
Date: Tue, 18 Jun 2019 22:27:09 -0700
Message-Id: <20190619052716.16831-9-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I9w3vbYRNonfWwiM3GpCHW7GL5rSQ3YHcxXb/k2AGzQ=;
 b=e4faZ1Tb0y/joGNp4jAM/quBbn7kTkp85v5l+MniGlO1En0q9WBorUk9hf9Y97tFTq
 ZdMzPNxuFK3om4VrzJxDvTTRzt46zi9q4ttSLLbDLAywQfbWqn/08QLkj+WEiZnHPsLP
 H+1/yNdsA6HkKlyeH/0OXX5mdjV1VczjnWwa1w93j6VyPefOz/T6Fddk9weT4/FpX1QW
 OUT5roGJtUqo4BCGHC2iW/wfu2UYMok5WSKCl1b7tal3r3rh0SaveusuL2QlB9sHUMj6
 odZayasDNNjgvisog0BcY6wvbTuycgXdCCkvyV6bfm4oAXbFFnuuyD2cAWUbL1uu+DQ6
 nVFw==
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
cmlkZ2UvdGMzNTg3NjcuYwppbmRleCBhNDQxZThlNjYyODcuLmJkYmY4ODA1Nzk0NiAxMDA2NDQK
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
