Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F31C98D2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 09:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9312A6E279;
	Thu,  3 Oct 2019 07:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5236E279
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 07:08:55 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id w12so3058445iol.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 00:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJcg8zs78d3rXBpOETE+0j+ZuAl6FfPdDEzxoa0/CIM=;
 b=X3EA/KsSxoZ4zp1yHx2cQLwNbf3FbP0Yn6CQfbrNBqgNkDZVtoHiHqF/GAIBDUpgRN
 BboSLLtxuAkJ3Tw/v+oAH6LJ4Xciyk1ak20LbXlKB4cLpfxy+0CaFFUznsJdn4WS6i+Q
 o85ROOq+193K4essW5Nf2VqjJOpv5kOORMoPi5iCLiQH9I6GTV2UT5m4zCHI6HtpXFBE
 e0lPpdOkE3rIhLdFyo5AL2AJmgDiZo9pJ1zHL1b14xEt+RzSnsFKTEDc8H8M/3P+1Pz+
 T83TNTeKNM05bX/cNGFJOFFM1LCPaGQJUCxyQDE2gjDUzDvEawjkIFM6D4JNWl/kA86Q
 3oow==
X-Gm-Message-State: APjAAAVL5gREpgzglQxiEyyb+BP6JYA6VTfX9mVku5HvTfNioGHpMUfa
 ZWaqrVydiYogxi41xbL+7yPP9GL0g5P1tdSq4aMUNg==
X-Google-Smtp-Source: APXvYqyiHoQKtNpYFtcrgyC7ulZRFo5mIyezyvwwYkMn+/z8HGvh/7OVxThakVCi9reOehN1EsA8FIXbO7De8LVxF2E=
X-Received: by 2002:a02:ce5c:: with SMTP id y28mr8189675jar.79.1570086534678; 
 Thu, 03 Oct 2019 00:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191001080253.6135-1-icenowy@aosc.io>
 <20191001080253.6135-2-icenowy@aosc.io>
In-Reply-To: <20191001080253.6135-2-icenowy@aosc.io>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 3 Oct 2019 12:38:43 +0530
Message-ID: <CAMty3ZCjrM4MajJLyLwt-31mNnfVWghwatogtwVOvCt4gY0LZA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 1/3] Revert "drm/sun4i: dsi: Change the
 start delay calculation"
To: Icenowy Zheng <icenowy@aosc.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MJcg8zs78d3rXBpOETE+0j+ZuAl6FfPdDEzxoa0/CIM=;
 b=nACueev+gvO9mg6+kv1iNYsTn/JE4CpNo2ZDPqlFFMewbPYZuyhqh+JsqDzfu+L5Q0
 G+AcFl0zPkVgkkKTRCM+7KwBBBHh02sUORkOzzEY79ofQJI2HdySEGQOecxJIFanfVRk
 L6f6wnSuchiE7pN6azWsIbtOZgr+hYD6XZ1jg=
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMSwgMjAxOSBhdCAxOjMzIFBNIEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9z
Yy5pbz4gd3JvdGU6Cj4KPiBUaGlzIHJldmVydHMgY29tbWl0IGRhNjc2YzZhYTY0MTNkNTlhYjBh
ODBjOTdiYmMyNzMwMjVlNjQwYjIuCj4KPiBUaGUgb3JpZ2luYWwgY29tbWl0IGFkZHMgYSBzdGFy
dCBwYXJhbWV0ZXIgdG8gdGhlIGNhbGN1bGF0aW9uIG9mIHRoZQo+IHN0YXJ0IGRlbGF5IGFjY29y
ZGluZyB0byBzb21lIG9sZCBCU1AgdmVyc2lvbnMgZnJvbSBBbGx3aW5uZXIuIEhvd2V2ZXIsCj4g
dGhlcmUncmUgdHdvIHdheXMgdG8gYWRkIHRoaXMgZGVsYXkgLS0gYWRkIGl0IGluIERTSSBjb250
cm9sbGVyIG9yIGFkZAo+IGl0IGluIHRoZSBUQ09OLiBBZGQgaXQgaW4gYm90aCBjb250cm9sbGVy
cyB3b24ndCB3b3JrLgo+Cj4gVGhlIGNvZGUgYmVmb3JlIHRoaXMgY29tbWl0IGlzIHBpY2tlZCBm
cm9tIG5ldyB2ZXJzaW9ucyBvZiBCU1Aga2VybmVsLAo+IHdoaWNoIGhhcyBhIGNvbW1lbnQgZm9y
IHRoZSAxIHRoYXQgc2F5cyAicHV0IHN0YXJ0X2RlbGF5IHRvIHRjb24iLiBCeQo+IGNoZWNraW5n
IHRoZSBzdW40aV90Y29uMF9tb2RlX3NldF9jcHUoKSBpbiBzdW40aV90Y29uIGRyaXZlciwgaXQg
aGFzCj4gYWxyZWFkeSBhZGRlZCB0aGlzIGRlbGF5LCBzbyB3ZSBzaG91bGRuJ3QgcmVwZWF0IHRv
IGFkZCB0aGUgZGVsYXkgaW4gRFNJCj4gY29udHJvbGxlciwgb3RoZXJ3aXNlIHRoZSB0aW1pbmcg
d29uJ3QgbWF0Y2guCgpUaGFua3MgZm9yIHRoaXMgY2hhbmdlLiBsb29rIGxpa2UgdGhpcyBpcyBw
cm9wZXIgcmVhc29uIGZvciBhZGRpbmcgKwoxLiBhbHNvIGFkZGluZyBic3AgY29kZSBsaW5rcyBo
ZXJlIG1pZ2h0IGhlbHAgZm9yIGZ1dHVyZSByZWZlcmVuY2UuCgpPdGhlcndpc2UsCgpSZXZpZXdl
ZC1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
