Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC71CD269
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B383F6E23F;
	Mon, 11 May 2020 07:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ED389FED
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i15so7924095wrx.10
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K/boFoUXaAgzs/9YRn/4qwyX/v1A/ZjToMiKSYzOwF0=;
 b=CsDrppTOIM1X8NLMAVH0m3CI9obn/4avW1sQrIKdscbA7S1vz0D5jaYiKPtt8AFN2c
 TPZ/3TRlrdUr+GRjCbCwJCWYOxOzw/IhiVFQp+KP/VPrKJXeOYNPQ+aZuC6zm3Sd65KR
 rhkc7cs3FBbPQAaAJ+Uq4k95gzdIX+zjTtGitOybYxTQE4qzEOcrr9p016MOfFfWVPFB
 C+vvtj6cGmwKoo8lxNEEcny94OGwyjQsjSAPjNm7HzL6rm69KqHLZtKOyUYEIBNBiB4i
 zja+XFUgqvVVDW12fow/JWywZgPXmBqDNL1bX/yR/61o9SwY8fcV03uALOl2ojejgG5C
 +E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K/boFoUXaAgzs/9YRn/4qwyX/v1A/ZjToMiKSYzOwF0=;
 b=jyOeayxDEn/xpKz5x9p9HzFYts9s8szSRJnaPj50EFGpmxL4BRpDmo4fWIHRZ+fOSx
 sP+l912yN/ifnoJ47EcIqDc0BT7jTk0W7ffUvNripDkZm8IR5f+/1DBI8FnuHBSuzj11
 llTEa3dFjU/FDRKw13idolfss7jwhajOHTSa61nij9sCHLSFtwrC5GrKzFss5pRv9OD7
 LbnwXfV8/JaMkzCFN1+M+l8U5o0qxLQd/HEqleVLPn5gq7bsJguTQa14AAPkhoyLPTWr
 pTS1r4/5/8IRApi7dUJtrZT79du6YesbfnoGdMevcY6/ctBtvA2rW/cceXo0jlTDDx8y
 IDvA==
X-Gm-Message-State: AGi0PuZUIMAL3yAzJlg1JlU0dCoMMn9VIizhLeAY3dm/Q0r0JFrhLQGP
 Q+AFyATimijRQqGx2tnV+Mw=
X-Google-Smtp-Source: APiQypKxxgw1gHTSXE0R2uidSfFJNoUSdztA5pN6FNFmbebfe2j6K8LCVB8QZ+7yVeNP4+OkgKQkcA==
X-Received: by 2002:adf:81e4:: with SMTP id 91mr14909020wra.143.1589129756971; 
 Sun, 10 May 2020 09:55:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:56 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 14/15] [DO NOT MERGE] arm64: dts: allwinner: h6: Add GPU OPP
 table
