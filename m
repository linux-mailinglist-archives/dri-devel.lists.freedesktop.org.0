Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BA82ADF5A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8849F89BD2;
	Tue, 10 Nov 2020 19:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3616F89BD5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c16so4309329wmd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C+zBR+LtvSmQF6WK85h0NeZVtoTEWkwyfZr5+ZdAWFg=;
 b=tMF+3pG5AXC3vlK8/vqtMujSz3Ljj+0p0heESDtpmL4we/th6iHGh+8nFxtYussM0a
 bMz4xEQZrR9KqTeE5hNq4bcSASyfm9uV4r+G23Av61RM+6SOH6NnB1Ynyq+Xs/TMfwpP
 WYnsHEtHkeSxZHAqsaWMDvHEkiDyYfdZD4ckndsph6cVHgRSb5Di9q3kfRjfy4Qf9qSm
 S1Z7kx0IqXLikmDSocmxhrrCXxtVPuqbtPgiLglKGcXr3YDrt1aGKXNzHSCwyzgE9ZN5
 jtMiGwewAgwbjqbxNG4AdtVdOklXLu36yfH1kB3UQxNm8ywdFzklqlvYLJttGr9JN7N6
 HQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C+zBR+LtvSmQF6WK85h0NeZVtoTEWkwyfZr5+ZdAWFg=;
 b=OS/3pi/wOc6mJwQL8KIbtpE5eO1sMP231JSyPQnNBENi189hshRR7Euw0E4vU6kA5Q
 pOENzWDXtKFQsY95dGUI/UCHgrDm5fHre5vcFUN46oRxOzgSFW2ZiXqC8wIRoXA2IXwO
 YXyRm6hQCPWa9YsuJAp/5PFJPvrUAVRcnc92dQwh27+0cOMaBNmzRdjMrpMutq+OjPdX
 enJGcB93WmXbY3CfDwrUyGUb+nIY34U7MwQqhIzRezmUYJteoVncP/TnaJYPyU/4mz6R
 HsIw0K0dEVXZgsBq2kxp/Xi4rt1EwAdcVEhl0l5gV4015Vj4W+NMkPxGsdfg2GFY1P/6
 StAw==
X-Gm-Message-State: AOAM530qswPXAYHxruREj0bNU+HszUpJmwmnc91zem+FwTe+0G9hN+hb
 3Dw3uQKqfCK9PQZE6hPzY0kHzw==
X-Google-Smtp-Source: ABdhPJweRmEkGhTCPihLk1lOn7tT5/NJE06idgEUjsbpo9M/smhM1lSR8C+7+QrbEbuwYgd5fw7Tgg==
X-Received: by 2002:a1c:5946:: with SMTP id n67mr726295wmb.162.1605036677804; 
 Tue, 10 Nov 2020 11:31:17 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/30] drm/radeon/evergreen: Add comment for
 'evergreen_page_flip()'s 'async' param
Date: Tue, 10 Nov 2020 19:30:43 +0000
Message-Id: <20201110193112.988999-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYzogSW4gZnVuY3Rpb24g4oCYZXZlcmdyZWVuX2dw
dV9pbml04oCZOgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYzoxNDE5OiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdhc3luYycgbm90IGRlc2NyaWJlZCBp
biAnZXZlcmdyZWVuX3BhZ2VfZmxpcCcKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVy
Z3JlZW4uYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vZXZlcmdyZWVuLmMKaW5kZXggNGViM2Y5YmM4ZmE4Yi4uYzlhOWE4Nzk1OWY5ZSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jCkBAIC0xNDEyLDYgKzE0MTIsNyBAQCB2b2lkIGRj
ZTRfd2FpdF9mb3JfdmJsYW5rKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBpbnQgY3J0YykK
ICAqIEByZGV2OiByYWRlb25fZGV2aWNlIHBvaW50ZXIKICAqIEBjcnRjX2lkOiBjcnRjIHRvIGNs
ZWFudXAgcGFnZWZsaXAgb24KICAqIEBjcnRjX2Jhc2U6IG5ldyBhZGRyZXNzIG9mIHRoZSBjcnRj
IChHUFUgTUMgYWRkcmVzcykKKyAqIEBhc3luYzogU2V0IHJldHJhY2UKICAqCiAgKiBUcmlnZ2Vy
cyB0aGUgYWN0dWFsIHBhZ2VmbGlwIGJ5IHVwZGF0aW5nIHRoZSBwcmltYXJ5CiAgKiBzdXJmYWNl
IGJhc2UgYWRkcmVzcyAoZXZlcmdyZWVuKykuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
