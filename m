Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9769220AD60
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979456EC3B;
	Fri, 26 Jun 2020 07:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513186E83B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 23:24:31 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 9so8397132ljv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 16:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KQBOQUALiqSKtvCGn8S3YcArtBy6E6PZbrpA69D4Zus=;
 b=WhnOBvJtKQNdrl8QfTTB/JHMXH0z6kTj+m1gGyVxG8e7VCGz59bMyJFbBFHnGBKtfE
 Uw5r3PyAp2xvfxdsekiiQO6dbS1qIhAhaNAFQePGN6FP/7VYcg+0g2AoUKnrKYJHTW/R
 LXbktqOKfVCiRDBer6Aj4xSh1AA9kElZTktwgcYZCSsjf4/eCUOXH4SnnMmsVhi/UrNJ
 qsNYBKJt/F/IxRzg6qIdhmxNO/kCTU20CxHxJUQZj2ZJojzKqe72csGAZ5OzkA+1yRQ6
 V+Ule+yt1dUk7RuCQhKeggS4dd/pV1M7xzn6ECUc0rjlmAaueVGcU7EUZUtiGVYd4cef
 sQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KQBOQUALiqSKtvCGn8S3YcArtBy6E6PZbrpA69D4Zus=;
 b=MyOCKsk1xKRotD/of7afTiXGWCWGv9+B70mH2GlUHp+gKvKsD5gFan1HAUHodvhaGm
 dr/fwhy8HFWkLHGrZAJVi5f07p8J0MpB6Z9WMu+Z4Mw1GO70s9o90Vi48aS0SnC2GrQu
 HpxT4/U4Aa4vvmUH6CdE3p/+ycdAcRqP4Gwy61kSuq6wFXw0zudNxhqixExS02zGylBV
 9SyMkttv4rAW0QCQKTzNQplaQkSGz3PKdYfiL4x9fOO3XFs4CMqwRhUFBbg7L9QquIqo
 psmbU/vIR2lKnG5LNXsnhnIOPYlbpNkGRv7B+kEysGkyoTE5eb3EeQ7G0FwD/mtBj8m0
 4o2w==
X-Gm-Message-State: AOAM533/MPOGy3IfCyimTgWzjEsk/QCbZgHxDIc/QGYbEG2/ijZMU2ic
 s22oLaxfQYJSSxE5flnqsxU=
X-Google-Smtp-Source: ABdhPJy+3i2VMOH3bgCwGjRqvIDH1d2f1cMECaR79jG/6ShHgd8UIYoJvPhRhGMMviokg5nx3W+tJA==
X-Received: by 2002:a05:651c:54e:: with SMTP id
 q14mr23077ljp.279.1593127469638; 
 Thu, 25 Jun 2020 16:24:29 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id t4sm6295754lfp.21.2020.06.25.16.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 16:24:27 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <c6642ebd-c9f1-eab0-ff6d-109698af73e0@gmail.com>
 <5c0aa939-d722-5034-6328-4df5be8ee3c6@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c96af3cb-a15c-dd3f-ac5b-b0a56d2ed6d9@gmail.com>
