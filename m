Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7921C2B0D14
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9616E174;
	Thu, 12 Nov 2020 19:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860B06E314
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:00:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c17so7118827wrc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gVcDG3IiNQEq4rpTJUM8b3mZR6jA74yvr8OWtv64epQ=;
 b=Y1OLNk/UJGCriJrFzTJyz/7mEB43UxZLzJz8hPJJs02oFqzKBJE0899W3d0AtzsB43
 GMkA5SjnvYXBpOkdpVgOqsywYS3E41ROtpGzJP3Lhtda/31ycYXjg/AvNc8eCFD+o8xn
 02aiZoaSxAOHPpz+uw3fQ7TpG0KwYt68Xj2IXLd1lBmEtMKeTpxzgdZHgy3idhQbe7x/
 Br/Wm4m7eyvRH3mh+xGUw+J3EjfSL36y2O1H26GQ6x2F1WtrGEjUe3or6rJZGYL4Wd6W
 3EfdycZCcsWf7uQwp2tA72EQUq6o8/bw+dgq4RoEeHmmEyJpnJE6elo797Oa9WJTgogr
 Wxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gVcDG3IiNQEq4rpTJUM8b3mZR6jA74yvr8OWtv64epQ=;
 b=NlcuudeYdhg1QI3ytDR6ixHJ7kM4CSNWjUjhMtikcETRfiUXuTD6vfQjOClvKFlgPs
 o7ixebS6KJXo0aR1WYgroLNrBnsuvAj7j39QOBLj8NYOjya12QOu7BvjTt28uwc+02sC
 CmUcL8q1aXWRCtQF7OrdubKVaty5ijj4Xh4lnOwUqyTJE81j5pLg+bRnOpdqd/zsAXUZ
 FkY8KaKzi6I4kjJqIxNj0WIApb4p3R5uzliVm2XIWX3a3HjEwaQLjJKUIgFvM6j4anFl
 /lmf93qn0uguGgA+6bYEF/8JQ7HwW+XrH/OnL29KyuiMTNWWM+d6Lc1e+mh09QRiCC+l
 MJSA==
X-Gm-Message-State: AOAM5306Ft7dCQlgQuRG5NST4iuHzzvPbWnQjL6dJE39hNH1g4ZR/DPU
 YkB/fyxcALBrGjlCPuicmsmo2g==
X-Google-Smtp-Source: ABdhPJxFv4jWUIh1wd651ZYopF50nq1JdswFNn22NA1B9EBp1HaArdAU1PnW00YXU3OzKtTCcHEQSQ==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr1108099wrt.312.1605207649222; 
 Thu, 12 Nov 2020 11:00:49 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:00:48 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/30] drm/via/via_dma: Remove set but unused variable
 'agp_base'
Date: Thu, 12 Nov 2020 19:00:13 +0000
Message-Id: <20201112190039.2785914-5-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3ZpYS92aWFfZG1hLmM6IEluIGZ1bmN0aW9uIOKAmHZpYV9jbWRidWZfanVtcOKA
mToKIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYS5jOjU5NjoxMTogd2FybmluZzogdmFyaWFi
bGUg4oCYYWdwX2Jhc2XigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KCkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3ZpYS92aWFfZG1hLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWEuYyBiL2Ry
aXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYS5jCmluZGV4IDEyMDg0NDVlMzQxZGUuLmNkNTZmZmEz
ZGY1ODkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYS5jCkBAIC01OTMsMTMgKzU5MywxMSBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgdmlhX2R1bW15X2JpdGJsdChkcm1fdmlhX3ByaXZhdGVfdCAqZGV2X3ByaXYp
CiAKIHN0YXRpYyB2b2lkIHZpYV9jbWRidWZfanVtcChkcm1fdmlhX3ByaXZhdGVfdCAqZGV2X3By
aXYpCiB7Ci0JdWludDMyX3QgYWdwX2Jhc2U7CiAJdWludDMyX3QgcGF1c2VfYWRkcl9sbywgcGF1
c2VfYWRkcl9oaTsKIAl1aW50MzJfdCBqdW1wX2FkZHJfbG8sIGp1bXBfYWRkcl9oaTsKIAl2b2xh
dGlsZSB1aW50MzJfdCAqbGFzdF9wYXVzZV9wdHI7CiAJdWludDMyX3QgZG1hX2xvd19zYXZlMSwg
ZG1hX2xvd19zYXZlMjsKIAotCWFncF9iYXNlID0gZGV2X3ByaXYtPmRtYV9vZmZzZXQgKyAodWlu
dDMyX3QpIGRldl9wcml2LT5hZ3BBZGRyOwogCXZpYV9hbGlnbl9jbWQoZGV2X3ByaXYsIEhDX0hB
R1BCcElEX0pVTVAsIDAsICZqdW1wX2FkZHJfaGksCiAJCSAgICAgICZqdW1wX2FkZHJfbG8sIDAp
OwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
