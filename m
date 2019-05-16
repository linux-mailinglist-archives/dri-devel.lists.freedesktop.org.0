Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABDC20DE1
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 19:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1A88976D;
	Thu, 16 May 2019 17:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF5C89700
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 17:25:18 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id n8so1937156plp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lMSAIsZhKZG2h1JTrxIG+7d55aHOlT9g/JHuAffMChU=;
 b=hHwjPY4JXPZpyVc0tRL8mSWIZ6IFlwDU3Fq2NhczBuGdfSAjksc7a+RMMlkJzrJUuv
 GxvQ3Zb/OTELpE3eDMSj1uBty/yH1C67G/7OJM7ur74jnFxvHZY9s/vuhzJUcOyYsVD8
 s/lArQoYgYOzd09va8Fu3Jryw1x6FtDd8RNNftI43Ex9qqCrrsWVaRb5X9Il3ekhcznj
 OVlejxvEw9ONMRs06qO8R77dEU0HIqRCqxfamejf1R1qsbCn19446pvjrAar+2ifcuK6
 h5PQZaEfAK5SFdjkjpZnDL57br2eHWMmPlhaeQR/eKaPbtw3zXm2/f+gJsv91bCpSglo
 L8/g==
X-Gm-Message-State: APjAAAVzx0WqaFDi4UJEGeCdgTBFsAAPKPmCHkJhGhi4sTcMoLl648zM
 p3S7TIUdQNx3shttwminoSk7tA==
X-Google-Smtp-Source: APXvYqzIUsVmhUrS26/6IMXbb7QozvzV4UhQf72EtAlcEOaL7o68fTla/TZNzSHlTZB49FW8iDdDfw==
X-Received: by 2002:a17:902:6809:: with SMTP id
 h9mr51869145plk.129.1558027518307; 
 Thu, 16 May 2019 10:25:18 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id s77sm13264216pfa.63.2019.05.16.10.25.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 10:25:17 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 3/3] ARM: dts: rockchip: Use GPU as cooling device for the
 GPU thermal zone of the rk3288
Date: Thu, 16 May 2019 10:25:10 -0700
Message-Id: <20190516172510.181473-3-mka@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190516172510.181473-1-mka@chromium.org>
References: <20190516172510.181473-1-mka@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMSAIsZhKZG2h1JTrxIG+7d55aHOlT9g/JHuAffMChU=;
 b=lm3M7Abais25GdMpfAmlFd1RXZxXFphbeQ7jGJe3AKBVsknHbMxhyrH4vT+MBb28A+
 xP4nQPC5QkLetlEYajhKUsKHtuJITm+LT9nnHbWlAddEHLklQyGCAK0zKonDIjCHRuRm
 n0incRdHOE8Y3OOvZzwBzlqIvRx1Z2ohANK2U=
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

Q3VycmVudGx5IHRoZSBDUFVzIGFyZSB1c2VkIGFzIGNvb2xpbmcgZGV2aWNlcyBvZiB0aGUgcmsz
Mjg4IEdQVQp0aGVybWFsIHpvbmUuIFRoZSBDUFVzIGFyZSBhbHNvIGNvbmZpZ3VyZWQgYXMgY29v
bGluZyBkZXZpY2VzIGluIHRoZQpDUFUgdGhlcm1hbCB6b25lLCB3aGljaCBpbmRpcmVjdGx5IGhl
bHBzIHdpdGggY29vbGluZyB0aGUgR1BVIHRoZXJtYWwKem9uZSwgc2luY2UgdGhlIENQVSBhbmQg
R1BVIHRlbXBlcmF0dXJlcyBhcmUgY29ycmVsYXRlZCBvbiB0aGUgcmszMjg4LgoKQ29uZmlndXJl
IHRoZSBBUk0gTWFsaSBNaWRnYXJkIEdQVSBhcyBjb29saW5nIGRldmljZSBmb3IgdGhlIEdQVQp0
aGVybWFsIHpvbmUgaW5zdGVhZCBvZiB0aGUgQ1BVcy4KClNpZ25lZC1vZmYtYnk6IE1hdHRoaWFz
IEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBwYXRjaCBh
ZGRlZCB0byB0aGUgc2VyaWVzCi0tLQogYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kgfCA1
ICstLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9yazMyODguZHRzaQppbmRleCAxNGQ5NjA5ZjBiMTUuLjk4ODU1NWM1MTE4ZCAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvcmszMjg4LmR0c2kKQEAgLTU0NywxMCArNTQ3LDcgQEAKIAkJCQltYXAwIHsKIAkJCQkJdHJp
cCA9IDwmZ3B1X2FsZXJ0MD47CiAJCQkJCWNvb2xpbmctZGV2aWNlID0KLQkJCQkJCTwmY3B1MCBU
SEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LAotCQkJCQkJPCZjcHUxIFRIRVJNQUxf
Tk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD4sCi0JCQkJCQk8JmNwdTIgVEhFUk1BTF9OT19MSU1J
VCBUSEVSTUFMX05PX0xJTUlUPiwKLQkJCQkJCTwmY3B1MyBUSEVSTUFMX05PX0xJTUlUIFRIRVJN
QUxfTk9fTElNSVQ+OworCQkJCQkJPCZncHUgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJ
TUlUPjsKIAkJCQl9OwogCQkJfTsKIAkJfTsKLS0gCjIuMjEuMC4xMDIwLmdmMjgyMGNmMDFhLWdv
b2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
