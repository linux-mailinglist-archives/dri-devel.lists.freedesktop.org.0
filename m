Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760348E70E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9396A6E93E;
	Thu, 15 Aug 2019 08:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597636E500
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:07:36 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u25so11524780wmc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dBAKQK2TWb6YSZRcSfCJBhSpAFaSf3bVHWGaQNvZ07Y=;
 b=jJK9rkjlynF0wmwkYO+PDmAfkl8TfaORz72PHUQA96bHMBtDD8fmYp7JGVFw5p/BKW
 iCZFPqOkJ/+1t888g4rhwEIaBrs9xXGjOefnPoIeL5PAsilV1I3qvCrKE+lKcyhGJ2be
 vN+Nl+R9vpk6aZ6rD330CISjx2Povnj+n0ReFDHLzgnut/yhosB4Ieeqgl8ba89dQtgD
 tA6bkqqZqWDDo0uB2zF9lUb91hGUGG3gx1Yv2Jykl3ytJHhzZm4jVhkXkvhwc0suHR9D
 y/iRB0qSHHz90wxXZEG+45WX9SdZUPSzpd6ohCesVVwYYrGgQL9zZ2FLe6ZfopMbVjJG
 of8A==
X-Gm-Message-State: APjAAAV2QQNF7V0nwAMGlytZqE6bp/ISJuH+JmLvxLll7DDGU3Dffmbm
 +/T0E9pz7SvcIk7Vs9g/tawBmWQ+jFE=
X-Google-Smtp-Source: APXvYqzfW3eeOX4MX+i/CqoB9uhQnpRtsA/vpMtmJNdTO6GoCfgbeP6QdCyPmPxK8IqalPIZIB0rSg==
X-Received: by 2002:a1c:f409:: with SMTP id z9mr27445823wma.176.1565611654629; 
 Mon, 12 Aug 2019 05:07:34 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 5/8] drm/bridge: dw-hdmi-i2s: set the channel allocation
Date: Mon, 12 Aug 2019 14:07:23 +0200
Message-Id: <20190812120726.1528-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dBAKQK2TWb6YSZRcSfCJBhSpAFaSf3bVHWGaQNvZ07Y=;
 b=L/jjE0Z+uh9feCmkguYc7tOOBvXTJ2DTkbUR4kDzZ6isTnRr7TZDjGDEF6mDLN8STZ
 3GZGeVOI/dBYGZa6vyrOZB8Dj6VWwEAJR0uv1rxGJVEZvh9DW41NSo4aMra+MPz5b36A
 UFoTyytB4L/uzrZZdbjUV1mDHzMgHzpls39fSbcyuOrCahhcac5jv3fY+uyTA4nh4OXW
 qrzV7pQHNBFW3NqoZTG8Y1ns1WE5CEI7I5bgg+t2saPZdgk22y7ggPFf7dn3/HLwODVw
 PeX5EWRAKOrympN/IGlN4Qwt0NrARSKDvPGYJehhTQcksDpIWpcYJluUoUUbSfhndXbz
 dXlA==
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c2V0dXAgdGhlIGNoYW5uZWwgYWxsb2NhdGlvbiBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBoZG1p
LWNvZGVjIGRyaXZlcgoKUmV2aWV3ZWQtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5z
ZT4KU2lnbmVkLW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKaW5kZXggY2FmOGFlZDc4
ZmVhLi4wODY0ZGVlOGQxODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKQEAgLTg1LDYgKzg1LDcgQEAgc3RhdGljIGludCBk
d19oZG1pX2kyc19od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCiAJ
ZHdfaGRtaV9zZXRfc2FtcGxlX3JhdGUoaGRtaSwgaHBhcm1zLT5zYW1wbGVfcmF0ZSk7CiAJZHdf
aGRtaV9zZXRfY2hhbm5lbF9jb3VudChoZG1pLCBocGFybXMtPmNoYW5uZWxzKTsKKwlkd19oZG1p
X3NldF9jaGFubmVsX2FsbG9jYXRpb24oaGRtaSwgaHBhcm1zLT5jZWEuY2hhbm5lbF9hbGxvY2F0
aW9uKTsKIAogCWhkbWlfd3JpdGUoYXVkaW8sIGlucHV0Y2xrZnMsIEhETUlfQVVEX0lOUFVUQ0xL
RlMpOwogCWhkbWlfd3JpdGUoYXVkaW8sIGNvbmYwLCBIRE1JX0FVRF9DT05GMCk7Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
