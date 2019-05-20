Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB722E94
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F901892CC;
	Mon, 20 May 2019 08:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABAF892EA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:23:02 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p27so22587317eda.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mUAcB3sU0dD3E/MUylEVVwC2GTKxo8rk41HcMoWy7Z0=;
 b=JtuIXKT4JC8aMR8QFLrj1dLzjWzUpswm9lbtgwn3C7W9PsCk/yt3wX7nQ3yHQll1WP
 WJFHSBdeEzSD70DY3fhHEIdNONOcZczDkTO13c2XRttqonxXFdwlgOppQxoUaiERtWFk
 txzLABg60oH5W1fajDjSlTpq+ePY/MgGIzV8AeNAZswdI1eF4jbm8jA5L+PwuFH9/qQ+
 tpyJh1CxaO1cou2P4+SEpa+MDfFZaBaqWl1d7bd7Ga0PZUrFsILDY6tL3gNi3EXBaxtF
 QbzRv9b6fg83HCSvvxEqKZYxxhK4+652UhKV0c9Z1xfksnrUtFs8CwUSsFkrbbk7LJYG
 EiMw==
X-Gm-Message-State: APjAAAXNeklXaxgJ08mIPJSMgWlqZGo3rmU/+thGWcY4arHAK/mfdMpB
 cFTylf5hjq8GCqSYwAOimApNSa+47Vc=
X-Google-Smtp-Source: APXvYqwmDqP5epoI370U4Hdjtba1pl90gO7hr4GVxPoRMkSWHnkec3B3NKvvhM8UDRNXGWDhP6Dyrg==
X-Received: by 2002:a17:906:640b:: with SMTP id
 d11mr9277783ejm.58.1558340580671; 
 Mon, 20 May 2019 01:23:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:23:00 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 33/33] staging/olpc_dcon: Add drm conversion to TODO
Date: Mon, 20 May 2019 10:22:16 +0200
Message-Id: <20190520082216.26273-34-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mUAcB3sU0dD3E/MUylEVVwC2GTKxo8rk41HcMoWy7Z0=;
 b=b8eSPbV0e6t58Jw8xSWXzI4Toz82FXOp3S4ZAblJvOrs+Gt0Ux6e3YwhDesaVOOpkg
 quvfmJTaiU4sOLD2LY4AM7vikeJ5E/6iGKfh9/1ZXhc3ogcMwk4kajLiDJsyzcQzVsde
 C/uOpN0XDilKwuLuB6fz8bZNEgU6tboLD/HoY=
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
Cc: Daniel Drake <dsd@laptop.org>, Jens Frederich <jfrederich@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGhpcyBkcml2ZXIgaXMgcHJldHR5IGhvcnJpYmxlIGZyb20gYSBkZXNpZ24gcG92LCBhbmQgbmVl
ZHMgYSBjb21wbGV0ZQpvdmVyaGF1bC4gQ29uY3JldGUgdGhpbmcgdGhhdCBhbm5veXMgbWUgaXMg
dGhhdCBpdCBsb29rcyBhdApyZWdpc3RlcmVkX2ZiLCB3aGljaCBpcyBhbiBpbnRlcm5hbCB0aGlu
ZyB0byBmYm1lbS5jIGFuZCBmYmNvbi5jLiBBbmQKb2ZjIGl0IGdldHMgdGhlIGxpZmV0aW1lIHJ1
bGVzIGFsbCB3cm9uZyAoaXQgc2hvdWxkIGF0IGxlYXN0IHVzZQpnZXQvcHV0X2ZiX2luZm8pLgoK
TG9va2luZyBhdCB0aGUgaGlzdG9yeSwgdGhlcmUncyBiZWVuIGFuIGF0dGVtcHQgYXQgZHJvcHBp
bmcgdGhpcyBmcm9tCnN0YWdpbmcgaW4gMjAxNiwgYnV0IHRoYXQgaGFkIHRvIGJlIHJldmVydGVk
LiBTaW5jZSB0aGVuIG5vdCByZWFsCmVmZm9ydCBleGNlcHQgdGhlIHVzdWFsIHN0cmVhbSBvZiB0
cml2aWFsIHBhdGNoZXMsIGFuZCBmYmRldiBoYXMgYmVlbgpmb3JtYWxseSBjbG9zZWQgZm9yIGFu
eSBuZXcgaHcgc3VwcG9ydC4gVGltZSB0byB0cnkgYWdhaW4gYW5kIGRyb3AKdGhpcz8KClNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogSmVu
cyBGcmVkZXJpY2ggPGpmcmVkZXJpY2hAZ21haWwuY29tPgpDYzogRGFuaWVsIERyYWtlIDxkc2RA
bGFwdG9wLm9yZz4KQ2M6IEpvbiBOZXR0bGV0b24gPGpvbi5uZXR0bGV0b25AZ21haWwuY29tPgot
LS0KIGRyaXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vVE9ETyB8IDcgKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9vbHBj
X2Rjb24vVE9ETyBiL2RyaXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vVE9ETwppbmRleCA2NjVhMGIw
NjE3MTkuLmZlMDllZmJjN2Y3NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL29scGNfZGNv
bi9UT0RPCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vVE9ETwpAQCAtMSw0ICsxLDEx
IEBACiBUT0RPOgorCS0gY29tcGxldGUgcmV3cml0ZToKKwkgIDEuIFRoZSB1bmRlcmx5aW5nIGZi
ZGV2IGRyaXZlcnMgbmVlZCB0byBiZSBjb252ZXJ0ZWQgaW50byBkcm0ga2VybmVsCisJICAgICBt
b2Rlc2V0dGluZyBkcml2ZXJzLgorCSAgMi4gVGhlIGRjb24gbG93LXBvd2VyIGRpc3BsYXkgbW9k
ZSBjYW4gdGhlbiBiZSBpbnRlZ3JhdGVkIHVzaW5nIHRoZQorCSAgICAgZHJtIGRhbWFnZSB0cmFj
a2luZyBhbmQgc2VsZi1yZWZyZXNoIGhlbHBlcnMuCisJICBUaGlzIGJvbHRlZC1vbiBzZWxmLXJl
ZnJlc2ggc3VwcG9ydCB0aGF0IGRpZ3MgYXJvdW5kIGluIGZiZGV2CisJICBpbnRlcm5hbHMsIGJ1
dCBpc24ndCBwcm9wZXJseSBpbnRlZ3JhdGVkLCBpcyBub3QgdGhlIGNvcnJlY3Qgc29sdXRpb24u
CiAJLSBzZWUgaWYgdng4NTUgZ3BpbyBBUEkgY2FuIGJlIG1hZGUgc2ltaWxhciBlbm91Z2ggdG8g
Y3M1NTM1IHNvIHdlIGNhbgogCSAgc2hhcmUgbW9yZSBjb2RlCiAJLSBjb252ZXJ0IGFsbCB1c2Vz
IG9mIHRoZSBvbGQgR1BJTyBBUEkgZnJvbSA8bGludXgvZ3Bpby5oPiB0byB0aGUKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
