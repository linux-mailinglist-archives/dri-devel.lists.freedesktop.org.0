Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F56310DA6B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 21:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF296E949;
	Fri, 29 Nov 2019 20:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B99D6E949
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 20:06:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so33085953wrl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 12:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jCyoaAQMX7Gsa+HCq3CNBhyjkL0+1cThNNjz6K0My80=;
 b=ogodkEfQO+XSDCO4OcsgeEctmthXe9SqSbKrLlxhANzIw0nkC+acAdqNS0B9QbN/43
 2dtGxLeUI7u9/yo8/KtZCwtAZuX9n0RwKnCf+gWnmYXlHkxrs+yoWhSu2DqIBscRmIKk
 oDjlgfDXoAh6/zgx1MsdzjJWvSsGZV8jj631ZtWaYLjrH8sGFiJPIfqKybEIadCw51ga
 fdOcqqGyygqrt63jZsQpnjCMNbX6q5sHUp0GDMlxbvciyzBI30N51hD050+Sx/jrdph9
 amKL7+W+GSAiqDzozwSYwiSU0uoVM/0ZJE+4tzL2enAUQlI4EnkwbXmtfbpwJGRDaapT
 zS1w==
X-Gm-Message-State: APjAAAVxLcqW4TimLPT3AulMSGu6FYbyTZzpd/VMYGjkVKcZ0rDkRVSj
 T9sKTDoBwsaZGXMKg1KhA+qZeKqwwgw=
X-Google-Smtp-Source: APXvYqzIWZ14TG7AL8doGQRUluKSZiQBpvHshpLn0UqzcXViDg8g6RM/K7tQWsfQ9aypZ9Ko8rXArA==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr22105600wrv.308.1575057986030; 
 Fri, 29 Nov 2019 12:06:26 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id w17sm6030020wrt.89.2019.11.29.12.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 12:06:25 -0800 (PST)
