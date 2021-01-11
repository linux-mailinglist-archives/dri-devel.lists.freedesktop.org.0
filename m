Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6112F1F01
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CFC89FC9;
	Mon, 11 Jan 2021 19:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314BB89F77
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:20:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y187so7025wmd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MwXCd4JlIEnX1jwiKrIwLEF3yNPJI5fsZD+MBCO9rh4=;
 b=xCThQF9j9WJV2twMCSrOJ/K6+x4kw2m8p+kRolat3HFsk9IIsKU92V2z37tcreRYN5
 cq+OspisPoMn+ye9MyIsh5pHmO/2p6FJoYB9Vp1DSQNUV3QeuvOw+R1F0AEHhVbnnCL4
 KodqWMX1zwYtnLkzJ4ZMJ9nVs28AzNo4OivNgf78N/c5eaadRMAJZvB+bctEqz9uM+Ub
 ohIkissSXegqi1Ea+k45F3jPTrz441OhD2QPveyFOBFKEaQe1h/bXzpC1DxGjSClMHh/
 eB8RRuy/ylghzZzZxHsQj2gI4O4aJEuQLADve9/1zaX2T2UZVyVXkmUQeNMUOiM9M1EP
 jU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MwXCd4JlIEnX1jwiKrIwLEF3yNPJI5fsZD+MBCO9rh4=;
 b=TErrlABbDSTN35IMbnUg1XhAcf7lISiVo/3bNOif5k7xCcs/gpthGBAIspHExmJh4K
 Yvj1M2CQ9R1eCA9AV9y1cXLLgBwTvWECFQGYrBuGewlWB14Cn9cqTqnzuKHDBtLexP4e
 V9QE4UcPvImQHVQ+1ID00NTFKtSHCwllHgkMiYNqrFY+cfVS6LmrLAh8tQRAT0EvfFWq
 RD2cJIhuVSDC+P6sdHcVAGM284uVG+KKZuq4RA93dUm7/9gKd5mkowYY+mZr+YtZbd7n
 dUMqZKWnr7HORr4ExFFO9+Q8Yl9PCNuHNFzxh2ZPQq8aH4u1rRgDcH6Kuv7j+MqtKKqq
 PA8g==
X-Gm-Message-State: AOAM533iVp+tGb1TsGLtKKop/O4bdqFft4VJh0Mya6GrZB7AVe9a0ySP
 90dqoJNI1NEqA+3q1Ncvh//RnA==
X-Google-Smtp-Source: ABdhPJy1RwDN/m9jg+A9qYwMluwwduJZWzXy3HwBNPXKtLEvWArjFsopb3aGLatZFurJ7dtCzxHQRQ==
X-Received: by 2002:a1c:b4c4:: with SMTP id d187mr297453wmf.38.1610392811841; 
 Mon, 11 Jan 2021 11:20:11 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:20:11 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 32/40] drm/amd/display/dc/dce110/Makefile: Ignore
 -Woverride-init warning
Date: Mon, 11 Jan 2021 19:19:18 +0000
Message-Id: <20210111191926.3688443-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlMTEwL2RjZTExMF9yZXNvdXJjZS5jOjY2OgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vaW5jbHVkZS9hc2ljX3JlZy9kY2UvZGNlXzExXzBfc2hfbWFzay5oOjU5MzY6NTE6IHdhcm5p
bmc6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRdCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29k
ZXIuaDoxMTY6MTY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhESUdfRkVfQ05UTF9f
RElHX1NURVJFT1NZTkNfU0VMRUNUX19TSElGVOKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX3N0cmVhbV9lbmNvZGVyLmg6MzA2OjI6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhTRV9TRuKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3Jlc291cmNlLmM6MjcyOjM6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhTRV9DT01NT05fTUFTS19TSF9MSVNUX0RDRTExMOKAmQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5jbHVkZS9hc2ljX3JlZy9kY2UvZGNlXzEx
XzBfc2hfbWFzay5oOjU5MzY6NTE6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9uIGZvciDigJhz
ZV9zaGlmdC5ESUdfU1RFUkVPU1lOQ19TRUxFQ1TigJkpCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29kZXIuaDoxMTY6MTY6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhESUdfRkVfQ05UTF9fRElHX1NURVJFT1NZTkNfU0VM
RUNUX19TSElGVOKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UvZGNlX3N0cmVhbV9lbmNvZGVyLmg6MzA2OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhTRV9TRuKAmQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9k
Y2UxMTAvZGNlMTEwX3Jlc291cmNlLmM6MjcyOjM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhTRV9DT01NT05fTUFTS19TSF9MSVNUX0RDRTExMOKAmQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vaW5jbHVkZS9hc2ljX3JlZy9kY2UvZGNlXzExXzBfc2hfbWFzay5oOjU5Mzg6
NTI6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWlu
aXRdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZS9kY2Vfc3Ry
ZWFtX2VuY29kZXIuaDoxMTY6MTY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhESUdf
RkVfQ05UTF9fRElHX1NURVJFT1NZTkNfR0FURV9FTl9fU0hJRlTigJkKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9zdHJlYW1fZW5jb2Rlci5oOjMwNzoy
OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYU0VfU0bigJkKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9yZXNvdXJjZS5jOjI3Mjoz
OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYU0VfQ09NTU9OX01BU0tfU0hfTElTVF9E
Q0UxMTDigJkKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2luY2x1ZGUvYXNpY19yZWcv
ZGNlL2RjZV8xMV8wX3NoX21hc2suaDo1OTM4OjUyOiBub3RlOiAobmVhciBpbml0aWFsaXphdGlv
biBmb3Ig4oCYc2Vfc2hpZnQuRElHX1NURVJFT1NZTkNfR0FURV9FTuKAmSkKCiBOQjogU25pcHBl
ZCBmb3IgYnJldml0eQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29t
PgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZTExMC9NYWtlZmlsZSB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNlMTEwL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9N
YWtlZmlsZQppbmRleCBkNTY0YzBlYjhiMDQ1Li44NGFiNDhkZjBjMjYxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL01ha2VmaWxlCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvTWFrZWZpbGUKQEAgLTIzLDYgKzIzLDgg
QEAKICMgTWFrZWZpbGUgZm9yIHRoZSAnY29udHJvbGxlcicgc3ViLWNvbXBvbmVudCBvZiBEQUwu
CiAjIEl0IHByb3ZpZGVzIHRoZSBjb250cm9sIGFuZCBzdGF0dXMgb2YgSFcgQ1JUQyBibG9jay4K
IAorQ0ZMQUdTXyQoQU1EREFMUEFUSCkvZGMvZGNlMTEwL2RjZTExMF9yZXNvdXJjZS5vID0gJChj
YWxsIGNjLWRpc2FibGUtd2FybmluZywgb3ZlcnJpZGUtaW5pdCkKKwogRENFMTEwID0gZGNlMTEw
X3RpbWluZ19nZW5lcmF0b3IubyBcCiBkY2UxMTBfY29tcHJlc3Nvci5vIGRjZTExMF9od19zZXF1
ZW5jZXIubyBkY2UxMTBfcmVzb3VyY2UubyBcCiBkY2UxMTBfb3BwX3JlZ2FtbWFfdi5vIGRjZTEx
MF9vcHBfY3NjX3YubyBkY2UxMTBfdGltaW5nX2dlbmVyYXRvcl92Lm8gXAotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
