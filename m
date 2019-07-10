Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 990CB65274
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1ED6E13D;
	Thu, 11 Jul 2019 07:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630F16E0BD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 12:42:33 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x25so1958643ljh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 05:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SaYCgTca3sd4iZ2y4Hurjp1FivgyQ/okDm47EWmj7hc=;
 b=eMN7QcvuZAvIj+a6XNdX4mRcutaaLtHj/YF86XCKxbefe6f6c/UlP0Q78IdOKuvwqE
 z1QuWQFta5WmDuEYZHOt8+z6tCgwdmRh0u8BU3T22PUOepevQFzuEyNP0SP1XpiyUY8T
 JqyZWjHDXrSTTax8f02LKU7Qmwb9zpRBpLUJPc3SZacN6zqDns2a6CKk+hOV/BCwRyO+
 MgKmHCrmwsqGB87s9KhW7omNnF3tFqRGF6kCJ+H9QELAJXvAa3FKMRJtaG7hwanMlRgR
 jaBpk29oK/b7DAQsQMJMWXSBdvJRdjgLzEBDAioZyA8nYojCQDDMZStBs+I8ilp27GWm
 vzEA==
X-Gm-Message-State: APjAAAWmPoOd05tXtXTIqcS39KsCP9sOYSFW1MU+3SFDjPNYEbnmCJ1Y
 k3wTQptGU5N+ezr8AvbINtE=
X-Google-Smtp-Source: APXvYqyv9qEg1ZlrIdBVCuMpXtGYZG0FA071/mv/amZvqdKqsia+jiOwNz2oyczUb0a57xAb31Vn7w==
X-Received: by 2002:a2e:9117:: with SMTP id m23mr17637479ljg.134.1562762551887; 
 Wed, 10 Jul 2019 05:42:31 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id n187sm343784lfa.30.2019.07.10.05.42.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 05:42:29 -0700 (PDT)
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710101229.54ufuhmh22dfxclr@flea>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
Date: Wed, 10 Jul 2019 15:42:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710101229.54ufuhmh22dfxclr@flea>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SaYCgTca3sd4iZ2y4Hurjp1FivgyQ/okDm47EWmj7hc=;
 b=StYp8lySiG1t3rWrCk1RzdObODtoNN3M/d5jCJvsQedwGPLuCSmiBx/w1LaHbHFBgl
 IW+kkJFyaUBp09u3k5VqkReqlcgUfOobnH8TQDrFU0OR+Liynqa8yY2NxZLOzag7KUT1
 xCJCIUw/qeUpp3J+PSkmXkFC1wEJNMB0ySnOXLazvLNFVsf0WDQod9shSiT40woQDRzt
 3kEHD3fpkyI7jbriqPscoEqppfz1fxGz5f9WTCG+U0mFSoFFYGmkT1CxrM6OT850kyI6
 TTqE2IEKoUZfN8fzfYoPZV1GWkDrtiFaySStTqhFu17j+UF1MPIRJlHbfX/NR8LuSGK4
 0Ppw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTAuMDcuMjAxOSAxMzoxMiwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IE9uIFR1ZSwgSnVs
IDA5LCAyMDE5IGF0IDA1OjUxOjUxUE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4g
VGhlIG5hbWVkIG1vZGUgY291bGQgYmUgaW52YWxpZCBhbmQgdGhlbiBjbWRsaW5lIHBhcnNlciBt
aXNzZXMgdG8gdmFsaWRhdGUKPj4gbW9kZSdzIGRpbWVuc2lvbnMsIGhhcHBpbHkgYWRkaW5nIDB4
MCBtb2RlIGFzIGEgdmFsaWQgbW9kZS4gT25lIGNhc2Ugd2hlcmUKPj4gdGhpcyBoYXBwZW5zIGlz
IE5WSURJQSBUZWdyYSBkZXZpY2VzIHRoYXQgYXJlIHVzaW5nIGRvd25zdHJlYW0gYm9vdGxvYWRl
cgo+PiB3aGljaCBhZGRzICJ2aWRlbz10ZWdyYWZiIiB0byB0aGUga2VybmVsJ3MgY21kbGluZSBh
bmQgdGh1cyB1cHN0cmVhbSBUZWdyYQo+PiBEUk0gZHJpdmVyIGZhaWxzIHRvIHByb2JlIGJlY2F1
c2Ugb2YgdGhlIGludmFsaWQgbW9kZS4KPj4KPj4gRml4ZXM6IDNhZWViMTNkODk5NiAoImRybS9t
b2RlczogU3VwcG9ydCBtb2RlcyBuYW1lcyBvbiB0aGUgY29tbWFuZCBsaW5lIikKPj4gU2lnbmVk
LW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+IAo+IEFwcGxpZWQg
dG8gZHJtLW1pc2MtbmV4dC1maXhlcwo+IAo+IFRoYW5rcyBmb3IgZmlndXJpbmcgdGhpcyBvdXQh
CgpUaGFuayB5b3UgdmVyeSBtdWNoISBTbyB0aGUgZHJpdmVyIG5vdyBkb2Vzbid0IGZhaWwgdG8g
cHJvYmUgYmVjYXVzZSBvZiB0aGUgY21kbGluZSwgYnV0CndoYXQgZWxzZSBJIG5vdGljZWQgaXMg
dGhhdCB0aGUgZnJhbWVidWZmZXIgY29uc29sZSBpcyBub3cgcm90YXRlZCBieSA5MMKwIG9uIGEg
ODAweDEyODAKcGFuZWwsIHdoaWxlIGRpc3BsYXkgaW4gWG9yZyBpcyB2ZXJ0aWNhbCBhcyBpdCB3
YXMgYmVmb3JlLiBTZWVtcyBzb21ldGhpbmcgZWxzZSBpcyBzdGlsbAptaXNzaW5nLCByZXZlcnRp
bmcgImRybS9tb2RlczogUmV3cml0ZSB0aGUgY29tbWFuZCBsaW5lIHBhcnNlciIgcmV0dXJucyB0
aGUgZnJhbWVidWZmZXIncwpjb25zb2xlIG9yaWVudGF0aW9uCmludG8gdGhlIG9yaWdpbmFsIHN0
YXRlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
