Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B557C92116
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4887D898F1;
	Mon, 19 Aug 2019 10:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 930 seconds by postgrey-1.36 at gabe;
 Mon, 19 Aug 2019 02:23:06 UTC
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73C96E084
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 02:23:06 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 612418B63E9014134CB8;
 Mon, 19 Aug 2019 10:07:32 +0800 (CST)
Received: from [127.0.0.1] (10.57.77.74) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 19 Aug 2019
 10:07:25 +0800
Subject: Re: [RESEND][PATCH v3 00/26] drm: Kirin driver cleanups to prep for
 Kirin960 support
To: Sam Ravnborg <sam@ravnborg.org>, John Stultz <john.stultz@linaro.org>,
 <xuyiping@hisilicon.com>
References: <20190814184702.54275-1-john.stultz@linaro.org>
 <20190814194508.GA26866@ravnborg.org>
From: xinliang <z.liuxinliang@hisilicon.com>
Message-ID: <5D5A045C.5020707@hisilicon.com>
Date: Mon, 19 Aug 2019 10:07:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20190814194508.GA26866@ravnborg.org>
X-Originating-IP: [10.57.77.74]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 19 Aug 2019 10:14:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LzgvMTUgMzo0NSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIFhpbmxpYW5nLCBS
b25ncm9uZywgWGlud2VpLCBDaGVuCj4KPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwNjo0Njoz
NlBNICswMDAwLCBKb2huIFN0dWx0eiB3cm90ZToKPj4gSnVzdCB3YW50ZWQgdG8gcmVzZW5kIHRo
aXMgcGF0Y2ggc2V0IHNvIEkgZGlkbid0IGhhdmUgdG8KPj4gY29udGludWUgY2FycnlpbmcgaXQg
Zm9yZXZlciB0byBrZWVwIHRoZSBIaUtleTk2MCBib2FyZCBydW5uaW5nLgo+Pgo+PiBUaGlzIHBh
dGNoc2V0IGNvbnRhaW5zIG9uZSBmaXggKGluIHRoZSBmcm9udCwgc28gaXRzIGVhc2llciB0bwo+
PiBldmVudHVhbGx5IGJhY2twb3J0KSwgYW5kIGEgc2VyaWVzIG9mIGNoYW5nZXMgZnJvbSBZaVBp
bmcgdG8KPj4gcmVmYWN0b3IgdGhlIGtpcmluIGRybSBkcml2ZXIgc28gdGhhdCBpdCBjYW4gYmUg
dXNlZCBvbiBib3RoCj4+IGtpcmluNjIwIGJhc2VkIGRldmljZXMgKGxpa2UgdGhlIG9yaWdpbmFs
IEhpS2V5IGJvYXJkKSBhcyB3ZWxsCj4+IGFzIGtpcmluOTYwIGJhc2VkIGRldmljZXMgKGxpa2Ug
dGhlIEhpS2V5OTYwIGJvYXJkKS4KPj4KPj4gVGhlIGZ1bGwga2lyaW45NjAgZHJtIHN1cHBvcnQg
aXMgc3RpbGwgYmVpbmcgcmVmYWN0b3JlZCwgYnV0IGFzCj4+IHRoaXMgYmFzZSBraXJpbiByZXdv
cmsgd2FzIGdldHRpbmcgdG8gYmUgc3Vic3RhbnRpYWwsIEkgd2FudGVkCj4+IHRvIHNlbmQgb3V0
IHRoZSBmaXJzdCBjaHVuaywgc28gdGhhdCB0aGUgcmV2aWV3IGJ1cmRlbiB3YXNuJ3QKPj4gb3Zl
cndoZWxtaW5nLgo+IEFzIE1haW50YWluZXJzIGNhbiB3ZSBwbGVhc2UgZ2V0IHNvbWUgZmVlZGJh
Y2sgZnJvbSBvbmUgb2YgeW91Lgo+IEp1c3QgYW4gIk9LIHRvIGNvbW1pdCIgd291bGQgZG8gaXQu
Cj4gQnV0IHByZWZlcmFibHkgYW4gYWNrIG9yIGEgcmV2aWV3IG9uIHRoZSBpbmRpdmlkdWFsIHBh
dGNoZXMuCgpIaSBzYW0sClNvIHNvcnJ5IGZvciByZXNwb25kaW5nIGxhdGUuCkFzIEkgaGF2ZSBk
b25lIGEgcHJlLXJldmlldyBhbmQgdGFsa2VkIHdpdGggdGhlICBhdXRob3IgYmVmb3JlIHNlbmRp
bmcgCm91dCB0aGUgcGF0Y2hlcy4KU28sIGZvciB0aGlzIHNlcmlhbCBwYXRjaGVzLApBY2tlZC1i
eTogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+Cgo+Cj4gSWYgdGhl
IHJlYWxpdHkgaXMgdGhhdCBKb2huIGlzIHRoZSBNYWludGFpbmVyIHRvZGF5LAo+IHRoZW4gd2Ug
c2hvdWxkIHVwZGF0ZSBNQUlOVEFJTkVSUyB0byByZWZsZWN0IHRoaXMuCgpJIGFtIGFzc3VtaW5n
IHlvdSBhcmUgdGFsa2luZyBhYm91dCB0aGUga2lyaW5bMV0gZHJtIGRyaXZlciBub3QgdGhlIApo
aWJtY1syXSBvbmUsIHJpZ2h0PwpJIHJlYWxseSBhcHByZWNpYXRlIEpvaG4ncyBhd2Vzb21lIHdv
cmsgYXQga2lyaW4gZHJtIGRyaXZlciBhbGwgdGhlIHdheS4KSG9uZXN0bHksIGFmdGVyIG15IHdv
cmsgY2hhbmdlIGZyb20gbW9iaWxlIHRvIHNlcnZlciB5ZWFycyBhZ28sIEkgYW0gCmFsd2F5cyB3
YWl0aW5nIGZvciBzb21lIGd1eSB3aG8gaXMgc3RhYmx5IHdvcmtpbmcgYXQga2lyaW4gZHJtIGRy
aXZlciB0byAKdGFrZSB0aGUgbWFpbnRlbmFuY2Ugd29yay4KSm9obiwgc3VyZWx5IGlzIGEgc3Vj
aCBndXkuICBQbGVhc2UgYWRkIHVwIGEgcGF0Y2ggdG8gdXBkYXRlIHRoZSAKbWFpbnRhaW5lciBh
cyBKb2huLCBpZiBKb2huIGFncmVlIHNvLiAgVGhlbiBKb2huIGNhbiBwdXNoIHRoZSBwYXRjaCBz
ZXQgCnRvIGRybSBtYWludGFpbmVyIGhpbXNlbGYuCipOb3RlKiB0aGF0IHRoZSBtYWludGFpbmVy
IHBhdGNoIHNob3VsZCBicmVhayBoaXNpbGljb24gZHJpdmVycyBpbnRvIApraXJpbiBhbmQgaGli
bWMgdHdvIHBhcnRzLCBsaWtlIGJlbGxvdzoKCkRSTSBEUklWRVJTIEZPUiBISVNJTElDT04gSElC
TUMKTTogIFhpbmxpYW5nIExpdSA8ei5saXV4aW5saWFuZ0BoaXNpbGljb24uY29tPgouLi4KRjog
IGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMKLi4uCgpEUk0gRFJJVkVSUyBGT1IgSElT
SUxJQ09OIEtJUklOCk06ICBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KLi4u
CkY6ICBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluCi4uLgoKWzFdIGRyaXZlcnMvZ3B1
L2RybS9oaXNpbGljb24va2lyaW4gIyBmb3Iga2lyaW4gbW9iaWxlIGRpc3BsYXkgZHJpdmVyClsy
XSBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jICMgZm9yIHNlcnZlciBWR0EgZHJpdmVy
CgoKVGhhbmtzLApYaW5saWFuZwoKCj4KPiBUaGFua3MhCj4KPiAJU2FtCj4KPiAuCj4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
