Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5129AE6
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 17:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0096E114;
	Fri, 24 May 2019 15:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD61E6E114
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 15:21:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w9so3510084wmi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z0n3xscdT5tjZjNABlDhyi59ToxPXKWRSC1PEc2N1vo=;
 b=duGwmd5gRxU/v1BvRyIaU7SqXI2qyp5Jmg2e4XPBdNYDkz9jhzlz7Rmu38M53ePved
 cptEVh5tkrr9rNV6yeERC5prGhvwyOAZbi0p0p5OAx/yNoNWiN8qtTMnem4kRqkv/C4R
 mpqy2HNzwIoNXhiFcKj7//W5l3XoFXMHu/6b7t3TNWFhb/7Dgzd56SQ5YqdMVQTka8fk
 I/Ak/B/hFKNCc3pCvUbROVJASrmQ3WwndsYEnr5giyB9I61FY8n8uQ+ZZqVzfr15tYqr
 i+e8jkIwn1vayJYRvE2Pc5Si4Xd4tmNcVw/tm/GdlArFboixnmIO+NV090hkOGQYwx6e
 0xPA==
X-Gm-Message-State: APjAAAVQ+xq32PFk3xpx8Pv/UfBM2o/pzEh36gdBCKvJTOnRGPDTs/Wr
 z5VlhooX3yoC9p1cSQZ0cOPlEvCR
X-Google-Smtp-Source: APXvYqw/tjSQC/yLPiP22aq0AwQVRX1KiMl6mSXoSrGriw2BGcoK0e1mSjtS0FLb4tUQTf0ip+ujvw==
X-Received: by 2002:a1c:3:: with SMTP id 3mr17492373wma.44.1558711273403;
 Fri, 24 May 2019 08:21:13 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id g13sm3307837wrw.63.2019.05.24.08.21.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 08:21:12 -0700 (PDT)
Date: Fri, 24 May 2019 16:19:52 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/4] drm/tegra: remove irrelevant DRM_UNLOCKED flag
Message-ID: <20190524151952.GC8938@arch-x1c3>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
 <20190523091555.GA18130@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523091555.GA18130@ulmo>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Z0n3xscdT5tjZjNABlDhyi59ToxPXKWRSC1PEc2N1vo=;
 b=Cg4ikwx3uIhHhcVDDT8OzO1sANiceBX/o63nUbOrsDPUV8QkwAtqZtqw6t+m9wf2Kv
 WTTRKEMiU7BhSvW/3ATKPM2xH+TUZtoO1jsvvtrM598BDFpP9AWmCioZH2nXxbyM+0AU
 QwXcw1RE1F+zKMjlf0CW0Wmp08rXt4aQNbHnnIWYuELfS3FPHRKECeCNemvnoqxmYGrW
 z6Hm+O41YYMi7Qe7jibJdZUR/vIydxFmWeJvbzZmYrpusKlGmuNNiMlGRhHCDCH9bbrZ
 TbTfeBfeSxpZKjuSPsSvOOlKIpNnx6y6qrN9aLtyV5ifjuhld+7p1p9HfTNzWYtKf/Qt
 2OpA==
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
Cc: linux-tegra@vger.kernel.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yMywgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gT24gV2VkLCBNYXkgMjIsIDIw
MTkgYXQgMDQ6NDY6NTlQTSArMDEwMCwgRW1pbCBWZWxpa292IHdyb3RlOgo+ID4gRnJvbTogRW1p
bCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+IAo+ID4gRFJNX1VOTE9D
S0VEIGRvZXNuJ3QgZG8gYW55dGhpbmcgZm9yIG5vbi1sZWdhY3kgZHJpdmVycy4gUmVtb3ZlIGl0
Lgo+ID4gCj4gPiBDYzogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiA+IENj
OiBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtv
dkBjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5j
IHwgMjggKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiAKPiBJIGFzc3VtZSB5b3Ugd2FudCB0
byB0YWtlIHRoaXMgdGhyb3VnaCBkcm0tbWlzYz8gSW4gdGhhdCBjYXNlOgo+IAo+IEFja2VkLWJ5
OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IE90aGVyd2lzZSBsZXQg
bWUga25vdyBhbmQgSSdsbCBwaWNrIGl0IHVwIGludG8gdGhlIFRlZ3JhIHRyZWUuCj4gClllcywg
SSdsbCBwaWNrIGl0IHVwIHRocm91Z2ggZHJtLW1pc2MuCgpUaGFua3MKRW1pbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
