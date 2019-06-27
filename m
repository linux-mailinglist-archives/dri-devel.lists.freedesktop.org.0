Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 673D658536
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EE66E121;
	Thu, 27 Jun 2019 15:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750BC6E040
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 15:07:41 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id x47so2756056qtk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 08:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hphFkZDwH5uUYqLxvSUJk2I9eaAINHc3fTg5y5tTdH8=;
 b=ufris6HzL1snafXA89CrvIwT+ddiYZShLvlJnLi9I/mI15uM+VBhSRl8TmNU/gXIHp
 TtPLzpX9ZVSqI/oAL3EU9+jzydxyEgUwQjY2fWlkH627+KF0egOFzOwh6tKO7mrKtzjk
 iBqWFZt6n/5A98bIxMJ0/Uxv+mmdGlhdog5aiwiBgikVovqigCUXMdLYA9oxDUIw3Pkj
 iE2w4DelZED72y0LSYxb9lkbowKa7Xg8Vncj5BVDC0b51cn0rxO0l0FZPCpDpfnUihKh
 maVEnmvyiPpoUz/k7KSvjzFdTMkEUNXrYYjl05QUd43+WWfftJMuWEF0b+Ee2XQrDP/z
 X16Q==
X-Gm-Message-State: APjAAAXvJ93v5Dg/M8qEQ3y1dfRekWI0y6jrg5Q8ikN6KswxXR21F8tm
 t0xzwG8rMPgYM5rWgFqzs3WSeA==
X-Google-Smtp-Source: APXvYqwDVMeuVAX3ExncsLfS3FxusRjtH/zhUKJhIjls97r0EuSsyMZP5IewOE32BT5WGfIZoO75Bg==
X-Received: by 2002:a0c:8849:: with SMTP id 9mr3546530qvm.21.1561648057020;
 Thu, 27 Jun 2019 08:07:37 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id t197sm979598qke.2.2019.06.27.08.07.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:07:36 -0700 (PDT)
