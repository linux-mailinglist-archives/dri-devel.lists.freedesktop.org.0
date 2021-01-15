Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1A42F837A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FAC6E4A5;
	Fri, 15 Jan 2021 18:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514FD6E49F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:06 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id 91so10213552wrj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H7kqjYWcwKGFjqciQAFyPifJs/CUQ6UusnBVQQ2LEnA=;
 b=t8+Z985NiQCY1D2zCsot42xG+heah2+ELntWWsNu+kvRMZrmlPFjA3v7RNx9mNzsCx
 b5cOetQ27f2+guT1vjTkoArcvLofqdC/MEegEdNu/UgYngo4vnnSj2WP3ia83B6v2Kak
 bCNp/Wh8cbGI9GRGzsJ+GUeWUgIl8gRoxkOltUr9gaoeAhAY072+Fd8mB+OY/7JWahJr
 jlF8/C6crPHmhJSJIXGyErUptJSdMmu5vIta/Tpown103vkIfV/3YFKoLh24N7FN0AS7
 aOFsxPShtl3VSluamHIZ9cYl+lcSKMEwV9w87zjtWc1Di5stNLjRZTF9G5JO9YtUzhfb
 xPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H7kqjYWcwKGFjqciQAFyPifJs/CUQ6UusnBVQQ2LEnA=;
 b=rw26CYW9QegvsU6hTcw6GdNIPYDkTX1nhLMXqmD5caO4d5zHcdOGpYbkxkEojzfsMC
 je68elXJuhW+tLgjMcigBO+K85yD0cqtwdLDMk8NffPHkepoy9VEL6hfn47b33KXkVF6
 cU/KCGxK92FwqJ5Z+H6HM8aJQCtCFv+H/MRjec1G1QAYczkcniWjvWiLBdEXUFo5q7cI
 BJyODTUa5lzZ6gVPhkZQ+Avo16XkyxXE5UJUWolw3FEX68Ms9NdXbfjh/xSxPaR4K1/M
 Z2mslL2efyBSVOj7MceoW/+JijFAbYLiLIL73ihvFekaRUkKgfx6BZzsqWuBDzaTIasu
 RCMw==
X-Gm-Message-State: AOAM5323LrGYFZh+rv5k0pm8nWUCy9ojO8Um9+osx1iHtMiyMjOK4CzE
 EtbP6nFxfXOhgTNTxDl0uV6xBQ==
X-Google-Smtp-Source: ABdhPJzlqzn/CqhwXTx8+dBCcy5NljeBmibdEvqIGWxowfd/wAnWSzYrCIXXS92X76e/88dLB2k35w==
X-Received: by 2002:adf:c444:: with SMTP id a4mr10948115wrg.164.1610734444892; 
 Fri, 15 Jan 2021 10:14:04 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:14:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 32/40] drm/gma500/gem: Include our own header containing
 prototypes
Date: Fri, 15 Jan 2021 18:13:05 +0000
Message-Id: <20210115181313.3431493-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2dtYTUwMC9nZW0uYzo1OTo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5
cGUgZm9yIOKAmHBzYl9nZW1fY3JlYXRl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBQ
YXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsuci5qYWtvYnNzb25AZ21haWwuY29tPgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvZ2VtLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAw
L2dlbS5jCmluZGV4IDVlZjU0ODBmOTk5ZTkuLmZiZjQyMDA1MWVmNWYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9nbWE1MDAvZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9n
ZW0uYwpAQCAtMTYsNiArMTYsNyBAQAogI2luY2x1ZGUgPGRybS9kcm0uaD4KICNpbmNsdWRlIDxk
cm0vZHJtX3ZtYV9tYW5hZ2VyLmg+CiAKKyNpbmNsdWRlICJnZW0uaCIKICNpbmNsdWRlICJwc2Jf
ZHJ2LmgiCiAKIHN0YXRpYyB2bV9mYXVsdF90IHBzYl9nZW1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0
ICp2bWYpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
