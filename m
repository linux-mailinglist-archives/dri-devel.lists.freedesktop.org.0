Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484CC6E8AF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 18:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C1089E3E;
	Fri, 19 Jul 2019 16:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3DD89E3E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 16:23:29 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id w17so31563257qto.10
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 09:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=oUXz0d2sCkAZZ39ImaGfhX/v8OXuvtWKItgSEuJlYwc=;
 b=JBDUT78H6OaQScGEiyIc+2zt4k3pqfvFnNN0MtDLwHE1B3uqqcECpUP1yjpn3mz3kl
 dbi1zr4fRMjuO56jshR/mZfxkijdiowvYPaDaqNAzujpTSj122V8EEFj7dvn3OTTcDPd
 2iuLQOKHcHkb44N+iN+5eYtyoizC7qyUdAY6slnGY6wNfN9cEU44+bCHsbbyMTw3+mJ8
 oCZtc058eB6DTWYLFFMVpDE7Ix89hqk+7ea5Xf98gUjOlx8FTI0PT72zZyJvia0Dzko1
 zVZ9lgjFQGCKtxrloxegMAH4hg37imzSK5hhPDlIXbLMXTWPMdfY4khjDIJElsYEUnZN
 C5og==
X-Gm-Message-State: APjAAAUDmlEYqwQ6Qw7Ci7X3CyGvaleAXSAXu7vkRRvPMkwrYM+7G/kN
 A1BU8t3MvxI/OJ88ZH1jcX63qA==
X-Google-Smtp-Source: APXvYqz+ErwHBxlf1sHucIbLm0DyL84Yk3jgEmSNdOTU2HkTDb4Kn3xxe/vU6PzwLawamCk9r2NS0A==
X-Received: by 2002:aed:3f10:: with SMTP id p16mr37785031qtf.110.1563553408918; 
 Fri, 19 Jul 2019 09:23:28 -0700 (PDT)
Received: from dhcp-10-20-1-165.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id n5sm17858967qta.29.2019.07.19.09.23.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 09:23:28 -0700 (PDT)
Message-ID: <617ef7670a35f0be6beba79ecdaba8be26154868.camel@redhat.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
From: Adam Jackson <ajax@redhat.com>
To: Matthias Kaehlcke <mka@chromium.org>, Andrzej Hajda
 <a.hajda@samsung.com>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 19 Jul 2019 12:23:26 -0400
In-Reply-To: <20190718214135.79445-1-mka@chromium.org>
References: <20190718214135.79445-1-mka@chromium.org>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA3LTE4IGF0IDE0OjQxIC0wNzAwLCBNYXR0aGlhcyBLYWVobGNrZSB3cm90
ZToKCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBpbmRleCAw
NDViMWIxM2ZkMGUuLmU0OTQwMmViZDU2ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5jCj4gQEAgLTM1LDYgKzM1LDcgQEAKPiAgCj4gICNpbmNsdWRlIDxt
ZWRpYS9jZWMtbm90aWZpZXIuaD4KPiAgCj4gKyNkZWZpbmUgRERDX0kyQ19BRERSCQkweDM3CgpU
aGlzIGNvbmZ1c2VkIHRoZSBoZWNrIG91dCBvZiBtZSB0byByZWFkLCBEREMgYnkgZGVmaW5pdGlv
biBoYXBwZW5zCm92ZXIgSTJDIGFuZCB0aGlzIG9uZSBhZGRyZXNzIGlzIGp1c3QgZm9yIGEgc3Bl
Y2lmaWMgc3Vic2V0IG9mIEREQy4KUGVyaGFwcyB0aGlzIHdvdWxkIGJlIGNsZWFyZXIgaWYgaXQg
d2FzIG5hbWVkIEREQ19DSV9BRERSLgoKLSBhamF4CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
