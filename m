Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5C21B2745
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37136E944;
	Tue, 21 Apr 2020 13:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9EF6E944
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 13:13:46 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id z25so7640425otq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YlxjgspNunrfrC6NNbMMVB3qzTYF1uquYhmftbkU6do=;
 b=VWc31S/68E3xAQ/jOEHi0bcafVvhySzvV8iKftcrOdAPUT9NCxCDkY+D8VaVxzwIRn
 bx2PfuqzLww+0REqkZmW9PvJ7Bc/EX4ZeH9/ME3wOY+o+3JVtFeRTIMm8v+LtzhjcDkp
 +IvZHtvt9nyIn1DdilKG02UjvuAGWKzsathnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YlxjgspNunrfrC6NNbMMVB3qzTYF1uquYhmftbkU6do=;
 b=JvqxoY50/hySewyop6KoM5A8Q8vYR6vWybbXoMcxI1CI3bKUgLrJF7CqgMZQ9DJJ+0
 kRu+XO4oapANqyFPVwi2hDPWq+onzdhUS+pLzyDFMNRIX3Ast583yzx1v/1FNpJhhcQx
 cwiofDtA1rtqIQTNM0Yy2hKZekbfpVAY1J5bUXrVDdqEdDZzCPXWxnDYfI6e11C6WM0o
 rwNlEtU+NqA6PueX1HIfdmqHimF1YCs4/SFoxRMajU7X+0hywhGSQBpiT745C/TyC+mW
 bKyALJfgbYIeICMTmJGL/sc6AmydV0q4iTZN8yZfhL3klLr4mxvgJK13R/NxoIv0Xp5X
 IbEA==
X-Gm-Message-State: AGi0PuZa2RWAyIOPRSYq0Kek30eksQN/ZC0KNre8QEtFYxBrsOdRedA6
 tvpaSk5VQy+mc3BBiCVJeHa0R+Am0R3HMnXnnDQIMw5Z
X-Google-Smtp-Source: APiQypKphNFKRXKHEVwIZIclknzfA168NkS9Jst+cejDCg5pFWb85t9d50nAIhAm05m2iN/9CKXHITkxXxTkOJAtVpQ=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr13999255ota.281.1587474825302; 
 Tue, 21 Apr 2020 06:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200421124922.136191-1-michal@hardline.pl>
