Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2314334D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AF189242;
	Thu, 13 Jun 2019 07:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFD8893B8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:25:10 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id p1so6336392plo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nBMA4cy81IvwlogUNVTSbkNxTIWioniCIzkx/8GVX+Q=;
 b=Pe0JW6Q0PI1QHG0V/ELwFkC9cWkiPyabdzjKsaCdSxD/BdYCIznlmDfdW0tGUHne1k
 gbXs+o59/7bDTZHA199WbUftnTz5lIMrv7zdlmvUCHmz7c+p6OcludW3z0XqsrbKNxHS
 X+NeHJrWWaoFdX3TgpJA8IrByzruuFs4En0C+4MX09N9lpuL9TxIkmWoaaPTeXo8uiTM
 2ia57yKJ6fPYDV/bpS7uCN0wP+sErPO9Iwqbi97sUL3dZNcaSJqJsC2IKNOvXykoqXzb
 AHhj/0eHcyAtoGxRSlxKpWrY68+tj5gPZE/OnDm1K+o/OVVRXjcp9lVS1AGYnZk3v7wp
 t24g==
X-Gm-Message-State: APjAAAVf2V6M/BtayGpE6ie+etD3MlmI76hoQzPAnPihuQQtlKAUtFJC
 G5esgDR2i6qOTmz8smD7JB7CJA==
X-Google-Smtp-Source: APXvYqybHOJE7k4tfvCUarMEbtrPs2q8NhhT6+odOFeOUT79YnY1t55lTWzVNvdYsbZaV/wXb2zhrA==
X-Received: by 2002:a17:902:b705:: with SMTP id
 d5mr44986119pls.274.1560327909598; 
 Wed, 12 Jun 2019 01:25:09 -0700 (PDT)
Received: from localhost ([122.172.66.84])
 by smtp.gmail.com with ESMTPSA id s7sm1822824pgm.8.2019.06.12.01.25.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 01:25:08 -0700 (PDT)
