Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D241816C5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CF96E3DD;
	Mon,  5 Aug 2019 10:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F376E3DD
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:17:17 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id s4so32051576uad.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 03:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6QySA2Dhc68DsD9tVqPTGLLUGe3BVnB6ZdxVrJeH+c=;
 b=kxBIEMrH8IQBOlELx7ugo5qQEQ5stx2ZQxZUm9FWnxLDtQbPjCmH48+gIy59btOmUk
 WmiCsjlPdgGEnl7bGz7Chmewrv0ENTn3mIsRisRFe6k86b1nC9TtzZkugp/MNLTMilA8
 ug5G/ouZiq5M/KeVPMTOjcobaSsDAZybrpTf2sMpPDq0nnXJKo/rjusX2TXKM9iqpFlc
 z7E+jwvpOE1nmWmbCqTwaLTxipldSCPtZ5XUj8KPjRpl5CnHxY9W8igC3w4HTpFJ+YMO
 6pRQHdXzI8mF4Jdht4hlLcrB6utQ49MAWKFY0QFaFxtkiuW9nrW8CcyXXyToZGoHVSsu
 gtiA==
X-Gm-Message-State: APjAAAXyHGfIYrgLnOKkZ2aSLmCkKlSvBjMHL58LDJVuiBLk3t/pwjQ6
 9OjG11Pr9yQ0bP8TIrZ4lIUP4yG3FPrKbYXRi+8=
X-Google-Smtp-Source: APXvYqzu7enPRosWmQyskFL9YwMUHcoxzh28ymdqBYutLhqxXWSR+8WyHSfamuEW6O4qrpB6Wqxfmi1iFRiUgfi5QSI=
X-Received: by 2002:a9f:3770:: with SMTP id a45mr38327636uae.64.1565000236799; 
 Mon, 05 Aug 2019 03:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <CA+quO7LqwH4UTZ=Azqo96rkZX4mCvMaJ19TgBQ06=Vdw-Fudqg@mail.gmail.com>
 <20190803143706.GA23157@ravnborg.org>
