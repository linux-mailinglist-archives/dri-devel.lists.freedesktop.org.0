Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FC4241894
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 10:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1B589B7B;
	Tue, 11 Aug 2020 08:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB35689B7B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 08:55:53 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z18so10697245wrm.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YS7BXRm9wNWFY9MraHUnh/ZKKl//+UI+FTxTvoGMwD8=;
 b=cLCvrtGXLjXe7Gz01Yw9tdpVFiIIFZbED+w0WYhZaCDo0PufSyqN+zV5u9O4DtsRgD
 zLmrbqhi4wkW1tju++w2J0J1r1L7YaW8Y8K8i0MFGesYpJ6gDI5k8LbQTU4v6DIsyQIS
 3czdI/00Ssm69y1yMLxsDbSSme3YX1RqNFnsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YS7BXRm9wNWFY9MraHUnh/ZKKl//+UI+FTxTvoGMwD8=;
 b=jB1E/irPEjeokuB+hfwHCY150pjH3hJL3mEux335VHYponSKHtr2ffulbDSYuwYtKh
 4BHQs930vSmSXSG8lLL9yfGxvCN75SyGScjRCYKVsLQix0wnj9tX33l8TIPHnejQifaJ
 RVoYBJvicy4y2l8lEwTJ/hNqj+N3MI/nH+TOILHS6UxmuOmw0ej4qo3PDvhqhiE2th3F
 tPMrEMdJVDnhJZbf4jYLxgB0OKjbv1Yw4gZCYvSYdr4FfpKi6XbUSfruyvlUqsIhmZj8
 XJXNZO3YYfisycuqCEdYfrJQ20EnA5uTgIEp4kscnuBcRh6ezzKugsdqmVyw33zHY9ff
 YkMQ==
X-Gm-Message-State: AOAM532yc5W84Pj6V+aPQQxjhjqTGFjN2j+h8QzTgckNPHX3T3+tRK7/
 Bof90Q1+CWNl6LMbMqrxrv/nkEVEOt0=
X-Google-Smtp-Source: ABdhPJwYVNifmYoj748qVD2ItT1ow+d0UsdOlSHxDUBVP2GfGMucFqBBdcnXO/PPN2V7q7VLRBGVWA==
X-Received: by 2002:adf:a15c:: with SMTP id r28mr5180988wrr.151.1597136152593; 
 Tue, 11 Aug 2020 01:55:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm26071391wrn.89.2020.08.11.01.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 01:55:52 -0700 (PDT)
Date: Tue, 11 Aug 2020 10:55:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/mgag200: fix build on alpha arch
Message-ID: <20200811085550.GY2352366@phenom.ffwll.local>
References: <20200807180547.GA923146@ravnborg.org>
 <bc77eba7-a49b-15cf-f72f-6c78af015813@suse.de>
 <20200811081201.GA470897@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811081201.GA470897@ravnborg.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTEsIDIwMjAgYXQgMTA6MTI6MDFBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIFRob21hcy4KPiAKPiBPbiBUdWUsIEF1ZyAxMSwgMjAyMCBhdCAwODo1OToxM0FN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiA+IEhpIFNhbQo+ID4gCj4gPiB0aGFu
