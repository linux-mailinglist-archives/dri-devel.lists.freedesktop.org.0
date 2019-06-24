Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBAF52476
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22E089F99;
	Tue, 25 Jun 2019 07:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0E689BB0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 11:29:24 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id a27so9403492qkk.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 04:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=E0eNZ8eWkNrVoanWddXgsqoKcDxJgm1MYCzBCpsMuKg=;
 b=DQiPqL/WV72C49WjgSFTeXsSOQ1nPIUlpQ9TztIBFVVoFWM5aDwR/E7GHMSvDdfopd
 HtCW89eaQFgtTnjmI+rvIq/JmsHPY5k4dwe0PDMT0T0yrJbca8xsBLGciR+M/FqyYk2f
 4TC74WUxDz/1Y6DqzuChYB8cVBusJka06MYSWZSUijP2PX5LkE2xz2Ltgw43Tg9b3xEG
 9I7Rc+lZwbT0agzPQWMkqeTSi9n37XsmBnCcppt9RmdbhJxH8CQ/bT8agrv72wFV5gZq
 uoXXNCCOL2r1rni25YGabssL9RN4Q2PUdlbWxgQTT1EuTnhAC/XSadnp7HLlsaKJWn0T
 Tqzg==
X-Gm-Message-State: APjAAAWiRPGCjf+eemMv6Nqk1NY8wfXGyQ3hhoBtMZbWysib+e9vP0ya
 adKHMSmJtyriI44YcR6ETYY=
X-Google-Smtp-Source: APXvYqxLljNmQvesdmG9DGIdf/+22fgiaWbWdMNQlisR2ev+25ul2OsqHmLWamvq8jicZoQgq4G/TA==
X-Received: by 2002:a37:ad0f:: with SMTP id f15mr11836253qkm.68.1561375763323; 
 Mon, 24 Jun 2019 04:29:23 -0700 (PDT)
Received: from [192.168.1.177] (pool-100-0-123-202.bstnma.fios.verizon.net.
 [100.0.123.202])
 by smtp.googlemail.com with ESMTPSA id l5sm6291035qte.9.2019.06.24.04.29.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 04:29:22 -0700 (PDT)
Subject: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
To: Daniel Thompson <daniel.thompson@linaro.org>, Pavel Machek <pavel@ucw.cz>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd> <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
 <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org> <20190621221325.GA2343@amd>
 <20190624102405.gg2lnlw6wmfvjrxu@holly.lan>
From: Brian Dodge <bdodge09@gmail.com>
Message-ID: <9d590b7b-5477-249e-a482-1fc17d7a106f@gmail.com>
Date: Mon, 24 Jun 2019 07:29:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624102405.gg2lnlw6wmfvjrxu@holly.lan>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=E0eNZ8eWkNrVoanWddXgsqoKcDxJgm1MYCzBCpsMuKg=;
 b=UFjYpnasEic+I5++DC18G/vu4RY3tzfJWCh/rqywEHJNLAZK+MzCGvnH9MirUJNLLI
 aBsnO0+bN3nkwzyFyP7ASabiY75viU1HT3rfxKw526PLToPqvSVAQV3Tqcou0CDwHItw
 S6+Hu+ivhZmkydQhmPljS9twkUThsfSv7HH16YH2vQ+zC3GqGN4X/k8zAPG3s6tXVLN7
 ttFHGVIUHATZvIdBdh4gQVgzk+ruOjq8MRMHCk3AcmbObGXM8K/apS6aoOOiNuVusX2H
 tmD/Dcp7oGw5FS/r5b/GqEO5sUYazBjiFGnrjvHrHtzlSUbOEwQ92LisMkFogMIeHmL6
 Qj8A==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, Peter Bacon <pbacon@psemi.com>,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzdXJlIGRpZCBmYWxsIHRocm91Z2ggdGhlIGNyYWNrcy4KCkkgY29uZmlybWVkIHdpdGgg
