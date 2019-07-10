Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD3F65264
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163176E11A;
	Thu, 11 Jul 2019 07:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA028828C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 23:49:50 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id z75so1983979pgz.5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 16:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bdXtqqxh12gfpIhfLW0BOHj1xamqr81xRsaaifvH1jA=;
 b=P3Ne7BRRZOAojAfHts+VKwKZe925Gzy4/11VHiZyuTemcaaTArqWxWY32+hDyR25aq
 JEedzgt3uL7ugI9N47Y7k1+r/Dvg4CRkIEfoeizU664d5LTxZj3mELEuNb9TyNBYpDWg
 RYeIgFme3jF+MSTf6kDanGnGLMLmENaBI9TbhRQOi5ecV+I+9s4IpeCxcTSRRAyI4dzn
 f6xOaLEn4+4Rucbmz1q5kh9vlZDuhb7AuMGKJ4eBqNfuOT3dBGkjpIaNjuFeHZJfUYP8
 blw53Cwn8rqIOAP15lzSNleku6jdT4AeMAzVUOBxNQE6ripMbHdeL+Up9MJBgsvJj/nz
 rEqQ==
X-Gm-Message-State: APjAAAVQuNIc9+V2bkBN8HYR1qD0hGjVbEx7WUcUNKkInz4sTga2HVEd
 GM7Aa6RwIluCx0lF8Nf9wD0=
X-Google-Smtp-Source: APXvYqwRtOjO9X0OoS+6qzfe5qy8hqnHZVMH+ftWzgtOftn4Yt50WnEvvRSdLx7+oyw3gG7AjcEwsw==
X-Received: by 2002:a65:4841:: with SMTP id i1mr998306pgs.316.1562802589521;
 Wed, 10 Jul 2019 16:49:49 -0700 (PDT)
Received: from nishad (p3261240-ipngn21201hodogaya.kanagawa.ocn.ne.jp.
 [153.202.122.240])
 by smtp.gmail.com with ESMTPSA id x128sm7650140pfd.17.2019.07.10.16.49.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jul 2019 16:49:49 -0700 (PDT)
Date: Thu, 11 Jul 2019 05:19:42 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Phil Reid <preid@electromag.com.au>, gregkh@linuxfoundation.org,
 thomas.petazzoni@free-electrons.com, devel@driverdev.osuosl.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nsaenzjulienne@suse.de
Subject: Re: BUG: Staging: fbtft: Switch to the gpio descriptor interface
Message-ID: <20190710234940.GB29252@nishad>
References: <3ca02376-631b-d159-7070-7c50403126de@electromag.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ca02376-631b-d159-7070-7c50403126de@electromag.com.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bdXtqqxh12gfpIhfLW0BOHj1xamqr81xRsaaifvH1jA=;
 b=SnvyKqxvl+fvKR0+PjUifcGbb6pSDIrbMTS58kDSV8YT7OXiNbKXsVeJVg2HK188+L
 tChVd0+x6RADEjmenfa3I6KpEJkhlJ+YQ07qBMOAMK94FtgGzJS6EL1/vSG7oGkRf5mD
 E0Jl2k7JaQsBZO/L2agq/mEEglBbL6AMdHKkj4eH6gV5zEf5SNnX7myIX6yWWEgv6jOL
 poPt6Yhesg7askDUTQvE3uX+Yixbofm+fDHz6KIRYKS+yFArbBKxyxW5Vz7SFr6MkB/I
 8IAR+T/l15J7CiPl5709TQMnpfkLBNYYhPQafv0JjITR+hlj60KN1RJeovT3P+8ErufZ
 31Ow==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDQ6MzE6MDlQTSArMDgwMCwgUGhpbCBSZWlkIHdyb3Rl
