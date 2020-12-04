Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0CE2CE966
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1B36E134;
	Fri,  4 Dec 2020 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B716E138
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 08:20:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k10so4788176wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 00:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qB2SYCS1v55sYBnoh6a9A5+nyB8wI9x+IMkUjRVdEyU=;
 b=ccMmR3vntuVwCLyqCesY4T0znkXgfHiXTnq0Gfqpmm9HTwG6ct0MAfHZMb2oDeCArn
 1nLK4Eu61t+NF96Gt0GPU7KyEBcyHU1FZ0ifBWS90HGCpl3nED5ZKBYU5kQOAlk7oNDZ
 uR9o1QAz+c6cPiNc26TuGW7uoCI6+fgmbwmB536uos4WiP9CvNQ3lMgaK7xiLyvhPNtB
 FnJXjPSSlKTYFmrhXPob9KQhIdISIvf3nam868Q9yq0UBc4aFgDcv2UUGLCCUxn4NEyW
 E0o/6e6uxmZziWhlajv4l6fH8jplyKEMp7BwBcnF/HKLVvlMux6bCwt620d2m2mM+kTd
 RB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qB2SYCS1v55sYBnoh6a9A5+nyB8wI9x+IMkUjRVdEyU=;
 b=Lju2wgd3maPKUfA4uJrwvMvWkUxvL1gRa3gKC/9POaO6RnN6/vpfUA9qxe2U2ehtXg
 WqWOI2beiYZSX9gNFxQ1vo4Knt9/Wqf0IsNgjOAihBqI6vKJynu7fa2IQ1B6o6WwGAPJ
 oud9HIrOe6/eljVpAuCI/9W8HJuOwlk1RVuJoYX6JWvLT7LQ8UuSZowxrbsnIIRwLopX
 DQZRg3sWNpU99uwIMZnTRJ5jtLoeKDX2FDRXRkVqgv48u+5ACZeteuDWFidLDa9/lFna
 S5GYQKYhO6Oj2KmFtRF5J3K7hJZPIAHZa+12dx++UjsBJXiU4c9QPFx2aU7nJCzDuSCO
 FdAw==
X-Gm-Message-State: AOAM532UZb3iNbFtJ51xBwaOy/wV45ypknWY+3gCe3kvRXuT9hNf9NAw
 SPoNZDTc1ip+hxyEe/sO867aDg==
X-Google-Smtp-Source: ABdhPJzrpFgeI141caO0N8Tzp+D9LOCP9wb+YCgmPCkrvEZHVVVGvZXPcNLDcIUBBkFD7Rirz4jVww==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr2852681wme.85.1607069999842; 
 Fri, 04 Dec 2020 00:19:59 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:296a:40d9:d5a0:bbc5])
 by smtp.gmail.com with ESMTPSA id b17sm1691156wrv.10.2020.12.04.00.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 00:19:59 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: panel-simple-dsi: add Khadas TS050 panel
 bindings
Date: Fri,  4 Dec 2020 09:19:48 +0100
Message-Id: <20201204081949.38418-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204081949.38418-1-narmstrong@baylibre.com>
References: <20201204081949.38418-1-narmstrong@baylibre.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGQgdGhlIGJpbmRpbmdzIGZvciB0aGUgS2hhZGFzIFRTMDUwIDEwODB4MTkyMCA1IiBM
Q0QgRFNJIHBhbmVsIGRlc2lnbmVkIHRvIHdvcmsKd2l0aCB0aGUgS2hhZGFzIEVkZ2UtViwgQ2Fw
dGFpbiwgVklNMyBhbmQgVklNM0wgU2luZ2xlIEJvYXJkIENvbXB1dGVycy4KClNpZ25lZC1vZmYt
Ynk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS1kc2kueWFtbCAgICAgfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2lt
cGxlLWRzaS55YW1sCmluZGV4IDcyZTRiNmQ0ZDVlMS4uZmJkNzE2NjkyNDhmIDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1z
aW1wbGUtZHNpLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sCkBAIC0zNSw2ICszNSw4IEBAIHByb3Bl
cnRpZXM6CiAgICAgICAtIGJvZSx0djA4MHd1bS1ubDAKICAgICAgICAgIyBJbm5vbHV4IFAwNzla
Q0EgNy44NSIgNzY4eDEwMjQgVEZUIExDRCBwYW5lbAogICAgICAgLSBpbm5vbHV4LHAwNzl6Y2EK
KyAgICAgICAgIyBLaGFkYXMgVFMwNTAgNSIgMTA4MHgxOTIwIExDRCBwYW5lbAorICAgICAgLSBr
aGFkYXMsdHMwNTAKICAgICAgICAgIyBLaW5nZGlzcGxheSBLRDA5N0QwNCA5LjciIDE1MzZ4MjA0
OCBURlQgTENEIHBhbmVsCiAgICAgICAtIGtpbmdkaXNwbGF5LGtkMDk3ZDA0CiAgICAgICAgICMg
TEcgQUNYNDY3QUtNLTcgNC45NSIgMTA4MMOXMTkyMCBMQ0QgUGFuZWwKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
