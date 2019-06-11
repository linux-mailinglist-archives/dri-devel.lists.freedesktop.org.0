Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9E41CB4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF188924B;
	Wed, 12 Jun 2019 06:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B84890D3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 10:54:36 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id a186so7201721pfa.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 03:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IvQb/Ypyh9gRJDotT8x3V0sz3ecSdE5KFnzXB7OO8I8=;
 b=dB9MVu4pdZgQosyaKer9OXIYVYygNpannl/i/5JFLg4D44ZUldbebPzRIsixUdddoX
 r2fI5xmOUQNkIT5pSRLG1WOKkMCDaojhwsWRNJ4e2ZVE+qR6dzSeT3r92MR3uFJd85In
 UljqULTxq230Of7HyWnzQ0VpyibauUE5IdmXUPTg/VA9AM+bXYyzBV9spIRXyFp04e1/
 Tb5PMwMm5oxe/ayGzvdMqmCoD95vK4iByPz5cWmI4RCitLA/GZaUo3TcRbhwkCqufHK6
 iEG+sM3VHJV3OefQrB4XhqDsfR9qGxh3kW+VZZ8BgWOraHv7mbT6W1LPCl19/iVn/D53
 IUEg==
X-Gm-Message-State: APjAAAVtqgjyuQT02m4cOIgHSrR1sJ3Bwy03lJF88WvCR5kYQS06xVri
 u4QqMi0KVXZqG3Iv6IRPLvTvWQ==
X-Google-Smtp-Source: APXvYqzpXvOcmG+jSmbuKUuB+pvnFdrAODCioPv9t90lRkGIWZkV0igtmbVR7Z0PzCmHelNYhJaqfA==
X-Received: by 2002:a62:bd11:: with SMTP id a17mr5606101pff.126.1560250476041; 
 Tue, 11 Jun 2019 03:54:36 -0700 (PDT)
Received: from localhost ([122.172.66.84])
 by smtp.gmail.com with ESMTPSA id j72sm2231266pje.12.2019.06.11.03.54.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:34 -0700 (PDT)