a3MgZm9yIHRha2VuIGNhcmUgb2YgdGhpcyBpc3N1ZS4gQWxwaGEgaXMgYSByYXJlIGFyY2hpdGVj
dHVyZSB0aGVzZQo+ID4gZGF5cy4gSG93IGRvIHlvdSBidWlsZCBhbmQgdGVzdCBmb3IgaXQ/Cj4g
Cj4gSSBhbSBvbiB1YnVudHUgaGVyZSBzbyBJIGhhdmUgaW5zdGFsbGVkOgo+IGFwdCBpbnN0YWxs
IGdjYy1hbHBoYS1saW51eC1nbnUKPiAKPiBBbmQgdGhlbiBhbHBoYSBpcyBvbmUgb2YgdGhlIGFy
Y2hpdGVjdHVyZXMgSSBidWlsZCBmb3IuCj4gTXkgZnVsbCBsaXN0Ogo+IGFyY2hzPSJhbHBoYSBh
cm0gYXJtNjQgc3BhcmM2NCBpMzg2IHg4NiBwb3dlcnBjIHMzOTAgcmlzY3Ygc2giCj4gCj4gSSBi
dWlsZCB0aGVzZSBjb25maWdzOgo+IGNvbmZpZ3M9ImFsbG1vZGNvbmZpZyBhbGx5ZXNjb25maWcg
YWxsbm9jb25maWcgZGVmY29uZmlnIgo+IAo+IEl0IHRha2VzIGEgd2hpbGUgc28gdXN1YWxseSBJ
IGJ1aWxkIG9ubHkgdGhlIHJlbGV2YW50IHN1Yi1zZXQgc3VjaCBhcwo+IGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvCj4gCj4gSSBoYXZlLCB1bmZvcnR1bmF0ZWx5LCBubyB0ZXN0aW5nLiBXb3VsZCBs
b3ZlIHNvbWV0aGluZyBxZW11IGJhc2VkIGJ1dAo+IGhhdmUgbmV2ZXIgaW52ZXN0ZWQgdGltZSBp
bnRvIHRoaXMuCgpTbyB0aGUgbG9uZyB0ZXJtIGlkZWEgaGVyZSB3YXMgdGhhdCB3ZSdkIGRvIGF0
IGxlYXN0IGFsbCB0aGUgYnVpbGQgdGVzdGluZwpvbiBnaXRsYWIuIEJ1dCBtb3ZpbmcgdGhlIGRy
bSByZXBvcyBvdmVyIHRvIGdpdGxhYiBoYXMga2luZGEgYmVlbiBvbiBob2xkCmZvciBhIGJpdCwg
d2l0aCBhbGwgdGhlIGdpdGxhYi5mcmVlZGVza3RvcC5vcmcgc3RydWdnbGVzIHBhc3QgZmV3IG1v
bnRocy4KSXQgZG9lcyBsb29rIGxpa2UgaXQncyBvbiBhIHJlYWxseSBnb29kIHRyYWNrIHRob3Vn
aC4KClRoZW4gd2UgY291bGQgZG8gYnVpbGQgdGVzdGluZyBmb3IgcHJldHR5IG11Y2ggYW55IHJl
YXNvbmFibGUKYXJjaGl0ZWN0dXJlLCBhbmQgYWxzbyBxZW11IGJhc2VkIHJ1bnMgKHdpdGhpbiBy
ZWFzb25zIGF0IGxlYXN0KS4gQW5kCmNvbW1pdHRlcnMgd291bGRuJ3QgaGF2ZSB0byBkdXBsaWNh
dGUgaXQgYWxsIGZvciB0aGVpciBvd24gc2V0dXAsIHNpbmNlCml0J3MgYWxsIHNoYXJlZC4KLURh
bmllbAoKPiAKPiAJU2FtCj4gCj4gPiAKPiA+IEFtIDA3LjA4LjIwIHVtIDIwOjA1IHNjaHJpZWIg
U2FtIFJhdm5ib3JnOgo+ID4gPiBXaGVuIGJ1aWxkaW5nIGltZ2FnMjAwIGZvciB0aGUgYWxwaGEg
YXJjaGl0ZWN0dXJlIGl0IGZhaWxzIGxpa2UgdGhpczoKPiA+ID4gbWdhZzIwMF9kcnYuYzoyMzM6
OTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHZtYWxsb2PigJkK
PiA+ID4gICAyMzMgfCAgYmlvcyA9IHZtYWxsb2Moc2l6ZSk7Cj4gPiA+ICAgICAgIHwgICAgICAg
ICBefn5+fn5+Cj4gPiA+ICAgICAgIHwgICAgICAgICBrbWFsbG9jCj4gPiA+IAo+ID4gPiBXaGVu
IGJ1aWxkaW5nIGZvciBvdGhlciBhcmNoaXRlY3R1cmVzIHZtYWxsb2MuaCBpcyBwdWxsZWQgaW4g
dmlhIHNvbWUKPiA+ID4gb3RoZXIgaGVhZGVyIGZpbGUgLSBmb3IgZXhhbXBsZSBhc20tZ2VuZXJp
Yy9pby5oLgo+ID4gPiBVc2UgYW4gZXhwbGljaXQgaW5jbHVkZSBvZiB2bWFsbG9jLmggdG8gZml4
IHRoZSBidWlsZC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KPiA+IAo+ID4gU29ycnkgZm9yIGJlaW5nICh0b28pIGxhdGUsIGJ1dCBz
dGlsbDoKPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPgo+ID4gCj4gPiBCZXN0IHJlZ2FyZHMKPiA+IFRob21hcwo+ID4gCj4gPiA+IEZp
eGVzOiBlMjBkZmQyN2Y3YWEgKCJkcm0vbWdhZzIwMDogQWRkIHN1cHBvcnQgZm9yIEcyMDAgZGVz
a3RvcCBjYXJkcyIpCj4gPiA+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KPiA+ID4gQ2M6IEVnYmVydCBFaWNoIDxlaWNoQHN1c2UuY29tPgo+ID4gPiBDYzogVGFr
YXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPgo+ID4gPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KPiA+ID4gLS0tCj4gPiA+IEkgaGF2ZSBsb3N0IHRyYWNrIGlmIHRoZSBvZmZlbmRp
bmcgY29tbWl0IGlzIG9uIHRoZSB3YXkgdG8gdXBzdHJlYW0gb3IKPiA+ID4gaXQgaXMganVzdCBp
biBkcm0tbWlzYy1uZXh0LiBCdXQgSSB0aGluayBpdCBpcyB0aGUgbGF0dGVyIHNvIHdlIGNhbgo+
ID4gPiBhcHBseSB0aGlzIHRvIGRybS1taXNjLW5leHQuCj4gPiA+IAo+ID4gPiAJU2FtCj4gPiA+
IAo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyB8IDEgKwo+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKPiA+ID4gaW5kZXggMDkxNzBkNDZhYTUzLi5iMjgyYjBl
NDJjMmQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
ZHJ2LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwo+
ID4gPiBAQCAtOSw2ICs5LDcgQEAKPiA+ID4gICNpbmNsdWRlIDxsaW51eC9jb25zb2xlLmg+Cj4g
PiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvcGNp
Lmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgo+ID4gPiAgCj4gPiA+ICAjaW5j
bHVkZSA8ZHJtL2RybV9kcnYuaD4KPiA+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KPiA+
ID4gCj4gPiAKPiA+IC0tIAo+ID4gVGhvbWFzIFppbW1lcm1hbm4KPiA+IEdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXIKPiA+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAo+ID4g
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gPiAoSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpCj4gPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4g
PiAKPiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
