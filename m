Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBAD225899
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308E36E041;
	Mon, 20 Jul 2020 07:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC1B6EDE1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 14:59:59 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id i19so1002718lfj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AIsBzWloYNimsmc0KYIOUkctLP/uf91NO5ZeFcTqUAc=;
 b=WlX0FGgFU85j8INNp504Kl83RplOa+9JaoeAAgEOl+Ri1vXBcWmpGf57guccR1cSAj
 8PfbKMwdkeI2GFlqNvC4zHIUMjWV5rxbCFl+FKROe+wUnvqXYgKugrK9sbaQhSjxE9JZ
 BnCH6fjmVEd9iDW7e8J/P+2M53XNDOnKM1iqCGY1lfUIFR0v25drbtzcgCCOzCzHo1lk
 mCC4I9ENAXb4xP60G0tAUU6tvVi39O6xND5yLvvbUvqNOD4dSKlXin2ag81IqSOStDJv
 IXcHABoG8Ux1FahCEGG4wlHq1BvCQ7WiD72cGg6WJsj+8Z6DL+oEHTDlDJDfVZspzXcJ
 D8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AIsBzWloYNimsmc0KYIOUkctLP/uf91NO5ZeFcTqUAc=;
 b=J59qe7kImq3KBHKpaGFBP5XarzolygOPmi2cVXc0mOJp93/rbobsqhbgngnAtbQGOZ
 JZSUwAI1yK/wSq+sq0PdIhqyDFhyypUK5rsEfpI5S4d88fLhtl7s2tZTMfY4ZgieyFEl
 cmrWSNxtXujbbsi60eIuoIdYMC88bmr0CDnprl8KHBKG6VFElkWiTYiV7jciAHYr0MJJ
 ps+k9HtHD9bczaJez8v/4ZpV18N/jf3qPYVd9emkjyPUV3ZKHZ5+99br4JbZRAfpcQZE
 yya7afWap3G3Pa7jahuygqm/XyGXrZn8zf7HjADY5vu3wqaS4Gc5NlyYqcYeVhEdcJXL
 GjJQ==
X-Gm-Message-State: AOAM531Ot+iiEMGNawuPJovbWRAs0cJKeVKJX2wmLQSEUBqT9KytUHBf
 +SyBjaY3/PYKQ+8IzBMiVCg=
X-Google-Smtp-Source: ABdhPJxa7d1sHKn11CgpK0Ph/XatNiYFYWQAvAn8F/chdThCJJ9I4yvmQ86DMvope5Tkh9DnrYp+LA==
X-Received: by 2002:a19:4247:: with SMTP id p68mr4922622lfa.22.1594997997589; 
 Fri, 17 Jul 2020 07:59:57 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
 by smtp.googlemail.com with ESMTPSA id m14sm2279017lfp.18.2020.07.17.07.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 07:59:56 -0700 (PDT)
