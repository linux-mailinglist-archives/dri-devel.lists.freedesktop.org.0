Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0336D9A0A7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 22:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3310E6EAA5;
	Thu, 22 Aug 2019 20:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE116EAA5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 20:03:12 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id f21so461051lfc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8BL6cXi6kmquC//tEDRxbHmDzYl3D4X2KwrWFAtyUbo=;
 b=Hp4OL7CFEQYKP2sH6l6JLXWRfU93RzFu1QE15CaNf6voxBOA82KyL2H7khzhy1GlVm
 bDxLwxPWbk9NPa4HpPWgiiyQlL4RBtSSAxR3+QrUVuvOWDK8naIfkeUobzTTbk5Y5eHG
 kFWw5yIZkcH8Wkh7jPQbMEI+3gXrrJFv+aalaelCRGckrBEfoV+sIv7ZiSEodOiCUudG
 aPGATUOjH1wFamgXQgrEMDlWrT3JW/0OYHtOWTVVViOlmLtc4YRh2vTNBSjBWpXT4DGg
 SX/jvDypuReracv5edl1OQmfcFhwlYWyfuB+fOW6fZGkn3lt554d3CLq0TTznQZ6HP+I
 dm6Q==
X-Gm-Message-State: APjAAAX6kaENwSSANQVZPwuXgK/aVWGjvqViKzUrj8UXtOg/ZNqBWngP
 eDWvY/OmxQBf+YvzLMr7CIZR0Y6UIBAtT5u/liw=
X-Google-Smtp-Source: APXvYqyC3WDdSPVZ6qNtk720WzSxZ4/fd0UnMq/iblygQ0tHGlxaCJ/2waC/QgLudzBysoCELVdNSGdMiH3o+xywLf0=
X-Received: by 2002:ac2:4c12:: with SMTP id t18mr514885lfq.134.1566504190777; 
 Thu, 22 Aug 2019 13:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
 <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
 <370747ca-4dc9-917b-096c-891dcc2aedf0@suse.de>
 <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
 <20190812072545.GA63191@shbuild999.sh.intel.com>
 <20190813093616.GA65475@shbuild999.sh.intel.com>
 <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
In-Reply-To: <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Aug 2019 06:02:58 +1000
Message-ID: <CAPM=9twNdYZCbyByLqZPpcK+ifoeL0weXppqzLyZEOn7GPAV_Q@mail.gmail.com>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8BL6cXi6kmquC//tEDRxbHmDzYl3D4X2KwrWFAtyUbo=;
 b=L+J0jw74rzPlJ5rUcp3hfdUw72E0cFHz4B0Zt4j+ug0Lzq4mee1klH7LUfCS34fGcJ
 4kbhybS3AaCCfkRLdSvd227te6vWk+BvFnsq7irW+bxuHY9dviaPhzUh22XtWCOI8F+f
 +JVotM2uMONkC/ItZ2oBRxM0rT1VyDUWLff+g7QAcFd1ujFOogO/f14Cic/SYtZfSOZQ
 6yo7I0mHZnv+FhroC3/xU3RoyQXnCFZd5D6CSL1LmuNKhCH3Ray7pXZ2Nk+r3sHiILVr
 33X1ae9pS55Jk8JV3YllIyvkXcn319M5aR7zHjAYuHLJHNUku3h53U1UsOmKfmNhtR2v
 nSfw==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Feng Tang <feng.tang@intel.com>,
 Rong Chen <rong.a.chen@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com,
 LKP <lkp@01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMyBBdWcgMjAxOSBhdCAwMzoyNSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gSGkKPgo+IEkgd2FzIHRyYXZlbGluZyBhbmQgY291bGQg
