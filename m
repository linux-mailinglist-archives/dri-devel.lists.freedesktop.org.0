Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD84717CD92
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A036E187;
	Sat,  7 Mar 2020 10:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B9D6E043
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 17:36:45 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id ay11so1150029plb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 09:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0th24Aw7poXV2kDwcH+eb4lyzzSHKTu9OdyFQYJbKkY=;
 b=urjBIsmYRvK1sp8Bv2kbwI4OZeXV5hOijJXEOX5UUfyVmfgn7n76vk1GDm8S56Klct
 AaTMpGvZ5HE4TwifQAa/d0/6Oz5R5P/W17mv+pPW/uOahjODGheCXtDXwSh+8bTTQklL
 39OQbbiYsxrC9XR3fSPlFJEm50zA73I0umb0i+QeJ+vPctKceXvOFv/zMlgD9JkvXCcN
 FaE25ev7o8HC7e+HtWK93b82PcMqTpjHJUAmZuWwu2nhy43aTeN4gi0OOSmap2ksWZIJ
 ydbMol/irvq4q+i1Bb0nmMUKko59rFUKroUkKOiOtPv1CdWDxvSXX1OpGqQ5EkykeszI
 WKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0th24Aw7poXV2kDwcH+eb4lyzzSHKTu9OdyFQYJbKkY=;
 b=Jj2TSZH9OSW2xKarpG6Wk0rWpk8rPkHJlVqnwCGeJg+FaqSoG5+oD7iNL0z7z5xgYg
 zBe1l6D5mwUeuDhigyid9f+VhtPePJatnB2NNntrX69lygFetMESJHBEiODm8qokTXkn
 /rDrcSbw19uyPMoYkxBnz4NMrjMgfJ/v4ro/gkP3P/b+GZVt7mrO98/yNJIVbYxEWAKo
 7W9D84/C/GZI5+cnYcFseMcg5Zf+UuyILJXOWnayb99tlikD0TQxbEVqiJY2zb3NKQ8g
 Zmyp1GMidJCwuGpbvy9iTAekH9lN+3M0VFULCcCtrxzqjOgfP/GlQb+2RfbeFJY8ZDBK
 RwTw==
X-Gm-Message-State: ANhLgQ3kdbeeWfCTxjBpUtxdhN0Huxenv4JMJgX7NZOH4VM2sStKCqWx
 y8x8nddsqjcAdpqWJX8HMli/TzGFZIkY/gmI8ArhkA==
X-Google-Smtp-Source: ADFU+vt9a6IY6oRt2STnFrh2CYGkjgjagZGDV8DawLnE5rRIkjzRpQekuW+IE2ZLZ5P/ZYvUs8+Q6nesz6drxHr/5Bs=
X-Received: by 2002:a17:90a:1f8d:: with SMTP id
 x13mr4795428pja.27.1583516201411; 
 Fri, 06 Mar 2020 09:36:41 -0800 (PST)
MIME-Version: 1.0
References: <202003060930.DDCCB6659@keescook>
In-Reply-To: <202003060930.DDCCB6659@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Mar 2020 09:36:30 -0800
Message-ID: <CAKwvOdn4q4OWzvhAMHFf441DNrmO00ye_H_MnoegP7jw3YAWqA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/edid: Distribute switch variables for
 initialization
