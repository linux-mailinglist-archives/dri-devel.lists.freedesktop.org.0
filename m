Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A40162C5619
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B056E964;
	Thu, 26 Nov 2020 13:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28BF6E957
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:02 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 64so2173888wra.11
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BcIKnQpZCXBlyLSzrwnOmG7IOwmHB9eXMhCgCsu56Io=;
 b=vvu/UfVh3sr3D9noct/cWTDN1mgiOnOg+oz22TAslEDpt+lPXAvTgH8gcxoZukTdnI
 Vnpm0xYCfE3rdiTsH5sOg/KSKJ3NMoqKZcaC7Be9cl+xfq1X2bU0YqiskJyOIufoynQu
 S4QArlHwAi+5WJOdFiqyKoH0JJt8nVKUprx6hv4CK132R6K80EdI77/nheAVXWsrASQp
 VVgAMybtmsm9QLSwb+amML5CCZvWtdhgEi+LX7LWIJrIiY6/AnsZqNwrtEEoq0B//9wa
 yFJjSe9lKZfAWlELH/KQ1DhxPTr+N2FUupYp84sW4gyLdH3uCnk77FFNdU5rMvEEybA3
 5IqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BcIKnQpZCXBlyLSzrwnOmG7IOwmHB9eXMhCgCsu56Io=;
 b=LSckWqMHMd1mqlrggA43UoFBd3UVI24ceQWKsAn4tIi5Jp1u1EzApkNVrE/U6f3X2F
 BP+jCYnoC/uc2thaBMNdQnE4Pc6PN5rMGlPkfiHIbw+T7OlF2es8A1gmZ6sPSLDBxbc+
 3EvQ761aFBmrzzbnj0nv3ehQ95iiXFafyOk/eBiSJuTL9N6Ubkedt/F9+qEH+lDpMSN2
 yjZvVoc2NXO62fB8mFTbjUbsLatD6SxeDuezljQltEu9ChB9cDwhtMokIf0530mjNo6b
 shPsnLX04wv69/hPungh3Y+18pVUqjg94lMacv49A+WXKkOUZOMglka3JP3nhste8sU/
 t3gQ==
X-Gm-Message-State: AOAM531jevE/Mb94kwVHx8F3a+TcjKqaJ+d4EwpE7RLEJQupddg3U1K1
 fhBCRFB7EDJxW2OrX4dqi+aVoQ==
X-Google-Smtp-Source: ABdhPJwfV1VcB+/Umf4WhhLpnnDC28fKOS4R+SFguNSbBQ9UWdlMDGBsSAqcvfHdLN18AN2SVA0mLw==
X-Received: by 2002:a5d:668d:: with SMTP id l13mr3838073wru.279.1606398181420; 
 Thu, 26 Nov 2020 05:43:01 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/40] drm/amd/pm/inc/pp_thermal: Mark
 'SMU7Thermal{WithDelay}Policy' as __maybe_unused
Date: Thu, 26 Nov 2020 13:42:10 +0000
Message-Id: <20201126134240.3214176-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
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
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSBhcmUgdXNlZCBieSBzb21lIHNvdXJjZSBmaWxlcyB3aGljaCBpbmNsdWRlIHBwX3RoZXJt
YWwuaCwgYnV0IG5vdCBhbGwuCgpGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9pbmMvcHBfdGhl
cm1hbC5oOjI4OjQxOiB3YXJuaW5nOiDigJhTTVU3VGhlcm1hbFdpdGhEZWxheVBvbGljeeKAmSBk
ZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vaW5jL3BwX3RoZXJtYWwuaDoyODo0MTogd2FybmluZzog
4oCYU01VN1RoZXJtYWxXaXRoRGVsYXlQb2xpY3nigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bt
L2luYy9wcF90aGVybWFsLmg6MzQ6NDE6IHdhcm5pbmc6IOKAmFNNVTdUaGVybWFsUG9saWN54oCZ
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9pbmMvcHBfdGhlcm1hbC5oOjM0OjQxOiB3YXJuaW5n
OiDigJhTTVU3VGhlcm1hbFBvbGljeeKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
Y29uc3QtdmFyaWFibGU9XQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vaW5jL3Bw
X3RoZXJtYWwuaDozNDo0MTogd2FybmluZzog4oCYU01VN1RoZXJtYWxQb2xpY3nigJkgZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KCkNjOiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEV2YW4gUXVhbiA8ZXZh
bi5xdWFuQGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL3BwX3Ro
ZXJtYWwuaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9wcF90aGVy
bWFsLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9wcF90aGVybWFsLmgKaW5kZXggM2Uz
MDc2OGY5ZTFjYy4uZjdjNDExODUwOTdlNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9pbmMvcHBfdGhlcm1hbC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL3Bw
X3RoZXJtYWwuaApAQCAtMjUsMTMgKzI1LDEzIEBACiAKICNpbmNsdWRlICJwb3dlcl9zdGF0ZS5o
IgogCi1zdGF0aWMgY29uc3Qgc3RydWN0IFBQX1RlbXBlcmF0dXJlUmFuZ2UgU01VN1RoZXJtYWxX
aXRoRGVsYXlQb2xpY3lbXSA9CitzdGF0aWMgY29uc3Qgc3RydWN0IFBQX1RlbXBlcmF0dXJlUmFu
Z2UgX19tYXliZV91bnVzZWQgU01VN1RoZXJtYWxXaXRoRGVsYXlQb2xpY3lbXSA9CiB7CiAJey0y
NzMxNTAsICA5OTAwMCwgOTkwMDAsIC0yNzMxNTAsIDk5MDAwLCA5OTAwMCwgLTI3MzE1MCwgOTkw
MDAsIDk5MDAwfSwKIAl7IDEyMDAwMCwgMTIwMDAwLCAxMjAwMDAsIDEyMDAwMCwgMTIwMDAwLCAx
MjAwMDAsIDEyMDAwMCwgMTIwMDAwLCAxMjAwMDB9LAogfTsKIAotc3RhdGljIGNvbnN0IHN0cnVj
dCBQUF9UZW1wZXJhdHVyZVJhbmdlIFNNVTdUaGVybWFsUG9saWN5W10gPQorc3RhdGljIGNvbnN0
IHN0cnVjdCBQUF9UZW1wZXJhdHVyZVJhbmdlIF9fbWF5YmVfdW51c2VkIFNNVTdUaGVybWFsUG9s
aWN5W10gPQogewogCXstMjczMTUwLCAgOTkwMDAsIDk5MDAwLCAtMjczMTUwLCA5OTAwMCwgOTkw
MDAsIC0yNzMxNTAsIDk5MDAwLCA5OTAwMH0sCiAJeyAxMjAwMDAsIDEyMDAwMCwgMTIwMDAwLCAx
MjAwMDAsIDEyMDAwMCwgMTIwMDAwLCAxMjAwMDAsIDEyMDAwMCwgMTIwMDAwfSwKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
