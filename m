Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B3097F61
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 17:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9656E342;
	Wed, 21 Aug 2019 15:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E036E89E9B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 15:49:59 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w5so3484409edl.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 08:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=dj+lYKTwB632RwyD/Wziq62g4IKUKjzONXJXbD0N5UA=;
 b=prwsINN7cNBvzhEsM1Q4lS0SzB6QuO+ANlimCHr8P5YUZrzuOgAC3CBCb8poVL6LTz
 RKeI+X+swM6P8dxTkpcJuTPwXvFMTD+d7AFdxnGewuXxa8h0iXLRHQy2wpCvIvXDNUPQ
 SgmipDMcbz5EHv1ozSCNLcjEAqAmTYwKiP7UMksV06tuRnGftHY5EuUHPl1yak4/5y/S
 UjFVW/qACW//DIZdtZv6KUl6ZKFQ/sGtEbEiOiJpCBR5X3ka4HHolVoEu1xx5FjBv590
 LK9atahZfi+mQZ5MJDTJAyhKz1KOrc6hKK46/2pR/1aOzaC/G+TsNuqiEdSbxL+o3LLU
 qvug==
X-Gm-Message-State: APjAAAUqia++KLwvzZTE+BPdfjCcuMT1lEK3p8pPxn5rjaqsbg43ZkWJ
 zgqsUVv+urZY8CZTZxgvtaGThg==
X-Google-Smtp-Source: APXvYqydhA7Sk5HWIGzcNmBBg/NKF6G0DycEVX6TVMoevkZ/wfvqj0IPT1ILyaXVDez0LCqouPRN8g==
X-Received: by 2002:a05:6402:785:: with SMTP id
 d5mr1613538edy.210.1566402598476; 
 Wed, 21 Aug 2019 08:49:58 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id s11sm4115686edh.60.2019.08.21.08.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 08:49:57 -0700 (PDT)
Date: Wed, 21 Aug 2019 17:49:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm: fix module name in edid_firmware log message
Message-ID: <20190821154955.GM11147@phenom.ffwll.local>
References: <20190821094312.5514-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821094312.5514-1-jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=dj+lYKTwB632RwyD/Wziq62g4IKUKjzONXJXbD0N5UA=;
 b=D2x9TzfkMLHOBS/TTegVMkEPhw2TUY1vVhJj8IVwgTDkBsEQT9PD97jee3WEfirt63
 WSm3oSHjbwq8OQoIUWthSvXsvfaQGPYxNAofDEYQTrnzSeRScUutsEUJnNsZvNpzmh4C
 cQLsW7rgxAwNs6Ra5wRJFvYAE2l5usa17GRoc=
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
Cc: =?iso-8859-1?Q?G=F6ran?= Uddeborg <goeran@uddeborg.se>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMTI6NDM6MTJQTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gVGhlIG1vZHVsZSBpcyBkcm1fa21zX2hlbHBlciwgbm90IGRybV9rbXNfZmlybXdhcmUu
Cj4gCj4gQnVnemlsbGE6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MjA0NTQ5Cj4gUmVwb3J0ZWQtYnk6IEfDtnJhbiBVZGRlYm9yZyA8Z29lcmFuQHVkZGVib3Jn
LnNlPgo+IEZpeGVzOiBhYzZjMzVhNGQ4YzcgKCJkcm06IGFkZCBiYWNrd2FyZHMgY29tcGF0aWJp
bGl0eSBzdXBwb3J0IGZvciBkcm1fa21zX2hlbHBlci5lZGlkX2Zpcm13YXJlIikKPiBTaWduZWQt
b2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2ttc19oZWxwZXJfY29tbW9uLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ttc19oZWxwZXJfY29tbW9uLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2tt
c19oZWxwZXJfY29tbW9uLmMKPiBpbmRleCBkOWE1YWM4MTk0OWUuLjIyMWE4NTI4Yzk5MyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ttc19oZWxwZXJfY29tbW9uLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ttc19oZWxwZXJfY29tbW9uLmMKPiBAQCAtNDAsNyArNDAs
NyBAQCBNT0RVTEVfTElDRU5TRSgiR1BMIGFuZCBhZGRpdGlvbmFsIHJpZ2h0cyIpOwo+ICAvKiBC
YWNrd2FyZCBjb21wYXRpYmlsaXR5IGZvciBkcm1fa21zX2hlbHBlci5lZGlkX2Zpcm13YXJlICov
Cj4gIHN0YXRpYyBpbnQgZWRpZF9maXJtd2FyZV9zZXQoY29uc3QgY2hhciAqdmFsLCBjb25zdCBz
dHJ1Y3Qga2VybmVsX3BhcmFtICprcCkKPiAgewo+IC0JRFJNX05PVEUoImRybV9rbXNfZmlybXdh
cmUuZWRpZF9maXJtd2FyZSBpcyBkZXByZWNhdGVkLCBwbGVhc2UgdXNlIGRybS5lZGlkX2Zpcm13
YXJlIGluc3RlYWQuXG4iKTsKPiArCURSTV9OT1RFKCJkcm1fa21zX2hlbHBlci5lZGlkX2Zpcm13
YXJlIGlzIGRlcHJlY2F0ZWQsIHBsZWFzZSB1c2UgZHJtLmVkaWRfZmlybXdhcmUgaW5zdGVhZC5c
biIpOwo+ICAKPiAgCXJldHVybiBfX2RybV9zZXRfZWRpZF9maXJtd2FyZV9wYXRoKHZhbCk7Cj4g
IH0KPiAtLSAKPiAyLjIwLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
