Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E456967A7F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3916E3DF;
	Sat, 13 Jul 2019 14:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16BF6E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 14:22:44 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z3so20756315iog.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 07:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nGPJaLLrwimgpDuREnLtjr8F7xnTIflmgbQ9hHlyOpQ=;
 b=MbvFObuiM6qXuOY2RjqD0uI/U7Ke2ihnLstzsGWnSORnoaHF17dpSXnh6fHC3K2ztF
 oRG9rx6nK1pSz6idQNzkQOmSh5ccbi6fU+AE0CilFghaWEuRfoQwLxZGIZe02H0y7bVA
 dbH0ndnVXqeNpmNgZ34eGaCykQpaUXlmLp8KK7BZOPuWuVWUPmO3w+wLKMGvQptq7yeO
 baPt/nsOVJfUlo0GLRMgVs0T3QYUHqik0y39EMFDehwSjyfU8uoirpHLjTqV/stKJoTl
 VZPz74H7JpwdlFhx7DZRC9RpkXF4RtMhMNw0PQznv9hIIcgu0VgTft05fKkze5IBnkIc
 ZPGQ==
X-Gm-Message-State: APjAAAUetzULFaUuvvnwR0VFBh7zXKV5wQsAv2F0pICD97qzEs3OtlOj
 hJdSVM3DVRS/YEFDOQMQrfqX3ldSNPW+O6SiPxA=
X-Google-Smtp-Source: APXvYqyd1oIXsBnzN7dG75lZKkuN70UrVbbdWWU17WfiRt880v2QjEESBBiu9clKHIbyAFlTaHjA8LuvFTEITgzhLUI=
X-Received: by 2002:a6b:3b89:: with SMTP id i131mr10329306ioa.33.1562941364182; 
 Fri, 12 Jul 2019 07:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
 <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
 <20190706010604.GG20625@sirena.org.uk>
 <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
 <CAF6AEGtGjKRA3A8v6pgaXLgpeiLZuz6HuDSFRjKrNp4iQNVZtA@mail.gmail.com>
 <10b1313f-7a60-df04-a9e3-76649b74f2f0@samsung.com>
