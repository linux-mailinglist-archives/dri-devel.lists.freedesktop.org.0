Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D8A7563A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 19:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450296E7EC;
	Thu, 25 Jul 2019 17:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD5C6E7EA;
 Thu, 25 Jul 2019 17:51:04 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m10so50988719edv.6;
 Thu, 25 Jul 2019 10:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rLx1WxxS2eiFupzGOfH7X3JpoyBVgunYKBsWNt5yLUw=;
 b=Vc1v0btMWgZGT4smP4HtuT1uMwawk0g73aHEbhtEHMkagaiLgoORfPkpWheEJLB5Ec
 c3GxHdVvJK5iweGgjjoVmyqTeUn+EcdCyAM8Z+dLDOLTHxFPiczC5GtZyQjEYYPOT9uo
 /2zZUs8poVWI6EtwZZXjgSr9KwQpajJNXAHGGWfPcw06pHc9dmn1JQ7Clie2ubNCDlNu
 NzRiHASgq8UdE3PBgf66m4dZzAn6BQdDf7dRvXFEV6gfepNh7l4H3Xglm21/D+wf5CWI
 7IMXrC2/+wfKpruSgcXrYlOLkslYeyFVmworIE9qpFqzZ84lkfDhwSjGf2Z3XKga1LA6
 jrxQ==
X-Gm-Message-State: APjAAAXJC9iUt7CFG6605r0MJCkTRIy6vIciuTZX2r60T7l6u0z3yH71
 3K1RStvMLVz8Ghnus/nIp+OiiysCCulVJJEgUEM=
X-Google-Smtp-Source: APXvYqx0hq85a8gR6SvZiwDeUgHmw4HBnllzoppGUeegEPb0sAcSwB9g+0T/RlSOGs1+9qmJErJLRLdvNOJgJ7TKSlg=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr70131087ejj.192.1564077063087; 
 Thu, 25 Jul 2019 10:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <1564073588-27386-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1564073588-27386-1-git-send-email-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 25 Jul 2019 10:50:51 -0700
Message-ID: <CAF6AEGus9DtNou8KHaVK=_-mgc5JYH=cVoiTABsm=jBkXo2v2w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Annotate intentional switch statement fall
 throughs
To: Jordan Crouse <jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rLx1WxxS2eiFupzGOfH7X3JpoyBVgunYKBsWNt5yLUw=;
 b=bCgV0Y0KK+hZmQcR1Ije8gmw+VFkvFkFIk7n6PTSK4+JTJutIG+r8glT/WEdzuFC10
 O3KQ4Siab33aiSEyEsyVYzHGz/nsrTIerU+zKakzfKJf4AMYChTdkwaNgn70ISdnNF3c
 TLSUlrxjEMfU+AYpWgjfD92PU+aG7Wdh4ZlNR0UEV+INBwHfjkgCfyqB3c9aQxux/GIF
 /JNsbzuvL4tYp+0BsS2aeaToEyI8t1OuTNiG9EtNGBpV3IviSxEx6Jkv2tedyJlpVIMf
 bJc+oDf9i99jxX1rArWlfw4m4NL/MpETs01X74VX5XoLRBZE/jAVi7B0aYpWfHywarah
 jvlA==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Kees Cook <keescook@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgOTo1MyBBTSBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNv
