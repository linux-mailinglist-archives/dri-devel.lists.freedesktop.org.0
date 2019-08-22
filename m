Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEC099469
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 15:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3276E4C9;
	Thu, 22 Aug 2019 13:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973246E4C9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:02:56 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id h13so7798766edq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 06:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=bEFie1V4YsBEnCBAlHqq7MFKWHgQ85EhvEaFWOkyQHo=;
 b=f14BQSfc9PZJilmyKLMgdjtkNXIArGO+ZER/AjO8LMMhbZNMpKQbP2HdAXaP9Zg1hg
 scVtFiMCSCnXa0PJ5sEMWos94w/5upvAp0mJmXRWOJMWohVR9djacAr/baHi/heF3dBv
 kb5X7Fri/nO23lZ4J2NiJgwcdCE8VkBxn9DeP68xpshxsZl9QtafKYmg/J7EDGCyMt+e
 mxPJExsGENntaPyiawZ9tNL/fuRk9McTXgURen0YanL8/is74VosYoOWHPeIEw/cD1N8
 DMHhiFxscpZM3loz0u75wgnLIb8cT67Xn8AC5gXn/n5XJi3yQbGBaTRQyxG3aEWtH43Q
 DxTA==
X-Gm-Message-State: APjAAAWHYjO3WupLEJLVF2v/phDnFDAB2jqi9mIOm0+yQyN0yFy7AeD1
 tdoGjD5A+d6ftNbAOFssd1wbAw==
X-Google-Smtp-Source: APXvYqzVizM+IhVvZ/KDzjJkM0D3bX0ibIr5zP64xbY4bQ0J9bsHBAipHCk0eVnBmhuRecD8ZiCGtQ==
X-Received: by 2002:aa7:d58d:: with SMTP id r13mr41129002edq.118.1566478975166; 
 Thu, 22 Aug 2019 06:02:55 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b3sm2273200ejl.55.2019.08.22.06.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 06:02:54 -0700 (PDT)
Date: Thu, 22 Aug 2019 15:02:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 07/10] dma-buf/resv: add new fences container
 implementation
Message-ID: <20190822130251.GT11147@phenom.ffwll.local>
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-8-christian.koenig@amd.com>
 <20190821160454.GN11147@phenom.ffwll.local>
 <c1ff88ef-0e49-fd7a-6317-de432a04ddf2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1ff88ef-0e49-fd7a-6317-de432a04ddf2@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=bEFie1V4YsBEnCBAlHqq7MFKWHgQ85EhvEaFWOkyQHo=;
 b=hBi1/a5Sk53J8hG1FJGP1eO8pUWuEP+z/NWMMFF+FUlpZZEW0DU2RYUVogAsw0khcd
 R/WmDkhX4CGY9lGlnjqNCMsXomCJAfIGzhp+pfe81eTusSg3XRlgU+osCxMP9leZoB6y
 NcwA8WQeb6Vft5qggbpDgfJp9UzE9H18g43s8=
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTA6MjM6MjlBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAyMS4wOC4xOSB1bSAxODowNCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4g
PiBPbiBXZWQsIEF1ZyAyMSwgMjAxOSBhdCAwMjozMTo0NFBNICswMjAwLCBDaHJpc3RpYW4gS8O2
bmlnIHdyb3RlOgo+ID4gPiBbU05JUF0KPiA+ID4gKwkvKiBUcnkgdG8gZHJvcCB0aGUgbGFzdCBy
ZWZlcmVuY2UgKi8KPiA+ID4gKwlpZiAoIWRtYV9mZW5jZV9hcnJheV9yZWN5Y2xlKHN0YWdlZCkp
Cj4gPiBXaXRob3V0IGFuIHJjdSBiYXJyaWVyIGhlcmUgeW91J3JlIG5vdCBzeW5jaW5nIHRvIG5l
dyBjbGllbnRzIGF0IGFsbC4KPiA+IEkgZG9uJ3QgdGhpbmsgdGhpcyB3b3JrcywgYW5kIEkgZXhw
ZWN0IHRoYXQgb25jZSB5b3UndmUgcmVhZGRlZCBhbGwgdGhlCj4gPiBiYXJyaWVycyBhbmQgcmV0
cnkgbG9vcHMgd2UncmUgYmFjayB0byBzZXFsb2Nrcy4KPiAKPiBUaGUga2V5IGRpZmZlcmVuY2Ug
aXMgdGhhdCBSQ1UgdXNlcnMgbm93IHVzZSBkbWFfZmVuY2VfZ2V0X3JjdV9zYWZlKCkgdG8KPiBn
cmFiIGEgcmVmZXJlbmNlIHRvIHRoZSBjdXJyZW50IHNldCBvZiBmZW5jZXMuCj4gCj4gSW4gb3Ro
ZXIgd29yZHMgdGhlIHdob2xlIGFycmF5IGlzIHJlZmVyZW5jZSBjb3VudGVkIGFuZCBSQ1UgcHJv
dGVjdGVkCj4gaW5zdGVhZCBvZiBlYWNoIGluZGl2aWR1YWwgZW50cnkgaW4gdGhlIGFycmF5Lgo+
IAo+IFRoaXMgd2F5IHlvdSBkb24ndCBuZWVkIHRoZSBzZXF1ZW5jZSBjb3VudCBhbnkgbW9yZSBi
ZWNhdXNlIHlvdSBncmFiIGEKPiByZWZlcmVuY2UgdG8gYWxsIG9mIHRoZW0gYXQgb25jZSBhbmQg
dGhlbiBjYW4gYmUgc3VyZSB0aGF0IHRoZXkgZG9uJ3QKPiBjaGFuZ2UuCgpIbSB5ZWFoIC4uLiBJ
IHRoaW5rIHRoZXJlJ3Mgc3RpbGwgc29tZSB1c2VycyBsZWZ0IHRoYXQgaGF2ZSBhbiBvcGVuLWNv
ZGVkCnJjdSBzZWN0aW9uIHRob3VnaC4gQnV0IHllYWggaWYgeW91IGNhbiBjb25jaW5jZSBDaHJp
cyB0aGF0IHRoaXMgaXMgb2sgSQp0aGluayBpdCBtYWtlcyBzZW5zZSBhcyBhbiBvdmVyYWxsIGNs
ZWFudXAgb2YgdGhlIGhhbmQtcm9sbGVkIGZlbmNlcyBhcnJheQp3ZSBoYXZlIGZvciBzaGFyZWQg
ZmVuY2VzLiBCdXQgSSdkIHJlYWxseSBsaWtlIHRvIHVudGFuZ2xlIGl0IGZyb20gdGhlCmVudGly
ZSBzZW1hbnRpY3MgZGlzY3Vzc2lvbiwgc2luY2UgdGhhdCBzZWVtcyBlbnRpcmVseSB1bnJlbGF0
ZWQuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