In-Reply-To: <10b1313f-7a60-df04-a9e3-76649b74f2f0@samsung.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Fri, 12 Jul 2019 08:22:33 -0600
Message-ID: <CAOCk7NoyCmPQF3s4GWD1Oa4t5hdqi6vdcOdHyJpo3Gc1JQqXcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To: Andrzej Hajda <a.hajda@samsung.com>
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nGPJaLLrwimgpDuREnLtjr8F7xnTIflmgbQ9hHlyOpQ=;
 b=h9jOcluIb6ww2CKPkNW/sCP5MUssFNFfo0eU3XK9p5+YpV+7emWd40fuQ0aguUlM9O
 SfMrf+m/5YOcM1qa0dWndBpgkz4Qf9EGlyTiqz+6Y7JfRFAgXKOiqXiCzMj/UING1hQK
 scP1RFCeJ3R4/WI+CNFRDFjyahtAk+rWVWR0IuQj7nPfOfOJ66wZq62M+xb3Dc8zqLHh
 7OKh5uoWtjoEXRLbSMp+jHa1EJkzjK5EAf3zVnOt4gap7JtE0RNtC7abt3UjoaIXQZKZ
 9vyQ3Ys5NMV/5OAzKCJeNjBwZ+sbQ1MsrhJazHGjIncJuDsrADav8uSg9bJTbg3Z6slp
 LwRw==
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
Cc: David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgNzowMSBBTSBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPiB3cm90ZToKPgo+IE9uIDExLjA3LjIwMTkgMTU6NTYsIFJvYiBDbGFyayB3cm90
ZToKPiA+IE9uIFRodSwgSnVsIDExLCAyMDE5IGF0IDY6MTEgQU0gQW5kcnplaiBIYWpkYSA8YS5o
YWpkYUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPj4gT24gMDYuMDcuMjAxOSAwMzowNiwgTWFyayBC
cm93biB3cm90ZToKPiA+Pj4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDI6NDU6MTJQTSAtMDcw
MCwgSmVmZnJleSBIdWdvIHdyb3RlOgo+ID4+Pj4gQWRkIGJhc2ljIHN1cHBvcnQgd2l0aCBhIHNp
bXBsZSBpbXBsZW1lbnRhdGlvbiB0aGF0IHV0aWxpemVzIHRoZSBnZW5lcmljCj4gPj4+PiByZWFk
L3dyaXRlIGNvbW1hbmRzIHRvIGFsbG93IGRldmljZSByZWdpc3RlcnMgdG8gYmUgY29uZmlndXJl
ZC4KPiA+Pj4gVGhpcyBsb29rcyBnb29kIHRvIG1lIGJ1dCBJIHJlYWxseSBkb24ndCBrbm93IGFu
eXRoaW5nIGFib3V0IERTSSwKPiA+Pj4gSSdkIGFwcHJlY2lhdGUgc29tZSByZXZpZXcgZnJvbSBv
dGhlciBwZW9wbGUgd2hvIGRvLiAgSSB0YWtlIGl0Cj4gPj4+IHRoZXJlJ3Mgc29tZSBzcGVjIHRo
aW5nIGluIERTSSB0aGF0IHNheXMgcmVnaXN0ZXJzIGFuZCBieXRlcyBtdXN0Cj4gPj4+IGJvdGgg
YmUgOCBiaXQ/Cj4gPj4KPiA+PiBJIGFtIGxpdHRsZSBiaXQgY29uZnVzZWQgYWJvdXQgcmVnbWFw
IHVzYWdlIGhlcmUuIE9uIHRoZSBvbmUgaGFuZCBpdAo+ID4+IG5pY2VseSBmaXRzIHRvIHRoaXMg
c3BlY2lmaWMgZHJpdmVyLCBwcm9iYWJseSBiZWNhdXNlIGl0IGFscmVhZHkgdXNlcwo+ID4+IHJl
Z21hcF9pMmMuCj4gPj4KPiA+PiBPbiB0aGUgb3RoZXIgaXQgd2lsbCBiZSB1bnVzYWJsZSBmb3Ig
YWxtb3N0IGFsbCBjdXJyZW50IERTSSBkcml2ZXJzIGFuZAo+ID4+IHByb2JhYmx5IGZvciBtb3N0
IG5ldyBkcml2ZXJzLiBXaHk/Cj4gPj4KPiA+PiAxLiBEU0kgcHJvdG9jb2wgZGVmaW5lcyBhY3R1
YWxseSBtb3JlIHRoYW4gMzAgdHlwZXMgb2YgdHJhbnNhY3Rpb25zWzFdLAo+ID4+IGJ1dCB0aGlz
IHBhdGNoc2V0IGltcGxlbWVudHMgb25seSBmZXcgb2YgdGhlbSAoZHNpIGdlbmVyaWMgd3JpdGUv
cmVhZAo+ID4+IGZhbWlseSkuIElzIGl0IHBvc3NpYmxlIHRvIGltcGxlbWVudCBtdWx0aXBsZSB0
eXBlcyBvZiB0cmFuc2FjdGlvbnMgaW4KPiA+PiByZWdtYXA/Cj4gPj4KPiA+PiAyLiBUaGVyZSBp
cyBhbHJlYWR5IHNvbWUgc2V0IG9mIGhlbHBlcnMgd2hpY2ggdXNlcyBkc2kgYnVzLCByZXdyaXRp
bmcgaXQKPiA+PiBvbiByZWdtYXAgaXMgcG9zc2libGUgb3IgZHJpdmVyIGNvdWxkIHVzZSBvZiBy
ZWdtYXAgYW5kIGRpcmVjdCBhY2Nlc3MKPiA+PiB0b2dldGhlciwgdGhlIHF1ZXN0aW9uIGlzIGlm
IGl0IGlzIHJlYWxseSBuZWNlc3NhcnkuCj4gPj4KPiA+PiAzLiBEU0kgZGV2aWNlcyBhcmUgbm8g
TUZEcyBzbyByZWdtYXAgYWJzdHJhY3Rpb24gaGFzIG5vIGJpZyB2YWx1ZSBhZGRlZAo+ID4+IChj
b3JyZWN0IG1lLCBpZiB0aGVyZSBhcmUgb3RoZXIgc2lnbmlmaWNhbnQgYmVuZWZpdHMpLgo+ID4+
Cj4gPiBJIGFzc3VtZSBpdCBpcyBub3QgKmp1c3QqIHRoaXMgb25lIGJyaWRnZSB0aGF0IGNhbiBi
ZSBwcm9ncmFtbWVkIG92ZXIKPiA+IGVpdGhlciBpMmMgb3IgZHNpLCBkZXBlbmRpbmcgb24gaG93
IHRoaW5ncyBhcmUgd2lyZWQgdXAgb24gdGhlIGJvYXJkLgo+ID4gSXQgY2VydGFpbmx5IHdvdWxk
IGJlIG5pY2UgZm9yIHJlZ21hcCB0byBzdXBwb3J0IHRoaXMgY2FzZSwgc28gd2UKPiA+IGRvbid0
IGhhdmUgdG8gd3JpdGUgdHdvIGRpZmZlcmVudCBicmlkZ2UgZHJpdmVycyBmb3IgdGhlIHNhbWUg
YnJpZGdlLgo+ID4gSSB3b3VsZG4ndCBleHBlY3QgYSBwYW5lbCB0aGF0IGlzIG9ubHkgcHJvZ3Jh
bW1lZCB2aWEgZHNpIHRvIHVzZSB0aGlzLgo+Cj4KPiBPbiB0aGUgb3RoZXIgc2lkZSBzdXBwb3J0
aW5nIERTSSBhbmQgSTJDIGluIG9uZSBkcml2ZXIgaXMgc2ltcGx5IG1hdHRlcgo+IG9mIHdyaXRp
bmcgcHJvcGVyIGFjY2Vzb3JzLgoKVG8gbWUsIHRoaXMgcmVhZHMgbGlrZSB5b3VyIGNvdW50ZXIg
YXJndW1lbnQgdG8gbm90IHVzaW5nIHJlZ21hcCwgaXMKdG8gcmVpbnZlbnQgcmVnbWFwLiAgTWF5
YmUgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgeW91IGFyZSBwcm9wb3NpbmcKaGVyZSwgYnV0IGl0
IHNvdW5kcyBsaWtlIHJlbW92ZSB0aGUgcmVnbWFwIHN1cHBvcnQsIGRlZmluZSBzbjY1CnNwZWNp
ZmljIGFjY2Vzc29ycyB0aGF0IGp1c3QgYmVmb3JlIHNlbmRpbmcgdGhlIHdyaXRlIHRvIHRoZSBi
dXMgZG9lcwphIGNoZWNrIGlmIHRoZSBhY2Nlc3MgbmVlZHMgdG8gZ28gb3ZlciBpMmMgb3IgRFNJ
LiAgRmVlbHMgbGlrZSBhCmNsdW5reSB2ZXJzaW9uIG9mIHJlZ21hcCB0byBtZS4gIFdoeSBub3Qg
dXNlIHRoZSBleGlzdGluZyAiZ2VuZXJpYyIKZnJhbWV3b3JrPwoKVG8geW91ciBwb2ludCB0aGF0
IERTSSBkZWZpbmVzIG92ZXIgMzAgbWVzc2FnZSB0eXBlcywgeWVzIGl0IGRvZXMsIGJ1dAp0aGF0
IHNlZW1zIHRvIGJlIG91dHNpZGUgb2YgdGhlIHNjb3BlLiAgSG93IG1hbnkgb2YgdGhvc2UgYXJl
IGFjdHVhbGx5CmZvciBkb2luZyByZWdpc3RlciBhY2Nlc3M/ICBJJ20gdGhpbmtpbmcganVzdCA0
ICh0ZWNobmljYWxseSBhIGhhaXIKbW9yZSB0aGFuIHRoYXQgYmVjYXVzZSBvZiB0aGUgbXVsdGlw
bGUgdmVyc2lvbiBvZiB0aGUgc2FtZSBtZXNzYWdlKSAtCmdlbmVyaWMgcmVhZCwgZ2VuZXJpYyB3
cml0ZSwgZGNzIHJlYWQsIGRjcyB3cml0ZS4gIEkgZG9uJ3QgdmlldyByZWdtYXAKYXMgYSBnZW5l
cmljIGFic3RyYWN0aW9uIGxheWVyIG92ZXIgYSBwYXJ0aWN1bGFyIG1lY2hhbmlzbSwgYW5kIHRo
dXMKbmVlZHMgdG8gc3VwcG9ydCBldmVyeXRoaW5nIHRoYXQgbWVjaGFuaXNtIGRvZXMuICBTZW5k
aW5nIHN5bmMKY29tbWFuZHMsIG9yIHBpeGVsIGRhdGEgb3ZlciBEU0kgaXMgb3V0c2lkZSB0aGUg
c2NvcGUgb2YgcmVnbWFwIHRvIG1lLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
