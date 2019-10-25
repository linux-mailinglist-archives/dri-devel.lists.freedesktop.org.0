Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04757E56A1
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 00:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3C36EBBB;
	Fri, 25 Oct 2019 22:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1736EBBB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 22:50:20 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id w8so2063076plq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 15:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=osNStqGe/+pixQ+TIIwo4hgOQ0iCE+khF0tMpALPhbA=;
 b=TcyWQGG/YyNGqsuAqU+IKkta/JkY0FwsyCHy2fQNo0wTxASjtrcE795GermrsOlxRB
 FwSTbLA6xdnoQK2Q+sUN8TrKX7nckkRQ2UWOMvMmqMBM5KIKOjHrKv0B1vdwWvxOKQS0
 YFvE9lxkvhsEgeIz/wJRL6PIl2fFdZEq6GG+Dnj1qSCwIHBpYBFSjaO0wF+AByVSZEJL
 pTVxZTbvF43WC9S+XfwMTf+wqVzz2XPWj7sOmvJTG1PX9msoF97uRiVD7eN8sfpy9LdH
 SzGIJ8Q8092aSfobdMvJFgxCt6nVgjvWSW8/K4J4amlyRYwxkaoAaWcRumNWazzGNMDv
 ed2Q==
X-Gm-Message-State: APjAAAVscHLavLlrpY/+tubIz2U2TH6X/OtotoY58VB0wvdhRpoVOmx5
 kusi1c5ZXGqbmh3JwYIFqij29w==
X-Google-Smtp-Source: APXvYqwEfPgMUzNALdpaZ7hIfRdBK9Sl+x7omJQowf6j1uRY6bjZJnZXHQcn0Yn6ut98Jyy0zAwi0g==
X-Received: by 2002:a17:902:8a96:: with SMTP id
 p22mr6280974plo.272.1572043819516; 
 Fri, 25 Oct 2019 15:50:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 o15sm2758018pjs.14.2019.10.25.15.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 15:50:19 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 3/3] example: dts: hi3660-hikey960: Add dts entries to
 test cma heap binding
Date: Fri, 25 Oct 2019 22:50:09 +0000
Message-Id: <20191025225009.50305-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191025225009.50305-1-john.stultz@linaro.org>
References: <20191025225009.50305-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=osNStqGe/+pixQ+TIIwo4hgOQ0iCE+khF0tMpALPhbA=;
 b=t7oj1A8/ELwYNKEiPY/Pw18dHmD+od22U+4C5NhOE2wd5jiFHCseOjSRPgNDzrSyKq
 dPtd5CcVf9iIPtDONddh2eO4eP3j6pOkNRnByhXulltB5XaUZ4VBvTkOfFT3PuuTpbgR
 fm3I84wjJaEQhBPHt7WSbAUDubIimzLHWBCLSLWX5sMsbyrT3fCHo5F1xVc6KrpAYg6a
 AgjQBcwoRkdatjyjUVB6aSuWoLUrCrbKujOVSG/5gs8lzDyIeWuQNxGe2iKOkrtKXEpq
 1wh9xGKkBGFWOlUKiBuDHcJfU/9wkfMXegJLC9PRvNvTK7V02u/r9lQ0YSfzf7FIX6cd
 JAlA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sandeep Patil <sspatil@google.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 "Andrew F . Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Pratik Patel <pratikp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkcyBleGFtcGxlIHRlc3QgZW50cnkgdG8gY3JlYXRlIGFuZCBleHBvc2UgYSBjYW1lcmEgY21h
IHJlZ2lvbgp2aWEgdGhlIGRtYWJ1ZiBoZWFwcyBpbnRlcmZhY2UKClRoaXMgaXNuJ3QgYSBwYXRj
aCBJJ20gc3VibWl0dGluZyB0byBtZXJnZSwgYnV0IGp1c3QgYW4gZXhhbXBsZQpvZiBob3cgdGhp
cyBmdW5jdGlvbmFsaXR5IGNhbiBiZSB1c2VkLCB3aGljaCBJJ3ZlIHVzZWQgZm9yCnRlc3Rpbmcu
CgpDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KQ2M6IE1hcmsgUnV0bGFuZCA8
bWFyay5ydXRsYW5kQGFybS5jb20+CkNjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNv
bT4KQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgpD
YzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IExpYW0gTWFyayA8
bG1hcmtAY29kZWF1cm9yYS5vcmc+CkNjOiBQcmF0aWsgUGF0ZWwgPHByYXRpa3BAY29kZWF1cm9y
YS5vcmc+CkNjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+CkNjOiBBbmRy
ZXcgRi4gRGF2aXMgPGFmZEB0aS5jb20+CkNjOiBDaGVuYm8gRmVuZyA8ZmVuZ2NAZ29vZ2xlLmNv
bT4KQ2M6IEFsaXN0YWlyIFN0cmFjaGFuIDxhc3RyYWNoYW5AZ29vZ2xlLmNvbT4KQ2M6IFNhbmRl
ZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNvbT4KQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5
YUBnb29nbGUuY29tPgpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4u
c3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9oaXNpbGljb24vaGkz
NjYwLWhpa2V5OTYwLmR0cyB8IDEzICsrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9oaXNpbGljb24vaGkzNjYwLWhpa2V5OTYwLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
aGlzaWxpY29uL2hpMzY2MC1oaWtleTk2MC5kdHMKaW5kZXggMTkwYWMyOWI5ZTJmLi43ODNjNWIy
YWJkMmQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvaGlzaWxpY29uL2hpMzY2MC1o
aWtleTk2MC5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9oaXNpbGljb24vaGkzNjYwLWhp
a2V5OTYwLmR0cwpAQCAtNzUsMTIgKzc1LDIzIEBACiAJCX07CiAKIAkJLyogZ2xvYmFsIGF1dG9j
b25maWd1cmVkIHJlZ2lvbiBmb3IgY29udGlndW91cyBhbGxvY2F0aW9ucyAqLwotCQlsaW51eCxj
bWEgeworCQljbWFfZGVmYXVsdDogbGludXgsY21hIHsKIAkJCWNvbXBhdGlibGUgPSAic2hhcmVk
LWRtYS1wb29sIjsKIAkJCXJlZyA9IDwweDAgMHgyMEMwMDAwMCAweDAgMHg0MDAwMDAwPjsKIAkJ
CXJldXNhYmxlOwogCQkJbGludXgsY21hLWRlZmF1bHQ7CiAJCX07CisKKwkJY21hX2NhbWVyYTog
Y21hLWNhbWVyYSB7CisJCQljb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7CisJCQlyZWcg
PSA8MHgwIDB4MjRDMDAwMDAgMHgwIDB4NDAwMDAwMD47CisJCQlyZXVzYWJsZTsKKwkJfTsKKwl9
OworCisJY21hX2hlYXAgeworCQljb21wYXRpYmxlID0gImRtYWJ1Zi1oZWFwLWNtYSI7CisJCW1l
bW9yeS1yZWdpb24gPSA8JmNtYV9jYW1lcmE+OwogCX07CiAKIAlyZWJvb3QtbW9kZS1zeXNjb25A
MzIxMDAwMDAgewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
