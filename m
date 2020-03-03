Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E409176EC9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 06:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802716E995;
	Tue,  3 Mar 2020 05:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 518 seconds by postgrey-1.36 at gabe;
 Tue, 03 Mar 2020 05:33:13 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEE66E995
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 05:33:13 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48WlnF1JYFz1rqRq;
 Tue,  3 Mar 2020 06:24:33 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48WlnF0qgLz1qx0L;
 Tue,  3 Mar 2020 06:24:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id N9XcA3XI8qPL; Tue,  3 Mar 2020 06:24:30 +0100 (CET)
X-Auth-Info: XXY6Dfo1DdngoqAr+D+AyZSK3c0FXHVKdxuvov1zL58=
Received: from [192.168.1.106] (82-131-141-185.pool.digikabel.hu
 [82.131.141.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  3 Mar 2020 06:24:30 +0100 (CET)
Subject: Re: [PATCH 06/33] drm/panel-lg-lg4573: Fix dotclock
To: Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-7-ville.syrjala@linux.intel.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <7c69898d-76d7-ff6d-a58c-cd64a3448f4c@denx.de>
Date: Tue, 3 Mar 2020 06:24:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200302203452.17977-7-ville.syrjala@linux.intel.com>
Content-Language: en-US
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
Reply-To: hs@denx.de
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gVmlsbGUgU3lyamFsYSwKCkFtIDAyLjAzLjIwMjAgdW0gMjE6MzQgc2NocmllYiBWaWxs
ZSBTeXJqYWxhOgo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Cj4gCj4gVGhlIGN1cnJlbnRseSBsaXN0ZWQgZG90Y2xvY2sgZGlzYWdyZWVzIHdp
dGggdGhlIGN1cnJlbnRseQo+IGxpc3RlZCB2cmVmcmVzaCByYXRlLiBDaGFuZ2UgdGhlIGRvdGNs
b2NrIHRvIG1hdGNoIHRoZSB2cmVmcmVzaC4KPiAKPiBTb21lb25lIHRlbGwgbWUgd2hpY2ggKGlm
IGVpdGhlcikgb2YgdGhlIGRvdGNsb2NrIG9yIHZyZXJlc2ggaXMKPiBjb3JyZWN0PwoKWW91ciBj
bG9jayBmaXggaXMgY29ycmVjdCwgdGhhbmtzIQoKPiAKPiBDYzogSGVpa28gU2Nob2NoZXIgPGhz
QGRlbnguZGU+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sZy1sZzQ1NzMuYyB8IDIg
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKUmV2
aWV3ZWQtYnk6IEhlaWtvIFNjaG9jaGVyIDxoc0BkZW54LmRlPgoKYnllLApIZWlrbwotLSAKREVO
WCBTb2Z0d2FyZSBFbmdpbmVlcmluZyBHbWJILCAgICAgIE1hbmFnaW5nIERpcmVjdG9yOiBXb2xm
Z2FuZyBEZW5rCkhSQiAxNjUyMzUgTXVuaWNoLCBPZmZpY2U6IEtpcmNoZW5zdHIuNSwgRC04MjE5
NCBHcm9lYmVuemVsbCwgR2VybWFueQpQaG9uZTogKzQ5LTgxNDItNjY5ODktNTIgICBGYXg6ICs0
OS04MTQyLTY2OTg5LTgwICAgRW1haWw6IGhzQGRlbnguZGUKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
