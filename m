Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A21456871A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 12:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD82897E9;
	Mon, 15 Jul 2019 10:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BD1897E0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 10:34:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 31so16538650wrm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 03:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9W/Iq1mpPKle7oxbSZx8Jr/dt3EWm1NeNACWzroj3vw=;
 b=rHIH4rS+Br5odUDYrJvufDWdAyayetsVyaprU/XX1SrzwZSvfPn9qsnA4eJ8fzskVx
 RigUwQ/RcMGQ9G2Czy957CVEeeNgCyXbMmC9w6uUvz0xOwtZ+Kegqz02roJKuvUe74WX
 LfRnrI5TGDo+AE3HyBsWjfwv5wlez0xm5vFdl1/vIm1y5q3+DSO8WYNiCFavRgazAMSa
 ZrDCxuV4lZg7izFv5xqUzlF+HQafQHlb9pp4KiR0pRRXQ0QcTizKgbpIW0eINwI+4ypM
 iV9eJmrdZEJ3srwT7NJMdVSPOCbYyU6BRyP8PLzPT5OsoxIVpWPMRj0upgR3awoNv7U4
 T7yg==
X-Gm-Message-State: APjAAAV5wSfNGo+Huh5LyopfMFEX7uVnQyBjnYWGMM43rDV7ZWG0GmV/
 BXRPcGzZ4xGdiUrm82tV+IQ=
X-Google-Smtp-Source: APXvYqx058o7CWmpwGK4swu3XNUzsBdsA+Ihmuny5bhTMCkGHFA8lNvye23452QLw7b7KY7FVV9VQA==
X-Received: by 2002:adf:c508:: with SMTP id q8mr28215019wrf.148.1563186893584; 
 Mon, 15 Jul 2019 03:34:53 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id c78sm23247239wmd.16.2019.07.15.03.34.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 03:34:52 -0700 (PDT)
