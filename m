Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F40209AFA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 10:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5100189C6B;
	Thu, 25 Jun 2020 08:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01C989C6B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 08:03:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 22so4621764wmg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0M8Y/ZNSXHt2pcvJaMnq9jm7EeSpBp7mRNluLRRdmdk=;
 b=KETKesxFm86ICb2fFOUJiGjNCAEbBZjL92c4QkfD/GqbqjQl7b8TszNs+54WN/0KRt
 5P2rS7jWeQWH7wsUV5Br8VFbTyYYVNU6dQTCB3WVg4LBOKKyPu0bSE82xwFjFvLyJVXS
 6KcpoeNo1FEyuzpFiFppZXiPNqJ9AOdR9Oom9whl7CwfHHRbdVxTx0nqm6A5cRm5LZd4
 PxNoqqBnARQTFofGB+80GKqi+RRVHdJdgrWZQdjpw+lHKX3xoNInpuHUMXBXiUjoIJU5
 ER92rajMEoZICS8y4YCEt2/PIAkxL3t7vRLPMkZjZdsi4PZmbEr/jdvbH3OE44Cd+lX7
 NzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0M8Y/ZNSXHt2pcvJaMnq9jm7EeSpBp7mRNluLRRdmdk=;
 b=eJKn6c2Jzi2IHlMBi7ACdftiJuEFj7UDywIWkSrSvXDVS/1VacTUqniuD5oJMpWXV3
 Kqz1EjZ5Rgl8eOYNU5m6J/UOO5+sHtXEtrNoesED/wWgRR4KMGqKNTo5jLMckeXaHUwH
 DgweC5ry+RubK7kj0CsLBbJW+ko3kOugonbfC1FZWOHoty+TLYK3IrzZH1aOO7puGIma
 sxUc2rXOagJFPV4dJ324O3hb41ejuCznfQM/8UAbd/1Ia54zfRvsoH+xzb9DcF1gMe9b
 BWVQT6oD6ENjzSxKaR6rA+1Q0NCe3NYzynklXhGmL/Oa9pM2SZPLY++uAkdvswC0T4ME
 a58w==
X-Gm-Message-State: AOAM532OTwkvvQi6zjGS0n10jF8iJ2xZ/KvVLPl+8XuUIM/SNP8mRGYa
 NbQEKdSeuMhLzgQvKIr6tUK/6w==
X-Google-Smtp-Source: ABdhPJzyKaUaIlRz/U+g6QVFvU1vbbyn/692EhhXT5aH0828ZYHfpZbkeM3vTyPCoD2vvAXE9IHqFw==
X-Received: by 2002:a1c:9e13:: with SMTP id h19mr2031841wme.107.1593072220241; 
 Thu, 25 Jun 2020 01:03:40 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id g144sm13671180wme.2.2020.06.25.01.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 01:03:38 -0700 (PDT)
