Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54577211CA2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4DF6E20E;
	Thu,  2 Jul 2020 07:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FDC6E1F9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 09:31:59 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id g139so13176534lfd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 02:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+d2SRZpUuZWr1PMsXvidGGiJQELrujV0Qtt40StTl9g=;
 b=LPMgxzjfikH+ekjnDGlTo5HiuTopob0mrOhZ1T/TKzKtXLxS0g4zBNmRe4QQhLRWCL
 1okLKn+Jds1VZfA9DHmyLb+y/xGtwpQBIO1ZdlkPvO9N8WeoZMnfxvq3clumZ9GHv0Q0
 aFO8jZ+cnyzkNl2SohOvL8XiWK5dCOphinB6XKDqGxlAIn1M7x7e6vHghvsHVFjsPAQL
 b8SqBPJiyUBnXFq4723+bDoYT32KRtFpH3swa+46WMWAEGUMygpGz0oJc09WUQJzfhKr
 QnIXNL234ZMfeU4c+si47EQIseg4quCNPhwJ/zonjU15pu7rYi1rD+0yIPDR+3rxechB
 6/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+d2SRZpUuZWr1PMsXvidGGiJQELrujV0Qtt40StTl9g=;
 b=tqBjyL9wnA/fUHwQ5wyfb3RjZ+fcr97bV4qLbkGIYwqyvQc+j5XIDBzlWPL9dngZ/n
 WC1D0BADSXb/JERSZuLsQdRplaUy1YVj0T69qcQJ9k3qQSag1Ks87xjGsuvb5+BZnci8
 T2nuMGQH0xvw1iagLaYOIpZP3jUUy7ZyD4pGIyujuxszrZKbrFIEPfL3cPEMmZuIj9Fq
 RPHX1kWP6dr2GUWAh7PtwkL01c7LohFwUGtVpJnX+kCYhPwOO1kjDpxUn8fL3hm2UmyY
 nqgGJOBV9n6zmIP8N4CBW96yHQh2OJKJLpNdO0jM4l5ky9jBUzQ1EesOm5PgYFSAuDkX
 fiBg==
X-Gm-Message-State: AOAM533kw5djP7PjRY9/sWmtoPmEZoCs3nHqIY+EA7AmVIkcHR1AhnnN
 9Mwmngaadw/JwYVA/jmaRAE=
X-Google-Smtp-Source: ABdhPJwN/668XQNGZmBOPiKhnbVfqe8RSFARvz44SINyM2X+GeJXU84pm9ni1lENZx3wdjXS8lutaw==
X-Received: by 2002:a05:6512:49d:: with SMTP id
 v29mr14700624lfq.134.1593595918072; 
 Wed, 01 Jul 2020 02:31:58 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id m11sm1621386ljj.122.2020.07.01.02.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 02:31:57 -0700 (PDT)
Subject: Re: [PATCH v10 0/2] Silence missing-graph error for DRM bridges
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200701074232.13632-1-digetx@gmail.com>
 <20200701090240.GA22218@ravnborg.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f4d50b9f-06e8-b6f7-ea5c-7a71f27ae953@gmail.com>
Date: Wed, 1 Jul 2020 12:31:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200701090240.GA22218@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMDcuMjAyMCAxMjowMiwgU2FtIFJhdm5ib3JnINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5Cj4g
T24gV2VkLCBKdWwgMDEsIDIwMjAgYXQgMTA6NDI6MzBBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+PiBIaSEKPj4KPj4gVGhpcyBzbWFsbCBzZXJpZXMgaW1wcm92ZXMgRFJNIGJyaWRn
ZXMgY29kZSBieSBzaWxlbmNpbmcgYSBub2lzeSBlcnJvcgo+PiBjb21pbmcgZnJvbSBvZi1ncmFw
aCBjb2RlIGZvciB0aGUgZGV2aWNlLXRyZWVzIHRoYXQgYXJlIG1pc3NpbmcgYQo+PiBkaXNwbGF5
IGJyaWRnZSBncmFwaC4KPj4KPj4gICBncmFwaDogbm8gcG9ydCBub2RlIGZvdW5kIGluIC4uLgo+
Pgo+PiBPbmUgZXhhbXBsZSB3aGVyZSB0aGlzIGVycm9yIGhhcHBlbnMgaXMgYW4gb2xkZXIgYnJp
ZGdlLWxlc3MgRFRCIHVzZWQKPj4gaW4gY29uanVuY3Rpb24gd2l0aCBhIG5ld2VyIGtlcm5lbCB3
aGljaCBoYXMgYSBkaXNwbGF5IGNvbnRyb2xsZXIgZHJpdmVyCj4+IHRoYXQgc3VwcG9ydHMgRFJN
IGJyaWRnZXMuCj4+Cj4+IENoYW5nZWxvZzoKPj4KPj4gdjEwOi0gQ29ycmVjdGVkIGRvYy1jb21t
ZW50LCB1bmJyb2tlIHRoZSBvZl9ncmFwaF9nZXRfbmV4dF9lbmRwb2ludCgpIGFuZAo+PiAgICAg
ICBpbXByb3ZlZCBjb21taXQncyBtZXNzYWdlIGluIHRoZSAiYWRkIG9mX2dyYXBoX2lzX3ByZXNl
bnQoKSIgcGF0Y2guCj4+ICAgICAgIFRoYW5rcyB0byBMYXVyZW50IFBpbmNoYXJ0IGZvciBzcG90
dGluZyB0aGUgcHJvYmxlbXMhCj4+Cj4+IHY5OiAtIFRoZXNlIHR3byBwYXRjaGVzIGFyZSBmYWN0
b3JlZCBvdXQgZnJvbSBbMV0gaW4gb3JkZXIgdG8gZWFzZSBhcHBseWluZwo+PiAgICAgICBvZiB0
aGUgcGF0Y2hlcy4KPj4KPj4gICAgIC0gVGhlIG9mX2dyYXBoX3ByZXNlbnRzKCkgaXMgcmVuYW1l
ZCB0byBvZl9ncmFwaF9pc19wcmVzZW50KCkgbGlrZSBpdAo+PiAgICAgICB3YXMgcmVxdWVzdGVk
IGJ5IFJvYiBIZXJyaW5nIGluIHRoZSByZXZpZXcgY29tbWVudCB0byBbMV0uCj4+Cj4+ICAgICAt
IEFkZGVkIFJvYidzIHItYi4KPj4KPj4gICAgIFsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvbGludXgtdGVncmEvbGlzdC8/c2VyaWVzPTE4NDEwMgo+Pgo+PiBEbWl0cnkg
T3NpcGVua28gKDIpOgo+PiAgIG9mX2dyYXBoOiBhZGQgb2ZfZ3JhcGhfaXNfcHJlc2VudCgpCj4+
ICAgZHJtL29mOiBNYWtlIGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZSgpIHRvIGNoZWNrIGdy
YXBoJ3MgcHJlc2VuY2UKPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0aWVuY2Ugd2l0aCB0aGVzZSAt
IGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCBub3cuCgpUaGFua3MgdG8geW91IGFuZCBMYXVyZW50
IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
