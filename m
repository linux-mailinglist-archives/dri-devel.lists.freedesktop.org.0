Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1547625E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727E66ECE3;
	Fri, 26 Jul 2019 09:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3189C6E670
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 07:35:47 +0000 (UTC)
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hqYHx-0000TM-DZ
 for dri-devel@lists.freedesktop.org; Thu, 25 Jul 2019 07:35:45 +0000
Received: by mail-pl1-f197.google.com with SMTP id g18so25768400plj.19
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 00:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zxqZCSLvTLmYjhP/wrEqWsYCig2CFQrzjBfeDE72P8w=;
 b=lZdvequbbvwfjGilcTf+mYg+tY0sLKMuc3WcElyUbCh8plchnBz1t6sUblHt+gKxbS
 tB4VGxdqtfz3IXd9Z8R4dSgio/MmSRpeRyTU+Jq04MmtfSnZCdKB0cdQp9HflYv/fx3/
 jIWFWfjccLhtod9E43wJnDYeZ80smIQByQt9jPda90wIVmKFNG2+L/8m6exTGSBl3jL3
 vUz0EuZoVT/+ZOJ5PsbfzzbEX2gfn+Es+k06Dg+V9fto1gc/CJv9h56gf4xuedOswJIC
 6vVfNuaACR1GXMx2PQ4YOuwYCYfJ0bTkgiPkUARq0HWWk/EOgjra9q1d7ZAeM66Lhgm1
 1R3g==
X-Gm-Message-State: APjAAAXr9+FAeH+PFKCwD/aq04o1reLJw3wVd4tVExZNutpWh0LS+V68
 FQCRSZlAkwAosJMZbPkmymRg4tlBZvGiSoUduH3POtF+zG27pq6Ho84irHwTed8KIg2WVDqV4m9
 v4U53e6PimksjW3zuXw155MNGl4tteJtcD0EmtZFNzaQ40g==
X-Received: by 2002:aa7:914e:: with SMTP id 14mr15217206pfi.136.1564040144140; 
 Thu, 25 Jul 2019 00:35:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXCUMPVCA3dQiViVDK0O8KJrZbf3Kz8uAl1Ft0HB89Z250NqsirbTw1qO4FZbtLqi9lsejMw==
X-Received: by 2002:aa7:914e:: with SMTP id 14mr15217176pfi.136.1564040143710; 
 Thu, 25 Jul 2019 00:35:43 -0700 (PDT)
Received: from 2001-b011-380f-3c20-0160-ac1c-9209-b8ff.dynamic-ip6.hinet.net
 (2001-b011-380f-3c20-0160-ac1c-9209-b8ff.dynamic-ip6.hinet.net.
 [2001:b011:380f:3c20:160:ac1c:9209:b8ff])
 by smtp.gmail.com with ESMTPSA id a128sm53565663pfb.185.2019.07.25.00.35.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 00:35:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: OLED panel brightness support
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <30f693a33f5a45ce84673fd8d7cecc7a@AUSX13MPC105.AMER.DELL.COM>
Date: Thu, 25 Jul 2019 15:35:40 +0800
Message-Id: <42946AB1-3732-467D-ABC9-C7ED3C9C4D06@canonical.com>
References: <28D3097A-5295-4445-BD73-1A338EFA546D@canonical.com>
 <20190724114851.GY15868@phenom.ffwll.local>
 <30f693a33f5a45ce84673fd8d7cecc7a@AUSX13MPC105.AMER.DELL.COM>
