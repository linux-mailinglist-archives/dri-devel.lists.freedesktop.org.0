Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B25842B1C30
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2100F6E527;
	Fri, 13 Nov 2020 13:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFCE6E520
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:49:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p8so9999884wrx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wz9PYnHV1aU7HpVwR+iBYjW10NIO6mvxzzKOFF06bog=;
 b=iKoC8B6k4QLo4AWSzbSH0Yrm7UKDvnSV0l7UwGmamQfyeBV2XLjR211KOhMkiXIisO
 IDz+WNVInujhwmf9aaXfhzFILS7NiSh3vsj5eF+RfyTdnaNmjnhOkPIfyoC1ApUGpwXy
 WjRZvxDpzJ4UQJA0JvtL3ym5KMN2kwldsYCptf3xhEPtJRtR4XPPDyYl5pqVLSMfUfhq
 DKcTM3MotgxZzP7gCG+T4LVpjHTH4qh5JMszYbGsrHS6tba1wEO/qGVRjpDHN7gpbP/n
 +OqfOZ0mM+GGy3ezTwuagbFHABQCfou0M/gz0pVp3T/IYK9BBrP4AQwSBVx84X7GP6hc
 aWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wz9PYnHV1aU7HpVwR+iBYjW10NIO6mvxzzKOFF06bog=;
 b=JGd72D97pD1/sCfU4ePcqt8H8yzfRgoRVLzMVhC1aMYwV0ZxLa2jRfUMEwa2MR9QX2
 Ypn3KENnJHtjb/857c5jOBTx3S43NRNYI3o6osfFXg5Kg9UHptGkS1m21u4DFN3ymuop
 QZpgP9iKXsYOxefBCY8KFViEh60HSHTmA8hzHfbKVDz7JUq4VmcZB7J9LYts92W2TQqo
 7udXQk16QoLH2shHmg9kKu0FvI6Ub4Yc8e9NChkh5GCbB/BXNsNpcLcoze09GGRDVy/6
 9gMFzA/oOio/rrSca0DSl14CBg7Su/uy8M7WlUsrbIFr0SYcFH1em5KNFmlXlXhE9Rxq
 w5TA==
X-Gm-Message-State: AOAM533sc7zSP+BkywHglG5hEJjBohWQ5ZHw8ktzGVKXwIV9FjW23cR3
 aILXc4u3QLOq/ITQgpgTmR3Biw==
X-Google-Smtp-Source: ABdhPJy2NJmUUpRfSID2bkr8Mb/olrJXjNUbUo9Ig1eRSw/0S7/jC2WzJcmll/j0ffrezB2ZJdrzug==
X-Received: by 2002:adf:f808:: with SMTP id s8mr3615775wrp.257.1605275392170; 
 Fri, 13 Nov 2020 05:49:52 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:51 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/40] drm/amd/amdgpu/amdgpu_ib: Fix some incorrect/incomplete
 function documentation
Date: Fri, 13 Nov 2020 13:49:06 +0000
Message-Id: <20201113134938.4004947-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmM6NjY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2FkZXYnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9pYl9nZXQn
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYzo2Njogd2FybmluZzogRnVu
Y3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndm0nIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9p
Yl9nZXQnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYzo2Njogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncG9vbF90eXBlJyBub3QgZGVzY3JpYmVk
IGluICdhbWRncHVfaWJfZ2V0JwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2li
LmM6NjY6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3JpbmcnIGRlc2NyaXB0
aW9uIGluICdhbWRncHVfaWJfZ2V0JwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2liLmM6MTI1OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdyaW5nJyBu
b3QgZGVzY3JpYmVkIGluICdhbWRncHVfaWJfc2NoZWR1bGUnCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaWIuYzoxMjU6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ2pvYicgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X2liX3NjaGVkdWxlJwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmM6MTI1OiB3YXJuaW5nOiBFeGNlc3MgZnVu
Y3Rpb24gcGFyYW1ldGVyICdhZGV2JyBkZXNjcmlwdGlvbiBpbiAnYW1kZ3B1X2liX3NjaGVkdWxl
JwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGlu
YXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIHwgNiArKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYwppbmRleCAyZjUzZmEwYWU5YTYyLi5jNjlhZjliODZj
YzYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYwpAQCAtNTIsOCArNTIs
MTAgQEAKIC8qKgogICogYW1kZ3B1X2liX2dldCAtIHJlcXVlc3QgYW4gSUIgKEluZGlyZWN0IEJ1
ZmZlcikKICAqCi0gKiBAcmluZzogcmluZyBpbmRleCB0aGUgSUIgaXMgYXNzb2NpYXRlZCB3aXRo
CisgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKiBAdm06IGFtZGdwdV92bSBwb2lu
dGVyCiAgKiBAc2l6ZTogcmVxdWVzdGVkIElCIHNpemUKKyAqIEBwb29sX3R5cGU6IElCIHBvb2wg
dHlwZSAoZGVsYXllZCwgaW1tZWRpYXRlLCBkaXJlY3QpCiAgKiBAaWI6IElCIG9iamVjdCByZXR1
cm5lZAogICoKICAqIFJlcXVlc3QgYW4gSUIgKGFsbCBhc2ljcykuICBJQnMgYXJlIGFsbG9jYXRl
ZCB1c2luZyB0aGUKQEAgLTEwMSw3ICsxMDMsNyBAQCB2b2lkIGFtZGdwdV9pYl9mcmVlKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X2liICppYiwKIC8qKgogICogYW1k
Z3B1X2liX3NjaGVkdWxlIC0gc2NoZWR1bGUgYW4gSUIgKEluZGlyZWN0IEJ1ZmZlcikgb24gdGhl
IHJpbmcKICAqCi0gKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKiBAcmluZzogcmlu
ZyBpbmRleCB0aGUgSUIgaXMgYXNzb2NpYXRlZCB3aXRoCiAgKiBAbnVtX2liczogbnVtYmVyIG9m
IElCcyB0byBzY2hlZHVsZQogICogQGliczogSUIgb2JqZWN0cyB0byBzY2hlZHVsZQogICogQGY6
IGZlbmNlIGNyZWF0ZWQgZHVyaW5nIHRoaXMgc3VibWlzc2lvbgotLSAKMi4yNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
