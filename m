Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD15E4B1E9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 08:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B5389FA5;
	Wed, 19 Jun 2019 06:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF94189FA5;
 Wed, 19 Jun 2019 06:07:12 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id j21so2994640uap.2;
 Tue, 18 Jun 2019 23:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g7O7qmxDa1+JZ1Dry7qEOvSBzhak1PoCcmHKeNT1e3A=;
 b=R4Yq39cmqBn9UilewePEN7feaWD/gmpKGX8p0CCWreCrDVjchjV37goJv4Db6vb4tB
 30Po+l1swHt+brOuKqoS2lFimv5o3A03qqyYdvOtJdREL71E15xwLTfOcBePbtFX3JuT
 9w1iBgUbOtbySPTrP5Wz5mnQOHUpYSW4k/uo6D5pkav4R8Tk5NEkU4DTtq1bp4TZzJKU
 XWODJ3m2plSHi2V2ZWIqhvb/rrlTAKHQJHvVcCGJZOiEOWRzmMvZnEKFMAa1xZqMOlzj
 yHlDJJ5c7kCtYIhOvWVyUQARDeEO+f0KqEyJ+Ip4uFp+mr26M0yZ6dJxlGrM5qXsDmG8
 3ieg==
X-Gm-Message-State: APjAAAUAjQyQmH3OTBRXyA/BhudD0FyegMtTUDmjJ7AZ7DfTh5eORNAW
 0nAaH8Gi+kinf3l3Dqs/05eH9C9aZMl8XNDJRCY=
X-Google-Smtp-Source: APXvYqznQPXDIKRXoJvK3+CwHCpZWFSP/RAkMIJMI+24ug7p/kTDAhLtwibkBeVBbwT5pg09jFCvdFfX5IqIFV81Gsw=
X-Received: by 2002:a9f:31a2:: with SMTP id v31mr13162830uad.15.1560924431935; 
 Tue, 18 Jun 2019 23:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190614024957.GA9645@jagdpanzerIV>
 <20190619050811.GA15221@jagdpanzerIV>
 <CAKb7UvhdN=RUdfrnWswT4ANK5UwPcM-upDP85=84zsCF+a5-bg@mail.gmail.com>
 <20190619054826.GA2059@jagdpanzerIV>
In-Reply-To: <20190619054826.GA2059@jagdpanzerIV>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 19 Jun 2019 02:07:00 -0400
Message-ID: <CAKb7UvgkEXtmJV67EXeBctgaOxM1D91fBbKw9oFMUaB1ZViZQg@mail.gmail.com>
Subject: Re: nouveau: DRM: GPU lockup - switching to software fbcon
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTo0OCBBTSBTZXJnZXkgU2Vub3poYXRza3kKPHNlcmdl
eS5zZW5vemhhdHNreS53b3JrQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiAoMDYvMTkvMTkgMDE6
MjApLCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDE6MDgg
QU0gU2VyZ2V5IFNlbm96aGF0c2t5Cj4gPiA8c2VyZ2V5LnNlbm96aGF0c2t5LndvcmtAZ21haWwu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gKDA2LzE0LzE5IDExOjUwKSwgU2VyZ2V5IFNlbm96
aGF0c2t5IHdyb3RlOgo+ID4gPiA+IGRtZXNnCj4gPiA+ID4KPiA+ID4gPiAgbm91dmVhdSAwMDAw
OjAxOjAwLjA6IERSTTogR1BVIGxvY2t1cCAtIHN3aXRjaGluZyB0byBzb2Z0d2FyZSBmYmNvbgo+
ID4gPiA+ICBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzogU0NIRURfRVJST1IgMGEgW0NUWFNX
X1RJTUVPVVRdCj4gPiA+ID4gIG5vdXZlYXUgMDAwMDowMTowMC4wOiBmaWZvOiBydW5saXN0IDA6
IHNjaGVkdWxlZCBmb3IgcmVjb3ZlcnkKPiA+ID4gPiAgbm91dmVhdSAwMDAwOjAxOjAwLjA6IGZp
Zm86IGNoYW5uZWwgNToga2lsbGVkCj4gPiA+ID4gIG5vdXZlYXUgMDAwMDowMTowMC4wOiBmaWZv
OiBlbmdpbmUgNjogc2NoZWR1bGVkIGZvciByZWNvdmVyeQo+ID4gPiA+ICBub3V2ZWF1IDAwMDA6
MDE6MDAuMDogZmlmbzogZW5naW5lIDA6IHNjaGVkdWxlZCBmb3IgcmVjb3ZlcnkKPiA+ID4gPiAg
bm91dmVhdSAwMDAwOjAxOjAwLjA6IGZpcmVmb3hbNDc2XTogY2hhbm5lbCA1IGtpbGxlZCEKPiA+
ID4gPiAgbm91dmVhdSAwMDAwOjAxOjAwLjA6IGZpcmVmb3hbNDc2XTogZmFpbGVkIHRvIGlkbGUg
Y2hhbm5lbCA1IFtmaXJlZm94WzQ3Nl1dCj4gPiA+ID4KPiA+ID4gPiBJdCBsb2NrdXBzIHNldmVy
YWwgdGltZXMgYSBkYXkuIFR3aWNlIGluIGp1c3Qgb25lIGhvdXIgdG9kYXkuCj4gPiA+ID4gQ2Fu
IHdlIGZpeCB0aGlzPwo+ID4gPgo+ID4gPiBVbnVzYWJsZQo+ID4KPiA+IEFyZSB5b3UgdXNpbmcg
YSBHVFggNjYwIGJ5IGFueSBjaGFuY2U/IFlvdSd2ZSBwcm92aWRlZCByYXRoZXIgbWluaW1hbAo+
ID4gc3lzdGVtIGluZm8uCj4KPiAwMTowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IE5W
SURJQSBDb3Jwb3JhdGlvbiBHSzIwOEIgW0dlRm9yY2UgR1QgNzMwXSAocmV2IGExKQoKUXVpdGUg
bGl0ZXJhbGx5IHRoZSBzYW1lIEdQVSBJIGhhdmUgcGx1Z2dlZCBpbi4uLgoKMDI6MDAuMCBWR0Eg
Y29tcGF0aWJsZSBjb250cm9sbGVyIFswMzAwXTogTlZJRElBIENvcnBvcmF0aW9uIEdLMjA4Qgpb
R2VGb3JjZSBHVCA3MzBdIFsxMGRlOjEyODddIChyZXYgYTEpCgpXb3JrcyBncmVhdCBoZXJlISBP
bmx5IG90aGVyIHRoaW5nIEkgY2FuIHRoaW5rIG9mIGlzIHRoYXQgSSBhdm9pZAphcHBsaWNhdGlv
bnMgd2l0aCB0aGUgbGV0dGVycyAiRyIgYW5kICJLIiBpbiB0aGVpciBuYW1lcywgYW5kIEknbQp1
c2luZyB4Zjg2LXZpZGVvLW5vdXZlYXUgZGR4LCB3aGVyZWFzIHlvdSBtaWdodCBiZSB1c2luZyB0
aGUgIm1vZGVzZXQiCmRkeCB3aXRoIGdsYW1vci4KCklmIGFsbCBlbHNlIGZhaWxzLCBqdXN0IHJl
bW92ZSBub3V2ZWF1X2RyaS5zbyBhbmQvb3IgYm9vdCB3aXRoCm5vdXZlYXUubm9hY2NlbD0xIC0t
IHNob3VsZCBiZSBwZXJmZWN0LgoKQ2hlZXJzLAoKICAtaWxpYQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