Date: Tue, 11 Jun 2019 16:24:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [RFC v2 01/11] OPP: Don't overwrite rounded clk rate
Message-ID: <20190611105432.x3nzqiib35t6mvyg@vireshk-i7>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-2-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320094918.20234-2-rnayak@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IvQb/Ypyh9gRJDotT8x3V0sz3ecSdE5KFnzXB7OO8I8=;
 b=JV9Xb4IMUkhC6FXUs6jMr31zgd5bbZUP53i9LQXtxqqKDsyOstCFNthzz9ysHVltrG
 LQPzsJTYpuYoEjJUqF27NWTUxY00GzCfMVw2AwdBa/l+uVsVwIIfUvY/Na/9hqRyC4hm
 qA8IVyqs6a3XSSW7Mbzi0CcMh3MoLKRWZYJ/M6fAEOrHH3ZNmuDxJz+TI/1yAMW9n4tL
 g/utQBXLMp0f+tyzFpzt4ZdUlGRG6eDxQZo5tUvxsgYparDAbG+sfgL5NAnQWDFtiptC
 +hcShtjhUExJXJrKOnj0jx3m/sCaDSZxE7ayO+ffbwGhcKmSTG2S7S3CsidSQ3kx0fQA
 CJpg==
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
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAtMDMtMTksIDE1OjE5LCBSYWplbmRyYSBOYXlhayB3cm90ZToKPiBGcm9tOiBTdGVwaGVu
IEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+Cj4gCj4gRG9pbmcgdGhpcyBhbGxvd3MgdXMgdG8g
Y2FsbCB0aGlzIEFQSSB3aXRoIGFueSByYXRlIHJlcXVlc3RlZCBhbmQgaGF2ZQo+IGl0IG5vdCBu
ZWVkIHRvIG1hdGNoIGluIHRoZSBPUFAgdGFibGUuIEluc3RlYWQsIHdlJ2xsIHJvdW5kIHRoZSBy
YXRlIHVwCj4gdG8gdGhlIG5lYXJlc3QgT1BQIHRoYXQgd2Ugc2VlIHNvIHRoYXQgd2UgY2FuIGdl
dCB0aGUgdm9sdGFnZSBvciBsZXZlbAo+IHRoYXQncyByZXF1aXJlZCBmb3IgdGhhdCBPUFAuIFRo
aXMgc3VwcG9ydHMgdXNlcnMgb2YgT1BQIHRoYXQgd2FudCB0bwo+IHNwZWNpZnkgdGhlICdmbWF4
JyB0YWJsZXMgb2YgYSBkZXZpY2UgaW5zdGVhZCBvZiBldmVyeSBzaW5nbGUgZnJlcXVlbmN5Cj4g
dGhhdCB0aGV5IG5lZWQuIEFuZCBmb3IgZGV2aWNlcyB0aGF0IHJlcXVpcmVkIHRoZSBleGFjdCBm
cmVxdWVuY3ksIHdlCj4gY2FuIHJlbHkgb24gdGhlIGNsayBmcmFtZXdvcmsgdG8gcm91bmQgdGhl
IHJhdGUgdG8gdGhlIG5lYXJlc3Qgc3VwcG9ydGVkCj4gZnJlcXVlbmN5IGluc3RlYWQgb2YgdGhl
IE9QUCBmcmFtZXdvcmsgdG8gZG8gc28uCj4gCj4gTm90ZSB0aGF0IHRoaXMgbWF5IGFmZmVjdCBk
cml2ZXJzIHRoYXQgZG9uJ3Qgd2FudCB0aGUgY2xrIGZyYW1ld29yayB0bwo+IGRvIHJvdW5kaW5n
LCBidXQgaW5zdGVhZCB3YW50IHRoZSBPUFAgdGFibGUgdG8gZG8gdGhlIHJvdW5kaW5nIGZvciB0
aGVtLgo+IERvIHdlIGhhdmUgdGhhdCBjYXNlPyBTaG91bGQgd2UgYWRkIHNvbWUgZmxhZyB0byB0
aGUgT1BQIHRhYmxlIHRvCj4gaW5kaWNhdGUgdGhpcyBhbmQgdGhlbiBub3QgaGF2ZSB0aGF0IGZs
YWcgc2V0IHdoZW4gdGhlcmUgaXNuJ3QgYW4gT1BQCj4gdGFibGUgZm9yIHRoZSBkZXZpY2UgYW5k
IGFsc28gaW50cm9kdWNlIGEgcHJvcGVydHkgbGlrZSAnb3BwLXVzZS1jbGsnIHRvCj4gdGVsbCB0
aGUgdGFibGUgdGhhdCBpdCBzaG91bGQgdXNlIHRoZSBjbGsgQVBJcyB0byByb3VuZCByYXRlcyBp
bnN0ZWFkIG9mCj4gT1BQPwo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZXBoZW4gQm95ZCA8c3dib3lk
QGNocm9taXVtLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBSYWplbmRyYSBOYXlhayA8cm5heWFrQGNv
ZGVhdXJvcmEub3JnPgo+IC0tLQo+ICBkcml2ZXJzL29wcC9jb3JlLmMgfCA4ICsrKysrLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvb3BwL2NvcmUuYyBiL2RyaXZlcnMvb3BwL2NvcmUuYwo+IGluZGV4
IDA0MjBmN2U4YWQ1Yi4uYmM5YTc3NjJkZDRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvb3BwL2Nv
cmUuYwo+ICsrKyBiL2RyaXZlcnMvb3BwL2NvcmUuYwo+IEBAIC03MDMsNyArNzAzLDcgQEAgc3Rh
dGljIGludCBfc2V0X3JlcXVpcmVkX29wcHMoc3RydWN0IGRldmljZSAqZGV2LAo+ICBpbnQgZGV2
X3BtX29wcF9zZXRfcmF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgdGFyZ2V0
X2ZyZXEpCj4gIHsKPiAgCXN0cnVjdCBvcHBfdGFibGUgKm9wcF90YWJsZTsKPiAtCXVuc2lnbmVk
IGxvbmcgZnJlcSwgb2xkX2ZyZXE7Cj4gKwl1bnNpZ25lZCBsb25nIGZyZXEsIG9wcF9mcmVxLCBv
bGRfZnJlcSwgb2xkX29wcF9mcmVxOwo+ICAJc3RydWN0IGRldl9wbV9vcHAgKm9sZF9vcHAsICpv
cHA7Cj4gIAlzdHJ1Y3QgY2xrICpjbGs7Cj4gIAlpbnQgcmV0Owo+IEBAIC03NDIsMTMgKzc0Miwx
NSBAQCBpbnQgZGV2X3BtX29wcF9zZXRfcmF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVk
IGxvbmcgdGFyZ2V0X2ZyZXEpCj4gIAkJZ290byBwdXRfb3BwX3RhYmxlOwo+ICAJfQo+ICAKPiAt
CW9sZF9vcHAgPSBfZmluZF9mcmVxX2NlaWwob3BwX3RhYmxlLCAmb2xkX2ZyZXEpOwo+ICsJb2xk
X29wcF9mcmVxID0gb2xkX2ZyZXE7Cj4gKwlvbGRfb3BwID0gX2ZpbmRfZnJlcV9jZWlsKG9wcF90
YWJsZSwgJm9sZF9vcHBfZnJlcSk7Cj4gIAlpZiAoSVNfRVJSKG9sZF9vcHApKSB7Cj4gIAkJZGV2
X2VycihkZXYsICIlczogZmFpbGVkIHRvIGZpbmQgY3VycmVudCBPUFAgZm9yIGZyZXEgJWx1ICgl
bGQpXG4iLAo+ICAJCQlfX2Z1bmNfXywgb2xkX2ZyZXEsIFBUUl9FUlIob2xkX29wcCkpOwo+ICAJ
fQo+ICAKPiAtCW9wcCA9IF9maW5kX2ZyZXFfY2VpbChvcHBfdGFibGUsICZmcmVxKTsKPiArCW9w
cF9mcmVxID0gZnJlcTsKPiArCW9wcCA9IF9maW5kX2ZyZXFfY2VpbChvcHBfdGFibGUsICZvcHBf
ZnJlcSk7Cj4gIAlpZiAoSVNfRVJSKG9wcCkpIHsKPiAgCQlyZXQgPSBQVFJfRVJSKG9wcCk7Cj4g
IAkJZGV2X2VycihkZXYsICIlczogZmFpbGVkIHRvIGZpbmQgT1BQIGZvciBmcmVxICVsdSAoJWQp
XG4iLAoKSSBzZWUgYSBsb2dpY2FsIHByb2JsZW0gd2l0aCB0aGlzIHBhdGNoLgoKU3VwcG9zZSB0
aGUgY2xvY2sgZHJpdmVyIHN1cHBvcnRzIGZvbGxvd2luZyBmcmVxdWVuY2llczogNTAwTSwgODAw
TSwKMUcsIDEuMkcgYW5kIHRoZSBPUFAgdGFibGUgY29udGFpbnMgZm9sbG93aW5nIGxpc3Q6IDUw
ME0sIDFHLCAxLjJHCihpLmUuIG1pc3NpbmcgODAwTSkuCgpOb3cgODAwTSBzaG91bGQgbmV2ZXIg
Z2V0IHByb2dyYW1tZWQgYXMgaXQgaXNuJ3QgcGFydCBvZiB0aGUgT1BQCnRhYmxlLiBCdXQgaWYg
eW91IHBhc3MgNjAwTSB0byBvcHAtc2V0LXJhdGUsIHRoZW4gaXQgd2lsbCBlbmQgdXAKc2VsZWN0
aW5nIDgwME0gYXMgY2xvY2sgZHJpdmVyIHdpbGwgcm91bmQgdXAgdG8gdGhlIGNsb3Nlc3QgdmFs
dWUuCgpFdmVuIGlmIG5vIG9uZSBpcyBkb2luZyB0aGlzIHJpZ2h0IG5vdywgaXQgaXMgYSBzZW5z
aWJsZSB1c2VjYXNlLApzcGVjaWFsbHkgZHVyaW5nIHRlc3Rpbmcgb2YgcGF0Y2hlcyBhbmQgSSBk
b24ndCB0aGluayB3ZSBzaG91bGQgYXZvaWQKaXQuCgpXaGF0IGV4YWN0bHkgaXMgdGhlIHVzZSBj
YXNlIGZvciB3aGljaCB3ZSBuZWVkIHRoaXMgcGF0Y2ggPyBXaGF0IGtpbmQKb2YgZHJpdmVyID8g
U29tZSBkZXRhaWwgY2FuIGJlIGhlbHBmdWwgdG8gZmluZCBhbm90aGVyIHNvbHV0aW9uIHRoYXQK
Zml4ZXMgdGhpcyBwcm9ibGVtLgoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
