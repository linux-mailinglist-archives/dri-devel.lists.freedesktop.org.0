Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CC42AF814
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3F688DE5;
	Wed, 11 Nov 2020 18:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718C66E0AA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:35:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c17so3464150wrc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6eWjxCy1b/Di1KDbBj5VEEMSjXTSXChj8189ArvQtHE=;
 b=HbkLuQQi5rW0/qhwunU2WW0FWuIMpOuK3Lb1lXqJZZqhFtQ0WVod0F1XFBZAthXUFw
 xXjyvXMBZIRfRPFWIjgVG0uFcAr87Ios/o1uGlsFlq8jACLRAWaIVyFNN69wwgk9Zl2J
 S7bhRfZayQLJdGensl6yesXvZoW6r6n4AIB18Rf4uu14sXEjeZLls+85JlR0x3kbjoBw
 DVJiPNOPJBi/2wGU7f6bBKz3LrP064hHZLM4zwvUoWbIdxKFNJndlornfq4m5DDsge7i
 LYzgUUvQislNFuJvaZVzSwUp9v/HcLrP64p4YEne6oClTQ+ohO9SvBG4vrLMVB6r1P2J
 veRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6eWjxCy1b/Di1KDbBj5VEEMSjXTSXChj8189ArvQtHE=;
 b=dCAoXtv0rdDXUR5/vxqWlckjrdnUvwLlj/Bxbf+R3s6ZG0aeMXrLxGvBSIxOttVhVJ
 3czDR6d43m2ZdLJDZWUqSPJBo42Z0B8je3XGvbv23+p4yvPVEmh8CIE05X4RIdxIcHnV
 Xo7HFUBopJehs+lrV+kMPv807W/QJOSgcWem/O4qC9bm2+aa8Yp+w5JLOjyyF9M9YF/W
 KN4y/NVMzELi7tEC+LIlJCXInJPo/Qzvu7YjU6mydAw6qdhqW0Qv58nKgb2HS46hO54x
 Cnxq8qyzmMpL7sDA8svqVY6LH3WVtLZijRB4l98SZejyoczxvuulqh5nGuP21kBZ6wpX
 DjbA==
X-Gm-Message-State: AOAM530Rx5ERfq3Aov0CoR11pBfnAqZNqgHX36I476aX5AeK1ksVGNKq
 bNszaCtg5iE9IgZI24rA0A2cSw==
X-Google-Smtp-Source: ABdhPJwTG1YxOAySI8bAWJE0QPTrYQEjoXSzKA5s7TWbneAQ6O54b4nGoEtH73y89h/U+IhYeKkUXg==
X-Received: by 2002:adf:9124:: with SMTP id j33mr30438227wrj.376.1605119750054; 
 Wed, 11 Nov 2020 10:35:50 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:35:49 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/19] drm/radeon/evergreen_dma: Move
 'evergreen_gpu_check_soft_reset()'s prototype to shared header
Date: Wed, 11 Nov 2020 18:35:27 +0000
Message-Id: <20201111183545.1756994-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111183545.1756994-1-lee.jones@linaro.org>
References: <20201111183545.1756994-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYzozODI1OjU6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3Ig4oCYZXZlcmdyZWVuX2dwdV9jaGVja19zb2Z0X3Jlc2V04oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KIDM4MjUgfCB1MzIgZXZlcmdyZWVuX2dwdV9jaGVja19zb2Z0X3Jl
c2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNj
OiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uaCAgICAgfCAx
ICsKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2RtYS5jIHwgMyArLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL2V2ZXJncmVlbi5oCmluZGV4IDMwYzljYTk5Y2VkOTAuLmViNDZhYzc3NzY5NTEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uaApAQCAtNDcsNSArNDcsNiBAQCBpbnQgc3Vtb19ybGNf
aW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiB2b2lkIGV2ZXJncmVlbl9ncHVfcGNp
X2NvbmZpZ19yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiB1MzIgZXZlcmdyZWVu
X2dldF9udW1iZXJfb2ZfZHJhbV9jaGFubmVscyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7
CiB2b2lkIGV2ZXJncmVlbl9wcmludF9ncHVfc3RhdHVzX3JlZ3Moc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpOwordTMyIGV2ZXJncmVlbl9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldik7CiAKICNlbmRpZgkJCQkvKiBfX1JBREVPTl9FVkVSR1JFRU5fSF9f
ICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9kbWEuYyBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2RtYS5jCmluZGV4IDc2Nzg1N2Q0YThj
NWMuLjUyYzc5ZGExZWNmNTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZl
cmdyZWVuX2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2RtYS5j
CkBAIC0yNCwxMCArMjQsOSBAQAogCiAjaW5jbHVkZSAicmFkZW9uLmgiCiAjaW5jbHVkZSAicmFk
ZW9uX2FzaWMuaCIKKyNpbmNsdWRlICJldmVyZ3JlZW4uaCIKICNpbmNsdWRlICJldmVyZ3JlZW5k
LmgiCiAKLXUzMiBldmVyZ3JlZW5fZ3B1X2NoZWNrX3NvZnRfcmVzZXQoc3RydWN0IHJhZGVvbl9k
ZXZpY2UgKnJkZXYpOwotCiAvKioKICAqIGV2ZXJncmVlbl9kbWFfZmVuY2VfcmluZ19lbWl0IC0g
ZW1pdCBhIGZlbmNlIG9uIHRoZSBETUEgcmluZwogICoKLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