Ogo+IEcnZGF5IE5pc2hhZCwKPiAKPiBJJ20ganVzdCB3b25kZXJpbmcgaWYgdGhlIGNvbW1pdAo+
IGM0NDBlZWUxYTdhMWQwZiAiU3RhZ2luZzogZmJ0ZnQ6IFN3aXRjaCB0byB0aGUgZ3BpbyBkZXNj
cmlwdG9yIGludGVyZmFjZSIKPiB3YXMgdGVzdGVkIG9uIGFueXRoaW5nLgo+IAo+IEkndmUgaGFk
IHRvIGFwcGx5IHRoZSBmb2xsb3dpbmcgcGF0Y2ggdG8gZ2V0IG15IGRpc3BsYXkgZnVuY3Rpb25p
bmcgYWdhaW4uCj4gCj4gaW4gcGFydGljdWxhciB0aGUgZGV2bV9ncGlvZF9nZXRfaW5kZXggdXNp
bmcgZGV2LT5kcml2ZXItPm5hbWUgZm9yIHRoZSBncGlvIGxvb2t1cCBzZWVtcwo+IHdyb25nLgo+
IAo+IEFsc28gSSd2ZSBoYWQgdG8gaW52ZXJ0IHRoZSBwb2xhcml0eSBvZiB0aGUgcmVzZXQtZ3Bp
b3MgaW4gdGhlIERUIGZpbGUgZm9yIHRoZSBkaXNwbGF5IHRvIGZ1bmN0aW9uLgo+IAo+IHRoaXMg
Y29kZToKPiAJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKHBhci0+Z3Bpby5yZXNldCwgMCk7Cj4g
CXVzbGVlcF9yYW5nZSgyMCwgNDApOwo+IAlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAocGFyLT5n
cGlvLnJlc2V0LCAxKTsKPiAKPiBjb3VsZCBiZSByZWFkIGFzIGRlYXNzZXJ0aW5nIHRoZSByZXNl
dCBsaW5lIGFuZCB0aGVuIGFzc2VydGluZyBpdC4KPiBTbyBJJ3ZlIGhhZCB0byBzcGVjaWZ5IGFu
ZCBhY3RpdmUgaGlnaCByZXNldCBsaW5lIGluIHRoZSBEVC4KPiAKPiBSZWdhcmRzCj4gUGhpbAo+
IApIZWxsbyBQaGlsLAoKVGhpcyBwYXRjaCB3YXMgb25seSBjb21waWxlZCBzdWNjZXNzZnVsbHku
CgpJdCBoYXNuJ3QgYmVlbiB0ZXN0ZWQgb24gYW55IGhhcmR3YXJlLgoKU29ycnkgZm9yIHRoZSBt
aXN0YWtlLgoKVGhhbmtzIGFuZCByZWdhcmRzLApOaXNoYWQKCj4gCj4gCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3JlLmMgYi9kcml2ZXJzL3N0YWdpbmcv
ZmJ0ZnQvZmJ0ZnQtY29yZS5jCj4gaW5kZXggOWIwN2JhZC4uNmZlN2NiNSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jCj4gKysrIGIvZHJpdmVycy9zdGFn
aW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYwo+IEBAIC03OSwxOCArNzksMTYgQEAgc3RhdGljIGludCBm
YnRmdF9yZXF1ZXN0X29uZV9ncGlvKHN0cnVjdCBmYnRmdF9wYXIgKnBhciwKPiAgCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+b2Zfbm9kZTsKPiAgCWludCByZXQgPSAwOwo+IAo+IC0J
aWYgKG9mX2ZpbmRfcHJvcGVydHkobm9kZSwgbmFtZSwgTlVMTCkpIHsKPiAtCQkqZ3Bpb3AgPSBk
ZXZtX2dwaW9kX2dldF9pbmRleChkZXYsIGRldi0+ZHJpdmVyLT5uYW1lLCBpbmRleCwKPiAtCQkJ
CQkgICAgICBHUElPRF9PVVRfSElHSCk7Cj4gLQkJaWYgKElTX0VSUigqZ3Bpb3ApKSB7Cj4gLQkJ
CXJldCA9IFBUUl9FUlIoKmdwaW9wKTsKPiAtCQkJZGV2X2VycihkZXYsCj4gLQkJCQkiRmFpbGVk
IHRvIHJlcXVlc3QgJXMgR1BJTzolZFxuIiwgbmFtZSwgcmV0KTsKPiAtCQkJcmV0dXJuIHJldDsK
PiAtCQl9Cj4gLQkJZmJ0ZnRfcGFyX2RiZyhERUJVR19SRVFVRVNUX0dQSU9TLCBwYXIsICIlczog
JyVzJyBHUElPXG4iLAo+IC0JCQkgICAgICBfX2Z1bmNfXywgbmFtZSk7Cj4gKwkqZ3Bpb3AgPSBk
ZXZtX2dwaW9kX2dldF9pbmRleF9vcHRpb25hbChkZXYsIG5hbWUsIGluZGV4LAo+ICsJCQkJICAg
ICAgR1BJT0RfT1VUX0hJR0gpOwo+ICsJaWYgKElTX0VSUigqZ3Bpb3ApKSB7Cj4gKwkJcmV0ID0g
UFRSX0VSUigqZ3Bpb3ApOwo+ICsJCWRldl9lcnIoZGV2LAo+ICsJCQkiRmFpbGVkIHRvIHJlcXVl
c3QgJXMgR1BJTzogKCVkKVxuIiwgbmFtZSwgcmV0KTsKPiArCQlyZXR1cm4gcmV0Owo+ICAJfQo+
ICsJZmJ0ZnRfcGFyX2RiZyhERUJVR19SRVFVRVNUX0dQSU9TLCBwYXIsICIlczogJyVzJyBHUElP
XG4iLAo+ICsJCSAgICAgIF9fZnVuY19fLCBuYW1lKTsKPiAKPiAgCXJldHVybiByZXQ7Cj4gIH0K
PiBAQCAtMTAzLDM0ICsxMDEsMzQgQEAgc3RhdGljIGludCBmYnRmdF9yZXF1ZXN0X2dwaW9zX2R0
KHN0cnVjdCBmYnRmdF9wYXIgKnBhcikKPiAgCWlmICghcGFyLT5pbmZvLT5kZXZpY2UtPm9mX25v
ZGUpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gCj4gLQlyZXQgPSBmYnRmdF9yZXF1ZXN0X29uZV9n
cGlvKHBhciwgInJlc2V0LWdwaW9zIiwgMCwgJnBhci0+Z3Bpby5yZXNldCk7Cj4gKwlyZXQgPSBm
YnRmdF9yZXF1ZXN0X29uZV9ncGlvKHBhciwgInJlc2V0IiwgMCwgJnBhci0+Z3Bpby5yZXNldCk7
Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gLQlyZXQgPSBmYnRmdF9yZXF1ZXN0X29u
ZV9ncGlvKHBhciwgImRjLWdwaW9zIiwgMCwgJnBhci0+Z3Bpby5kYyk7Cj4gKwlyZXQgPSBmYnRm
dF9yZXF1ZXN0X29uZV9ncGlvKHBhciwgImRjIiwgMCwgJnBhci0+Z3Bpby5kYyk7Cj4gIAlpZiAo
cmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gLQlyZXQgPSBmYnRmdF9yZXF1ZXN0X29uZV9ncGlvKHBh
ciwgInJkLWdwaW9zIiwgMCwgJnBhci0+Z3Bpby5yZCk7Cj4gKwlyZXQgPSBmYnRmdF9yZXF1ZXN0
X29uZV9ncGlvKHBhciwgInJkIiwgMCwgJnBhci0+Z3Bpby5yZCk7Cj4gIAlpZiAocmV0KQo+ICAJ
CXJldHVybiByZXQ7Cj4gLQlyZXQgPSBmYnRmdF9yZXF1ZXN0X29uZV9ncGlvKHBhciwgIndyLWdw
aW9zIiwgMCwgJnBhci0+Z3Bpby53cik7Cj4gKwlyZXQgPSBmYnRmdF9yZXF1ZXN0X29uZV9ncGlv
KHBhciwgIndyIiwgMCwgJnBhci0+Z3Bpby53cik7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiBy
ZXQ7Cj4gLQlyZXQgPSBmYnRmdF9yZXF1ZXN0X29uZV9ncGlvKHBhciwgImNzLWdwaW9zIiwgMCwg
JnBhci0+Z3Bpby5jcyk7Cj4gKwlyZXQgPSBmYnRmdF9yZXF1ZXN0X29uZV9ncGlvKHBhciwgImNz
IiwgMCwgJnBhci0+Z3Bpby5jcyk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gLQly
ZXQgPSBmYnRmdF9yZXF1ZXN0X29uZV9ncGlvKHBhciwgImxhdGNoLWdwaW9zIiwgMCwgJnBhci0+
Z3Bpby5sYXRjaCk7Cj4gKwlyZXQgPSBmYnRmdF9yZXF1ZXN0X29uZV9ncGlvKHBhciwgImxhdGNo
IiwgMCwgJnBhci0+Z3Bpby5sYXRjaCk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4g
IAlmb3IgKGkgPSAwOyBpIDwgMTY7IGkrKykgewo+IC0JCXJldCA9IGZidGZ0X3JlcXVlc3Rfb25l
X2dwaW8ocGFyLCAiZGItZ3Bpb3MiLCBpLAo+ICsJCXJldCA9IGZidGZ0X3JlcXVlc3Rfb25lX2dw
aW8ocGFyLCAiZGIiLCBpLAo+ICAJCQkJCSAgICAgJnBhci0+Z3Bpby5kYltpXSk7Cj4gIAkJaWYg
KHJldCkKPiAgCQkJcmV0dXJuIHJldDsKPiAtCQlyZXQgPSBmYnRmdF9yZXF1ZXN0X29uZV9ncGlv
KHBhciwgImxlZC1ncGlvcyIsIGksCj4gKwkJcmV0ID0gZmJ0ZnRfcmVxdWVzdF9vbmVfZ3Bpbyhw
YXIsICJsZWQiLCBpLAo+ICAJCQkJCSAgICAgJnBhci0+Z3Bpby5sZWRbaV0pOwo+ICAJCWlmIChy
ZXQpCj4gIAkJCXJldHVybiByZXQ7Cj4gLQkJcmV0ID0gZmJ0ZnRfcmVxdWVzdF9vbmVfZ3Bpbyhw
YXIsICJhdXgtZ3Bpb3MiLCBpLAo+ICsJCXJldCA9IGZidGZ0X3JlcXVlc3Rfb25lX2dwaW8ocGFy
LCAiYXV4IiwgaSwKPiAgCQkJCQkgICAgICZwYXItPmdwaW8uYXV4W2ldKTsKPiAgCQlpZiAocmV0
KQo+ICAJCQlyZXR1cm4gcmV0Owo+IAo+IAo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
