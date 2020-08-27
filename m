Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 050AF25552E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3276E4F1;
	Fri, 28 Aug 2020 07:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8E86E2B2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 13:31:29 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d27so4486262qtg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=labbott.name; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lDczrlJd3qpi62PuNHOBqp+bVIuJaZ3CIq+6qbkhanw=;
 b=RNiGEKW35DYb/JfM8HflEt7mDoN5TTPevUjWrFEMiWnB7Nb4c3aWKy7OU/kyHLadcm
 xBs4dPO9yvjR28pNvlkIVvz1z48FwzX+Q7XHHN6Hc6GYQb3xJXyaCtC7yoF6eGgJlzB5
 q3NWsx/2aKVfGGvJjPYX2AMGRKQLIZVqtIxk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lDczrlJd3qpi62PuNHOBqp+bVIuJaZ3CIq+6qbkhanw=;
 b=se+lMfY/Us9ugCOTbgzWzaENIjeyAJbeIJMMUYHWffn3cMZ+zJnKeAMyVQ0h+o5QsO
 palHhAAUzOtqRz/KPkiXxv7Y4DJv4Jm4SjtNgsuuzXYJ5iaj9+1MyEtSis71r4Qeivd8
 gNY6AZqoVx77lv0in649mH7GbhR4XtYTUFtLpnW0VsWK7nEgRDgBwSoQ3Qs8R6V8JFMl
 DaYk6N9A5lGqkL/KBapn1Vclh3uHT8OwpL7ID2s6BnZasRnpOzoEIoAuWDrqr+yVP9N7
 aXA3R1QU8gTd2uldTVgO96gha0L2c5ZL2HrBWatQtsgPIsLebig4QQLt5bS4ShGgL91C
 8cnw==
X-Gm-Message-State: AOAM532EAmq0Y30Osdth8HZJ6bTzLkRtF4NQF6BhiLI5hMR3pW/q8gON
 ulLwaS0KRi72ZKfSr+VPta1LrQ==
X-Google-Smtp-Source: ABdhPJz94NCDJe1Y3TCUAT1fErYJ7r4fw5orM7dXc6gbtDSEIf2lbXNnjENlynBt6QlAePZlj2K0AQ==
X-Received: by 2002:ac8:4f44:: with SMTP id i4mr6328121qtw.189.1598535088575; 
 Thu, 27 Aug 2020 06:31:28 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net.
 [74.109.246.95])
 by smtp.gmail.com with ESMTPSA id i7sm1774133qkb.131.2020.08.27.06.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 06:31:28 -0700 (PDT)
Subject: Re: [PATCH] staging: ion: remove from the tree
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sumit.semwal@linaro.org, 
 john.stultz@linaro.org
References: <20200827123627.538189-1-gregkh@linuxfoundation.org>
From: Laura Abbott <laura@labbott.name>
Message-ID: <3d8de519-65b3-123b-8ace-e820982884e0@labbott.name>
Date: Thu, 27 Aug 2020 09:31:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200827123627.538189-1-gregkh@linuxfoundation.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: devel@driverdev.osuosl.org, linaro-mm-sig@lists.linaro.org,
 Shuah Khan <shuah@kernel.org>, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Suren Baghdasaryan <surenb@google.com>,
 Christoph Hellwig <hch@infradead.org>, Joel Fernandes <joel@joelfernandes.org>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Hridya Valsaraju <hridya@google.com>, kernel-team@android.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Christian Brauner <christian@brauner.io>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yNy8yMCA4OjM2IEFNLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gVGhlIElPTiBh
