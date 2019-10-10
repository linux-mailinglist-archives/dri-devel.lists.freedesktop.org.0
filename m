Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C496DD223B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 10:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C97C89FBC;
	Thu, 10 Oct 2019 08:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09E289FBC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 08:02:12 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j18so6566145wrq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 01:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=tlo1xIShsucyvfNJekXe72qo0vfWhsYNLnbaxeilZAA=;
 b=hGxk7StqDLYGcCvhLMPDS6UU5yaw7WPklqDFZmcya/NqEJmCOWcfEO+oFGS4SmJKwc
 d9rQ1GoUusnho6NLqL/WfEqL3ZgBlDOQ28ce5GAee6Tgz8LWqy5fI8K0k2Uto5zXRUJu
 UZw8N21Zu6HrVouXNH6NVVZ8PzKSj1LMDJdkQY3r8cuJwtEZR4TMG134Wm2su41Q7ori
 JTektLFIquyFOpo+fbWKoyJcrPjV8U+Ce77cLcIGYkPFDt/ci0c1O1Jz7Jtq8bBlyelq
 D2i3TmAl/A5GPevkcxWuGff5+6VERTuwZMJ+UVpr83vxL5Enk10Rdl/OJwO28x0L45dI
 37kw==
X-Gm-Message-State: APjAAAWD5nc/SiQC+JblI/YWO9Tg2v76v2j1aokU2ewNft3YWOvFFRta
 /byI8eS3P93BKxMnByAdnwg=
X-Google-Smtp-Source: APXvYqzOhM0XdkF6GWm2qwYw0N6pRz/MoASZgLgYXx2xTTH+8KiTH0+uktUnWbrWkoEDktk6ltUicA==
X-Received: by 2002:adf:a50b:: with SMTP id i11mr7574644wrb.308.1570694531287; 
 Thu, 10 Oct 2019 01:02:11 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id j1sm9094519wrg.24.2019.10.10.01.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 01:02:09 -0700 (PDT)
