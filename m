Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2415934175E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9D06E9B0;
	Fri, 19 Mar 2021 08:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14F06E9A8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:50 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id k10so8283849ejg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTcc77PaUiGKf9phoAd/vzPQm0tz3YbgYP/6lveIZh4=;
 b=o76YDBB9GOGYLe4KosrUgxOBNbMHyVlSzUKKNYctBr1a+nJl39FsRZBjx1MUrCV60z
 G02VKl9741zmmRXVAMB9v+F/VyHIHhwpPx1ssPPESKP0k2Qh2yuji6ZU8S0vaapOLjeO
 tvdsbLtjE0hYM4zorjaqD1iE1Lf8d+9uMi+DM4AeDSFKF6b3BYqNNUG5znwLuJ7lICpM
 fprqwrsIvtynzXDtKCXAZkIggamTvNoH2UPXAjK6JOzLwpydN/t7VEghUfqBQr+v6LeX
 jIup1bHTfmcMgRVhge9WozkrF9w0IvoRiy/3Yke03HQoKu28B+bVdjggc263BREr6fN4
 2pAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTcc77PaUiGKf9phoAd/vzPQm0tz3YbgYP/6lveIZh4=;
 b=M1wE3knxZ2zZm1wmgn6fw1zTD05YikOrbFuEA0j3AnShcmzbUVCRB+xrVkabW+J2/X
 j30MSOAGQ7cmSOvsNukstAlMS5/fzqv8HJThOJ0cnkrs8IySe6xBANM3oJNCmiGPUyam
 4/JPqgDDUK9BQIcFOwU3gTqrjmXm9cqQijKqTWLl+OYmS6lzYQ+TsSRrDefhtSQy/j4f
 ZorR6EXfD9SOaQb+BrQgnOFVmD+fiu+oOlng5kWUBolH8wxm+hfAwFP/GQnQoCGJNVRz
 2RyZfnz5XBS45O0eQqsmNaiYs0ZjUfFMyUIlcibKSUlnSdDfiD4GU2P8w0DVrLezsxbE
 vD1g==
X-Gm-Message-State: AOAM531E2BYmTP/PMixptqFuz20gHGf+v0jss/o7Bd+DJXsn77zZuJd7
 B3u68LKeImlup74q3U1hIwEr9g==
X-Google-Smtp-Source: ABdhPJyt9WxjA2yF5MI7zF3j6iSLZCsXBYIAvwMV8pLBKOdVRXhhE0rbhZoXP7z5g87BfNLkKLNk6A==
X-Received: by 2002:a17:907:76c7:: with SMTP id
 kf7mr2949578ejc.470.1616142289588; 
 Fri, 19 Mar 2021 01:24:49 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:49 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/19] drm/nouveau/nouveau_svm: Remove unused variable 'ret'
 from void function
Date: Fri, 19 Mar 2021 08:24:27 +0000
Message-Id: <20210319082428.3294591-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYzogSW4gZnVuY3Rpb24g4oCYbm91dmVhdV9w
Zm5zX21hcOKAmToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmM6ODEwOjY6
IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IG5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0u
YyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKaW5kZXggMWMzZjg5MDM3N2Qy
Yy4uMjZhZjZlZTkxNTM2OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9zdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCkBA
IC04MTEsNyArODExLDYgQEAgbm91dmVhdV9wZm5zX21hcChzdHJ1Y3Qgbm91dmVhdV9zdm1tICpz
dm1tLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAkJIHVuc2lnbmVkIGxvbmcgYWRkciwgdTY0ICpw
Zm5zLCB1bnNpZ25lZCBsb25nIG5wYWdlcykKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9wZm5tYXBfYXJn
cyAqYXJncyA9IG5vdXZlYXVfcGZuc190b19hcmdzKHBmbnMpOwotCWludCByZXQ7CiAKIAlhcmdz
LT5wLmFkZHIgPSBhZGRyOwogCWFyZ3MtPnAuc2l6ZSA9IG5wYWdlcyA8PCBQQUdFX1NISUZUOwpA
QCAtODE5LDggKzgxOCw4IEBAIG5vdXZlYXVfcGZuc19tYXAoc3RydWN0IG5vdXZlYXVfc3ZtbSAq
c3ZtbSwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJbXV0ZXhfbG9jaygmc3ZtbS0+bXV0ZXgpOwog
CiAJc3ZtbS0+dm1tLT52bW0ub2JqZWN0LmNsaWVudC0+c3VwZXIgPSB0cnVlOwotCXJldCA9IG52
aWZfb2JqZWN0X2lvY3RsKCZzdm1tLT52bW0tPnZtbS5vYmplY3QsIGFyZ3MsIHNpemVvZigqYXJn
cykgKwotCQkJCW5wYWdlcyAqIHNpemVvZihhcmdzLT5wLnBoeXNbMF0pLCBOVUxMKTsKKwludmlm
X29iamVjdF9pb2N0bCgmc3ZtbS0+dm1tLT52bW0ub2JqZWN0LCBhcmdzLCBzaXplb2YoKmFyZ3Mp
ICsKKwkJCSAgbnBhZ2VzICogc2l6ZW9mKGFyZ3MtPnAucGh5c1swXSksIE5VTEwpOwogCXN2bW0t
PnZtbS0+dm1tLm9iamVjdC5jbGllbnQtPnN1cGVyID0gZmFsc2U7CiAKIAltdXRleF91bmxvY2so
JnN2bW0tPm11dGV4KTsKLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
