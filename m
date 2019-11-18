Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DC7100810
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 16:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9F78972B;
	Mon, 18 Nov 2019 15:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8F88972B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 15:22:50 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id y194so15661122oie.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 07:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gaN4LslxP3Bx7Cg3oZErUCE4npve75FVcb9rqlelCK0=;
 b=ek+urujWCGV5OIzD7/Cst4kLMyl2eI5gEdy9pBkPF9vcPSCWkprgqi7AR7yX5psRaF
 7r2QnfYiGJLpZXvNx8w3QPySijjs/+aq+NHulrtp2QF7rIspPPU+3O/bZ1/cLzzZe7hL
 SEWf3NW8RHXXhbHOhwAeun2yf2+HjDm7VwI+rRraUvzXGm3FS3pm/Y+KTPd57YL13VtS
 g+tVJ7h0PBC6ENdR4tvBkv4JBeMhYFo3xgYlAPLtFcirAR9890Vh2wOIZygheJyKq/p8
 KIA+bGmwahtGQ55PstXk0JXKATqouYtagK9PcCJdVOVTYkEish+oOufWS8HlIDBqLyTh
 hvIQ==
X-Gm-Message-State: APjAAAWtlgNDLfJRybzrXnBU88fAHqGCh3DbT1054oFa5QdnWfUSHXjS
 zUzmhQTkD7AB+kxrqJE54vGrWJM5oydbEWL/3K4AoQ==
X-Google-Smtp-Source: APXvYqws+DGTnoqFf+Nw/B9jZ8m/E/S0oYt95u/u4ltpgT8zVR18K28/Cs+da9l2b5BRtbcsKQXDth+fSyjsUZvTm4U=
X-Received: by 2002:aca:ead7:: with SMTP id
 i206mr21296179oih.128.1574090569822; 
 Mon, 18 Nov 2019 07:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20191114200132.GA11077@SDF.ORG> <20191115123432.GB1208@intel.com>
In-Reply-To: <20191115123432.GB1208@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 18 Nov 2019 16:22:38 +0100
Message-ID: <CAKMK7uF5Oo9S1328URbWVv_OPxKCeOD88q1_qw=dxbZGYAYezA@mail.gmail.com>
Subject: Re: drm core/helpers and MIT license
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gaN4LslxP3Bx7Cg3oZErUCE4npve75FVcb9rqlelCK0=;
 b=chZn3hvP2W7RaZR1YaAy3cYw+2PytbAwMiQ28iY5RTdR5eWCh/njOalYFX+X3Tw/Ji
 gbm/ujQave8b7TwEzR1QTGGQnveoN/8qtfcuW+jkgI70bzdJdtrNrPc4M/3GTvtHG35y
 rK7N5uZPfMroPUcKgjgjD2IIfhMPv+znz0wss=
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
Cc: Maya Rashish <coypu@sdf.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTozNCBQTSBWaWxsZSBTeXJqw6Rsw6QKPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDE0LCAyMDE5IGF0
IDA4OjAxOjMyUE0gKzAwMDAsIGNveXB1QHNkZi5vcmcgd3JvdGU6Cj4gPiBIaSBEYW5pZWwsCj4g
Pgo+ID4gSSBkb24ndCB0aGluayB3ZSBjYW4gbWFrZSBhbnkgY29tcGxhaW50cyBhYm91dCBHUEwg
YmVpbmcgbW9yZSB3aWRlbHkKPiA+IHVzZWQgaW4gdGhlIERSTSBjb2RlLiBJdCdzIG5pY2UgdG8g
aGF2ZSB0aGUgY29kZSBhdCBhbGwsIHRoZSBNSVQgbGljZW5zZQo+ID4gaXMgYSBib251cy4gVGhh
bmtzIGZvciB3cml0aW5nIGl0IGFuZCBiZWFyaW5nIHdpdGggdXMuCj4gPgo+ID4gV291bGQgcmV3
cml0ZXMgZG9uZSBwdXJlbHkgZm9yIGxpY2Vuc2luZyByZWFzb25zIGJlIGFjY2VwdGVkIHVwc3Ry
ZWFtPwo+Cj4gUmV3cml0ZSBzaG91bGQgYmUgdGhlIGxhc3QgcmVzb3J0LiBJIHRoaW5rIGEgbG90
IG9mIHRoZSBHUEwgb25seSBzdHVmZgo+IGlzIHF1aXRlIHJlY2VudCBzbyB0aGVyZSdzIGEgZ29v
ZCBjaGFuY2UgdGhlIGF1dGhvcihzKSBhcmUgc3RpbGwgYXJvdW5kCj4gdG8gZGlzY3VzcyByZWxp
Y2Vuc2luZy4KClRoZSB0cm91YmxlIGlzIHRoaXMgc3R1ZmYgaXMgbW9zdGx5IGNvbWluZyBmcm9t
IHJlZmFjdG9yaW5ncyBvZgpncGwtb25seSBkcml2ZXJzLCBhbmQgcXVpY2sgY2hhdCB3aXRoIERh
dmUgbG9va3MgbGlrZSBzb21lIG9mIHRoYXQKY29kZSBjb21lcyBmcm9tIGdwbC1vbmx5IGZiZGV2
IGRyaXZlcnMuIERvaW5nIHRoZSByZWxpY2Vuc2luZyBwcm9wZXJseQp3aWxsIGJlIHNvbWUgd29y
ayBJIHRoaW5rLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
