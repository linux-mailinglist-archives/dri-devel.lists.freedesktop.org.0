Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161A3328931
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 18:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2816E882;
	Mon,  1 Mar 2021 17:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851936E87A;
 Mon,  1 Mar 2021 17:54:15 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0AFF65368;
 Mon,  1 Mar 2021 17:54:14 +0000 (UTC)
Date: Mon, 1 Mar 2021 12:54:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [WARNING] v5.12-rc1 in intel_pipe_disable tracepoint
Message-ID: <20210301125413.70c5a424@gandalf.local.home>
In-Reply-To: <YD0ie6qcKBgGgcNW@intel.com>
References: <20210301115946.295279c1@gandalf.local.home>
 <YD0ie6qcKBgGgcNW@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxIE1hciAyMDIxIDE5OjIwOjU5ICswMjAwClZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKCj4gPiAgIGlsa19jcnRjX2Rpc2FibGUr
MHg4NS8weDM5MCBbaTkxNV0gIAo+IAo+IEJ1dCB0aGlzIHBhcnQgaXMgY29uZnVzaW5nIG1lLiBp
bnRlbF9jcnRjX2dldF92YmxhbmtfY291bnRlcigpIGlzCj4gb25seSBzdXBwb3NlZCB0byBkbyBk
cm1fY3J0Y19hY2N1cmF0ZV92YmxhbmtfY291bnQoKSBmYWxsYmFjayB3aGVuCj4gdGhlIGhhcmR3
YXJlIGxhY2tzIGEgd29ya2luZyBmcmFtZSBjb3VudGVyLCBhbmQgdGhhdCBzaG91bGQgb25seQo+
IGJlIHRoZSBjYXNlIGZvciBhbmNpZW50IGdlbjIgb3Igc2VtaS1hbmNpZW50IGk5NjVnbSBUViBv
dXRwdXQsCj4gaWxrX2NydGNfZGlzYWJsZSgpIGlzIG5vdCB0aGUgZnVuY3Rpb24gd2Ugc2hvdWxk
IGJlIGNhbGxpbmcgaW4KPiBlaXRoZXIgb2YgdGhvc2UgY2FzZXMuCj4gCj4gV2hhdCBoYXJkd2Fy
ZSBkbyB5b3UgaGF2ZT8KPiAKCkFjY29yZGluZyB0byAibHNwY2kgLXZ2diIKCjAwOjAyLjAgVkdB
IGNvbXBhdGlibGUgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiBFMy0xMjAwIHYy
LzNyZCBHZW4gQ29yZSBwcm9jZXNzb3IgR3JhcGhpY3MgQ29udHJvbGxlciAocmV2IDA5KSAocHJv
Zy1pZiAwMCBbVkdBIGNvbnRyb2xsZXJdKQogICAgICAgIERldmljZU5hbWU6ICBPbmJvYXJkIFZH
QQogICAgICAgIFN1YnN5c3RlbTogSGV3bGV0dC1QYWNrYXJkIENvbXBhbnkgRGV2aWNlIDMzOWEK
ICAgICAgICBDb250cm9sOiBJL08rIE1lbSsgQnVzTWFzdGVyKyBTcGVjQ3ljbGUtIE1lbVdJTlYt
IFZHQVNub29wLSBQYXJFcnItIFN0ZXBwaW5nLSBTRVJSLSBGYXN0QjJCLSBEaXNJTlR4KwogICAg
ICAgIFN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCKyBQYXJFcnItIERFVlNFTD1mYXN0
ID5UQWJvcnQtIDxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5UeC0KICAgICAgICBM
YXRlbmN5OiAwCiAgICAgICAgSW50ZXJydXB0OiBwaW4gQSByb3V0ZWQgdG8gSVJRIDI4CiAgICAg
ICAgUmVnaW9uIDA6IE1lbW9yeSBhdCBmNzgwMDAwMCAoNjQtYml0LCBub24tcHJlZmV0Y2hhYmxl
KSBbc2l6ZT00TV0KICAgICAgICBSZWdpb24gMjogTWVtb3J5IGF0IGUwMDAwMDAwICg2NC1iaXQs
IHByZWZldGNoYWJsZSkgW3NpemU9MjU2TV0KICAgICAgICBSZWdpb24gNDogSS9PIHBvcnRzIGF0
IGYwMDAgW3NpemU9NjRdCiAgICAgICAgRXhwYW5zaW9uIFJPTSBhdCAwMDBjMDAwMCBbdmlydHVh
bF0gW2Rpc2FibGVkXSBbc2l6ZT0xMjhLXQogICAgICAgIENhcGFiaWxpdGllczogWzkwXSBNU0k6
IEVuYWJsZSsgQ291bnQ9MS8xIE1hc2thYmxlLSA2NGJpdC0KICAgICAgICAgICAgICAgIEFkZHJl
c3M6IGZlZTIwMDA0ICBEYXRhOiAwMDIyCiAgICAgICAgQ2FwYWJpbGl0aWVzOiBbZDBdIFBvd2Vy
IE1hbmFnZW1lbnQgdmVyc2lvbiAyCiAgICAgICAgICAgICAgICBGbGFnczogUE1FQ2xrLSBEU0kr
IEQxLSBEMi0gQXV4Q3VycmVudD0wbUEgUE1FKEQwLSxEMS0sRDItLEQzaG90LSxEM2NvbGQtKQog
ICAgICAgICAgICAgICAgU3RhdHVzOiBEMCBOb1NvZnRSc3QtIFBNRS1FbmFibGUtIERTZWw9MCBE
U2NhbGU9MCBQTUUtCiAgICAgICAgQ2FwYWJpbGl0aWVzOiBbYTRdIFBDSSBBZHZhbmNlZCBGZWF0
dXJlcwogICAgICAgICAgICAgICAgQUZDYXA6IFRQKyBGTFIrCiAgICAgICAgICAgICAgICBBRkN0
cmw6IEZMUi0KICAgICAgICAgICAgICAgIEFGU3RhdHVzOiBUUC0KICAgICAgICBLZXJuZWwgZHJp
dmVyIGluIHVzZTogaTkxNQogICAgICAgIEtlcm5lbCBtb2R1bGVzOiBpOTE1CgpOb3RlLCB0aGlz
IGlzIGEgZGV2IGJveCB0aGF0IGlzIG9ubHkgY29ubmVjdGVkIHRvIGEgS1ZNIGFuZCBJIGhhdmVu
J3QKY29ubmVjdGVkIHRvIGl0IG91dHNpZGUgb2Ygc3NoIGluIHllYXJzLgoKLS0gU3RldmUKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
