Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93B734BBA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 17:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FB089159;
	Tue,  4 Jun 2019 15:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD9C89159
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 15:15:08 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n9so3818746wru.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 08:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rJNvsk6x67r3Ua19nmZWJALxxjBo1tA/1LweXhS5qOw=;
 b=Xqk1dzx7iazdvgn2i9RIG/IM5THTW0JwaRHWrE0mvhih7BLv8Nqzz5+9JayF79+1Np
 P7lO9trzOqJy1pt/eIYnUl02JUxtjuQ0qvT9WOduw0p7SjgtGOnvTksqqVjL+I9LnZdz
 d1hTXhG700CWcQuYb/ezlxLrZvmoDcw/iAllBA2DoxwGoCkGPMXaXJFM8p7ms199N4eU
 1piM/ReMlPPeWSnwyP2v0/LHJ2v2kyxh8mKI3gigkk3asYCvW1AFWrwyQSbCxRIAdhwm
 WYOOP1V2toCIr7g39r2XYd8+0oR7a5OmqCFHqmUt6zebcKi1on+d1vSfQTU4zM4doLQK
 XD9w==
X-Gm-Message-State: APjAAAXFesr/XJzmgWOMwAFeq171jT9vJlstqNMN+tnqRrAsQCKUuNc0
 iaZVb72Vi/dXR+1C6rJr7ck=
X-Google-Smtp-Source: APXvYqx4zZGPS6XxMt13hHUo6ndNnVlwu4M5ftKarw7xNDLtPCp68ZTnRRGepyZU2+MalgR0LCx8mA==
X-Received: by 2002:adf:e843:: with SMTP id d3mr11497019wrn.249.1559661307150; 
 Tue, 04 Jun 2019 08:15:07 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l1sm6843852wmg.13.2019.06.04.08.15.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 08:15:06 -0700 (PDT)
Subject: Re: Linking ALSA playback devices and DRM connectors
To: "Ser, Simon" <simon.ser@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Leo (Sunpeng) Li" <sunpeng.li@amd.com>
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
Date: Tue, 4 Jun 2019 17:15:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rJNvsk6x67r3Ua19nmZWJALxxjBo1tA/1LweXhS5qOw=;
 b=ft48VaRxhuyObdLw3Wk5+i+tw3JVwQ3sfouoB5QAq6nqLnVwRoxUo6Lb0IHsL/hx0B
 TwE/OyOzGTHbvbV7ZqgdMltqoxkVj8u5becLC8kYACcmvkgAynKgmcWlf1PAx27uOXcN
 77hUxxuQLjbwNSYSOC021M5sPufrOpyej6g1odZs2sEDeXyDmCE/ki9nWRzYowhsX0Xu
 84ohF3PTjXK8wfa2rn841X0j1tsmzcsJpIO/FvVjsBq2dLVc8yz/qavG6QhvCs3+2ZbV
 6XQSzmhmriMsMoewSVNGEUNYEB2ZM+Q8sEtvesyTW0lTorNEd6RNqNqgvA7/fw2GflrU
 wEIw==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDYuMTkgdW0gMTc6MDUgc2NocmllYiBTZXIsIFNpbW9uOgo+IEhpLAo+Cj4gSSdtIHRy
eWluZyB0byBsaW5rIEFMU0EgcGxheWJhY2sgZGV2aWNlcyBhbmQgRFJNIGNvbm5lY3RvcnMuIElu
IG90aGVyCj4gd29yZHMsIEknZCBsaWtlIHRvIGJlIGFibGUgdG8ga25vdyB3aGljaCBBTFNBIGRl
dmljZSBJIHNob3VsZCBvcGVuIHRvCj4gcGxheSBhdWRpbyBvbiBhIGdpdmVuIGNvbm5lY3Rvci4K
Pgo+IFVuZm9ydHVuYXRlbHksIEkgaGF2ZW4ndCBmb3VuZCBhIHdheSB0byBleHRyYWN0IHRoaXMg
aW5mb3JtYXRpb24uIEkKPiBrbm93IC9wcm9jL2Fzb3VuZC9jYXJkTi9lbGQqIGV4cG9zZSB0aGUg
RURJRC1saWtlIGRhdGEuIEhvd2V2ZXIgYnkKPiBsb29raW5nIGF0IHRoZSBBTFNBIEFQSSAoYWxz
bzogYXBsYXkgLWwgYW5kIC1MKSBJIGNhbid0IGZpbmQgYSB3YXkgdG8KPiBmaWd1cmUgb3V0IHdo
aWNoIFBDTSBkZXZpY2UgbWFwcyB0byB0aGUgRUxELgo+Cj4gQW0gSSBtaXNzaW5nIHNvbWV0aGlu
Zz8KCklzIHRoYXQgYWN0dWFsbHkgZml4ZWQgb24gYWxsIGhhcmR3YXJlPyBPciBkbyB3ZSBtYXli
ZSBoYXZlIHNvbWUgCmhhcmR3YXJlIHdpdGggb25seSBvbmUgYXVkaW8gY29kZWMgYW5kIG11bHRp
cGxlIGNvbm5lY3RvcnM/Cgo+Cj4gSWYgbm90LCB3aGF0IHdvdWxkIGJlIHRoZSBiZXN0IHdheSB0
byBleHBvc2UgdGhpcz8KPgo+IC0gQSBzeW1saW5rIHRvIHRoZSBBTFNBIGF1ZGlvIFBDTSBkZXZp
Y2UgaW4KPiAgICAvc3lzL2NsYXNzL2RybS9jYXJkTi1DT05ORUNUT1I/Cj4gLSBBIHN5bWxpbmsg
dG8gdGhlIERSTSBjb25uZWN0b3IgaW4gL3N5cy9jbGFzcy9zb3VuZC9wY20qPwoKSWYgaXQncyBm
aXhlZCB0aGFuIHRob3NlIHR3byBvcHRpb25zIHNvdW5kIHNhbmUgdG8gbWUuCgo+IC0gQSBEUk0g
Y29ubmVjdG9yIHByb3BlcnR5PwoKSWYgaXQncyBjb25maWd1cmFibGUgdGhhbiB0aGF0IHNvdW5k
cyBsaWtlIGEgZ29vZCBvcHRpb24gdG8gbWUuCgpBbnl3YXkgYWRkZWQgb3VyIERDIHRlYW0sIHN0
dWZmIGxpa2UgdGhhdCBpcyB0aGVpciBjb25zdHJ1Y3Rpb24gc2l0ZS4KClJlZ2FyZHMsCkNocmlz
dGlhbi4KCj4gLSBTb21laG93IGV4cG9zZSB0aGUgY29ubmVjdG9yIG5hbWUgdmlhIHRoZSBBTFNB
IEFQST8KPiAtIEV4cG9zZSB0aGUgY29ubmVjdG9yIEVESUQgdmlhIEFMU0E/Cj4gLSBPdGhlciBp
ZGVhcz8KPgo+IFRoYW5rcyEKPgo+IFNpbW9uIFNlcgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