Date: Thu, 10 Oct 2019 10:02:07 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191010080207.GA22099@gmail.com>
References: <20191010131448.482da2b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010131448.482da2b2@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tlo1xIShsucyvfNJekXe72qo0vfWhsYNLnbaxeilZAA=;
 b=GY8NzSbx80TpUmG1jzklT8s5/8BJyLTJwc9aYbZG96VV1AfD+gHXCCkoA+8ozBQfK5
 B9GEXFg1a4+AfHMIOmFnQ1hLdCBA/lnJ6P8N7NHaVGvFnI39+V7RiCVpRIcXByCb3Hhj
 U3uYms9zV82CUieATD77NotYBJbSNsT9VNm3AWFhKh0UDEKZck/HkdNsClsrqMVQKVX3
 kgLQUvXljNqcjiLDl7cB54fTnLZlzHNLz0gLHbJo9tGY2z66c1Ir0mmVBpbNPaBn2Acu
 brrI0R5ptPbb06kfQErY7pEi9wHWSbp+zmlkQYHDYTfO1smIRDr5TEPHwVWWtXAdkISP
 rRrg==
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Qian Cai <cai@lca.pw>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@elte.hu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CiogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+IHdyb3RlOgoKPiBIaSBh
bGwsCj4gCj4gQWZ0ZXIgbWVyZ2luZyB0aGUgdGlwIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBi
dWlsZCAoeDg2XzY0IGFsbG1vZGNvbmZpZykKPiBmYWlsZWQgbGlrZSB0aGlzOgo+IAo+IGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3BtLmM6IEluIGZ1bmN0aW9uICdpbnRlbF9ndF9y
ZXN1bWUnOgo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3BtLmM6MTgzOjU0OiBl
cnJvcjogbWFjcm8gIm11dGV4X3JlbGVhc2UiIHBhc3NlZCAzIGFyZ3VtZW50cywgYnV0IHRha2Vz
IGp1c3QgMgo+ICAgMTgzIHwgICAgbXV0ZXhfcmVsZWFzZSgmY2UtPnBpbl9tdXRleC5kZXBfbWFw
LCAwLCBfVEhJU19JUF8pOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUv
bGludXgvc3BpbmxvY2tfdHlwZXMuaDoxOCwKPiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVk
ZS9saW51eC9zcGlubG9jay5oOjgzLAo+ICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xp
bnV4L21tem9uZS5oOjgsCj4gICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvZ2Zw
Lmg6NiwKPiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9zbGFiLmg6MTUsCj4g
ICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvaW8tbWFwcGluZy5oOjEwLAo+ICAg
ICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oOjM2LAo+
ICAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9w
bS5jOjc6Cj4gaW5jbHVkZS9saW51eC9sb2NrZGVwLmg6NjA1OiBub3RlOiBtYWNybyAibXV0ZXhf
cmVsZWFzZSIgZGVmaW5lZCBoZXJlCj4gICA2MDUgfCAjZGVmaW5lIG11dGV4X3JlbGVhc2UobCwg
aSkgICBsb2NrX3JlbGVhc2UobCwgaSkKPiAgICAgICB8IAo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d0L2ludGVsX2xyYy5jOiBJbiBmdW5jdGlvbiAnX19jb250ZXh0X3Bpbl9yZWxlYXNlJzoKPiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9scmMuYzoyNDU6NTE6IGVycm9yOiBtYWNybyAi
bXV0ZXhfcmVsZWFzZSIgcGFzc2VkIDMgYXJndW1lbnRzLCBidXQgdGFrZXMganVzdCAyCj4gICAy
NDUgfCAgbXV0ZXhfcmVsZWFzZSgmY2UtPnBpbl9tdXRleC5kZXBfbWFwLCAwLCBfUkVUX0lQXyk7
Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS9saW51eC9oYXJkaXJxLmg6NiwK
PiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9pbnRlcnJ1cHQuaDoxMSwKPiAg
ICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbHJjLmM6
MTM0Ogo+IGluY2x1ZGUvbGludXgvbG9ja2RlcC5oOjYwNTogbm90ZTogbWFjcm8gIm11dGV4X3Jl
bGVhc2UiIGRlZmluZWQgaGVyZQo+ICAgNjA1IHwgI2RlZmluZSBtdXRleF9yZWxlYXNlKGwsIGkp
ICAgbG9ja19yZWxlYXNlKGwsIGkpCj4gICAgICAgfCAKPiAKPiBDYXVzZWQgYnkgY29tbWl0Cj4g
Cj4gICA1ZmFjYWU0ZjM1NDkgKCJsb2NraW5nL2xvY2tkZXA6IFJlbW92ZSB1bnVzZWQgQG5lc3Rl
ZCBhcmd1bWVudCBmcm9tIGxvY2tfcmVsZWFzZSgpIikKPiAKPiBpbnRlcmFjdGluZyB3aXRoIGNv
bW1pdHMKPiAKPiAgIGRmZmE4ZmViMzA4NCAoImRybS9pOTE1L3BlcmY6IEFzc2VydCBsb2NraW5n
IGZvciBpOTE1X2luaXRfb2FfcGVyZl9zdGF0ZSgpIikKPiAgIGZjZGU4YzdlZWE2MCAoImRybS9p
OTE1L3NlbGZ0ZXN0czogRXhlcmNpc2UgcG90ZW50aWFsIGZhbHNlIGxpdGUtcmVzdG9yZSIpCj4g
ICBiMWUzMTc3YmQxZDggKCJkcm0vaTkxNTogQ29vcmRpbmF0ZSBpOTE1X2FjdGl2ZSB3aXRoIGl0
cyBvd24gbXV0ZXgiKQo+IAo+IGZyb20gdGhlIGRybSB0cmVlLgo+IAo+IEkgYWRkZWQgdGhlIGZv
bGxvd2luZyBtZXJnZSBmaXggcGF0Y2ggZm9yIHRvZGF5Ogo+IAo+IEZyb206IFN0ZXBoZW4gUm90
aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IERhdGU6IFRodSwgMTAgT2N0IDIwMTkgMTM6
MDg6NDMgKzExMDAKPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9pOTE1OiB1cGRhdGUgZm9yIG11dGV4
X3JlbGVhc2UgQVBJIGNoYW5nZQo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZXBoZW4gUm90aHdlbGwg
PHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9ndF9wbS5jIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9scmMu
YyAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2FjdGl2ZS5jICAgIHwgMiAr
LQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCkkg
c3VzcGVjdCAtbmV4dCB3aWxsIGhhdmUgdG8gY2FycnkgdGhpcyBzZW1hbnRpYyBtZXJnZSBjb25m
bGljdCAKcmVzb2x1dGlvbiB1bnRpbCB0aGUgRFJNIHRyZWUgaXMgbWVyZ2VkIHVwc3RyZWFtLgoK
VGhhbmtzLAoKCUluZ28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
