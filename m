Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4887EE455A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE526E8F8;
	Fri, 25 Oct 2019 08:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 433 seconds by postgrey-1.36 at gabe;
 Thu, 24 Oct 2019 18:22:58 UTC
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3546E5D0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 18:22:58 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46zb314n99zGW;
 Thu, 24 Oct 2019 20:13:33 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date: Thu, 24 Oct 2019 20:15:39 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Do not use ->load() and ->unload() callbacks
Message-ID: <20191024181539.GA31268@qmqm.qmqm.pl>
References: <20191024173137.290420-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024173137.290420-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=rere.qmqm.pl; s=1; 
 t=1571940815; bh=WfK3oNRN9I+lZk7Ynfr6EoWEBKeS93r2cKUaykOWzBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JpDoSLD8LF+A5WvE5GU8PBfT5AWzy3mrbMKuYNder3zSLAG0B792FthNpp2u8qoZh
 PfomgVRwejEceNosl+4/BZDARKQ58nb7Cb6XY8NicA4yuQK+tBH0RH+I2AB8mge4Lx
 c8k39GgeRU1qt4cgJv0ef4OBnHXK+AeCWJ+3TVVKWFe9cCn4vFqNxMZiLaD1W+vWcV
 x944X9iu5IEcOIWGGJU7wByPyfGiZje1W+Ad0XrvsNr48y30n80JT5wxCmDQ80Mof5
 7R5TZ32qJzQgB4Sti+0ovOemOvFVLi4EX170UUcqibdYGR0/7Q86tUlZE571gy8h2x
 TxazcwXei+0lQ==
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDc6MzE6MzdQTSArMDIwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBU
aGUgLT5sb2FkKCkgYW5kIC0+dW5sb2FkKCkgZHJpdmVycyBhcmUgbWlkbGF5ZXJzIGFuZCBzaG91
bGQgYmUgYXZvaWRlZAo+IGluIG1vZGVybiBkcml2ZXJzLiBGaXggdGhpcyBieSBtb3ZpbmcgdGhl
IGNvZGUgaW50byB0aGUgZHJpdmVyIC0+cHJvYmUoKQo+IGFuZCAtPnJlbW92ZSgpIGltcGxlbWVu
dGF0aW9ucywgcmVzcGVjdGl2ZWx5Lgo+IAo+IHYyOiBraWNrIG91dCBjb25mbGljdGluZyBmcmFt
ZWJ1ZmZlcnMgYmVmb3JlIGluaXRpYWxpemluZyBmYmRldgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRo
aWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCj4gTWljaGHFgiwgRG1pdHJ5
LAo+IAo+IGRvIHlvdSBndXlzIGhhdmUgYSB3YXkgb2YgdGVzdGluZyB0aGF0IHRoZSByZW1vdmFs
IG9mIHRoZSBjb25mbGljdGluZwo+IGZyYW1lYnVmZmVyIGFjdHVhbGx5IHdvcmtzPwpbLi4uXQoK
SSBtaWdodCBiZSBhYmxlIHRvIGNoZWNrIGR1cmluZyB0aGUgd2Vla2VuZC4gSXMgdGhpcyBwYXRj
aCBhbG9uZSBlbm91Z2gKZm9yIHY1LjM/CgpCZXN0IFJlZ2FyZHMsCk1pY2hhxYIgTWlyb3PFgmF3
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