To: Mario.Limonciello@dell.com
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: dri-devel@lists.freedesktop.org, anthony.wong@canonical.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YXQgMDA6MDMsIDxNYXJpby5MaW1vbmNpZWxsb0BkZWxsLmNvbT4gPE1hcmlvLkxpbW9uY2llbGxv
QGRlbGwuY29tPiB3cm90ZToKCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IE9uIEJlaGFsZiBPZiBEYW5p
ZWwgVmV0dGVyCj4+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAyNCwgMjAxOSA2OjQ5IEFNCj4+IFRv
OiBLYWktSGVuZyBGZW5nCj4+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBB
bnRob255IFdvbmc7IExpbW9uY2llbGxvLCBNYXJpbwo+PiBTdWJqZWN0OiBSZTogT0xFRCBwYW5l
bCBicmlnaHRuZXNzIHN1cHBvcnQKPj4KPj4KPj4gW0VYVEVSTkFMIEVNQUlMXQo+Pgo+PiBPbiBU
dWUsIEp1bCAyMywgMjAxOSBhdCAwNjo0Njo1NVBNICswODAwLCBLYWktSGVuZyBGZW5nIHdyb3Rl
Ogo+Pj4gSGksCj4+Pgo+Pj4gQ3VycmVudGx5LCBPTEVEIHBhbmVsIGJyaWdodG5lc3MgWzFdIGlz
IG5vdCBzdXBwb3J0ZWQuCj4+PiBXZSBoYXZlIGEgc2ltaWxhciBEZWxsIHN5c3RlbSB0aGF0IGFs
c28gYWZmZWN0IGJ5IGxhY2sgb2YgT0xFRCBicmlnaHRuZXNzCj4+PiBzdXBwb3J0Lgo+Pj4KPj4+
IEnigJl2ZSBpbnZlc3RpZ2F0ZWQgYm90aCBrZXJuZWwgYW5kIHVzZXIgc3BhY2UgYnV0IEkgaGF2
ZW7igJl0IGZvdW5kIGEgZ29vZAo+Pj4gZ2VuZXJhbCBzb2x1dGlvbiB5ZXQuCj4+PiBEZWxsIHN5
c3RlbXMgdXNlIEVESUQgZGVzY3JpcHRvciA0IGFzIERlbGwgc3BlY2lmaWMgZGVzY3JpcHRvciwg
d2hpY2gKPj4+IHJlcG9ydHMgaXRzIHBhbmVsIHR5cGUgYW5kIHdlIGNhbiBrbm93IGl04oCZcyBh
biBPTEVEIHBhbmVsIG9yIG5vdC4KPj4+Cj4+PiBNeSBpbml0aWFsIHRob3VnaHQgaXMgdG8gYWRk
IGEgbmV3IGF0dHJpYnV0ZSDigJxvbGVkIiBpbiBkcm1fc3lzZnMuYyBbMl0gdG8KPj4+IGxldCB1
c2Vyc3BhY2UgbGlrZSBjbHV0dGVyIFszXSB0byBjb250cm9sIHRoZSBicmlnaHRuZXNzLgo+Pj4g
SG93ZXZlciBvdGhlciBERXMgbWF5IG5lZWQgdG8gaW1wbGVtZW50IHRoZWlyIG93biBPTEVEIGJy
aWdodG5lc3Mgc3VwcG9ydAo+Pj4gd2hpY2ggaXNu4oCZdCBpZGVhbC4KPj4+Cj4+PiBTbyBJ4oCZ
ZCBsaWtlIHRvIGtub3cgaWYgdGhlcmXigJlzIGFueSBnb29kIHdheSB0byBzdXBwb3J0IE9MRUQg
YnJpZ2h0bmVzcyBpbgo+Pj4gZ29vZCBvbGQgYmFja2xpZ2h0IHN5c2ZzLCB0byBsZXQgdXNlcnNw
YWNlIGtlZXAgdG8gdGhlIGN1cnJlbnQgaW50ZXJmYWNlLgo+Pj4KPj4+IFsxXSBodHRwczovL2J1
Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD05Nzg4Mwo+Pj4gWzJdIGh0dHBzOi8v
cGFzdGViaW4udWJ1bnR1LmNvbS9wL1FZclJCcHBWVDkvCj4+PiBbM10gaHR0cHM6Ly9naXRsYWIu
Z25vbWUub3JnL0dOT01FL2NsdXR0ZXIvYmxvYi9tYXN0ZXIvY2x1dHRlci9jbHV0dGVyLQo+PiBi
cmlnaHRuZXNzLWNvbnRyYXN0LWVmZmVjdC5jI0w1NTkKPj4KPj4gSSB0aGluayB0aGUgTW9zdCBQ
cm9wZXIgU29sdXRpb24gd291bGQgYmUgdG8gaW50ZWdyYXRlIHRoZSBiYWNrbGlnaHQKPj4gc3Vw
cG9ydCBpbnRvIGRybSwgYnkgYWRkaW5nIHRoZSBiYWNrbGlnaHQga25vYnMgYXMga21zIHByb3Bl
cnRpZXMgdG8gdGhlCj4+IGNvcnJlY3QgY29ubmVjdG9yLiBUaGlzIHdvdWxkIGZpeCBhIHdob2xl
IGJhZyBvZiBpc3N1ZToKPj4gLSBubyBtb3JlIGlsbC1kZWZpbmVkIG1hZ2ljIGZvciB1c2Vyc3Bh
Y2UgdG8gZmluZCB0aGUgcmlnaHQgYmFja2xpZ2h0Cj4+IC0gd2UgY291bGQgaGF2ZSB3ZWxsLWRl
ZmluZWQgc2VtYW50aWNzIHdoYXQgaGFwcGVucyB3aXRoIHRoZSBiYWNrbGlnaHQKPj4gICBhY3Jv
c3MgYSBrbXMgbW9kZXNldAo+PiAtIGlzc3VlcyBsaWtlIHRoaXMgY291bGQgYmUgc29sdmVkIHdp
dGggYSBzbWFsbCBoZWxwZXIgYW5kIGEgYml0IG9mIGNvZGUKPj4gICBpbiB0aGUga2VybmVsICh0
aGVyZSdzIGFsc28gb3RoZXIgRERDIGtub2JzIHRvIGNvbnRyb2wgYmFja2xpZ2h0LCB3aGljaAo+
PiAgIHdlIGFsc28gZG9uJ3QgcmVhbGx5IGV4cG9zZSBpbiBhIGNvbnNpc3RlbnQgd2F5KS4KPj4K
Pj4gRG93bnNpZGUgaXMgaG93IHRvIHJvbGwgdGhpcyBvdXQgaW4gYSBiYWNrd2FyZCBjb21wYXRp
YmxlIHdheSwgd2l0aG91dAo+PiBicmVha2luZyB0aGUgd29ybGQ6Cj4+IC0gZmJjb24vZmJkZXYg
bmVlZHMgdG8gYmUgdGF1Z2h0IHRvIG5vdCBkbyBpdCdzIG93biBiYWNrbGlnaHQgd3JhbmdsaW5n
Cj4+ICAgZm9yIGttcyBkcml2ZXJzIHdoaWNoIGhhbmRsZSBiYWNrbGlnaHQgbmF0aXZlbHkKPj4g
LSB3ZSBtaWdodCBuZWVkIGFuIG9wdC1pbiBtYWdpYyBmb3IgdGhpcywgaWYgaXQgdHVybnMgb3V0
IHRoYXQgdGhlIGttcwo+PiAgIGRyaXZlciBoYW5kbGluZyB0aGUgYmFja2xpZ2h0IGJyZWFrcyBz
dHVmZgo+PiAtIHVzZXJzcGFjZSBvZmMgbmVlZHMgdG8gZmFsbCBiYWNrIHRvIGl0cyBjdXJyZW50
IHBpbGUgb2YgaGFja3MgaWYgdGhlCj4+ICAgYmFja2xpZ2h0IHN0dWZmIGlzbid0IHN1cHBvcnRl
ZCBuYXRpdmVseS4KPj4KPj4gQWRkaW5nIG1vcmUgaWxsLWRlZmluZWQgc3lzZnMgZmlsZXMsIG9y
IG1vcmUgbWFnaWNlIG9yZGVyaW5nIHJ1bGVzLCBvcgo+PiBhbnl0aGluZyBlbHNlIGxpa2UgdGhh
dCBkb2Vzbid0IHNvdW5kIHRvbyBhcHBlYWxpbmcuCj4KPiBXaGVyZSBhcmUgeW91IHRoaW5raW5n
IHRoYXQgdGhlIG9wdCBpbiBtYWdpYyB3b3VsZCBvY2N1ciB0aGVuPyAgVXNlcnNwYWNlPwo+Cj4g
QXMgS0ggc2FpZCwgYXQgbGVhc3Qgb24gRGVsbCBpdCdzIGEga25vd24gbG9jYXRpb24gaW4gRURJ
RCB0byBpbmRpY2F0ZSAgCj4gcGFuZWwKPiBpcyBPTEVELCBzbyBpdCBzZWVtcyBsaWtlIHRoaXMg
Y291bGQgYmUgYSBrZXJuZWwgdGltZSBkb2N1bWVudGVkIG1hZ2ljIGF0ICAKPiBsZWFzdAo+IHRv
IHR1cm4gdGhpcyBvbiBpbiB0aGUgaW1wb3J0YW50IHNjZW5hcmlvcy4KCkkgdGhpbmsgd2hhdCBE
YW5pZWwgc2F5cyBpcyB0byBrZWVwIGEgdW5pZm9ybSBiYWNrbGlnaHQgaW50ZXJmYWNlLgoKVGhl
IG5leHQgcXVlc3Rpb24gaXMsIGhvdyBkbyB3ZSBjaGFuZ2UgdGhlIGJyaWdodG5lc3MgbGV2ZWwg
Zm9yIE9MRUQgIApkaXNwbGF5cz8gSXMgY2hhbmdpbmcgZ2FtbWEgdmFsdWUgYSBnb29kIHdheSB0
byBkbyBpdD8KCkthaS1IZW5nCgo+Cj4+IC1EYW5pZWwKPj4gLS0KPj4gRGFuaWVsIFZldHRlcgo+
PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPj4gaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
