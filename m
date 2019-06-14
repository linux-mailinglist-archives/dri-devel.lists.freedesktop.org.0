Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6412C455FB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFC68991A;
	Fri, 14 Jun 2019 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B25989310
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 06:32:14 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id c14so591437plo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 23:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+B7qKXGJFcpQLr7qp/Npmcr+UB+pLON9p4u3OT4sydE=;
 b=t+hUY2ghm1AlVIF6eCHQ1J2wls4Mc05S8spufRFCHqKfbek+rlo3/jQGchl5V0LBhr
 PoycqnuAoM19wBfJVCP9Rn3Pz5Q2oO/X4nq+rqQuaZI+6/d0301PTY+Nt92PQVougNvS
 shU8CuCVeLm0SicNtxMfXRP5wDNAo1N/wY9df1Ms3XhF1k3d8l1ONi8HmoQXs2hEa0+M
 Zd7QPpIZAZXztKQpXU00jfEu2h+K7oCzuk4lTh8XJ0Tsvihcf0MixguPNi9fizRdbj68
 ahsl/IZA0ovp1qd549/ZgFVGK8gCFgtRDN3hNlW9boUArE5M/rkkJW8qiVzWKmaYF3p+
 aMqA==
X-Gm-Message-State: APjAAAU2YcEIIMHqPMZ7HcCpsKBG0d/c6kaCen+Sd1g38SCzMMxNLSnO
 J6q7kmKBsFV6n79U9EpdxXbMqA==
X-Google-Smtp-Source: APXvYqwaUgWQWH6DKaYdF1Cdc9oLYapZi22Rqa6xAUqkllNSLwfCxqoVWtlD/qftHOdi36hhnvLW8A==
X-Received: by 2002:a17:902:2ba9:: with SMTP id
 l38mr85574068plb.300.1560493933681; 
 Thu, 13 Jun 2019 23:32:13 -0700 (PDT)
Received: from localhost ([122.172.66.84])
 by smtp.gmail.com with ESMTPSA id x25sm1719091pfm.48.2019.06.13.23.32.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 23:32:12 -0700 (PDT)
Date: Fri, 14 Jun 2019 12:02:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [RFC v2 02/11] OPP: Make dev_pm_opp_set_rate() with freq=0 as
 valid
Message-ID: <20190614063210.lfsquoycronah3fe@vireshk-i7>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
 <20190320094918.20234-3-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320094918.20234-3-rnayak@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:22:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+B7qKXGJFcpQLr7qp/Npmcr+UB+pLON9p4u3OT4sydE=;
 b=IteYjWMcdrUIqBhhG5AEnX6ufnl4qdQ94/AhbuAqyXzyusOiHbjueExr31Z/7k3vK1
 8qxjudR4xriHfmMP9c6US25vQWx1jXjkH8k/Mu3slZvFI70Hc9fpA4PC3oQ3cfq1GnBz
 DfiY/Ib8YY5gn+P1ODVqEgVHY/OCOLDh+1M7OSwV8m1AeZ5bgYJrZvSrMPc7hH111ZRA
 oE5TmKKmdmW3InOVhB9xPk5eSBVIU7YqJ2GCgHUCJMKB/rJVw1WSQxmqP9gSfpKZ/htO
 va49FUHCzSBqKq6qVHw9WUMQZMZWYPylyZmguBUq1jqSAbUvDs/rqipmfDendsqMUjtu
 zJtQ==
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

