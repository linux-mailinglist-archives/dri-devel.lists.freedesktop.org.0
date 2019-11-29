Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EA410D6B8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458C46E915;
	Fri, 29 Nov 2019 14:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267136E915;
 Fri, 29 Nov 2019 14:12:13 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64570
 helo=[192.168.10.174])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iah0E-0002OJ-P7; Fri, 29 Nov 2019 15:12:10 +0100
Subject: Re: [PATCH v2 01/14] video: fb_defio: preserve user fb_ops
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <cover.1575022735.git.jani.nikula@intel.com>
 <022c82429da15d6450ff9ac1a897322ec3124db4.1575022735.git.jani.nikula@intel.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <b9c25f8d-c1e4-3c72-c6ed-903015a69e63@tronnes.org>
Date: Fri, 29 Nov 2019 15:12:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <022c82429da15d6450ff9ac1a897322ec3124db4.1575022735.git.jani.nikula@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mCOMn0jrLhbugFa3zJRR2tiZlWvauRU6XzY33ntGSlM=; b=Rb+LNaqGByG5T1nIeu0bhgL+1G
 ijwGWqsa+GOdhNYG6ddgMBpmLYJumKDygTiPMDIgKp+XWbJdwuFQ2YFQDjVzqpm0HYq/A2qmfiXJV
 GEYB++IYytbrlaUYfQuhirAXZANtB/6gvjrmj/yygnyKi5W3VfWYfbzHKSULtGBSSsDjeepBRrKX+
 nyREtr+mrpDMV9Uy5VzP7yCnLSCP/suWtBfD7UGrgAmorX0+2//e8FdcSdEn3ZLElBqjugsLP9fAI
 pv2pp5EqZhtbmqrLrbLv16Htam7yc+XTE8RP/xeWMsmwKQuGHLTRRI1U8/vlqOtChG7oZSvI0cKkN
 jDL6WUCw==;
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjkuMTEuMjAxOSAxMS4yOSwgc2tyZXYgSmFuaSBOaWt1bGE6Cj4gTW9kaWZ5aW5nIGZi
X29wcyBkaXJlY3RseSB0byBvdmVycmlkZSBmYl9tbWFwIHdpdGggZmJfZGVmZXJyZWRfaW9fbW1h
cAo+IGFuZCB0aGVuIHJlc2V0dGluZyBpdCB0byBOVUxMIGFmdGVyd2FyZHMgY2F1c2VzIHByb2Js
ZW1zIGFsbCBvdmVyIHRoZQo+IHBsYWNlLiBGaXJzdCwgaXQgcHJldmVudHMgbWFraW5nIHRoZSBm
Ym9wcyBtZW1iZXIgb2Ygc3RydWN0IGZiX2luZm8gYQo+IGNvbnN0IHBvaW50ZXIsIHdoaWNoIG1l
YW5zIHdlIGNhbid0IG1ha2Ugc3RydWN0IGZiX29wcyBjb25zdAo+IGFueXdoZXJlLiBTZWNvbmQs
IGEgZmV3IHBsYWNlcyBoYXZlIHRvIGdvIG91dCBvZiB0aGVpciB3YXkgdG8gcmVzdG9yZQo+IHRo
ZSBvcmlnaW5hbCBmYl9tbWFwIHBvaW50ZXIgdGhhdCBnZXRzIHJlc2V0IHRvIE5VTEwuCj4gCj4g
U2luY2UgdGhlIG9ubHkgdXNlciBvZiB0aGUgZmJvcHMtPmZiX21tYXAgaG9vayBpcyBmYl9tbWFw
KCkgaW4gZmJtZW0uYywKPiBjYWxsIGZiX2RlZmVycmVkX2lvX21tYXAoKSBkaXJlY3RseSB3aGVu
IGRlZmVycmVkIElPIGlzIGVuYWJsZWQsIGFuZAo+IGF2b2lkIG1vZGlmeWluZyBmYl9vcHMgYWx0
b2dldGhlci4KPiAKPiBTaW1wbHkgdXNlIGluZm8tPmZiZGVmaW8gdG8gZGV0ZXJtaW5lIHdoZXRo
ZXIgZGVmZXJyZWQgSU8gc2hvdWxkIGJlIHVzZWQKPiBvciBub3QuIFRoaXMgc2hvdWxkIGJlIGFj
Y3VyYXRlIGVub3VnaCBmb3IgYWxsIHVzZSBjYXNlcywgYWx0aG91Z2gKPiBwZXJoYXBzIG5vdCBw
ZWRhbnRpY2FsbHkgY29ycmVjdC4KPiAKPiB2MjogU2ltcGxpZnkgY29uc2lkZXJhYmx5IGJ5IGNh
bGxpbmcgZmJfZGVmZXJyZWRfaW9fbW1hcCgpIGRpcmVjdGx5Cj4gICAgIChEYW5pZWwsIFZpbGxl
KQo+IAo+IENjOiBKYXlhIEt1bWFyIDxqYXlhbGtAaW50d29ya3MuYml6Pgo+IENjOiBsaW51eC1m
YmRldkB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gLS0t
CgpOaWNlIHNpbXBsZSBzb2x1dGlvbjoKCkFja2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
