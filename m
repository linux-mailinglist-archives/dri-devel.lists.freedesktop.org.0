Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5311FEC4C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8D56EB17;
	Thu, 18 Jun 2020 07:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765F66E150
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 23:41:02 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s1so5056802ljo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OcOqz11XDX1GFeXdHeD+rrzTbKQ6O43sVtDhODmNqc0=;
 b=I4EL+9xSGNrxK6Z2hdF8hp2JFC0Q71MdVSv9gkIsSfmBiXE3tO953ygNuEyhWzWq/Y
 kt5sgsr0FU2tTuUPnCvyEy7uo41zYwtq/dc73J6ghXA2pAHLwbp5yDmdG5/9Lj7ZsKVB
 e95PwhYCe6jdiPXV9LN4hyWDXJXW7lEadkgGY1uzMk4kXxOOVB6yJQDhIC+MAszjYRK0
 HzWexz6TTLOMQLkNeq0V64kYu3nwoGtyZKNUAtmX+v9HIHye607uCpTMNtke6/agA4AN
 aHu0CkuCGO4alJutuER72zo7mtz4yAcvRq0eFLnDx7ATn2lh86AUYnSifHlgJcewZFde
 Y+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OcOqz11XDX1GFeXdHeD+rrzTbKQ6O43sVtDhODmNqc0=;
 b=Y5gB0P89pKkhnKZGLD/LDa0tcN4If+dhdY6eHS9Auz1O2/eUisjPOyD4rPQIOp4827
 /eIsSBXlPmMLljyHVSGFuEJyVn3f3aHLNrRqW8WT+rmRCWjopFSshXMSNW268VDHjoZl
 mdjWvVkYYPy8W2Gg6I0otXZV4u7nG4DVcJStZeGjvi5Xja1qNf4yStlxDky2iUsEM7Lf
 4/UBbVMw+35HCpKAml5f+svfGrfc68oU6UIAEB2A4hoOd3NvP0NBPzw8EZLsJrTKKi/Q
 vKb5PC7EvQGrf2dTn1+QSBael1N0wcCYfS/6CHCiHwtoCzvWdiDg9l3NXDjy139nwu2Q
 kwbQ==
X-Gm-Message-State: AOAM531DxD+QoRR2AXQ5dHPUHBJFGb4EnSDf0l7mqs+KgkxoY/qXGGGJ
 XvYXMREDi6rk1Uzx9ZN6R8A=
X-Google-Smtp-Source: ABdhPJzwtCosDXfqxKV938U918086QPW2Y3T4a+nySVKa/edKjWK6dOc4Uodf6FWGzHT3zqti2DCHg==
X-Received: by 2002:a2e:9b8f:: with SMTP id z15mr879391lji.185.1592437260890; 
 Wed, 17 Jun 2020 16:41:00 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id c8sm287871lfc.46.2020.06.17.16.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 16:41:00 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH v3 0/3] 180 degrees rotation support for NVIDIA Tegra DRM
Date: Thu, 18 Jun 2020 02:40:37 +0300
Message-Id: <20200617234040.1094-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8hCgpUaGlzIHNlcmllcyBhZGRzIDE4MMKwIGRpc3BsYXkgcGxhbmUgcm90YXRpb24gc3Vw
cG9ydCB0byB0aGUgTlZJRElBIFRlZ3JhCkRSTSBkcml2ZXIgd2hpY2ggaXMgbmVlZGVkIGZvciBk
ZXZpY2VzIHRoYXQgaGF2ZSBkaXNwbGF5IHBhbmVsIHBoeXNpY2FsbHkKbW91bnRlZCB1cHNpZGUt
ZG93biwgbGlrZSBOZXh1cyA3IHRhYmxldCBkZXZpY2UgZm9yIGV4YW1wbGUgWzFdLiBTaW5jZQpE
Uk0gcGFuZWwgcm90YXRpb24gaXMgYSBuZXcgdGhpbmcgZm9yIGEgdXNlcnNwYWNlLCBjdXJyZW50
bHkgb25seQpPcGVudGVncmEgWG9yZyBkcml2ZXIgWzJdIGFuZCBhIHJlY2VudCBXZXN0b24gWzNd
IGhhdmUgc3VwcG9ydCBmb3IgdGhlCnJvdGF0ZWQgZGlzcGxheSBwYW5lbHMsIGJ1dCB0aGlzIGlz
IG1vcmUgdGhhbiBnb29kIGVub3VnaCBmb3IgdGhlIHN0YXJ0ZXIuCgpbMV0gaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LXRlZ3JhL3BhdGNoLzIwMjAwNjA3MTU0MzI3
LjE4NTg5LTMtZGlnZXR4QGdtYWlsLmNvbS8KWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9ncmF0ZS1k
cml2ZXIveGY4Ni12aWRlby1vcGVudGVncmEvY29tbWl0LzI4ZWIyMGEzOTU5YmJlNWJjM2EzYjY3
ZTU1OTc3MDkzZmQ1MTE0Y2EKWzNdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXls
YW5kL3dlc3Rvbi8tL21lcmdlX3JlcXVlc3RzLzMxNQoKQ2hhbmdlbG9nOgoKdjM6IC0gRmFjdG9y
ZWQgb3V0IHRoZSBwYW5lbCBwYXRjaGVzIGludG8gc3RhbmRhbG9uZSBzZXJpZXMgWzRdIGJlY2F1
c2UKICAgICAgdGhpcyBzZXJpZXMgZG9lc24ndCBoYXZlIGhhcmQgZGVwZW5kZW5jeSBvbiB0aGUg
cGFuZWwgcGF0Y2hlcyBhbmQgaXQKICAgICAgc2hvdWxkIGJlIG5pY2VyIHRvIHJldmlldyBhbmQg
YXBwbHkgdGhlIHByb3Blcmx5IGdyb3VwZWQgcGF0Y2hlcy4KCiAgICAtIFRoZSBEUk1fTU9ERV9S
T1RBVEVfMTgwIG5vdyBpc24ndCBwYXNzZWQgdG8gZHJtX3JvdGF0aW9uX3NpbXBsaWZ5KCksCiAg
ICAgIGxpa2UgaXQgd2FzIHN1Z2dlc3RlZCBieSBWaWxsZSBTeXJqw6Rsw6QgaW4gdGhlIGNvbW1l
bnQgdG8gdjIuCgogICAgLSBBZGRlZCBjbGFyaWZ5aW5nIGNvbW1lbnQgZm9yIHRoZSB0ZWdyYV9m
Yl9pc19ib3R0b21fdXAoKSBpbiB0aGUgY29kZS4KCls0XSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMjAwNjE3MjMxODQyLjMwNjcxLTEtZGlnZXR4QGdtYWlsLmNvbS9ULyN0CgpEbWl0
cnkgT3NpcGVua28gKDMpOgogIGRybS90ZWdyYTogcGxhbmU6IFJlbmFtZSBib3R0b21fdXAgdG8g
cmVmbGVjdF95CiAgZHJtL3RlZ3JhOiBwbGFuZTogU3VwcG9ydCBob3Jpem9udGFsIHJlZmxlY3Rp
b24KICBkcm0vdGVncmE6IHBsYW5lOiBTdXBwb3J0IDE4MMKwIHJvdGF0aW9uCgogZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2RjLmMgICAgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmggICAgfCAgMyArKy0KIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9wbGFuZS5jIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvcGxhbmUu
aCB8ICAzICsrLQogNCBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKCi0tIAoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
