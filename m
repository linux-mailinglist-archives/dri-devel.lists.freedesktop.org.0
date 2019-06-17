Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF57478E5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 06:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5718C89157;
	Mon, 17 Jun 2019 04:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8AE89157
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 04:04:12 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 83CB16079C; Mon, 17 Jun 2019 04:04:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from [10.131.117.43]
 (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: rnayak@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CFF9E60779;
 Mon, 17 Jun 2019 04:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CFF9E60779
Subject: Re: [RFC v2 02/11] OPP: Make dev_pm_opp_set_rate() with freq=0 as
 valid
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-3-rnayak@codeaurora.org>
 <20190614063210.lfsquoycronah3fe@vireshk-i7>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <37e7ff9e-6bfa-585e-1ca6-f8e079dd0aef@codeaurora.org>
Date: Mon, 17 Jun 2019 09:34:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614063210.lfsquoycronah3fe@vireshk-i7>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560744252;
 bh=PYHnmpPKNQezYb6d7XsHr1kzQDKcd5CpbPQ9GTSBk7M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HrP5+sQUQWwwnDh7bqcYMPTFEDH9Lzt9kn3ys1kffJNNBMhJMvNTbHPkLOnF1CJ4Y
 cHCbC3lGJHCiL3kbi5NDet+By7SQMIRwMSKFg/Me8Ic73YIut8gQTSPij/fkxJyspC
 LuAbXR5PM9rpWVCKn4nyiNKO6NqQiqdnb59O5ApA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1560744251;
 bh=PYHnmpPKNQezYb6d7XsHr1kzQDKcd5CpbPQ9GTSBk7M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QAfyryVjJ0aYRrxwywXTHc0J2mthJdf5wry79zhqxHn5/Ou6Z5q/xyvyB3Q5oiwUz
 3EEs8MFhVFJKpBouxy47nAqxic69sVbpT+RcHHAvPmdXXdyMsvy7y6QroSohBPDxbT
 yJRiortH6undkk09yJ5+YWY7CjzuEmRB0/BcLEfE=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=rnayak@codeaurora.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA2LzE0LzIwMTkgMTI6MDIgUE0sIFZpcmVzaCBLdW1hciB3cm90ZToKPiBPbiAyMC0wMy0x
OSwgMTU6MTksIFJhamVuZHJhIE5heWFrIHdyb3RlOgo+PiBGb3IgZGV2aWNlcyB3aXRoIHBlcmZv
cm1hbmNlIHN0YXRlLCB3ZSB1c2UgZGV2X3BtX29wcF9zZXRfcmF0ZSgpCj4+IHRvIHNldCB0aGUg
YXBwcm9wcmlhdGUgY2xrIHJhdGUgYW5kIHRoZSBwZXJmb3JtYW5jZSBzdGF0ZS4KPj4gV2UgZG8g
bmVlZCBhIHdheSB0byAqcmVtb3ZlKiB0aGUgcGVyZm9ybWFuY2Ugc3RhdGUgdm90ZSB3aGVuCj4+
IHdlIGlkbGUgdGhlIGRldmljZSBhbmQgdHVybiB0aGUgY2xvY2tzIG9mZi4gVXNlIGRldl9wbV9v
cHBfc2V0X3JhdGUoKQo+PiB3aXRoIGZyZXE9MCB0byBhY2hpZXZlIHRoaXMuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFJhamVuZHJhIE5heWFrIDxybmF5YWtAY29kZWF1cm9yYS5vcmc+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz4KPj4gLS0tCj4+ICAg
ZHJpdmVycy9vcHAvY29yZS5jIHwgMTggKysrKysrKysrKysrLS0tLS0tCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gV2hhdCBhYm91dCB0
aGlzIGluc3RlYWQgPwoKeWVzLCB0aGlzIHdvcmtzLCB0aGFua3MgZm9yIHVwZGF0aW5nIHRoZSBw
YXRjaC4KCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb3BwL2NvcmUuYyBiL2RyaXZlcnMvb3Bw
L2NvcmUuYwo+IGluZGV4IDJmZTk2YzIzNjNhMy4uOWFjY2Y4YmI2YWZjIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvb3BwL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvb3BwL2NvcmUuYwo+IEBAIC03MTEs
NyArNzExLDcgQEAgc3RhdGljIGludCBfc2V0X3JlcXVpcmVkX29wcHMoc3RydWN0IGRldmljZSAq
ZGV2LAo+ICAgCj4gICAgICAgICAgLyogU2luZ2xlIGdlbnBkIGNhc2UgKi8KPiAgICAgICAgICBp
ZiAoIWdlbnBkX3ZpcnRfZGV2cykgewo+IC0gICAgICAgICAgICAgICBwc3RhdGUgPSBvcHAtPnJl
cXVpcmVkX29wcHNbMF0tPnBzdGF0ZTsKPiArICAgICAgICAgICAgICAgcHN0YXRlID0gbGlrZWx5
KG9wcCkgPyBvcHAtPnJlcXVpcmVkX29wcHNbMF0tPnBzdGF0ZSA6IDA7Cj4gICAgICAgICAgICAg
ICAgICByZXQgPSBkZXZfcG1fZ2VucGRfc2V0X3BlcmZvcm1hbmNlX3N0YXRlKGRldiwgcHN0YXRl
KTsKPiAgICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gc2V0IHBlcmZvcm1hbmNlIHN0YXRlIG9mICVzOiAl
ZCAoJWQpXG4iLAo+IEBAIC03MjksNyArNzI5LDcgQEAgc3RhdGljIGludCBfc2V0X3JlcXVpcmVk
X29wcHMoc3RydWN0IGRldmljZSAqZGV2LAo+ICAgICAgICAgIG11dGV4X2xvY2soJm9wcF90YWJs
ZS0+Z2VucGRfdmlydF9kZXZfbG9jayk7Cj4gICAKPiAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwg
b3BwX3RhYmxlLT5yZXF1aXJlZF9vcHBfY291bnQ7IGkrKykgewo+IC0gICAgICAgICAgICAgICBw
c3RhdGUgPSBvcHAtPnJlcXVpcmVkX29wcHNbaV0tPnBzdGF0ZTsKPiArICAgICAgICAgICAgICAg
cHN0YXRlID0gbGlrZWx5KG9wcCkgPyBvcHAtPnJlcXVpcmVkX29wcHNbaV0tPnBzdGF0ZSA6IDA7
Cj4gICAKPiAgICAgICAgICAgICAgICAgIGlmICghZ2VucGRfdmlydF9kZXZzW2ldKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiBAQCAtNzcwLDE0ICs3NzAsMTMgQEAgaW50
IGRldl9wbV9vcHBfc2V0X3JhdGUoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIHRh
cmdldF9mcmVxKQo+ICAgCj4gICAgICAgICAgaWYgKHVubGlrZWx5KCF0YXJnZXRfZnJlcSkpIHsK
PiAgICAgICAgICAgICAgICAgIGlmIChvcHBfdGFibGUtPnJlcXVpcmVkX29wcF90YWJsZXMpIHsK
PiAtICAgICAgICAgICAgICAgICAgICAgICAvKiBkcm9wIHRoZSBwZXJmb3JtYW5jZSBzdGF0ZSB2
b3RlICovCj4gLSAgICAgICAgICAgICAgICAgICAgICAgZGV2X3BtX2dlbnBkX3NldF9wZXJmb3Jt
YW5jZV9zdGF0ZShkZXYsIDApOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IF9zZXRfcmVxdWlyZWRfb3BwcyhkZXYsIG9w
cF90YWJsZSwgTlVMTCk7Cj4gICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiJXM6IEludmFsaWQgdGFyZ2V0IGZyZXF1ZW5jeSAl
bHVcbiIsIF9fZnVuY19fLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0
X2ZyZXEpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAidGFyZ2V0IGZyZXF1ZW5jeSBjYW4ndCBi
ZSAwXG4iKTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ICAgICAg
ICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgZ290byBwdXRfb3BwX3RhYmxlOwo+
ICAgICAgICAgIH0KPiAgIAo+ICAgICAgICAgIGNsayA9IG9wcF90YWJsZS0+Y2xrOwo+IAoKLS0g
ClFVQUxDT01NIElORElBLCBvbiBiZWhhbGYgb2YgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIs
IEluYy4gaXMgYSBtZW1iZXIKb2YgQ29kZSBBdXJvcmEgRm9ydW0sIGhvc3RlZCBieSBUaGUgTGlu
dXggRm91bmRhdGlvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
