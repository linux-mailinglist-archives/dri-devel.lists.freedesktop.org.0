Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512AD1E6286
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 15:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39886E55C;
	Thu, 28 May 2020 13:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 353 seconds by postgrey-1.36 at gabe;
 Thu, 28 May 2020 13:43:36 UTC
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B6E6E55C;
 Thu, 28 May 2020 13:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id D92C53F3E6;
 Thu, 28 May 2020 15:37:40 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=i8189QXo; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWEVle6VlQ0m; Thu, 28 May 2020 15:37:36 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 4772F3F398;
 Thu, 28 May 2020 15:37:33 +0200 (CEST)
Received: from Gunillas-MacBook-Pro.local (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 5B030360165;
 Thu, 28 May 2020 15:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1590673053; bh=hzBvGtdMVY1yFDhX6vHBpO0alm4n63ua22McT7gZosc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=i8189QXoVaRwcn+moTSIMQD7TJ7H9n0I1yFj2IMYL7PullzNred3UO8BAAnz2DeMq
 j/VrfOha1hYBt/0oje3SsVmDflH1Wva31htryiedFwwGczZJYD1NmbCNmJNQfVSK5z
 6PWj3YdF/MSpTB+pJ0H/4RhVF8RvgNw2PZv4Ful4=
Subject: Re: [RFC 02/17] dma-fence: basic lockdep annotations
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
 <20200512085944.222637-3-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <81b3a3be-b818-9e7c-e93e-ecf161bec94c@shipmail.org>
Date: Thu, 28 May 2020 15:36:56 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200512085944.222637-3-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: linux-rdma@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0xMiAxMDo1OSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBEZXNpZ24gaXMgc2lt
aWxhciB0byB0aGUgbG9ja2RlcCBhbm5vdGF0aW9ucyBmb3Igd29ya2VycywgYnV0IHdpdGgKPiBz
b21lIHR3aXN0czoKPgo+IC0gV2UgdXNlIGEgcmVhZC1sb2NrIGZvciB0aGUgZXhlY3V0aW9uL3dv
cmtlci9jb21wbGV0aW9uIHNpZGUsIHNvIHRoYXQKPiAgICB0aGlzIGV4cGxpY2l0IGFubm90YXRp
b24gY2FuIGJlIG1vcmUgbGliZXJhbGx5IHNwcmlua2xlZCBhcm91bmQuCj4gICAgV2l0aCByZWFk
IGxvY2tzIGxvY2tkZXAgaXNuJ3QgZ29pbmcgdG8gY29tcGxhaW4gaWYgdGhlIHJlYWQtc2lkZQo+
ICAgIGlzbid0IG5lc3RlZCB0aGUgc2FtZSB3YXkgdW5kZXIgYWxsIGNpcmN1bXN0YW5jZXMsIHNv
IEFCQkEgZGVhZGxvY2tzCj4gICAgYXJlIG9rLiBXaGljaCB0aGV5IGFyZSwgc2luY2UgdGhpcyBp
cyBhbiBhbm5vdGF0aW9uIG9ubHkuCj4KPiAtIFdlJ3JlIHVzaW5nIG5vbi1yZWN1cnNpdmUgbG9j
a2RlcCByZWFkIGxvY2sgbW9kZSwgc2luY2UgaW4gcmVjdXJzaXZlCj4gICAgcmVhZCBsb2NrIG1v
ZGUgbG9ja2RlcCBkb2VzIG5vdCBjYXRjaCByZWFkIHNpZGUgaGF6YXJkcy4gQW5kIHdlCj4gICAg
X3ZlcnlfIG11Y2ggd2FudCByZWFkIHNpZGUgaGF6YXJkcyB0byBiZSBjYXVnaHQuIEZvciBmdWxs
IGRldGFpbHMgb2YKPiAgICB0aGlzIGxpbWl0YXRpb24gc2VlCj4KPiAgICBjb21taXQgZTkxNDk4
NTg5NzQ2MDY1ZTNhZTk1ZDlhMDBiMDY4ZTUyNWVlYzM0Zgo+ICAgIEF1dGhvcjogUGV0ZXIgWmlq
bHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+ICAgIERhdGU6ICAgV2VkIEF1ZyAyMyAxMzox
MzoxMSAyMDE3ICswMjAwCj4KPiAgICAgICAgbG9ja2luZy9sb2NrZGVwL3NlbGZ0ZXN0czogQWRk
IG1peGVkIHJlYWQtd3JpdGUgQUJCQSB0ZXN0cwo+Cj4gLSBUbyBhbGxvdyBuZXN0aW5nIG9mIHRo
ZSByZWFkLXNpZGUgZXhwbGljaXQgYW5ub3RhdGlvbnMgd2UgZXhwbGljaXRseQo+ICAgIGtlZXAg
dHJhY2sgb2YgdGhlIG5lc3RpbmcuIGxvY2tfaXNfaGVsZCgpIGFsbG93cyB1cyB0byBkbyB0aGF0
Lgo+Cj4gLSBUaGUgd2FpdC1zaWRlIGFubm90YXRpb24gaXMgYSB3cml0ZSBsb2NrLCBhbmQgZW50
aXJlbHkgZG9uZSB3aXRoaW4KPiAgICBkbWFfZmVuY2Vfd2FpdCgpIGZvciBldmVyeW9uZSBieSBk
ZWZhdWx0Lgo+Cj4gLSBUbyBiZSBhYmxlIHRvIGZyZWVseSBhbm5vdGF0ZSBoZWxwZXIgZnVuY3Rp
b25zIEkgd2FudCB0byBtYWtlIGl0IG9rCj4gICAgdG8gY2FsbCBkbWFfZmVuY2VfYmVnaW4vZW5k
X3NpZ25hbGxpbmcgZnJvbSBzb2Z0L2hhcmRpcnEgY29udGV4dC4KPiAgICBGaXJzdCBhdHRlbXB0
IHdhcyB1c2luZyB0aGUgaGFyZGlycSBsb2NraW5nIGNvbnRleHQgZm9yIHRoZSB3cml0ZQo+ICAg
IHNpZGUgaW4gbG9ja2RlcCwgYnV0IHRoaXMgZm9yY2VzIGFsbCBub3JtYWwgc3BpbmxvY2tzIG5l
c3RlZCB3aXRoaW4KPiAgICBkbWFfZmVuY2VfYmVnaW4vZW5kX3NpZ25hbGxpbmcgdG8gYmUgc3Bp
bmxvY2tzLiBUaGF0IGJvbGxvY2tzLgo+Cj4gICAgVGhlIGFwcHJvYWNoIG5vdyBpcyB0byBzaW1w
bGUgY2hlY2sgaW5fYXRvbWljKCksIGFuZCBmb3IgdGhlc2UgY2FzZXMKPiAgICBlbnRpcmVseSBy
ZWx5IG9uIHRoZSBtaWdodF9zbGVlcCgpIGNoZWNrIGluIGRtYV9mZW5jZV93YWl0KCkuIFRoYXQK
PiAgICB3aWxsIGNhdGNoIGFueSB3cm9uZyBuZXN0aW5nIGFnYWluc3Qgc3BpbmxvY2tzIGZyb20g
c29mdC9oYXJkaXJxCj4gICAgY29udGV4dHMuCj4KPiBUaGUgaWRlYSBoZXJlIGlzIHRoYXQgZXZl
cnkgY29kZSBwYXRoIHRoYXQncyBjcml0aWNhbCBmb3IgZXZlbnR1YWxseQo+IHNpZ25hbGxpbmcg
YSBkbWFfZmVuY2Ugc2hvdWxkIGJlIGFubm90YXRlZCB3aXRoCj4gZG1hX2ZlbmNlX2JlZ2luL2Vu
ZF9zaWduYWxsaW5nLiBUaGUgYW5ub3RhdGlvbiBpZGVhbGx5IHN0YXJ0cyByaWdodAo+IGFmdGVy
IGEgZG1hX2ZlbmNlIGlzIHB1Ymxpc2hlZCAoYWRkZWQgdG8gYSBkbWFfcmVzdiwgZXhwb3NlZCBh
cyBhCj4gc3luY19maWxlIGZkLCBhdHRhY2hlZCB0byBhIGRybV9zeW5jb2JqIGZkLCBvciBhbnl0
aGluZyBlbHNlIHRoYXQKPiBtYWtlcyB0aGUgZG1hX2ZlbmNlIHZpc2libGUgdG8gb3RoZXIga2Vy
bmVsIHRocmVhZHMpLCB1cCB0byBhbmQKPiBpbmNsdWRpbmcgdGhlIGRtYV9mZW5jZV93YWl0KCku
IEV4YW1wbGVzIGFyZSBpcnEgaGFuZGxlcnMsIHRoZQo+IHNjaGVkdWxlciBydCB0aHJlYWRzLCB0
aGUgdGFpbCBvZiBleGVjYnVmIChhZnRlciB0aGUgY29ycmVzcG9uZGluZwo+IGZlbmNlcyBhcmUg
dmlzaWJsZSksIGFueSB3b3JrZXJzIHRoYXQgZW5kIHVwIHNpZ25hbGxpbmcgZG1hX2ZlbmNlcyBh
bmQKPiByZWFsbHkgYW55dGhpbmcgZWxzZS4gTm90IGFubm90YXRlZCBzaG91bGQgYmUgY29kZSBw
YXRocyB0aGF0IG9ubHkKPiBjb21wbGV0ZSBmZW5jZXMgb3Bwb3J0dW5pc3RpY2FsbHkgYXMgdGhl
IGdwdSBwcm9ncmVzc2VzLCBsaWtlIGUuZy4KPiBzaHJpbmtlci9ldmljdGlvbiBjb2RlLgo+Cj4g
VGhlIG1haW4gY2xhc3Mgb2YgZGVhZGxvY2tzIHRoaXMgaXMgc3VwcG9zZWQgdG8gY2F0Y2ggYXJl
Ogo+Cj4gVGhyZWFkIEE6Cj4KPiAJbXV0ZXhfbG9jayhBKTsKPiAJbXV0ZXhfdW5sb2NrKEEpOwo+
Cj4gCWRtYV9mZW5jZV9zaWduYWwoKTsKPgo+IFRocmVhZCBCOgo+Cj4gCW11dGV4X2xvY2soQSk7
Cj4gCWRtYV9mZW5jZV93YWl0KCk7Cj4gCW11dGV4X3VubG9jayhBKTsKPgo+IFRocmVhZCBCIGlz
IGJsb2NrZWQgb24gQSBzaWduYWxsaW5nIHRoZSBmZW5jZSwgYnV0IEEgbmV2ZXIgZ2V0cyBhcm91
bmQKPiB0byB0aGF0IGJlY2F1c2UgaXQgY2Fubm90IGFjcXVpcmUgdGhlIGxvY2sgQS4KPgo+IE5v
dGUgdGhhdCBkbWFfZmVuY2Vfd2FpdCgpIGlzIGFsbG93ZWQgdG8gYmUgbmVzdGVkIHdpdGhpbgo+
IGRtYV9mZW5jZV9iZWdpbi9lbmRfc2lnbmFsbGluZyBzZWN0aW9ucy4gVG8gYWxsb3cgdGhpcyB0
byBoYXBwZW4gdGhlCj4gcmVhZCBsb2NrIG5lZWRzIHRvIGJlIHVwZ3JhZGVkIHRvIGEgd3JpdGUg
bG9jaywgd2hpY2ggbWVhbnMgdGhhdCBhbnkKPiBvdGhlciBsb2NrIGlzIGFjcXVpcmVkIGJldHdl
ZW4gdGhlIGRtYV9mZW5jZV9iZWdpbl9zaWduYWxsaW5nKCkgY2FsbCBhbmQKPiB0aGUgY2FsbCB0
byBkbWFfZmVuY2Vfd2FpdCgpLCBhbmQgc3RpbGwgaGVsZCwgdGhpcyB3aWxsIHJlc3VsdCBpbiBh
bgo+IGltbWVkaWF0ZSBsb2NrZGVwIGNvbXBsYWludC4gVGhlIG9ubHkgb3RoZXIgb3B0aW9uIHdv
dWxkIGJlIHRvIG5vdAo+IGFubm90YXRlIHN1Y2ggY2FsbHMsIGRlZmVhdGluZyB0aGUgcG9pbnQu
IFRoZXJlZm9yZSB0aGVzZSBhbm5vdGF0aW9ucwo+IGNhbm5vdCBiZSBzcHJpbmtsZWQgb3ZlciB0
aGUgY29kZSBlbnRpcmVseSBtaW5kbGVzcyB0byBhdm9pZCBmYWxzZQo+IHBvc2l0aXZlcy4KPgo+
IHYyOiBoYW5kbGUgc29mdC9oYXJkaXJxIGN0eCBiZXR0ZXIgYWdhaW5zdCB3cml0ZSBzaWRlIGFu
ZCBkb250IGZvcmdldAo+IEVYUE9SVF9TWU1CT0wsIGRyaXZlcnMgY2FuJ3QgdXNlIHRoaXMgb3Ro
ZXJ3aXNlLgo+Cj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8t
bW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmcK
PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogaW50ZWwtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29t
PgoKTEdUTS4gUGVyaGFwcyBzb21lIGluLWNvZGUgZG9jdW1lbnRhdGlvbiBvbiBob3cgdG8gdXNl
IHRoZSBuZXcgZnVuY3Rpb25zIAphcmUgY2FsbGVkLgoKT3RoZXJ3aXNlIGZvciBwYXRjaCAyIGFu
ZCAzLAoKUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRob21hcy5oZWxsc3Ryb21AaW50
ZWwuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