dGhlIHZlbmRvciB0aGF0IHRoZXJlIGFyZSBubyBleGlzdGluZyBlbWJlZGRlZCBEVFMgd2l0aCAK
dGhlIHdyb25nIG5hbWUocykgaW4gdGhlbSBiZWZvcmUgc3VibWl0dGluZyB0aGlzIHBhdGNoLgoK
VGhlIG5ldyBvd25lciBvZiB0aGlzIGNoaXAgZmFtaWx5LCBwU2VtaSwganVzdCB3YW50ZWQgbWUg
dG8gd3JhcCB0aGluZ3MgCnVwIGFuZCBzdXBwb3J0IGFsbCBvZiB0aGVyZSBjaGlwcyAoMykgaW4g
YSBzaW5nbGUgZHJpdmVyIGFuZCB0aGF0IHdhcyAKdGhlIGV4dGVudCBvZiB0aGUgd29yayBmb3Ig
bWUuwqAgU2luY2UgdGhlbiB0aGUgbWFuYWdlciBvZiB0aGUgcHJvZ3JhbSAKdGhlcmUgaGFzIGFs
c28gY2hhbmdlZC7CoCBJIGFzc3VtZSB0aGV5J2Qgc3RpbGwgd2FudCB0aGVzZSBjaGFuZ2VzIGlu
IGZvciAKY29tcGxldGVuZXNzLgoKQUZBSUssIHRoZXJlIHdlcmUganVzdCBzb21lIHF1aWJibGVz
IGFib3V0IHRoZSBjb3B5cmlnaHQgZGF0ZSByYW5nZS7CoCAKQ2FuIHlvdSBwbGVhc2UgaGVscCBt
ZSBwdXNoIHRoZXNlIHBhdGNoZXMgaW4/IEl0J2xsIHRha2UgbWUgc29tZSB0aW1lIHRvIApnZXQg
YmFjayBpbiB0byB3aGVyZSBJIGxlZnQgdGhpbmdzwqAgc2luY2UgaXRzIGJlZW4gc28gbG9uZy7C
oCBJIGtub3cgaXRzIAphIGJpdCBtZXNzeSBidXQgdGhlIERUUyBhbmQgZHJpdmVyIGNoYW5nZXMg
bmVlZCB0byBiZSB0b2dldGhlciB0byBtYWtlIApzZW5zZSBzbyBJIGNvdWxkbid0IHJlYWxseSBk
byBhbiBpbmNyZW1lbnRhbCBwYXRjaCBzZXF1ZW5jZS4KCldoYXQgaXMgdGhlIG5leHQgc3RlcD8K
CkJyaWFuCgpPbiA2LzI0LzE5IDY6MjQgQU0sIERhbmllbCBUaG9tcHNvbiB3cm90ZToKPiBPbiBT
YXQsIEp1biAyMiwgMjAxOSBhdCAxMjoxMzoyNUFNICswMjAwLCBQYXZlbCBNYWNoZWsgd3JvdGU6
Cj4+IEhpIQo+Pgo+Pj4gW1NvcnJ5IHRvIHRob3NlIHJlY2VpdmluZyB0aGlzIHR3aWNlLi4uIGhh
ZCB0byBkaWcgdGhpcyBvdXQgZnJvbSB0aGUKPj4+IGFyY2hpdmVzIGFuZCBzZW50IGl0IHRvIHRo
ZSBsaXN0cyBmcm9tIHRoZSB3cm9uZyBtYWlsZXJdCj4+Pgo+Pj4gT24gMjcvMTEvMjAxOCAwMDo0
NCwgQnJpYW4gRG9kZ2Ugd3JvdGU6Cj4+Pj4gVGhhbmsgeW91IFBhdmVsLCB0aGF0IGlzIGEgZ29v
ZCBwb2ludC4KPj4+Pgo+Pj4+IFRoZSBjaGlwIHZlbmRvciBoYXMgaW5kaWNhdGVkIHRoYXQgdGhl
cmUgaXMgbm8gcmVhc29uIHRvIG1haW50YWluIHRoZQo+Pj4+IG9sZC9pbXByb3BlciBwcmVmaXgg
YW5kIHdpc2hlcyB0byBnbyBmb3J3YXJkIChvbmx5KSB3aXRoIHRoZSAiYXJjdGljIgo+Pj4+IHBy
ZWZpeCBhbmQgYW55IGV4aXN0aW5nIGR0cyBmaWxlcyBhcmUgb3Igd2lsbCBiZSB1cGRhdGVkLgo+
Pj4gTG9va3MgbGlrZSB0aGlzIHBhdGNoIHNlcmllcyBoYXMgZmFsbGVuIGludG8gdGhlIGNyYWNr
cyBhIGxpdHRsZS4KPj4+Cj4+PiBJIHRoaW5rIEkgYXNzdW1lZCB0aGlzIGluZm8gd291bGQgZW5k
IGluIHRoZSBkZXNjcmlwdGlvbiBvZiBwYXRjaCB2MiAxLzMgKGluCj4+PiBvcmRlciB0byBhbnN3
ZXIgUm9iJ3MgZmVlZGJhY2spIGFuZCBJIHNhdCBhbmQgd2FpdGVkIGZvciBhIHJlc3Bpbi4gT24g
dGhlCj4+PiBvdGhlciBoYW5kLi4uIEkgZGlkbid0IGFjdHVhbGx5IHNheSB0aGF0IGV4cGxpY2l0
bHkgYW55d2hlcmUhIFNvLi4uIEknZAo+Pj4gcmVjb21tZW5kIGEgcmVzcGluIHBlcmhhcHMgd2l0
aCBhIHNtYWxsIGJpdCBvZiB0ZXh0IGV4cGxhaW5pbmcgaG93IHRoZQo+Pj4gdmVuZG9yIGNhbiBz
dGF0ZSB0aGF0IGFueSBleGlzdGluZyBkdHMgZmlsZXMgd2lsbCBiZSB1cGRhdGVkLiBUaGlzIGlz
IGEKPj4+IHBlcmlwaGVyYWwgZGV2aWNlIHNvIHRoZXNlIHN0cmluZ3MgYXJlIHByb2JhYmx5IGVt
YmVkZGVkIGludG8gT0VNCj4+PiBkZXZpY2V0cmVlcyByYXRoZXIgdGhhbiBleGNsdXNpdmVseSB1
bmRlciB0aGUgY29udHJvbCBvZiB0aGUgdmVuZG9yLgo+PiBTbyBpbiBuZXh0IGVtYWlsIHlvdSBn
aXZlIGdvb2QgcmVhc29uIG5vdCB0byBhcHBseSB0aGlzIDotKS4KPiBBZnJhaWQgc28uLi4gaXQg
d2FzIG9uIHBhZ2UgMiBvZiBteSBnb29nbGUgc2VhcmNoIHNvIEkgZGlkIGEgcXVpY2sKPiBzZWFy
Y2gsIHNlbnQgdGhlIGZpcnN0IG1haWwgYW5kIHRoZW4gd2VudCBiYWNrIHRvIG15IHdlYiBicm93
c2VyLgo+Cj4gSXQgd2FzIGF0IHRoYXQgbW9tZW50IHRoYXQgSSBkZWNpZGVkIGEgcXVpY2sgc2Vh
cmNoIHdhc24ndCBlbm91Z2ggYW5kCj4gZGVjaWRlZCB0byBnb3QgYSBsaXR0bGUgZGVlcGVyIQo+
Cj4KPiBEYW5pZWwuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