T24gMjAtMDMtMTksIDE1OjE5LCBSYWplbmRyYSBOYXlhayB3cm90ZToKPiBGb3IgZGV2aWNlcyB3
aXRoIHBlcmZvcm1hbmNlIHN0YXRlLCB3ZSB1c2UgZGV2X3BtX29wcF9zZXRfcmF0ZSgpCj4gdG8g
c2V0IHRoZSBhcHByb3ByaWF0ZSBjbGsgcmF0ZSBhbmQgdGhlIHBlcmZvcm1hbmNlIHN0YXRlLgo+
IFdlIGRvIG5lZWQgYSB3YXkgdG8gKnJlbW92ZSogdGhlIHBlcmZvcm1hbmNlIHN0YXRlIHZvdGUg
d2hlbgo+IHdlIGlkbGUgdGhlIGRldmljZSBhbmQgdHVybiB0aGUgY2xvY2tzIG9mZi4gVXNlIGRl
dl9wbV9vcHBfc2V0X3JhdGUoKQo+IHdpdGggZnJlcT0wIHRvIGFjaGlldmUgdGhpcy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBSYWplbmRyYSBOYXlhayA8cm5heWFrQGNvZGVhdXJvcmEub3JnPgo+IFNp
Z25lZC1vZmYtYnk6IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz4KPiAtLS0KPiAg
ZHJpdmVycy9vcHAvY29yZS5jIHwgMTggKysrKysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKV2hhdCBhYm91dCB0aGlzIGlu
c3RlYWQgPwoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvb3BwL2NvcmUuYyBiL2RyaXZlcnMvb3BwL2Nv
cmUuYwppbmRleCAyZmU5NmMyMzYzYTMuLjlhY2NmOGJiNmFmYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9vcHAvY29yZS5jCisrKyBiL2RyaXZlcnMvb3BwL2NvcmUuYwpAQCAtNzExLDcgKzcxMSw3IEBA
IHN0YXRpYyBpbnQgX3NldF9yZXF1aXJlZF9vcHBzKHN0cnVjdCBkZXZpY2UgKmRldiwKIAogICAg
ICAgIC8qIFNpbmdsZSBnZW5wZCBjYXNlICovCiAgICAgICAgaWYgKCFnZW5wZF92aXJ0X2RldnMp
IHsKLSAgICAgICAgICAgICAgIHBzdGF0ZSA9IG9wcC0+cmVxdWlyZWRfb3Bwc1swXS0+cHN0YXRl
OworICAgICAgICAgICAgICAgcHN0YXRlID0gbGlrZWx5KG9wcCkgPyBvcHAtPnJlcXVpcmVkX29w
cHNbMF0tPnBzdGF0ZSA6IDA7CiAgICAgICAgICAgICAgICByZXQgPSBkZXZfcG1fZ2VucGRfc2V0
X3BlcmZvcm1hbmNlX3N0YXRlKGRldiwgcHN0YXRlKTsKICAgICAgICAgICAgICAgIGlmIChyZXQp
IHsKICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gc2V0IHBl
cmZvcm1hbmNlIHN0YXRlIG9mICVzOiAlZCAoJWQpXG4iLApAQCAtNzI5LDcgKzcyOSw3IEBAIHN0
YXRpYyBpbnQgX3NldF9yZXF1aXJlZF9vcHBzKHN0cnVjdCBkZXZpY2UgKmRldiwKICAgICAgICBt
dXRleF9sb2NrKCZvcHBfdGFibGUtPmdlbnBkX3ZpcnRfZGV2X2xvY2spOwogCiAgICAgICAgZm9y
IChpID0gMDsgaSA8IG9wcF90YWJsZS0+cmVxdWlyZWRfb3BwX2NvdW50OyBpKyspIHsKLSAgICAg
ICAgICAgICAgIHBzdGF0ZSA9IG9wcC0+cmVxdWlyZWRfb3Bwc1tpXS0+cHN0YXRlOworICAgICAg
ICAgICAgICAgcHN0YXRlID0gbGlrZWx5KG9wcCkgPyBvcHAtPnJlcXVpcmVkX29wcHNbaV0tPnBz
dGF0ZSA6IDA7CiAKICAgICAgICAgICAgICAgIGlmICghZ2VucGRfdmlydF9kZXZzW2ldKQogICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKQEAgLTc3MCwxNCArNzcwLDEzIEBAIGludCBk
ZXZfcG1fb3BwX3NldF9yYXRlKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyB0YXJn
ZXRfZnJlcSkKIAogICAgICAgIGlmICh1bmxpa2VseSghdGFyZ2V0X2ZyZXEpKSB7CiAgICAgICAg
ICAgICAgICBpZiAob3BwX3RhYmxlLT5yZXF1aXJlZF9vcHBfdGFibGVzKSB7Ci0gICAgICAgICAg
ICAgICAgICAgICAgIC8qIGRyb3AgdGhlIHBlcmZvcm1hbmNlIHN0YXRlIHZvdGUgKi8KLSAgICAg
ICAgICAgICAgICAgICAgICAgZGV2X3BtX2dlbnBkX3NldF9wZXJmb3JtYW5jZV9zdGF0ZShkZXYs
IDApOwotICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0ID0gX3NldF9yZXF1aXJlZF9vcHBzKGRldiwgb3BwX3RhYmxlLCBOVUxMKTsKICAg
ICAgICAgICAgICAgIH0gZWxzZSB7Ci0gICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2
LCAiJXM6IEludmFsaWQgdGFyZ2V0IGZyZXF1ZW5jeSAlbHVcbiIsIF9fZnVuY19fLAotICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHRhcmdldF9mcmVxKTsKLSAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2
LCAidGFyZ2V0IGZyZXF1ZW5jeSBjYW4ndCBiZSAwXG4iKTsKKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0ID0gLUVJTlZBTDsKICAgICAgICAgICAgICAgIH0KKworICAgICAgICAgICAgICAgZ290
byBwdXRfb3BwX3RhYmxlOwogICAgICAgIH0KIAogICAgICAgIGNsayA9IG9wcF90YWJsZS0+Y2xr
OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
