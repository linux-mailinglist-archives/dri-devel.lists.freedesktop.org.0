Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B93C04EB8E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9C46E8D1;
	Fri, 21 Jun 2019 15:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A629D6E8D1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 15:07:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c2so6921631wrm.8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 08:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8SXoO37vsaoSj2sxGo5F/QhkOQlE9hJZY36FjuFEIVY=;
 b=e2qU4qhXQqUGOw6siv2dwRBbJW54aEK5OlbIIxmxc3qtfY6D1Nhik4e0omUUZQJP5s
 4zQo7cN3GfwyfKf3ETCf+Z/jOU2RxE7VFEolPNZm7wqpJ3zU4U4w/bsouYVs4SXU0plv
 rPDktIo+nGfpE/oLjbfiK44QiDpUi/eU8Yi61j/PIOTobYzOa2olkYPWIaM99Uxjz0Sr
 oME8yHMc/tNl+7XXKZcgh3O9wbC5uCOege6OtnzzBsXdIzxrDohwHEDArujrOOtrsCsG
 CWCxVZNFIK26regmVroPzTOea0SJEt1SKPamp3ynwnRf7obRwpLrDnDoGAhnidb2bM5D
 RDQA==
X-Gm-Message-State: APjAAAUMsyh1aWNsIj82EHBlNFbFJPo7mkcquM0QWiMad36KPjpUk4JC
 I4kMw8UFytid2leMUUSuP6o=
X-Google-Smtp-Source: APXvYqzFTmvWUMOGjFpTi0w/rO8NGLPCB6G5/5/qIG9wYtKojmB3Ib7i/EulvAk65GBOnjpQYXewAg==
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr6761064wrr.273.1561129675246; 
 Fri, 21 Jun 2019 08:07:55 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id s10sm3429144wmf.8.2019.06.21.08.07.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 08:07:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Changes for v5.3-rc1
Date: Fri, 21 Jun 2019 17:07:53 +0200
Message-Id: <20190621150753.19550-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8SXoO37vsaoSj2sxGo5F/QhkOQlE9hJZY36FjuFEIVY=;
 b=pJUpQviWRmSef7UujC28eXyDWxVtPfLbknf2SqMNxCJ8zwI9t9NsTWjnCNbJLo9h9A
 L2egME28BXbiJybuWn/c1wI3y4teru9YCm3ppAnj62BHYtrCG9pnJk7q/MUjQsb7OsZg
 4LFl96D7KHOlx/+HzBqhTGOr6FylYmDAXUlo3j8fRMUf1HvKvgqbezmvp9gggXZDI/eD
 BXJC0omPCTnWAyDVPGEZi0+vAwJ3Wg0LM1eR70nF/Q+7KjjOYOrHcACvUejdkXEgIuDQ
 dlK+9M3egPkvuaEBjoQv4HmTtrn4KhEIH19cuWpScjqlRRhRq0Ek1ZBAEVYBqMKbD2ce
 hTKw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYTE4ODMzOWNhNWEz
OTZhY2M1ODhlNTg1MWVkN2UxOWY2NmIwZWJkOToKCiAgTGludXggNS4yLXJjMSAoMjAxOS0wNS0x
OSAxNTo0NzowOSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy90ZWdyYS9saW51eCB0YWdzL2RybS90
ZWdyYS9mb3ItNS4zLXJjMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGViN2NmOTQ1
YThkYWM4NjAzZTZkMDc1OTAyM2U5YjZjZmVkN2EwMDg6CgogIGhvc3QxeDogZGVidWdmc19jcmVh
dGVfZGlyKCkgY2FuIG5ldmVyIHJldHVybiBOVUxMICgyMDE5LTA2LTEzIDE4OjIzOjM4ICswMjAw
KQoKVGhhbmtzLApUaGllcnJ5CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRybS90ZWdyYTogQ2hhbmdlcyBmb3IgdjUuMy1y
YzEKClRoaXMgY29udGFpbnMgYSBjb3VwbGUgb2Ygc21hbGwgaW1wcm92ZW1lbnRzIGFuZCBjbGVh
bnVwcyBmb3IgdGhlIFRlZ3JhCkRSTSBkcml2ZXIuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkdyZWcgS3JvYWgtSGFydG1h
biAoMSk6CiAgICAgIGhvc3QxeDogZGVidWdmc19jcmVhdGVfZGlyKCkgY2FuIG5ldmVyIHJldHVy
biBOVUxMCgpUaGllcnJ5IFJlZGluZyAoNSk6CiAgICAgIGdwdTogaG9zdDF4OiBEbyBub3Qgb3V0
cHV0IGVycm9yIG1lc3NhZ2UgZm9yIGRlZmVycmVkIHByb2JlCiAgICAgIGdwdTogaG9zdDF4OiBJ
bmNyZWFzZSBtYXhpbXVtIERNQSBzZWdtZW50IHNpemUKICAgICAgZ3B1OiBob3N0MXg6IERvIG5v
dCBsaW5rIGxvZ2ljYWwgZGV2aWNlcyB0byBEVCBub2RlcwogICAgICBkcm0vdGVncmE6IFVzZSBH
UElPIGRlc2NyaXB0b3IgQVBJCiAgICAgIGRybS90ZWdyYTogZHBhdXg6IE1ha2UgVkREIHN1cHBs
eSBvcHRpb25hbAoKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5jICB8IDEzICsrKysrKyst
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmggICAgfCAgMyArLS0KIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9vdXRwdXQuYyB8IDUyICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jICAgICAgIHwgMzUgKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9ncHUvaG9zdDF4L2RlYnVnLmMgICAgIHwgIDMg
LS0tCiBkcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMgICAgICAgfCAgNSArKystCiBpbmNsdWRlL2xp
bnV4L2hvc3QxeC5oICAgICAgICAgfCAgMiArKwogNyBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRp
b25zKCspLCA0NCBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
