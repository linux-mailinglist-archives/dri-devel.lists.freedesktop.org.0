Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD81AB2E6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8336E17D;
	Fri,  6 Sep 2019 07:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873CC6E044
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:23 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id x15so1675645pgg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KBEjaWO3Fe2PBzPolu3WMn8NTAUiCD8HB53ny3BQ6OI=;
 b=LGnhfjaHm5TbUJtj/CaOJKIpyCNTE+LliSxRmN8jajpV9P1Ir7V6SQ9AYbNYKB8cIM
 HAxa7wUuk99qs+KF94y8Vr6VJ+H2Pp78Py4ho7nlrx0AC5VK9Lh5EgWtXcT58FryrsNW
 ZV8z3Z1URPEtznDKR+2SpIda0mQhqzoP3QsBgqUj0FZrtl+skay7IOGBnlPsLthU0XQB
 +HUaVLbxHQ0PvPqdTiBtLV041c7rHw0Lj5+M2KoHpzCjPA4gsKCEk9TQ/yjHML6fb2Nd
 qmu96qxEch75qn8QI5KMo3SBIxg1ebY+GDgvqr7OdyAC/VePB7zsBa+8dYoABqdTvf5k
 BO3Q==
X-Gm-Message-State: APjAAAX61cnDnA9Zt+F+TOUXM5P9w1T/Rgf8ZMqI+sC0eE6/f9+XTTvO
 IoIShi0CW7U13nVD5h6yumPz/qrOhT8=
X-Google-Smtp-Source: APXvYqzidpJMrA4iY307wddu1S9Lti1cpjYGyLo/7tWJzFGVVSA/c4srK97ZZ5J4SE3dFJjAXsP6BQ==
X-Received: by 2002:a63:89c2:: with SMTP id v185mr3909722pgd.241.1567700303006; 
 Thu, 05 Sep 2019 09:18:23 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:22 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 18/18] cpufreq: ti-cpufreq: add missing of_node_put()
Date: Thu,  5 Sep 2019 10:17:59 -0600
Message-Id: <20190905161759.28036-19-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KBEjaWO3Fe2PBzPolu3WMn8NTAUiCD8HB53ny3BQ6OI=;
 b=plmQ8J8hM7P284lC2RlFaPT3UU/0f+9eU9WDxSbYt7bW8T1tbLLfVU8NYjquQ7LNE4
 KnLS0x5VNgK3M6FqfPB2sD3wKmxbXx14Gobu/OwtOpbYXU/IkghbfCOdM1Mm7JXUh+Re
 OGs1MQyDI9D6huwbn+67NCfvpkEUEztWZnuG+dI47z8mROznT1jdRnoaXcW7sxDawxXv
 Prljpk4ow91RFRvrdX2X7chbuX2fROHQ8DJAAJyHeGbf0V0cbS24NfqzYiaVo4TwwtW2
 kTkXUjGOt5qiIylni0ye87NDZ87V7CWg9z4DmQC6OdJUkaVDj8vy3LiXlIYHBzvmnKx/
 lkjw==
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

RnJvbTogWnVtZW5nIENoZW4gPHp1bWVuZy5jaGVuQGdtYWlsLmNvbT4KCmNvbW1pdCAyNDhhZWZk
Y2MzYTdlMGNmYmQwMTQ5NDZiNGRlYWQ2M2U3NTBlNzFiIHVwc3RyZWFtCgpjYWxsIG9mX25vZGVf
cHV0IHRvIHJlbGVhc2UgdGhlIHJlZmNvdW50IG9mIG5wLgoKU2lnbmVkLW9mZi1ieTogWnVtZW5n
IENoZW4gPHp1bWVuZy5jaGVuQGdtYWlsLmNvbT4KQWNrZWQtYnk6IFZpcmVzaCBLdW1hciA8dmly
ZXNoLmt1bWFyQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxy
YWZhZWwuai53eXNvY2tpQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWF0aGlldSBQb2lyaWVy
IDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2NwdWZyZXEvdGktY3B1
ZnJlcS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2NwdWZyZXEvdGktY3B1ZnJlcS5jIGIvZHJpdmVycy9jcHVmcmVxL3RpLWNwdWZy
ZXEuYwppbmRleCA0YmY0N2RlNjEwMWYuLmNhZGMzMjRiZWRiNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9jcHVmcmVxL3RpLWNwdWZyZXEuYworKysgYi9kcml2ZXJzL2NwdWZyZXEvdGktY3B1ZnJlcS5j
CkBAIC0yMDUsNiArMjA1LDcgQEAgc3RhdGljIGludCB0aV9jcHVmcmVxX2luaXQodm9pZCkKIAog
CW5wID0gb2ZfZmluZF9ub2RlX2J5X3BhdGgoIi8iKTsKIAltYXRjaCA9IG9mX21hdGNoX25vZGUo
dGlfY3B1ZnJlcV9vZl9tYXRjaCwgbnApOworCW9mX25vZGVfcHV0KG5wKTsKIAlpZiAoIW1hdGNo
KQogCQlyZXR1cm4gLUVOT0RFVjsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
