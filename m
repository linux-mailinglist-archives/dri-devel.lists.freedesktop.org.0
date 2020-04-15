Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8551AB90F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903F26EAF1;
	Thu, 16 Apr 2020 06:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9186EA24
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 16:00:35 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id f8so3003407lfe.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pUbXwRuaBoeeQE8WpzdLHLKfjXnzTNrUyV5shPciAfo=;
 b=rAYOMusK1gE96A1cVRlpvyzFLG/+DX/S9afSbxyyfHizRSp4AD3hiDWvquAIr4uWI3
 BKia5hOnMIUMogDbgYCo4N3QDs2Mcu2NIFY9fz1xoR1Na1XPORTEbhfY7c7jGNv8XZFM
 n9SvnsRcPyA0blvDbniWGSsxitW7qSBNQqibeEOpISz6d3lfFCq9MOgFmDt0gxoBAXCz
 oskR8E6C1Cq/mzTjYbKR6VM5bm/fFrJOTYQi9qtMoVrDCu4Xu02otFeKYkkJqEXjEq0O
 iUWXOfv89OfnSBGA5Ax2yrkwSk5aFeQAzpnDcW4wHrfhR0Oi2qRApKVSJGs+S0bRVfid
 LUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pUbXwRuaBoeeQE8WpzdLHLKfjXnzTNrUyV5shPciAfo=;
 b=nKlS1y4G74dGHx/8BRjwXAPojtRLuLbzjXvn1373v1U1RB9SEu4Vg9lQhKwC+yPxsZ
 PWdVqfhWqQ7PBZMNxNgOKXrLj1H3Y7LOWIto2VuvyLIylTR2ZVm3+kwSd/pnIecRN1st
 oUXyVcs24FQc64+Cl5maON697XMyW8ftzyJEh6lZgNvrtcEJnmJfAlMBadUQf7tUXqra
 NzLbdgpT+KuEIO8w8cvr/Su59qwUKZ6T2aOPNakcZx0wnVe1MvQzSOkeT7cTj49JC1jM
 s+K+Nwly/7v0oGSOHQoC7WRGeIyC+F+Ka7QsSDB/lM2Js6VTIZoPg/aNmpJ7nGG7zn6Q
 c9oA==
X-Gm-Message-State: AGi0PuZJKHrRgVrTbP5VuBM4f5ohv/7yTR5Zp+xuT3BGFrENOZ/gg0nU
 q5TI6DaHPVO+VG0Mu8EuD7bW7jsP
X-Google-Smtp-Source: APiQypLSdWzn+mFcTNZ2SOmdhlYs8nrXyYbXhqvfgxKsQ3txqbvOZtrUk9TYSHZOJ2kvS94Ef1/Q4w==
X-Received: by 2002:a05:6512:308e:: with SMTP id
 z14mr3510912lfd.110.1586966432969; 
 Wed, 15 Apr 2020 09:00:32 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id x67sm13060263lfa.76.2020.04.15.09.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 09:00:32 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Support DRM bridges on NVIDIA Tegra
To: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200414222007.31306-1-digetx@gmail.com>
 <20200415095324.GB30444@ravnborg.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c7567d52-4d42-4e70-4cc5-92311c53da04@gmail.com>
