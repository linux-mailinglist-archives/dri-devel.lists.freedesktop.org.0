Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04E9118A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CE86EB3A;
	Sat, 17 Aug 2019 15:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029766EAA9;
 Fri, 16 Aug 2019 01:53:37 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=[192.168.1.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hyRQu-0007UH-KQ; Fri, 16 Aug 2019 01:53:36 +0000
Subject: Re: Linux Kernel 5.2.8 (uvc or i915?)
To: Nathaniel Russell <naterussell83@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org
References: <CAONH+Jm-O6=DQ+K2n5pNTNMg2Sq1KcVNFLuweVh6W82OPEFJoQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <abcae5c9-b3dc-7403-d628-5d7543d19702@infradead.org>
Date: Thu, 15 Aug 2019 18:53:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAONH+Jm-O6=DQ+K2n5pNTNMg2Sq1KcVNFLuweVh6W82OPEFJoQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Cc:From:References:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HtyHYdFlwyazFIJGohR0P9Gp5PX4Jt5DqPd93qaXEGQ=; b=IjkAUELEaQ8I3nTD9a5Mfx463
 annfybnsgAmRS/OgPXhEHeDljQgQZiUY/JFVYh9FupbATnMg7DcZ/y4lADefb+JslT6TpAtJZGVRJ
 fQ0DOj2QtyjBm3XX7T5+ryi0Q+LcUbgeFhqOUuLp+0hYntz0NZ0InXw6zSlCx64XXm24rmZ4bEg3P
 duqn6rGKm1CESw4wrAuEHhrUvk9yk6gu/tQFyTrTn2ro6BWQ8HWpP/9b2REKxp+IfJUxZYdXUGklZ
 PjWKhsEKN53qMJtdIpVsr2SzVORNHJP4dqbHVX2O/FBeMmNd3yIx+NJhRyYCetEtP+Bq6QQj0Svso
 UD+Pn9rDg==;
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xNS8xOSA2OjE1IFBNLCBOYXRoYW5pZWwgUnVzc2VsbCB3cm90ZToKPiBJIHdvdWxkIHJl
YWxseSBsaWtlIGhlbHAgd2l0aCB0aGUga2VybmVsIGVycm9yIHdpdGggbXkgdXZjdmlkZW8gZHJp
dmVyLgo+IAoKSGkgYWdhaW4uCgpXaGF0IG1ha2VzIHlvdSB0aGluayB0aGF0IHRoZSBwcm9ibGVt
IGlzIHJlbGF0ZWQgdG8gdGhlIHV2Y3ZpZGVvIGRyaXZlcj8KRG9lcyBzb21lIHByZXZpb3VzIGtl
cm5lbCB2ZXJzaW9uIHdvcmsgY29ycmVjdGx5PyAgSWYgc28sIHdoYXQgdmVyc2lvbihzKT8KCgpE
b2VzIHRoaXMgd2FybmluZyBtZXNzYWdlIG9ubHkgaGFwcGVuIHdoZW4gdGhlIHV2Y3ZpZGVvIGRy
aXZlciBpcyBiZWluZyBsb2FkZWQ/CkNhbiB5b3Ugc3VwcHJlc3MgbG9hZGluZyBvZiB0aGUgdXZj
dmlkZW8gZHJpdmVyIHRvIGZpbmQgb3V0PwoKTW9zdCBvZiB0aGUgcHJvYmxlbXMvZXJyb3JzL3dh
cm5pbmdzIHRoYXQgSSBzZWUgYXJlIHJlbGF0ZWQgdG8gdGhlIGk5MTUgZHJpdmVyOgoKWyAgIDEz
LjAzMjM0MV0gdGltZWQgb3V0IHdhaXRpbmcgZm9yIHBvcnQgQyByZWFkeTogZ290IDB4MjAsIGV4
cGVjdGVkIDB4ZTAKWyAgIDEzLjAzMjg3Ml0gV0FSTklORzogQ1BVOiAxIFBJRDogMjM5IGF0IGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rpc3BsYXkuYzoxNTk3IHZsdl93YWl0X3BvcnRfcmVh
ZHkrMHg5OS8weGUwIFtpOTE1XQpbICAgMTMuMDMzNjMyXSBSSVA6IDAwMTA6dmx2X3dhaXRfcG9y
dF9yZWFkeSsweDk5LzB4ZTAgW2k5MTVdCgphbHRob3VnaCB0aGVyZSBhcmUgYSBmZXcgdXZjdmlk
ZW8gd2FybmluZ3M6ClsgICAxMy4wMzkzMDVdIHV2Y3ZpZGVvIDEtNToxLjA6IEVudGl0eSB0eXBl
IGZvciBlbnRpdHkgRXh0ZW5zaW9uIDQgd2FzIG5vdCBpbml0aWFsaXplZCEKWyAgIDEzLjAzOTMx
OF0gdXZjdmlkZW8gMS01OjEuMDogRW50aXR5IHR5cGUgZm9yIGVudGl0eSBFeHRlbnNpb24gMyB3
YXMgbm90IGluaXRpYWxpemVkIQpbICAgMTMuMDM5MzMwXSB1dmN2aWRlbyAxLTU6MS4wOiBFbnRp
dHkgdHlwZSBmb3IgZW50aXR5IFByb2Nlc3NpbmcgMiB3YXMgbm90IGluaXRpYWxpemVkIQpbICAg
MTMuMDM5MzM5XSB1dmN2aWRlbyAxLTU6MS4wOiBFbnRpdHkgdHlwZSBmb3IgZW50aXR5IENhbWVy
YSAxIHdhcyBub3QgaW5pdGlhbGl6ZWQhCgoKTGF1cmVudCwgZG8geW91IHNlZSBhbnkgdXZjIGlz
c3VlcyBoZXJlPyAgQW55IGlkZWFzL3N1Z2dlc3Rpb25zPwoKCkBpbnRlbC1nZng6ICBhbnkgaWRl
YXMgYWJvdXQgd2hhdCBpcyBnb2luZyBvbiBoZXJlIHdpdGggdGhlIGk5MTUgZHJpdmVyPwoKCgpP
cmlnaW5hbCBtZXNzYWdlIHRvIGxrbWw6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FP
TkgrSm0tTzY9RFErSzJuNXBOVE5NZzJTcTFLY1ZORkx1d2VWaDZXODJPUEVGSm9RQG1haWwuZ21h
aWwuY29tL1QvI3UKClByZXZpb3VzIG1lc3NhZ2UgZm9yIDUuMS4yMSBrZXJuZWw6Cmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FPTkgrSmtURnVqWTl2RXlOTnVlbSs5ckoycUJLa2YtUGJL
azk9REJTVkVwNmtXPXl3QG1haWwuZ21haWwuY29tLwoKCnRoYW5rcy4KLS0gCn5SYW5keQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
