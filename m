Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAA8E4BC7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 15:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B1D89DFA;
	Fri, 25 Oct 2019 13:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E0B89DFA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 13:07:16 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z20so2000865otk.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 06:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cjIHQSLxAfrO8r2mYhvtTFdVGXGSg2sOMWkk/+SphrE=;
 b=XPMsw7U2kJr4d18146XJ3lG08MXYoehm91ct3Tu5U1qOAJ887ewXWdOw+sEWtQARH1
 ch/qw6g/89stIdT3sYzgOziL0e/z1in4M5iYdCvMeDalnfPBXYE97Sq/9Wy7e3NCspa8
 RDfgRMoWnM8EtfQAPYDdYLn6nk0R3AJmFC9tidyTkZjEi26nazzRUZEkSNIzaHGjzokf
 Qj2ggKWbcVFsHF0mq+LMrtDvxacXa9b5OmkaGkHkTe1xwLu2L5HLWGahVkpwsOwOo0fw
 qzBSfuCfBaueVj6Fmv5y/GVaVLs++H7FCKD32vQaTpKG5ln5R5TqBd0JUExT1nnXWXJp
 MIzA==
X-Gm-Message-State: APjAAAW6QIgwY3OdvR+8yAviE14jik4opGG0aw5okMQe+Nv7gocOD5zU
 /11byJoKWloJroKvXmLysL4l7nrE/FBKkn/Es/o=
X-Google-Smtp-Source: APXvYqzGKbCyS1szfG8o0X910Fume/955nA8LLrYOuI11vgDmVi+31XMEhVH1S52qFAbuu9uH8/7k1ix9oNIdKm0vB4=
X-Received: by 2002:a9d:6e10:: with SMTP id e16mr2735573otr.297.1572008835268; 
 Fri, 25 Oct 2019 06:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190705164221.4462-1-robh@kernel.org>
 <20190705164221.4462-2-robh@kernel.org>
In-Reply-To: <20190705164221.4462-2-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Oct 2019 15:07:04 +0200
Message-ID: <CAMuHMdW86UOVp5vjdFBzjbqsG_wemjZ77LyVnc+oZ6ZDccv_cA@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] dt-bindings: display: Convert common panel
 bindings to DT schema
To: Rob Herring <robh@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gRnJpLCBKdWwgNSwgMjAxOSBhdCA2OjQ2IFBNIFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IENvbnZlcnQgdGhlIGNvbW1vbiBwYW5lbCBiaW5kaW5ncyB0
byBEVCBzY2hlbWEgY29uc29saWRhdGluZyBzY2F0dGVyZWQKPiBkZWZpbml0aW9ucyB0byBhIHNp
bmdsZSBzY2hlbWEgZmlsZS4KPgo+IFRoZSAnc2ltcGxlLXBhbmVsJyBiaW5kaW5nIGp1c3QgYSBj
b2xsZWN0aW9uIG9mIHByb3BlcnRpZXMgYW5kIG5vdCBhCj4gY29tcGxldGUgYmluZGluZyBpdHNl
bGYuIEFsbCBvZiB0aGUgJ3NpbXBsZS1wYW5lbCcgcHJvcGVydGllcyBhcmUKPiBjb3ZlcmVkIGJ5
IHRoZSBwYW5lbC1jb21tb24udHh0IGJpbmRpbmcgd2l0aCB0aGUgZXhjZXB0aW9uIG9mIHRoZQo+
ICduby1ocGQnIHByb3BlcnR5LCBzbyBhZGQgdGhhdCB0byB0aGUgc2NoZW1hLgo+Cj4gQXMgdGhl
cmUgYXJlIGxvdHMgb2YgcmVmZXJlbmNlcyB0byBzaW1wbGUtcGFuZWwudHh0LCBqdXN0IGtlZXAg
dGhlIGZpbGUKPiB3aXRoIGEgcmVmZXJlbmNlIHRvIGNvbW1vbi55YW1sIGZvciBub3cgdW50aWwg
YWxsIHRoZSBiaW5kaW5ncyBhcmUKPiBjb252ZXJ0ZWQuCj4KPiBDYzogVGhpZXJyeSBSZWRpbmcg
PHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBS
ZXZpZXdlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiBS
ZXZpZXdlZC1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKVGhpcyBpcyBub3cgY29tbWl0
IDgyMWExZjcxNzFhZWVhNWUgKCJkdC1iaW5kaW5nczogZGlzcGxheTogQ29udmVydApjb21tb24g
cGFuZWwgYmluZGluZ3MgdG8gRFQgc2NoZW1hIikuCgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1jb21t
b24ueWFtbAoKPiArICBiYWNrbGlnaHQ6Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy9waGFuZGxlCj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgRm9yIHBh
bmVscyB3aG9zZSBiYWNrbGlnaHQgaXMgY29udHJvbGxlZCBieSBhbiBleHRlcm5hbCBiYWNrbGln
aHQKPiArICAgICAgY29udHJvbGxlciwgdGhpcyBwcm9wZXJ0eSBjb250YWlucyBhIHBoYW5kbGUg
dGhhdCByZWZlcmVuY2VzIHRoZQo+ICsgICAgICBjb250cm9sbGVyLgoKVGhpcyBwYXJhZ3JhcGgg
c2VlbXMgdG8gYXBwbHkgdG8gYWxsIG5vZGVzIG5hbWVkICJiYWNrbGlnaHQiLCBjYXVzaW5nCmUu
Zy4gKGZvciBBUkNIPWFybSBtYWNoX3NobW9iaWxlX2RlZmNvbmZpZykgIm1ha2UgZHRic19jaGVj
awpEVF9TQ0hFTUFfRklMRVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcGFuZWwtY29tbW9uLnlhbWwiCnRvIHN0YXJ0IGNvbXBsYWluaW5nOgoKICAgIGFy
Y2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDAtYXJtYWRpbGxvODAwZXZhLmR0LnlhbWw6IGJhY2tsaWdo
dDoKeydjb21wYXRpYmxlJzogWydwd20tYmFja2xpZ2h0J10sICdwd21zJzogW1s0MCwgMiwgMzMz
MzMsIDFdXSwKJ2JyaWdodG5lc3MtbGV2ZWxzJzogW1swLCAxLCAyLCA0LCA4LCAxNiwgMzIsIDY0
LCAxMjgsIDI1NV1dLAonZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsJzogW1s5XV0sICdwaW5jdHJs
LTAnOiBbWzQxXV0sCidwaW5jdHJsLW5hbWVzJzogWydkZWZhdWx0J10sICdwb3dlci1zdXBwbHkn
OiBbWzQyXV0sICdlbmFibGUtZ3Bpb3MnOgpbWzE1LCA2MSwgMF1dfSBpcyBub3Qgb2YgdHlwZSAn
YXJyYXknCiAgICBhcmNoL2FybS9ib290L2R0cy9yOGE3NzQwLWFybWFkaWxsbzgwMGV2YS5kdC55
YW1sOiBiYWNrbGlnaHQ6CnsnZ3JvdXBzJzogWyd0cHUwX3RvMl8xJ10sICdmdW5jdGlvbic6IFsn
dHB1MCddLCAncGhhbmRsZSc6IFtbNDFdXX0gaXMKbm90IG9mIHR5cGUgJ2FycmF5JwoKRG8geW91
IGtub3cgd2hhdCdzIHdyb25nPwoKVGhhbmtzIQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
