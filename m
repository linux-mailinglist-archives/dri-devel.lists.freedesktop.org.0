Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA09329CF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E1589296;
	Mon,  3 Jun 2019 07:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97EA898C2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 04:34:11 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id n2so7505780pgp.11
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 21:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b/qy0C/+qIVS4p/9C8coL0gczc7xGffHcCTpl84Pnik=;
 b=dn3mq0NCey6sOpkSyZKQTl3Zgd00GKSYTXLnyMzuhUard/6oL1/2hqhYwIpClLdBs5
 zURtD7sT2WzPO6ghwi1E3j4C+3ZktxLg5N7oR+AySSBPcMaGhMi/vHsxyeVTINXS2uNP
 MuaQq1sKUFlDB8pi+CLFRLlxVPuAPAkAj9xflbjuqyiCiZgcpyuJH+8d+ESwNobJD9pA
 SXyfmyjLiE/m7iwpn7i38fk6DNb91m3YF4z+4t8kDLi7ZmjZT/IHTA65UXLGqeSQcRAO
 QSA0JZ4r04UcfkTmGpNltyKbKmFw9wGmWhi5bvombK/77XIUmdWRUbhN1oJPAWcKwE1t
 HdCQ==
X-Gm-Message-State: APjAAAWWa9H1bzdYS8/ap53lmdCt5cWqvvrHrqIjueN+9ao1ferk4dg8
 wQduhiA1dIbgyIfPkV8+emjx/A==
X-Google-Smtp-Source: APXvYqyNg+8OlIDr5Hr5hFnNgwXQAuI+ahu2SvEr6XII+hIpaqZoSlyKPzFn5UBfI4WiO1Ahj/0G/w==
X-Received: by 2002:a62:6145:: with SMTP id v66mr28539820pfb.144.1559536451549; 
 Sun, 02 Jun 2019 21:34:11 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id e20sm11842630pfi.35.2019.06.02.21.34.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 21:34:10 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] ARM: dts: rockchip: Specify HDMI node to sound card node
Date: Mon,  3 Jun 2019 12:32:51 +0800
Message-Id: <20190603043251.226549-8-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603043251.226549-1-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:40:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b/qy0C/+qIVS4p/9C8coL0gczc7xGffHcCTpl84Pnik=;
 b=W0HFUAGEBlitH2BpXUVE7tLd15Ng5l2TZqjITWduI3EGWRg3JKMe0MjJis9TBvMp02
 4awA3xZDrtX56bGXOH5ZQ3oEimCGvzikfQPZANnHJau89l5kDDX0gPAAvlPieYi8kSIP
 TwDl7/UAUwCplFr2sy8k4qBf+wMfpuYAoO41w=
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
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U291bmQgY2FyZCBuZWVkcyBIRE1JIG5vZGUgaW4gb3JkZXIgdG8gcmVnaXN0ZXIgamFjayBjYWxs
YmFjayBvbiBIRE1JCm5vdGlmaWVyLgoKU2lnbmVkLW9mZi1ieTogQ2hlbmctWWkgQ2hpYW5nIDxj
eWNoaWFuZ0BjaHJvbWl1bS5vcmc+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LXZleXJv
bi1hbmFsb2ctYXVkaW8uZHRzaSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LXZleXJvbi1hbmFsb2ctYXVk
aW8uZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC12ZXlyb24tYW5hbG9nLWF1ZGlvLmR0
c2kKaW5kZXggNDQ1MjcwYWExMzZlLi4wOTZiYTRlOTZkYjIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3JrMzI4OC12ZXlyb24tYW5hbG9nLWF1ZGlvLmR0c2kKKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvcmszMjg4LXZleXJvbi1hbmFsb2ctYXVkaW8uZHRzaQpAQCAtMTQsNiArMTQsNyBA
QAogCQlyb2NrY2hpcCxtb2RlbCA9ICJWRVlST04tSTJTIjsKIAkJcm9ja2NoaXAsaTJzLWNvbnRy
b2xsZXIgPSA8Jmkycz47CiAJCXJvY2tjaGlwLGF1ZGlvLWNvZGVjID0gPCZtYXg5ODA5MD47CisJ
CXJvY2tjaGlwLGhkbWk9IDwmaGRtaT47CiAJCXJvY2tjaGlwLGhwLWRldC1ncGlvcyA9IDwmZ3Bp
bzYgUktfUEE1IEdQSU9fQUNUSVZFX0hJR0g+OwogCQlyb2NrY2hpcCxtaWMtZGV0LWdwaW9zID0g
PCZncGlvNiBSS19QQjMgR1BJT19BQ1RJVkVfTE9XPjsKIAkJcm9ja2NoaXAsaGVhZHNldC1jb2Rl
YyA9IDwmaGVhZHNldGNvZGVjPjsKLS0gCjIuMjIuMC5yYzEuMjU3LmczMTIwYTE4MjQ0LWdvb2cK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
