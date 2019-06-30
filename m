Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC495AFDC
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 15:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC1189BDB;
	Sun, 30 Jun 2019 13:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4855689BDB;
 Sun, 30 Jun 2019 13:15:43 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id y57so11737353qtk.4;
 Sun, 30 Jun 2019 06:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mEzPtMffhPHV0FxDwTzEclet158kha7XkJ5YHK6YGrM=;
 b=dFQprJ6MazNgSbfVVGpTfKXJJ1z59v+6xWrQVqnErOYV0iZawXZ4B/bbiuchxtdmoP
 VGMswwopaVgifylT+D6/gRnow8heeM3HYKByzXRjVYR3Yydzofbm/J3rydL0U/rolgiF
 8gJurP8hUBs2CcHc4NgDemA4kZSgZmsPtABHdr+9cRvQ+HsGaQasEWhiSOEure5SiK/s
 xWu9MT4zm3YmcwbJTPe43fLodKV8I9dDRtsyxCNAq3+3bbkNEmhX0IzT2CWGbp5/NYZS
 9/PGQ8TOzHAqHB2OPqVb4tpOcHj/hCrgfySpwL1DzqJhJ/sY3hfB3d2D2dSw7HyH3uhZ
 7yYQ==
X-Gm-Message-State: APjAAAW/gAjGy9J54azC51T5Lfp4kzsJ+g0zxwYEOGSVstHGfPiazH9g
 abiLGREthRDaKskn3qIGGq1tCLxmJGw=
X-Google-Smtp-Source: APXvYqyDq4MvjL+oGz+qUyrAIGQgTbk/k+i9zOPhBNpiznZsapMswdBFKWUry8EmSqHa3BJzQDhSuQ==
X-Received: by 2002:ac8:27d4:: with SMTP id x20mr15644764qtx.138.1561900542179; 
 Sun, 30 Jun 2019 06:15:42 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id j2sm3739582qtb.89.2019.06.30.06.15.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 06:15:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/dpu: remove dpu_mdss:hwversion
Date: Sun, 30 Jun 2019 06:14:42 -0700
Message-Id: <20190630131445.25712-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630131445.25712-1-robdclark@gmail.com>
References: <20190630131445.25712-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mEzPtMffhPHV0FxDwTzEclet158kha7XkJ5YHK6YGrM=;
 b=d+kYvh8Xqr+lWHcL4DtqWWfN1709bXLKGGulNTkdMCjBSUfDOWICNG7i8GxwmUv/HX
 WZz3Yes8gDkloACATjJ3MwvmgsXcGUxkdTLUccfui75XYcMs4OJcJ3EVbkhiT5Yzp+p6
 oEgIBXbAzwkGyzixeEv5y0KLo9LFUkrkSh4lR4erSkhGGh8wmG0PRhfr7RXo56RSgl22
 5JKNfuOtdwg7tLaHkKLE63qAXkyUnkB2NsQd5kb/j3BRkoYBKacDlbQ3d4nS8yBm0qr9
 8xy3bE3KOhmlLkqJJeU3BjnxpTTaUBd0I4UOYRWtbSVUNBPC7heU+BcNNDC3co+J7EyU
 KQDw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Jayant Shekhar <jshekhar@codeaurora.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVW51c2VkIGFuZCB0aGUg
ZXh0cmEgcnBtIGdldC9wdXQgaW50ZXJmZXJlcyB3aXRoIGhhbmRvdmVyIGZyb20KYm9vdGxvYWRl
ciAoaWUuIGhhcHBlbnMgYmVmb3JlIHdlIGhhdmUgYSBjaGFuY2UgdG8gY2hlY2sgaWYKdGhpbmdz
IGFyZSBhbHJlYWR5IGVuYWJsZWQpLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xh
cmtAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9t
ZHNzLmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X21kc3MuYwppbmRleCA5ODY5MTViYmJjMDIuLmU4M2Rk
NGM2ZWM1OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X21k
c3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jCkBAIC0y
Miw3ICsyMiw2IEBAIHN0cnVjdCBkcHVfbWRzcyB7CiAJc3RydWN0IG1zbV9tZHNzIGJhc2U7CiAJ
dm9pZCBfX2lvbWVtICptbWlvOwogCXVuc2lnbmVkIGxvbmcgbW1pb19sZW47Ci0JdTMyIGh3dmVy
c2lvbjsKIAlzdHJ1Y3QgZHNzX21vZHVsZV9wb3dlciBtcDsKIAlzdHJ1Y3QgZHB1X2lycV9jb250
cm9sbGVyIGlycV9jb250cm9sbGVyOwogCXN0cnVjdCBpY2NfcGF0aCAqcGF0aFsyXTsKQEAgLTI4
NywxMCArMjg2LDYgQEAgaW50IGRwdV9tZHNzX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikK
IAogCWRwdV9tZHNzX2ljY19yZXF1ZXN0X2J3KHByaXYtPm1kc3MpOwogCi0JcG1fcnVudGltZV9n
ZXRfc3luYyhkZXYtPmRldik7Ci0JZHB1X21kc3MtPmh3dmVyc2lvbiA9IHJlYWRsX3JlbGF4ZWQo
ZHB1X21kc3MtPm1taW8pOwotCXBtX3J1bnRpbWVfcHV0X3N5bmMoZGV2LT5kZXYpOwotCiAJcmV0
dXJuIHJldDsKIAogaXJxX2Vycm9yOgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
