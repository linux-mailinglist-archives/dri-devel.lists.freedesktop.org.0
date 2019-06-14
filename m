Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0F463EF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED38389AC6;
	Fri, 14 Jun 2019 16:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D1889AC6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:23:17 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B9966260E01;
 Fri, 14 Jun 2019 17:23:15 +0100 (BST)
Date: Fri, 14 Jun 2019 18:23:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 0/4] drm/panfrost: Expose perf counters to userspace
Message-ID: <20190614182312.0ca89301@collabora.com>
In-Reply-To: <CAL_JsqLtruq2ZFApGGUADCyEhQrGXOUV9Va-1bNqfCG+AOijGw@mail.gmail.com>
References: <20190529095233.26277-1-boris.brezillon@collabora.com>
 <20190529151619.GC32127@rosenzweig.io>
 <CAL_JsqLtruq2ZFApGGUADCyEhQrGXOUV9Va-1bNqfCG+AOijGw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 kernel@collabora.com, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBKdW4gMjAxOSAwOToxMjozOSAtMDYwMApSb2IgSGVycmluZyA8cm9iaCtkdEBr
ZXJuZWwub3JnPiB3cm90ZToKCj4gT24gV2VkLCBNYXkgMjksIDIwMTkgYXQgOToxNiBBTSBBbHlz
c2EgUm9zZW56d2VpZyA8YWx5c3NhQHJvc2VuendlaWcuaW8+IHdyb3RlOgo+ID4KPiA+IFdvb2hv
byEgUGF0Y2hlcyAxLTMgYXJlIFItYjsgcGF0Y2ggNCBpcyBBLWIuIEV4Y2l0aW5nIHByb2dyZXNz
ISBIb3BpbmcKPiA+IHRvIGhlYXIgd2hhdCBSb2IgYW5kIFN0ZXZlbiB0aGluayA6KSAgCj4gCj4g
QWxsIGxvb2tzIGZpbmUgdG8gbWUsIGJ1dCB0aGVyZSdzIGEga2J1aWxkIGVycm9yIG9uIHBhdGNo
IDQgdGhhdCBuZWVkcwo+IHRvIGJlIGZpeGVkLgoKWWVzLCBtaXNzaW5nIHVpbnRwdHJfdCBjYXN0
LiBJJ2xsIHNlbmQgYSBuZXcgdmVyc2lvbiB3aXRoIHRoYXQgZml4ZWQuCgpUaGFua3MsCgpCb3Jp
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
