Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2FAB092C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA136EB8B;
	Thu, 12 Sep 2019 07:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A1B6E029
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 00:53:13 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id x8C0qehW031826
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 09:52:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x8C0qehW031826
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id w195so15038592vsw.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:52:41 -0700 (PDT)
X-Gm-Message-State: APjAAAU/dVHfs+QN9dHcshqFtau6NUGZFINAEY0U9qxiRWSiVRgr+CRE
 8AZXRp5ymACYZpdqL+PHXEoVJifU3huYcxlQYPo=
X-Google-Smtp-Source: APXvYqzqoiDkP84GVdQRATv6NHL348lP9+WwfJKOqB3cvmaSODCnoCOjiv71A4zCzLOntY7ISObv/nmkVN1okIGiPpM=
X-Received: by 2002:a67:1a41:: with SMTP id a62mr22692085vsa.54.1568249560218; 
 Wed, 11 Sep 2019 17:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190911173453.958-1-cai@lca.pw>
 <CAO4ZVTMUMKMOqef5yV=5bwHLXLMsNtTegGGMkw0GbFaDHvrV6g@mail.gmail.com>
 <08E1DEDD-D82F-41C1-966B-ECCE445C8FA1@lca.pw>
In-Reply-To: <08E1DEDD-D82F-41C1-966B-ECCE445C8FA1@lca.pw>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Sep 2019 09:52:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNASuqYP6kCvkkWQSw1=_DqyYPjgGwxjg3yCtXqyB2KKqrg@mail.gmail.com>
Message-ID: <CAK7LNASuqYP6kCvkkWQSw1=_DqyYPjgGwxjg3yCtXqyB2KKqrg@mail.gmail.com>
Subject: Re: [RFC PATCH] gpu: no need to compile drm/ if CONFIG_DRM=n
To: Qian Cai <cai@lca.pw>
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1568249561;
 bh=NKUMKkNtqrTDWVT1RfLccaVJ+xpM7V6DZTRRz/GPGuw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RzDfyOI55EA7WF2xdjs7tkxM22KbWfvxPD1sifXO1FtLjiIfV65YxTizktZcuyqj8
 c2bfyOHKAFI9geummPzJ7TjFboyxopJcSgnprroGE/FobXeHsAqgCtHGvOE3W5gKqe
 ouH3pFBjTf55YJHAdv5aO85BZMm99/Kh1bb7EpUMjqJFFNSTEhHvUCK9n1dINncUAs
 N7ocOOdaurLi6hQk9iI51a3SxL8s1el/rqU3nFx6IB7+p+1eqnAqTzXiU+HUV4WrfF
 s+//lApTUSIifRjGTJ9mfsQmB4qyV4qkwM21WzJKS6sX3dfh4pSIlabRpn2fC40jdT
 473stFcb60nhA==
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, mripard@kernel.org,
 Sean Paul <sean@poorly.run>, Maxime Ripard <maxime.ripard@anandra.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMjo0MSBBTSBRaWFuIENhaSA8Y2FpQGxjYS5wdz4gd3Jv
dGU6Cj4KPgo+Cj4gPiBPbiBTZXAgMTEsIDIwMTksIGF0IDE6MzcgUE0sIE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYW5hbmRyYS5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpLAo+ID4KPiA+IExl
IG1lci4gMTEgc2VwdC4gMjAxOSDDoCAxOTozNSwgUWlhbiBDYWkgPGNhaUBsY2EucHc+IGEgw6lj
cml0IDoKPiA+IFRoZSBjb21taXQgYzBlMDkyMDBkYzA4ICgiZHJtOiByZW9yZ2FuaXNlIGRybSB0
cmVlIHRvIGJlIG1vcmUgZnV0dXJlCj4gPiBwcm9vZi4iKSBjaGFuZ2VkIHRoZSBiZWhhdmlvciBm
cm9tIG9ubHkgY29tcGlsaW5nIGRybS8gaWYgQ09ORklHX0RSTT15Cj4gPiB0byBhbHdheXMgY29t
cGlsaW5nIGRybS8uIFRoaXMgcmVzdG9yZXMgdGhlIGJlaGF2aW9yLCBzbyBwZW9wbGUgZG9uJ3QK
PiA+IG5lZWQgdG8gd2FzdGUgdGltZSBjb21waWxpbmcgc3R1ZmYgdGhleSBkb24ndCBuZWVkLgo+
ID4KPiA+IEZpeGVzOiBjMGUwOTIwMGRjMDggKCJkcm06IHJlb3JnYW5pc2UgZHJtIHRyZWUgdG8g
YmUgbW9yZSBmdXR1cmUgcHJvb2YuIikKPiA+Cj4gPiBZb3UgYXJlIG1pc3NpbmcgeW91ciBzaWdu
ZWQtb2ZmLWJ5Cj4KPiBUaGF0IGlzIGludGVudGlvbmFsIGJlY2F1c2UgdGhpcyBpcyBhIFJGQyBw
YXRjaCB0byBnYXRoZXIgdGhlIGZlZWRiYWNrIGFzIEkgYW0gbm8KPiBleHBlcnQgaW4gRFJNIGFu
ZCBtYXkgbWlzcyBzb21ldGhpbmcgaW1wb3J0YW50Lgo+Cj4gT25jZSBwZW9wbGUgYXJlIGhhcHB5
IHdpdGggaXQsIEkgcGxhbiB0byBzZW5kIGEgZm9ybWFsIHBhdGNoIHdpdGggU2lnbmVkLW9mZi1i
eS4KPgoKCkNPTkZJR19EUk0gaXMgdHJpc3RhdGUuCgpZb3VyIHBhdGNoIHJlcXVpcmVzIGV2ZXJ5
dGhpbmcgdW5kZXIgZHJpdmVycy9ncHUvZHJtLwptb2R1bGFyIHdoZW4gQ09ORklHX0RSTT1tLgoK
QXQgbGVhc3QsIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kc2kuYwppcyBidWlsdC1pbiBvbmx5
LgoKSSBndWVzcyB0aGF0IGlzIHRoZSByZWFzb24gd2h5CnRoZXkgdXNlICdvYmoteSArPSBkcm0v
Jy4KCgpJbiBvdGhlciB3b3JkcywgaWYgeW91IGFyZSBhYmxlIHRvCm1ha2UgYWxsIHRoZSBkcm0g
Y29kZSBtb2R1bGFyLAp5b3VyIHBhdGNoIGlzIGFwcGxpY2FibGUuCgoKLS0gCkJlc3QgUmVnYXJk
cwpNYXNhaGlybyBZYW1hZGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
