Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8ACAD112
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 00:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA32689341;
	Sun,  8 Sep 2019 22:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4F189341
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 22:46:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [88.214.162.168])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7D9523F;
 Mon,  9 Sep 2019 00:46:46 +0200 (CEST)
Date: Mon, 9 Sep 2019 01:46:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 0/2] drm/panel: Extend panels to report their types
Message-ID: <20190908224633.GA4952@pendragon.ideasonboard.com>
References: <20190904132804.29680-1-laurent.pinchart@ideasonboard.com>
 <20190908171151.GB20115@ravnborg.org>
 <20190908171748.GA3451@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190908171748.GA3451@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567982810;
 bh=vk9yy6ltuwveTMQaZYiRfBBAZGcFqRoJCXFWQirK7GY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SoY6iOTGMNpUGDP4k+mIBnPoc5DB8hLxmGvk5soF357EIOs9v2C5dzavasltWifOa
 ICRHWLQy2EGsPHDnkqgMc14SnWYXX5F3QF0M+myPzKoTHwEh75zgwrcoHvCvYCvqpb
 bu8mxhtFFP8lnM6GGQL2Kvkrm8bQDhm9wd32agKY=
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gU3VuLCBTZXAgMDgsIDIwMTkgYXQgMDc6MTc6NDhQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IEhpIExhdXJlbnQuCj4gCj4gPiA+IExhdXJlbnQgUGluY2hhcnQgKDIp
Ogo+ID4gPiAgIGRybS9wYW5lbDogQWRkIGFuZCBmaWxsIGRybV9wYW5lbCB0eXBlIGZpZWxkCj4g
PiA+ICAgZHJtL2JyaWRnZTogcGFuZWw6IEluZmVyIGNvbm5lY3RvciB0eXBlIGZyb20gcGFuZWwg
YnkgZGVmYXVsdAo+ID4gCj4gPiBBcHBsaWVkIGFsbCB0aHJlZSBwYXRjaGVzIChkZXNwaXRlIHRo
aXMgc2hvcnRsb2cgb25seSBzaG93cyB0d28KPiA+IHBhdGNoZXMpLgo+IAo+IEkgZ3Vlc3MgeW91
IG5vdGljZWQgdGhhdCBJIGhhdmUgYmVlbiBhd2F5IGEgbGl0dGxlLgo+IFRoaXMgd2lsbCBjb250
aW51ZSBmb3IgYXQgbGVhc3QgYW5vdGhlciB3ZWVrLgo+IGRheS10aW1lIGpvYiArIHNvbWUgdHJh
dmVsbGluZyBhaGVhZC4KCk5vIHdvcnJpZXMgYXQgYWxsLiBUaGFua3MgZm9yIHlvdXIgd29yayBh
bmQgZm9yIHBpY2tpbmcgdGhvc2UgcGF0Y2hlcywKYW5kIGhhdmUgYSBzYWZlIChhbmQgaWYgcG9z
c2libGUgZW5qb3lhYmxlKSB0cmF2ZWwuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