Date: Wed, 15 Apr 2020 19:00:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415095324.GB30444@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTUuMDQuMjAyMCAxMjo1MywgU2FtIFJhdm5ib3JnINC/0LjRiNC10YI6Cj4gSGkgRGltaXRyeS4K
PiAKPiBBZGRlZCBMYXVyZW50IHRoYXQgaXMgdGhlIGFydGhpdGVjaHQgYmVoaW5kIHRoZSBuZXcg
YnJpZGdlIG1vZGVsCj4gYnJpZWZseSBleHBsYWluZWQgYmVsb3cuCj4gCj4gT24gV2VkLCBBcHIg
MTUsIDIwMjAgYXQgMDE6MjA6MDVBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiBI
ZWxsbywKPj4KPj4gVGhpcyBzbWFsbCBzZXJpZXMgYWRkcyBpbml0aWFsIHN1cHBvcnQgZm9yIHRo
ZSBEUk0gYnJpZGdlcyB0byBOVklESUEgVGVncmEKPj4gRFJNIGRyaXZlci4gVGhpcyBpcyByZXF1
aXJlZCBieSBuZXdlciBkZXZpY2UtdHJlZXMgd2hlcmUgd2UgbW9kZWwgdGhlIExWRFMKPj4gZW5j
b2RlciBicmlkZ2UgcHJvcGVybHkuCj4+Cj4+IFBsZWFzZSBub3RlIHRoYXQgdGhlIGZpcnN0ICJT
dXBwb3J0IERSTSBicmlkZ2VzIiBwYXRjaCB3YXMgcHJldmlvdXNseSBzZW50Cj4+IG91dCBhcyBh
IHN0YW5kYWxvbmUgdjEgY2hhbmdlLgo+Pgo+PiBDaGFuZ2Vsb2c6Cj4+Cj4+IHYyOiAtIEFkZGVk
IHRoZSBuZXcgInJnYjogRG9uJ3QgcmVnaXN0ZXIgY29ubmVjdG9yIGlmIGJyaWRnZSBpcyB1c2Vk
Igo+PiAgICAgICBwYXRjaCwgd2hpY2ggaGlkZXMgdGhlIHVudXNlZCBjb25uZWN0b3IgcHJvdmlk
ZWQgYnkgdGhlIFRlZ3JhIERSTQo+PiAgICAgICBkcml2ZXIgd2hlbiBicmlkZ2UgaXMgdXNlZCwg
c2luY2UgYnJpZGdlIHByb3ZpZGVzIGl0cyBvd24gY29ubmVjdG9yCj4+ICAgICAgIHRvIHVzLgo+
IAo+IFdlIGFyZSBtb3ZpbmcgdG8gYSBtb2RlbCB3aGVyZSB0aGUgZGlzcGxheSBkcml2ZXIgaGF2
ZSB0aGUKPiByZXNwb25zaWJpbGl0eSB0byBjcmVhdGUgdGhlIGNvbm5lY3RvciAtIG5vdCB0aGUg
YnJpZGdlLgo+IAo+IFRoZSBmbGFncyBhcmd1bWVudCB0bzoKPiAKPiAgICAgZHJtX2JyaWRnZV9h
dHRhY2goZW5jb2RlciwgYnJpZGdlLCBwcmV2aW91cywgZmxhZ3MpOwo+IAo+IGlzIHVzZWQgdG8g
dGVsbCBpZiB0aGUgYnJpZ2RlIHNoYWxsIGNyZWF0ZSB0aGUgY29ubmVjdG9yIG9yIHRoZSBkaXNw
bGF5Cj4gZHJpdmVyIGRvZXMgaXQgLSBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IuCj4g
Cj4gSXQgd291bGQgYmUgcHJlZmVycmVkIHRoYXQgd2UgbW92ZWQgdGhlIHJlbGV2YW50IGJyaWRn
ZSBkcml2ZXJzIHRvIHRoZQo+IG5ldyBtb2RlbCBubyBzbyB5b3UgZGlkIG5vdCBuZWVkIHRvIHN1
cHBvcnQgdGhlIG9sZCBtb2RlbCBpbiB0aGUgZHJpdmVyLgoKSGVsbG8gU2FtLAoKVGhhbmsgeW91
IHZlcnkgbXVjaCBmb3IgdGhlIGNsYXJpZmljYXRpb24hIFRvIGJlIGhvbmVzdCwgSSB3YXMgYSBi
aXQKY29uZnVzZWQgYnkgdGhlIERSTV9CUklER0VfQVRUQUNIX05PX0NPTk5FQ1RPUiBmbGFnLgoK
UGVyaGFwcyB3b3VsZCBiZSBuaWNlIGlmIHRoZSBjb2RlIHRvbGQgZXhwbGljaXRseSB0aGF0IGRy
aXZlcnMgc2hvdWxkCnVzZSB0aGUgbmV3IGZsYWcgYmVjYXVzZSBpdCBhcHBlYXJlZCB0byBtZSB0
aGF0IGFkZGluZyBicmlkZ2UgZnVuY3Rpb25zCnRvIHRoZSBEUk0gZHJpdmVyIGlzIGEgc3RlcCBi
YWNrd2FyZHMgc2luY2UgbG9va3MgbGlrZSBpdCBpbnZvbHZlcwp3cml0aW5nIHNvbWUgbW9yZSBj
b2RlIDopCgo+IElmIHlvdSBoZWxwIGlkZW50aWZ5IHRoZSBicmlkZ2UgZHJpdmVycyB3ZSBjb3Vs
ZCBtaWdyYXRlIHRoZW0gdG8gdGhlIG5ldwo+IG1vZGVsIGFuZCB5b3UgY291bGQgaGVscCB0ZXN0
aW5nPwo+IAo+IFdoYXQgYnJpZGdlIGRyaXZlcnMgd2lsbCBiZSB1c2VkIGZvciB0ZWdyYT8KCkl0
J3MgbHZkcy1lbmNvZGVyIG9mIGJyaWRnZS9sdmRzLWNvZGVjLmMsIHdoaWNoIHN1cHBvcnRzIHRo
ZSBuZXcgbW9kZWwuCgpJJ2xsIHRyeSB0byBtb3ZlIHRvIHRoZSBuZXcgbW9kZWwgaW4gdjMuIFRo
YW5rcyBhZ2FpbiEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
