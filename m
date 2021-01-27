Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8F3070E5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADCA6E911;
	Thu, 28 Jan 2021 08:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F826E8A4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 21:35:18 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m22so4767537lfg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 13:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tQDe7yRUmKhAto8WrhSV9CEVL5HS+KA9x6e+wAuz/h4=;
 b=vFVSscQ0PNZE0lJfiHB24oYt7wFoclmi9hPaaKkEocP7ZrRGNIYhkpc3nz37cUp7wp
 isdx58x+AH8lAkM8rplbun08sIwaSDXKQBqJulfzGQ9Em2SO/cX7CYHYRk35yc53WnOO
 Q7GSBi4MR7gKySJ5D3LVrOKDCPDkH+d/b0+PfUS0h0MV0JTq39iuPTkG5J6snc4JPSBb
 0/ISNZL3iK2mqM/p2icU5tnszkn+WetvdxuyZjrJpYPIRWVJRdxLsekXw+iA3HHU3+ih
 Km5GQMX4qsheWVn3jwbHX0SgskpLGE7agfPbFMRxXEIcMs4PCC3OJJOxDvn/Q7TRQzY8
 pW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tQDe7yRUmKhAto8WrhSV9CEVL5HS+KA9x6e+wAuz/h4=;
 b=PeW0w/5JzKtgNugCCYWSPcdbKL0lYRLJiWjfp2n6bytRRlpYBQmQHWiqzPdIQZYLUi
 gB1vMzRAxGaHV5RwkMvu9kQJS26pZBKgPP4DyDidCC6lPKGD3PmxbJRjPNqp8cjNn7bR
 3haq5++ZmDv9W+6mssy4N2qnZnasYoQd+w6D3IPb/QSWKXcPFHh9xviTCQzCUlJSWxSS
 gUKHpMuy/EcrqwpKexbp4G7/oU4DjYdLT8livdCJYjC5F8Osl81uToufzne4TUoxlNEc
 yKS7nRNsPtPZwkrK+9cB6jS45g+8O0N3Cceh0Po4FQAEwXb2S5F8XnSoyohjNpon01Iw
 skkA==
X-Gm-Message-State: AOAM5304oIjMjqwQNCnNsCxIaeFqeB/VaGgLDKNp0IxlO4Ax75ucVuvZ
 ouLxtlS8MsyOYKbv5wr2JDY=
X-Google-Smtp-Source: ABdhPJwvKuM9VGT8UPkeH/y+fiNWKXj3vYQKAoCkzkgX+1mV8tdal7fbDywNMvQPb/4rgVjAp/ZUgw==
X-Received: by 2002:a19:746:: with SMTP id 67mr5706808lfh.395.1611783317211;
 Wed, 27 Jan 2021 13:35:17 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id f19sm1007383ljn.111.2021.01.27.13.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 13:35:16 -0800 (PST)
Subject: Re: [PATCH v5 00/21] sync_file API is not very suitable for DRM
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c690b17d-7278-5d25-8316-671afd111e01@gmail.com>
Date: Thu, 28 Jan 2021 00:35:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:35 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjYuMDEuMjAyMSAwNTo0NSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IDQuIFN5bmMg
ZmlsZSBzaG91bGRuJ3QgYmUgbmVlZGVkIGZvciB0aGUgcGFydCBvZiBEUk0gQVBJIHdoaWNoIGRv
ZXNuJ3QKPj4gaW50ZXJhY3Qgd2l0aCBleHRlcm5hbCBub24tRFJNIGRldmljZXMuwqAgV2Ugc2hv
dWxkIHVzZSBEUk0gc3luY29iaiBmb3IKPj4gZXZlcnl0aGluZyByZWxhdGVkIHRvIERSTSwgaXQn
cyBhIHN1cGVyaW9yIEFQSSBvdmVyIHN5bmMgZmlsZSwgaXQncwo+PiBzdWl0YWJsZSBmb3IgRFJN
IHNjaGVkdWxlci4KPiAKPiBDb25zaWRlcmluZyB0aGUgaXNzdWVzIHdpdGggZmlsZW5vIGxpbWl0
cywgSSBzdXBwb3NlIHRoZXJlIGlzIG5vIG90aGVyCj4gY2hvaWNlLiBDb25zaWRlcmluZyB0aGUg
cmVjZW50IE5UU1lOQyBwcm9wb3NhbCBieSBXaW5lIGRldmVsb3BlcnMsIG1heWJlCj4gd2Ugc2hv
dWxkIGFsc28gaGF2ZSBOVEhBTkRMRXMgdG8gZ2V0IHJpZCBvZiByZXN0cmljdGlvbnMgb2YgZmls
ZQo+IGRlc2NyaXB0b3JzLgoKSXQncyBvZGQgdG8gbWUgdGhhdCB5b3UgdHJ5aW5nIHRvIGF2b2lk
IHRoZSBleGlzdGluZyBEUk0gQVBJLiBUaGlzIGFsbAp3YXMgc29sdmVkIGluIERSTSBsb25nIHRp
bWUgYWdvIGFuZCBncmF0ZSBkcml2ZXJzIGhhdmUgbm8gcHJvYmxlbXMgd2l0aAp1c2luZyB0aGUg
RFJNIEFQSXMuIEV2ZW4gaWYgc29tZXRoaW5nIGlzIHJlYWxseSBtaXNzaW5nLCB0aGVuIHlvdSBz
aG91bGQKYWRkIHRoZSBtaXNzaW5nIGZlYXR1cmVzIGluc3RlYWQgb2YgcmUtaW52ZW50aW5nIGV2
ZXJ5dGhpbmcgZnJvbSBzY3JhdGNoLgoKPiBEUk0gc3luY29ianMgbWF5IGhhdmUgc29tZSBhZHZh
bnRhZ2VzIG92ZXIgc3luYyBmaWxlcywgYnV0Cj4gYWxzbyBkaXNhZHZhbnRhZ2VzLiBUaGV5IGNh
bm5vdCBiZSBwb2xsKCllZCwgc28gdGhleSBjYW5ub3QgYmUgY29tYmluZWQKPiB3aXRoIHdhaXRz
IGZvciBvdGhlciByZXNvdXJjZXMuCgpJJ20gbm90IHN1cmUgZG8geW91IG1lYW4gYnkgInBvbGwi
LiBTeW5jIG9iamVjdCBzdXBwb3J0cyBwb2xsaW5nIHZlcnkgd2VsbC4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
