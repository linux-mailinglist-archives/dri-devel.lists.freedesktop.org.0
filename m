Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA45F3A6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4176E29D;
	Thu,  4 Jul 2019 07:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38486E25B;
 Thu,  4 Jul 2019 05:52:42 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w13so4244737eds.4;
 Wed, 03 Jul 2019 22:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ccAtd/XzKmyo3sFMsPL2Axp/F49Jdngxli/Tjqq8k6s=;
 b=ZncbB/iXgFdZIduS1pJODJ0rGUfgMOSt6f8MvhcTlcGKnxS82gBUfQiPh/mI7RDNop
 wtawtbHbwT3xvNjsd7v44POVdysKXnGxORjgTiVsLetVPb51IEBPFlVZrPbV9+v2jH0z
 7r/YlBTYgFuCBt3tylmDW6EXKtKsdJUq3LXv+6j/TmdCNZQii1mDfSgpJd22dr7Utm88
 OyoX3Wf/PmNrQND1bIfMygG6hMgiX89GVbKhBo2xTEr21VFGaLPB88nndwu3VSTGlvfZ
 F3qpDemExAJEDm3khRsNjcSGl9LEzZmGDKBkENnV2CaLuIWIVxe7tqASaqJ2mPna2Qc2
 uH4g==
X-Gm-Message-State: APjAAAVYqyHKORLNHjgdC5NU8GlzxfbPgVRRzLxhPxD8nfjy39dc3i3m
 awPafukpJoSdXptTw4QlmYgmXE1HT0+RVA==
X-Google-Smtp-Source: APXvYqxqJdI0tb77RRuQ1gbOjrMSVm0Z97aLyUChIzwfR64hN/kecvtnSlsHPqhQvbarXJfo9wWGlg==
X-Received: by 2002:a17:906:8048:: with SMTP id
 x8mr30937958ejw.87.1562219561202; 
 Wed, 03 Jul 2019 22:52:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id j30sm1343532edb.8.2019.07.03.22.52.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 22:52:40 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [PATCH 0/7] amdgpu clang warning fixes on next-20190703 
Date: Wed,  3 Jul 2019 22:52:11 -0700
Message-Id: <20190704055217.45860-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ccAtd/XzKmyo3sFMsPL2Axp/F49Jdngxli/Tjqq8k6s=;
 b=fHkNwfKjj7VqlrBRMEGJ5ApoeF0azL4rzRGGxqNBnhzNr8B3gMbYKRCCehINbvisVk
 43qYGIsE33Te7YC6/RYvuEvFW9SqmuPt2FcnDQ+2tUMVcEX/AfphMdbPB1C2938KBr28
 CaY/Qs5ZW/1c6ehdbiQwxJ/k/cAc9lnTtcfiEauLoTPWqesc7tqCEMQC3ky3L12IVS88
 R1JF8+dz+S4dr6zNz/sKxlbHqu26vw5iuGRqDG/HLAymyjskKIX/lmFeHWxJo3tNrREY
 GOi+1S3yO0V0HVQsJ4GXUk1vaGde7gGnx+aRl/+83SJxJItKupsxZ2t0c27pIg1HhDGT
 jR5A==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKSSBkb24ndCBkbyB0aHJlYWRlZCBwYXRjaGVzIHZlcnkgb2Z0ZW4gc28gaWYgSSBo
YXZlIG1lc3NlZCBzb21ldGhpbmcgdXAsCnBsZWFzZSBmb3JnaXZlIG1lIDopCgpUaGlzIHNlcmll
cyBmaXhlcyBhbGwgb2YgdGhlIGNsYW5nIHdhcm5pbmdzIHRoYXQgSSBzYXcgYWRkZWQgaW4KbmV4
dC0yMDE5MDcwMy4gVGhlIGZ1bGwgbGlzdCBpcyB2aXNpYmxlIGluIHRoZSBnaXN0IGxpbmtlZCBi
ZWxvdyBhbmQKZWFjaCBmdWxsIGluZGl2aWR1YWwgd2FybmluZyBjYW4gYmUgc2VlbiBpbiB0aGUg
R2l0SHViIGxpbmsgaW4gZWFjaApwYXRjaC4KCmh0dHBzOi8vZ2lzdC5naXRodWIuY29tLzU0MTFh
ZjA4Yjk2Yzk5YjE0ZTYwYzYwODAwZTk5YTQ3CgpBbGwgb2YgdGhlIHdhcm5pbmdzIGFyZSBmaXhl
ZCBpbiB3aGF0IEkgYmVsaWV2ZSBpcyB0aGUgb3B0aW1hbCB3YXkgYnV0CnRoZSBlbnVtIGNvbnZl
cnNpb24gd2FybmluZ3Mgd2VyZSB0aGUgdHJpY2tpZXN0OyBwbGVhc2UgcmV2aWV3IGNhcmVmdWxs
eQphcyB0aGUgY29kZSBwYXRocyBmb3Igc29tZSBvZiB0aGVtIGhhdmUgY2hhbmdlZCAoZXNwZWNp
YWxseSBpbiBwYXRjaCAzCmFuZCA2KS4KClRoYW5rIHlvdSEKTmF0aGFuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
