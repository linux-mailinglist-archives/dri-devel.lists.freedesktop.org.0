Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C86352F45CD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8087A6E082;
	Wed, 13 Jan 2021 08:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9016E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id h17so507156wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FTigNPeS/IwSagktS00zXkb22HHBlzIFn5zlD1QSHzM=;
 b=n6S7Vkl2P8d/J1RWp7DDnLNoAWE8q8q/iQ1eFDk78lGCA2jU8tYfFMOj3EK88HD7y+
 atlM/WLoghnXazFqOq193WFu8mWtuGXRtoEHJUsKfpHnXnt1uIpqniOk/8FxNdi/5gVo
 JfuVm9hUCwelRLJgc09OfR0VPt3La+9m3YQy3/jCfh1veevr/12V6HkoeEeBwpTcVj2w
 L0vtwHCJd4SJmYkD0yS0gyBk8farkblBEZV5T2pZIMRXA5iWwwMgnF9yR1ry3KQs/SnG
 GPOkYtgIiY1c8073S6k9lSqsftqIE0H4g95wfNzXFcl/JzXsknpPIflktoXVrbY/lVWD
 4E0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FTigNPeS/IwSagktS00zXkb22HHBlzIFn5zlD1QSHzM=;
 b=AvALhVyYCWSquRUWHDRXM4fc5EofdhItBLiWTT0t2ikyxy54HPAquSmxAEio0nOVuT
 Mw+5iTlyu0kzNF71fnWw+TyRSaAcYw55F5AE7eZtnpi8FfpCrdlYB8de3pif9jVDQDkO
 vMy7z1kAfayKUEzqmvxM/EYUCwbj0JY60L7pBn6zh4J1V+rv/9rGty72hVo3/xvyzcv+
 4vFv80FfWfRlSkMH4+6uaZFH4LjUQlQld12UjGmntA94D95TL5CnFEHPnxSbNMp1aSTd
 YTKqBDyphJhGrcmxbod+NGTHlU9X1OCRL/9eLpK3d6UgWHhmJj9cVDng6zIebJhF28hL
 afCw==
X-Gm-Message-State: AOAM533cX13qP7wAAltzj3cIPsAquITBpZdF4kOeZ/HmEq5HA6AbtEMq
 tGOPPUW8YfgXXcNHhEfeiBgiPw==
X-Google-Smtp-Source: ABdhPJylDCzJwl/UqsQ3oiB+JV6DDLrJvs5CTUzp9kXoDj9Nx/zTSJgxRqWTyfh+ONIxqTPdBwwtdg==
X-Received: by 2002:a1c:1bcd:: with SMTP id b196mr959231wmb.70.1610525297006; 
 Wed, 13 Jan 2021 00:08:17 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:16 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/30] drm/amd/display/dc/dce60/dce60_resource: Include our
 own header containing prototypes
Date: Wed, 13 Jan 2021 08:07:39 +0000
Message-Id: <20210113080752.1003793-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U2MC9kY2U2MF9yZXNvdXJjZS5j
OjExMTU6MjM6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlNjBfY3Jl
YXRlX3Jlc291cmNlX3Bvb2zigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U2MC9kY2U2MF9yZXNvdXJjZS5jOjEzMTI6
MjM6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlNjFfY3JlYXRlX3Jl
c291cmNlX3Bvb2zigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U2MC9kY2U2MF9yZXNvdXJjZS5jOjE1MDU6MjM6IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlNjRfY3JlYXRlX3Jlc291cmNl
X3Bvb2zigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IE1hdXJv
IFJvc3NpIDxpc3Nvci5vcnVhbUBnbWFpbC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5
OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2U2MC9kY2U2MF9yZXNvdXJjZS5jIHwgMiArKwogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2U2MC9kY2U2MF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZTYwL2RjZTYwX3Jlc291cmNlLmMKaW5kZXggNjRmNGEwZGExNDZiZi4uZGNmYTBh
M2VmYTAwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTYw
L2RjZTYwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZTYwL2RjZTYwX3Jlc291cmNlLmMKQEAgLTYwLDYgKzYwLDggQEAKICNpbmNsdWRlICJkY2UvZGNl
X2kyYy5oIgogLyogVE9ETyByZW1vdmUgdGhpcyBpbmNsdWRlICovCiAKKyNpbmNsdWRlICJkY2U2
MF9yZXNvdXJjZS5oIgorCiAjaWZuZGVmIG1tTUNfSFVCX1JEUkVRX0RNSUZfTElNSVQKICNpbmNs
dWRlICJnbWMvZ21jXzZfMF9kLmgiCiAjaW5jbHVkZSAiZ21jL2dtY182XzBfc2hfbWFzay5oIgot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
