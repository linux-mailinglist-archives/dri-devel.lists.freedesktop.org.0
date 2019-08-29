Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9803A329E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8766E326;
	Fri, 30 Aug 2019 08:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7930D6E116
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 18:14:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p13so4804019wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5BDwJTTuIk+D+z/ak+LF1JizyULEFBW5xxK6pHjPL3c=;
 b=dYY8krBlf9pvJD+yJBDIirYCPqntu7xjt2L4HmjeoxVJbU5047atmiPnZGYJlyZlfh
 nauL+q/XfKkL2+Wz10AAcXKtZ0J1iRHv2WLzakxY/HA379pIxmhzU2WmqnzSZd6nSC6Z
 NZL4CYXSZME5oBoQBXFpcMrqBtZYelyc7d4Zbz1ccjSgs0jvQUAqQWudkAa26kB4kmaV
 FmDie7v3OptdhmG9gIo5QhjrqAnVbMUPStuXdcBCd+4m+byIY+w+IwwxBcv3l1KmXy0N
 msGB2wFgWpYAE/b4rowbk826R1kQanPyxchzI9QvY8osCPNV3HTarh/5EQcfW7Q/93of
 Abbw==
X-Gm-Message-State: APjAAAVS/DQYmsiEqrxtaVC/SWIwBwy2LTkQW/n4gPCE3MyCZl6XWZIF
 ifP27c6HMkL2XymDwKoQDJQ=
X-Google-Smtp-Source: APXvYqyeYnFjFrzY5T0uyuMXKyGPdPlHCkDPafQ6O6/dUqDROyeWLI8L027MVtJzWfY1DQdIMkk0NQ==
X-Received: by 2002:a1c:c747:: with SMTP id x68mr13863967wmf.14.1567102450057; 
 Thu, 29 Aug 2019 11:14:10 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net.
 [86.58.59.25])
 by smtp.gmail.com with ESMTPSA id f75sm4178671wmf.2.2019.08.29.11.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 11:14:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 2/4] drm/modes: Fix the command line parser to take force
 options into account
Date: Thu, 29 Aug 2019 20:14:08 +0200
Message-ID: <11695537.9NiCXotxsl@jernej-laptop>
In-Reply-To: <20190827115850.25731-2-mripard@kernel.org>
References: <20190827115850.25731-1-mripard@kernel.org>
 <20190827115850.25731-2-mripard@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5BDwJTTuIk+D+z/ak+LF1JizyULEFBW5xxK6pHjPL3c=;
 b=UZkSinbwUdBPt15Trl15BZYjmQ3ojOcSh/XQMKrVXiCODLTiOXKH+o4yWhxhouyMfy
 709GM6Hy4H6Y1YZWnxSYAwwpj2okiTOEzXewy92kpPYAXSLpA9j78QTCMx5QMAh+OTxw
 vYBRKNmQfvzGyoqTMK4WOjA2kHUkFkpywmR7FeSlYfi0h5J5Ddl9HxftBtjt3nVFjgUk
 NsR8BBC/j9aU0iOzu49R8mPNVUFA2ZLm7XByBl3DjJvWFbqPBAr73Xcot+9V0hrLkKjK
 qiVu1yjHOmtQ9kOIaHXVDUW8ZeOf4r59ejDOiFxK/H+b397BILBgEhTodMX0XtOBa0wb
 Ht3w==
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

SGkhCgpEbmUgdG9yZWssIDI3LiBhdmd1c3QgMjAxOSBvYiAxMzo1ODo0OCBDRVNUIGplIE1heGlt
ZSBSaXBhcmQgbmFwaXNhbChhKToKPiBGcm9tOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGJvb3RsaW4uY29tPgo+IAo+IFRoZSBjb21tYW5kIGxpbmUgcGFyc2VyIHdoZW4gaXQgaGFzIGJl
ZW4gcmV3cml0dGVuIGludHJvZHVjZWQgYSByZWdyZXNzaW9uCj4gd2hlbiB0aGUgb25seSB0aGlu
ZyBvbiB0aGUgY29tbWFuZCBsaW5lIGlzIGFuIG9wdGlvbiB0byBmb3JjZSB0aGUgZGV0ZWN0aW9u
Cj4gb2YgYSBjb25uZWN0b3IgKHN1Y2ggYXMgdmlkZW89SERNSS1BLTE6ZCksIHdoaWNoIGFyZSBj
b21wbGV0ZWx5IHZhbGlkLgo+IAo+IEl0J3MgYmVlbiBmdXJ0aGVyIGJyb2tlbiBieSB0aGUgc3Vw
cG9ydCBmb3IgdGhlIG5hbWVkIG1vZGVzIHdoaWNoIHRha2UKPiBhbnl0aGluZyB0aGF0IGlzIG5v
dCBhIHJlc29sdXRpb24gYXMgYSBuYW1lZCBtb2RlLgo+IAo+IExldCdzIGZpeCB0aGlzIGJ5IHJ1
bm5pbmcgdGhlIGV4dHJhIGNvbW1hbmQgbGluZSBvcHRpb24gcGFyc2VyIG9uIHRoZSBuYW1lZAo+
IG1vZGVzIGlmIHRoZXkgb25seSB0YWtlIGEgc2luZ2xlIGNoYXJhY3Rlci4KPiAKPiBGaXhlczog
ZTA4YWI3NGJkNGM3ICgiZHJtL21vZGVzOiBSZXdyaXRlIHRoZSBjb21tYW5kIGxpbmUgcGFyc2Vy
IikKPiBSZXBvcnRlZC1ieTogSmVybmVqIMWga3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5j
b20+Cj4gUmVwb3J0ZWQtYnk6IFRob21hcyBHcmFpY2hlbiA8dGhvbWFzLmdyYWljaGVuQGdvb2ds
ZW1haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRA
Ym9vdGxpbi5jb20+CgpSZXZpZXdlZC1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVj
QHNpb2wubmV0PgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
