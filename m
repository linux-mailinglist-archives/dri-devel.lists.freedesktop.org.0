Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF6C65A91
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 17:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D6F6E216;
	Thu, 11 Jul 2019 15:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F096E216
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 15:37:30 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id i14so2771272ybp.7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 08:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=O1fLRH8lk/9I4JIftEsJoiq1bZVUtHQV/B1QbUp3GmU=;
 b=bYuiQwu4lrhl3C2gPeraKaSA62yvjJ4TbBkSYi9zJYBhKlsqVN4Wa1wht5yrRqk0dD
 UGyd/2hMNP5Sb3zFhvRn9HaQ1Yf1TeZW9LFy2N3wpTVSvghHbcU3JIEP+tAP56zRxrel
 a/q1iX0JLz79LVVyaOJR++f3jEbRKClHzeT8s0zUZTzyoM6zExFjIHDiSaRD6kD1ebvj
 ejKDzKGl2lMuj/Wo515U/ayex/Jb2pDSs01Aih0ySOYYH7clqTD0cGYVmVRjBqcn/bau
 9Mw+8CfsR8EvLhUrj+1C19QADn2EORjQionf/LAa/9JL26LRC9eSPyMWF96eWiKujARy
 wvxA==
X-Gm-Message-State: APjAAAUHH27yBslTyn/aiN7N73Nf0KgxNEfUFiEA63pkK1TNn/42x62l
 7/ch8WuAfB7Sl9fceqypQ8MWhw==
X-Google-Smtp-Source: APXvYqwU/OTmmHIRt3rOcnrg9BvPl7z5dl4eNqSlqxWeM1C/OjxcHVH2nGjaSyW/dTSDgH9nAD61BA==
X-Received: by 2002:a25:bd0f:: with SMTP id f15mr2913131ybk.151.1562859449495; 
 Thu, 11 Jul 2019 08:37:29 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id q8sm1399505ywj.58.2019.07.11.08.37.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 08:37:29 -0700 (PDT)
Date: Thu, 11 Jul 2019 11:37:28 -0400
From: Sean Paul <sean@poorly.run>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/5] drm: Include prototype for drm_need_swiotlb()
Message-ID: <20190711153728.GE136584@art_vandelay>
References: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
 <20190710125143.9965-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710125143.9965-3-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=O1fLRH8lk/9I4JIftEsJoiq1bZVUtHQV/B1QbUp3GmU=;
 b=ORdSWQzZAIWplWFuOcDFpJL5ADW9Ugp2ZhmwPkd3NwjkZy68gznItlkp/IqKqifpjg
 9wmfNLaB6XrBKoCGDx6A09EPdtRkNdbCUjwMJE36thyvGbMkj7xFQXxGzSRR15dFDELx
 gKY62Theht/mYMrcEaMMTnHOzjgwSFJhjQSE91uVJE7m3ut5+3By2ksx/O5oRFfY0Tf1
 j/9z7WJEXk/9zTioFB9uwXd3x20LrpBbrXw287qVbTmuplySGlvHmdbeSYUorObWIFqb
 iR/a9TbbBOtPR3azeh75e8pxns4dN6mW6mHaE8b8+1SJnZxrIC+7WO3UnGwgzok4vDcH
 oW5w==
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

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDM6NTE6NDFQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFNwYXJzZSBpcyBub3QgaGFwcHk6Cj4gLi4vZHJpdmVycy9ncHUvZHJtL2RybV9t
ZW1vcnkuYzoxNTk6Njogd2FybmluZzogc3ltYm9sICdkcm1fbmVlZF9zd2lvdGxiJyB3YXMgbm90
IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+IAo+IEluY2x1ZGUgdGhlIGNvcnJlY3Qg
aGVhZGVyIGZvciBkcm1fbmVlZF9zd2lvdGxiKCkgcHJvdG90eXBlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgpSZXZp
ZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX21lbW9yeS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9tZW1vcnkuYwo+IGluZGV4IGI2MzRlMTY3MDE5MC4uNDc3OTM3YmI5MDJl
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCj4gQEAgLTQwLDYgKzQwLDcgQEAKPiAgI2luY2x1ZGUg
PHhlbi94ZW4uaD4KPiAgCj4gICNpbmNsdWRlIDxkcm0vZHJtX2FncHN1cHBvcnQuaD4KPiArI2lu
Y2x1ZGUgPGRybS9kcm1fY2FjaGUuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+Cj4g
IAo+ICAjaW5jbHVkZSAiZHJtX2xlZ2FjeS5oIgo+IC0tIAo+IDIuMjEuMAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gClNlYW4gUGF1
bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
