Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3947719A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 20:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466316EE2C;
	Fri, 26 Jul 2019 18:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26916EE2C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 18:49:33 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id n205so20639880ywb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GE70ZD8VSs3ukFhxUt6taGNdz4ZpwsuoPT8MPr4d+IM=;
 b=rXZmIhy9Z+/FHTWQ/S+7iHlKwgpfLMr2bRz6iIb/cKBQtd6CWWZppnOGcLcxOnyM9r
 Tp7m/dbkPgg3KyQrgEWZzOV6pQgCS6tTsKw8HBalAUfkJ5tB583U3F4SyCyloU9D4eDY
 H5MJkGktmEqMHpHZbuDSKTbKgeU/6NX0sGLEUdvrI/lsKTtaZI4t7ZQzfDln/hnUGSq+
 1uvpNh8e1Ok1TLSj04s/rY5jgP2rhJYNysTUo3I75M+CVIYjbn6zoAeB3UvmGzglzUHZ
 gGn69J9Ov+Cz3BXCeFS26ZDUG2f/SWM1mLL/5xZ7PdZ1KGRp6IQXvYUJb2gWQ9Du2Trj
 M6eA==
X-Gm-Message-State: APjAAAU7h45VJ0Q8v8bU5XmULkg3d+4sAP2+U7QJXDODAWszgud17sNR
 K+/m+1PIV+s/hPitortSYOVrop4zEJZTaSfTGVpIIg==
X-Google-Smtp-Source: APXvYqyq1e4Aq2VUcHUkhHNJqcbNS+lSdEqwWUZyEoUO1Pw4OH5eYZlku5N2HPpHmjtgONgBFvMOvLm/nhw43zZAwxc=
X-Received: by 2002:a81:2852:: with SMTP id o79mr46260355ywo.372.1564166972848; 
 Fri, 26 Jul 2019 11:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190726142057.224121-1-sean@poorly.run>
 <5e1fe0eb25066ca078d06b13775fced37fd3a086.camel@redhat.com>