Date: Wed, 12 Jun 2019 13:55:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [RFC v2 01/11] OPP: Don't overwrite rounded clk rate
Message-ID: <20190612082506.m735bsk7bjijf2yg@vireshk-i7>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-2-rnayak@codeaurora.org>
 <20190611105432.x3nzqiib35t6mvyg@vireshk-i7>
 <c173a57d-a4de-99f7-e8d8-28a7612f4ca3@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c173a57d-a4de-99f7-e8d8-28a7612f4ca3@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nBMA4cy81IvwlogUNVTSbkNxTIWioniCIzkx/8GVX+Q=;
 b=a+wJjnuAGmyci01wUJwpOo66LfzQLqVmU/rrqkPsB3+Osld40BrLicEQEtRHLj3/qC
 EZlN08bV7dBSutV/DWuhnaeLl99pieDgvwVhqLl7e4muSznARw3f8OB7w75ZVNc+D74f
 6EdbLqHlmtygqDMpa1asruqhvOUlnPCdo4tBsXhAT+65UQDs0y3TNl9YSoPIRd/GVsFx
 XmjVGdH64Mz7adJ1rRtE/3IIhYb0nEDeEKH8Oa+5FELjylx8AK8m9Pr1RY6z8UpX5/kR
 OKJPRv9d4GhdHU/JZe5egfRf0LkDTKONpMhLBLNPl5rLGDpO4dfMwcsW4KM3IutaQ1ip
 QDMA==
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
Cc: ulf.hansson@linaro.org, dianders@chromium.org, linux-scsi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, swboyd@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTItMDYtMTksIDEzOjEyLCBSYWplbmRyYSBOYXlhayB3cm90ZToKPiBzbyB0aGUgJ2ZtYXgn
IHRhYmxlcyBiYXNpY2FsbHkgc2F5IHdoYXQgdGhlIG1heCBmcmVxdWVuY3kgdGhlIGRldmljZSBj
YW4KPiBvcGVyYXRlIGF0IGZvciBhIGdpdmVuIHBlcmZvcm1hbmNlIHN0YXRlL3ZvbHRhZ2UgbGV2
ZWwuCj4gCj4gc28gaW4geW91ciBleGFtcGxlIGl0IHdvdWxkIGJlIGZvciBpbnN0YW5jZQo+IAo+
IDUwME0sIFBlcmYgc3RhdGUgPSAyCj4gMUcsIFBlcmYgc3RhdGUgPSAzCj4gMS4yRywgUGVyZiBz
dGF0ZSA9IDQKPiAKPiBOb3cgd2hlbiB0aGUgZGV2aWNlIHdhbnRzIHRvIG9wZXJhdGUgYXQgc2F5
IDgwME1oeiwgeW91IG5lZWQgdG8gc2V0IHRoZQo+IFBlcmYgc3RhdGUgdG8gMywgc28gdGhpcyBw
YXRjaCBiYXNpY2FsbHkgYXZvaWRzIHlvdSBoYXZpbmcgdG8gcHV0IHRob3NlIGFkZGl0aW9uYWwK
PiBPUFBzIGluIHRoZSB0YWJsZSB3aGljaCB3b3VsZCBvdGhlcndpc2UgbG9vayBzb21ldGhpbmcg
bGlrZSB0aGlzCj4gCj4gNTAwTSwgUGVyZiBzdGF0ZSA9IDIKPiA4MDBNLCBQZXJmIHN0YXRlID0g
MyA8LS0gcmVkdW5kYW50IE9QUAo+IDFHLCBQZXJmIHN0YXRlID0gMwo+IDEuMkcsIFBlcmYgc3Rh
dGUgPSA0Cj4gCj4gWW91ciBleGFtcGxlIGhhZCBqdXN0IDEgbWlzc2luZyBlbnRyeSBpbiB0aGUg
J2ZtYXgnIHRhYmxlcyBpbiByZWFsaXR5IGl0cyBhIGxvdCBtb3JlLAo+IGF0bGVhc3Qgb24gYWxs
IHF1YWxjb21tIHBsYXRmb3Jtcy4KCk9rYXksIEkgaGF2ZSBhcHBsaWVkIHRoaXMgcGF0Y2ggKGFs
b25lKSB0byB0aGUgT1BQIHRyZWUgd2l0aCBtaW5vcgptb2RpZmljYXRpb25zIGluIGNvbW1pdCBs
b2cgYW5kIGRpZmYuCgotLSAKdmlyZXNoCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tODwtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpGcm9tOiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1
bS5vcmc+CkRhdGU6IFdlZCwgMjAgTWFyIDIwMTkgMTU6MTk6MDggKzA1MzAKU3ViamVjdDogW1BB
VENIXSBvcHA6IERvbid0IG92ZXJ3cml0ZSByb3VuZGVkIGNsayByYXRlCgpEb2luZyB0aGlzIGFs
bG93cyB1cyB0byBjYWxsIHRoaXMgQVBJIHdpdGggYW55IHJhdGUgcmVxdWVzdGVkIGFuZCBoYXZl
Cml0IG5vIG5lZWQgdG8gbWF0Y2ggaW4gdGhlIE9QUCB0YWJsZS4gSW5zdGVhZCwgd2UnbGwgcm91
bmQgdGhlIHJhdGUgdXAKdG8gdGhlIG5lYXJlc3QgT1BQLCBzbyB0aGF0IHdlIGNhbiBnZXQgdGhl
IHZvbHRhZ2Ugb3IgcGVyZm9ybWFuY2UgbGV2ZWwKcmVxdWlyZWQgZm9yIHRoYXQgT1BQLiBUaGlz
IHN1cHBvcnRzIHVzZXJzIG9mIHRoZSBPUFAgY29yZSB0aGF0IHdhbnQgdG8Kc3BlY2lmeSB0aGUg
cG9zc2libGUgJ2ZtYXgnIHZhbHVlcyBjb3JyZXNwb25kaW5nIHRvIHRoZSB2b2x0YWdlIG9yCnBl
cmZvcm1hbmNlIGxldmVscyBvZiBlYWNoIE9QUC4gQW5kIGZvciBkZXZpY2VzIHRoYXQgcmVxdWly
ZWQgdGhlIGV4YWN0CmZyZXF1ZW5jeSwgd2UgY2FuIHJlbHkgb24gdGhlIGNsayBmcmFtZXdvcmsg
dG8gcm91bmQgdGhlIHJhdGUgdG8gdGhlCm5lYXJlc3Qgc3VwcG9ydGVkIGZyZXF1ZW5jeSBpbnN0
ZWFkIG9mIHRoZSBPUFAgZnJhbWV3b3JrIHRvIGRvIHNvLgoKU2lnbmVkLW9mZi1ieTogU3RlcGhl
biBCb3lkIDxzd2JveWRAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBSYWplbmRyYSBOYXlh
ayA8cm5heWFrQGNvZGVhdXJvcmEub3JnPgpbIFZpcmVzaDogTWFzc2FnZWQgY2hhbmdlbG9nIGFu
ZCB1c2UgdGVtcF9vcHAgdmFyaWFibGUgaW5zdGVhZCBdClNpZ25lZC1vZmYtYnk6IFZpcmVzaCBL
dW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9vcHAvY29yZS5jIHwg
OCArKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL29wcC9jb3JlLmMgYi9kcml2ZXJzL29wcC9jb3JlLmMK
aW5kZXggNzY0ZTA1YTJmYTY2Li4wZmJjNzdmMDUwNDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvb3Bw
L2NvcmUuYworKysgYi9kcml2ZXJzL29wcC9jb3JlLmMKQEAgLTc1Nyw3ICs3NTcsNyBAQCBzdGF0
aWMgaW50IF9zZXRfcmVxdWlyZWRfb3BwcyhzdHJ1Y3QgZGV2aWNlICpkZXYsCiBpbnQgZGV2X3Bt
X29wcF9zZXRfcmF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgdGFyZ2V0X2Zy
ZXEpCiB7CiAJc3RydWN0IG9wcF90YWJsZSAqb3BwX3RhYmxlOwotCXVuc2lnbmVkIGxvbmcgZnJl
cSwgb2xkX2ZyZXE7CisJdW5zaWduZWQgbG9uZyBmcmVxLCBvbGRfZnJlcSwgdGVtcF9mcmVxOwog
CXN0cnVjdCBkZXZfcG1fb3BwICpvbGRfb3BwLCAqb3BwOwogCXN0cnVjdCBjbGsgKmNsazsKIAlp
bnQgcmV0OwpAQCAtNzk2LDEzICs3OTYsMTUgQEAgaW50IGRldl9wbV9vcHBfc2V0X3JhdGUoc3Ry
dWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIHRhcmdldF9mcmVxKQogCQlnb3RvIHB1dF9v
cHBfdGFibGU7CiAJfQogCi0Jb2xkX29wcCA9IF9maW5kX2ZyZXFfY2VpbChvcHBfdGFibGUsICZv
bGRfZnJlcSk7CisJdGVtcF9mcmVxID0gb2xkX2ZyZXE7CisJb2xkX29wcCA9IF9maW5kX2ZyZXFf
Y2VpbChvcHBfdGFibGUsICZ0ZW1wX2ZyZXEpOwogCWlmIChJU19FUlIob2xkX29wcCkpIHsKIAkJ
ZGV2X2VycihkZXYsICIlczogZmFpbGVkIHRvIGZpbmQgY3VycmVudCBPUFAgZm9yIGZyZXEgJWx1
ICglbGQpXG4iLAogCQkJX19mdW5jX18sIG9sZF9mcmVxLCBQVFJfRVJSKG9sZF9vcHApKTsKIAl9
CiAKLQlvcHAgPSBfZmluZF9mcmVxX2NlaWwob3BwX3RhYmxlLCAmZnJlcSk7CisJdGVtcF9mcmVx
ID0gZnJlcTsKKwlvcHAgPSBfZmluZF9mcmVxX2NlaWwob3BwX3RhYmxlLCAmdGVtcF9mcmVxKTsK
IAlpZiAoSVNfRVJSKG9wcCkpIHsKIAkJcmV0ID0gUFRSX0VSUihvcHApOwogCQlkZXZfZXJyKGRl
diwgIiVzOiBmYWlsZWQgdG8gZmluZCBPUFAgZm9yIGZyZXEgJWx1ICglZClcbiIsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
