Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA66AA3270
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D430A6E2A5;
	Fri, 30 Aug 2019 08:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636D26E0E0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 18:16:49 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l2so4795284wmg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LO7HZ9YPIh5YLS/QBORxAyCxz/ZlkMLOO36EtvPqwvk=;
 b=SyRFWm4XYicf7waZfRVgl7WQ9ho7JW/ll0Inijlrz2cHvk+nc/Z0/zOFNvv93pcFyJ
 W2eW2PhkV6tSHyehiGCp1nn6Y/uC8+hBY5FkNLmipJxpZvGvvB+ylPz/JSXlgntDWd1c
 Xi+xz9MbpzBwWWt8bcLeusZxv1jTlUkWecG/aCtAdfPaxOYFZzo1Nm6umaSRynKRVNPO
 egZcctD71XvPKTjGkKj1xD38athXxaC2S0wjeTkzY+SG0b+TgY5r8pHLmPNrIlGkQ5bT
 aQal8Dy3rF9+FtOeNbEbFvlEpGKho1B0mwKANIivH0jhZWA2MpWEqOsS338PSNTAGnFc
 hpsA==
X-Gm-Message-State: APjAAAXPg9NloREXY9LyG+IXhfRPLANljxtKdfYq5ALgS2cRU3fo3QYd
 gyJd9rc4JDH7Xi47s+Tl+S4=
X-Google-Smtp-Source: APXvYqzgSzCjwJ6rPB62R44xzvpUdkHjuSrBQwXYesJgdB5o19rf1IGq792xKy8kSsCJAnaBVKvlrw==
X-Received: by 2002:a05:600c:54c:: with SMTP id
 k12mr13202118wmc.117.1567102608056; 
 Thu, 29 Aug 2019 11:16:48 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net.
 [86.58.59.25])
 by smtp.gmail.com with ESMTPSA id c62sm3221458wme.20.2019.08.29.11.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 11:16:47 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 4/4] drm/selftests: modes: Add more unit tests for the
 cmdline parser
Date: Thu, 29 Aug 2019 20:16:46 +0200
Message-ID: <1959621.QfrbNIXFZT@jernej-laptop>
In-Reply-To: <20190827115850.25731-4-mripard@kernel.org>
References: <20190827115850.25731-1-mripard@kernel.org>
 <20190827115850.25731-4-mripard@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LO7HZ9YPIh5YLS/QBORxAyCxz/ZlkMLOO36EtvPqwvk=;
 b=tlPSE33V5/+nPzdT3MdC9zm53T8LH5qS8PqH18Uq+nl7GbX3KHfBv1SYXZkL13tJma
 Pl1YsBPDN7VBumDdCMsUmvhH4Bo1S62FyLBBZVBzNtMZ47jsqBwFUpnL76ECClv1BBn9
 AFriwmmn7kHt2qQ+UxeKJ/ybSJDKd1sp1qBKdIBzhBkfyOmYkIyelZs3l56bpS0aIJZm
 yiV+vxHEpSk49EZ2HwT6zRKpes6ATENy0FGx7MynjYBkKuwbreq7MJ/Q3JDAmQercR2D
 A5Q4H1LPCcunHQwVKusiWUP6SoKGOUA315qqE7+lXyUeKGRACMVg/tZ1+fcU79zwGCcc
 zvTA==
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
Cc: thomas.graichen@googlemail.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgdG9yZWssIDI3LiBhdmd1c3QgMjAxOSBvYiAxMzo1ODo1MCBDRVNUIGplIE1heGlt
ZSBSaXBhcmQgbmFwaXNhbChhKToKPiBGcm9tOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGJvb3RsaW4uY29tPgo+IAo+IExldCdzIGFkZCBzb21lIHVuaXQgdGVzdHMgZm9yIHRoZSByZWNl
bnQgYnVncyB3ZSBqdXN0IGZpeGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIC4uLi9ncHUvZHJtL3NlbGZ0ZXN0
cy9kcm1fY21kbGluZV9zZWxmdGVzdHMuaCB8ICAgNyArCj4gIC4uLi9kcm0vc2VsZnRlc3RzL3Rl
c3QtZHJtX2NtZGxpbmVfcGFyc2VyLmMgICB8IDEzMCArKysrKysrKysrKysrKysrKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMzcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vc2VsZnRlc3RzL2RybV9jbWRsaW5lX3NlbGZ0ZXN0cy5oCj4gYi9kcml2ZXJzL2dw
dS9kcm0vc2VsZnRlc3RzL2RybV9jbWRsaW5lX3NlbGZ0ZXN0cy5oIGluZGV4CgpSZXZpZXdlZC1i
eTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0PgoKQmVzdCByZWdhcmRz
LApKZXJuZWoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
