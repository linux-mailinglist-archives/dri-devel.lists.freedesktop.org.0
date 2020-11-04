Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16DA2A6E00
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 20:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D6C6E3DA;
	Wed,  4 Nov 2020 19:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C108C6E3DA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 19:36:36 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b8so23341167wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 11:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LLsN4EencXRGtGh6NICYbwvfxRBgSaeY1vL5/hXBaSE=;
 b=mDUmwxxsTe07lHZdCK2NULBQOzn4QryCvAiJRBiNod0SQqJoH9VRDVYsjyFYKGVo/W
 reE/6DdkeQRZ5mln/8ZmhUKS1Roow+CuhxYEGWCbHlGiH6Qvhf2OzHgt7m1ca/RB6IfC
 1Z/XDwPlOsKdZWNpKBMdu/7ai2sBwVtTD3IVxbySNMGnN2mYL5XCqTeOJDO84TsaAUgR
 y4+ySv4XxyVtAkylZ1TZa2e5KfXHwqh1NYm4Q5nd7bi3EBSwCAabLS+uoRknth3lyNIL
 4C639ZtdSlM3cWtK32QsZklz9nt/+PfSD/KdhAz8FygBldRS4KP1oWuJo4VC0x5CKunJ
 1MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLsN4EencXRGtGh6NICYbwvfxRBgSaeY1vL5/hXBaSE=;
 b=X48txEKhEmkjrBsmdGRRHjvnUXu5+UlvYJDisUVK0s3MJEwqQc/zpiw/lF38exMd3y
 stCXmwYg5tCXcsDnL6ogeFNeLkNr3RQsQV/4dSwz5KpbOQ9J+wUIgmuKeBUZtQLGNrEm
 rvIatub7c0jB47sZwXEl8Vh/rz0T5skbVKGMujFcmK5HhqMp3rrOqFpoABm1+DEQosVN
 5LQX+JnENSxOx/FUGjm3YSG1GZRQs1skIMDLdRqKkTGUG3OjRZussC5xROWtf+iw75sM
 HeKKGHBCOIgpE76+gyeLIlP42vqe/oDLAfjVmVDYhIgxuPnwUp9cI4A5/IO4VoA2y4dP
 1zHA==
X-Gm-Message-State: AOAM533kc6l3J+9h7iS/NGEupemg7OExsAM71rzhuNQHtMimgdlEAdaX
 +ecQ7ztGRMXR3YFufdqQQDgViA==
X-Google-Smtp-Source: ABdhPJwj69pglo5oKTGjibnfQaOnqOYeg+zi78YMRNFefrSr4xnzdjafE2tVb3anObZuT+KBZ5gsIg==
X-Received: by 2002:adf:de89:: with SMTP id w9mr33569428wrl.212.1604518595494; 
 Wed, 04 Nov 2020 11:36:35 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id x10sm4034444wrp.62.2020.11.04.11.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 11:36:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/36] tty: serial: serial-tegra: Struct headers should start
 with 'struct <name>'
Date: Wed,  4 Nov 2020 19:35:37 +0000
Message-Id: <20201104193549.4026187-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104193549.4026187-1-lee.jones@linaro.org>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
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
Cc: linux-serial@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, Thierry Reding <thierry.reding@gmail.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-tegra@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy90dHkvc2VyaWFsL3NlcmlhbC10ZWdyYS5jOjg1OiB3YXJuaW5nOiBjYW5ub3QgdW5kZXJzdGFu
ZCBmdW5jdGlvbiBwcm90b3R5cGU6ICdzdHJ1Y3QgdGVncmFfdWFydF9jaGlwX2RhdGEgJwoKQ2M6
IExheG1hbiBEZXdhbmdhbiA8bGRld2FuZ2FuQG52aWRpYS5jb20+CkNjOiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogSmlyaSBTbGFieSA8amlyaXNs
YWJ5QGtlcm5lbC5vcmc+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwu
Y29tPgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KQ2M6IFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0
LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+CkNjOiBsaW51eC1zZXJpYWxAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC10
ZWdyYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5s
aW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbC10ZWdyYS5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy90dHkvc2VyaWFsL3NlcmlhbC10ZWdyYS5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbC10
ZWdyYS5jCmluZGV4IGJkMTMwMTRhMWM1MzcuLmMzNjNlZTA0NzBmNDUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdHR5L3NlcmlhbC9zZXJpYWwtdGVncmEuYworKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwv
c2VyaWFsLXRlZ3JhLmMKQEAgLTc1LDcgKzc1LDcgQEAKICNkZWZpbmUgVEVHUkFfVUFSVF9GQ1Jf
SUlSX0ZJRk9fRU4JCTB4NDAKIAogLyoqCi0gKiB0ZWdyYV91YXJ0X2NoaXBfZGF0YTogU09DIHNw
ZWNpZmljIGRhdGEuCisgKiBzdHJ1Y3QgdGVncmFfdWFydF9jaGlwX2RhdGE6IFNPQyBzcGVjaWZp
YyBkYXRhLgogICoKICAqIEB0eF9maWZvX2Z1bGxfc3RhdHVzOiBTdGF0dXMgZmxhZyBhdmFpbGFi
bGUgZm9yIGNoZWNraW5nIHR4IGZpZm8gZnVsbC4KICAqIEBhbGxvd190eGZpZm9fcmVzZXRfZmlm
b19tb2RlOiBhbGxvd190eCBmaWZvIHJlc2V0IHdpdGggZmlmbyBtb2RlIG9yIG5vdC4KLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