Date: Fri, 26 Jun 2020 02:24:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5c0aa939-d722-5034-6328-4df5be8ee3c6@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 26 Jun 2020 07:36:15 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjUuMDYuMjAyMCAxMjoxNiwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gNi8yNS8y
MCAyOjExIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDIzLjA2LjIwMjAgMTU6MDksIE1p
a2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4gLyogQ29tbWFuZCBpcyBhbiBvcGNvZGUgZ2F0
aGVyIGZyb20gYSBHRU0gaGFuZGxlICovCj4+PiAjZGVmaW5lIERSTV9URUdSQV9TVUJNSVRfQ09N
TUFORF9HQVRIRVLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMAo+Pj4gLyogQ29tbWFuZCBpcyBh
biBvcGNvZGUgZ2F0aGVyIGZyb20gYSB1c2VyIHBvaW50ZXIgKi8KPj4+ICNkZWZpbmUgRFJNX1RF
R1JBX1NVQk1JVF9DT01NQU5EX0dBVEhFUl9VUFRSwqDCoMKgwqDCoMKgwqAgMQo+Pgo+PiBJJ20g
YSBiaXQgZHViaW91cyBhYm91dCB3aGV0aGVyIHdlIHJlYWxseSBuZWVkIHRvIHJldGFpbiB0aGUg
bm9uLVVQVFIKPj4gdmFyaWFudC4gVGhlIG1lbW9yeS1jb3B5aW5nIG92ZXJoZWFkIGlzIG5lZ2xp
Z2libGUgYmVjYXVzZSBjbWRzdHJlYW0ncwo+PiBkYXRhIHVzdWFsbHkgaXMgaG90IGluIENQVSdz
IGNhY2hlCj4+Cj4+IElJUkMsIHRoZSBtb3N0IChpZiBub3QgYWxsKSBvZiB0aGUgbW9kZXJuIERS
TSBkcml2ZXJzIGRyaXZlcnMgdXNlIHRoZQo+PiB1c3JwdHItb25seSBmb3IgdGhlIGNtZHN0cmVh
bS4KPj4KPj4gQXQgbGVhc3QgdGhlcmUgaXMgbm8gYW55IHJlYWwtd29ybGQgdXNlcnNwYWNlIGV4
YW1wbGUgdG9kYXkgdGhhdCBjb3VsZAo+PiBiZW5lZml0IGZyb20gYSBub24tVVBUUiB2YXJpYW50
Lgo+Pgo+PiBJJ20gc3VnZ2VzdGluZyB0byBsZWF2ZSBvdXQgdGhlIG5vbi1VUFRSIGdhdGhlciB2
YXJpYW50IGZvciBub3csIGtlZXBpbmcKPj4gaXQgaW4gbWluZCBhcyBhIHBvdGVudGlhbCBmdXR1
cmUgZXh0ZW5zaW9uIG9mIHRoZSBzdWJtaXNzaW9uIFVBUEkuIEFueQo+PiBvYmplY3Rpb25zPwo+
Pgo+IAo+IFN1cmUsIHdlIHNob3VsZCBiZSBhYmxlIHRvIGRyb3AgaXQuIERvd25zdHJlYW0gdXNl
cnNwYWNlIGlzIHVzaW5nIGl0LAo+IGJ1dCB3ZSBzaG91bGQgYmUgYWJsZSB0byBmaXggdGhhdC4g
SSB3YXMgdGhpbmtpbmcgdGhhdCB3ZSBjYW4gZGlyZWN0bHkKPiBtYXAgdGhlIHVzZXIgcGFnZXMg
YW5kIHBvaW50IHRoZSBnYXRoZXIgdG8gdGhlbSB3aXRob3V0IGNvcHlpbmcgLSB0aGF0Cj4gd2F5
IHdlIHdvdWxkbid0IG5lZWQgdG8gbWFrZSBETUEgYWxsb2NhdGlvbnMgaW5zaWRlIHRoZSBkcml2
ZXIgZm9yIGV2ZXJ5Cj4gc3VibWl0LgoKV2Ugd2lsbCBuZWVkIHRvIGNyZWF0ZSBhIEhvc3QxeCBE
TUEgcG9vbCBhbmQgdGhlbiB0aGUgZHluYW1pYwphbGxvY2F0aW9ucyB3aWxsIGJlIGNoZWFwLiBU
aGlzIGlzIGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCB0aGF0IHdlIGNhbgpkaXNjdXNzIHNlcGFy
YXRlbHkuCgpXZSB3aWxsIG5lZWQgdGhlIFVQVFIgYW55d2F5cyBmb3IgdGhlIG9sZGVyIFRlcmdh
cyBiZWNhdXNlIHdlIG5lZWQgdG8KdmFsaWRhdGUgdGhlIGNtZHN0cmVhbXMgYW5kIGl0J3MgbXVj
aCBtb3JlIGVmZmljaWVudCB0byBjb3B5IGZyb20gVVBUUgp0aGFuIGZyb20gdGhlIHVuY2FjaGVh
YmxlIG1lbW9yeS4KClRoZSBub24tVVBUUiB2YXJpYW50IHdpbGwgYmUgZmluZSB0byBhZGQgaWYg
eW91J2xsIGhhdmUgYSByZWFsd29ybGQKZXhhbXBsZSB0aGF0IGRlbW9uc3RyYXRlcyBhIG5vdGlj
ZWFibGUgcGVyZm9ybWFuY2UgZGlmZmVyZW5jZS4KClByZXZpb3VzbHksIEkgdGhvdWdodCB0aGF0
IHRoZXJlIHdpbGwgYmUgc29tZSBwZXJmIGRpZmZlcmVuY2UgaWYgR1IzRApzaGFkZXJzIGFyZSBt
b3ZlZCBpbnRvIHRoZSAiaW5zZXJ0LW9wY29kZSIgZ2F0aGVyLCBidXQgaXQgd2FzIG5lZ2xpZ2li
bGUKb25jZSBJIGltcGxlbWVudGVkIGl0IGFuZCBpdCBzaG91bGQgYmUgZXZlbiBtb3JlIG5lZ2xp
Z2libGUgb24gYSBtb2Rlcm4KaGFyZHdhcmUuCgo+IChPbiBlYXJseSBUZWdyYXMgd2UgY291bGQg
anVzdCBjb3B5IGludG8gdGhlIHB1c2hidWZmZXIgYnV0IHRoYXQKPiB3b24ndCB3b3JrIGZvciBu
ZXdlciBvbmVzKS4KClllcywgd2Ugc2hvdWxkIGNvcHkgZGF0YSBpbnRvIGEgZ2F0aGVyIGFuZCB0
aGVuIHB1c2ggaXQgaW50byBjaGFubmVsJ3MKcHVzaGJ1ZmZlci4gSnVzdCBsaWtlIGl0IHdvcmtz
IHdpdGggdGhlIGN1cnJlbnQgdXBzdHJlYW0gZHJpdmVyLgoKT25jZSBhbGwgdGhlIFVBUEkgd2ls
bCBiZSBzZXR0bGVkLCB3ZSdsbCBhbHNvIG5lZWQgdG8gZGlzY3VzcyB0aGUKcHVzaGJ1ZmZlcidz
IGltcGxlbWVudGF0aW9uIGJlY2F1c2UgdGhlIGN1cnJlbnQgZHJpdmVyIGhhcyBzb21lIHByb2Js
ZW1zCndpdGggaXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
