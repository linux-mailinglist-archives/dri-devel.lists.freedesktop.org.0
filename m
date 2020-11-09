Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB3E2AD110
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1713689916;
	Tue, 10 Nov 2020 08:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E48089939
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:07:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o15so384195wru.6
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 03:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uU00Tfvm+17A7iE8x45GJfsjWZ/7CO3W5FPvjO+v7UE=;
 b=RG2F+82oEqldWg6NTKGoC7UPk0O3vTxH9eTGTjyarUGvACcl6LwiyVBskaFEt1Pqm6
 qMxcfA0KMfkW5wNV3g6IT+hgAs2iqXACJ3N3dvfqSrCeZzUAOMwEc5r60U68oM/abbdp
 BVvztISZFGbho3XV9t5SL1u/kBS3vwLpauBxX0yXvm1ttFGAsQfYFHV+KUfWm52I7cCD
 8gCnDBCe0CgXSwSibJtmk6kjahUuLaDNlL9UchomHElEtgRdetA4QUIzhJ3s2kqYQJIy
 hMGwQ19uDlTKAD9Oe+7Y24DOg21aGPiQwGkonVuLgyYUV5H0Om/MAWDetrgEg+DE7LJv
 /kLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uU00Tfvm+17A7iE8x45GJfsjWZ/7CO3W5FPvjO+v7UE=;
 b=tCUlsiSHvohCGA8LyrLEHUoWfxlLzN4igTWiBp/pJks6qTR9hCTrWYTSAsDwCBwu48
 MkucDeg589oR4dtOsz3+iae6fXF9KWoC7AxACKXVPvokAfkPxdYqtb5TesbHhtq2W2h1
 vWRJ9Ruda3FWx94a3v/Rn1XT4rhwMTmA1UUbe6a/66p2y8IQaGVSSxCer0jUrKspR1oJ
 EK7a76X5o4/gXDzK3XJxloVUprWIa7O/24JTjfoO1D3U6cgQiujvswY+xEXf+2UCKoJl
 j2DhbAw8G4qavgBzNEUOUozdeGRERDWV+r1XjCljoB0ck3d/jM1JsiKtwUMW6y++Ry95
 tjIQ==
X-Gm-Message-State: AOAM531I26tuJEOc3ZY/GBbcc6yDmvZr9KDaLTnBlQnUPbCStG5KSiW6
 80hOfcF/b9KS8Qhj2fRnHGpmEg==
X-Google-Smtp-Source: ABdhPJxqEseYvyvPu8S4NoqtIS4iNC5GkWi9kRY0f7fjCzxFROga8iAwMRGM7mBzZtGU9vsmm1Ko/Q==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr9918092wru.397.1604920035266; 
 Mon, 09 Nov 2020 03:07:15 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr.
 [2.15.39.206])
 by smtp.gmail.com with ESMTPSA id d3sm12815582wre.91.2020.11.09.03.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:07:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Robert Richter <rric@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 9/9] dma-buf: use krealloc_array()
Date: Mon,  9 Nov 2020 12:06:54 +0100
Message-Id: <20201109110654.12547-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109110654.12547-1-brgl@bgdev.pl>
References: <20201109110654.12547-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:57 +0000
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-media@vger.kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClVz
ZSB0aGUgaGVscGVyIHRoYXQgY2hlY2tzIGZvciBvdmVyZmxvd3MgaW50ZXJuYWxseSBpbnN0ZWFk
IG9mIG1hbnVhbGx5CmNhbGN1bGF0aW5nIHRoZSBzaXplIG9mIHRoZSBuZXcgYXJyYXkuCgpTaWdu
ZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29t
PgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZG1hLWJ1Zi9zeW5jX2ZpbGUuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEt
YnVmL3N5bmNfZmlsZS5jIGIvZHJpdmVycy9kbWEtYnVmL3N5bmNfZmlsZS5jCmluZGV4IDVhNWEx
ZGEwMWEwMC4uMjBkOWJkZGJiOTg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvc3luY19m
aWxlLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL3N5bmNfZmlsZS5jCkBAIC0yNzAsOCArMjcwLDcg
QEAgc3RhdGljIHN0cnVjdCBzeW5jX2ZpbGUgKnN5bmNfZmlsZV9tZXJnZShjb25zdCBjaGFyICpu
YW1lLCBzdHJ1Y3Qgc3luY19maWxlICphLAogCQlmZW5jZXNbaSsrXSA9IGRtYV9mZW5jZV9nZXQo
YV9mZW5jZXNbMF0pOwogCiAJaWYgKG51bV9mZW5jZXMgPiBpKSB7Ci0JCW5mZW5jZXMgPSBrcmVh
bGxvYyhmZW5jZXMsIGkgKiBzaXplb2YoKmZlbmNlcyksCi0JCQkJICBHRlBfS0VSTkVMKTsKKwkJ
bmZlbmNlcyA9IGtyZWFsbG9jX2FycmF5KGZlbmNlcywgaSwgc2l6ZW9mKCpmZW5jZXMpLCBHRlBf
S0VSTkVMKTsKIAkJaWYgKCFuZmVuY2VzKQogCQkJZ290byBlcnI7CiAKLS0gCjIuMjkuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
