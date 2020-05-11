Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F7E1CE5F9
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 22:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADA76E588;
	Mon, 11 May 2020 20:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mtlfep01.bell.net (belmont79srvr.owm.bell.net [184.150.200.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7643E6E588;
 Mon, 11 May 2020 20:46:56 +0000 (UTC)
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net with ESMTP
 id <20200511204653.YDJW5779.mtlfep01.bell.net@mtlspm01.bell.net>;
 Mon, 11 May 2020 16:46:53 -0400
Received: from [192.168.1.208] (really [70.49.140.223])
 by mtlspm01.bell.net with ESMTP
 id <20200511204653.IWYA130487.mtlspm01.bell.net@[192.168.1.208]>;
 Mon, 11 May 2020 16:46:53 -0400
Date: Mon, 11 May 2020 16:46:52 -0400
From: Al Dunsmuir <al.dunsmuir@sympatico.ca>
Message-ID: <1199527036.20200511164652@sympatico.ca>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
In-Reply-To: <CADnq5_MYPcAoWzCcBkJAkd858gCVbJpCJobiwH_BBbwgEdx5rA@mail.gmail.com>
References: <20200511171722.96576-1-christian.koenig@amd.com> 
 <1815605280.20200511161440@sympatico.ca>
 <CADnq5_MYPcAoWzCcBkJAkd858gCVbJpCJobiwH_BBbwgEdx5rA@mail.gmail.com>
MIME-Version: 1.0
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=nyNe8J8XL+yB5u22Hc0alw==:117
 a=nyNe8J8XL+yB5u22Hc0alw==:17 a=IkcTkHD0fZMA:10 a=sTwFKg_x9MkA:10
 a=k_m-kdumAAAA:8 a=buMNVmj3JvoWGwOzv-8A:9 a=QEXdDO2ut3YA:10
 a=2aFmp3DG3lfw9CblUY6y:22
X-CM-Envelope: MS4wfLmS5G39LVoiaOfaeXHpVV10uhOfO8SuNhx8RwzJTXEbbfctpxYAzQ9vXOP/8MEbLGvSlud0VcIpQVFlhJbiJghCOJEVdkmel5QUCH+zNvuFt6KZlU7b
 ULAIkKXi1sBt8VH+UKAWYZ87VZ+fUW/XWzbDa7pr0HbzxRiAxZa8orUMXWOCPuQIh0/QGl5aPmCZHlVi7uwAIqQmYh3/SP/O9tTALneRwKFKf2qFH/cVNmzS
 PieqJhwNb3cq+nQtNxzVmIjus83K2ql5HEyGLH6Ztu+3fZdt2bZ2E97G9lIA7Xhz
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
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCBNYXkgMTEsIDIwMjAsIDQ6Mjc6NTUgUE0sIEFsZXggRGV1Y2hlciB3cm90ZToK
PiBPbiBNb24sIE1heSAxMSwgMjAyMCBhdCA0OjIyIFBNIEFsIER1bnNtdWlyIDxhbC5kdW5zbXVp
ckBzeW1wYXRpY28uY2E+IHdyb3RlOgo+Pgo+PiBPbiBNb25kYXksIE1heSAxMSwgMjAyMCwgMTox
NzoxOSBQTSwgIkNocmlzdGlhbiBLw7ZuaWciIHdyb3RlOgo+PiA+IEhpIGd1eXMsCj4+Cj4+ID4g
V2VsbCBsZXQncyBmYWNlIGl0IEFHUCBpcyBhIHRvdGFsIGhlYWRhY2hlIHRvIG1haW50YWluIGFu
ZCBkZWFkIGZvciBhdCBsZWFzdCAxMCsgeWVhcnMuCj4+Cj4+ID4gV2UgaGF2ZSBhIGxvdCBvZiB4
ODYgc3BlY2lmaWMgc3R1ZmYgaW4gdGhlIGFyY2hpdGVjdHVyZSBpbmRlcGVuZGVudAo+PiA+IGdy
YXBoaWNzIG1lbW9yeSBtYW5hZ2VtZW50IHRvIGdldCB0aGUgY2FjaGluZyByaWdodCwgYWJ1c2lu
ZyB0aGUgRE1BCj4+ID4gQVBJIG9uIG11bHRpcGxlIG9jY2FzaW9ucywgbmVlZCB0byBkaXN0aW5j
dCBiZXR3ZWVuIEFHUCBhbmQgZHJpdmVyIHNwZWNpZmljIHBhZ2UgdGFibGVzIGV0YyBldGMuLi4K
Pj4KPj4gPiBTbyB0aGUgaWRlYSBoZXJlIGlzIHRvIGp1c3QgZ28gYWhlYWQgYW5kIHJlbW92ZSB0
aGUgc3VwcG9ydCBmcm9tCj4+ID4gUmFkZW9uIGFuZCBOb3V2ZWF1IGFuZCB0aGVuIGRyb3AgdGhl
IG5lY2Vzc2FyeSBjb2RlIGZyb20gVFRNLgo+Pgo+PiA+IEZvciBSYWRlb24gdGhpcyBtZWFucyB0
aGF0IHdlIGp1c3Qgc3dpdGNoIG92ZXIgdG8gdGhlIGRyaXZlcgo+PiA+IHNwZWNpZmljIHBhZ2Ug
dGFibGVzIGFuZCBldmVyeXRoaW5nIHNob3VsZCBtb3JlIG9yIGxlc3MgY29udGludWUgdG8gd29y
ay4KPj4KPj4gPiBGb3IgTm91dmVhdSBJJ20gbm90IDEwMCUgc3VyZSwgYnV0IGZyb20gdGhlIGNv
ZGUgaXQgb2YgaGFuZCBsb29rcwo+PiA+IGxpa2Ugd2UgY2FuIGRvIGl0IHNpbWlsYXIgdG8gUmFk
ZW9uLgoKPiBOb3RlIHRoZXJlIGlzIG5vIGxvc3Mgb2YgZnVuY3Rpb25hbGl0eSBoZXJlLCBhdCBs
ZWFzdCBvbiByYWRlb24KPiBoYXJkd2FyZS4gIEl0IGp1c3QgY29tZXMgZG93biB0byB3aGljaCBN
TVUgZ2V0cyB1c2VkIGZvciBhY2Nlc3MgdG8KPiBzeXN0ZW0gbWVtb3J5LCB0aGUgQUdQIE1NVSBv
biB0aGUgY2hpcHNldCBvciB0aGUgTU1VIGJ1aWx0IGludG8gdGhlCj4gR1BVLiAgT24gcG93ZXJw
YyBoYXJkd2FyZSwgQUdQIGhhcyBiZWVuIHBhcnRpY3VsYXJseSB1bnN0YWJsZSwgYW5kIEFHUAo+
IGhhcyBiZWVuIGRpc2FibGVkIGJ5IGRlZmF1bHQgb24gcmFkZW9uIG9uIHBvd2VycGMgZm9yIHll
YXJzIG5vdy4gIEluCj4gZmFjdCwgdGhpcyB3aWxsIHByb2JhYmx5IG1ha2Ugb2xkZXIgaGFyZHdh
cmUgbW9yZSByZWxpYWJsZSBhcyBpdCB0YWtlcwo+IEFHUCBvdXQgb2YgdGhlIGVxdWF0aW9uLgoK
QWxleCwKClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uCgpJZiB0aGUgYWN0dWFsIHBlcmZv
cm1hbmNlIGltcGFjdCBpcyBsaXR0bGUgdG8gbm9uZSwgYW5kIHdlIGVuZCB1cCB3aXRoCm1vcmUg
cmVsaWFibGUgb3BlcmF0aW9uIHRoYXQgaXMgY2VydGFpbmx5IGJlbmVmaWNpYWwgdGhlbiB0aGUg
Y2hhbmdlCmlzIGluZGVlZCBmb3IgdGhlIGdvb2QuCgpUaGUgIFBob3Jvbml4ICB0aXRsZSBzY3Jl
YW1pbmcgIkFHUCBHcmFwaGljcyBDYXJkIFN1cHBvcnQgUHJvcG9zZWQgRm9yClJlbW92YWwgIEZy
b20gIExpbnV4ICBSYWRlb24vTlZJRElBIERyaXZlcnMiIHdhcyBuZWl0aGVyIGFjY3VyYXRlLCBu
b3IKaGVscGZ1bC4KCkFsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
