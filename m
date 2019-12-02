Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969C10EE16
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 18:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A996E270;
	Mon,  2 Dec 2019 17:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE7F89581;
 Mon,  2 Dec 2019 17:21:49 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id i4so206981vkc.3;
 Mon, 02 Dec 2019 09:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MrFt32QjP91fOc6zeKNsn782pwnQ0YfC9ma84CsB2og=;
 b=EA8bbm2KsZi2EbGbvEtXFRnRLFcLSAl/y0LlkjOvNCxXSmNddM/6XxvQOGgDwY2c7D
 fJeo30evp5pCL/jc4kwUbhKS5Cflf/KAk+6R+eum2PM455GfODnprRQQOf4Kgp6lavmi
 nYSHZA8RCGOgi031j96aUjxjERXzjyvL2vQxs4PedEVsQEbTRYi8VXSzC+Dead7Nhf0d
 MC3QA54ETiOuC0eHh7dBzHc+KRpL+YmswgfGCM3cz+kpt3cFM+HMT9MhECEA2nRIHZL9
 /sAa6E26FT3583gLyjLrAuXxR8WumS2urQ9E3MD2vsyprmM+ojxFm6s5wDF4kmUu9XIf
 +hAg==
X-Gm-Message-State: APjAAAXpJVN9Mx3ArS+qa7ctu7bl2+TAX2rJHrWuImbHWklfdBqv1BDq
 PR3f0GVhTgIh76265yCNQXNiNhO1+I17xjLiCX4=
X-Google-Smtp-Source: APXvYqwstBf0wORb/BSBCw2Xj4n6qFjsuzSwq7kQT/afoEHkUOZjQSqCXiFgfIIxLNkDhaDO6t0d/IQUXm48ZsioPQM=
X-Received: by 2002:ac5:c7da:: with SMTP id e26mr428049vkn.38.1575307308417;
 Mon, 02 Dec 2019 09:21:48 -0800 (PST)
MIME-Version: 1.0
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <20191101130313.8862-5-emil.l.velikov@gmail.com>
 <20191127084104.1ceb1f62@collabora.com>
 <CACvgo52UB-sAv55_kREgHbRsg6b5KXv7At0TbgUPdc0e1E+QaA@mail.gmail.com>
 <20191127180456.GD406127@phenom.ffwll.local>
 <CACvgo50j0sU18-AqeerkgDq9joJysT_0PuQrgVS1tVhUqV9rcg@mail.gmail.com>
 <20191127183700.GN406127@phenom.ffwll.local>
In-Reply-To: <20191127183700.GN406127@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 2 Dec 2019 17:20:48 +0000
Message-ID: <CACvgo52gyY6cC8P0BGb59D8s4aAABdKNqvLN1YQmXu285+3g3w@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm: drop DRM_AUTH from PRIME_TO/FROM_HANDLE ioctls
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MrFt32QjP91fOc6zeKNsn782pwnQ0YfC9ma84CsB2og=;
 b=UXqISM+A7SElyiB1DE4+yPkA/qMr2zFARrwxDoVDEMtj01akaMznKXB++VK58Vtlmo
 udDzWhDegcCaBYsbpoZC3vajQHSQAhwcmsJmn0wrwaRjXVStX2dwow3fy44AeoDFglcD
 jjzcSh8kl+CQBBOr/lHGEuTLYMX/HRrC9LdTzMutaDmyww487mwOUYMRfzvQMhmY3uQQ
 yWLleKyG1inepMGsUVHMGaBxmrV419rvJWH1LJtsqT7G/2art1AfUuCv8yT33BHVVWDX
 AM+0WWUnwdS8LES6codzAwCT+XFfkB4pO2fIF4miomHuH94Ep5jmc3W8yL4jbG20JAPb
 JIwg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNyBOb3YgMjAxOSBhdCAxODozNywgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDA2OjMyOjU2UE0gKzAwMDAs