cmVwbHkgZWFybGllci4gU29ycnkgZm9yIHRha2luZyBzbyBsb25nLgo+Cj4gQW0gMTMuMDguMTkg
dW0gMTE6MzYgc2NocmllYiBGZW5nIFRhbmc6Cj4gPiBIaSBUaG9tYXMsCj4gPgo+ID4gT24gTW9u
LCBBdWcgMTIsIDIwMTkgYXQgMDM6MjU6NDVQTSArMDgwMCwgRmVuZyBUYW5nIHdyb3RlOgo+ID4+
IEhpIFRob21hcywKPiA+Pgo+ID4+IE9uIEZyaSwgQXVnIDA5LCAyMDE5IGF0IDA0OjEyOjI5UE0g
KzA4MDAsIFJvbmcgQ2hlbiB3cm90ZToKPiA+Pj4gSGksCj4gPj4+Cj4gPj4+Pj4gQWN0dWFsbHkg
d2UgcnVuIHRoZSBiZW5jaG1hcmsgYXMgYSBiYWNrZ3JvdW5kIHByb2Nlc3MsIGRvIHdlIG5lZWQg
dG8KPiA+Pj4+PiBkaXNhYmxlIHRoZSBjdXJzb3IgYW5kIHRlc3QgYWdhaW4/Cj4gPj4+PiBUaGVy
ZSdzIGEgd29ya2VyIHRocmVhZCB0aGF0IHVwZGF0ZXMgdGhlIGRpc3BsYXkgZnJvbSB0aGUgc2hh
ZG93IGJ1ZmZlci4KPiA+Pj4+IFRoZSBibGlua2luZyBjdXJzb3IgcGVyaW9kaWNhbGx5IHRyaWdn
ZXJzIHRoZSB3b3JrZXIgdGhyZWFkLCBidXQgdGhlCj4gPj4+PiBhY3R1YWwgdXBkYXRlIGlzIGp1
c3QgdGhlIHNpemUgb2Ygb25lIGNoYXJhY3Rlci4KPiA+Pj4+Cj4gPj4+PiBUaGUgcG9pbnQgb2Yg
dGhlIHRlc3Qgd2l0aG91dCBvdXRwdXQgaXMgdG8gc2VlIGlmIHRoZSByZWdyZXNzaW9uIGNvbWVz
Cj4gPj4+ID5mcm9tIHRoZSBidWZmZXIgdXBkYXRlIChpLmUuLCB0aGUgbWVtY3B5IGZyb20gc2hh
ZG93IGJ1ZmZlciB0byBWUkFNKSwgb3IKPiA+Pj4gPmZyb20gdGhlIHdvcmtlciB0aHJlYWQuIElm
IHRoZSByZWdyZXNzaW9uIGdvZXMgYXdheSBhZnRlciBkaXNhYmxpbmcgdGhlCj4gPj4+PiBibGlu
a2luZyBjdXJzb3IsIHRoZW4gdGhlIHdvcmtlciB0aHJlYWQgaXMgdGhlIHByb2JsZW0uIElmIGl0
IGFscmVhZHkKPiA+Pj4+IGdvZXMgYXdheSBpZiB0aGVyZSdzIHNpbXBseSBubyBvdXRwdXQgZnJv
bSB0aGUgdGVzdCwgdGhlIHNjcmVlbiB1cGRhdGUKPiA+Pj4+IGlzIHRoZSBwcm9ibGVtLiBPbiBt
eSBtYWNoaW5lIEkgaGF2ZSB0byBkaXNhYmxlIHRoZSBibGlua2luZyBjdXJzb3IsIHNvCj4gPj4+
PiBJIHRoaW5rIHRoZSB3b3JrZXIgY2F1c2VzIHRoZSBwZXJmb3JtYW5jZSBkcm9wLgo+ID4+Pgo+
ID4+PiBXZSBkaXNhYmxlZCByZWRpcmVjdGluZyBzdGRvdXQvc3RkZXJyIHRvIC9kZXYva21zZywg
IGFuZCB0aGUgcmVncmVzc2lvbiBpcwo+ID4+PiBnb25lLgo+ID4+Pgo+ID4+PiBjb21taXQ6Cj4g
Pj4+ICAgZjFmODU1NWRmYjkgZHJtL2JvY2hzOiBVc2Ugc2hhZG93IGJ1ZmZlciBmb3IgYm9jaHMg
ZnJhbWVidWZmZXIgY29uc29sZQo+ID4+PiAgIDkwZjQ3OWFlNTFhIGRybS9tZ2FnMjAwOiBSZXBs
YWNlIHN0cnVjdCBtZ2FfZmJkZXYgd2l0aCBnZW5lcmljIGZyYW1lYnVmZmVyCj4gPj4+IGVtdWxh
dGlvbgo+ID4+Pgo+ID4+PiBmMWY4NTU1ZGZiOWE3MGEyICA5MGY0NzlhZTUxYWZhNDVlZmFiOTdh
ZmRkZSB0ZXN0Y2FzZS90ZXN0cGFyYW1zL3Rlc3Rib3gKPiA+Pj4gLS0tLS0tLS0tLS0tLS0tLSAg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
Pj4+ICAgICAgICAgICVzdGRkZXYgICAgICBjaGFuZ2UgICAgICAgICAlc3RkZGV2Cj4gPj4+ICAg
ICAgICAgICAgICBcICAgICAgICAgIHwgICAgICAgICAgICAgICAgXAo+ID4+PiAgICAgIDQzNzg1
ICAgICAgICAgICAgICAgICAgICAgICA0NDQ4MQo+ID4+PiB2bS1zY2FsYWJpbGl0eS8zMDBzLThU
LWFub24tY293LXNlcS1odWdldGxiL2xrcC1rbm0wMQo+ID4+PiAgICAgIDQzNzg1ICAgICAgICAg
ICAgICAgICAgICAgICA0NDQ4MSAgICAgICAgR0VPLU1FQU4gdm0tc2NhbGFiaWxpdHkubWVkaWFu
Cj4gPj4KPiA+PiBUaWxsIG5vdywgZnJvbSBSb25nJ3MgdGVzdHM6Cj4gPj4gMS4gRGlzYWJsaW5n
IGN1cnNvciBibGlua2luZyBkb2Vzbid0IGN1cmUgdGhlIHJlZ3Jlc3Npb24uCj4gPj4gMi4gRGlz
YWJsaW5nIHByaW50aW50IHRlc3QgcmVzdWx0cyB0byBjb25zb2xlIGNhbiB3b3JrYXJvdW5kIHRo
ZQo+ID4+IHJlZ3Jlc3Npb24uCj4gPj4KPiA+PiBBbHNvIGlmIHdlIHNldCB0aGUgcGVyZmVyX3No
YWRvd24gdG8gMCwgdGhlIHJlZ3Jlc3Npb24gaXMgYWxzbwo+ID4+IGdvbmUuCj4gPgo+ID4gV2Ug
YWxzbyBkaWQgc29tZSBmdXJ0aGVyIGJyZWFrIGRvd24gZm9yIHRoZSB0aW1lIGNvbnN1bWVkIGJ5
IHRoZQo+ID4gbmV3IGNvZGUuCj4gPgo+ID4gVGhlIGRybV9mYl9oZWxwZXJfZGlydHlfd29yaygp
IGNhbGxzIHNlcXVlbnRpYWxseQo+ID4gMS4gZHJtX2NsaWVudF9idWZmZXJfdm1hcCAgICAgICAo
MjkwIHVzKQo+ID4gMi4gZHJtX2ZiX2hlbHBlcl9kaXJ0eV9ibGl0X3JlYWwgICgxOTI0MCB1cykK
PiA+IDMuIGhlbHBlci0+ZmItPmZ1bmNzLT5kaXJ0eSgpICAgIC0tLT4gTlVMTCBmb3IgbWdhZzIw
MCBkcml2ZXIKPiA+IDQuIGRybV9jbGllbnRfYnVmZmVyX3Z1bm1hcCAgICAgICAoMjE1IHVzKQo+
ID4KPgo+IEl0J3Mgc29tZXdoYXQgZGlmZmVyZW50IHRvIHdoYXQgSSBvYnNlcnZlZCwgYnV0IG1h
eWJlIEkganVzdCBjb3VsZG4ndAo+IHJlcHJvZHVjZSB0aGUgcHJvYmxlbSBjb3JyZWN0bHkuCj4K
PiA+IFRoZSBhdmVyYWdlIHJ1biB0aW1lIGlzIGxpc3RlZCBhZnRlciB0aGUgZnVuY3Rpb24gbmFt
ZXMuCj4gPgo+ID4gRnJvbSBpdCwgd2UgY2FuIHNlZSBkcm1fZmJfaGVscGVyX2RpcnR5X2JsaXRf
cmVhbCgpIHRha2VzIHRvbyBsb25nCj4gPiB0aW1lIChhYm91dCAyMG1zIGZvciBlYWNoIHJ1biku
IEkgZ3Vlc3MgdGhpcyBpcyB0aGUgcm9vdCBjYXVzZQo+ID4gb2YgdGhpcyByZWdyZXNzaW9uLCBh
cyB0aGUgb3JpZ2luYWwgY29kZSBkb2Vzbid0IHVzZSB0aGlzIGRpcnR5IHdvcmtlci4KPgo+IFRy
dWUsIHRoZSBvcmlnaW5hbCBjb2RlIHVzZXMgYSB0ZW1wb3JhcnkgYnVmZmVyLCBidXQgdXBkYXRl
cyB0aGUgZGlzcGxheQo+IGltbWVkaWF0ZWx5Lgo+Cj4gTXkgZ3Vlc3MgaXMgdGhhdCB0aGlzIGNv
dWxkIGJlIGEgY2FjaGluZyBwcm9ibGVtLiBUaGUgd29ya2VyIHJ1bnMgb24gYQo+IGRpZmZlcmVu
dCBDUFUsIHdoaWNoIGRvZXNuJ3QgaGF2ZSB0aGUgc2hhZG93IGJ1ZmZlciBpbiBjYWNoZS4KPgo+
ID4gQXMgc2FpZCBpbiBsYXN0IGVtYWlsLCBzZXR0aW5nIHRoZSBwcmVmZXJfc2hhZG93IHRvIDAg
Y2FuIGF2b2lkCj4gPiB0aGUgcmVncnNzaW9uLiBDb3VsZCBpdCBiZSBhbiBvcHRpb24/Cj4KPiBV
bmZvcnR1bmF0ZWx5IG5vdC4gV2l0aG91dCB0aGUgc2hhZG93IGJ1ZmZlciwgdGhlIGNvbnNvbGUn
cyBkaXNwbGF5Cj4gYnVmZmVyIHBlcm1hbmVudGx5IHJlc2lkZXMgaW4gdmlkZW8gbWVtb3J5LiBJ
dCBjb25zdW1lcyBzaWduaWZpY2FudAo+IGFtb3VudCBvZiB0aGF0IG1lbW9yeSAoc2F5IDggTWlC
IG91dCBvZiAxNiBNaUIpLiBUaGF0IGRvZXNuJ3QgbGVhdmUKPiBlbm91Z2ggcm9vbSBmb3IgYW55
dGhpbmcgZWxzZS4KPgo+IFRoZSBiZXN0IG9wdGlvbiBpcyB0byBub3QgcHJpbnQgdG8gdGhlIGNv
bnNvbGUuCgpXYWl0IGEgc2Vjb25kLCBJIHRob3VnaHQgdGhlIGRyaXZlciBkaWQgYW4gZXZpY3Rp
b24gb24gbW9kZXNldCBvZiB0aGUKc2Nhbm5lZCBvdXQgb2JqZWN0LCB0aGlzIHdhcyBhIGRlbGli
ZXJhdGUgZGVzaWduIGRlY2lzaW9uIG1hZGUgd2hlbgp3cml0aW5nIHRob3NlIGRyaXZlcnMsIGhh
cyB0aGlzIGJlZW4gcmVtb3ZlZCBpbiBmYXZvdXIgb2YgZ2VtIGFuZApnZW5lcmljIGNvZGUgcGF0
aHM/CgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