Subject: Re: [PATCH v11 0/4] Panel rotation patches
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Daniel Stone <daniel@fooishbar.org>
References: <20200617231842.30671-1-digetx@gmail.com>
Message-ID: <848a586a-060c-1244-e057-99f5b56baf09@gmail.com>
Date: Fri, 17 Jul 2020 17:59:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200617231842.30671-1-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:36 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTguMDYuMjAyMCAwMjoxOCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gSGVsbG8hCj4g
Cj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBkaXNwbGF5IHBhbmVsJ3MgRFQgcm90YXRp
b24gcHJvcGVydHkuIEl0J3MgYQo+IGNvbnRpbnVhdGlvbiBvZiB0aGUgd29yayB0aGF0IHdhcyBp
bml0aWFsbHkgc3RhcnRlZCBieSBEZXJlayBCYXNlaG9yZSBmb3IKPiB0aGUgcGFuZWwgZHJpdmVy
IHRoYXQgaXMgdXNlZCBieSBzb21lIE1lZGlhdGVrIGRldmljZSBbMV0uIEkgcGlja2VkIHVwIHRo
ZQo+IERlcmVrJ3MgcGF0Y2hlcyBhbmQgYWRkZWQgbXkgdC1iIGFuZCByLWIgdGFncyB0byB0aGVt
LCBJIGFsc28gYWRkZWQKPiByb3RhdGlvbiBzdXBwb3J0IHRvIHRoZSBwYW5lbC1sdmRzIGFuZCBw
YW5lbC1zaW1wbGUgZHJpdmVycy4KPiAKPiBXZSBuZWVkIHRoZSByb3RhdGlvbiBzdXBwb3J0IGZv
ciB0aGUgTmV4dXMgNyB0YWJsZXQgZGV2aWNlIHdoaWNoIGlzIHBlbmRpbmcKPiB0byBiZWNvbWUg
c3VwcG9ydGVkIGJ5IHVwc3RyZWFtIGtlcm5lbCwgdGhlIGRldmljZSBoYXMgZGlzcGxheSBwYW5l
bCBtb3VudGVkCj4gdXBzaWRlLWRvd24gYW5kIGl0IHVzZXMgcGFuZWwtbHZkcyBbMl0uCj4gCj4g
WzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzMvNS8xMTE5Cj4gWzJdIGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC10ZWdyYS9wYXRjaC8yMDIwMDYwNzE1NDMy
Ny4xODU4OS0zLWRpZ2V0eEBnbWFpbC5jb20vCj4gCj4gQ2hhbmdlbG9nOgo+IAo+IHYxMTogLSBU
aGlzIHNlcmllcyBpcyBmYWN0b3JlZCBvdXQgZnJvbSB0aGlzIHBhdGNoc2V0IFszXSBiZWNhdXNl
IHRoZXNlCj4gICAgICAgIHBhdGNoZXMgZG8gbm90IGhhdmUgaGFyZCBkZXBlbmRlbmN5IG9uIHRo
ZSBUZWdyYSBEUk0gcGF0Y2hlcyBhbmQKPiAgICAgICAgaXQgc2hvdWxkIGJlIG5pY2VyIHRvIHJl
dmlldyBhbmQgYXBwbHkgdGhlIHByb3Blcmx5IGdyb3VwZWQgcGF0Y2hlcy4KPiAKPiAgICAgIC0g
SW5pdGlhbGx5IFszXSBvbmx5IHRvdWNoZWQgdGhlIHBhbmVsLWx2ZHMgZHJpdmVyIGFuZCBFbWls
IFZlbGlrb3YKPiAgICAgICAgc3VnZ2VzdGVkIHRoYXQgaXQgd2lsbCBiZSBiZXR0ZXIgdG8gc3Vw
cG9ydCBtb3JlIHBhbmVscyBpbiB0aGUgcmV2aWV3Cj4gICAgICAgIGNvbW1lbnRzIHRvIFszXS4g
U28gSSBpbmNsdWRlZCB0aGUgRGVyZWsncyBwYXRjaCBmb3IgdGhlIEJPRSBwYW5lbAo+ICAgICAg
ICBhbmQgYWRkZWQgcm90YXRpb24gc3VwcG9ydCB0byB0aGUgcGFuZWwtc2ltcGxlIGRyaXZlci4g
SSB0ZXN0ZWQgdGhhdAo+ICAgICAgICBwYW5lbC1sdmRzIGFuZCBwYW5lbC1zaW1wbGUgd29yayBw
cm9wZXJseSB3aXRoIHRoZSByb3RhdGVkIHBhbmVsIHVzaW5nCj4gICAgICAgIHRoZSBPcGVudGVn
cmEgWG9yZyBkcml2ZXIgWzRdIGFuZCBXYXlsYW5kIFdlc3RvbiBbNV0uCj4gCj4gICAgICAtIFRo
ZSBwYW5lbC1sdmRzIGRyaXZlciBub3cgcHJpbnRzIGEgZXJyb3IgbWVzc2FnZSBpZiByb3RhdGlv
biBwcm9wZXJ0eQo+ICAgICAgICBmYWlscyB0byBiZSBwYXJzZWQuCj4gCj4gWzNdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA2MTQyMDAxMjEuMTQxNDctMS1kaWdldHhAZ21haWwu
Y29tLwo+IFs0XSBodHRwczovL2dpdGh1Yi5jb20vZ3JhdGUtZHJpdmVyL3hmODYtdmlkZW8tb3Bl
bnRlZ3JhL2NvbW1pdC8yOGViMjBhMzk1OWJiZTViYzNhM2I2N2U1NTk3NzA5M2ZkNTExNGNhCj4g
WzVdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dlc3Rvbi8tL21lcmdl
X3JlcXVlc3RzLzMxNQo+IAo+IERlcmVrIEJhc2Vob3JlICgyKToKPiAgIGRybS9wYW5lbDogQWRk
IGhlbHBlciBmb3IgcmVhZGluZyBEVCByb3RhdGlvbgo+ICAgZHJtL3BhbmVsOiBSZWFkIHBhbmVs
IG9yaWVudGF0aW9uIGZvciBCT0UgVFYxMDFXVU0tTkw2Cj4gCj4gRG1pdHJ5IE9zaXBlbmtvICgy
KToKPiAgIGRybS9wYW5lbDogbHZkczogUmVhZCBwYW5lbCBvcmllbnRhdGlvbgo+ICAgZHJtL3Bh
bmVsLXNpbXBsZTogUmVhZCBwYW5lbCBvcmllbnRhdGlvbgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX3BhbmVsLmMgICAgICAgICAgICAgICAgICAgfCA0MyArKysrKysrKysrKysrKysrKysrCj4g
IC4uLi9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYyAgICB8ICA2ICsrKwo+
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jICAgICAgICAgICAgfCAxMCArKysr
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgICAgICAgICAgfCAxMSAr
KysrKwo+ICBpbmNsdWRlL2RybS9kcm1fcGFuZWwuaCAgICAgICAgICAgICAgICAgICAgICAgfCAg
OSArKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygrKQo+IAoKSGkhIERvZXMg
YW55b25lIGhhdmUgYW55IGNvbW1lbnRzIHRvIHRoaXMgcGF0Y2hzZXQ/IFdpbGwgYmUgbmljZSBp
ZiBpdApjb3VsZCBnZXQgaW50byA1LjkgOikgVGhhbmtzIGluIGFkdmFuY2UhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
