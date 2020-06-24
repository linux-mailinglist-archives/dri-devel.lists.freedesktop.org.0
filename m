Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE86207692
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF276EB90;
	Wed, 24 Jun 2020 15:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1086EB8F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:04:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z13so2632150wrw.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ss7PoxbYLKDr3LBMlu1h9z6F9Bwyl8YcpPLuuDtA3OM=;
 b=zQRqE+UPlzudn+/cNp26hST9pkqlAF/Roysjl/ZK7hSOKrbhU0+ps/0hPMPZsbtq/y
 7wkqhhZfdcOFJBlLfaVIq6w0vtexOBLwbp/pjJGSxtLakMB6+zk27rhGv9J+ON8zZ6kn
 fzdXdcthiNFm1fkpxraeMNnxwh/t26zQo4S5e/5NFtzLHCzm4EadHFojnWIy7JuQe9cK
 6ySZiZs6+kQpTsrLLTyxUW9nVNMXkbf3Ry1jJreYdNgKWyGYrXJxBMXhSJlWyVkmkG+7
 0TNrihNQNOQlLEAzLWkhnniT+Ri1c30kv54Kd4HYaALy++kosXWN5+toAf8VcB8ifg3z
 Us4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ss7PoxbYLKDr3LBMlu1h9z6F9Bwyl8YcpPLuuDtA3OM=;
 b=RFc5aIhGC+oE41VInpGCfDife9LM2KakLwBF6h1y2wA52UR4QWiBccQAvOaEmnTLAS
 DeXNOBxs5b2GP6WPiZc/1bwY3Qg6OTMmtm+34XugSJpyKexwO7yUHqi8M9eFbJMSwnxK
 LUruawxL4cMFTsMTGEwEIkU62nXxezqRN5tqqN7b+eNck3EN5hqbyqvOxvJ/Mo/YPBJH
 mmUQwOWZOn0BG+uEF5kx0vow2JG36FGj86TedOrg66+NJDdpsVisz6ncaMRwS4OYoQGR
 R1Ovt40bkNjV98U+X9Jl9ZkrjWp7ueQFnJft1QytJlm3Mltf8tCrdZRirEg8uTs71yR4
 4Lcg==
X-Gm-Message-State: AOAM532WpWdy8dU6Mnkv5M5H7sP5TbHTo1Le9283P+2MnfK/UMxVAALF
 0i1/wD2Z7sJBF8oZVH6K+fknJpwOuxM=
X-Google-Smtp-Source: ABdhPJyBKk6kJ02PvMM7Uyi6GPyHgQUfHnlBQcJ7n1r9LSHJv+EmY6svcQnxsVdBuisOhIR5XeqR9A==
X-Received: by 2002:a5d:6a07:: with SMTP id m7mr32024458wru.324.1593011089754; 
 Wed, 24 Jun 2020 08:04:49 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:04:49 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 7/8] backlight: lm3630a_bl: Remove invalid checks for unsigned
 int < 0
Date: Wed, 24 Jun 2020 15:57:20 +0100
Message-Id: <20200624145721.2590327-8-lee.jones@linaro.org>
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
 linux-kernel@vger.kernel.org, Daniel Jeong <gshark.jeong@gmail.com>,
 LDD MLP <ldd-mlp@list.ti.com>, stable@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dW5zaWduZWQgaW50cyAnc291cmNlcycgYW5kICdiYW5rJyBjYW5ub3QgYmUgbGVzcyB0aGFuIExN
