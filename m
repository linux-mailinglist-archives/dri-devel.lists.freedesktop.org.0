Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B399D2B4D3F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA286E07B;
	Mon, 16 Nov 2020 17:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EDA6E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s8so19610184wrw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6eWjxCy1b/Di1KDbBj5VEEMSjXTSXChj8189ArvQtHE=;
 b=R2Zvmw9KS2p/uW92MEVvMAZHk/cC36qiZDKxllEIdVedCqMaJxEhSpmCl8uEzkgxvs
 ziSwIPTt2zvHY39MLFUPlML1cC0Y4JOoKx3lqQ8apPiW9uNx0p0hyqKCg3mdkC1uGZpo
 9QZLpveawM4J2EiSh9h4Ky7yUMPlTMDW6etAsDjbjhYc6A4T792sIprRsqKM6TO+Cuia
 qRZodDurakwR/Sa0L1NztR38xENLghD8JYA7jLO9eYyDMWoNeqNc8F8voGZxgUOBAoiG
 PVYJw/2UeoXSIhRt0aiFE/6FKhjqwCslGMIL6Nvym5qzUA0y6W2dVcXzM/1fuh4TKJik
 2ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6eWjxCy1b/Di1KDbBj5VEEMSjXTSXChj8189ArvQtHE=;
 b=kMb1efmi18S7kI1nsrenqTaE3o2awjMejdQ0vLU/nUcq7bwQjinegJCNsLA+RqNeY4
 CZL+4XazWKs9hcbOVBPeUVES7NVXDVpQNKHHlrRj9Sz61hbGXi73uUkQHxCZ3TAnZ1ia
 XnviwQL7t4a7oUlQiJrWOekJmt86Eb1Kn9F1xJEbtkpB48ijAgVi1w9b3PlZYL5rV+Fv
 2/aKPqXlnCIB0oCMiXKPgWOstGg/3h6fBas0uh+TFRzL0HoGGpDUr+oHtsSuukU14WEU
 gKR0hkt4wJeD5WwM0pot+5mw1Npfs3Rp5aFeyK3UE2SdBCmN28Qc9Q/0AKteo5BscQWX
 YHeA==
X-Gm-Message-State: AOAM530GjAikuSlbg0JbWXFHGvJUX3PCJwSfB624P7qP07zdddyvZXct
 +dF+sM2oyHj/e3cvi8vHsv+p0w==
X-Google-Smtp-Source: ABdhPJxROO5b9lILZ+JniBmhfb3OcM1XvkCvRfpWKPHTjgz7WGw0zIZm4kKfPGYNo/liMWytt2yiCQ==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr20117581wrq.236.1605548257084; 
 Mon, 16 Nov 2020 09:37:37 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/43] drm/radeon/evergreen_dma: Move
 'evergreen_gpu_check_soft_reset()'s prototype to shared header
Date: Mon, 16 Nov 2020 17:36:40 +0000
Message-Id: <20201116173700.1830487-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
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
