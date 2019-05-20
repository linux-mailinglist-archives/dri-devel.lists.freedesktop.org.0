Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8A122FBF
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 11:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3D389317;
	Mon, 20 May 2019 09:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF0B89317
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:07:54 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id s11so6886771pfm.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 02:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RhhbywtZgL9mTL+/aS2gTie5gz+AOsOECX4GcmEvNm8=;
 b=pIOgm7jnM9HveJjcXHODDyEazJ4TTHe4e7dv8KtrG2dU3XsF8lPyq4DWo00mPIvA0y
 YF5O7UR8UQkqG2PG5lDHofuebVB7tAokgoSpywFRG3GCUI13kQaIPczBes2AntftnA3w
 rnsqFFZ80FMPXqxsrXfyqurXPjTu1SuqB2Ojm8vq15ABtcCxq/q5fQRqUv7uTWdUIrxM
 HjGAlX7aU235h4pVuNuJCB3vmcAZJOkDh8gQY6zZHldr0i7EWY2DxfTm30HQqJwseAQp
 L2DH8zT4Gy6Bh2JYjL/cv49WI+dx1SAm2fyLfa8znd5EEEB+oFJVA1sEH4FxkeYxJ1re
 6kqA==
X-Gm-Message-State: APjAAAXvjgBwmOKg932tkPHueRxzSSmVuKIMW1vKGFslNkYmajfvXEgp
 g9GfUxK+Rz/q52e2UJtDzr9Xgg==
X-Google-Smtp-Source: APXvYqz34UXPxRhzfdNer7tUP6i29zQxwtYM7NMLCp3pv/rNH5nWYiFi2u+2vMjGcD+MakpaE3MtkA==
X-Received: by 2002:a63:1150:: with SMTP id 16mr74722565pgr.40.1558343274409; 
 Mon, 20 May 2019 02:07:54 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.193])
 by smtp.gmail.com with ESMTPSA id d15sm51671614pfm.186.2019.05.20.02.07.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 02:07:53 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v10 08/11] dt-bindings: sun6i-dsi: Add VCC-DSI supply property
Date: Mon, 20 May 2019 14:33:15 +0530
Message-Id: <20190520090318.27570-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190520090318.27570-1-jagan@amarulasolutions.com>
References: <20190520090318.27570-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RhhbywtZgL9mTL+/aS2gTie5gz+AOsOECX4GcmEvNm8=;
 b=r7FvqZFw/gu/2n+1603wdn3ygdOPws+IPKmHzr+7ytlLH74FqNbxJXLgMSH0OHamIK
 1GA+Ua3+oxWE9TzHS9ArZ45MeQ3PutdmMb9mtkP1VwHF58tBHnNJdJzASpUAarmrwcbt
 hejMLtxkulq1eWgonL7tep/ehNu3uSZ2CB6PQ=
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
Cc: bshah@mykolab.com, powerpan@qq.com, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsd2lubmVyIE1JUEkgRFNJIGNvbnRyb2xsZXJzIGFyZSBzdXBwbGllZCB3aXRoIFNvQyBEU0kK
cG93ZXIgcmFpbHMgdmlhIFZDQy1EU0kgcGluLgoKU29tZSBib2FyZCBzdGlsbCB3b3JrIHdpdGhv
dXQgc3VwcGx5aW5nIHRoaXMgYnV0IGdpdmUgbW9yZQpmYWl0aCBvbiBkYXRhc2hlZXQgYW5kIGhh
cmR3YXJlIHNjaGVtYXRpY3MgYW5kIGRvY3VtZW50IHRoaXMKc3VwcGx5IHByb3BlcnR5IGluIHJl
cXVpcmVkIHByb3BlcnR5IGxpc3QuCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KVGVzdGVkLWJ5OiBNZXJsaWpuIFdhamVyIDxtZXJsaWpuQHdpenp1cC5vcmc+ClNp
Z25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgotLS0K
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRz
aS50eHQgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRz
aS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9z
dW42aS1kc2kudHh0CmluZGV4IDZhNmNmNWRlMDhiMC4uMWNjNDA2NjNiN2EyIDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW42aS1k
c2kudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1
bnhpL3N1bjZpLWRzaS50eHQKQEAgLTIxLDYgKzIxLDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoK
ICAgLSBwaHlzOiBwaGFuZGxlIHRvIHRoZSBELVBIWQogICAtIHBoeS1uYW1lczogbXVzdCBiZSAi
ZHBoeSIKICAgLSByZXNldHM6IHBoYW5kbGUgdG8gdGhlIHJlc2V0IGNvbnRyb2xsZXIgZHJpdmlu
ZyB0aGUgZW5jb2RlcgorICAtIHZjYy1kc2ktc3VwcGx5OiB0aGUgVkNDLURTSSBwb3dlciBzdXBw
bHkgb2YgdGhlIERTSSBlbmNvZGVyCiAKICAgLSBwb3J0czogQSBwb3J0cyBub2RlIHdpdGggZW5k
cG9pbnQgZGVmaW5pdGlvbnMgYXMgZGVmaW5lZCBpbgogICAgIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dC4gVGhlCi0tIAoyLjE4LjAu
MzIxLmdmZmM2ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
