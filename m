Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9940109AE2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 10:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C9889D77;
	Tue, 26 Nov 2019 09:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9F689D67
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 09:14:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t26so2366883wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 01:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58z6PSOMQti9hB6rMQJ8CVxVdVi5QpCvXcK4eM0Ybsk=;
 b=fBe0s/wtc+H4mxoN3G5uOHkrPQVGVHyKOfAkARIwtef1ZwN4CWhPy1gUUBUJ2ci8jJ
 p9fHSnmJ8FkGQ403ByhNjuntLAnSPUJD+gw7hmTDuoHPQyy9qzJr8BL0rvQITKpV7JGJ
 ZOYazHQ/+uMgCeChvTcXh5s+Y874RIpM8lPRcdSYvVOMJLXGCg1WxVvCyuD6Njbz3b+y
 J6IgG76LOADLIcGROqzocAJKazPiq4A13mekiP9n1w/y8qSXbckSiqEi63yC/RVkq/sP
 sPVU59RCcyZGsJ1Or4nuECbtVbTupsrTZCLveCQhYggL/vesE9LwexUF+Ydjaxw/ZmEE
 f1Xw==
X-Gm-Message-State: APjAAAVZrROHPPVttN5so3B82gBcQ6mvIkCwVtf5Jtl7KlTwwszX7qqy
 tTvuSa4m/xMp9PFcM5mP617QdCQTZ4w=
X-Google-Smtp-Source: APXvYqxJ4wsYb51RXOxipePE9LEky3jPXir04HY2V2Xd6Bdg10wZF/mjX6A6ylxKgfYwAVEjkYtQRw==
X-Received: by 2002:a7b:c347:: with SMTP id l7mr3256761wmj.48.1574759663031;
 Tue, 26 Nov 2019 01:14:23 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j17sm14167450wrr.75.2019.11.26.01.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 01:14:22 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/fourcc: Fill out all block sizes for P210
Date: Tue, 26 Nov 2019 10:14:14 +0100
Message-Id: <20191126091414.226070-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126091414.226070-1-daniel.vetter@ffwll.ch>
References: <20191126091414.226070-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=58z6PSOMQti9hB6rMQJ8CVxVdVi5QpCvXcK4eM0Ybsk=;
 b=SpoLGIloXoHImop2tl3rz3BLBEun0/IghfAPV9pRbgNxpaPR4s+GW6LtSV0f41E6DG
 btpplTK+7ybotOo/wD2srLdNN0JBeC9580x33NnGIAYVYflQpmVwKqUlTMJntcRQsMQK
 gyXGVrwaTW5yT7XwlOsTM5V6FY60r+EXuQuOo=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Ayan Kumar Halder <ayan.halder@arm.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MCBtZWFucyAxIGFzIHRoZSBkZWZhdWx0LCBidXQgaXQncyBtaWdodHkgY29uZnVzaW5nIGlmIHRo
ZSBibG9jayBzaXplCmZvciB0aGUgZmlyc3QgcGxhbmUgaXMgc3BlbGxlZCBvdXQgZXhwbGljaXRs
eSwgYnV0IG5vdCBmb3IgdGhlIDJuZApwbGFuZS4KCk5vIGNjOiBzdGFibGUgYmVjYXVzZSB0aGlz
IGlzIGp1c3QgY29uZnVzaW9uLCBidXQgMCBmdW5jdGlvbmFsIGlzc3VlLgoKRml4ZXM6IDdiYTBm
ZWUyNDdlZSAoImRybS9mb3VyY2M6IEFkZCBBRkJDIHl1diBmb3VyY2NzIGZvciBNYWxpIikKQ2M6
IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KQ2M6IEF5YW4gS3VtYXIgSGFs
ZGVyIDxheWFuLmhhbGRlckBhcm0uY29tPgpDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFy
bS5jb20+CkNjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhQHJvc2VuendlaWcuaW8+CkNjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzog
TWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2ZvdXJjYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKaW5kZXggZmU3OWNlODU3YzhhLi5iMjM0YmZhZWRhMDYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9mb3VyY2MuYwpAQCAtMjYzLDcgKzI2Myw3IEBAIGNvbnN0IHN0cnVjdCBkcm1f
Zm9ybWF0X2luZm8gKl9fZHJtX2Zvcm1hdF9pbmZvKHUzMiBmb3JtYXQpCiAJCSAgLmhzdWIgPSAy
LCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlfSwKIAkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9Q
MjEwLAkJLmRlcHRoID0gMCwKIAkJICAubnVtX3BsYW5lcyA9IDIsIC5jaGFyX3Blcl9ibG9jayA9
IHsgMiwgNCwgMCB9LAotCQkgIC5ibG9ja193ID0geyAxLCAwLCAwIH0sIC5ibG9ja19oID0geyAx
LCAwLCAwIH0sIC5oc3ViID0gMiwKKwkJICAuYmxvY2tfdyA9IHsgMSwgMSwgMCB9LCAuYmxvY2tf
aCA9IHsgMSwgMSwgMCB9LCAuaHN1YiA9IDIsCiAJCSAgLnZzdWIgPSAxLCAuaXNfeXV2ID0gdHJ1
ZSB9LAogCQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX1ZVWTEwMTAxMCwJLmRlcHRoID0gMCwKIAkJ
ICAubnVtX3BsYW5lcyA9IDEsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAxLCAudnN1YiA9
IDEsCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
