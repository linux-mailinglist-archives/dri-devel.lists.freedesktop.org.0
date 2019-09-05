Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC5EAB2D1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DD66E162;
	Fri,  6 Sep 2019 07:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C395E6E12B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:19 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id i18so1664925pgl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=k4RSHQziswwPF3IEl7odNlbX/Lq1Hx75YDWK/+CVFu0=;
 b=aKkQFSsvOyRKWPOW9/OS+tEOD7P3HcV9kMZOvXr6ItV7IqIb1nEYPUqYBykuN14Y4N
 JnSv5TS+au+fAKunHVj4lwkdrr5p1TSrAYPh+r7MTIe5laxLJVQT44l8qOghLDE8SO0c
 icPPUpRxWg/ktNSVQqQfzTEaL7TCW2/Qw7pAzfSyuO9cfqs3ZVN1augpgpvSdN5F2dim
 qe/DuB0mJqMBs/2AX1Hkx5uQn7kjJSu4p5xMSTVgS4Pb9tvUkbqNZ10vS8CM+/K/s9R6
 m/olT+eYmAeTioNXr9RhEdDLfV+6x09AT6mR59YZDre/sNbB2LpTDeSCDl4Ziyc0KEkO
 KzhQ==
X-Gm-Message-State: APjAAAUQR1ayY0xLwbbwwBg+SGzEMmQxzblwb+MA4I6smiHHoWiqIXlS
 610PJbJXVQi5yCsbLRRO15OaaQ==
X-Google-Smtp-Source: APXvYqylgGgnlf/Z0Orza9qJRrWxcszrwnK+vdVT7tg0cYX2LQXbbeSPDVM6mlYFYgUjBYVURutriw==
X-Received: by 2002:a63:714a:: with SMTP id b10mr4066928pgn.25.1567700299222; 
 Thu, 05 Sep 2019 09:18:19 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:18 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 15/18] ASoC: davinci: Kill BUG_ON() usage
Date: Thu,  5 Sep 2019 10:17:56 -0600
Message-Id: <20190905161759.28036-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=k4RSHQziswwPF3IEl7odNlbX/Lq1Hx75YDWK/+CVFu0=;
 b=jZZB1l94YWLd3tFIaGQ47yvMyJb9LlEazs2Ow8RBBjQ4l/r+vNhmddIWpMfHfHXs50
 78rWPPNCOz1OQu1AmHck6xNxXoRE7CFw9P+2slSZQz2Ys6D042/onIrEufTy+6xGnf7G
 /W7VbSFrbc056Zl/UdlRSDhj5hSjjoWsrULBTO1dp2b+2wVkNBYy15jzvUSO7Yol26Pq
 +a0ju3yHvCNmc2ezasYLStXloGX/OXTLGO31IarwZm/OPn8nU0nkbRODmTltiIBUdlzi
 njdrh0EUYg8SUhgdMLrNIUsilQw7WpjaCy9U6aj+BbrkPvrH3K1Yod5NAymx6bhyqYRw
 48AQ==
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

RnJvbTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPgoKY29tbWl0IGJlZmZmNGZiYzI3ZTE5
YjE0YjM0M2ViNGE2NWQ4Zjc1ZDM4YjYyMzAgdXBzdHJlYW0KCkRvbid0IHVzZSBCVUdfT04oKSBm
b3IgYSBub24tY3JpdGljYWwgc2FuaXR5IGNoZWNrIG9uIHByb2R1Y3Rpb24Kc3lzdGVtcy4gIFRo
aXMgcGF0Y2ggcmVwbGFjZXMgd2l0aCBhIHNvZnRlciBXQVJOX09OKCkgYW5kIGFuIGVycm9yCnBh
dGguCgpTaWduZWQtb2ZmLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+ClNpZ25lZC1v
ZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogTWF0
aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4KLS0tCiBzb3VuZC9zb2Mv
ZGF2aW5jaS9kYXZpbmNpLW1jYXNwLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9kYXZpbmNpL2Rh
dmluY2ktbWNhc3AuYyBiL3NvdW5kL3NvYy9kYXZpbmNpL2RhdmluY2ktbWNhc3AuYwppbmRleCBh
ZjZjZDhiODc0ZjUuLmI0ZTZmNGEwNGNiNiAxMDA2NDQKLS0tIGEvc291bmQvc29jL2RhdmluY2kv
ZGF2aW5jaS1tY2FzcC5jCisrKyBiL3NvdW5kL3NvYy9kYXZpbmNpL2RhdmluY2ktbWNhc3AuYwpA
QCAtMTc0OCw3ICsxNzQ4LDggQEAgc3RhdGljIGludCBkYXZpbmNpX21jYXNwX2dldF9kbWFfdHlw
ZShzdHJ1Y3QgZGF2aW5jaV9tY2FzcCAqbWNhc3ApCiAJCQkJUFRSX0VSUihjaGFuKSk7CiAJCXJl
dHVybiBQVFJfRVJSKGNoYW4pOwogCX0KLQlCVUdfT04oIWNoYW4tPmRldmljZSB8fCAhY2hhbi0+
ZGV2aWNlLT5kZXYpOworCWlmIChXQVJOX09OKCFjaGFuLT5kZXZpY2UgfHwgIWNoYW4tPmRldmlj
ZS0+ZGV2KSkKKwkJcmV0dXJuIC1FSU5WQUw7CiAKIAlpZiAoY2hhbi0+ZGV2aWNlLT5kZXYtPm9m
X25vZGUpCiAJCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKGNoYW4tPmRldmljZS0+ZGV2
LT5vZl9ub2RlLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
