Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48922C0401
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB6B8916C;
	Mon, 23 Nov 2020 11:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A728916C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:28 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 10so17529458wml.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aak1C5AROsIvSC+gcDbF5DK1OJsF92xIrCqFvBLF46A=;
 b=zQXLmgbCPdBSYkDzMUUmb9OMYNzAd9s1IP7it3fe9XT/V9GoG2disqTb5wa/JjkWa9
 n/jZa6zxmCNpvPvcyz1r7faJ4gWimYqeWiS8C0RyVvKdGa6FjJU9OjP+8WMK2E3RyS8b
 Yc6Y9LLhLN5636l3WW191hBEQ/rQE68cFW1YNXywf6Zhc0g6ISACxJVVW6TwmToiGTpt
 g7zqnQbHkoKDVbbtUeoiFJP/Vlc+ey0E3AgWuX0QTviMzXHruZDJsUpseTRYgYmOhcYQ
 B8jLRV0eqvVTaCO6XCFInlj0sYY7pgadoxGh27YIK3rJB9D9KPGTFLGwFBm9A/bikrx6
 lLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aak1C5AROsIvSC+gcDbF5DK1OJsF92xIrCqFvBLF46A=;
 b=oYNxv4lPD5u6lztCxTRYDRXtmPPvXgXUaAp6n59HWX4MyLXU/3LetYglmtrPuYsn3x
 sI74i5+YwTjDvud5gf+J3Yyor35nc032VdePEspsyMZZrqwKNkE1vfOHDe3a/M/+VpkL
 2lHDynRlY9Q4FY+u00WZXyA1OtWdHkPitCiu20D0TK3tlPsK/ATECehW0CSCjEKs++xy
 ez03g5WmwHURDemCsQKADIUn59bzVVA8qmNI91Cua5W7OicuLnOt/ca5eh4ge/jBEKWm
 pfBmil2neNUmesVrmmuwOaiXzbapt+8fjr9s+jjUw/om72AHul0hoM8AvNyxCuWnsiC7
 tMaA==
X-Gm-Message-State: AOAM531pfeakJzFOCw1tJsLCGXsBNIpm0bgq9vagyuUKr6hNjT33FmFY
 h741eKOe53QVeMZIadDscWqRAA==
X-Google-Smtp-Source: ABdhPJxzlhwbPFfCCCY4C6L4cRtqY3gatpejZGdMPL7K/CPJhYf3UqKcqEXab0w9gopVxgJ/0quHOg==
X-Received: by 2002:a1c:4c02:: with SMTP id z2mr11190930wmf.139.1606130367035; 
 Mon, 23 Nov 2020 03:19:27 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/40] drm/amd/amdgpu/amdgpu_ib: Provide docs for
 'amdgpu_ib_schedule()'s 'job' param
Date: Mon, 23 Nov 2020 11:18:42 +0000
Message-Id: <20201123111919.233376-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmM6MTI3OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdqb2InIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9pYl9zY2hl
ZHVsZScKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAi
Q2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3Rz
LmxpbmFyby5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYyB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfaWIuYwppbmRleCBjNjlhZjliODZjYzYwLi4wMjRkMGE1NjNhNjUyIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYwpAQCAtMTA2LDYgKzEwNiw3IEBAIHZvaWQgYW1kZ3B1
X2liX2ZyZWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfaWIgKmli
LAogICogQHJpbmc6IHJpbmcgaW5kZXggdGhlIElCIGlzIGFzc29jaWF0ZWQgd2l0aAogICogQG51
bV9pYnM6IG51bWJlciBvZiBJQnMgdG8gc2NoZWR1bGUKICAqIEBpYnM6IElCIG9iamVjdHMgdG8g
c2NoZWR1bGUKKyAqIEBqb2I6IGpvYiB0byBzY2hlZHVsZQogICogQGY6IGZlbmNlIGNyZWF0ZWQg
ZHVyaW5nIHRoaXMgc3VibWlzc2lvbgogICoKICAqIFNjaGVkdWxlIGFuIElCIG9uIHRoZSBhc3Nv
Y2lhdGVkIHJpbmcgKGFsbCBhc2ljcykuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
