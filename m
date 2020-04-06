Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E58441A08F2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B566E595;
	Tue,  7 Apr 2020 08:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C436E3F3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 14:58:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h2so6992189wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 07:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QqDAWAbXdJoapZ421HD1AwvmWU/XHin8L8Ig0e3Jtwg=;
 b=RXidlqPi2d9KZAK7cV4uXG5PEtmkcW8PwU6YIpExQo9sa0XtYEeXH0gVWr8ml/FkRF
 NfqXyDyEepaVAkKXQ9UY3H5ChXFJd0/+7OJM+TxWswWi8W/ZYta8OWMJ31+XvhPl2/GT
 nJS/92/n86qkdWn9+zd3Nv0RKQiW0dCkTn6KhJvhB/HhQ6f8P8caNGTsAD9WWVJzlWf2
 xWILcxBSqPHb0GSsnV63LuQ7obtjvUw9lUhjxUt3gWQ0Z55zyigMeJ8apqIAFJbk/5Nd
 q9Po5hje5Ut1+vo6jPXL46uJ6xGH77BX8TcIxYc4T1mCKIScIi/4zePQDkU+l48TJvF4
 K0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QqDAWAbXdJoapZ421HD1AwvmWU/XHin8L8Ig0e3Jtwg=;
 b=AxB5bmzCspHYr0xc4V2Y8DK/Rn62LWlk7ZI7qF+R3nZXtwoK5/VJwGv3GVAPQHKOqN
 WTUdiylxWpcaK9RAOLOLBQrzfVxYfTu93Timmsji6C2gvv3b5uFNl6X5uFE3MQfpRX6c
 Nlie728RBRD8KYKy0JDhZnZqx7Vqz53WnLNaluHgWR1EeeoQX6XYYpLFC5be4U1imEMQ
 0NuUJqudeEiB718UwfX9bpIltdtyzHO6qLnZh9owIRVn/AL7vzd+62GSRjg/jd/oRlC5
 NJ3ICcN3p8et2a/0WlMGQ8ZHjFxqiltkMI+9FGGvESiSQySLmAUQairdIuZSfrAcsOkH
 cr3A==
X-Gm-Message-State: AGi0PuZ6hxPNONiLciWo/PkuBJUybiKDmITQh/0IanRU+HaNNyEVJdHZ
 YVkMt5yd9/MUbkjWuETg+T2BHg==
X-Google-Smtp-Source: APiQypLq+c59r/HQ8kZv16pyO640FTzZl36HM1GpKXjGuJBBz6tZNBfZhhsONSa8iMdA+w54zf2y9A==
X-Received: by 2002:a1c:bd54:: with SMTP id n81mr72489wmf.141.1586185135875;
 Mon, 06 Apr 2020 07:58:55 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:b51c:42dc:1499:2880?
 ([2a01:e34:ed2f:f020:b51c:42dc:1499:2880])
 by smtp.googlemail.com with ESMTPSA id b7sm27573604wrn.67.2020.04.06.07.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 07:58:55 -0700 (PDT)
Subject: Re: [PATCH v5 1/5] PM / EM: add devices to Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200318114548.19916-1-lukasz.luba@arm.com>
 <20200318114548.19916-2-lukasz.luba@arm.com>
 <09b680a5-a118-8c6e-0ae1-03ab5f10c573@linaro.org>
 <cb7f670a-a04f-ba6f-1486-0421f3cce2e9@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6b980e2a-c15c-0718-14b8-e8aa7510c832@linaro.org>
Date: Mon, 6 Apr 2020 16:58:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cb7f670a-a04f-ba6f-1486-0421f3cce2e9@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:32 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, Morten.Rasmussen@arm.com, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 javi.merino@arm.com, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, mka@chromium.org, rdunlap@infradead.org, rjw@rjwysocki.net,
 agross@kernel.org, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIEx1a2FzeiwKCgpPbiAwNi8wNC8yMDIwIDE1OjI5LCBMdWthc3ogTHViYSB3cm90ZToKPiBI
