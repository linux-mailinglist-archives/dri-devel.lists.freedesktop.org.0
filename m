Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ECF2B0D3D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DD56E3DB;
	Thu, 12 Nov 2020 19:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458876E3EC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d12so7122077wrr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ov+hNhD3SKYkmXLxIt4K88IOrbz9wi3prlF4IGflKIA=;
 b=HaKWon5e27vVoEszYC+8GRccl3aOte+jqCuD5RwYvw6ylRWQd+CrIRkR769NKQET+a
 NL15ssjcWuHmB4bGvwWQE15yhgjPfNjQZJEkpEWKtwO15LmfdpWSGi2jxoGPtRF3onFR
 OMCJcskY6WOsWAC3jLRiORkoCCBrebvUO0iccdgpgchRhmHQTRjFTdj4H/hd/tNKfWw8
 v9VAvpV5PuEmRGo5WNivCmGd2TWHPU1F5F5qdr/ZVVTKGKkszlMWRp6uJ3j6LV5sF6Ce
 Y2J8LeF0SlEfnnzIAYZPMXx8e/WQ7QclnjIFWV37iZJi2NtqT8r2WywT4Wf331WLmZOl
 9r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ov+hNhD3SKYkmXLxIt4K88IOrbz9wi3prlF4IGflKIA=;
 b=SOcrVnZb82JdULjMBRq4DssHL6u6gC7/QLGVX4HPj3gemcmYZtDgjtaLy/5NLQQy8t
 b2jaeq1Vb0FV25XGig5YjyxuK1xtxt7kNH47pOQqkOFFjUwdFIiuONFNn0hagzVtIlJL
 HCvjhY4oMiKn+8MIMiwKkAGCfHoSIXzWNU2/leYaD+PhXXIfygAyufydUK3TYdFOEcdF
 cI7Ao/uCLXQjBLwqHca337z5OkJSguK1pHFXKaX/L9EQgBPbrr2lOcq7UL7Q6WAxdvZ8
 YfgJ1FT8898v7p7iyIrg53u1j6N8Z0GFrbCR6wyb8rM24S6dsdWwuTNKP6Wyh1qJTsu+
 kK+A==
X-Gm-Message-State: AOAM530imDFAKdqKrnwLL1jDV6ZKgd94ZnmCjzibpSz5w3qmA2/69b9e
 XVqu9O8HnCECivWkbdKLltVcWQ==
X-Google-Smtp-Source: ABdhPJz6gcI8pqKX92aeK0A2wnxDfVcWz6jrilEoWlaSmQJS1ipaQgmvzbQ4hI9uHgviAXYzqMTaMg==
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr1152395wrk.71.1605207706981;
 Thu, 12 Nov 2020 11:01:46 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:46 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/30] drm/sti/sti_hdmi: Move 'colorspace_mode_names' array to
 where its used
Date: Thu, 12 Nov 2020 19:00:36 +0000
Message-Id: <20201112190039.2785914-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5oOjM2OjQwOiB3YXJuaW5nOiDigJhjb2xvcnNwYWNlX21v
ZGVfbmFtZXPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxl
PV0KIDM2IHwgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcHJvcF9lbnVtX2xpc3QgY29sb3JzcGFj
ZV9tb2RlX25hbWVzW10gPSB7CiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKQ2M6IEJlbmphbWlu
IEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgpDYzogVmluY2VudCBBYnJp
b3UgPHZpbmNlbnQuYWJyaW91QHN0LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jIHwgNiArKysrKysKIGRyaXZlcnMvZ3B1
L2RybS9zdGkvc3RpX2hkbWkuaCB8IDYgLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3Rp
L3N0aV9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKaW5kZXggMzhhNTU4
NzY4ZTUzMS4uZjNhY2UxMTIwOWRkNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0aS9z
dGlfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYwpAQCAtMTY3LDYg
KzE2NywxMiBAQCBzdHJ1Y3Qgc3RpX2hkbWlfY29ubmVjdG9yIHsKICNkZWZpbmUgdG9fc3RpX2hk
bWlfY29ubmVjdG9yKHgpIFwKIAljb250YWluZXJfb2YoeCwgc3RydWN0IHN0aV9oZG1pX2Nvbm5l
Y3RvciwgZHJtX2Nvbm5lY3RvcikKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcHJvcF9lbnVt
X2xpc3QgY29sb3JzcGFjZV9tb2RlX25hbWVzW10gPSB7CisJeyBIRE1JX0NPTE9SU1BBQ0VfUkdC
LCAicmdiIiB9LAorCXsgSERNSV9DT0xPUlNQQUNFX1lVVjQyMiwgInl1djQyMiIgfSwKKwl7IEhE
TUlfQ09MT1JTUEFDRV9ZVVY0NDQsICJ5dXY0NDQiIH0sCit9OworCiB1MzIgaGRtaV9yZWFkKHN0
cnVjdCBzdGlfaGRtaSAqaGRtaSwgaW50IG9mZnNldCkKIHsKIAlyZXR1cm4gcmVhZGwoaGRtaS0+
cmVncyArIG9mZnNldCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1p
LmggYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmgKaW5kZXggMWY2ZGM5MGI1ZDgzYS4u
MDViMmYzZDBkNDhkMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuaApAQCAtMzMsMTIgKzMzLDYgQEAg
c3RydWN0IGhkbWlfYXVkaW9fcGFyYW1zIHsKIAlzdHJ1Y3QgaGRtaV9hdWRpb19pbmZvZnJhbWUg
Y2VhOwogfTsKIAotc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcHJvcF9lbnVtX2xpc3QgY29sb3Jz
cGFjZV9tb2RlX25hbWVzW10gPSB7Ci0JeyBIRE1JX0NPTE9SU1BBQ0VfUkdCLCAicmdiIiB9LAot
CXsgSERNSV9DT0xPUlNQQUNFX1lVVjQyMiwgInl1djQyMiIgfSwKLQl7IEhETUlfQ09MT1JTUEFD
RV9ZVVY0NDQsICJ5dXY0NDQiIH0sCi19OwotCiAjZGVmaW5lIERFRkFVTFRfQ09MT1JTUEFDRV9N
T0RFIEhETUlfQ09MT1JTUEFDRV9SR0IKIAogLyoqCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