In-Reply-To: <20190803143706.GA23157@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 5 Aug 2019 11:16:29 +0100
Message-ID: <CACvgo50fVLODj0k8twd7tfVnOFv1s_veKxD+=ZGbD9cmNuLFSQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] [v10] drm/panel: Add Boe Himax8279d MIPI-DSI LCD
 panel
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Z6QySA2Dhc68DsD9tVqPTGLLUGe3BVnB6ZdxVrJeH+c=;
 b=txk3H7e80ao0xMOQKldziNP2p4w65kRlYjv4ps+gUcvL4akKKMWCyPhrx4+5wDUnGl
 hKGQJh/UJOR0j0jgMO7qWnWaQggcQu0eAqnvPiuFUy6dZuxortr9aE68ksEYiuUjjzpO
 p+oKLjqXZLRyLFDDJbF1ZWp1gV3vlNURwFhX4NGSi6yIWbGyXJj6Lm4I/FUKAyXdDkef
 7nLCzBtLt7JsKI+Am5NnB3lfwfKULPYL0bhsyO/FBqrWiE4qTA/uDmMbLQwH00T99brh
 F/NcDdRRdgVi8JZxGUTuRZyoXEEq6wZBlFPwCFMqXOrQEFDlV9KC9s5yzrrZzBhnMIa9
 xjAw==
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
Cc: Jerry Han <jerry.han.hq@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Derek Basehore <dbasehore@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Rock wang <rock_wang@himax.com.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAzIEF1ZyAyMDE5IGF0IDE1OjM3LCBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+IHdyb3RlOgo+Cj4gSGkgSmVycnkuCj4KPiBPbiBTYXQsIEF1ZyAwMywgMjAxOSBhdCAxMDo0
MDo0NEFNICswODAwLCBKZXJyeSBIYW4gd3JvdGU6Cj4gPiBWMTogaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI4NzQyNS8KPiA+IFYyOiBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvcGF0Y2gvMjg5ODQzLwo+ID4gVjM6IGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9wYXRjaC8yOTAzOTMvCj4gPiBWNDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoLzI5MDM5Ni8KPiA+IFY1OiBodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvcGF0Y2gvMjkxMTMxLyAgIChvbmx5IG1vZGlmeQo+ID4gY29tbWl0IG1lc3Nh
Z2UgQWRkZWQgY2hhbmdlbG9nLCBubyBmaWxlcyBtb2RpZmllZCkKPiA+IFY2OiBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMjkxNjUwLwo+ID4gVjc6IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yOTQxNDEvCj4gPiBWODogaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMwMTkyNS8KPiA+IFY5OiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzIwNTE0Lwo+Cj4gPiBGcm9tIDYzYmNjNGYxZTcy
NzEzZWNhMTRjNGIwOGU2MmJjM2MwN2U2NzkwNGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4g
PiBGcm9tOiBKZXJyeSBIYW4gPGhhbnh1NUBodWFxaW4uY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+
Cj4gPiBEYXRlOiBUaHUsIDEgQXVnIDIwMTkgMTU6NTI6MzUgKzA4MDAKPiA+IFN1YmplY3Q6IFtQ
QVRDSCAwMi8xMF0gW3YyLDIvMl0gZHJtL3BhbmVsOiBBZGQgQm9lIEhpbWF4ODI3OWQgTUlQSS1E
U0kgTENECj4gPiAgcGFuZWwKPiA+Cj4gPiBTdXBwb3J0IEJvZSBIaW1heDgyNzlkIDguMCIgMTIw
MHgxOTIwIFRGVCBMQ0QgcGFuZWwsIGl0IGlzIGEgTUlQSSBEU0kKPiA+IHBhbmVsLgo+ID4KPiA+
IFYyOgo+ID4gLSBVc2UgU1BEWCBpZGVudGlmaWVyIChTYW0pCj4gPiAtIFVzZSBuZWNlc3Nhcnkg
aGVhZGVyIGZpbGVzIHJlcGxhY2UgZHJtUC5oIChTYW0pCj4gPiAtIERlbGV0ZSB1bm5lY2Vzc2Fy
eSBoZWFkZXIgZmlsZXMgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPiAoU2FtKQo+ID4gLSBTcGVjaWZp
ZXMgYSBHUElPcyBhcnJheSB0byBjb250cm9sIHRoZSByZXNldCB0aW1pbmcsCj4gPiAgICAgaW5z
dGVhZCBvZiByZWFkaW5nICJkc2ktcmVzZXQtc2VxdWVuY2UiIGRhdGEgZnJvbSBEVFMgKFNhbSkK
PiA+IC0gRGVsZXRlIGJhY2tsaWdodF9kaXNhYmxlKCkgZnVuY3Rpb24gd2hlbiBhbHJlYWR5IGRp
c2FibGVkIChTYW0pCj4gPiAtIFVzZSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KCkgcmVwbGFjZSBv
Zl9maW5kX2JhY2tsaWdodF9ieV9ub2RlKCkKPiA+ICAgICAoU2FtKQo+ID4gLSBNb3ZlIHRoZSBu
ZWNlc3NhcnkgZGF0YSBpbiB0aGUgRFRTIHRvIHRoZSBjdXJyZW50IGZpbGUsCj4gPiAgICAgbGlr
ZSBwb3JjaCwgZGlzcGxheV9tb2RlIGFuZCBJbml0IGNvZGUgZXRjLiAoU2FtKQo+ID4gLSBBZGQg
Y29tcGF0aWJsZSBkZXZpY2UgImJvZSxoaW1heDgyNzlkMTBwIiAoU2FtKQo+ID4KPiA+IFYxOgo+
ID4gLSBTdXBwb3J0IEJvZSBIaW1heDgyNzlkIDguMCIgMTIwMHgxOTIwIFRGVCBMQ0QgcGFuZWws
IGl0IGlzIGEgTUlQSSBEU0kKPiA+ICAgICBwYW5lbC4KPgo+IFNvbWV0aGluZyB3ZW50IHdyb25n
IHdoZW4geW91IHRyaWVkIHRvIHN1Ym1pdCB2MTAuCj4gUGxlYXNlIHRyeSBhZ2Fpbi4KPgpBcGFy
dCBmcm9tIHRoYXQsIHNlZW1zIGxpa2UgdGhlIGluaXQgc2VxdWVuY2UgaGFzIGNoYW5nZWQgZHJh
c3RpY2FsbHkuCgpXaGF0IGlzIHRoZSByZWFzb24gYmVoaW5kIHRoaXM/IFdhcyB0aGVyZSBhIGJ1
ZyB3aXRoIHByZXZpb3VzIHBhdGNoZXM/CgpGb3IgcmVmZXJlbmNlIGluIHY4IHRoZSBzZXF1ZW5j
ZSB3YXMgbmVhcmx5IGlkZW50aWNhbCBmb3IgOCBhbmQgMTAKaW5jaCBkZXZpY2VzIC0gOC0xMCBs
aW5lIGRpZmZlcmVuY2UuCk5vdyB3ZSdyZSBsb29raW5nIGF0IH4yNTAgLi4uCgotRW1pbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
