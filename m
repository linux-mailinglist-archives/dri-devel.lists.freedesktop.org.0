Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04935337A79
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 18:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ACB6EA95;
	Thu, 11 Mar 2021 17:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050996E063
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 17:09:31 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a1so3098794ljp.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JZLX+51qCO+D0XtLUqXKV4U4rxkLlmXtaKMDR2qBmkI=;
 b=N8yEpV2wJdxl0mTU0lt9qDm3UUS6E2LjfFu7HiF+vjL1m+V47I3fi/h+7mYKW4orlx
 v36LOjufIIme1ynswKfS/pLVgdBJaL5ekTD6hyL6+6lTs3Gwh6cZ4X/iIx6O8C0FNk5j
 /oLch8CdtaWqkRE/rvrw7GOVSgjTNcvGzjDkPhETP3GTvjJ0hYEockwPHerLj7LWNAMn
 0ew4PS1CwxeTG76i3J3gVSbethXjj1sBkcAnPbTy40CpE5nIDewSTjWngDo7yQjXh0Df
 I//6R0/SVLWzBqvub2UmYFtMAiwphF0JA26yjVb/s1s39TBS28Ks6Kpipc2aoBFnLaNv
 FclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JZLX+51qCO+D0XtLUqXKV4U4rxkLlmXtaKMDR2qBmkI=;
 b=UfvLWhwLllKbCiOprtx541P4GyCAvZn7rRhfXkJxc14Lg+5aEO/5poyKrG+xxylH+o
 nFadUdT0DLFkByI4aD0LHtLE2K93aOecrh59t3Bg4qxrET0a+Pe0RVEbqN3M7NRdLIZm
 zlIcKhPIiAItk3Yt4zl2J8Y+uZL9Th5kmYx9/tuBCLl5/ST9C6meqmw/HNYYzeX6WNrD
 f//b8hQ0MpRSIVMbzjb56bUyh4KtBQ+iqm2XaFX8aa3CSX/YEsiix17omOdSoL1xYIuO
 CZs+CTs84Cg/rnfHTsZ/tQaeYh8a+krvc9A9ANYljHyxcUHvH8ql2lsdrmtR1gWTgjKO
 44oA==
X-Gm-Message-State: AOAM532riEMXE71DyXI/aEIvrsq7tUz6DSv8Ctk2KtTP3M+e4vD95YUc
 4w9nVlyj6M4nPhXDctGDQUtTHIEZikw=
X-Google-Smtp-Source: ABdhPJzxuJ5tEZpY6/cDEv5+DNkGhimlDj9cfTSIHFaolLmiEVy/HtDkNFvkyOjjwJxZ5fJTQIeidQ==
X-Received: by 2002:a2e:9ad0:: with SMTP id p16mr5496097ljj.414.1615482569201; 
 Thu, 11 Mar 2021 09:09:29 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id y22sm995715lfg.133.2021.03.11.09.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 09:09:28 -0800 (PST)
Subject: Re: [PATCH v14 0/2] Add memory bandwidth management to NVIDIA Tegra
 DRM driver
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20210311170606.7543-1-digetx@gmail.com>
Message-ID: <be8ed07b-3301-f64f-a599-9bba40d42288@gmail.com>
Date: Thu, 11 Mar 2021 20:09:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210311170606.7543-1-digetx@gmail.com>
Content-Language: en-US
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
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMDMuMjAyMSAyMDowNiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gVGhpcyBzZXJp
ZXMgYWRkcyBtZW1vcnkgYmFuZHdpZHRoIG1hbmFnZW1lbnQgdG8gdGhlIE5WSURJQSBUZWdyYSBE
Uk0gZHJpdmVyLAo+IHdoaWNoIGlzIGRvbmUgdXNpbmcgaW50ZXJjb25uZWN0IGZyYW1ld29yay4g
SXQgZml4ZXMgZGlzcGxheSBjb3JydXB0aW9uIHRoYXQKPiBoYXBwZW5zIGR1ZSB0byBpbnN1ZmZp
Y2llbnQgbWVtb3J5IGJhbmR3aWR0aC4KPiAKPiBDaGFuZ2Vsb2c6Cj4gCj4gdjE0OiAtIE1hZGUg
aW1wcm92ZW1lbnRzIHRoYXQgd2VyZSBzdWdnZXN0ZWQgYnkgTWljaGHFgiBNaXJvc8WCYXcgdG8g
djEzOgo+IAo+ICAgICAgICAtIENoYW5nZWQgJ3Vuc2lnbmVkIGludCcgdG8gJ2Jvb2wnLgo+ICAg
ICAgICAtIFJlbmFtZWQgZnVuY3Rpb25zIHdoaWNoIGNhbGN1bGF0ZSBiYW5kd2lkdGggc3RhdGUu
Cj4gICAgICAgIC0gUmV3b3JrZWQgY29tbWVudCBpbiB0aGUgY29kZSB0aGF0IGV4cGxhaW5zIHdo
eSBkb3duc2NhbGVkIHBsYW5lCj4gICAgICAgICAgcmVxdWlyZSBoaWdoZXIgYmFuZHdpZHRoLgo+
ICAgICAgICAtIEFkZGVkIHJvdW5kLXVwIHRvIGJhbmR3aWR0aCBjYWxjdWxhdGlvbi4KPiAgICAg
ICAgLSBBZGRlZCBzYW5pdHkgY2hlY2tzIG9mIHRoZSBwbGFuZSBpbmRleCBhbmQgZml4ZWQgb3V0
LW9mLWJvdW5kcwo+ICAgICAgICAgIGFjY2VzcyB3aGljaCBoYXBwZW5lZCBvbiBUMTI0IGR1ZSB0
byB0aGUgY3Vyc29yIHBsYW5lIGluZGV4Lgo+IAo+IHYxMzogLSBObyBjb2RlIGNoYW5nZXMuIFBh
dGNoZXMgbWlzc2VkIHY1LjEyLCByZS1zZW5kaW5nIHRoZW0gZm9yIHY1LjEzLgo+IAo+IERtaXRy
eSBPc2lwZW5rbyAoMik6Cj4gICBkcm0vdGVncmE6IGRjOiBTdXBwb3J0IG1lbW9yeSBiYW5kd2lk
dGggbWFuYWdlbWVudAo+ICAgZHJtL3RlZ3JhOiBkYzogRXh0ZW5kIGRlYnVnIHN0YXRzIHdpdGgg
dG90YWwgbnVtYmVyIG9mIGV2ZW50cwo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvS2NvbmZp
ZyB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jICAgIHwgMzYyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmgg
ICAgfCAgMTkgKysKPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jICAgfCAgMTQgKysKPiAg
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5jICAgfCAgIDMgKwo+ICBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvcGxhbmUuYyB8IDEyNyArKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L3BsYW5lLmggfCAgMTUgKysKPiAgNyBmaWxlcyBjaGFuZ2VkLCA1NDEgaW5zZXJ0aW9ucygrKQo+
IAoKTWljaGHFgiwgcGxlYXNlIGxldCBtZSBrbm93IGlmIHYxNCBsb29rcyBnb29kIHRvIHlvdS4g
SSdsbCBhcHByZWNpYXRlCnlvdXJzIHItYiwgdGhhbmtzIGluIGFkdmFuY2UuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