ZGVhdXJvcmEub3JnPiB3cm90ZToKPgo+IEV4cGxpY2l0bHkgbWFyayBpbnRlbnRpb25hbCBmYWxs
IHRocm91Z2hzIGluIHN3aXRjaCBzdGF0ZW1lbnRzIHRvIGtlZXAKPiAtV2ltcGxpY2l0LWZhbGx0
aHJvdWdoIGZyb20gY29tcGxhaW5pbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNl
IDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgoKUmV2aWV3ZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNs
YXJrQGdtYWlsLmNvbT4KCj4gLS0tCj4KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4
eF9ncHUuYyAgIHwgMiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5j
ICAgfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jIHwgMSAr
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E1eHhfZ3B1LmMKPiBpbmRleCAxNjcxZGI0Li5lOWM1NWQxIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jCj4gQEAgLTU5LDYgKzU5LDcgQEAgc3RhdGljIHZv
aWQgYTV4eF9zdWJtaXRfaW5fcmIoc3RydWN0IG1zbV9ncHUgKmdwdSwgc3RydWN0IG1zbV9nZW1f
c3VibWl0ICpzdWJtaXQKPiAgICAgICAgICAgICAgICAgY2FzZSBNU01fU1VCTUlUX0NNRF9DVFhf
UkVTVE9SRV9CVUY6Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHByaXYtPmxhc3RjdHgg
PT0gY3R4KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgLyogZmFsbC10aHJ1ICovCj4gICAgICAgICAgICAgICAgIGNhc2Ug
TVNNX1NVQk1JVF9DTURfQlVGOgo+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIGNvcHkgY29t
bWFuZHMgaW50byBSQjogKi8KPiAgICAgICAgICAgICAgICAgICAgICAgICBvYmogPSBzdWJtaXQt
PmJvc1tzdWJtaXQtPmNtZFtpXS5pZHhdLm9iajsKPiBAQCAtMTQ5LDYgKzE1MCw3IEBAIHN0YXRp
YyB2b2lkIGE1eHhfc3VibWl0KHN0cnVjdCBtc21fZ3B1ICpncHUsIHN0cnVjdCBtc21fZ2VtX3N1
Ym1pdCAqc3VibWl0LAo+ICAgICAgICAgICAgICAgICBjYXNlIE1TTV9TVUJNSVRfQ01EX0NUWF9S
RVNUT1JFX0JVRjoKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocHJpdi0+bGFzdGN0eCA9
PSBjdHgpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAvKiBmYWxsLXRocnUgKi8KPiAgICAgICAgICAgICAgICAgY2FzZSBN
U01fU1VCTUlUX0NNRF9CVUY6Cj4gICAgICAgICAgICAgICAgICAgICAgICAgT1VUX1BLVDcocmlu
ZywgQ1BfSU5ESVJFQ1RfQlVGRkVSX1BGRSwgMyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
T1VUX1JJTkcocmluZywgbG93ZXJfMzJfYml0cyhzdWJtaXQtPmNtZFtpXS5pb3ZhKSk7Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCj4gaW5kZXggYmUzOWNmMC4uZGM4ZWMyYyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYwo+IEBAIC0xMTUsNiArMTE1
LDcgQEAgc3RhdGljIHZvaWQgYTZ4eF9zdWJtaXQoc3RydWN0IG1zbV9ncHUgKmdwdSwgc3RydWN0
IG1zbV9nZW1fc3VibWl0ICpzdWJtaXQsCj4gICAgICAgICAgICAgICAgIGNhc2UgTVNNX1NVQk1J
VF9DTURfQ1RYX1JFU1RPUkVfQlVGOgo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwcml2
LT5sYXN0Y3R4ID09IGN0eCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFr
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qIGZhbGwtdGhydSAqLwo+ICAgICAgICAgICAg
ICAgICBjYXNlIE1TTV9TVUJNSVRfQ01EX0JVRjoKPiAgICAgICAgICAgICAgICAgICAgICAgICBP
VVRfUEtUNyhyaW5nLCBDUF9JTkRJUkVDVF9CVUZGRVJfUEZFLCAzKTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBPVVRfUklORyhyaW5nLCBsb3dlcl8zMl9iaXRzKHN1Ym1pdC0+Y21kW2ldLmlv
dmEpKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dw
dS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jCj4gaW5kZXggOWFj
YmJjMC4uMDQ4YzhiZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9h
ZHJlbm9fZ3B1LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1
LmMKPiBAQCAtNDI4LDYgKzQyOCw3IEBAIHZvaWQgYWRyZW5vX3N1Ym1pdChzdHJ1Y3QgbXNtX2dw
dSAqZ3B1LCBzdHJ1Y3QgbXNtX2dlbV9zdWJtaXQgKnN1Ym1pdCwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBpZ25vcmUgaWYgdGhlcmUgaGFzIG5vdCBiZWVuIGEgY3R4IHN3aXRjaDogKi8K
PiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocHJpdi0+bGFzdGN0eCA9PSBjdHgpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAvKiBmYWxsLXRocnUgKi8KPiAgICAgICAgICAgICAgICAgY2FzZSBNU01fU1VCTUlUX0NN
RF9CVUY6Cj4gICAgICAgICAgICAgICAgICAgICAgICAgT1VUX1BLVDMocmluZywgYWRyZW5vX2lz
X2E0MzAoYWRyZW5vX2dwdSkgPwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1Bf
SU5ESVJFQ1RfQlVGRkVSX1BGRSA6IENQX0lORElSRUNUX0JVRkZFUl9QRkQsIDIpOwo+IC0tCj4g
Mi43LjQKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
