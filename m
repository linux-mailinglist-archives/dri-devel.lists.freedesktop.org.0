Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580FA2F4D9B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520D56EA67;
	Wed, 13 Jan 2021 14:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586206EA5F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:42 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d26so2386070wrb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K8LGsHawy1FykMfSNgFdlsHpkSijq6aQuT4rYUHFPB4=;
 b=vlfUbYCaI8nbSGsNOrvP4jNkRNNQft4Td7Q/qK7df3eMXHJiNDMJ7WqrL+lctbGzof
 irvEGx52lUUHqOlSxdne5KYtvcv637NvMYUh46CWn0hYxBYGrnYgpxsFeL+hxHB7aXZz
 nKEugO/vNXJaQpOyOYQD1cz7XxScABklnzNnXh+KI5q1rPET24SGQL0t9lgX19e+C7fR
 eFsxphGPTVhjYYo/VvE2TbVEkj/Dq8F69zcFARqN+rtlR6zQXNuUSLhFlkcsV/wpyhQh
 1eMd62z5eauJMxNi8y0gGmRjshelxQz5tkvi3VyP8GGcTFLF5ZpE7yXf3E7Hveu5aQgK
 93FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K8LGsHawy1FykMfSNgFdlsHpkSijq6aQuT4rYUHFPB4=;
 b=YaCeUaJYoqxSG7G7snDPyD4tT1c4x4NVjoCcQ1IkHWjOD/dV3RENwRBcwTD3G7ur+N
 s/+Zsu4S8hNh84QmgIKUFEm720DxYpTNbRTty0dWff72N7oLqy3d+XF8OHKlwY9GGWgb
 byWRp+fjjTMsybkjY2q6XZrQkoy8WzODMNYJEV414CxA5KjSuXVdCX5/PH4veVitoI60
 F+l3ASSmZVR8eFTSrX+sAZcVGjxjJplAv0u7gP/DJOYggO4KWh43D9dEKexU4l862K2s
 wJ1Q8SVMJsWouOZDN+1KJHbC3B7fNH74t3hE3O1ZwGDxp2ptooq7BEgEnk+cm6rjXLJ+
 0hFg==
X-Gm-Message-State: AOAM533glzDVvIoBiFywsWlBW/8AtSVDeQFayqkFhzCthVRb45L61Fq0
 hJb0TTGGUYRiMC4SS96Qhrq0s7nxa8PNADq0
X-Google-Smtp-Source: ABdhPJwDJgxU/PSj6fZ35ddRgyivt16zN5Q0Jj9wVZXocDRBHdXbn58OnsQtAexupAPNKExN9UaOeg==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr3188792wro.244.1610549441019; 
 Wed, 13 Jan 2021 06:50:41 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/31] video: fbdev: neofb: Remove unused variable 'CursorMem'
Date: Wed, 13 Jan 2021 14:49:56 +0000
Message-Id: <20210113145009.1272040-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, "Thomas J. Moore" <dark@mama.indstate.edu>,
 Evgeny Novikov <novikov@ispras.ru>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Oliver Kropp <dok@directfb.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi9uZW9mYi5jOiBJbiBmdW5jdGlvbiDigJhuZW9faW5pdF9od+KAmToKIGRy
aXZlcnMvdmlkZW8vZmJkZXYvbmVvZmIuYzoxODQ2OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmEN1
cnNvck1lbeKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoK
Q2M6IEV2Z2VueSBOb3Zpa292IDxub3Zpa292QGlzcHJhcy5ydT4KQ2M6IE1pa2UgUmFwb3BvcnQg
PHJwcHRAa2VybmVsLm9yZz4KQ2M6IE9saXZlciBLcm9wcCA8ZG9rQGRpcmVjdGZiLm9yZz4KQ2M6
ICJUaG9tYXMgSi4gTW9vcmUiIDxkYXJrQG1hbWEuaW5kc3RhdGUuZWR1PgpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnClNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVy
cy92aWRlby9mYmRldi9uZW9mYi5jIHwgNSAtLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9uZW9mYi5jIGIvZHJpdmVy
cy92aWRlby9mYmRldi9uZW9mYi5jCmluZGV4IDA5YTIwZDRhYjM1ZjIuLmJlYzE5OWEzNDAzN2Ug
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbmVvZmIuYworKysgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L25lb2ZiLmMKQEAgLTE4NDMsNyArMTg0Myw2IEBAIHN0YXRpYyBpbnQgbmVvX2lu
aXRfaHcoc3RydWN0IGZiX2luZm8gKmluZm8pCiAJc3RydWN0IG5lb2ZiX3BhciAqcGFyID0gaW5m
by0+cGFyOwogCWludCB2aWRlb1JhbSA9IDg5NjsKIAlpbnQgbWF4Q2xvY2sgPSA2NTAwMDsKLQlp
bnQgQ3Vyc29yTWVtID0gMTAyNDsKIAlpbnQgQ3Vyc29yT2ZmID0gMHgxMDA7CiAKIAlEQkcoIm5l
b19pbml0X2h3Iik7CkBAIC0xODk1LDI2ICsxODk0LDIyIEBAIHN0YXRpYyBpbnQgbmVvX2luaXRf
aHcoc3RydWN0IGZiX2luZm8gKmluZm8pCiAJY2FzZSBGQl9BQ0NFTF9ORU9NQUdJQ19OTTIwNzA6
CiAJY2FzZSBGQl9BQ0NFTF9ORU9NQUdJQ19OTTIwOTA6CiAJY2FzZSBGQl9BQ0NFTF9ORU9NQUdJ
Q19OTTIwOTM6Ci0JCUN1cnNvck1lbSA9IDIwNDg7CiAJCUN1cnNvck9mZiA9IDB4MTAwOwogCQli
cmVhazsKIAljYXNlIEZCX0FDQ0VMX05FT01BR0lDX05NMjA5NzoKIAljYXNlIEZCX0FDQ0VMX05F
T01BR0lDX05NMjE2MDoKLQkJQ3Vyc29yTWVtID0gMTAyNDsKIAkJQ3Vyc29yT2ZmID0gMHgxMDA7
CiAJCWJyZWFrOwogCWNhc2UgRkJfQUNDRUxfTkVPTUFHSUNfTk0yMjAwOgogCWNhc2UgRkJfQUND
RUxfTkVPTUFHSUNfTk0yMjMwOgogCWNhc2UgRkJfQUNDRUxfTkVPTUFHSUNfTk0yMzYwOgogCWNh
c2UgRkJfQUNDRUxfTkVPTUFHSUNfTk0yMzgwOgotCQlDdXJzb3JNZW0gPSAxMDI0OwogCQlDdXJz
b3JPZmYgPSAweDEwMDA7CiAKIAkJcGFyLT5uZW8yMjAwID0gKE5lbzIyMDAgX19pb21lbSAqKSBw
YXItPm1taW9fdmJhc2U7CiAJCWJyZWFrOwogCX0KIC8qCi0JaW5mby0+c3ByaXRlLnNpemUgPSBD
dXJzb3JNZW07CiAJaW5mby0+c3ByaXRlLnNjYW5fYWxpZ24gPSAxOwogCWluZm8tPnNwcml0ZS5i
dWZfYWxpZ24gPSAxOwogCWluZm8tPnNwcml0ZS5mbGFncyA9IEZCX1BJWE1BUF9JTzsKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