IEVtaWwgVmVsaWtvdiB3cm90ZToKPiA+IE9uIFdlZCwgMjcgTm92IDIwMTkgYXQgMTg6MDQsIERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwg
Tm92IDI3LCAyMDE5IGF0IDA0OjI3OjI5UE0gKzAwMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToKPiA+
ID4gPiBPbiBXZWQsIDI3IE5vdiAyMDE5IGF0IDA3OjQxLCBCb3JpcyBCcmV6aWxsb24KPiA+ID4g
PiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4g
PiA+IEhpIEVtaWwsCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gRnJpLCAgMSBOb3YgMjAxOSAxMzow
MzoxMyArMDAwMAo+ID4gPiA+ID4gRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5j
b20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gRnJvbTogRW1pbCBWZWxpa292IDxlbWls
LnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQXMgbWVudGlv
bmVkIGJ5IENocmlzdGlhbiwgZm9yIGRyaXZlcnMgd2hpY2ggc3VwcG9ydCBvbmx5IHByaW1hcnkg
bm9kZXMKPiA+ID4gPiA+ID4gdGhpcyBjaGFuZ2VzIHRoZSByZXR1cm5lZCBlcnJvciBmcm9tIC1F
QUNDRVMgaW50byAtRU9QTk9UU1VQUC8tRU5PU1lTLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFyZSB5
b3Ugc3VyZSB0aGlzIGlzIHRydWUgZm9yIE1PREVTRVQtb25seSBub2RlcyAodGhvc2UgdGhhdCBk
byBub3QKPiA+ID4gPiA+IGhhdmUgdGhlIFJFTkRFUiBjYXAgc2V0KSBpbXBsZW1lbnRpbmcgLT57
ZmRfdG9faGFuZGxlLGhhbmRsZV90b19mZH0oKT8KPiA+ID4gPiA+IFNob3VsZG4ndCB0aGUgaXNf
YXV0aGVudGljYXRlZCgpIGNoZWNrIHN0aWxsIGJlIGRvbmUgaW4gdGhhdCBjYXNlPwo+ID4gPiA+
ID4KPiA+ID4gPiBUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuIEp1c3Qgc2VudCBvdXQgdjIsIHdo
aWNoIEkgc2hvdWxkIGFkZHJlc3MgdGhlIGNvbmNlcm4uCj4gPiA+Cj4gPiA+IFdoeSBkbyB3ZSBu
ZWVkIHRoaXMgYWRkaXRpb25hbCBjaGVjayBpbiB2Mj8gV2hhdCBjYW4gZ28gd3Jvbmcgb24gbW9k
ZXNldAo+ID4gPiBkcml2ZXJzIGlmIG5vbi1hdXRoZW50aWNhdGVkIGxlZ2FjeSB0aGluZ3MgY2Fu
IHVzZSB0aGlzPyBtb2Rlc2V0LW9ubHkKPiA+ID4gZHJpdmVycyBoYXZlIGFsbCB0aGVpciByZXNv
dXJjZXMgc2VncmVnYXRlZCBieSB0aGUgZHJtIGNvcmUgKGRybV9mYiwKPiA+ID4gbW1hcHMsIGJ1
ZmZlciBsaXN0cyksIHNvIHRoZXJlJ3MgcmVhbGx5IG5vIGFjY2VzcyBsaW1pdGF0aW9ucyB0aGF0
IGNhbiBnbwo+ID4gPiB3cm9uZyBoZXJlLgo+ID4KPiA+IFdlbGNvbWUgYmFjayBEYW5pZWwuCj4g
Pgo+ID4gSSBoYXZlbid0IGF1ZGl0ZWQgdGhlIGNvcmUgZHJtIGNvZGUsIHNvIHdhc24ndCBzdXJl
IGlmIHRoZXJlJ3MgYW55Cj4gPiBpc3N1ZXMgdGhhdCBtYXkgYXJpc2UuCj4gPiBIZW5jZSB0aGUg
Y29uc2VydmF0aXZlIGFwcHJvYWNoIGluIHYyLgo+ID4KPiA+IElmIHlvdSB0aGluayB0aGlzIGlz
IGZpbmUgYXMtaXMgYSBmb3JtYWwgUmV2aWV3ZWQtYnkgd291bGQgYmUgaGlnaGx5Cj4gPiBhcHBy
ZWNpYXRlZC4KPgo+IEkgdGhpbmsgdGhlcmUncyBhIG5vbi16ZXJvIGNoYW5jZSBJJ2xsIGhhdmUg
dG8gZWF0IGEgZmV3IGhhdHMgb24gdGhpcywgYnV0Cj4gSSB0aGluayB2MSBpcyBzb2xpZC4KPgo+
IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ClRo
YW5rcy4gSSd2ZSBqdXN0IHJlLXJlYWQgdGhlIERJTSBpbnN0cnVjdGlvbnMgYW5kIHB1c2hlZCB0
aGlzIHRvIGRybS1taXNjLW5leHQuCkZpbmdlcnMgY3Jvc3NlZCwgSSBkaWQgbm90IGJ1dGNoZXIg
aXQgdGhpcyB0aW1lIGFyb3VuZC4KCi1FbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