bmRyb2lkIGNvZGUgaGFzIGxvbmcgYmVlbiBtYXJrZWQgdG8gYmUgcmVtb3ZlZCwgbm93IHRoYXQg
d2UKPiBkbWEtYnVmIHN1cHBvcnQgbWVyZ2VkIGludG8gdGhlIHJlYWwgcGFydCBvZiB0aGUga2Vy
bmVsLgo+IAo+IEl0IHdhcyB0aG91Z2h0IHRoYXQgd2UgY291bGQgd2FpdCB0byByZW1vdmUgdGhl
IGlvbiBrZXJuZWwgYXQgYSBsYXRlcgo+IHRpbWUsIGJ1dCBhcyB0aGUgb3V0LW9mLXRyZWUgQW5k
cm9pZCBmb3JrIG9mIHRoZSBpb24gY29kZSBoYXMgZGl2ZXJnZWQKPiBxdWl0ZSBhIGJpdCwgYW5k
IGFueSBBbmRyb2lkIGRldmljZSB1c2luZyB0aGUgaW9uIGludGVyZmFjZSB1c2VzIHRoYXQKPiBm
b3JrZWQgdmVyc2lvbiBhbmQgbm90IHRoaXMgaW4tdHJlZSB2ZXJzaW9uLCB0aGUgaW4tdHJlZSBj
b3B5IG9mIHRoZQo+IGNvZGUgaXMgYWJhbmRvbmRlZCBhbmQgbm90IHVzZWQgYnkgYW55b25lLgo+
IAo+IENvbWJpbmUgdGhpcyBhYmFuZG9uZWQgY29kZWJhc2Ugd2l0aCB0aGUgbmVlZCB0byBtYWtl
IGNoYW5nZXMgdG8gaXQgaW4KPiBvcmRlciB0byBrZWVwIHRoZSBrZXJuZWwgYnVpbGRpbmcgcHJv
cGVybHksIHdoaWNoIHRoZW4gY2F1c2VzIG1lcmdlCj4gaXNzdWVzIHdoZW4gbWVyZ2luZyB0aG9z
ZSBjaGFuZ2VzIGludG8gdGhlIG91dC1vZi10cmVlIEFuZHJvaWQgY29kZSwgYW5kCj4geW91IGVu
ZCB1cCB3aXRoIHR3byBkaWZmZXJlbnQgZ3JvdXBzIG9mIHBlb3BsZSAodGhlIGluLWtlcm5lbC10
cmVlCj4gZGV2ZWxvcGVycywgYW5kIHRoZSBBbmRyb2lkIGtlcm5lbCBkZXZlbG9wZXJzKSB3aG8g
YXJlIGJvdGggYW5ub3llZCBhdAo+IHRoZSBjdXJyZW50IHNpdHVhdGlvbi4gIEJlY2F1c2Ugb2Yg
dGhpcyBwcm9ibGVtLCBqdXN0IGRyb3AgdGhlIGluLWtlcm5lbAo+IGNvcHkgb2YgdGhlIGlvbiBj
b2RlIG5vdywgYXMgaXQncyBub3QgdXNlZCwgYW5kIGlzIG9ubHkgY2F1c2luZyBwcm9ibGVtcwo+
IGZvciBldmVyeW9uZSBpbnZvbHZlZC4KPiAKPiBDYzogIkFydmUgSGrDuG5uZXbDpWciIDxhcnZl
QGFuZHJvaWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPiBDYzogQ2hyaXN0aWFuIEJyYXVuZXIgPGNocmlzdGlhbkBicmF1bmVyLmlvPgo+
IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Cj4gQ2M6IEhyaWR5YSBW
YWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgo+IENjOiBKb2VsIEZlcm5hbmRlcyA8am9lbEBq
b2VsZmVybmFuZGVzLm9yZz4KPiBDYzogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5v
cmc+Cj4gQ2M6IExhdXJhIEFiYm90dCA8bGF1cmFAbGFiYm90dC5uYW1lPgo+IENjOiBNYXJ0aWpu
IENvZW5lbiA8bWFjb0BhbmRyb2lkLmNvbT4KPiBDYzogU2h1YWggS2hhbiA8c2h1YWhAa2VybmVs
Lm9yZz4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzog
U3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KPiBDYzogVG9kZCBLam9zIDx0
a2pvc0BhbmRyb2lkLmNvbT4KPiBDYzogZGV2ZWxAZHJpdmVyZGV2Lm9zdW9zbC5vcmcKPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3Rz
LmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPgoKV2UgZGlzY3Vzc2VkIHRoaXMgYXQgdGhlIEFuZHJvaWQgTUMg
b24gTW9uZGF5IGFuZCB0aGUgcGxhbiB3YXMgdG8KcmVtb3ZlIGl0IGFmdGVyIHRoZSBuZXh0IExU
UyByZWxlYXNlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