Date: Thu, 25 Jun 2020 09:03:37 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/8] Fix a bunch of W=1 warnings in Backlight
Message-ID: <20200625080337.GN954398@dell>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624153216.GA1814806@ravnborg.org>
 <20200624154321.GH954398@dell>
 <20200624162446.GA1815586@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624162446.GA1815586@ravnborg.org>
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
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNCBKdW4gMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUuCj4gCj4g
T24gV2VkLCBKdW4gMjQsIDIwMjAgYXQgMDQ6NDM6MjFQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gT24gV2VkLCAyNCBKdW4gMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gCj4gPiA+
IEhpIExlZS4KPiA+ID4gCj4gPiA+IE9uIFdlZCwgSnVuIDI0LCAyMDIwIGF0IDAzOjU3OjEzUE0g
KzAxMDAsIExlZSBKb25lcyB3cm90ZToKPiA+ID4gPiBBdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9
MSBrZXJuZWwgYnVpbGRzLCB3aGljaCBhcmUgY3VycmVudGx5Cj4gPiA+ID4gb3ZlcndoZWxtaW5n
bHkgcmlkZGxlZCB3aXRoIG5pZ2dseSBsaXR0bGUgd2FybmluZ3MuCj4gPiA+ID4gCj4gPiA+ID4g
TGVlIEpvbmVzICg4KToKPiA+ID4gPiAgIGJhY2tsaWdodDogbG1zNTAxa2YwMzogUmVtb3ZlIHVu
dXNlZCBjb25zdCB2YXJpYWJsZXMKPiA+ID4gPiAgIGJhY2tsaWdodDogbGNkOiBBZGQgbWlzc2lu
ZyBrZXJuZWxkb2MgZW50cnkgZm9yICdzdHJ1Y3QgZGV2aWNlIHBhcmVudCcKPiA+ID4gCj4gPiA+
IAo+ID4gPiA+ICAgYmFja2xpZ2h0OiBpbGk5MjJ4OiBBZGQgbWlzc2luZyBrZXJuZWxkb2MgZGVz
Y3JpcHRpb25zIGZvcgo+ID4gPiA+ICAgICBDSEVDS19GUkVRX1JFRygpIGFyZ3MKPiA+ID4gPiAg
IGJhY2tsaWdodDogaWxpOTIyeDogUmVtb3ZlIGludmFsaWQgdXNlIG9mIGtlcm5lbGRvYyBzeW50
YXgKPiA+ID4gPiAgIGJhY2tsaWdodDogaWxpOTIyeDogQWRkIG1pc3Npbmcga2VybmVsZG9jIGRl
c2NyaXB0aW9uIGZvcgo+ID4gPiA+ICAgICBpbGk5MjJ4X3JlZ19kdW1wKCkncyBhcmcKPiA+ID4g
SSB3b25kZXIgd2h5IHRoZXNlIHdhcm5pbmdzIHNob3cgdXAgYXMgbm90aGluZyBwdWxscyBpbiB0
aGlzIC5jIGZpbGUuCj4gPiA+IEFueXdheSBJIHdvdWxkIHN1Z2dlc3QgdG8gZHJvcCB1c2luZyBr
ZXJuZWxkb2Mgc3ludGF4IGZvciBzaW5nbGUgZHJpdmVycwo+ID4gPiBsaWtlIHRoaXMgLSBhbmQg
dGhlIGJlbmVmaXQgaGVyZSBpcyBsb3cuCj4gPiA+IE5vdyB0aGV5IGFyZSB0eXBlZCwgb3RoZXJ3
aXNlIHRoaXMgYWhkIGJlZW4gZmluZSBpbiBhIHNpbmdsZSBwYXRjaC4KPiA+IAo+ID4gV2hhdCBk
byB5b3UgbWVhbiBieSAnbm90aGluZyBwdWxscyBpdCBpbic/Cj4gVGhlcmUgYXJlIG5vIC5yc3Qg
ZmlsZXMgdGhhdCBpbmNsdWRlcyBhbnk6Cj4gLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L2lsaTkyMnguYwo+IAo+IHNvIEkgZG8gbm90IHNlZSBob3cgdGhlIGtlcm5lbC1k
b2MgY29tbWVudHMgd2lsbCBiZSB1c2VkIGJ5IGFueQo+IG9mIHRoZSBnZW5lcmF0ZWQga2VybmVs
LWRvY3MuCgpMb29rcyBsaWtlIGEgY29tbW9uIHByb2JsZW0gKGlmIGl0IGlzIGFjdHVhbGx5IGEg
cHJvYmxlbSk6CgogJCAuL3NjcmlwdHMvZmluZC11bnVzZWQtZG9jcy5zaCAuIHwgd2MgLWwKIDE0
NzYKClRoZSByb2xlIG9mIHRoaXMgcGF0Y2gtc2V0IGlzIG5vdCB0byBlcmFkaWNhdGUgdW51c2Vk
IGtlcm5lbGRvYwpoZWFkZXJzLCBidXQgdG8gZW5zdXJlIHRoZXkgYXJlIGZvcm1hdHRlZCBjb3Jy
ZWN0bHkuICBXPTEgYnVpbGRzCmN1cnJlbnRseSBjb21wbGFpbiBvZiBpbGwgZm9ybWF0dGVkIGtl
cm5lbGRvY3MsIHdoaWNoIGlzIGN1cnJlbnRseQpsaXR0ZXJpbmcgdGhlIGJ1aWxkLWxvZyBhbmQg
bWFza2luZyBzb21lIG1vcmUgaW1wb3J0YW50IGlzc3VlcyAod2hpY2gKSSdtIGFsc28gdHJ5aW5n
IHRvIGZpeCBlbiByb3V0ZSkuCgo+ID4gPiA+ICAgYmFja2xpZ2h0OiBiYWNrbGlnaHQ6IFN1cHBs
eSBkZXNjcmlwdGlvbiBmb3IgZnVuY3Rpb24gYXJncyBpbiBleGlzdGluZwo+ID4gPiA+ICAgICBL
ZXJuZWxkb2NzCj4gPiA+ID4gICBiYWNrbGlnaHQ6IGxtMzYzMGFfYmw6IFJlbW92ZSBpbnZhbGlk
IGNoZWNrcyBmb3IgdW5zaWduZWQgaW50IDwgMAo+ID4gPiA+ICAgYmFja2xpZ2h0OiBxY29tLXds
ZWQ6IFJlbW92ZSB1bnVzZWQgY29uZmlncyBmb3IgTEVEMyBhbmQgTEVENAo+ID4gPiAKPiA+ID4g
VGhlIG90aGVyIGZpeGVzIGxvb2tzIGdvb2QuCj4gPiA+IFRoZXkgYXJlIGFsbDoKPiA+ID4gQWNr
ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+IAo+ID4gVGhhbmtzIChh
bHRob3VnaCB0aGlzIHNob3VsZCBiZSBSZXZpZXdlZC1ieSkuCj4gPiAKPiA+ID4gPiAgZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvYmFja2xpZ2h0LmMgIHwgMiArKwo+ID4gPiA+ICBkcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9pbGk5MjJ4LmMgICAgfCA4ICsrKysrKy0tCj4gPiA+ID4gIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2xjZC5jICAgICAgICB8IDEgKwo+ID4gPiA+ICBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9sbTM2MzBhX2JsLmMgfCA0ICsrLS0KPiA+ID4gPiAgZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvbG1zNTAxa2YwMy5jIHwgOCAtLS0tLS0tLQo+ID4gPiA+ICBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9xY29tLXdsZWQuYyAgfCA4IC0tLS0tLS0tCj4gPiA+ID4gIDYgZmlsZXMgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiAKCi0t
IApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVy
IFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
