Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351C1145DD
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 10:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49B589193;
	Mon,  6 May 2019 08:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AA289193
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 08:16:25 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id e56so14333078ede.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 01:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=zEzuDwfcpE0O1+N7/iUgiSXHvilRkkS2qGRlgCyUmKk=;
 b=cNzgBczFyw9nKRz1FkjzDtgyTURWOToUJHdC0gnx+c2PAo3AWwt7QC82PYB34htqQO
 t0cNXQv4pnNFK67NVt969CCYY8vR7IVEFon6p2euR9ao8wwvefp9newr/64wd9/kFwm9
 5fKaqgY0VwFH83beeCO/66XGi1z7Gm3h2oicAeLda6cNECBQJeb0933raEr8PPgf5cHY
 3V0IFp2t+soa/VmY3uvADGvvN+ELkyqPcB3ciMCauaoUQf5KQM8ij1UTqmwK/q8rBFkF
 rZqrOYVH7nECsXRjrVKvhfYNcT8xrWapF40L2JoncNUGGM9vJt/tTuRBsVmznTP1cTVt
 BqYw==
X-Gm-Message-State: APjAAAUL0b0JpjKGoBwkOnp8LuYxo6cKIxeCueic6bDkBGyU2DJ5hRqe
 1nPYdxfPtVNzV6DYxb9HpZReKZNsOUs=
X-Google-Smtp-Source: APXvYqyQQi9bLmizdsYM2uj934qTpzoWD/NkXxhzZesyLGPe10veYfJ87/zqgywzoygUJ2gB1G6Lkg==
X-Received: by 2002:a50:ad08:: with SMTP id y8mr7098457edc.83.1557130584703;
 Mon, 06 May 2019 01:16:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g14sm1447125ejs.49.2019.05.06.01.16.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 01:16:23 -0700 (PDT)
Date: Mon, 6 May 2019 10:16:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: James Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for GNU/kFreeBSD
Message-ID: <20190506081621.GE17751@phenom.ffwll.local>
References: <20190115150418.68080-1-jrtc27@jrtc27.com>
 <20190115151723.GQ10517@phenom.ffwll.local>
 <877ef5hifi.fsf@anholt.net>
 <C2E5BBDF-DD8B-4024-8995-8E21549385C7@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C2E5BBDF-DD8B-4024-8995-8E21549385C7@jrtc27.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zEzuDwfcpE0O1+N7/iUgiSXHvilRkkS2qGRlgCyUmKk=;
 b=ixRQmqq5GE1QdtvdQuOV7UAnCpjUFd3uyfGe7emNORGTNaJR6wsAdAryLPpgAbadSR
 eAl9o22uv+t+ruk/yAUOvSO7/wKmohspJA7oseKaLfqBlaQayNEtbxdZlO9aV0oXlCMJ
 OTeitIRq/TMIq86Z7yLG+3ajJ/OVOSX55tsG8=
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

T24gU2F0LCBNYXkgMDQsIDIwMTkgYXQgMDk6NDM6MTRQTSArMDEwMCwgSmFtZXMgQ2xhcmtlIHdy
b3RlOgo+IE9uIDE1IEphbiAyMDE5LCBhdCAxODo0MSwgRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0
Lm5ldD4gd3JvdGU6Cj4gPiAKPiA+IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3Jp
dGVzOgo+ID4gCj4gPj4gT24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDM6MDQ6MThQTSArMDAwMCwg
SmFtZXMgQ2xhcmtlIHdyb3RlOgo+ID4+PiBMaWtlIEdOVS9MaW51eCwgR05VL2tGcmVlQlNEJ3Mg
c3lzL3R5cGVzLmggZG9lcyBub3QgZGVmaW5lIHRoZSB1aW50WF90Cj4gPj4+IHR5cGVzLCB3aGlj
aCBkaWZmZXJzIGZyb20gdGhlIEJTRHMnIGhlYWRlcnMuIFRodXMgd2Ugc2hvdWxkIGluY2x1ZGUK
PiA+Pj4gc3RkaW50LmggdG8gZW5zdXJlIHdlIGhhdmUgYWxsIHRoZSByZXF1aXJlZCBpbnRlZ2Vy
IHR5cGVzLgo+ID4+PiAKPiA+Pj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgQ2xhcmtlIDxqcnRjMjdA
anJ0YzI3LmNvbT4KPiA+PiAKPiA+PiBXb3VsZCBiZSBnb29kIHRvIGdldCBhbiBhY2sgZnJvbSBz
b21lIG90aGVyICpic2QgdGhhdCB0aGlzIGlzIHN0aWxsIGFsbAo+ID4+IGZpbmUuIGxndG0gb3Ro
ZXJ3aXNlLgo+ID4+IC1EYW5pZWwKPiA+IAo+ID4gSSB0aGluayB0aGVyZSB3YXMgc29tZSBuZWVk
IGZvciBpbnR0eXBlcy5oIGluc3RlYWQgb2Ygc3RkaW50IGxpa2UgYQo+ID4gZGVjYWRlIGFnbyB3
aGVuIEkgd2FzIHdvcmtpbmcgb24gQlNEcywgYnV0IHRoYXQgd2FzIGFscmVhZHkgYWxtb3N0Cj4g
PiBpcnJlbGV2YW50IHRoZW4uCj4gCj4gSGksIGp1c3QgZm9sbG93aW5nIHVwIG9uIHRoaXM7IGlz
IHRoZXJlIHN0aWxsIHRoZSBuZWVkIGZvciBhbiBBQ0s/CgpZZWFoIGFuZCBhY2sgd2l0aG91dCBh
ICJkZWNhZGVzIGFnbyIgcXVhbGlmaWVyIHdvdWxkIGJlIG5pY2UuCi1EYW5pZWwKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
