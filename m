Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF2682AE1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 07:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623B889BBE;
	Tue,  6 Aug 2019 05:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3935589BBE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 05:23:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 4105B28A885
Subject: Re: [PATCH v3 0/8] drm/panfrost: Add heap and no execute buffer
 allocation
To: Rob Herring <robh@kernel.org>
References: <20190802195150.23207-1-robh@kernel.org>
 <104f5aea-5b9f-1ce9-8b36-c3b64daa6eda@collabora.com>
 <CAL_JsqLOtsGNROeesH9pY661NXknhrwsNMGDD9rJLh5XUoQC9Q@mail.gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <6c4d3896-5f96-a31c-2f4c-9c0432a0af9d@collabora.com>
Date: Tue, 6 Aug 2019 07:23:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLOtsGNROeesH9pY661NXknhrwsNMGDD9rJLh5XUoQC9Q@mail.gmail.com>
Content-Language: en-US
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC81LzE5IDExOjEwIFBNLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBNb24sIEF1ZyA1LCAy
MDE5IGF0IDEwOjEwIEFNIFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+
IHdyb3RlOgo+Pgo+PiBPbiA4LzIvMTkgOTo1MSBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+PiBU
aGlzIHNlcmllcyBhZGRzIG5ldyBCTyBhbGxvY2F0aW9uIGZsYWdzIFBBTkZST1NUX0JPX0hFQVAg
YW5kCj4+PiBQQU5GUk9TVF9CT19OT0VYRUMuIFRoZSBoZWFwIGFsbG9jYXRpb25zIGFyZSBwYWdl
ZCBpbiBvbiBHUFUgcGFnZSBmYXVsdHMuCj4+Pgo+Pj4gVG9tZXUgcmVwb3J0cyBoZSBoYXMgdGVz
dGVkIHRoaXMgaW4gdGhlIHBhbmZyb3N0IENJLgo+Pgo+PiBBbGwgc2VlbXMgdG8gYmUgd29ya2lu
ZyBmaW5lOgo+Pgo+PiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvdG9tZXUvbWVzYS9w
aXBlbGluZXMvNTM1OTEKPiAKPiBUaGFua3MgZm9yIHRlc3RpbmcuIElzIHRoYXQgYSBUZXN0ZWQt
Ynk/CgpZZXAuCgpUaGFua3MsCgpUb21ldQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
