Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFEB4E9C4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 15:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BAD6E8AF;
	Fri, 21 Jun 2019 13:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D216E8AF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 13:46:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f9so6616008wre.12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 06:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fsl6G8YTqffB4W+GrIdfXouKWDu5oZYLhjb4Pl5CbAc=;
 b=hu9XJ5qkM470sfepZlueSlgvwhxUt4m6iusH13c0hlNa41IX184CKn6efZMpxsPnwc
 /xRo8uHUDPZMCTiZqAzHGygQoLHCi7RtNMDNJhn/qPPoP0g4NZGLGgdWDKGC1U9qEApm
 ZZbh7IBFTWM3P82x1UIPo6EYqE6xNAwFfDgLZwN9MyBIS96Emf7eoNaI+Pa2kGughrMb
 tntgk4r93njgHSbG0CX0tubcMtc6/PabnlJkiL/PfUsByt2+Tn2lrGZ0rm0GZt8uwoGs
 b96FCw8ZvmObxeGzOazuEVpjFaWs9sfimjMZSnCoZcoYtk9tMjXvJTjOKoL7v07vePKK
 CsPw==
X-Gm-Message-State: APjAAAWg1pUnh8sZlZq77PXaVRptDyaIazmm26aOqyofqbCOnzbTNRIa
 qhGSzi6GZv3IjgfZaZKWvBKwMA==
X-Google-Smtp-Source: APXvYqzuxd700m2oO/6gDaV4ikgi9SOYwRR+juNE8PLe86NWJtDUoBfzcLJE+P87+e1rwJ4AtW3/Sg==
X-Received: by 2002:adf:f186:: with SMTP id h6mr6525375wro.274.1561124766992; 
 Fri, 21 Jun 2019 06:46:06 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id n14sm5486804wra.75.2019.06.21.06.46.05
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 06:46:06 -0700 (PDT)
Subject: Re: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
To: Brian Dodge <bdodge09@gmail.com>, Pavel Machek <pavel@ucw.cz>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd> <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
Date: Fri, 21 Jun 2019 14:46:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fsl6G8YTqffB4W+GrIdfXouKWDu5oZYLhjb4Pl5CbAc=;
 b=maUqdBdFPl+T4iwpSMixGvxDvl62/w+KU299aTJVywzS6RF+/FyD5ACJTozKISJVYq
 1+tdS+0sxEspNhEflbXcbBJ3+yoFsFxu94hv5EkqhGfVfOmqURvqs5vXE+iysGv2b1hA
 TwThPtQplB9jihopLAL5D4RbNaj+hnzEGg4k+M1zC4k+7RxxF5YjtQLS0pvB8J3YGZBC
 k4WhZ8fhm3mPcj96W/v1iXmdbJDc7K5QMjasLj7SE0PHCawZlDn0e3vAXe7xMmgpauSn
 qwkeEKiMf8uiOZwdPQeGXBoOR7mz/AEd4niWPzKothP67RjI5hr8krPYi15okJCFq6hZ
 ve/A==
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