aSBEYW5pZWwsCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lgo+IAo+IE9uIDQvMy8yMCA1
OjA1IFBNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4KPj4gSGkgTHVrYXN6LAo+Pgo+Pgo+PiBP
biAxOC8wMy8yMDIwIDEyOjQ1LCBMdWthc3ogTHViYSB3cm90ZToKPj4+IEFkZCBzdXBwb3J0IG9m
IG90aGVyIGRldmljZXMgaW50byB0aGUgRW5lcmd5IE1vZGVsIGZyYW1ld29yayBub3Qgb25seQo+
Pj4gdGhlCj4+PiBDUFVzLiBDaGFuZ2UgdGhlIGludGVyZmFjZSB0byBiZSBtb3JlIHVuaWZpZWQg
d2hpY2ggY2FuIGhhbmRsZSBvdGhlcgo+Pj4gZGV2aWNlcyBhcyB3ZWxsLgo+Pgo+PiB0aGFua3Mg
Zm9yIHRha2luZyBjYXJlIG9mIHRoYXQuIE92ZXJhbGwgSSBsaWtlIHRoZSBjaGFuZ2VzIGluIHRo
aXMgcGF0Y2gKPj4gYnV0IGl0IGhhcmQgdG8gcmV2aWV3IGluIGRldGFpbHMgYmVjYXVzZSB0aGUg
cGF0Y2ggaXMgdG9vIGJpZyA6Lwo+Pgo+PiBDb3VsZCB5b3Ugc3BsaXQgdGhpcyBwYXRjaCBpbnRv
IHNtYWxsZXIgb25lcz8KPj4KPj4gZWcuIChhdCB5b3VyIGNvbnZlbmllbmNlKQo+Pgo+PiDCoCAt
IE9uZSBwYXRjaCByZW5hbWluZyBzL2NhcC9wZXJmLwo+Pgo+PiDCoCAtIE9uZSBwYXRjaCBhZGRp
bmcgYSBuZXcgZnVuY3Rpb246Cj4+Cj4+IMKgwqDCoMKgIGVtX2Rldl9yZWdpc3Rlcl9wZXJmX2Rv
bWFpbihzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1bnNpZ25lZCBpbnQgbnJfc3RhdGVzLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGVtX2RhdGFfY2FsbGJhY2sgKmNiKTsKPj4KPj4gwqDCoMKgICgrIEVYUE9SVF9T
WU1CT0xfR1BMKQo+Pgo+PiDCoMKgwqDCoCBBbmQgZW1fcmVnaXN0ZXJfcGVyZl9kb21haW4oKSB1
c2luZyBpdC4KPj4KPj4gwqAgLSBPbmUgY29udmVydGluZyB0aGUgZW1fcmVnaXN0ZXJfcGVyZl9k
b21haW4oKSB1c2VyIHRvCj4+IMKgwqDCoMKgZW1fZGV2X3JlZ2lzdGVyX3BlcmZfZG9tYWluCj4+
Cj4+IMKgIC0gT25lIGFkZGluZyB0aGUgZGlmZmVyZW50IG5ldyAnZW0nIGZ1bmN0aW9ucwo+Pgo+
PiDCoCAtIEFuZCBmaW5hbGx5IG9uZSByZW1vdmluZyBlbV9yZWdpc3Rlcl9wZXJmX2RvbWFpbigp
Lgo+IAo+IEkgYWdyZWUgYW5kIHdpbGwgZG8gdGhlIHNwbGl0LiBJIGNvdWxkIGFsc28gYnJlYWsg
dGhlIGRlcGVuZGVuY2llcwo+IGZvciBmdXR1cmUgZWFzaWVyIG1lcmdlLgo+IAo+Pgo+Pgo+Pj4g
QWNrZWQtYnk6IFF1ZW50aW4gUGVycmV0IDxxcGVycmV0QGdvb2dsZS5jb20+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBMdWthc3ogTHViYSA8bHVrYXN6Lmx1YmFAYXJtLmNvbT4KPj4+IC0tLQo+Pgo+PiBb
IC4uLiBdCj4+Cj4+PiDCoCAyLiBDb3JlIEFQSXMKPj4+IEBAIC03MCwxNCArNzIsMTYgQEAgQ09O
RklHX0VORVJHWV9NT0RFTCBtdXN0IGJlIGVuYWJsZWQgdG8gdXNlIHRoZSBFTQo+Pj4gZnJhbWV3
b3JrLgo+Pj4gwqAgRHJpdmVycyBhcmUgZXhwZWN0ZWQgdG8gcmVnaXN0ZXIgcGVyZm9ybWFuY2Ug
ZG9tYWlucyBpbnRvIHRoZSBFTQo+Pj4gZnJhbWV3b3JrIGJ5Cj4+PiDCoCBjYWxsaW5nIHRoZSBm
b2xsb3dpbmcgQVBJOjoKPj4+IMKgIC3CoCBpbnQgZW1fcmVnaXN0ZXJfcGVyZl9kb21haW4oY3B1
bWFza190ICpzcGFuLCB1bnNpZ25lZCBpbnQKPj4+IG5yX3N0YXRlcywKPj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBlbV9kYXRhX2NhbGxiYWNrICpjYik7Cj4+
PiArwqAgaW50IGVtX3JlZ2lzdGVyX3BlcmZfZG9tYWluKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5z
aWduZWQgaW50Cj4+PiBucl9zdGF0ZXMsCj4+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IGVtX2Rh
dGFfY2FsbGJhY2sgKmNiLCBjcHVtYXNrX3QgKmNwdXMpOwo+Pgo+PiBJc24ndCBwb3NzaWJsZSB0
byBnZXQgcmlkIG9mIHRoaXMgY3B1bWFzayBieSB1c2luZwo+PiBjcHVmcmVxX2NwdV9nZXQoKSB3
aGljaCByZXR1cm5zIHRoZSBjcHVmcmVxJ3MgcG9saWN5IGFuZCBmcm9tIHRoZWlyIGdldAo+PiB0
aGUgcmVsYXRlZCBjcHVzID8KPiAKPiBXZSBoYWQgc2ltaWxhciB0aG91Z2h0cyB3aXRoIFF1ZW50
aW4gYW5kIEkndmUgY2hlY2tlZCB0aGlzLgoKWWVhaCwgSSBzdXNwZWN0ZWQgeW91IGFscmVhZHkg
dGhpbmsgYWJvdXQgdGhhdCA6KQoKPiBVbmZvcnR1bmF0ZWx5LCBpZiB0aGUgcG9saWN5IGlzIGEg
J25ldyBwb2xpY3knIFsxXSBpdCBnZXRzCj4gYWxsb2NhdGVkIGFuZCBwYXNzZWQgaW50byBjcHVm
cmVxIGRyaXZlciAtPmluaXQocG9saWN5KSBbMl0uCj4gVGhlbiB0aGF0IHBvbGljeSBpcyBzZXQg
aW50byBwZXJfY3B1IHBvaW50ZXIgZm9yIGVhY2ggcmVsYXRlZF9jcHUgWzNdOgo+IAo+IGZvcl9l
YWNoX2NwdShqLCBwb2xpY3ktPnJlbGF0ZWRfY3B1cykKPiDCoMKgwqDCoHBlcl9jcHUoY3B1ZnJl
cV9jcHVfZGF0YSwgaikgPSBwb2xpY3k7Cj4gCj4gIAo+IFRodXMsIGFueSBjYWxscyBvZiBmdW5j
dGlvbnMgKGkuZS4gY3B1ZnJlcV9jcHVfZ2V0KCkpIHdoaWNoIHRyeSB0bwo+IHRha2UgdGhpcyBw
dHIgYmVmb3JlIFszXSB3b24ndCB3b3JrLgo+IAo+IFdlIGFyZSB0cnlpbmcgdG8gcmVnaXN0ZXIg
RU0gZnJvbSBjcHVmcmVxX2RyaXZlci0+aW5pdChwb2xpY3kpIGFuZCB0aGUKPiBwZXJfY3B1IHBv
bGljeSBpcyBsaWtlbHkgdG8gYmUgbm90IHBvcHVsYXRlZCBhdCB0aGF0IHBoYXNlLgoKV2hhdCBp
cyB0aGUgcHJvYmxlbSBvZiByZWdpc3RlcmluZyBhdCB0aGUgZW5kIG9mIHRoZSBjcHVmcmVxX29u
bGluZSA/CgoKPiBbMV0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qv
c291cmNlL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLmMjTDEzMjgKPiAKPiBbMl0KPiBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvY3B1ZnJlcS9j
cHVmcmVxLmMjTDEzNTAKPiAKPiBbM10KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLmMjTDEzNzQKPiAKPiAKPiAK
CgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNl
IHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vi
b29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9s
aW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4g
QmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
