Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99E420DDD
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 19:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F203896FA;
	Thu, 16 May 2019 17:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B741E896FA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 17:25:15 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t22so1877776pgi.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVl8ZXN8JPcw2xaHO9ZTYh60UwjcOeEd2LUYV6FNZrQ=;
 b=QZNUMAs/TKrgAjGmLfZFdAdFZThIHWxtL6+/VB0y5hmAX5mCCeYEqVs3Npu/sveLXu
 F7u2otanhy74D/dAgSzb2PHnYtjAIyQ8DY0fvKlx46fqEqsCzKR2gl2/ovU9u3XAS+hT
 EEvVi5IPdbrdlxbcvdK1I/l6wBFvxAj8Vy/tkmr7cCEbEwHPI9agqWv4w175Gdg/uPbr
 ZvgKGYpZkRRavwutglhNTvxJtLXZ/2c7xiQd3OAfCd2DCnFKLztqCksMFe5WJU9OWlN+
 hsyiYKmDxF4jOvGwKE1CSXov0s1yosCusYVs+mQUjWalG3YQ0gkGF0GJvknwdZ0kMZ4v
 vx7g==
X-Gm-Message-State: APjAAAUXOdYyisRPlZYCdQXxv8sLc6QZ/tLjP0cV1QSupT9K/KcRRj5y
 EKYOLn2MXZ3czpClqKHPYbdXUA==
X-Google-Smtp-Source: APXvYqwpj3INjdyCcYF7eLRtYgUqjMn2YOU0j2bY43pkolET6jRmQIrQb00jKgHVpRrRAInlDPe5xQ==
X-Received: by 2002:aa7:9afc:: with SMTP id y28mr55797961pfp.101.1558027515393; 
 Thu, 16 May 2019 10:25:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id k63sm9651260pfb.108.2019.05.16.10.25.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 10:25:14 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/3] dt-bindings: gpu: add #cooling-cells property to the
 ARM Mali Midgard GPU binding
Date: Thu, 16 May 2019 10:25:08 -0700
Message-Id: <20190516172510.181473-1-mka@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVl8ZXN8JPcw2xaHO9ZTYh60UwjcOeEd2LUYV6FNZrQ=;
 b=L3pOoCaQskb2Fga/dNWke/VSFUUQxbe+nfTUcxUrOmVHH+LzrUUfkyRywEz99Q4nL2
 m2F69hUS3UQsU1/UYxwbVPnwDiHlZv7R4hJ4RU5sRHW+Kb3kXCOs/SWFZz57Bb7K9hiQ
 cvV1dfJXk2iCJVks9ckJo5aM/Ys5drogaQYgg=
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
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdQVSBjYW4gYmUgdXNlZCBhcyBhIHRoZXJtYWwgY29vbGluZyBkZXZpY2UsIGFkZCBhbiBv
cHRpb25hbAonI2Nvb2xpbmctY2VsbHMnIHByb3BlcnR5LgoKU2lnbmVkLW9mZi1ieTogTWF0dGhp
YXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIHBhdGNo
IGFkZGVkIHRvIHRoZSBzZXJpZXMKLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dAppbmRleCAxOGEyY2RlMmU1ZjMuLjYxZmQ0
MWEyMGY5OSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dw
dS9hcm0sbWFsaS1taWRnYXJkLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0CkBAIC0zNyw2ICszNyw4IEBAIE9wdGlvbmFs
IHByb3BlcnRpZXM6CiAtIG9wZXJhdGluZy1wb2ludHMtdjIgOiBSZWZlciB0byBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvb3BwL29wcC50eHQKICAgZm9yIGRldGFpbHMuCiAKKy0g
I2Nvb2xpbmctY2VsbHM6IFJlZmVyIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy90aGVybWFsL3RoZXJtYWwudHh0CisgIGZvciBkZXRhaWxzLgogCiBFeGFtcGxlIGZvciBhIE1h
bGktVDc2MDoKIApAQCAtNTEsNiArNTMsNyBAQCBncHVAZmZhMzAwMDAgewogCW1hbGktc3VwcGx5
ID0gPCZ2ZGRfZ3B1PjsKIAlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZncHVfb3BwX3RhYmxlPjsK
IAlwb3dlci1kb21haW5zID0gPCZwb3dlciBSSzMyODhfUERfR1BVPjsKKwkjY29vbGluZy1jZWxs
cyA9IDwyPjsKIH07CiAKIGdwdV9vcHBfdGFibGU6IG9wcF90YWJsZTAgewotLSAKMi4yMS4wLjEw
MjAuZ2YyODIwY2YwMWEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
