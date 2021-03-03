Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC39C32B840
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D5D6E947;
	Wed,  3 Mar 2021 13:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787426E958
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:19 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id f12so19932853wrx.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cWfSkLsOFqMqwFajDViY0GDy36kEao+sHnvIWX+OuUc=;
 b=mzLCVvzT8ZvO420Azr5mfjX30PlXUIrvbQHxMtN4US7RxeQlR04wUoXvV46MOWj67E
 TWBlNF4/fpmvc9jBPbo8VUcZihj5NbZNatn1o4r/fSJ+yH4/3bVrwGGDdLvQ3qZiVJh2
 SkXaBry/0wkXurG3AA4Ii8agUSDhJfuQLrC0Fijehb/xyKuNWqT2fuZGhON2EEEwzyNf
 saNBVVglJJvtHS4T1+IJlUj26Hbale91MzMi3i9Y3teiy9iiWr0/Slz1czb37udJnR/E
 7n7Q1YnI5xP0NRV/cB7DCp6C/uWjoNIIh7DO9fX7nE3KgwNNfcgC7mm34lRPE0XyViv4
 o1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cWfSkLsOFqMqwFajDViY0GDy36kEao+sHnvIWX+OuUc=;
 b=hMSFpxlu2u5N5j2v/plOEgVJxwZwbYsUqiouPj3fNK29kmppSLJbOl5baDkpNgFZGO
 js0SU0awZpwvaxsdpgtsefDjo2Ar0DVSIbeutDd/s3RuUPFFRldtYJiwPBQj110AaUOC
 dFzqgtDdRiLJYFKKU5RM5N0D0ElPYPdUI6yAPCb49qNeqMqp760RPu5qUYefMmuYDNr9
 5gr083Ensrn6jjy5HsA+M4sAvoR2gWvvawZKA6WXc2XARRKakIGlu9InzdeR5GTanCMr
 zPMuHEYkGW2vF0+oV2TWIYUypyhXutyY5teDo5jIRqHS5VCYLqITdQPN3H4VCvgdZO9y
 Vt3g==
X-Gm-Message-State: AOAM5328u88u2maA4wYcPQqYRHWX1AkxVCGQ4reLW/WwL6L4pBamJIsh
 kO5HMnt536C1vVQk1mcugdiVQg==
X-Google-Smtp-Source: ABdhPJxsWGUQqx0lYnqLB5s/MsxjPNI/91pZrxh/sj18e4bbCtcGtgCnCi4+SM9FZvcs2lKnc2i7PA==
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr27793282wrx.243.1614779058227; 
 Wed, 03 Mar 2021 05:44:18 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 42/53] drm/vmwgfx/vmwgfx_cmdbuf_res: Remove unused variable
 'ret'
Date: Wed,  3 Mar 2021 13:43:08 +0000
Message-Id: <20210303134319.3160762-43-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kYnVmX3Jlcy5jOiBJbiBmdW5jdGlvbiDigJh2bXdf
Y21kYnVmX3Jlc19yZXZlcnTigJk6CiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRi
dWZfcmVzLmM6MTYyOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IFZNd2FyZSBHcmFwaGljcyA8bGlu
dXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPgpDYzogUm9sYW5kIFNjaGVpZGVnZ2Vy
IDxzcm9sYW5kQHZtd2FyZS5jb20+CkNjOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBa
YWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAyMTAxMTUxODEzMTMuMzQzMTQ5My00MC1sZWUuam9u
ZXNAbGluYXJvLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2NtZGJ1Zl9y
ZXMuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2NtZGJ1Zl9y
ZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2NtZGJ1Zl9yZXMuYwppbmRleCA5
MjUwOWZiZjJmZDFkLi5iMjYyZDYxZDgzOWQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9jbWRidWZfcmVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfY21kYnVmX3Jlcy5jCkBAIC0xNTksNyArMTU5LDYgQEAgdm9pZCB2bXdfY21kYnVmX3Jl
c19jb21taXQoc3RydWN0IGxpc3RfaGVhZCAqbGlzdCkKIHZvaWQgdm13X2NtZGJ1Zl9yZXNfcmV2
ZXJ0KHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QpCiB7CiAJc3RydWN0IHZtd19jbWRidWZfcmVzICpl
bnRyeSwgKm5leHQ7Ci0JaW50IHJldDsKIAogCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShlbnRy
eSwgbmV4dCwgbGlzdCwgaGVhZCkgewogCQlzd2l0Y2ggKGVudHJ5LT5zdGF0ZSkgewpAQCAtMTY3
LDggKzE2Niw3IEBAIHZvaWQgdm13X2NtZGJ1Zl9yZXNfcmV2ZXJ0KHN0cnVjdCBsaXN0X2hlYWQg
Kmxpc3QpCiAJCQl2bXdfY21kYnVmX3Jlc19mcmVlKGVudHJ5LT5tYW4sIGVudHJ5KTsKIAkJCWJy
ZWFrOwogCQljYXNlIFZNV19DTURCVUZfUkVTX0RFTDoKLQkJCXJldCA9IGRybV9odF9pbnNlcnRf
aXRlbSgmZW50cnktPm1hbi0+cmVzb3VyY2VzLAotCQkJCQkJICZlbnRyeS0+aGFzaCk7CisJCQlk
cm1faHRfaW5zZXJ0X2l0ZW0oJmVudHJ5LT5tYW4tPnJlc291cmNlcywgJmVudHJ5LT5oYXNoKTsK
IAkJCWxpc3RfZGVsKCZlbnRyeS0+aGVhZCk7CiAJCQlsaXN0X2FkZF90YWlsKCZlbnRyeS0+aGVh
ZCwgJmVudHJ5LT5tYW4tPmxpc3QpOwogCQkJZW50cnktPnN0YXRlID0gVk1XX0NNREJVRl9SRVNf
Q09NTUlUVEVEOwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