In-Reply-To: <5e1fe0eb25066ca078d06b13775fced37fd3a086.camel@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Fri, 26 Jul 2019 14:48:55 -0400
Message-ID: <CAMavQKKdBSHvbL6WGSsvH1hP67dNYdwho_U8ctZFQv7SH=TGTw@mail.gmail.com>
Subject: Re: [PATCH] drm/mst: Fix sphinx warnings in drm_dp_msg_connector
 register functions
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GE70ZD8VSs3ukFhxUt6taGNdz4ZpwsuoPT8MPr4d+IM=;
 b=M481DxM0c4t0bWKzUsD66BrD3oZaG390tisdORjWbvwv241Qf1oYs7kVwEDPwIBrI8
 cgGwkYkwUD+Bdg1WjjRiFHc9fh5gyBJp5I2jWWaGTqHroCdM1Y25ankTQ9YQer1tn8ar
 P0YpND3I8WvGpvlySR/xVo4RdAB94/p+k6102V1Ub/GNaDfVDCBGwgZk1xVK9IiLwnWy
 k7GIhTaHJPHCeqek7g+XTfzr23OVIQlYMOA9LN7IM7SqPJa06b89XnmkY+TWF0tKbPWw
 jJGZhFr8h1zaVWI8a643YTLxxJopK2v9+FpqIKsq3Qk05mTZ6ULzXcxG2XCc/9WHYIwD
 LKpA==
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
Cc: Leo Li <sunpeng.li@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMjowNiBQTSBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPiB3cm90ZToKPgo+IGxndG0KPgo+IFJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUBy
ZWRoYXQuY29tPgo+CgpUaGFua3MgZm9yIHRoZSBxdWljayByZXZpZXchIFB1c2hlZCB0byBkcm0t
bWlzYy1uZXh0CgpTZWFuCgoKPiBPbiBGcmksIDIwMTktMDctMjYgYXQgMTA6MjAgLTA0MDAsIFNl
YW4gUGF1bCB3cm90ZToKPiA+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
Pgo+ID4KPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cj4gPgo+ID4gLi4vZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYzoxNTkzOiB3YXJuaW5nOiBFeGNlc3MgZnVu
Y3Rpb24KPiA+IHBhcmFtZXRlciAnZHJtX2Nvbm5lY3RvcicgZGVzY3JpcHRpb24gaW4KPiA+ICdk
cm1fZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyJwo+ID4gLi4vZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYzoxNjEzOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24KPiA+
IHBhcmFtZXRlciAnZHJtX2Nvbm5lY3RvcicgZGVzY3JpcHRpb24gaW4KPiA+ICdkcm1fZHBfbXN0
X2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyJwo+ID4gLi4vZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYzoxNTk0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIKPiA+IG9y
IG1lbWJlciAnY29ubmVjdG9yJyBub3QgZGVzY3JpYmVkIGluICdkcm1fZHBfbXN0X2Nvbm5lY3Rv
cl9sYXRlX3JlZ2lzdGVyJwo+ID4gLi4vZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYzoxNjE0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIKPiA+IG9yIG1lbWJlciAnY29u
bmVjdG9yJyBub3QgZGVzY3JpYmVkIGluCj4gPiAnZHJtX2RwX21zdF9jb25uZWN0b3JfZWFybHlf
dW5yZWdpc3RlcicKPiA+Cj4gPiBGaXhlczogNTYyODM2YTI2OWUzICgiZHJtL2RwX21zdDogRW5h
YmxlIHJlZ2lzdHJhdGlvbiBvZiBBVVggZGV2aWNlcyBmb3IgTVNUCj4gPiBwb3J0cyIpCj4gPiBD
YzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IENj
OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiA+IENjOiBMeXVkZSBQYXVsIDxseXVkZUBy
ZWRoYXQuY29tPgo+ID4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29t
Pgo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+Cj4gPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4K
PiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+IENjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYt
Ynk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gaW5kZXggZDNkNWZhNWU1MGUwLi44MmFkZDcz
NmUxN2QgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gPiBA
QCAtMTU3OSw3ICsxNTc5LDcgQEAgc3RhdGljIHZvaWQgYnVpbGRfbXN0X3Byb3BfcGF0aChjb25z
dCBzdHJ1Y3QKPiA+IGRybV9kcF9tc3RfYnJhbmNoICptc3RiLAo+ID4KPiA+ICAvKioKPiA+ICAg
KiBkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKCkgLSBMYXRlIE1TVCBjb25uZWN0
b3IgcmVnaXN0cmF0aW9uCj4gPiAtICogQGRybV9jb25uZWN0b3I6IFRoZSBNU1QgY29ubmVjdG9y
Cj4gPiArICogQGNvbm5lY3RvcjogVGhlIE1TVCBjb25uZWN0b3IKPiA+ICAgKiBAcG9ydDogVGhl
IE1TVCBwb3J0IGZvciB0aGlzIGNvbm5lY3Rvcgo+ID4gICAqCj4gPiAgICogSGVscGVyIHRvIHJl
Z2lzdGVyIHRoZSByZW1vdGUgYXV4IGRldmljZSBmb3IgdGhpcyBNU1QgcG9ydC4gRHJpdmVycwo+
ID4gc2hvdWxkCj4gPiBAQCAtMTYwMSw3ICsxNjAxLDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fZHBf
bXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKTsKPiA+Cj4gPiAgLyoqCj4gPiAgICogZHJtX2Rw
X21zdF9jb25uZWN0b3JfZWFybHlfdW5yZWdpc3RlcigpIC0gRWFybHkgTVNUIGNvbm5lY3Rvcgo+
ID4gdW5yZWdpc3RyYXRpb24KPiA+IC0gKiBAZHJtX2Nvbm5lY3RvcjogVGhlIE1TVCBjb25uZWN0
b3IKPiA+ICsgKiBAY29ubmVjdG9yOiBUaGUgTVNUIGNvbm5lY3Rvcgo+ID4gICAqIEBwb3J0OiBU
aGUgTVNUIHBvcnQgZm9yIHRoaXMgY29ubmVjdG9yCj4gPiAgICoKPiA+ICAgKiBIZWxwZXIgdG8g
dW5yZWdpc3RlciB0aGUgcmVtb3RlIGF1eCBkZXZpY2UgZm9yIHRoaXMgTVNUIHBvcnQsIHJlZ2lz
dGVyZWQKPiA+IGJ5Cj4gLS0KPiBDaGVlcnMsCj4gICAgICAgICBMeXVkZSBQYXVsCj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
