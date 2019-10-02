Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC739C485A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCA06E902;
	Wed,  2 Oct 2019 07:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5ABA6E5CA;
 Wed,  2 Oct 2019 05:18:05 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id e1so5717999pgj.6;
 Tue, 01 Oct 2019 22:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:user-agent;
 bh=swe25t+lxOEruvSVv2ts6lHoxHEk7rNBAWMV8cWmjOc=;
 b=dM7i4PCPN+4QYPYn6cTmIm9+GPPo7pqKMQDwsTLrA70w8kRmntxEYt+vV39icF6u2j
 6AbxGWhSouvbbk8gWze6ltUYe8KTMTpaVl2N///iV8WNwlrNGyfPBKuVbjpYiN+tGViO
 y4gUyAoAM9/C5fK5a3xOUZEvBotGck7rTv/DFGxagKBtTvySrx9skm+KD5Cc0SZrqvga
 lCcb1Qgyuzss5XOe0z1Ub+wLw6yTV0euo571tB9zMOIOxfYUcj8ZxgkPfYiq0t8UEWep
 OtNtfvUA5fLnrKz7LbgQyPZdjUwmnZmv89YxdPualzCNyBuEe0SHK80SwvApVTSo43Qr
 edrg==
X-Gm-Message-State: APjAAAVlHzNtDLgi9SNSUiuI/DSkztrNUav+//PIbq2x9uU6U7rHnJ68
 lbNDES+0VHDpkCElHA0ya8c=
X-Google-Smtp-Source: APXvYqwpKJcblMq0mpI/hveU2vbjEWJo6IKKvou0p5GSYWDur1xu05LUEKTdioxnw+g3ePGUQ4C4aA==
X-Received: by 2002:aa7:81cb:: with SMTP id c11mr2438922pfn.251.1569993485244; 
 Tue, 01 Oct 2019 22:18:05 -0700 (PDT)
Received: from LGEARND20B15 ([27.122.242.75])
 by smtp.gmail.com with ESMTPSA id z13sm18228362pfg.172.2019.10.01.22.18.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 22:18:04 -0700 (PDT)
Date: Wed, 2 Oct 2019 14:17:59 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com,
 David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: Drop unused variable and statement
Message-ID: <20191002051759.GA161133@LGEARND20B15>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:user-agent;
 bh=swe25t+lxOEruvSVv2ts6lHoxHEk7rNBAWMV8cWmjOc=;
 b=HBqzpDZYcZjgpRunc6y7IF170eXNXKl5Ah2zEIFOrmB+v84x5h9heqxCGMrLY14bPA
 p9LLfOakNoGxZKVJdj/F+/ZAtyw/IwcdRW5HT8dslzClmxCXnuDQhXjEILUiw9Z6x+ea
 ucuoSHQ/xGLko3fbtGk9BWC6e103EHwk14EPFI+57U8jFYqa/8D8INeK6FW39VAm0D9G
 D3osVnpOVbveO4DQmS7dpi4oo1v3PtYls+unfAKKYwqP+yj2P7v9QXpThYoTVhi/WFdW
 na2seGZoK0FH0+i5rPn4EKewzrUgJ9e9b31mau6rSixIaPFVzAkMB2MiUQtsS/gqB6PO
 /kvQ==
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
Cc: austindh.kim@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXZlbiB0aG91Z2ggJ3NtdThfc211JyBpcyBkZWNsYXJlZCwgaXQgaXMgbm90IHVzZWQgYWZ0ZXIg
YmVsb3cgc3RhdGVtZW50LgoKICAgc211OF9zbXUgPSBod21nci0+c211X2JhY2tlbmQ7CgpTbyAn
dW51c2VkIHZhcmlhYmxlJyBjb3VsZCBiZSBzYWZlbHkgcmVtb3ZlZAp0byBzdG9wIHdhcm5pbmcg
bWVzc2FnZSBhcyBiZWxvdzoKCiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2Vy
cGxheS9zbXVtZ3Ivc211OF9zbXVtZ3IuYzoxODA6MjI6CiAgIHdhcm5pbmc6IHZhcmlhYmxlIOKA
mHNtdThfc2114oCZIHNldCBidXQgbm90IHVzZWQgCiAgIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQoKICAgc3RydWN0IHNtdThfc211bWdyICpzbXU4X3NtdTsKICAgICAgICAgICAgIF4KU2ln
bmVkLW9mZi1ieTogQXVzdGluIEtpbSA8YXVzdGluZGgua2ltQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3Ivc211OF9zbXVtZ3IuYyB8IDIgLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3NtdW1nci9zbXU4X3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211bWdyL3NtdThfc211bWdyLmMKaW5kZXggNDcyOGFhMi4uN2RjYTA0YSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3NtdThfc211
bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3NtdThfc211
bWdyLmMKQEAgLTE3NywxMiArMTc3LDEwIEBAIHN0YXRpYyBpbnQgc211OF9sb2FkX21lY19maXJt
d2FyZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogCXVpbnQzMl90IHRtcDsKIAlpbnQgcmV0ID0g
MDsKIAlzdHJ1Y3QgY2dzX2Zpcm13YXJlX2luZm8gaW5mbyA9IHswfTsKLQlzdHJ1Y3Qgc211OF9z
bXVtZ3IgKnNtdThfc211OwogCiAJaWYgKGh3bWdyID09IE5VTEwgfHwgaHdtZ3ItPmRldmljZSA9
PSBOVUxMKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCXNtdThfc211ID0gaHdtZ3ItPnNtdV9iYWNr
ZW5kOwogCXJldCA9IGNnc19nZXRfZmlybXdhcmVfaW5mbyhod21nci0+ZGV2aWNlLAogCQkJCQkJ
Q0dTX1VDT0RFX0lEX0NQX01FQywgJmluZm8pOwogCi0tIAoyLjYuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
