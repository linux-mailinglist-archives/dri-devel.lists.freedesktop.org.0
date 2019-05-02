Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D14251219B
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 20:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24278979F;
	Thu,  2 May 2019 18:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FC18979F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 18:03:56 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id t87so929569pfa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 11:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jpaVbgGhNQN0ZzYUArMcOaCEqRA3aweYtZZ+kl3+Iik=;
 b=R5nf6xYF0CvtyYN1gxJSuN10h7aIKymiL2U6cgsHkzvonJ3n35S2JB4bDvhnBN68Pq
 02sXAsKagzdE1GPHkTtmZbTDENH8rlsl29rhb9BvlEAT87CG90HBKRpBdQUSG0uOzkMl
 e3BMWDgkRwiXKaVyXk4vhGoNV92T4vFTAR7NMRh+pu/jAqw3pujNkOWum7UktScMmWIz
 +XXVLHkxYc4mZjssJUYeqFFsP6duEXDGDLDwdES9otawKX7R8+6rxH8a+WToBkZ1RM2n
 bQE66UL7q/ngLJuV2+YoBai3ybVmVOgK/CYNM7pVGEB4QEeNhV2wkS8yIQr2bPjf4jEX
 aU2g==
X-Gm-Message-State: APjAAAUgFxI1SnGVm5bFELap21EJ2UVxfxMSEVv68ceTX8dwSocRgFvS
 DbK8rbxliFl+8auI1AxES3a4ged2TwQ=
X-Google-Smtp-Source: APXvYqwceDCWRpUcoHSkNMOKxmMRsFZi4GuQE7+rJlABu1gYS8ge0GQn1qIJjSodlyJDCNC3jDHuQg==
X-Received: by 2002:a63:e048:: with SMTP id n8mr5381287pgj.41.1556820235197;
 Thu, 02 May 2019 11:03:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:4e72:b9ff:fe99:466a])
 by smtp.gmail.com with ESMTPSA id
 c18sm90371672pfc.0.2019.05.02.11.03.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 11:03:54 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] mesa: android: freedreno: Fix build failure due to path
 change
Date: Thu,  2 May 2019 11:03:46 -0700
Message-Id: <20190502180346.4769-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502180346.4769-1-john.stultz@linaro.org>
References: <20190502180346.4769-1-john.stultz@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jpaVbgGhNQN0ZzYUArMcOaCEqRA3aweYtZZ+kl3+Iik=;
 b=alkrJWfOwMliBJkUsqM+4tkVkrN3rHO+A3ZWU5dC8rtbfYsAQpKVgG6ldJX0RVGq5b
 lgbucVUCwW0tAIyr/kamTILaTAxG3dGbJfw7FNT9jmpvdNxml2i0C5SqXNIqrHF0bYmT
 82l4Fs6GjrMuRy3BFUXWx+7TKQ54u2iAN062f33yxIM9Mf6y3OLN10Ibu4KvGpAk8LQm
 jrVKPNduPSaxQhs5n8LwsMYsLKJvT8HTSECZ70lglmlO/zy9Mqk2WH6EuJVLx/waJ+IW
 IAtZwh8kStBU/9ZadUGdr5pIhmNpSfh40UzrYHLPe4DU2krb+z8Q1IEUzzlToPhwV5kW
 8HJw==
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
Cc: Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 Greg Hartman <ghartman@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGlyM19uaXJfdHJpZy5weSBmaWxlIHdhcyBtb3ZlZCBpbiBhIHByZXZpb3VzIGNvbW1pdCwK
YWEwZmVkMTBkMzU3NCAoZnJlZWRyZW5vOiBtb3ZlIGlyMyB0byBjb21tb24gbG9jYXRpb24pLApz
byB1cGRhdGUgdGhlIEFuZHJvaWQuZ2VuLm1rIGZpbGUgdG8gbWF0Y2guCgpDYzogUm9iIENsYXJr
IDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgpDYzogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtv
dkBnbWFpbC5jb20+CkNjOiBBbWl0IFB1bmRpciA8YW1pdC5wdW5kaXJAbGluYXJvLm9yZz4KQ2M6
IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBBbGlzdGFpciBTdHJh
Y2hhbiA8YXN0cmFjaGFuQGdvb2dsZS5jb20+CkNjOiBHcmVnIEhhcnRtYW4gPGdoYXJ0bWFuQGdv
b2dsZS5jb20+CkNjOiBUYXBhbmkgUMOkbGxpIDx0YXBhbmkucGFsbGlAaW50ZWwuY29tPgpDYzog
SmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0PgpTaWduZWQtb2ZmLWJ5OiBKb2hu
IFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KLS0tCiBzcmMvZ2FsbGl1bS9kcml2ZXJz
L2ZyZWVkcmVuby9BbmRyb2lkLmdlbi5tayB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NyYy9nYWxsaXVtL2RyaXZlcnMv
ZnJlZWRyZW5vL0FuZHJvaWQuZ2VuLm1rIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9mcmVlZHJlbm8v
QW5kcm9pZC5nZW4ubWsKaW5kZXggMTdiNmZiZTFiN2UuLmQyOWJhMTU5ZDVjIDEwMDY0NAotLS0g
YS9zcmMvZ2FsbGl1bS9kcml2ZXJzL2ZyZWVkcmVuby9BbmRyb2lkLmdlbi5taworKysgYi9zcmMv
Z2FsbGl1bS9kcml2ZXJzL2ZyZWVkcmVuby9BbmRyb2lkLmdlbi5tawpAQCAtMjUsNyArMjUsNyBA
QCBMT0NBTF9NT0RVTEVfQ0xBU1MgOj0gU1RBVElDX0xJQlJBUklFUwogZW5kaWYKIAogaXIzX25p
cl90cmlnX2RlcHMgOj0gXAotCSQoTE9DQUxfUEFUSCkvaXIzL2lyM19uaXJfdHJpZy5weSBcCisJ
JChNRVNBX1RPUCkvc3JjL2ZyZWVkcmVuby9pcjMvaXIzX25pcl90cmlnLnB5IFwKIAkkKE1FU0Ff
VE9QKS9zcmMvY29tcGlsZXIvbmlyL25pcl9hbGdlYnJhaWMucHkKIAogaW50ZXJtZWRpYXRlcyA6
PSAkKGNhbGwgbG9jYWwtZ2VuZXJhdGVkLXNvdXJjZXMtZGlyKQotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
