Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B43DB265B43
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 10:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE3F6E35F;
	Fri, 11 Sep 2020 08:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EE76E35F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:15:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o5so10503369wrn.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 01:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=k8Bj3ASTIpypJ8ggKoM+aQRjaad0dEkxTPVx2fp8uGs=;
 b=fRQh/tOglgsku2462Zr61073wgcr+e/eaLU/50pvajTvuPIvdnYICnzSUm7FvMvi4p
 MmKv0YhMk8XAy/F9mhJHBDTrgGsTzpvfgEmvRYXCtUF9xzPga5JBhaDao8umntOK+AQh
 I7vagGkCjLylhdYtE/dkSzoXa/xVyy+ik0G6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=k8Bj3ASTIpypJ8ggKoM+aQRjaad0dEkxTPVx2fp8uGs=;
 b=Mm0baBXs+RAGj0nqH9kuElxnk9YSkLrUbv5SOpmk9gWsItZMzTAvlisWL1kKaUl15G
 W3KCY1/NGICvRDR2ABy6RflEOzpC7NDv+R3LceLy+TLA9hH8ZpFv1W8hJeaGl2wOoOQ4
 d1Kr6fZ8IytgR5u4XYYWxuczmeR9MHO6E5i8AHbXtESfzbi2c7/9NkKvMpLPOjZ0EvHV
 ObRtbEabfSuQTpmOJMQjeMgC7gzIYtrd8xqp0c2NLyW04yPvl5Jr6O+ng+q24RJiX/ew
 3tdmSNT1WCYuld/tv+LG7+MGAT9qK7rF9qpPuxAJ++18Qzxpu0RL0Cbfm72VaIjMjg0R
 +Crg==
X-Gm-Message-State: AOAM532+JaR0vdVNmAb5ZnRRDK4F/ReLGf7eFeUDSxnbYdcWlzttlicM
 CbR16xx5ID+qeuGSUzbJpzAu7Q==
X-Google-Smtp-Source: ABdhPJxU1ll9iAceBTayzDGewibbztq9+abcfDZ6D804bpFjvBJi1qAFfNus3ZOJ7xUMAgiq6aX1LA==
X-Received: by 2002:adf:f5c7:: with SMTP id k7mr866124wrp.246.1599812122122;
 Fri, 11 Sep 2020 01:15:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k8sm2777115wma.16.2020.09.11.01.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 01:15:21 -0700 (PDT)
Date: Fri, 11 Sep 2020 10:15:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH] drm: xlnx: remove defined but not used
 'scaling_factors_666'
Message-ID: <20200911081519.GM438822@phenom.ffwll.local>
Mail-Followup-To: Hyun Kwon <hyun.kwon@xilinx.com>,
 Jason Yan <yanaijie@huawei.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Michal Simek <michals@xilinx.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hulk Robot <hulkci@huawei.com>
References: <20200910140630.1191782-1-yanaijie@huawei.com>
 <20200910181418.GA3187626@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910181418.GA3187626@xilinx.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jason Yan <yanaijie@huawei.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hulk Robot <hulkci@huawei.com>, Michal Simek <michals@xilinx.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTAsIDIwMjAgYXQgMTE6MTQ6MThBTSAtMDcwMCwgSHl1biBLd29uIHdyb3Rl
Ogo+IEhpIEphc29uLAo+IAo+IE9uIFRodSwgU2VwIDEwLCAyMDIwIGF0IDA3OjA2OjMwQU0gLTA3
MDAsIEphc29uIFlhbiB3cm90ZToKPiA+IFRoaXMgYWRkcmVzc2VzIHRoZSBmb2xsb3dpbmcgZ2Nj
IHdhcm5pbmcgd2l0aCAibWFrZSBXPTEiOgo+ID4gCj4gPiBkcml2ZXJzL2dwdS9kcm0veGxueC96
eW5xbXBfZGlzcC5jOjI0NToxODogd2FybmluZzoKPiA+IOKAmHNjYWxpbmdfZmFjdG9yc182Njbi
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiA+ICAg
MjQ1IHwgc3RhdGljIGNvbnN0IHUzMiBzY2FsaW5nX2ZhY3RvcnNfNjY2W10gPSB7Cj4gPiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gCj4gPiBSZXBvcnRl
ZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBK
YXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEh5dW4gS3dv
biA8aHl1bi5rd29uQHhpbGlueC5jb20+CgpJIHRoaW5rIHlvdSdyZSB0aGUgbWFpbnRhaW5lciwg
c28gcGxlYXNlIGFsc28gcHVzaCBwYXRjaGVzIHRvCmRybS1taXNjLW5leHQuIE90aGVyd2lzZSB0
aGV5J2xsIGp1c3QgZ2V0IGxvc3QsIG9yIGF0IGxlYXN0IGl0J3MgdmVyeQpjb25mdXNpbmcgd2hl
biBhIG1haW50YWluZXIgcmV2aWV3cyBhIHBhdGNoIGJ1dCB0aGVyZSdzIG5vIGluZGljYXRpb24g
d2hhdAp3aWxsIGhhcHBlbiB3aXRoIHRoZSBwYXRjaC4KLURhbmllbAoKPiAKPiBUaGFua3MhCj4g
Cj4gLWh5dW4KPiAKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNw
LmMgfCA2IC0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYyBiL2RyaXZl
cnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMKPiA+IGluZGV4IGE0NTVjZmMxYmVlNS4uOThi
ZDQ4ZjEzZmQxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rp
c3AuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2Rpc3AuYwo+ID4gQEAg
LTI0MiwxMiArMjQyLDYgQEAgc3RhdGljIGNvbnN0IHUzMiBzY2FsaW5nX2ZhY3RvcnNfNTY1W10g
PSB7Cj4gPiAgCVpZTlFNUF9ESVNQX0FWX0JVRl81QklUX1NGLAo+ID4gIH07Cj4gPiAgCj4gPiAt
c3RhdGljIGNvbnN0IHUzMiBzY2FsaW5nX2ZhY3RvcnNfNjY2W10gPSB7Cj4gPiAtCVpZTlFNUF9E
SVNQX0FWX0JVRl82QklUX1NGLAo+ID4gLQlaWU5RTVBfRElTUF9BVl9CVUZfNkJJVF9TRiwKPiA+
IC0JWllOUU1QX0RJU1BfQVZfQlVGXzZCSVRfU0YsCj4gPiAtfTsKPiA+IC0KPiA+ICBzdGF0aWMg
Y29uc3QgdTMyIHNjYWxpbmdfZmFjdG9yc184ODhbXSA9IHsKPiA+ICAJWllOUU1QX0RJU1BfQVZf
QlVGXzhCSVRfU0YsCj4gPiAgCVpZTlFNUF9ESVNQX0FWX0JVRl84QklUX1NGLAo+ID4gLS0gCj4g
PiAyLjI1LjQKPiA+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
