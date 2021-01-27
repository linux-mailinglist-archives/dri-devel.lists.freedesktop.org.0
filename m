Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC26D307121
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012CA6E949;
	Thu, 28 Jan 2021 08:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E509189F4F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 21:20:16 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f1so4728915lfu.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 13:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NpNL5RakE2KXSN5P6KgIPsL9eD0ecDZ1R9kFzhbHFTc=;
 b=BH16q8u5n+5wAzmvY5Tt7y+9w4fAecFWth8ZGXc+xm1sy5BoVTbe3P6EsRIJYETFsd
 alsXF927SsBb16m4gwlONDWQ5LCXkPvzPKG0YUjc2EjenNnV6aJ4sC5PmVTCy6ZEVGSy
 ytsQ8CS8r4mj2ga3r87V63y7McKV+LeBuBSIvkletRxuhpsqrsWOI+3slbnCqRqeHVZp
 tSF/kQbCZiNhUwMdxol6IwNu5u85t4XmuK4rHTX6spFnbAhyP6eiFXqSyrBbO1W9UYwX
 BsZanDvIYv0b9enAOK0UnXh/weHsjXe8eWpkaN0/as/vitX3c9NYH1KICLlrrNx9XxJm
 Tfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NpNL5RakE2KXSN5P6KgIPsL9eD0ecDZ1R9kFzhbHFTc=;
 b=MRhbr02q8/hWpoN8KGnz6IuxxaMhT21VcE1oPUOq5xKm4sKj15AXmgUnNwh6r4YjpM
 6MenxQjfvb1yFg7ZTubxHGpzgZXAYm96lxtAHQIUruvxxg5uY2nnpBNwGinI1I76Vf5i
 c/JK9ONMp0W0+ctIXGaISAGZCMsJZSYbwfBzIY6wfGlYfiInp7Bl5J9y5NuH/RvfgGlU
 Zwr9gfyHVGwP43CUy9FrbvtPZleNa7DAWTpm1MRy+D5ELjp8CR/32MgJafh4DWyjI0J+
 AJOYaNawREQZlJW9xsYTv46Gh5/xVkR9TOQEU5Kf9XU7l/oYZHw1/GUnI7vlR/Z7/GYW
 rJ6Q==
X-Gm-Message-State: AOAM530EaO0tLFPyTaGWMZXgiZDREUZNywSKicWpjjGUI88d/mQc6XFl
 dyXIhB8r9BYtwjaLZ9tHIXs=
X-Google-Smtp-Source: ABdhPJwuNE1bisH3/2nrqBreh6P4L49LGnAK80zVgYFYHQ01ync3x0KeZR7SHcqKGDYRN5Dz9dh+uw==
X-Received: by 2002:a19:8147:: with SMTP id c68mr3711356lfd.292.1611782415325; 
 Wed, 27 Jan 2021 13:20:15 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id 19sm1002904ljw.19.2021.01.27.13.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 13:20:14 -0800 (PST)
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
Date: Thu, 28 Jan 2021 00:20:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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

MjYuMDEuMjAyMSAwNTo0NSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IDIuIFdlIHdp
bGwgcHJvYmFibHkgbmVlZCBhIGRlZGljYXRlZCBkcm1fdGVncmFfc3VibWl0X2NtZCBmb3Igc3lu
YyBwb2ludAo+PiBpbmNyZW1lbnRzLsKgIFRoZSBqb2IncyBzeW5jIHBvaW50IHdpbGwgYmUgYWxs
b2NhdGVkIGR5bmFtaWNhbGx5IHdoZW4gam9iCj4+IGlzIHN1Ym1pdHRlZC7CoCBXZSB3aWxsIG5l
ZWQgYSBmYWcgZm9yIHRoZSBzeW5jX2luY3IgYW5kIHdhaXRfc3luY3B0Cj4+IGNvbW1hbmRzLCBz
YXlpbmcgIml0J3MgYSBqb2IncyBzeW5jIHBvaW50IGluY3JlbWVudC93YWl0Igo+IAo+IE5lZ2F0
aXZlLiBMaWtlIEkgaGF2ZSBleHBsYWluZWQgaW4gcHJldmlvdXMgZGlzY3Vzc2lvbnMsIHdpdGgg
dGhlCj4gY3VycmVudCB3YXkgdGhlIHVzYWdlIG9mIGhhcmR3YXJlIHJlc291cmNlcyBpcyBtdWNo
IG1vcmUgZGV0ZXJtaW5pc3RpYwo+IGFuZCBvYnZpb3VzLiBJIGRpc2FncmVlIG9uIHRoZSBwb2lu
dCB0aGF0IHRoaXMgaXMgbXVjaCBtb3JlIGNvbXBsaWNhdGVkCj4gZm9yIHRoZSB1c2Vyc3BhY2Uu
IFNlcGFyYXRpbmcgc3luY3BvaW50IGFuZCBjaGFubmVsIGFsbG9jYXRpb24gaXMgb25lIG9mCj4g
dGhlIHByaW1hcnkgbW90aXZhdGlvbnMgb2YgdGhpcyBzZXJpZXMgZm9yIG1lLgoKU3luYyBwb2lu
dHMgYXJlIGEgbGltaXRlZCByZXNvdXJjZS4gVGhlIG1vc3Qgc2Vuc2libGUgd2F5IHRvIHdvcmsg
YXJvdW5kCml0IGlzIHRvIGtlZXAgc3luYyBwb2ludHMgd2l0aGluIGtlcm5lbCBhcyBtdWNoIGFz
IHBvc3NpYmxlLiBUaGlzIGlzIG5vdApvbmx5IG11Y2ggc2ltcGxlciBmb3IgdXNlciBzcGFjZSwg
YnV0IGFsc28gYWxsb3dzIHRvIHV0aWxpemUgRFJNIEFQSQpwcm9wZXJseSB3aXRob3V0IHJlLWlu
dmVudGluZyB3aGF0IGFscmVhZHkgZXhpc3RzIGFuZCBpdCdzIGVhc2llciB0bwptYWludGFpbiBo
YXJkd2FyZSBpbiBhIGdvb2Qgc3RhdGUuCgpJZiB5b3UgbmVlZCB0byB1c2UgYSBkZWRpY2F0ZWQg
c3luYyBwb2ludCBmb3IgVk1zLCB0aGVuIGp1c3QgYWxsb2NhdGUKdGhhdCBzcGVjaWFsIHN5bmMg
cG9pbnQgYW5kIHVzZSBpdC4gQnV0IHRoaXMgc3luYyBwb2ludCB3b24ndCBiZSB1c2VkCmZvciBq
b2JzIHRyYWNraW5nIGJ5IGtlcm5lbCBkcml2ZXIuIElzIHRoZXJlIGFueSBwcm9ibGVtIHdpdGgg
dGhpcz8KClRoZSBwcmltYXJ5IG1vdGl2YXRpb24gZm9yIG1lIGlzIHRvIGdldCBhIHByYWN0aWNh
bGx5IHVzYWJsZSBrZXJuZWwKZHJpdmVyIGZvciB1c2Vyc3BhY2UuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