Date: Mon, 15 Jul 2019 11:34:51 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 33/33] drm/hisilicon: drop use of drmP.h
Message-ID: <20190715103451.GA20839@arch-x1c3>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-34-sam@ravnborg.org>
 <CACvgo51hO+i6LryjeQhEivq3ta0Vnd=ZxFrrW0Gn8vVQebSybw@mail.gmail.com>
 <20190715081941.GA29177@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715081941.GA29177@ravnborg.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9W/Iq1mpPKle7oxbSZx8Jr/dt3EWm1NeNACWzroj3vw=;
 b=GMJDA5ittS7MYboLKANGiNza9N13T5yA3DHs0Fd4IqPq8ANJAdEgPEptoyY8TBACvw
 P5lLxuwbSyrGoiOXmTktLXMM9+m2ixhUbdkvra8POZOfwFIrukn0xHWvyt4InZtgaIIy
 Q1o1EOdw8ob0sUNOU2l7nARdsQ4PPk2A5nAelrdSszuyWIld5s+TQIVJ1mczm7+kPeQC
 /natKRX2V6eEcUP4NEfMiu0aZo8AjVO8cWQZ+oOReQtD1jlUoMjvAIUoynDtU5X16AA9
 pwA/LD6n5HGNNapcpsmjUntvSbOiZZX6OCvY6jWq29LtEy4e510jrj2aoBG6c7LphBBG
 FgvQ==
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
Cc: Rongrong Zou <zourongrong@gmail.com>, Jani Nikula <jani.nikula@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 John Garry <john.garry@huawei.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Junwei Zhang <Jerry.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Allison Randal <allison@lohutok.net>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNy8xNSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIEVtaWwuCj4gCj4gPiA+IC0t
LQo+ID4gPiBUaGUgbGlzdCBvZiBjYzogd2FzIHRvbyBsYXJnZSB0byBhZGQgYWxsIHJlY2lwaWVu
dHMgdG8gdGhlIGNvdmVyIGxldHRlci4KPiA+ID4gUGxlYXNlIGZpbmQgY292ZXIgbGV0dGVyIGhl
cmU6Cj4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZl
bC8yMDE5LUp1bmUvdGhyZWFkLmh0bWwKPiA+ID4gU2VhcmNoIGZvciAiZHJtOiBkcm9wIHVzZSBv
ZiBkcm1wLmggaW4gZHJtLW1pc2MiCj4gPiA+Cj4gPiBTcGVha2luZyBvZiBsb25nIENDIGxpc3Qs
IG1vc3QgcGF0Y2hlcyBhcmUgb2sgeWV0IHRoaXMgaGFzIGdvbmUgYSBiaXQgY3JhenkuCj4gPiBI
b3cgZGlkIHlvdSBtYW5hZ2UgdG8gcHVsbCBzdWNoIGEgbG9uZyBsaXN0PyBUaGUgZ2V0X21haW50
YWluZXIucGwKPiA+IHNjcmlwdCBzaG93cyBhIHRvdGFsIG9mIDE3IGZvciBhbGwgb2YgaGlibWMg
YW5kIGtpcmluLgo+IAo+IFNvbWV0aW1lcyBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIG91dHB1
dHMgYSBsb3Qgb2YgcGVvcGxlLgo+IFNvbWV0aW1lcyBvbmx5IGEgZmV3Lgo+IEkgaGF2ZSBub3Qg
bG9va2VkIGludG8gZGV0YWlscyB3aHksIGFuZCBmb3IgdGhpcyBwYXRjaCBzZXJpZXMKPiBJIHVz
ZWQgImRpbSBhZGQtbWlzc2luZy1jYyIgdG8gbW9zdCBwYXRjaGVzLgo+IApUaGlzIHBhdGNoIHNl
ZW1zIGxpa2UgYSBnb29kIGNhbmRpZGF0ZSB0byBmaXh1cCBkaW0uIENhbiB3ZSB2b2x1bnRlZXIK
eW91IGZvciB0aGUgdGFzayA7LSkKCgo+ID4gRWl0aGVyIHdheSwgc2luY2UgeW91J3ZlIGJ1aWx0
LXRlc3RlZCB0aGVzZSAoYW5kIGNvbmZsaWN0cyBhcmUgYQo+ID4gbWF0dGVyIG9mICNpbmNsdWRl
KSBmb3IgdGhlIGxvdDoKPiA+IEFja2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBj
b2xsYWJvcmEuY29tPgo+IEp1c3QgdG8gYmUgc3VyZS4gV2FzIHRoaXMgYW4gQWNrIGZvciB0aGUg
ZnVsbCBzZXJpZXMgb3Igb25seSB0aGlzIHBhdGNoPwo+IEkgc3RhcnRlZCBwcm9jZXNzaW5nIHRo
ZSBwYXRjaGVzLCBhbmQgdGhlIG9uZXMgd2hlcmUgSSBoYXZlIGdvdCBhbgo+IGV4cGxpY2l0IGFj
ayBvciByLWIgaXMgcXVldWVkIGFscmVhZHkgKHdpdGhvdXQgeW91ciBhY2spLgo+IApGb3IgdGhl
IGxvdCAtPiBGb3IgdGhlIHNlcmllcy4KCj4gVGhlcmUgYXJlIHN0aWxsIH4yMCBwYXRjaGVzIHdp
dGhvdXQgZmVlZGJhY2sgaW4gdGhpcyBzZXJpZXMsCj4gYW5kIEkgd291bGQgbG92ZSB0byBoYXZl
IHRoZW0gcHJvY2Vzc2VkIGFuZCBwdXNoZWQgb3V0Lgo+IApQZXJzb25hbGx5IEknbSBpbmNsaW5l
ZCB0aGF0IHdlIGNhbiBwdXNoIHRoZSBzZXJpZXMgZXZlbiB3aXRoIGFuIGFjay1ieS4KQW55IHBv
dGVudGlhbCBpc3N1ZXMgcmFpc2VkIGJ5IGEgI2luY2x1ZGUgcmVzaHVmZmxlIHdvdWxkIGJlIGNh
dWdodCBieSBhCmJ1aWxkIC0gd2hpY2ggeW91J3ZlIGFscmVhZHkgZG9uZS4KClRsO0RyOiBJZiBp
dCB3ZXJlIG1lIC0gc2hpcCBpdCA6LVAKCkhUSApFbWlsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
