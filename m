Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EE5265D02
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D3A6E9EA;
	Fri, 11 Sep 2020 09:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA61F6E9EA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iOgmppT0qGwZOUSB5AHlfatEojFVOgSi72SRxPTKIUU=; b=YkNcRn0/g+VnGQ/Wmck4Wd/mHv
 KcpmsVuBM0Z8eGelYlb3LJJnYbJRrT76gfnzWZqV9FT2XOhNQJT4fpq0q9xZ3tGvSlYTTpesFW+k7
 xdTgaictL65VL6kg+Iz4O23Zvzw6qtw+M/ehmvS1CvUrBBAmxWeVL+BgOes0J2OJMDU3++3KzHDSH
 keyNQ4f4Catt0f97fjgNotpaEg6VKjbezZvaa5KKAk4xEmqyOfo29DF87AqdE20PE2Az9dLjWUmgL
 qdOJbIvFJBFg1cHM7xRgLhkfJSlp7ZjfYsODZj6yxXjF3kXjXq/4mZBToTlb+GaQXK1joAvvXbMkc
 G9sbCf/g==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kGfjj-0000uP-NU; Fri, 11 Sep 2020 12:52:55 +0300
Subject: Re: DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-15-mperttunen@nvidia.com>
 <54aff7f1-86b2-6bd7-1e47-2078edcf94b3@gmail.com>
 <a734a45f-2366-8a9f-1029-c052bd03bf78@kapsi.fi>
 <17e24d23-3b1e-44e3-57ca-35721dbd4af2@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <b85af7b8-870a-31e2-2f09-902a84a2afb6@kapsi.fi>
Date: Fri, 11 Sep 2020 12:52:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <17e24d23-3b1e-44e3-57ca-35721dbd4af2@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xMS8yMCAxOjE1IEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMDkuMDkuMjAyMCAx
MToxMCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IE9uIDkvOS8yMCAyOjQ1IEFNLCBE
bWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+PiAwNS4wOS4yMDIwIDEzOjM0LCBNaWtrbyBQZXJ0dHVu
ZW4g0L/QuNGI0LXRgjoKPj4+IC4uLgo+Pj4+ICsvKiBTdWJtaXNzaW9uICovCj4+Pj4gKwo+Pj4+
ICsvKiogUGF0Y2ggYWRkcmVzcyBvZiB0aGUgc3BlY2lmaWVkIG1hcHBpbmcgaW4gdGhlIHN1Ym1p
dHRlZCBnYXRoZXIuICovCj4+Pj4gKyNkZWZpbmUgRFJNX1RFR1JBX1NVQk1JVF9CVUZfV1JJVEVf
UkVMT0PCoMKgwqDCoMKgwqDCoCAoMTw8MCkKPj4+Cj4+PiBTaG91bGRuJ3QgdGhlIGtlcm5lbCBk
cml2ZXIgYmUgYXdhcmUgYWJvdXQgd2hhdCByZWxvY2F0aW9ucyBuZWVkIHRvIGJlCj4+PiBwYXRj
aGVkPyBDb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4gdGhlIHB1cnBvc2Ugb2YgdGhpcyBmbGFnPwo+
Pj4KPj4KPj4gU3VyZSwgdGhlIGtlcm5lbCBrbm93cyBpZiBpdCByZXR1cm5lZCB0aGUgSU9WQSB0
byB0aGUgdXNlciBvciBub3QsIHNvIHdlCj4+IGNvdWxkIHJlbW92ZSB0aGlzIGZsYWcgYW5kIGRl
dGVybWluZSBpdCBpbXBsaWNpdGx5LiBJIGRvbid0IHRoaW5rIHRoZXJlCj4+IGlzIG11Y2ggaGFy
bSBpbiBpdCB0aG91Z2g7IGlmIHdlIGhhdmUgdGhlIGZsYWcgYW4gYXBwbGljYXRpb24gY2FuIGRl
Y2lkZQo+PiB0byBpZ25vcmUgdGhlIGlvdmEgZmllbGQgYW5kIGp1c3QgcGFzcyBXUklURV9SRUxP
QyBhbHdheXMsIGFuZCBpdCdzIG5vdAo+PiByZWFsbHkgYW55IGV4dHJhIGNvZGUgb24ga2VybmVs
IHNpZGUuCj4gCj4gU291bmRzIGxpa2UgdGhlcmUgaXMgbm8gcmVhbCBwcmFjdGljYWwgdXNlIGZv
ciB0aGlzIGZsYWcgb3RoZXIgdGhhbiBmb3IKPiB0ZXN0aW5nIHB1cnBvc2VzLCBjb3JyZWN0Pwo+
IAoKUGF0Y2hpbmcgZGVwZW5kaW5nIGp1c3Qgb24gaWYgdGhlIE1BUCBJT0NUTCByZXR1cm5lZCBh
biBJT1ZBIG9yIG5vdCAKc2VlbXMgYSBiaXQgInNwb29reSBhY3Rpb24gYXQgYSBkaXN0YW5jZSIt
aXNoIHRvIG1lLCBidXQgbWF5YmUgaXQncyBub3QgCnNvIGJhZC4uIEknbGwgY29uc2lkZXIgcmVt
b3ZpbmcgaXQuCgpNaWtrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
