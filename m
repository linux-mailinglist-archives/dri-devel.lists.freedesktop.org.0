Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C1765A99
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 17:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DE96E217;
	Thu, 11 Jul 2019 15:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103046E217
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 15:39:16 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id 13so2776359ybx.8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 08:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=peoVo3TtYhCiL+51dswyO9onMs+Dkpf92jN7u1HsEt0=;
 b=diRuj3wX8Mjrb2XQUtsYQ4RElYIbaFwQ4jLY8ZKGhPnqTBo1VrnXVcqTZnISYihqNq
 6vlK2d2sy7YGW+o0xtKQ1/8R3dlQwtKpFOWge4sQGtkkhd06DWyURsJ/2pnQWDXwUKAm
 +5wG3LCMuhq1wcVEziZFYbuXnQf3A/NQ0otH9KzJS42ULXzKwY90ttcV0MJL2UFkTX4A
 wglia8gGz0gPy/j5fIlgMlJfW/LhOfHISI4ierRf/kpOG7VWmhcRKldBmXhRjHSGmfJ5
 n0O9Zs7upTWb+SpHq9N3tCjRjrpphTPjVnhZfeVWKVtyeBBjWkNlJJacvJ0MgaDIrGFu
 W3zw==
X-Gm-Message-State: APjAAAU4lHK5p914YeArnTzVnCONnwOQyqSiQ54/Lf85EvlgYWWW5WRn
 EPrrfHDU5hL3ytuVceC39ysQqw==
X-Google-Smtp-Source: APXvYqybtlg8AEBya7NejADcNX9Bxy1+G/DvsRy1W0OgrVYTrLZVbKwrm12AgsRzqb7txue4Do5NPg==
X-Received: by 2002:a25:8250:: with SMTP id d16mr2060984ybn.366.1562859556268; 
 Thu, 11 Jul 2019 08:39:16 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v68sm1464045ywe.23.2019.07.11.08.39.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 08:39:15 -0700 (PDT)
Date: Thu, 11 Jul 2019 11:39:15 -0400
From: Sean Paul <sean@poorly.run>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 4/5] drm/syncobj: Include the prototype for
 drm_timeout_abs_to_jiffies()
Message-ID: <20190711153915.GF136584@art_vandelay>
References: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
 <20190710125143.9965-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710125143.9965-4-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=peoVo3TtYhCiL+51dswyO9onMs+Dkpf92jN7u1HsEt0=;
 b=gb1Ft07+4lIbWCDhC3tUtpT0N/QxwVL5MCYYuYVlwD/XfHqziWvuyTcqFmwB76wg10
 9Yk5ZeO8imAXqWwNLCFsEGrxkXF8aE9aKHVvP6Mo+IYHxyKAT0xU1AKxbA7mv9gKIwYH
 D2QsUL2Xgw8dUO9ObuGft0EyGl4zSjOPSfZiiKRdv/SZAkEiRRMdVTou7TGwY8jNzLJA
 iOWZhk2cf+YiEq9FS1nSuU7NmyXJAHegJyoDDXDriP0rZf1e1dhUIFV6+96spDrREz58
 6Rtq/SudqtpUKCsViztm2n4C17b34NuuFOFJjmWv29AF8znni2XDms5v7tM5kaTXVOIC
 vy6A==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDM6NTE6NDJQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFNwYXJzZSBjb21wbGFpbnM6Cj4gLi4vZHJpdmVycy9ncHUvZHJtL2RybV9zeW5j
b2JqLmM6OTQyOjEzOiB3YXJuaW5nOiBzeW1ib2wgJ2RybV90aW1lb3V0X2Fic190b19qaWZmaWVz
JyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+IAo+IEluY2x1ZGUgdGhl
IGNvcnJlY3QgaGVhZGVyIHdpdGggdGhlIHByb3RvdHlwZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2Jq
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+IGluZGV4IGExOTljOGQ1NmI5NS4u
MDBlZWNjOWM0NjRiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPiBAQCAtNTgsNiArNTgsNyBA
QAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9nZW0uaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQu
aD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fc3luY29iai5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV91
dGlscy5oPgoKSnVzdCByZWFsaXplZCB3ZSBoYXZlIGJvdGggZHJtX3V0aWwuaCBhbmQgZHJtX3V0
aWxzLmgsIHdoYXQgYSB3b3JsZCEKClJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5
LnJ1bj4KCj4gIAo+ICAjaW5jbHVkZSAiZHJtX2ludGVybmFsLmgiCj4gIAo+IC0tIAo+IDIuMjEu
MAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9T
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