MzYzMEFfU0lOS18wICgwKQphbmQgTE0zNjMwQV9CQU5LXzAgKDApIHJlc3BlY2l0aXZlbHksIHNv
IGNoYW5nZSB0aGUgbG9naWMgdG8gb25seSBjaGVjawpmb3IgdGhpZXIgdHdvIHBvc3NpYmxlIHZh
bGlkIHZhbHVlcy4KCkZpeGVzIFc9MSB3YXJuaW5nczoKCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9sbTM2MzBhX2JsLmM6IEluIGZ1bmN0aW9uIOKAmGxtMzYzMGFfcGFyc2VfbGVkX3NvdXJjZXPi
gJk6CiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmM6Mzk0OjE4OiB3YXJuaW5n
OiBjb21wYXJpc29uIG9mIHVuc2lnbmVkIGV4cHJlc3Npb24gPCAwIGlzIGFsd2F5cyBmYWxzZSBb
LVd0eXBlLWxpbWl0c10KIDM5NCB8IGlmIChzb3VyY2VzW2ldIDwgTE0zNjMwQV9TSU5LXzAgfHwg
c291cmNlc1tpXSA+IExNMzYzMEFfU0lOS18xKQogfCBeCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9sbTM2MzBhX2JsLmM6IEluIGZ1bmN0aW9uIOKAmGxtMzYzMGFfcGFyc2VfYmFua+KAmToKIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYzo0MTU6MTE6IHdhcm5pbmc6IGNvbXBh
cmlzb24gb2YgdW5zaWduZWQgZXhwcmVzc2lvbiA8IDAgaXMgYWx3YXlzIGZhbHNlIFstV3R5cGUt
bGltaXRzXQogNDE1IHwgaWYgKGJhbmsgPCBMTTM2MzBBX0JBTktfMCB8fCBiYW5rID4gTE0zNjMw
QV9CQU5LXzEpCiB8IF4KCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KQ2M6IEJhcnRsb21p
ZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KQ2M6IERhbmllbCBK
ZW9uZyA8Z3NoYXJrLmplb25nQGdtYWlsLmNvbT4KQ2M6IExERCBNTFAgPGxkZC1tbHBAbGlzdC50
aS5jb20+ClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2xtMzYzMGFfYmwuYwppbmRleCBlZTMyMDg4M2I3MTA4Li5lODhhMmIwZTU5MDQ2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKKysrIGIvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCkBAIC0zOTEsNyArMzkxLDcgQEAgc3RhdGlj
IGludCBsbTM2MzBhX3BhcnNlX2xlZF9zb3VyY2VzKHN0cnVjdCBmd25vZGVfaGFuZGxlICpub2Rl
LAogCQlyZXR1cm4gcmV0OwogCiAJZm9yIChpID0gMDsgaSA8IG51bV9zb3VyY2VzOyBpKyspIHsK
LQkJaWYgKHNvdXJjZXNbaV0gPCBMTTM2MzBBX1NJTktfMCB8fCBzb3VyY2VzW2ldID4gTE0zNjMw
QV9TSU5LXzEpCisJCWlmIChzb3VyY2VzW2ldICE9IExNMzYzMEFfU0lOS18wICYmIHNvdXJjZXNb
aV0gIT0gTE0zNjMwQV9TSU5LXzEpCiAJCQlyZXR1cm4gLUVJTlZBTDsKIAogCQlyZXQgfD0gQklU
KHNvdXJjZXNbaV0pOwpAQCAtNDEyLDcgKzQxMiw3IEBAIHN0YXRpYyBpbnQgbG0zNjMwYV9wYXJz
ZV9iYW5rKHN0cnVjdCBsbTM2MzBhX3BsYXRmb3JtX2RhdGEgKnBkYXRhLAogCWlmIChyZXQpCiAJ
CXJldHVybiByZXQ7CiAKLQlpZiAoYmFuayA8IExNMzYzMEFfQkFOS18wIHx8IGJhbmsgPiBMTTM2
MzBBX0JBTktfMSkKKwlpZiAoYmFuayAhPSBMTTM2MzBBX0JBTktfMCAmJiBiYW5rICE9IExNMzYz
MEFfQkFOS18xKQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCWxlZF9zb3VyY2VzID0gbG0zNjMwYV9w
YXJzZV9sZWRfc291cmNlcyhub2RlLCBCSVQoYmFuaykpOwotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
