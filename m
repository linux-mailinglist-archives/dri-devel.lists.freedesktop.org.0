Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5D31AE6D7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 22:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D796EA67;
	Fri, 17 Apr 2020 20:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24A16EA67
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 20:34:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C3DD97D;
 Fri, 17 Apr 2020 22:34:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587155688;
 bh=0N37fRi3Noo3nDa9ghOFWdRREPOQE2piHin6BelNPQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IvkpxlRvZi9ssQ2VZ0XYKj7TBzUEiUL3Zme3nDACyX0oivYBnnzzil0KHmN75z4/z
 smiO4QJuGII0wqCy8s/UUHm4y5FZfMl1BTf3NTtXzM3H1wkVK9sMRuNCRcbfc0I1kL
 yX2YQNPaNP8c+HnApPjvXQVyYvPR+ZA7GZx159KU=
Date: Fri, 17 Apr 2020 23:34:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 3/3] drm/tegra: output: rgb: Support LVDS encoder bridge
Message-ID: <20200417203435.GL5861@pendragon.ideasonboard.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-4-digetx@gmail.com>
 <20200417192453.GH5861@pendragon.ideasonboard.com>
 <598c81ef-ba22-a832-0822-e08023f3dff6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <598c81ef-ba22-a832-0822-e08023f3dff6@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMTE6MTE6MDZQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDE3LjA0LjIwMjAgMjI6MjQsIExhdXJlbnQgUGluY2hhcnQg0L/QuNGI0LXRgjoK
PiAuLi4KPiA+IEFzIEkgdHJpZWQgdG8gZXhwbGFpbiBiZWZvcmUsIGlmIHlvdSB3cmFwIHRoZSBw
YW5lbCBpbiBhIGJyaWRnZSB3aXRoCj4gPiBkcm1fcGFuZWxfYnJpZGdlX2FkZCgpIChvciB0aGUg
ZGV2bV8gdmFyaWFudCksIHlvdSB3aWxsIGFsd2F5cyBoYXZlIGEKPiA+IGJyaWRnZSBhc3NvY2lh
dGVkIHdpdGggdGhlIG91dHB1dCwgYW5kIHdpbGwgYmUgYWJsZSB0byByZW1vdmUgeW91cgo+ID4g
Y3VzdG9tIGNvbm5lY3RvciBpbXBsZW1lbnRhdGlvbi4gSSB0aHVzIHJlY29tbWVuZCBjb252ZXJ0
aW5nIHRvCj4gPiBkcm1fcGFuZWxfYnJpZGdlX2FkZCgpIGVpdGhlciBhcyBwYXJ0IG9mIHRoaXMg
cGF0Y2ggc2VyaWVzLCBvciBqdXN0Cj4gPiBhZnRlciBpdCwgdG8gZ2V0IGZ1bGwgYmVuZWZpdHMu
Cj4gPiAKPiA+IFdpdGggdGhlIGFzc3VtcHRpb24gdGhhdCB0aGlzIHdpbGwgYmUgaGFuZGxlZCwK
PiA+IAo+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KPiAKPiBUaGFua3MgeW91IHZlcnkgbXVjaCEKPiAKPiBZZXMsIEkg
Z290IHlvdXJzIHBvaW50IGFib3V0IHdyYXBwaW5nIHBhbmVsIGludG8gdGhlIGJyaWRnZS4gQnV0
IEkgZG9uJ3QKPiB0aGluayB0aGF0IGl0J3Mgd29ydGggdGhlIGVmZm9ydCByaWdodCBub3cgYmVj
YXVzZSBlYWNoIFRlZ3JhIG91dHB1dCBoYXMKPiBpdCdzIG93biBpbXBsYW50YXRpb24gb2YgdGhl
IGNvbm5lY3RvciBhbmQgaXQgc2hvdWxkIGJlIGNsZWFuZXIgbm90IHRvCj4gdG91Y2ggdGhhdCBj
b2RlLgo+IAo+IFNlY29uZGx5LCBJIGRvbid0IGhhdmUgaGFyZHdhcmUgdG8gdGVzdCBhbGwgYXZh
aWxhYmxlIHBhbmVsIG91dHB1dCB0eXBlcwo+IG9uIFRlZ3JhIGFuZCB0aGUgYmVuZWZpdHMgb2Yg
bWVzc2luZyB3aXRoIGFsbCB0aGF0IGNvZGUgYXJlIGEgYml0IGRpbSB0byBtZS4KPiAKPiBJIGNh
biBtYWtlIGEgcGF0Y2ggdG8gd3JhcCB0aGUgUkdCIHBhbmVsIGludG8gYSBicmlkZ2UsIGJ1dCB0
aGlzIHNob3VsZAo+IG1ha2UgY29kZSBhIGJpdCBpbmNvbnNpc3RlbnQgaW4gcmVnYXJkcyB0byBu
b3QgaGF2aW5nIGEgY29tbW9uIGNvZGUgcGF0aAo+IGZvciB0aGUgImxlZ2FjeSIgbnZpZGlhLHBh
bmVsLiBTbyBwZXJoYXBzIGl0J3MgYmV0dGVyIHRvIGxlYXZlIGl0IGFsbAo+IGFzLWlzIGZvciBu
b3cuCgpJIGhhZCBhIGJyaWVmIGxvb2sgYXQgdGhlIGNvZGUsIGNvbnZlcnRpbmcgdGhlIGRpZmZl
cmVudCBvdXRwdXQgdHlwZXMKb25lIGJ5IG9uZSB3b3VsZCBiZSBhIGJldHRlciB3YXkgZm9yd2Fy
ZCB0aGFuIG5vdCBkb2luZyBhbnl0aGluZyBhdCBhbGwKaW4gbXkgb3BpbmlvbiA6LSkgT25jZSB5
b3UgY29udmVydCB0aGUgZmlyc3Qgb3V0cHV0IGl0IHdpbGwgYWxzbyBzZXJ2ZQphcyBhbiBleGFt
cGxlIG9uIGhvdyB0byBkbyBpdCwgYW5kIGhvcGVmdWxseSBvdGhlciBkZXZlbG9wZXJzIHdpdGgK
YWNjZXNzIHRvIGhhcmR3YXJlIGNvdWxkIHRoZW4gZG8gbW9yZSBjb252ZXJzaW9ucy4KCi0tIApS
ZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