In-Reply-To: <20200421124922.136191-1-michal@hardline.pl>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 21 Apr 2020 15:13:34 +0200
Message-ID: <CAKMK7uGrhzMYDQyE0SigfyVs03M5nhPhXRP_eatTW0pj0itz_A@mail.gmail.com>
Subject: Re: [PATCH] drm: Don't reserve minors for control nodes
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal@hardline.pl>
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
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjEsIDIwMjAgYXQgMjo1MCBQTSBNaWNoYcWCIFdpbmlhcnNraSA8bWljaGFs
QGhhcmRsaW5lLnBsPiB3cm90ZToKPgo+IEZyb206IE1pY2hhxYIgV2luaWFyc2tpIDxtaWNoYWwu
d2luaWFyc2tpQGludGVsLmNvbT4KPgo+IENvbnRyb2wgbm9kZXMgYXJlIG5vIGxvbmdlciB3aXRo
IHVzLgo+IFdoaWxlIHdlIHN0aWxsIG5lZWQgdG8gcHJlc2VydmUgcmVuZGVyIG5vZGVzIG51bWJl
cmluZywgdGhlcmUncyBubyBuZWVkCj4gdG8gcmVzZXJ2ZSB0aGUgcmFuZ2UgZm9ybWVybHkgdXNl
ZCBmb3IgY29udHJvbC4gTGV0J3MgcmVwdXJwb3NlIGl0IHRvIGJlCj4gdXNlZCBieSBwcmltYXJ5
IGFuZCByZW1vdmUgY29udHJvbCByZW1haW5zIGZyb20gdGhlIGNvZGUgZW50aXJlbHkuCj4KPiBS
ZWZlcmVuY2VzOiAwZDQ5ZjMwM2U4YTcgKCJkcm06IHJlbW92ZSBhbGwgY29udHJvbCBub2RlIGNv
ZGUiKQo+IFJlZmVyZW5jZXM6IGM5YWMzNzFkNGI1OSAoImRybTogRml4IHJlbmRlciBub2RlIG51
bWJlcmluZyByZWdyZXNzaW9uIGZyb20gY29udHJvbCBub2RlIHJlbW92YWwuIikKPiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYcWCIFdpbmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+Cj4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IEVyaWMgQW5o
b2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gQ2M6IE1hcmNpbiBCZXJuYXRvd2ljeiA8bWFyY2luLmJl
cm5hdG93aWN6QGludGVsLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5v
cmc+CgpTbyBzb21lb25lIHBsdWdnZWQgaW4gMjU2ayBncHVzIGluIGEgc2luZ2xlIG1hY2hpbmUg
YW5kIHdlJ3ZlIHJ1biBvdXQKb2YgbWlub3JzPyBPciB3aHkgZG8gd2UgbmVlZCB0aGlzPwoKKFRo
ZXJlJ3MgMjAgYml0cyBhbGxvY2F0ZWQgdG8gdGhlIG1pbm9yLCBhbmQgd2UgcHJlLXJlc2VydmUg
MiBiaXRzIGZvcgp0aGUgZGlmZmVyZW50IGZsYXZvdXJzLCB3aGljaCB0aGlzIHBhdGNoIHJlZHVj
ZXMgdG8gMSBiaXQpLgoKSSdtIGFza2luZyBzaW5jZSB3ZSBtaWdodCBoYXZlIHNvbWUgdXNlcnNw
YWNlIHNvbWV3aGVyZSB3aGljaApoYXJkY29kZXMgdGhpcyBhbmQgZ2V0cyBzdXJwcmlzZWQuIEFu
ZCBJIGtpbmRhIGRvbid0IHdhbnQgdG8gYXVkaXQgdGhlCndvcmxkIC4uLiBTbyBJJ20gd29uZGVy
aW5nIHdoYXQgdGhlIG1vdGl2YXRpb24gaGVyZSBpcy4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9kcnYuYyB8IDQgKystLQo+ICBpbmNsdWRlL2RybS9kcm1fZmlsZS5oICAg
IHwgMSAtCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2Rydi5jCj4gaW5kZXggYzE1YzliNDU0MGUxLi4zNjZhNzYwYmJjMjkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHJ2LmMKPiBAQCAtMTI0LDggKzEyNCw4IEBAIHN0YXRpYyBpbnQgZHJtX21pbm9yX2Fs
bG9jKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCB0eXBlKQo+ICAgICAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJmRybV9taW5vcl9sb2NrLCBmbGFncyk7Cj4gICAgICAgICByID0g
aWRyX2FsbG9jKCZkcm1fbWlub3JzX2lkciwKPiAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwK
PiAtICAgICAgICAgICAgICAgICAgICAgNjQgKiB0eXBlLAo+IC0gICAgICAgICAgICAgICAgICAg
ICA2NCAqICh0eXBlICsgMSksCj4gKyAgICAgICAgICAgICAgICAgICAgIDEyOCAqIHR5cGUsCj4g
KyAgICAgICAgICAgICAgICAgICAgIDEyOCAqICh0eXBlICsgMSksCj4gICAgICAgICAgICAgICAg
ICAgICAgIEdGUF9OT1dBSVQpOwo+ICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHJt
X21pbm9yX2xvY2ssIGZsYWdzKTsKPiAgICAgICAgIGlkcl9wcmVsb2FkX2VuZCgpOwo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZmlsZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAo+
IGluZGV4IDcxNjk5MGJhY2UxMC4uNDVlNmRhZTY5MjkzIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
ZHJtL2RybV9maWxlLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZmlsZS5oCj4gQEAgLTU0LDcg
KzU0LDYgQEAgc3RydWN0IGZpbGU7Cj4gICAqLwo+ICBlbnVtIGRybV9taW5vcl90eXBlIHsKPiAg
ICAgICAgIERSTV9NSU5PUl9QUklNQVJZLAo+IC0gICAgICAgRFJNX01JTk9SX0NPTlRST0wsCj4g
ICAgICAgICBEUk1fTUlOT1JfUkVOREVSLAo+ICB9Owo+Cj4gLS0KPiAyLjI2LjAKPgoKCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDAp
IDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