Date: Thu, 27 Jun 2019 11:07:35 -0400
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [Freedreno] [pull] drm/msm: msm-next for 5.3
Message-ID: <20190627150735.GJ25413@art_vandelay>
References: <CAF6AEGsj3N4XzDLSDoa+4RHZ9wXObYmhcep0M3LjnRg48BeLvg@mail.gmail.com>
 <CAPM=9txROe0mxv+w=v3trMbn7pPxj5wbjkh5=RJarsDbGwV7BA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9txROe0mxv+w=v3trMbn7pPxj5wbjkh5=RJarsDbGwV7BA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hphFkZDwH5uUYqLxvSUJk2I9eaAINHc3fTg5y5tTdH8=;
 b=a24+UYyehjdsXFhPvEmIb+1yHEfrNAQRta8iXpksnY89c1KoEYFqImOmohsCeYJgIl
 iKg7TQ034fMLZt0gaPwnRoxVzk7ufAs34EGHre0vbgEMHpeRYgI/599/ET2o4hCHDAON
 G4Wlc95+kGgfmR0YuNy7r+8Z99y5sEMPlOBYGp2a8/Lv0Xk3KdPiKaHdEloB8n1JZfAF
 w9kxcU69FRUAEM0fXdBk7T3M68uK9ifGE98fh2217pz8HqPBU81xdbymxVSg2PNIp+xs
 nYo7hw58TvEJZM6XlFcwvsW/9hTx6KTqD+lHWDNh41IF5IWb+08j1t0zcZThrE1Ps+3j
 2SEw==
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTI6MjE6MzlQTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3Jv
dGU6Cj4gT24gV2VkLCAyNiBKdW4gMjAxOSBhdCAwODozNCwgUm9iIENsYXJrIDxyb2JkY2xhcmtA
Z21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBEYXZlLAo+ID4KPiAKPiBOYXVnaHR5IG5hdWdo
dHkgcmViYXNlLgo+IAo+IGRpbTogZjQ3YmVlMmJhNDQ3ICgiZHJtL21zbS9hM3h4OiByZW1vdmUg
VFBMMSByZWdzIGZyb20gc25hcHNob3QiKToKPiBTdWJqZWN0IGluIGZpeGVzIGxpbmUgZG9lc24n
dCBtYXRjaCByZWZlcmVuY2VkIGNvbW1pdDoKPiBkaW06ICAgICA3MTk4ZTZiMDMxNTUgZHJtL21z
bTogYWRkIGEzeHggZ3B1IHN1cHBvcnQKPiBkaW06IGZjMTljYmI3ODVkNyAoImRybS9tc20vbWRw
NTogRml4IG1kcDVfY2ZnX2luaXQgZXJyb3IgcmV0dXJuIik6Cj4gU3ViamVjdCBpbiBmaXhlcyBs
aW5lIGRvZXNuJ3QgbWF0Y2ggcmVmZXJlbmNlZCBjb21taXQ6Cj4gZGltOiAgICAgMmUzNjJlMTc3
MmI4IChkcm0vbXNtL21kcDU6IGludHJvZHVjZSBtZHA1X2NmZyBtb2R1bGUpCgpIaSBEYXZlLApX
YXMgY2hhdHRpbmcgd2l0aCBSb2IgYWJvdXQgdGhpcyBvbiBJUkMgYW5kIHRoZXNlIGZhaWx1cmVz
IGFyZW4ndCBkdWUgdG8gYQpyZWJhc2UgKHdlIHdlcmUgcXVpdGUgY2FyZWZ1bCB0byBhdm9pZCBy
ZWJhc2luZyB0aGlzIGN5Y2xlKS4gVGhlIGlzc3VlIHNlZW1zIHRvCmJlIHRoYXQgdGhlIGNvbW1p
dCBtZXNzYWdlcyB1c2UgdGhlIGZvcm1hdCwKCiAgICAgICAgRml4ZXM6IDxoYXNoPiA8c3ViamVj
dD4KCmZvciBGaXhlcyB0YWdzIGFuZCBkaW0gZG9lcyB0aGlzIHdoZW4gY29tcGFyaW5nIHRoZSBz
dWJqZWN0OgoKICAgICAgICBpZiBbWyAiJGZpeGVzX3N1YmplY3QiICE9ICIoXCIkb3JpZ19zdWJq
ZWN0XCIpIiBdXSA7IHRoZW4KClNvIGRpbSBpcyBiZWluZyBxdWl0ZSBzdHJpY3QgYWJvdXQgYWRk
aW5nIHBhcmVucyBhbmQgcXVvdGF0aW9ucyB0byB0aGUgc3ViamVjdAppbiBmaXhlcyBsaW5lcyBh
bmQgZmFpbGluZyBhcyBhIHJlc3VsdC4KCklNTyBzaW5jZSB0aGUgaGFzaGVzIGFyZSBjb3JyZWN0
IHRoaXMgZm9ybWF0dGluZyBzaG91bGQgYmUgZmluZS4KCk9rIHdpdGggeW91PwoKU2VhbgoKClBT
LSBJZiBpdCdzIGZpbmUgdG8gZm9ybWF0IGxpa2UgdGhpcywgd2UgbWlnaHQgd2FudCB0byBjaGFu
Z2UgdGhlIGRpbSBjaGVjayB0bwpzb21ldGhpbmcgbGlrZToKCiAgICAgICAgaWYgW1sgIiRvcmln
X3N1YmplY3QiICE9ICoiJGZpeGVzX3N1YmplY3QiKiBdXSA7IHRoZW4KCj4gCj4gUGxlYXNlIGZp
eCBvciBzcXVhc2ggdGhvc2UgYW5kIHJlc2VuZC4KPiAKPiBEYXZlLgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gRnJlZWRyZW5vIG1haWxpbmcgbGlz
dAo+IEZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwoKLS0gClNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
