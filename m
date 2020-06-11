Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5471F82A4
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCA26E40F;
	Sat, 13 Jun 2020 10:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E006E2F2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 14:44:42 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c12so5734436qkk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GuZ/2YfzuKQvhddD6bDELUgkTCvQFemnpB9NAFBuxW8=;
 b=LptNAwM2yvONwlkObU2zhW+2yYC8+7IIFrx8mbhfT/qdcEYMasK7jSCepxhRO8hHiK
 8KJj4NJw8PVYrs9OTq9KToZ4yA7Sh2QVwk5RapYF/XNAtrkYEsNqjrWGszgjw++dnEKC
 D6EGWXLBDtLCg+BpmnYZV2MKpMWU+8+fafQlHh4K/9Hh9gk7GLuZRLAG3DLf1kxlLUvB
 1bit8coUQd2+e9gvEo7ObPTPaf5DJBFR0BcIumLRR+iSCdfFevcgiZjwRXwyLiIOLmlP
 KraWtqt/9jffxCglG+CU+E/TMqLjZuiIX4WIyDFDbiRUswjLAdXDoySoX6+AWtShUe3x
 K32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GuZ/2YfzuKQvhddD6bDELUgkTCvQFemnpB9NAFBuxW8=;
 b=asI5/QdLFeVk4JzR2qr9TjxzTLiN8ES1EujZV33p5cxs7T1mehs8PbODl2+sTMXe38
 zQQST5cSl1Z826KY68htMyFKYlLYApJ9dPT1bkhCXdecrOuiTSC6ZsoyC2ewbXGqRc//
 x27dyAhMhUsHRwmQbt3NaHe4G8BLcH1NIMT9/Ww7o8VBgUu/r1iJTWJ2Epmg9JTMYFX0
 9MC3EOEzgHOG69IALes7DD75kqOybgHP5Cfv/8q9mVDnc9hBRmw44zSvj3GQwRlEsIjQ
 jPCwpgUl+U6i8lmE+S9xF+B15s8xvyhi6Np9iYpK9TUpIwvOdz916JJgdSghEOriamLb
 wyVQ==
X-Gm-Message-State: AOAM5300TtQdUlW39wH6hwLXgovrjHo0TPF9OHJm630/RaWbTCWzsSxa
 lgkiYtKDBpDSGA3EwwO5WkH5PyBzc7yrtA==
X-Google-Smtp-Source: ABdhPJwnR1GhPXpkQ5WmzTcWno1iYdLj+m7QDT4gQp+ZJG51SrStw9FWMxcWjwbfg9AkzzGkeZXVKA==
X-Received: by 2002:a37:aa81:: with SMTP id t123mr9052562qke.11.1591886681431; 
 Thu, 11 Jun 2020 07:44:41 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id y16sm2625629qty.1.2020.06.11.07.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 07:44:40 -0700 (PDT)
Subject: Re: [PATCH 7/8] drm/msm/dpu: add SM8150 to hw catalog
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
References: <20200526032235.21930-1-jonathan@marek.ca>
 <20200526032235.21930-8-jonathan@marek.ca>
 <ce713ed0-5f11-e92f-0ef4-c87690b67090@linaro.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <1109ea8b-38a5-37ea-7ed8-a4ead99658e2@marek.ca>
Date: Thu, 11 Jun 2020 10:45:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ce713ed0-5f11-e92f-0ef4-c87690b67090@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMS8yMCAxMDozNyBBTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToKPiBPbiAyNi8wNS8y
MDIwIDA2OjIyLCBKb25hdGhhbiBNYXJlayB3cm90ZToKPj4gVGhpcyBicmluZ3MgdXAgYmFzaWMg
dmlkZW8gbW9kZSBmdW5jdGlvbmFsaXR5IGZvciBTTTgxNTAgRFBVLiBDb21tYW5kIAo+PiBtb2Rl
Cj4+IGFuZCBkdWFsIG1peGVyL2ludGYgY29uZmlndXJhdGlvbnMgYXJlIG5vdCB3b3JraW5nLCBm
dXR1cmUgcGF0Y2hlcyB3aWxsCj4+IGFkZHJlc3MgdGhpcy4gU2NhbGVyIGZ1bmN0aW9uYWxpdHkg
YW5kIG11bHRpcGxlIHBsYW5lcyBpcyBhbHNvIHVudGVzdGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBKb25hdGhhbiBNYXJlayA8am9uYXRoYW5AbWFyZWsuY2E+Cj4+IC0tLQo+PiDCoCAuLi4vZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmPCoMKgwqAgfCAxNDcgKysrKysrKysr
KysrKysrKysrCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19tZHNz
LmjCoMKgIHzCoMKgIDIgKwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE0OSBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdf
Y2F0YWxvZy5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRh
bG9nLmMKPj4gaW5kZXggMWU2NGZhMDhjMjE5Li5mOTk2MjI4NzA2NzYgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmMKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2cuYwo+PiBAQCAtOTAs
NiArOTAsMjMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcHVfY2FwcyBzYzcxODBfZHB1X2NhcHMg
PSB7Cj4+IMKgwqDCoMKgwqAgLnBpeGVsX3JhbV9zaXplID0gREVGQVVMVF9QSVhFTF9SQU1fU0la
RSwKPj4gwqAgfTsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHB1X2NhcHMgc204MTUwX2RwdV9j
YXBzID0gewo+PiArwqDCoMKgIC5tYXhfbWl4ZXJfd2lkdGggPSBERUZBVUxUX0RQVV9PVVRQVVRf
TElORV9XSURUSCwKPj4gK8KgwqDCoCAubWF4X21peGVyX2JsZW5kc3RhZ2VzID0gMHhiLAo+PiAr
wqDCoMKgIC5tYXhfbGluZXdpZHRoID0gNDA5NiwKPj4gK8KgwqDCoCAucXNlZWRfdHlwZSA9IERQ
VV9TU1BQX1NDQUxFUl9RU0VFRDMsCj4+ICvCoMKgwqAgLnNtYXJ0X2RtYV9yZXYgPSBEUFVfU1NQ
UF9TTUFSVF9ETUFfVjJfNSwKPiAKPiBJdCBzZWVtcyB5b3UgbWlzc2VkIHNlbmRpbmcgYSBwYXRj
aCBhZGRpbmcgc3VwcG9ydCBmb3IgCj4gRFBVX1NTUFBfU01BUlRfRE1BX1YyXzUuIENvdWxkIHlv
dSBwbGVhc2UgcG9pbnQgdG8gaXQ/Cj4gCj4gCgpUaGVyZSBhcmUgbm8gb3RoZXIgY2hhbmdlcyBy
ZWxhdGVkIHRvIHRoYXQsIHRoZSBkcml2ZXIgbmV2ZXIgY2hlY2tzIApzbWFydF9kbWFfcmV2IGFu
ZCB0aGUgY29ycmVjdCB2ZXJzaW9uIG51bWJlciBpcyBvbmx5IHNldCBmb3Igd2hlbiB0aGUgCmRy
aXZlciBzdXBwb3J0cyBpdCAoaWYgZXZlcikuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