Date: Sun, 10 May 2020 18:55:37 +0200
Message-Id: <20200510165538.19720-15-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGFuIE9wZXJhdGluZyBQZXJmb3JtYW5jZSBQb2ludHMgdGFibGUgZm9yIHRoZSBHUFUgdG8K
ZW5hYmxlIER5bmFtaWMgVm9sdGFnZSAmIEZyZXF1ZW5jeSBTY2FsaW5nIG9uIHRoZSBINi4KClRo
ZSB2b2x0YWdlIHJhbmdlIGlzIHNldCB3aXRoIG1pbml2YWwgdm9sdGFnZSBzZXQgdG8gdGhlIHRh
cmdldAphbmQgdGhlIG1heGltYWwgdm9sdGFnZSBzZXQgdG8gMS4yVi4gVGhpcyBhbGxvdyBEVkZT
IGZyYW1ld29yayB0bwp3b3JrIHByb3Blcmx5IG9uIGJvYXJkIHdpdGggZml4ZWQgcmVndWxhdG9y
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4K
LS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRzaSB8IDgwICsr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpIGIv
YXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKaW5kZXggYjI2Zjcz
NTIwMWM3Li44NWY0M2E0YjY1MWYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxs
d2lubmVyL3N1bjUwaS1oNi5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVy
L3N1bjUwaS1oNi5kdHNpCkBAIC0xNzMsNiArMTczLDcgQEAKIAkJCWNsb2NrcyA9IDwmY2N1IENM
S19HUFU+LCA8JmNjdSBDTEtfQlVTX0dQVT47CiAJCQljbG9jay1uYW1lcyA9ICJjb3JlIiwgImJ1
cyI7CiAJCQlyZXNldHMgPSA8JmNjdSBSU1RfQlVTX0dQVT47CisJCQlvcGVyYXRpbmctcG9pbnRz
LXYyID0gPCZncHVfb3BwX3RhYmxlPjsKIAkJCSNjb29saW5nLWNlbGxzID0gPDI+OwogCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKIAkJfTsKQEAgLTEwMjYsNCArMTAyNyw4MyBAQAogCQkJfTsKIAkJ
fTsKIAl9OworCisJZ3B1X29wcF90YWJsZTogZ3B1LW9wcC10YWJsZSB7CisJCWNvbXBhdGlibGUg
PSAib3BlcmF0aW5nLXBvaW50cy12MiI7CisKKwkJb3BwQDIxNjAwMDAwMCB7CisJCQlvcHAtaHog
PSAvYml0cy8gNjQgPDIxNjAwMDAwMD47CisJCQlvcHAtbWljcm92b2x0ID0gPDgxMDAwMCA4MTAw
MDAgMTIwMDAwMD47CisJCX07CisKKwkJb3BwQDI2NDAwMDAwMCB7CisJCQlvcHAtaHogPSAvYml0
cy8gNjQgPDI2NDAwMDAwMD47CisJCQlvcHAtbWljcm92b2x0ID0gPDgxMDAwMCA4MTAwMDAgMTIw
MDAwMD47CisJCX07CisKKwkJb3BwQDMxMjAwMDAwMCB7CisJCQlvcHAtaHogPSAvYml0cy8gNjQg
PDMxMjAwMDAwMD47CisJCQlvcHAtbWljcm92b2x0ID0gPDgxMDAwMCA4MTAwMDAgMTIwMDAwMD47
CisJCX07CisKKwkJb3BwQDMzNjAwMDAwMCB7CisJCQlvcHAtaHogPSAvYml0cy8gNjQgPDMzNjAw
MDAwMD47CisJCQlvcHAtbWljcm92b2x0ID0gPDgxMDAwMCA4MTAwMDAgMTIwMDAwMD47CisJCX07
CisKKwkJb3BwQDM2MDAwMDAwMCB7CisJCQlvcHAtaHogPSAvYml0cy8gNjQgPDM2MDAwMDAwMD47
CisJCQlvcHAtbWljcm92b2x0ID0gPDgyMDAwMCA4MjAwMDAgMTIwMDAwMD47CisJCX07CisKKwkJ
b3BwQDM4NDAwMDAwMCB7CisJCQlvcHAtaHogPSAvYml0cy8gNjQgPDM4NDAwMDAwMD47CisJCQlv
cHAtbWljcm92b2x0ID0gPDgzMDAwMCA4MzAwMDAgMTIwMDAwMD47CisJCX07CisKKwkJb3BwQDQw
ODAwMDAwMCB7CisJCQlvcHAtaHogPSAvYml0cy8gNjQgPDQwODAwMDAwMD47CisJCQlvcHAtbWlj
cm92b2x0ID0gPDg0MDAwMCA4NDAwMDAgMTIwMDAwMD47CisJCX07CisKKwkJb3BwQDQyMDAwMDAw
MCB7CisJCQlvcHAtaHogPSAvYml0cy8gNjQgPDQyMDAwMDAwMD47CisJCQlvcHAtbWljcm92b2x0
ID0gPDg1MDAwMCA4NTAwMDAgMTIwMDAwMD47CisJCX07CisKKwkJb3BwQDQzMjAwMDAwMCB7CisJ
CQlvcHAtaHogPSAvYml0cy8gNjQgPDQzMjAwMDAwMD47CisJCQlvcHAtbWljcm92b2x0ID0gPDg2
MDAwMCA4NjAwMDAgMTIwMDAwMD47CisJCX07CisKKwkJb3BwQDQ1NjAwMDAwMCB7CisJCQlvcHAt
aHogPSAvYml0cy8gNjQgPDQ1NjAwMDAwMD47CisJCQlvcHAtbWljcm92b2x0ID0gPDg3MDAwMCA4
NzAwMDAgMTIwMDAwMD47CisJCX07CisKKwkJb3BwQDUwNDAwMDAwMCB7CisJCQlvcHAtaHogPSAv
Yml0cy8gNjQgPDUwNDAwMDAwMD47CisJCQlvcHAtbWljcm92b2x0ID0gPDg5MDAwMCA4OTAwMDAg
MTIwMDAwMD47CisJCX07CisKKwkJb3BwQDU0MDAwMDAwMCB7CisJCQlvcHAtaHogPSAvYml0cy8g
NjQgPDU0MDAwMDAwMD47CisJCQlvcHAtbWljcm92b2x0ID0gPDkxMDAwMCA5MTAwMDAgMTIwMDAw
MD47CisJCX07CisKKwkJb3BwQDU3NjAwMDAwMCB7CisJCQlvcHAtaHogPSAvYml0cy8gNjQgPDU3
NjAwMDAwMD47CisJCQlvcHAtbWljcm92b2x0ID0gPDkzMDAwMCA5MzAwMDAgMTIwMDAwMD47CisJ
CX07CisKKwkJb3BwQDYyNDAwMDAwMCB7CisJCQlvcHAtaHogPSAvYml0cy8gNjQgPDYyNDAwMDAw
MD47CisJCQlvcHAtbWljcm92b2x0ID0gPDk1MDAwMCA5NTAwMDAgMTIwMDAwMD47CisJCX07CisK
KwkJb3BwQDc1NjAwMDAwMCB7CisJCQlvcHAtaHogPSAvYml0cy8gNjQgPDc1NjAwMDAwMD47CisJ
CQlvcHAtbWljcm92b2x0ID0gPDEwNDAwMDAgMTA0MDAwMCAxMjAwMDAwPjsKKwkJfTsKKwl9Owog
fTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
