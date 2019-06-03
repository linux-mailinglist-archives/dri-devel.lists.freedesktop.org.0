Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A8329DB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491BA89709;
	Mon,  3 Jun 2019 07:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A88A898BF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 04:33:58 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id t16so1000285pfe.11
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 21:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3pFTY68CYf0vqkaIF9RkUPvim3fj+DjvxB3baTxp4Mk=;
 b=jdM6awCf3xMAlxUWgUMyiShW+rcCvncrbi007Rh1DxYSY5Ffp7G21lGgOr+KhP3NMR
 RojIrWesCo4bTCDJx663F+5TXNOcVwrOsChaiScdTE+HyKwTojwflFhpeZHMLvQjNHHf
 TPGZvVPGCYlDNSdYenAoFfxa3FpuDe8Sip3xJuIwRUZGE7IB7wsu+0ZC5mF/MtquFeTX
 X7vdHmxMCqECYVKj7aO3jz+fXsPGyIl3NblH59Aye1hlH2z6evSsL3GYOdUK7+MmAXGO
 zAGVVsBcGpMW0TURagsidTF+hkbTQIETTc9Manq5wIOu1xTqxKuW+2KVxpjXkAb7O3Uc
 kUQA==
X-Gm-Message-State: APjAAAX2tr6MAaku8d07Rp54hXHtTVupc0jfCp1MHlSPjeZfbIOyj84K
 N+H/OHjcJ86S41LJyEgaMluO4Q==
X-Google-Smtp-Source: APXvYqzy0pOcm1foPAUC6fqZXlzM7mUcjUylak9ZglBCN1Q2GIU98tYWPiPis4kHfvZEn5RQOneLLw==
X-Received: by 2002:a17:90a:730b:: with SMTP id
 m11mr27194254pjk.89.1559536438112; 
 Sun, 02 Jun 2019 21:33:58 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id j23sm13509733pff.90.2019.06.02.21.33.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 21:33:57 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] ASoC: rockchip: rockchip-max98090: Add node for HDMI
Date: Mon,  3 Jun 2019 12:32:49 +0800
Message-Id: <20190603043251.226549-6-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603043251.226549-1-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:40:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3pFTY68CYf0vqkaIF9RkUPvim3fj+DjvxB3baTxp4Mk=;
 b=RQSvUzIgUKgIsNlQFm+7zwJeVC5MSGMQ7g3/DtHR16ldFiUtk0+JARXtgZwEjl9tbN
 9hWW1p5DfY6fy/aBLs4Yymn5h3QUKDGbkoEPEt1I/+q7XpVzAK46qrqE/1RGqPuPtlv2
 oTdErhd/k+QH1OsnOMAFqzaVQi6I8u9i9UvY8=
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

TGV0IHVzZXIgc3BlY2lmeSBIRE1JIG5vZGUgc28gbWFjaGluZSBkcml2ZXIgY2FuIHVzZSBpdCB0
byBsZXQgY29kZWMKZHJpdmVyIHJlZ2lzdGVyIGNhbGxiYWNrIG9uIGNvcnJlY3QgaGRtaS1ub3Rp
Zmllci4KClNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdAY2hyb21pdW0u
b3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9yb2NrY2hp
cC1tYXg5ODA5MC50eHQgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JvY2tj
aGlwLW1heDk4MDkwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3Vu
ZC9yb2NrY2hpcC1tYXg5ODA5MC50eHQKaW5kZXggYTgwNWFhOTlhZDc1Li5kYWU1N2MxNDg2NGUg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9yb2Nr
Y2hpcC1tYXg5ODA5MC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NvdW5kL3JvY2tjaGlwLW1heDk4MDkwLnR4dApAQCAtNyw2ICs3LDcgQEAgUmVxdWlyZWQgcHJv
cGVydGllczoKICAgY29ubmVjdGVkIHRvIHRoZSBDT0RFQwogLSByb2NrY2hpcCxhdWRpby1jb2Rl
YzogVGhlIHBoYW5kbGUgb2YgdGhlIE1BWDk4MDkwIGF1ZGlvIGNvZGVjCiAtIHJvY2tjaGlwLGhl
YWRzZXQtY29kZWM6IFRoZSBwaGFuZGxlIG9mIEV4dCBjaGlwIGZvciBqYWNrIGRldGVjdGlvbgor
LSByb2NrY2hpcCxoZG1pOiBUaGUgcGhhbmRsZSBvZiBIRE1JIG5vZGUgZm9yIEhETUkgamFjayBk
ZXRlY3Rpb24KIAogRXhhbXBsZToKIApAQCAtMTYsNCArMTcsNSBAQCBzb3VuZCB7CiAJcm9ja2No
aXAsaTJzLWNvbnRyb2xsZXIgPSA8Jmkycz47CiAJcm9ja2NoaXAsYXVkaW8tY29kZWMgPSA8Jm1h
eDk4MDkwPjsKIAlyb2NrY2hpcCxoZWFkc2V0LWNvZGVjID0gPCZoZWFkc2V0Y29kZWM+OworCXJv
Y2tjaGlwLGhkbWk9IDwmaGRtaT47CiB9OwotLSAKMi4yMi4wLnJjMS4yNTcuZzMxMjBhMTgyNDQt
Z29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