Date: Fri, 29 Nov 2019 21:06:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/9] drm/tegra: gem: Remove premature import restrictions
Message-ID: <20191129200623.GP624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-4-thierry.reding@gmail.com>
 <20191129091244.GC624164@phenom.ffwll.local>
 <20191129103345.GC2771912@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129103345.GC2771912@ulmo>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jCyoaAQMX7Gsa+HCq3CNBhyjkL0+1cThNNjz6K0My80=;
 b=iGIk2rJm0d0oW/vJ50rIT6x1kOUQnmUMO2pLQOWVtdwVsigrCmdfEzJdjMiFdod5XQ
 frpZm4p8q+7eEIN+UGIdwLsmF3qRtwXo/F87vA0fRTDlIZN9ipVpu5D4lzaqK44rX6mG
 jRG0gzuzVX6q5sSfqAQLuKHyn+D2JviKeB4Iw=
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTE6MzM6NDVBTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gT24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTA6MTI6NDRBTSArMDEwMCwgRGFuaWVs
IFZldHRlciB3cm90ZToKPiA+IE9uIFRodSwgTm92IDI4LCAyMDE5IGF0IDA0OjM3OjM1UE0gKzAx
MDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+ID4gPiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJl
ZGluZ0BudmlkaWEuY29tPgo+ID4gPiAKPiA+ID4gSXQncyBub3Qga25vd24gYXQgaW1wb3J0IHRp
bWUgd2hldGhlciBvciBub3QgYWxsIHVzZXJzIG9mIGEgRE1BLUJVRiB3aWxsCj4gPiA+IGJlIGFi
bGUgdG8gZGVhbCB3aXRoIG5vbi1jb250aWd1b3VzIG1lbW9yeS4gRWFjaCB1c2VyIG5lZWRzIHRv
IHZlcmlmeSBhdAo+ID4gPiBtYXAtdGltZSB3aGV0aGVyIGl0IGNhbiBhY2Nlc3MgdGhlIGJ1ZmZl
ci4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52
aWRpYS5jb20+Cj4gPiAKPiA+IEknbSBub3Qgc2VlaW5nIGFueSBvdGhlciBjaGVjayBmb3IgbmVu
dHMgLi4uIGRvZXMgdGhpcyBtZWFuIHRoYXQgdGhlcmUncwo+ID4gbm90IGFjdHVhbGx5IGFueSBi
bG9jayB0aGF0IHJlcXVpcmVzIGNvbnRpZyBtZW0/Cj4gCj4gQWxsIHRoZSBibG9ja3MgcmVxdWly
ZSBjb250aWd1b3VzIG1lbW9yeS4gSG93ZXZlciwgdGhleSBhcmUgYWxsIGJlaGluZAo+IGFuIElP
TU1VIGFuZCBpbiBwcmFjdGljZSB3aWxsIGFsd2F5cyBlbmQgdXAgbWFwcGluZyB0aGUgYnVmZmVy
cyB0aHJvdWdoCj4gdGhlIElPTU1VLiBUZWNoaWNhbGx5IHRoaXMgY2hlY2sgc2hvdWxkIG5vdyBi
ZSBpbiB0ZWdyYV9kY19waW4oKSwgd2hpY2gKPiBpcyBjYWxsZWQgYnkgdGhlIC0+cHJlcGFyZV9m
YigpIGNhbGxiYWNrLiBJIGRpZG4ndCBhZGQgaXQgYmVjYXVzZSB0aGVyZQo+IGFyZSBubyBwcmFj
dGljYWwgdXNlLWNhc2VzIHdoZXJlIHRoaXMgaGFwcGVucywgYWx0aG91Z2ggSSBndWVzcyB5b3UK
PiBjb3VsZCBjb21lIHVwIHdpdGggYSBrZXJuZWwgYW5kIERUQiBjb21iaW5hdGlvbiB3aGVyZSB0
aGlzIGlzIGFjdHVhbGx5Cj4gcG9zc2libGUgYnkganVtcGluZyB0aHJvdWdoIHNvbWUgaG9vcHMu
Cj4gCj4gVGhpcyBmaXggaGVyZSBpcyB0byBtYWtlIFRlZ3JhIERSTSBpbnRlcm9wZXJhdGlvbiB3
aXRoIE5vdXZlYXUgd29yawo+IGFnYWluIHNpbmNlIHRoYXQncyBjdXJyZW50bHkgYnJva2VuIGFm
dGVyIG1vdmluZyB0byB0aGUgSU9NTVUtYmFja2VkIERNQQo+IEFQSSBhcyBhbiBhbHRlcm5hdGl2
ZSB0byBleHBsaWNpdCBJT01NVSB1c2FnZS4gV2l0aCBleHBsaWNpdCBJT01NVSB1c2FnZQo+ICh0
aGF0J3MgdGhlIGlmIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGVsc2UgcmVtb3ZlZCBiZWxvdykgdGhl
IElPTU1VIGRvbWFpbgo+IHdhcyBzaGFyZWQgYmV0d2VlbiB0aGUgZGlzcGxheSBjb250cm9sbGVy
cyBhdCB0aGUgZHJpdmVyIGxldmVsLCBzbyBpdAo+IHdhcyBmaW5lIHRvIG1ha2UgdGhpcyBkZXRl
cm1pbmF0aW9uIGluIHRoZSBlbHNlIGJyYW5jaCBiZWNhdXNlIHRoaXMgd2FzCj4gdGhlIGNhc2Ug
d2hlcmUgbm8gSU9NTVUgd2FzIGluIHBsYXkuIEFmdGVyIHRoZSBtb3ZlIHRvIHRoZSBETUEgQVBJ
LCB0aGlzCj4gZWxzZSBicmFuY2ggaXMgYWxzbyB0YWtlbiB3aGVuIHRoZSBETUEgQVBJIGlzIGJh
Y2tlZCBieSBhbiBJT01NVSBhbmQgYXQKPiBpdCBpcyB1bmZvcnR1bmF0ZWx5IG5vdCBrbm93biBh
dCBpbXBvcnQgdGltZSB3aGljaCBkaXNwbGF5IGNvbnRyb2xsZXIKPiBlbmRzIHVwIHNjYW5uaW5n
IG91dCB0aGUgRE1BIEJVRiwgbm9yIGlmIHRoYXQgZGlzcGxheSBjb250cm9sbGVyIGlzCj4gYmVo
aW5kIGFuIElPTU1VLiBXZSBvbmx5IGtub3cgdGhhdCB3aGVuIHRoZSBhY3R1YWwgbWFwcGluZyB0
YWtlcyBwbGFjZSwKPiBzbyB3ZSdkIG5lZWQgdG8gbG9vayBhdCBzZ3QtPm5lbnRzIGFmdGVyIGRt
YV9tYXBfc2coKSBpbiBpbgo+IHRlZ3JhX2RjX3BpbigpLgo+IAo+IEknbGwgYWRkIHRoYXQgY2hl
Y2sgdGhlcmUsIGp1c3QgaW4gY2FzZSBhbnlvbmUgbWFuYWdlcyB0byBjb25qdXJlIHVwCj4gc3Vj
aCBhIGNvbmZpZ3VyYXRpb24uCgpJbW8ganVzdCBwYXN0ZSB0aGUgYWJvdmUgZXhwbGFuYXRpb24g
aW50byB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCk9yIGFsc28gYWRkIHRoZSBjaGVjaywgYnV0IGltbyB0
aGUgZXhwbGFuYXRpb24gaGVyZSBpcyB0aGUgaW1wb3J0YW50IHBhcnQuCi1EYW5pZWwKCj4gCj4g
VGhpZXJyeQo+IAo+ID4gLURhbmllbAo+ID4gCj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2dlbS5jIHwgNyAtLS0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBkZWxl
dGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
Z2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMKPiA+ID4gaW5kZXggNmRmYWQ1NmVl
ZTJiLi5iYzE1YjQzMDE1NmQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdy
YS9nZW0uYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMKPiA+ID4gQEAg
LTQ0MCwxMyArNDQwLDYgQEAgc3RhdGljIHN0cnVjdCB0ZWdyYV9ibyAqdGVncmFfYm9faW1wb3J0
KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sCj4gPiA+ICAJCWVyciA9IHRlZ3JhX2JvX2lvbW11X21h
cCh0ZWdyYSwgYm8pOwo+ID4gPiAgCQlpZiAoZXJyIDwgMCkKPiA+ID4gIAkJCWdvdG8gZGV0YWNo
Owo+ID4gPiAtCX0gZWxzZSB7Cj4gPiA+IC0JCWlmIChiby0+c2d0LT5uZW50cyA+IDEpIHsKPiA+
ID4gLQkJCWVyciA9IC1FSU5WQUw7Cj4gPiA+IC0JCQlnb3RvIGRldGFjaDsKPiA+ID4gLQkJfQo+
ID4gPiAtCj4gPiA+IC0JCWJvLT5pb3ZhID0gc2dfZG1hX2FkZHJlc3MoYm8tPnNndC0+c2dsKTsK
PiA+ID4gIAl9Cj4gPiA+ICAKPiA+ID4gIAliby0+Z2VtLmltcG9ydF9hdHRhY2ggPSBhdHRhY2g7
Cj4gPiA+IC0tIAo+ID4gPiAyLjIzLjAKPiA+ID4gCj4gPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+ID4gCj4gPiAtLSAK
PiA+IERhbmllbCBWZXR0ZXIKPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgo+ID4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
