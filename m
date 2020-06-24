Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DF3207693
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9063C6EB8E;
	Wed, 24 Jun 2020 15:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B316EB8F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:04:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l2so1373814wmf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kCGt1BLBXUDbnvT6cymu5MVAxH+kTuMsl5c+6aP/lLY=;
 b=jMGyaf2YOvnwdGALr7/G0emGXXMlzRVlYnFPWVRjaQMIqVwugRAnJc3hlq5hiW8h5c
 UlNYM5fXvpEjkCbgvKcR0hRU6Z7v6cS74QrqdBYQQwaf72KYCZRj32ckrnmu0aG5wzCh
 oQv/67iegU98VlySub1xjGVNx32ddSLk55uKDXkUIrvbzXltQVC60J2oVznaWMR03k3X
 c88NZ/cwdn2lcyWwoIaMvjTZKlgnZ3OueIPy8vYEViLHA8IFnXW05jOkLP4xaKWjAreX
 6dOPEbwj+fmCGzpLHvYH0loVrVQGULW0wojhwots1TLiid7Psoh58sITpdd5KWwWa8ll
 /faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kCGt1BLBXUDbnvT6cymu5MVAxH+kTuMsl5c+6aP/lLY=;
 b=Wt+pNtG762yBu0fSFI4lp3SzNARPMenUxCL9m/YVxHwuRB30zrZBM1SCF8wgoR/H/0
 whdKxwe4ApdvUPDq5oXXAxDlmi83pit8Cjpu2M8NGxgRXf4g2xELxDbZMgAUKpzmhNuO
 MvKyzC2QvPOj6AIVqBkYm43pIN/0nHbyTQ3SEeMRw/BSRUdgAiWpSeBpe47RNVDn1qO1
 xnJ4uzrm9QFhhCTfbGJlv3RYxofmX6Y6cUYVdkOO7vedYorVX/eWDbBWIjF/56te9gCx
 K4gq7Tfr77fkXtaFUDzno75PbVYzoPdwk5pMDWtc6nk4La0O3hAd9TfOuqfAGyD4jpq6
 +x+A==
X-Gm-Message-State: AOAM533ibTV8pblFqgPJt3W49G72RWpfcC5tH9oP4hU4z2ilx8apk4FI
 ox7ZKd3Y7pGnQOYWNvp1+luBlg==
X-Google-Smtp-Source: ABdhPJwGu9kMwIGOcSohIfYJ+NIxZfevAbg2JhUjdK0aeG9zHaTGKntdmr01NhaUWdU13TxN2I2yTw==
X-Received: by 2002:a1c:a5d6:: with SMTP id
 o205mr20552487wme.125.1593011091041; 
 Wed, 24 Jun 2020 08:04:51 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:04:50 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 8/8] backlight: qcom-wled: Remove unused configs for LED3 and
 LED4
Date: Wed, 24 Jun 2020 15:57:21 +0100
Message-Id: <20200624145721.2590327-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200624145721.2590327-1-lee.jones@linaro.org>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgVz0xIHdhcm5pbmdzOgoKIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5j
OjEyOTQ6MzQ6IHdhcm5pbmc6IOKAmHdsZWQ0X3N0cmluZ19jZmfigJkgZGVmaW5lZCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIDEyOTQgfCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHdsZWRfdmFyX2NmZyB3bGVkNF9zdHJpbmdfY2ZnID0gewogfCBefn5+fn5+fn5+fn5+fn5+
CiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYzoxMjkwOjM0OiB3YXJuaW5nOiDi
gJh3bGVkM19zdHJpbmdfY2Zn4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25z
dC12YXJpYWJsZT1dCiAxMjkwIHwgc3RhdGljIGNvbnN0IHN0cnVjdCB3bGVkX3Zhcl9jZmcgd2xl
ZDNfc3RyaW5nX2NmZyA9IHsKIHwgXn5+fn5+fn5+fn5+fn5+fgoKQ2M6IDxzdGFibGVAdmdlci5r
ZXJuZWwub3JnPgpDYzogQW5keSBHcm9zcyA8YWdyb3NzQGtlcm5lbC5vcmc+CkNjOiBCam9ybiBB
bmRlcnNzb24gPGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPgpDYzogQmFydGxvbWllaiBab2xu
aWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogbGludXgtYXJtLW1zbUB2
Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYyB8IDggLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNv
bS13bGVkLmMKaW5kZXggNGM4YzM0Yjk5NDQxNC4uYzI1YzMxMTk5OTUyYyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMKKysrIGIvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvcWNvbS13bGVkLmMKQEAgLTEyODcsMTQgKzEyODcsNiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHdsZWRfdmFyX2NmZyB3bGVkNF9zdHJpbmdfaV9saW1pdF9jZmcgPSB7CiAJLnNpemUg
PSBBUlJBWV9TSVpFKHdsZWQ0X3N0cmluZ19pX2xpbWl0X3ZhbHVlcyksCiB9OwogCi1zdGF0aWMg
Y29uc3Qgc3RydWN0IHdsZWRfdmFyX2NmZyB3bGVkM19zdHJpbmdfY2ZnID0gewotCS5zaXplID0g
OCwKLX07Ci0KLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgd2xlZF92YXJfY2ZnIHdsZWQ0X3N0cmluZ19j
ZmcgPSB7Ci0JLnNpemUgPSAxNiwKLX07Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgd2xlZF92YXJf
Y2ZnIHdsZWQ1X21vZF9zZWxfY2ZnID0gewogCS5zaXplID0gMiwKIH07Ci0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
