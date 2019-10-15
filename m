Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 896FBD7D9E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 19:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B123C898BE;
	Tue, 15 Oct 2019 17:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9EF898C8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 17:25:52 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id 83so17540882oii.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 10:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TuLY0T5XCanlGHWiiteaVAS0AqJDC0pQFFmFd4/UATA=;
 b=pNO6qDdjuXotqPmW7XE4B0Io3/vKnCkM7lDap3WqB9tIzWmKvsvKwD2+dTzn61IslH
 ElwLOaRPGhVB0tzOwRqoq94b2CTOK9czs2d8XKZFxJ7Vk31Hqx28QMidYVeOBRUzLTLj
 3OmLnQwLfRUGKjHZjDR1t5S2GgOvn247wLY9kUUz0JcAw93AbIT+lPyQgi36yMTZm8id
 Uv+eChXesVn4hHP5wra5kLmVWmxDkqR6gksdc8Y5KD/hhy+JKSxhxvV8+biDBCePiqgc
 022XwkyGm8mHE60bFEISl9Gnr0IWLTvxo8zc57hxqV2OPm2CsSbJ6GxTgU5+v3jzl3Ty
 l1Vg==
X-Gm-Message-State: APjAAAVl90eDIr1mHjgreisSheNuPZBrBhSGTLE+DLkCRGlSGgyJrbiT
 72vZP1nyhr3OWyMOxlBKNw==
X-Google-Smtp-Source: APXvYqyh/AJuW5SKmbZ5+aKVbLFBePskQhmFvgqaWcF+4jvMRtRbccQskyol9LKjgN6XrE7Ol69g6A==
X-Received: by 2002:aca:2807:: with SMTP id 7mr30578217oix.99.1571160351713;
 Tue, 15 Oct 2019 10:25:51 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y18sm6549012oto.2.2019.10.15.10.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 10:25:51 -0700 (PDT)
Date: Tue, 15 Oct 2019 12:25:50 -0500
From: Rob Herring <robh@kernel.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Convert sharp,ld-d5116z01b panel
 to DT schema
Message-ID: <20191015172550.GA4197@bogus>
References: <20191010210654.37426-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010210654.37426-1-jeffrey.l.hugo@gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMCBPY3QgMjAxOSAxNDowNjo1NCAtMDcwMCwgSmVmZnJleSBIdWdvIHdyb3RlOgo+
IENvbnZlcnQgdGhlIHNoYXJwLGxkLWQ1MTE2ejAxYiBwYW5lbCBiaW5kaW5nIHRvIERUIHNjaGVt
YS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWls
LmNvbT4KPiAtLS0KPiAgLi4uL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbGQtZDUxMTZ6MDFiLnR4dCAg
ICAgIHwgMjYgLS0tLS0tLS0tLS0tLS0tLQo+ICAuLi4vZGlzcGxheS9wYW5lbC9zaGFycCxsZC1k
NTExNnowMWIueWFtbCAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFy
cCxsZC1kNTExNnowMWIudHh0Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxsZC1kNTExNnowMWIueWFtbAo+
IAoKQXBwbGllZCwgdGhhbmtzLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
