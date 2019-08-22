Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6798987
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 04:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B536E40D;
	Thu, 22 Aug 2019 02:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D6089FF9;
 Thu, 22 Aug 2019 02:40:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j16so3860677wrr.8;
 Wed, 21 Aug 2019 19:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2CWiDloBanvTA4UPTrbF7OF6nI8ojFqUh/DcikOnd90=;
 b=trNAK9RMU6DhnNuAnoxEvw7g3F+7MW7ynDi3bflXKjgOpvjPq7ApJ4Xm0SuartNJ+j
 uexlJcjLYSsVYbbNovXD9merjSsfVqJvS+adifMWoemnTC0XvnWACAlzNGE1gfez+5gi
 k49MmEcRlLrGQ1jboz6wN7SAMxmfs9iG0yVxXFy9OqnmC/tbDJvxkOpO6ijT+aQezhrs
 v/wr70AiGGtL0XM82WI0UmdY3HTOhzMHmAURSAqKOjuJkfWj2K5zlyT4eLDBkytrEo+E
 1h3OQEs4fxML9qqP8l2U0Iduoy8J6iVgnUvG2h+L/uqLgdnkL9rEeBoUybJhxf6Dl++k
 ffTQ==
X-Gm-Message-State: APjAAAVO372XZMi9+R/+LX/dAU3w5K3Vym/FCjl0Dg+eebD8fpIUkeSd
 EHC+G0X8VmoedXtuae2cnMOw9CZgkYy5GReRwUg=
X-Google-Smtp-Source: APXvYqzr2GWzF1+u7N2L7j/1p/Kp0hGUUMxfJH3ERizmHnob1SxP5PVPzIQ/k6UYs7jVVpTLtHB1EyIafZRgw0MVXaM=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr4708309wrn.142.1566441632459; 
 Wed, 21 Aug 2019 19:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190710015720.107326-1-yuehaibing@huawei.com>
In-Reply-To: <20190710015720.107326-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Aug 2019 22:40:20 -0400
Message-ID: <CADnq5_OFd8N1PpBXwr5mC0=SvZsKx7QUPqavLDEJ+d43hOO4Ng@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: remove duplicated include from
 gfx_v9_0.c
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=2CWiDloBanvTA4UPTrbF7OF6nI8ojFqUh/DcikOnd90=;
 b=hIlXKeAXDt479x2EtwiJlj0FTnsca6lNlIOXGAfSwL5ia4/UiWbEPVWq4VF5t6Q3co
 5oAZw7cYTLrkFM1ok9F4Ao7545uOmmgZeQL0xg92DsUDwvq6n7eCwAKfjBt5W0CCjhsJ
 1cOQNexM7Untgwq+JuQrNpVoWVyjvSoETv4oYeGu4Q/n4zA8yFcTa7Bv/23kXeBaQe35
 FF/pbYQBXNUzBQPYZ61EeNSDe3TYTS/aKLggd44Bh9+YnPzLcnWqIww06/ldSsX5CRyx
 oHCKgaXAn1jC1PAXbqTUW5xeB0OjCt779yJRadGxrXuJlXIY6w2X3Rk3+vyiwlaiytjG
 /Dng==
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
Cc: "Quan, Evan" <evan.quan@amd.com>, Dave Airlie <airlied@linux.ie>,
 Feifei Xu <Feifei.Xu@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "S,
 Shirish" <shirish.s@amd.com>, Huang Rui <ray.huang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 James Zhu <James.Zhu@amd.com>, Rex Zhu <Rex.Zhu@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gdGhhbmtzIQoKQWxleAoKT24gVHVlLCBKdWwgOSwgMjAxOSBhdCAxMTowMyBQTSBZ
dWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gUmVtb3ZlIGR1cGxp
Y2F0ZWQgaW5jbHVkZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdA
aHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
YyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jCj4gaW5kZXggNWJhMzMyMzc2NzEwLi44MjJmNDUxNjEyNDAg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKPiBAQCAtMzksNyArMzks
NiBAQAo+ICAjaW5jbHVkZSAidmVnYTEwX2VudW0uaCIKPiAgI2luY2x1ZGUgImhkcC9oZHBfNF8w
X29mZnNldC5oIgo+Cj4gLSNpbmNsdWRlICJzb2MxNS5oIgo+ICAjaW5jbHVkZSAic29jMTVfY29t
bW9uLmgiCj4gICNpbmNsdWRlICJjbGVhcnN0YXRlX2dmeDkuaCIKPiAgI2luY2x1ZGUgInY5X3N0
cnVjdHMuaCIKPgo+Cj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
