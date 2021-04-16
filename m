Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC597362295
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357B56EC1F;
	Fri, 16 Apr 2021 14:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A504E6EBAC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id bx20so31418833edb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9TISBbCiRhBu677uKtWLY+O2n+9ENYFzE4E3l/7xu74=;
 b=WPFZRx2AOSEV7kKeL23SmikYGo6CGMuOXLlBxUeoNSKckHHvsWnzqy+JPsd3EzEUJn
 yy9JVK9GGo6jFgOv+QsgJukksMc8hJ3wnsoXPudyULwoeH0FV5yh6A2XrJYWmCi/AFh+
 GPCfWPJELgYoscWMFR7mdIppujI3OPj/XfbHtjhYZbPTtc8nlRgMEemRcijC76Q3GgDE
 LI+lqrTQ/RJHwQrsDFje7aHIH2nGuJL0YhAuhKQqDzB/EqhBqtBX5+SJ5gW+lD9WGey2
 RRyvf8tj+kggo9Y0DuIuB1LuDNaN4AF/yQKght+XeqMA/2ZhfsR88UWku5OG0QzaTfTt
 q0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9TISBbCiRhBu677uKtWLY+O2n+9ENYFzE4E3l/7xu74=;
 b=W70olMAsNwh03ELocFqJ1udKqrEYogdhjXXDd/+XaUYOCH1KVkK+e9EfWYcTKcfUhJ
 ETsSreSUYdpLRpevaCjYT6/+jNtRTSVs4Er+TuN2Z9sdiviMc6F0H0eHXYiuRwBrxqgm
 J6+usZq2mhktRfH8VTeWSiPfmTkEX5al0BOYUif4IsLQmlEJQohD79pKiVpiWEk7Il+r
 BzqCCn9IovVu7/sAtV+BCXOBlG7lMoSKBlOcp8mmdYUHkYGXazPv2ItDUhtdNDnllS/5
 bhDKBfUH46JKthFoJiU3KH07MSaOiBvxoNMK9sYT2k2nKKSmgiTPboLhfNewPPSYFGBZ
 6Ojg==
X-Gm-Message-State: AOAM5314q3cRGdWtfLsCVXtsb3JF1cU1TNJYMrOBkDb/0YVhYTeAx5cS
 l0uFHclUarG5Oc8Pp7V5RYdXKw==
X-Google-Smtp-Source: ABdhPJwaBHWHa3mmVDMl+qoKDnlJQf+hamKu6uJRFFXIt3+UT2zjv3ODxR5KwRlyUDvLklFhP3fIkw==
X-Received: by 2002:aa7:d587:: with SMTP id r7mr9354550edq.388.1618583875381; 
 Fri, 16 Apr 2021 07:37:55 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:54 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/40] drm/scheduler/sched_entity: Fix some function name
 disparity
Date: Fri, 16 Apr 2021 15:37:09 +0100
Message-Id: <20210416143725.2769053-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYzoyMDQ6IHdhcm5pbmc6IGV4cGVjdGlu
ZyBwcm90b3R5cGUgZm9yIGRybV9zY2hlZF9lbnRpdHlfa2lsbF9qb2JzKCkuIFByb3RvdHlwZSB3
YXMgZm9yIGRybV9zY2hlZF9lbnRpdHlfa2lsbF9qb2JzX2NiKCkgaW5zdGVhZAogZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYzoyNjI6IHdhcm5pbmc6IGV4cGVjdGluZyBw
cm90b3R5cGUgZm9yIGRybV9zY2hlZF9lbnRpdHlfY2xlYW51cCgpLiBQcm90b3R5cGUgd2FzIGZv
ciBkcm1fc2NoZWRfZW50aXR5X2ZpbmkoKSBpbnN0ZWFkCiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX2VudGl0eS5jOjMwNTogd2FybmluZzogZXhwZWN0aW5nIHByb3RvdHlwZSBmb3Ig
ZHJtX3NjaGVkX2VudGl0eV9maW5pKCkuIFByb3RvdHlwZSB3YXMgZm9yIGRybV9zY2hlZF9lbnRp
dHlfZGVzdHJveSgpIGluc3RlYWQKCkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1
bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJv
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfCA2ICsrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwppbmRleCBmMDc5MGU5NDcxZDFhLi4wMjQ5Yzc0
NTAxODg4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0
eS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKQEAgLTE5
Miw3ICsxOTIsNyBAQCBsb25nIGRybV9zY2hlZF9lbnRpdHlfZmx1c2goc3RydWN0IGRybV9zY2hl
ZF9lbnRpdHkgKmVudGl0eSwgbG9uZyB0aW1lb3V0KQogRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRf
ZW50aXR5X2ZsdXNoKTsKIAogLyoqCi0gKiBkcm1fc2NoZWRfZW50aXR5X2tpbGxfam9icyAtIGhl
bHBlciBmb3IgZHJtX3NjaGVkX2VudGl0eV9raWxsX2pvYnMKKyAqIGRybV9zY2hlZF9lbnRpdHlf
a2lsbF9qb2JzX2NiIC0gaGVscGVyIGZvciBkcm1fc2NoZWRfZW50aXR5X2tpbGxfam9icwogICoK
ICAqIEBmOiBzaWduYWxlZCBmZW5jZQogICogQGNiOiBvdXIgY2FsbGJhY2sgc3RydWN0dXJlCkBA
IC0yNTAsNyArMjUwLDcgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2VudGl0eV9raWxsX2pvYnMo
c3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkKIH0KIAogLyoqCi0gKiBkcm1fc2NoZWRf
ZW50aXR5X2NsZWFudXAgLSBEZXN0cm95IGEgY29udGV4dCBlbnRpdHkKKyAqIGRybV9zY2hlZF9l
bnRpdHlfZmluaSAtIERlc3Ryb3kgYSBjb250ZXh0IGVudGl0eQogICoKICAqIEBlbnRpdHk6IHNj
aGVkdWxlciBlbnRpdHkKICAqCkBAIC0yOTUsNyArMjk1LDcgQEAgdm9pZCBkcm1fc2NoZWRfZW50
aXR5X2Zpbmkoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkKIEVYUE9SVF9TWU1CT0wo
ZHJtX3NjaGVkX2VudGl0eV9maW5pKTsKIAogLyoqCi0gKiBkcm1fc2NoZWRfZW50aXR5X2Zpbmkg
LSBEZXN0cm95IGEgY29udGV4dCBlbnRpdHkKKyAqIGRybV9zY2hlZF9lbnRpdHlfZGVzdHJveSAt
IERlc3Ryb3kgYSBjb250ZXh0IGVudGl0eQogICoKICAqIEBlbnRpdHk6IHNjaGVkdWxlciBlbnRp
dHkKICAqCi0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