To: Kees Cook <keescook@chromium.org>
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgNiwgMjAyMCBhdCA5OjMyIEFNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPiB3cm90ZToKPgo+IFZhcmlhYmxlcyBkZWNsYXJlZCBpbiBhIHN3aXRjaCBzdGF0ZW1l
bnQgYmVmb3JlIGFueSBjYXNlIHN0YXRlbWVudHMKPiBjYW5ub3QgYmUgYXV0b21hdGljYWxseSBp
bml0aWFsaXplZCB3aXRoIGNvbXBpbGVyIGluc3RydW1lbnRhdGlvbiAoYXMKPiB0aGV5IGFyZSBu
b3QgcGFydCBvZiBhbnkgZXhlY3V0aW9uIGZsb3cpLiBXaXRoIEdDQydzIHByb3Bvc2VkIGF1dG9t
YXRpYwo+IHN0YWNrIHZhcmlhYmxlIGluaXRpYWxpemF0aW9uIGZlYXR1cmUsIHRoaXMgdHJpZ2dl
cnMgYSB3YXJuaW5nIChhbmQgdGhleQo+IGRvbid0IGdldCBpbml0aWFsaXplZCkuIENsYW5nJ3Mg
YXV0b21hdGljIHN0YWNrIHZhcmlhYmxlIGluaXRpYWxpemF0aW9uCj4gKHZpYSBDT05GSUdfSU5J
VF9TVEFDS19BTEw9eSkgZG9lc24ndCB0aHJvdyBhIHdhcm5pbmcsIGJ1dCBpdCBhbHNvCj4gZG9l
c24ndCBpbml0aWFsaXplIHN1Y2ggdmFyaWFibGVzWzFdLiBOb3RlIHRoYXQgdGhlc2Ugd2Fybmlu
Z3MgKG9yIHNpbGVudAoKVGhhdCdzIG5vdCBnb29kLCBoYXZlIHlvdSBmaWxlZCBhIGJ1ZyBhZ2Fp
bnN0IENsYW5nIHlldD8gIEl0IHNob3VsZCBhdApsZWFzdCB3YXJuIHdoZW4gdGhlIGNvcnJlc3Bv
bmRpbmcgc3RhY2sgaW5pdCBmbGFnIGlzIHNldC4KCj4gc2tpcHBpbmcpIGhhcHBlbiBiZWZvcmUg
dGhlIGRlYWQtc3RvcmUgZWxpbWluYXRpb24gb3B0aW1pemF0aW9uIHBoYXNlLAo+IHNvIGV2ZW4g
d2hlbiB0aGUgYXV0b21hdGljIGluaXRpYWxpemF0aW9ucyBhcmUgbGF0ZXIgZWxpZGVkIGluIGZh
dm9yIG9mCj4gZGlyZWN0IGluaXRpYWxpemF0aW9ucywgdGhlIHdhcm5pbmdzIHJlbWFpbi4KPgo+
IFRvIGF2b2lkIHRoZXNlIHByb2JsZW1zLCBsaWZ0IHN1Y2ggdmFyaWFibGVzIHVwIGludG8gdGhl
IG5leHQgY29kZQo+IGJsb2NrLgo+Cj4gZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmM6IEluIGZ1
bmN0aW9uIOKAmGRybV9lZGlkX3RvX2VsZOKAmToKPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
Yzo0Mzk1Ojk6IHdhcm5pbmc6IHN0YXRlbWVudCB3aWxsIG5ldmVyIGJlCj4gZXhlY3V0ZWQgWy1X
c3dpdGNoLXVucmVhY2hhYmxlXQo+ICA0Mzk1IHwgICAgIGludCBzYWRfY291bnQ7Cj4gICAgICAg
fCAgICAgICAgIF5+fn5+fn5+fgo+Cj4gWzFdIGh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9NDQ5MTYKPgo+IFNpZ25lZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hy
b21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bn
b29nbGUuY29tPgoKPiAtLS0KPiB2MjogbW92ZSBpbnRvIGZ1bmN0aW9uIGJsb2NrIGluc3RlYWQg
YmVpbmcgc3dpdGNoLWxvY2FsIChWaWxsZSBTeXJqw6Rsw6QpCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBpbmRleCA4MDVmYjAwNGM4ZWIuLjQ2
Y2VlNzhiYzE3NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gQEAgLTQzODEsNiArNDM4MSw3IEBAIHN0
YXRpYyB2b2lkIGRybV9lZGlkX3RvX2VsZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
LCBzdHJ1Y3QgZWRpZCAqZWRpZCkKPgo+ICAgICAgICAgaWYgKGNlYV9yZXZpc2lvbihjZWEpID49
IDMpIHsKPiAgICAgICAgICAgICAgICAgaW50IGksIHN0YXJ0LCBlbmQ7Cj4gKyAgICAgICAgICAg
ICAgIGludCBzYWRfY291bnQ7Cj4KPiAgICAgICAgICAgICAgICAgaWYgKGNlYV9kYl9vZmZzZXRz
KGNlYSwgJnN0YXJ0LCAmZW5kKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ0ID0g
MDsKPiBAQCAtNDM5Miw4ICs0MzkzLDYgQEAgc3RhdGljIHZvaWQgZHJtX2VkaWRfdG9fZWxkKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIHN0cnVjdCBlZGlkICplZGlkKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGRibCA9IGNlYV9kYl9wYXlsb2FkX2xlbihkYik7Cj4KPiAgICAg
ICAgICAgICAgICAgICAgICAgICBzd2l0Y2ggKGNlYV9kYl90YWcoZGIpKSB7Cj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgc2FkX2NvdW50Owo+IC0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBjYXNlIEFVRElPX0JMT0NLOgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLyogQXVkaW8gRGF0YSBCbG9jaywgY29udGFpbnMgU0FEcyAqLwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc2FkX2NvdW50ID0gbWluKGRibCAvIDMsIDE1IC0gdG90YWxf
c2FkX2NvdW50KTsKPiAtLQo+IDIuMjAuMQo+Cj4KPiAtLQo+IEtlZXMgQ29vawo+Cj4gLS0KPiBZ
b3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRo
ZSBHb29nbGUgR3JvdXBzICJDbGFuZyBCdWlsdCBMaW51eCIgZ3JvdXAuCj4gVG8gdW5zdWJzY3Jp
YmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2Vu
ZCBhbiBlbWFpbCB0byBjbGFuZy1idWlsdC1saW51eCt1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tLgo+IFRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6Ly9n
cm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2NsYW5nLWJ1aWx0LWxpbnV4LzIwMjAwMzA2MDkzMC5E
RENDQjY2NTklNDBrZWVzY29vay4KCgoKLS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
