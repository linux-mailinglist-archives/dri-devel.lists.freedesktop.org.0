Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D68265CE1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9726E9B0;
	Fri, 11 Sep 2020 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6BB6E260
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 22:15:04 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id u21so10212700ljl.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 15:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Raxmaoh7OKaV16dqQJzdv854oFz0jczIivRr3ttN/Wg=;
 b=nOBdnrrM2tDd4cZzxU6CZ+rLBVylo7DjL640mbNV6iqlg0Jvz7hls6ktca77bvJi6t
 GI2VFKYHYjegT6m9Bl/BAWZu+A8StL3zhTOt/ftX6YTKHUOa30rJJ9njlI8APR+yjQ/R
 SHsqM3cjMMPAfkJTFjDb96RVmuFKBvEDY9q/gYfo+QntEHkl6CZqzu6kGUJ1ADSzWz0F
 OAr5VYruqD+kqYQOeBp1DZwI9lxaqQinCX5DDbyYWAkPpoc9nxIId7yiyF0VI8c/pqeY
 4/pGeNF5NkM9xbDobivvxCvsjp/lmyjQREZWrEywS8lo68q76qHbYxekdwUyqoY5JfEZ
 86eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Raxmaoh7OKaV16dqQJzdv854oFz0jczIivRr3ttN/Wg=;
 b=LJcNxZBudi0+qILlmGyfh0N+MvejoFY+rH4TgRl5dHVeBdIm+UfDh5BV7+1krxn4GQ
 DJx+k/LlcHjxc4KoPSHxEM1zmZ+wX8TBkU9S8MfutLcSfmHQhQ5Y+V61OZ5HYG3kiVbk
 URZgp/x40eW2qKSTuyu2b8LObRFifyq4wTZuFMf1fSEVAWQDBZ6o+T+IiYF+1OFPISh1
 Ux7HKAiDfWuhc7gkKSyUToJCav7ggYgKYIXXIavyHskmj8zDCkpFTg6Inz4o4FFrWPQh
 Eew8/0dxHwHDQUm5GwSxwi2f6kQHKnjm1zcYziFLqXuoFBCVmA7iUBj5cotCx8WS1zBT
 THwA==
X-Gm-Message-State: AOAM533eGQbowjTJCIRfUlXd+J1oOR0wlLOq98iGek3M/izRVgW61YFZ
 TBHGkfCU3QBaxV97GLfvUak=
X-Google-Smtp-Source: ABdhPJwN8obc5OJsxAvU8E/JWbo+vImVEZnAmvcDkxEiZzVb3hpDHb1DyoIdeUo1Sn9exmAZQgRB4w==
X-Received: by 2002:a05:651c:102c:: with SMTP id
 w12mr5705354ljm.8.1599776103305; 
 Thu, 10 Sep 2020 15:15:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id h17sm69385ljj.4.2020.09.10.15.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 15:15:02 -0700 (PDT)
Subject: Re: DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-15-mperttunen@nvidia.com>
 <54aff7f1-86b2-6bd7-1e47-2078edcf94b3@gmail.com>
 <a734a45f-2366-8a9f-1029-c052bd03bf78@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <17e24d23-3b1e-44e3-57ca-35721dbd4af2@gmail.com>
Date: Fri, 11 Sep 2020 01:15:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a734a45f-2366-8a9f-1029-c052bd03bf78@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDkuMDkuMjAyMCAxMToxMCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gOS85LzIw
IDI6NDUgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDUuMDkuMjAyMCAxMzozNCwgTWlr
a28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IC4uLgo+Pj4gKy8qIFN1Ym1pc3Npb24gKi8KPj4+
ICsKPj4+ICsvKiogUGF0Y2ggYWRkcmVzcyBvZiB0aGUgc3BlY2lmaWVkIG1hcHBpbmcgaW4gdGhl
IHN1Ym1pdHRlZCBnYXRoZXIuICovCj4+PiArI2RlZmluZSBEUk1fVEVHUkFfU1VCTUlUX0JVRl9X
UklURV9SRUxPQ8KgwqDCoMKgwqDCoMKgICgxPDwwKQo+Pgo+PiBTaG91bGRuJ3QgdGhlIGtlcm5l
bCBkcml2ZXIgYmUgYXdhcmUgYWJvdXQgd2hhdCByZWxvY2F0aW9ucyBuZWVkIHRvIGJlCj4+IHBh
dGNoZWQ/IENvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiB0aGUgcHVycG9zZSBvZiB0aGlzIGZsYWc/
Cj4+Cj4gCj4gU3VyZSwgdGhlIGtlcm5lbCBrbm93cyBpZiBpdCByZXR1cm5lZCB0aGUgSU9WQSB0
byB0aGUgdXNlciBvciBub3QsIHNvIHdlCj4gY291bGQgcmVtb3ZlIHRoaXMgZmxhZyBhbmQgZGV0
ZXJtaW5lIGl0IGltcGxpY2l0bHkuIEkgZG9uJ3QgdGhpbmsgdGhlcmUKPiBpcyBtdWNoIGhhcm0g
aW4gaXQgdGhvdWdoOyBpZiB3ZSBoYXZlIHRoZSBmbGFnIGFuIGFwcGxpY2F0aW9uIGNhbiBkZWNp
ZGUKPiB0byBpZ25vcmUgdGhlIGlvdmEgZmllbGQgYW5kIGp1c3QgcGFzcyBXUklURV9SRUxPQyBh
bHdheXMsIGFuZCBpdCdzIG5vdAo+IHJlYWxseSBhbnkgZXh0cmEgY29kZSBvbiBrZXJuZWwgc2lk
ZS4KClNvdW5kcyBsaWtlIHRoZXJlIGlzIG5vIHJlYWwgcHJhY3RpY2FsIHVzZSBmb3IgdGhpcyBm
bGFnIG90aGVyIHRoYW4gZm9yCnRlc3RpbmcgcHVycG9zZXMsIGNvcnJlY3Q/Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
