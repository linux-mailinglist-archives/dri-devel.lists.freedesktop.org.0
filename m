Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BBA2C0408
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653A0894E7;
	Mon, 23 Nov 2020 11:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CF4894A7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:30 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p19so12926394wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZPHwGts/M0okAx5StN5/QDa0j6ml5tJRffeJmqdhnEY=;
 b=UzyDbEtjw9EFf5YHCxgs8oF8pOLnid+3lYCSPIblTdPw6D0UjMFPSambM0pxcvoVId
 yBF6s4V7I0DZ24qAxuE+t1eTl10NX3a00BZ7ZvLaM0BYPP7yQMpXrO+z3KGbK0IyiCCQ
 zgTobsZex+ZN7sIQkC1EZVY9SOkieJDIwWXZ3h06Y6yBmTNLpqi0xGTdYF7VqGcK/Uco
 TUh+AG1KY7n3afiVLwCUjUfdO3GYkgo4iM0HXLDBmC3TmMOTjRRLFl1mgUg5F9lrpeC6
 XZVWX7JAG4VgebsWCOafOCt2rtluZltcp+0plTVJCkksuN1mscYZvfbh1aauUdFBo0x1
 pNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZPHwGts/M0okAx5StN5/QDa0j6ml5tJRffeJmqdhnEY=;
 b=a9oA35g2L68nWSzuiSgxvvI4HCsG7Daea2JNbNvyIAASBjknSpTz6YqT9XxxA+35P1
 lAsQz8rPeiff6wXdEjTUpDecloGUaJtYFX+rqEVd2Zqae9HiqffN5D7KUDoAsErCEYUP
 vWPQZWJlOFUdGkYz0KwduTP0KO7H/nebjkw9ZIol8aM1YTwAeh5eBEdCBUAgb6KCnt0U
 G9TenYRuVxNs2hzMsz5Irfs3jWDHeJlD78oDvF5W994MVjyyl2Z1KV5WAfdClLEdF/sv
 C3DkDa951yd1GfAxpkynZwSF02D2kzZpXwwFwk0ZwCP5HIPVMH1+CeRGJFobFrALXohw
 krKg==
X-Gm-Message-State: AOAM530YbTIixvQbWCCuY+W8CSW8QlfpHomkStNrOZoULFmFPpkfnD54
 5Fgqcv0lH8s4hQQiJhK3uaAAIw==
X-Google-Smtp-Source: ABdhPJxCCdUhjs0qi9cXiC6juGV3V7fNxFDwFrM5pEq9qjmcHBO/Y0Ddy+z2cLdiLHj8tZ/biImuuA==
X-Received: by 2002:a1c:41c4:: with SMTP id o187mr17634480wma.48.1606130369392; 
 Mon, 23 Nov 2020 03:19:29 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/40] drm/amd/amdgpu/cik_ih: Supply description for 'ih' in
 'cik_ih_{get, set}_wptr()'
Date: Mon, 23 Nov 2020 11:18:44 +0000
Message-Id: <20201123111919.233376-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrX2loLmM6MTg5OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAnY2lrX2loX2dldF93cHRyJwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrX2loLmM6Mjc0OiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAnY2lrX2loX3NldF9y
cHRyJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJD
aHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogUWluZ2xhbmcgTWlhbyA8bWlhb3FpbmdsYW5nQGh1YXdlaS5jb20+CkNjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npa19paC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2Npa19paC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrX2loLmMKaW5kZXggZGI5
NTNlOTVmM2QyNy4uZDM3NDU3MTFkNTVmOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvY2lrX2loLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrX2lo
LmMKQEAgLTE3Nyw2ICsxNzcsNyBAQCBzdGF0aWMgdm9pZCBjaWtfaWhfaXJxX2Rpc2FibGUoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAgKiBjaWtfaWhfZ2V0X3dwdHIgLSBnZXQgdGhlIElI
IHJpbmcgYnVmZmVyIHdwdHIKICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisg
KiBAaWg6IElIIHJpbmcgYnVmZmVyIHRvIGZldGNoIHdwdHIKICAqCiAgKiBHZXQgdGhlIElIIHJp
bmcgYnVmZmVyIHdwdHIgZnJvbSBlaXRoZXIgdGhlIHJlZ2lzdGVyCiAgKiBvciB0aGUgd3JpdGVi
YWNrIG1lbW9yeSBidWZmZXIgKENJSykuICBBbHNvIGNoZWNrIGZvcgpAQCAtMjY2LDYgKzI2Nyw3
IEBAIHN0YXRpYyB2b2lkIGNpa19paF9kZWNvZGVfaXYoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCiAgKiBjaWtfaWhfc2V0X3JwdHIgLSBzZXQgdGhlIElIIHJpbmcgYnVmZmVyIHJwdHIKICAq
CiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKiBAaWg6IElIIHJpbmcgYnVmZmVy
IHRvIHNldCB3cHRyCiAgKgogICogU2V0IHRoZSBJSCByaW5nIGJ1ZmZlciBycHRyLgogICovCi0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
