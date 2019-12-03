Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B405E10FF31
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40406E55C;
	Tue,  3 Dec 2019 13:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8496E55C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:49:06 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id v93so1552641pjb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCWpHuwLWEhr7hIE1xHLzHS/SChie+3Ub/J71wXFl6s=;
 b=aiFqPNrbDS4rLuPFJHdaQ5VLPaa7AZdmxtgwWmMfeC7tVLwBdcMyA8w74sUHNCvPvD
 Js+oFl/vr2z+SXY8Z9anu4HJK9p0cffn9j7bbWC+/31AwGmd338zinwlwmOB4zaPlmEm
 /s5Oc5hUePpLDYGUkcgVCQt63tE+oA3dxnrJc2iww4MwhtYupYLpQukMRMJNzAskFJ2u
 otvDZsaLkHvCaHGK3H+tsIz+iXGUE35+xUlnIK25pm/d7o+CRQT25Qik7895Yl7Qv98n
 0N9HjIu+AsM+MQcialxvjeJog2NoPgWeeefQBkd1TCENs3GmB8LWF6K/05P+oY+oSM+G
 DqIw==
X-Gm-Message-State: APjAAAU/aKB2oaRaDlxEUaMoEFeI1yW/TQCLE4pm2Ts/PTjVS1vtu1nk
 aCWFgdjsJNUK7nosSoHt5iRCjQ==
X-Google-Smtp-Source: APXvYqxyjJik0DwefsyvMQoynNr131hjpVdWIN2ZYDMEUJp5dwOWSvM6iaWt5R1OJTMvh7CpsJ1lDA==
X-Received: by 2002:a17:902:760c:: with SMTP id
 k12mr4928882pll.33.1575380946137; 
 Tue, 03 Dec 2019 05:49:06 -0800 (PST)
Received: from localhost.localdomain ([115.97.190.29])
 by smtp.gmail.com with ESMTPSA id y144sm4397892pfb.188.2019.12.03.05.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 05:49:05 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [DO NOT MERGE] [PATCH v12 7/7] arm64: dts: allwinner: bananapi-m64:
 Enable Bananapi S070WV20-CT16 DSI panel
Date: Tue,  3 Dec 2019 19:18:16 +0530
Message-Id: <20191203134816.5319-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191203134816.5319-1-jagan@amarulasolutions.com>
References: <20191203134816.5319-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OCWpHuwLWEhr7hIE1xHLzHS/SChie+3Ub/J71wXFl6s=;
 b=YCejDFszbgh/fsLnX6AJBgPdhu8ZsJzFunj9aKQmZvh+wCvve+g5aHlIuMfa+1ynz0
 prFZM453x5/N7rFzc1qbyovEO9ayK07RdlfHONJYvbK3jIpI6vzgEDPHWlNpGi59EnxL
 5QVzChQLI6OzT7gWd5eLQJ8b3CnY9cJF3ckaE=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgQmFuYW5hcGkgUzA3MFdWMjAtQ1QxNiBEU0kgcGFu
ZWwgdG8KQlBJLU02NCBib2FyZC4KCkRTSSBwYW5lbCBjb25uZWN0ZWQgdmlhIGJvYXJkIERTSSBw
b3J0IHdpdGgsCi0gRExETzEgYXMgVkNDLURTSSBzdXBwbHkKLSBEQ0RDMSBhcyBWREQgc3VwcGx5
Ci0gUEQ3IGdwaW8gZm9yIGxjZCBlbmFibGUgcGluCi0gUEQ2IGdwaW8gZm9yIGxjZCByZXNldCBw
aW4KLSBQRDUgZ3BpbyBmb3IgYmFja2xpZ2h0IGVuYWJsZSBwaW4KClNpZ25lZC1vZmYtYnk6IEph
Z2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgotLS0KQ2hhbmdlcyBmb3IgdjEy
OgotIG5vbmUKCiAuLi4vZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LWJhbmFuYXBpLW02NC5kdHMg
fCAzMSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQt
YmFuYW5hcGktbTY0LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1h
NjQtYmFuYW5hcGktbTY0LmR0cwppbmRleCAyMDgzNzNlZmVlNDkuLjZiZWFlY2RkODAyYSAxMDA2
NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC1iYW5hbmFw
aS1tNjQuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQt
YmFuYW5hcGktbTY0LmR0cwpAQCAtNDUsNiArNDUsNyBAQAogI2luY2x1ZGUgInN1bjUwaS1hNjQu
ZHRzaSIKIAogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgorI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL3B3bS9wd20uaD4KIAogLyB7CiAJbW9kZWwgPSAiQmFuYW5hUGktTTY0IjsKQEAg
LTU2LDYgKzU3LDE0IEBACiAJCXNlcmlhbDEgPSAmdWFydDE7CiAJfTsKIAorCWJhY2tsaWdodDog
YmFja2xpZ2h0IHsKKwkJY29tcGF0aWJsZSA9ICJwd20tYmFja2xpZ2h0IjsKKwkJcHdtcyA9IDwm
cl9wd20gMCA1MDAwMCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+OworCQlicmlnaHRuZXNzLWxldmVs
cyA9IDwxIDIgNCA4IDE2IDMyIDY0IDEyOCAyNTU+OworCQlkZWZhdWx0LWJyaWdodG5lc3MtbGV2
ZWwgPSA8Mj47CisJCWVuYWJsZS1ncGlvcyA9IDwmcGlvIDMgNSBHUElPX0FDVElWRV9ISUdIPjsg
LyogTENELUJMLUVOOiBQRDUgKi8KKwl9OworCiAJY2hvc2VuIHsKIAkJc3Rkb3V0LXBhdGggPSAi
c2VyaWFsMDoxMTUyMDBuOCI7CiAJfTsKQEAgLTExNiw2ICsxMjUsMjQgQEAKIAlzdGF0dXMgPSAi
b2theSI7CiB9OwogCismZHBoeSB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmRzaSB7CisJ
dmNjLWRzaS1zdXBwbHkgPSA8JnJlZ19kbGRvMT47CQkvKiBWQ0MzVjMtRFNJICovCisJc3RhdHVz
ID0gIm9rYXkiOworCisJcGFuZWxAMCB7CisJCWNvbXBhdGlibGUgPSAiYmFuYW5hcGksczA3MHd2
MjAtY3QxNi1pY242MjExIjsKKwkJcmVnID0gPDA+OworCQllbmFibGUtZ3Bpb3MgPSA8JnBpbyAz
IDcgR1BJT19BQ1RJVkVfSElHSD47IC8qIExDRC1QV1ItRU46IFBENyAqLworCQlyZXNldC1ncGlv
cyA9IDwmcGlvIDMgNiBHUElPX0FDVElWRV9ISUdIPjsgLyogTENELVJTVDogUEQ2ICovCisJCXZk
ZC1zdXBwbHkgPSA8JnJlZ19kY2RjMT47CisJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKKwl9
OworfTsKKwogJmVoY2kwIHsKIAlzdGF0dXMgPSAib2theSI7CiB9OwpAQCAtMjA2LDYgKzIzMywx
MCBAQAogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKKyZyX3B3bSB7CisJc3RhdHVzID0gIm9rYXki
OworfTsKKwogJnJfcnNiIHsKIAlzdGF0dXMgPSAib2theSI7CiAKLS0gCjIuMTguMC4zMjEuZ2Zm
YzZmYTBlMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
