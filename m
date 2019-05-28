Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B231D2C274
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41416E1E2;
	Tue, 28 May 2019 09:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE6E6E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:04:01 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p27so30688845eda.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ke/GY+csAQwGtKfSDgwB4In+ezGB+Eqia0Ds1dJ9YhI=;
 b=JDABejonHQLR/k6yMFhQvyTYeA6GrUnNmqj8vUFfoIjsIME1yuU5oI0r29i3BY8s7u
 2tUrZ3aycgkS7p1pCGGHcKQZOrtBVeVp9jdk34D2zIJqqKOnxUKBcSFYCv39Eu+CUvs5
 iRstcWLqXPgxgnZsjXBS527ylryAJuDpJmg1yTrGpFifbdrKUYTlBu8SX9b5xmJyWH9w
 SZP92v3IzwBJ1pzKelThoIDk+Dve7S8yFXp0qKaVuoGH0pbQQVl5c4is6PnMcop1XrYS
 qDGXQilhduUTMBWD7vaGARPQ1cc6uJtrd97eu0d/RNcIb3yJDYeAugM7g5L2WxeaA3gi
 Fe4A==
X-Gm-Message-State: APjAAAVZ8Tb3dtCz8YU9fAxjGtLocFAtyGFU3p5RU/168i5NXv7wNbfv
 FrXUERkN9iRAulvpNW3TdHhTSg==
X-Google-Smtp-Source: APXvYqyIT1ztzcC6zHzmIxYYspUIOonVQpRlZvfSL5l9bmuKi+qnlo7uboLkAwKXA1zf88XtJiIcsw==
X-Received: by 2002:a50:a4f7:: with SMTP id x52mr128123059edb.86.1559034237342; 
 Tue, 28 May 2019 02:03:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:56 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 32/33] staging/olpc_dcon: Add drm conversion to TODO
Date: Tue, 28 May 2019 11:03:03 +0200
Message-Id: <20190528090304.9388-33-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ke/GY+csAQwGtKfSDgwB4In+ezGB+Eqia0Ds1dJ9YhI=;
 b=CFU413T3RVZAG0aMmPcjs3AON0A2oxThmIVGBKOyHKD0ptGSsUcZS2vKN6Qch3X0/5
 u2hNoqtA/7YbPThjei/M2sqXZ0vMaO32NgE/qFmWbVW5wghOYRWParZNL6d+KJdt1aI1
 1hf/zAPtOYsk7o3PXzm1GIN4mR3dg0Ufxc6Ic=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Daniel Drake <dsd@laptop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jens Frederich <jfrederich@gmail.com>, linux-fbdev@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
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
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpSZXZpZXdl
ZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpBY2tlZC1ieTogR3JlZyBLcm9h
aC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KUmV2aWV3ZWQtYnk6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBHcmVn
IEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogSmVucyBGcmVk
ZXJpY2ggPGpmcmVkZXJpY2hAZ21haWwuY29tPgpDYzogRGFuaWVsIERyYWtlIDxkc2RAbGFwdG9w
Lm9yZz4KQ2M6IEpvbiBOZXR0bGV0b24gPGpvbi5uZXR0bGV0b25AZ21haWwuY29tPgotLS0KIGRy
aXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vVE9ETyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24v
VE9ETyBiL2RyaXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vVE9ETwppbmRleCA2NjVhMGIwNjE3MTku
LmZlMDllZmJjN2Y3NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL29scGNfZGNvbi9UT0RP
CisrKyBiL2RyaXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vVE9ETwpAQCAtMSw0ICsxLDExIEBACiBU
T0RPOgorCS0gY29tcGxldGUgcmV3cml0ZToKKwkgIDEuIFRoZSB1bmRlcmx5aW5nIGZiZGV2IGRy
aXZlcnMgbmVlZCB0byBiZSBjb252ZXJ0ZWQgaW50byBkcm0ga2VybmVsCisJICAgICBtb2Rlc2V0
dGluZyBkcml2ZXJzLgorCSAgMi4gVGhlIGRjb24gbG93LXBvd2VyIGRpc3BsYXkgbW9kZSBjYW4g
dGhlbiBiZSBpbnRlZ3JhdGVkIHVzaW5nIHRoZQorCSAgICAgZHJtIGRhbWFnZSB0cmFja2luZyBh
bmQgc2VsZi1yZWZyZXNoIGhlbHBlcnMuCisJICBUaGlzIGJvbHRlZC1vbiBzZWxmLXJlZnJlc2gg
c3VwcG9ydCB0aGF0IGRpZ3MgYXJvdW5kIGluIGZiZGV2CisJICBpbnRlcm5hbHMsIGJ1dCBpc24n
dCBwcm9wZXJseSBpbnRlZ3JhdGVkLCBpcyBub3QgdGhlIGNvcnJlY3Qgc29sdXRpb24uCiAJLSBz
ZWUgaWYgdng4NTUgZ3BpbyBBUEkgY2FuIGJlIG1hZGUgc2ltaWxhciBlbm91Z2ggdG8gY3M1NTM1
IHNvIHdlIGNhbgogCSAgc2hhcmUgbW9yZSBjb2RlCiAJLSBjb252ZXJ0IGFsbCB1c2VzIG9mIHRo
ZSBvbGQgR1BJTyBBUEkgZnJvbSA8bGludXgvZ3Bpby5oPiB0byB0aGUKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
