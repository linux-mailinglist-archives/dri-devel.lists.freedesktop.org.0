Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ACB60265
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A6B6E433;
	Fri,  5 Jul 2019 08:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2294 seconds by postgrey-1.36 at gabe;
 Fri, 05 Jul 2019 03:45:14 UTC
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58FA6E3FC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 03:45:14 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x653ir3n030852
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Jul 2019 12:44:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x653ir3n030852
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id j26so3010798vsn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 20:44:53 -0700 (PDT)
X-Gm-Message-State: APjAAAUmoI/OvryJJTkA0DxCcmwCJBism8AvX7QQxDCltfEubi5MGOhw
 P5hChtr8aHCK/0kjxrmrmhnZGPSQ40nF5j0dwgA=
X-Google-Smtp-Source: APXvYqxpP4MuQ7iqZIGkn/RtCeCHMzmWWGqt03RSBHVaQVqjSTFcyWuQuXXPfKQ8wISEjVRnZH9+UpCfJDH9DCoRV8I=
X-Received: by 2002:a67:d46:: with SMTP id 67mr791736vsn.181.1562298292360;
 Thu, 04 Jul 2019 20:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
 <CAK7LNAQc1xYoet1o8HJVGKuonUV40MZGpK7eHLyUmqet50djLw@mail.gmail.com>
 <CAK7LNASLfyreDPvNuL1svvHPC0woKnXO_bsNku4DMK6UNn4oHw@mail.gmail.com>
 <5e5353e2-bfab-5360-26b2-bf8c72ac7e70@infradead.org>
In-Reply-To: <5e5353e2-bfab-5360-26b2-bf8c72ac7e70@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 5 Jul 2019 12:44:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNATF+D5TgTZijG3EPBVON5NmN+JcwmCBvnvkMFyR+3wF2A@mail.gmail.com>
Message-ID: <CAK7LNATF+D5TgTZijG3EPBVON5NmN+JcwmCBvnvkMFyR+3wF2A@mail.gmail.com>
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1562298295;
 bh=gyzrOPyoHJn8yznucnkE9+HI+d/Euv7RRhUiRYloNpg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=raNNZCAOKEPHYVaij4yEdaIPKfvnxsA4hdGo8Hv/tDo5sAMhN3jJg1vcGLVFG9JTO
 L82ldU/CtNN81FFKJATdWEWwLXD9X9dT/W55cJJzb4hOlZdWIOYWD+Dz31Rc9Ho+L2
 9d4lOBh29rcUHfGBSuhjrB3yJ2W8klxOCrUGuql9fHk3XFRg2YseiwYMWW418NdkV5
 pb3b1IPwiFBgAWnYhc5fvJG9QtWqWovvnNdC5XhfgO/YZfedaZryTDOg+MKhUHbT1w
 DTWRmEilTshfqDmGuvLBRNE4VcefzUbsRp6eREmJQjN9WrlJJlKkirp+/37mAvc2d/
 hejICWC+a9ycA==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, mm-commits@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, mhocko@suse.cz,
 linux-mm@kvack.org, Mark Brown <broonie@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxMjoyMyBQTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiA3LzQvMTkgODowOSBQTSwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+ID4gT24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxMjowNSBQTSBNYXNhaGlybyBZYW1h
ZGEKPiA+IDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBP
biBGcmksIEp1bCA1LCAyMDE5IGF0IDEwOjA5IEFNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPiB3cm90ZToKPiA+Pj4KPiA+Pj4gT24gNy80LzE5IDM6MDEgUE0sIGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmcgd3JvdGU6Cj4gPj4+PiBUaGUgbW0tb2YtdGhlLW1vbWVudCBzbmFw
c2hvdCAyMDE5LTA3LTA0LTE1LTAxIGhhcyBiZWVuIHVwbG9hZGVkIHRvCj4gPj4+Pgo+ID4+Pj4g
ICAgaHR0cDovL3d3dy5vemxhYnMub3JnL35ha3BtL21tb3RtLwo+ID4+Pj4KPiA+Pj4+IG1tb3Rt
LXJlYWRtZS50eHQgc2F5cwo+ID4+Pj4KPiA+Pj4+IFJFQURNRSBmb3IgbW0tb2YtdGhlLW1vbWVu
dDoKPiA+Pj4+Cj4gPj4+PiBodHRwOi8vd3d3Lm96bGFicy5vcmcvfmFrcG0vbW1vdG0vCj4gPj4+
Cj4gPj4+IEkgZ2V0IGEgbG90IG9mIHRoZXNlIGJ1dCBkb24ndCBzZWUva25vdyB3aGF0IGNhdXNl
cyB0aGVtOgo+ID4+Pgo+ID4+PiAuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQyOiAuLi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9vYS9NYWtlZmlsZTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+
ID4+PiBtYWtlWzZdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAnLi4vZHJpdmVycy9ncHUv
ZHJtL2k5MTUvb2EvTWFrZWZpbGUnLiAgU3RvcC4KPiA+Pj4gLi4vc2NyaXB0cy9NYWtlZmlsZS5i
dWlsZDo0OTg6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzL2dwdS9kcm0vaTkxNS9vYScgZmFp
bGVkCj4gPj4+IG1ha2VbNV06ICoqKiBbZHJpdmVycy9ncHUvZHJtL2k5MTUvb2FdIEVycm9yIDIK
PiA+Pj4gLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0OTg6IHJlY2lwZSBmb3IgdGFyZ2V0ICdk
cml2ZXJzL2dwdS9kcm0vaTkxNScgZmFpbGVkCj4gPj4+Cj4gPj4KPiA+PiBJIGNoZWNrZWQgbmV4
dC0yMDE5MDcwNCB0YWcuCj4gPj4KPiA+PiBJIHNlZSB0aGUgZW1wdHkgZmlsZQo+ID4+IGRyaXZl
cnMvZ3B1L2RybS9pOTE1L29hL01ha2VmaWxlCj4gPj4KPiA+PiBEaWQgc29tZW9uZSBkZWxldGUg
aXQ/Cj4gPj4KPiA+Cj4gPgo+ID4gSSB0aGluayAib2JqLXkgKz0gb2EvIgo+ID4gaW4gZHJpdmVy
cy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUKPiA+IGlzIHJlZHVuZGFudC4KPgo+IFRoYW5rcy4gIEl0
IHNlZW1zIHRvIGJlIHdvcmtpbmcgYWZ0ZXIgZGVsZXRpbmcgdGhhdCBsaW5lLgoKCkNvdWxkIHlv
dSBjaGVjayB3aGV0aGVyIG9yIG5vdApkcml2ZXJzL2dwdS9kcm0vaTkxNS9vYS9NYWtlZmlsZSBl
eGlzdHMgaW4geW91ciBzb3VyY2UgdHJlZT8KCllvdXIgYnVpbGQgbG9nIHNheXMgaXQgd2FzIG1p
c3NpbmcuCgpCdXQsIGNvbW1pdCA1ZWQ3YTBjZjMzOTQgKCJkcm0vaTkxNTogTW92ZSBPQSBmaWxl
cyB0byBzZXBhcmF0ZSBmb2xkZXIiKQphZGRlZCBpdC4gIChJdCBpcyBqdXN0IGFuIGVtcHR5IGZp
bGUpCgpJIGFtIGp1c3Qgd29uZGVyaW5nIHdoeS4KCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJv
IFlhbWFkYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
