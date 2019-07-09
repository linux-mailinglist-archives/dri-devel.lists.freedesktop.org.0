Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6945863E01
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 00:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453CB89938;
	Tue,  9 Jul 2019 22:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D30789938
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 22:50:13 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id i10so449238iol.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 15:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nvvoh+fbNkBLPpXy4Y6lZA9c7jtYP7QeOvjrEV4cBIw=;
 b=BxgS52KVlJl0Xfl3z5qgQwjUjENUDVobIpnd6i87afQq97OLENQMXsMPeZqY+F1NSj
 2PwuYBo28wEYSLkitONt/zrwXbrIlUDLvTixHqKmhr9J7LaZ/yP15bhQqzRlCS+2gdSb
 4tG0J/X3v9lcb7RdSIcIcpj08B6Y9aHmwtAtPZDX+e5+4WptDI8+vt/KmIAjWAM3x4X8
 tf/kB1xOfkBTwB3ZTsmEE72Lna2WYQtzA/yt+MOKUtldMRAnOKBX8yZY14Dk+gwhn9uh
 aH/sSlQndKvC6JTnBLLZbcMu/OoECoSx6XjBDBUcoX1Z6RJB7xjs9j1q6UnlMGuFBaUr
 WsvQ==
X-Gm-Message-State: APjAAAVU+2OaBnZwwkCU6am2UvQ2iDzlp6wx99j9r5c3USZ6flWgBHiJ
 HIlwQ68pdOwQJyRPRcSy1A==
X-Google-Smtp-Source: APXvYqyIRybL0nbRMpxsdXhfMWV2kUc5p622WEvGhc+cnLHFcA7qWZGwS/KW4h4GpNKPh1jLWlazuQ==
X-Received: by 2002:a05:6602:144:: with SMTP id
 v4mr27703160iot.202.1562712612914; 
 Tue, 09 Jul 2019 15:50:12 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id i4sm292005iog.31.2019.07.09.15.50.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 15:50:12 -0700 (PDT)
Date: Tue, 9 Jul 2019 16:50:11 -0600
From: Rob Herring <robh@kernel.org>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: rockchip: document VOP
 gamma LUT address
Message-ID: <20190709225011.GA11245@bogus>
References: <20190621211346.1324-1-ezequiel@collabora.com>
 <20190621211346.1324-2-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621211346.1324-2-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMSBKdW4gMjAxOSAxODoxMzo0NCAtMDMwMCwgRXplcXVpZWwgR2FyY2lhIHdyb3Rl
Ogo+IEFkZCB0aGUgcmVnaXN0ZXIgc3BlY2lmaWVyIGRlc2NyaXB0aW9uIGZvciBhbgo+IG9wdGlv
bmFsIGdhbW1hIExVVCBhZGRyZXNzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEV6ZXF1aWVsIEdhcmNp
YSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGZyb20gdjE6Cj4gKiBE
cm9wIHJlZy1uYW1lcywgc3VnZ2VzdGVkIGJ5IERvdWcuCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtdm9wLnR4dCAgIHwgNiArKysrKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAoKUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
