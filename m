Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3F7BA42
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E416E681;
	Wed, 31 Jul 2019 07:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EF46E602
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 19:49:15 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v24so63366709ljg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 12:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ijchHjsc04USS6jZ7Gr5KW0FT9mbH0Y1GGS8zErdl+M=;
 b=cOXrVbmeAv9WodX95gpAyvegDk2tVcMoADSBAfYr664BtU/ARaZIbBqc7TkDND+MY0
 CT4WA2X9JPXXIftKGlp+iJnhMvrwOKxCUTBfQe8pPGBATfHDvhEUtShAA3KcDTLWMUJ0
 O4gxcHU2FnUXNbnXqTmV3WyLxqBqR/k8WCFMpNReUBcMk2vGE+6T9T+IJdnOjrW/BjLm
 DR1JIFZkKZZmvy0TlfhHDwuhBR967PexIflEoA42Ntj1VHfvLVzV/BXYOMpQcaPBdPZa
 p6YyYrCsDHY0+0QBjdnlC3JKZQkdt4GHMxYPIu532+yoZARifxrPAM0gPFuK9jTggXxA
 1I2Q==
X-Gm-Message-State: APjAAAUPRqlGkn8xXEfP6bdaAgFgnSTIoCey089flsYvyUWzEoQE7m1M
 fae8p1vLjyhSrySDTvDUQYY=
X-Google-Smtp-Source: APXvYqwRDgOqDUOiW6wMxjvX+WOKzpnMUrdhcagMob93JB3/mueXtJNV94VaJTTANtEX6ljR9nc/6A==
X-Received: by 2002:a2e:a415:: with SMTP id p21mr61979381ljn.111.1564516154243; 
 Tue, 30 Jul 2019 12:49:14 -0700 (PDT)
Received: from vostro.lan (18.177.94.90.dynamic.jazztel.es. [90.94.177.18])
 by smtp.gmail.com with ESMTPSA id c15sm13405255lja.79.2019.07.30.12.49.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 12:49:13 -0700 (PDT)
From: =?UTF-8?q?David=20Santamar=C3=ADa=20Rogado?= <howl.nsp@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: panel-orientation-quirks: 320 FHD and D330 HD
Date: Tue, 30 Jul 2019 21:49:11 +0200
Message-Id: <20190730194911.28453-1-howl.nsp@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ijchHjsc04USS6jZ7Gr5KW0FT9mbH0Y1GGS8zErdl+M=;
 b=oO8AZ2hYAjXa1bdPal3d4ttxzmltvGFsE0uKpRX4HjHjepe0t56qJ2+HIQfXjaICsr
 crBHMD7NRWRet83/rfewnHlt66ms+nYFKaaSRhteFyYWFOWkUFFEdLv+de02FrcnrI2G
 HNitDO2jBYgD4pTbVb8RtDbeBfb1bCm9yCSXhklsK6ZqwmtBqHV/BT9NQNkcstIU4uEd
 CgZ95uyue4HOB33JXuduZ5NAOTn0gtzrYczgYLDG+5LRRfBDuqYxS0tIn+0mi/+kYXsl
 7Y7jMlMRS5Cx/fa1Z/W4hMEs1PrCwUMzp1+f0wpnrcW4sx9twzdwS3wRmXoyVIEhteEw
 qppQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHRoZSBIRCB2ZXJzaW9uIG9mIExlbm92byBJZGVhcGFkIEQzMzAKYW5kIEZIRCB2
ZXJzaW9uIG9mIExlbm92byBJZGVhcGFkIE1paXggMzIwLgoKVGhpcyBzaG91bGQgd29yayBkZXNw
aXRlIHRoZSBkbWkgZGF0YSBpcyB0aGUgc2FtZSBiZWNhdXNlCnRoZSByZXNvbHV0aW9uIGNoZWNr
cy4KClNpZ25lZC1vZmYtYnk6IERhdmlkIFNhbnRhbWFyw61hIFJvZ2FkbyA8aG93bC5uc3BAZ21h
aWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtz
LmMgfCAxOCArKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFu
ZWxfb3JpZW50YXRpb25fcXVpcmtzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVu
dGF0aW9uX3F1aXJrcy5jCmluZGV4IGZmZDk1YmZlYWE5NC4uODk2Yzc4M2NlMTM1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50YXRpb25fcXVpcmtzLmMKQEAgLTE5MSwx
NCArMTkxLDI4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBvcmllbnRhdGlv
bl9kYXRhW10gPSB7CiAJCSAgRE1JX0VYQUNUX01BVENIKERNSV9QUk9EVUNUX1ZFUlNJT04sICJN
SUlYIDMxMC0xMElDUiIpLAogCQl9LAogCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZsY2Q4MDB4
MTI4MF9yaWdodHNpZGVfdXAsCi0JfSwgewkvKiBMZW5vdm8gSWRlYXBhZCBNaWl4IDMyMCAqLwor
CX0sIHsJLyogTGVub3ZvIElkZWFwYWQgTWlpeCAzMjAgKEhEKSAqLwogCQkubWF0Y2hlcyA9IHsK
IAkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJMRU5PVk8iKSwKIAkJICBETUlf
RVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFNRSwgIjgwWEYiKSwKIAkJICBETUlfRVhBQ1RfTUFU
Q0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIkxlbm92byBNSUlYIDMyMC0xMElDUiIpLAogCQl9LAog
CQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZsY2Q4MDB4MTI4MF9yaWdodHNpZGVfdXAsCi0JfSwg
ewkvKiBMZW5vdm8gSWRlYXBhZCBEMzMwICovCisJfSwgewkvKiBMZW5vdm8gSWRlYXBhZCBNaWl4
IDMyMCAoRkhEKSAqLworCQkubWF0Y2hlcyA9IHsKKwkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1NZ
U19WRU5ET1IsICJMRU5PVk8iKSwKKwkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfTkFN
RSwgIjgwWEYiKSwKKwkJICBETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIkxl
bm92byBNSUlYIDMyMC0xMElDUiIpLAorCQl9LAorCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZs
Y2QxMjAweDE5MjBfcmlnaHRzaWRlX3VwLAorCX0sIHsJLyogTGVub3ZvIElkZWFwYWQgRDMzMCAo
SEQpICovCisJCS5tYXRjaGVzID0geworCQkgIERNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRP
UiwgIkxFTk9WTyIpLAorCQkgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiODFI
MyIpLAorCQkgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9OLCAiTGVub3ZvIGlk
ZWFwYWQgRDMzMC0xMElHTSIpLAorCQl9LAorCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZsY2Q4
MDB4MTI4MF9yaWdodHNpZGVfdXAsCisJfSwgewkvKiBMZW5vdm8gSWRlYXBhZCBEMzMwIChGSEQp
ICovCiAJCS5tYXRjaGVzID0gewogCQkgIERNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRPUiwg
IkxFTk9WTyIpLAogCQkgIERNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiODFIMyIp
LAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