W1NvcnJ5IHRvIHRob3NlIHJlY2VpdmluZyB0aGlzIHR3aWNlLi4uIGhhZCB0byBkaWcgdGhpcyBv
dXQgZnJvbSB0aGUgCmFyY2hpdmVzIGFuZCBzZW50IGl0IHRvIHRoZSBsaXN0cyBmcm9tIHRoZSB3
cm9uZyBtYWlsZXJdCgpPbiAyNy8xMS8yMDE4IDAwOjQ0LCBCcmlhbiBEb2RnZSB3cm90ZToKPiBU
aGFuayB5b3UgUGF2ZWwsIHRoYXQgaXMgYSBnb29kIHBvaW50Lgo+IAo+IFRoZSBjaGlwIHZlbmRv
ciBoYXMgaW5kaWNhdGVkIHRoYXQgdGhlcmUgaXMgbm8gcmVhc29uIHRvIG1haW50YWluIHRoZSAK
PiBvbGQvaW1wcm9wZXIgcHJlZml4IGFuZCB3aXNoZXMgdG8gZ28gZm9yd2FyZCAob25seSkgd2l0
aCB0aGUgImFyY3RpYyIgCj4gcHJlZml4IGFuZCBhbnkgZXhpc3RpbmcgZHRzIGZpbGVzIGFyZSBv
ciB3aWxsIGJlIHVwZGF0ZWQuCgpMb29rcyBsaWtlIHRoaXMgcGF0Y2ggc2VyaWVzIGhhcyBmYWxs
ZW4gaW50byB0aGUgY3JhY2tzIGEgbGl0dGxlLgoKSSB0aGluayBJIGFzc3VtZWQgdGhpcyBpbmZv
IHdvdWxkIGVuZCBpbiB0aGUgZGVzY3JpcHRpb24gb2YgcGF0Y2ggdjIgMS8zIAooaW4gb3JkZXIg
dG8gYW5zd2VyIFJvYidzIGZlZWRiYWNrKSBhbmQgSSBzYXQgYW5kIHdhaXRlZCBmb3IgYSByZXNw
aW4uIApPbiB0aGUgb3RoZXIgaGFuZC4uLiBJIGRpZG4ndCBhY3R1YWxseSBzYXkgdGhhdCBleHBs
aWNpdGx5IGFueXdoZXJlISAKU28uLi4gSSdkIHJlY29tbWVuZCBhIHJlc3BpbiBwZXJoYXBzIHdp
dGggYSBzbWFsbCBiaXQgb2YgdGV4dCBleHBsYWluaW5nIApob3cgdGhlIHZlbmRvciBjYW4gc3Rh
dGUgdGhhdCBhbnkgZXhpc3RpbmcgZHRzIGZpbGVzIHdpbGwgYmUgdXBkYXRlZC4gClRoaXMgaXMg
YSBwZXJpcGhlcmFsIGRldmljZSBzbyB0aGVzZSBzdHJpbmdzIGFyZSBwcm9iYWJseSBlbWJlZGRl
ZCBpbnRvIApPRU0gZGV2aWNldHJlZXMgcmF0aGVyIHRoYW4gZXhjbHVzaXZlbHkgdW5kZXIgdGhl
IGNvbnRyb2wgb2YgdGhlIHZlbmRvci4KCgpEYW5pZWwuCgoKPiAKPiBPbiAxMS8xMS8xOCA2OjMw
IEFNLCBQYXZlbCBNYWNoZWsgd3JvdGU6Cj4+IEhpIQo+Pgo+Pj4gVGhlIHZlbmRvci1wcmVmaXhl
cy50eHQgZmlsZSBwcm9wZXJseSByZWZlcnMgdG8gQXJjdGljU2FuZAo+Pj4gYXMgYXJjdGljIGJ1
dCB0aGUgZHJpdmVyIGltcHJvcGVybHkgYWJicmV2aWF0ZWQgdGhlIHByZWZpeAo+Pj4gdG8gYXJj
LiBUaGlzIHdhcyBhIG1pc3Rha2UgaW4gdGhlIG9yaWdpbmFsIHBhdGNoCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogQnJpYW4gRG9kZ2UgPGJkb2RnZTA5QGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gwqAg
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYXJjeGNubl9ibC5jIHwgMjIgKysrKysrKysrKystLS0t
LS0tLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQo+Pj4KPj4+IMKgwqAgKgo+Pj4gLSAqIENvcHlyaWdodCAyMDE2IEFyY3RpY1NhbmQs
IEluYy4KPj4+IC0gKiBBdXRob3IgOiBCcmlhbiBEb2RnZSA8YmRvZGdlQGFyY3RpY3NhbmQuY29t
Pgo+Pj4gKyAqIENvcHlyaWdodCAyMDE4IHBTZW1pLCBJbmMuCj4+PiArICogQXV0aG9yIDogQnJp
YW4gRG9kZ2UgPGJkb2RnZUBwc2VtaS5jb20+Cj4+IFVtbW0uIENvcHlyaWdodCAyMDE2LTIwMTg/
Cj4+Cj4+PiBAQCAtMjAyLDI3ICsyMDIsMjcgQEAgc3RhdGljIHZvaWQgYXJjeGNubl9wYXJzZV9k
dChzdHJ1Y3QgYXJjeGNubiAqbHApCj4+PiDCoMKgwqDCoMKgIGlmIChyZXQgPT0gMCkKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBscC0+cGRhdGEtPmluaXRpYWxfYnJpZ2h0bmVzcyA9IHByb2dfdmFs
Owo+Pj4KPj4+IC3CoMKgwqAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxs
ZWQtY29uZmlnLTAiLCAmcHJvZ192YWwpOwo+Pj4gK8KgwqDCoCByZXQgPSBvZl9wcm9wZXJ0eV9y
ZWFkX3UzMihub2RlLCAiYXJjdGljLGxlZC1jb25maWctMCIsICZwcm9nX3ZhbCk7Cj4+PiDCoMKg
wqDCoMKgIGlmIChyZXQgPT0gMCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBscC0+cGRhdGEtPmxl
ZF9jb25maWdfMCA9ICh1OClwcm9nX3ZhbDsKPj4+Cj4+IElmIHRoZXJlJ3MgYSBkdHMgdXNpbmcg
dGhpcywgeW91IHdhbnQgdG8gdXBkYXRlIGl0IGF0IHRoZSBzYW1lCj4+IHRpbWUuIFlvdSBtYXkg
d2FudCB0byBzdXBwb3J0IGJvdGggbmFtZXMgZ29pbmcgZm9yd2FyZC4KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBQYXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
