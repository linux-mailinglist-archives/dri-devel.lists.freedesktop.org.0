Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60667307134
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11826E933;
	Thu, 28 Jan 2021 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F206E896
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 22:26:19 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id y11so4027949ljk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 14:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=32GBvzqULqr1PLS7WMQvWkvIMQOSOY8uDAPn1dKTtws=;
 b=Ka1wao9S4YmQcYU0JmZdG14bdsrzn9+86yE2kFtQzDxNj6I64RHsGItNuA0V7WsxPc
 mzLdsv/WSW/KIvGgLROXfKtTRVvtzsF87Rd/oXlNvozEnxs8SjJsIOex8chw8b/Epg+e
 QEw9Ux0CxJ/kdk9qXInTsPoKjC5DJ7+T3/pyFy4iVsNXmcY7x4NDqad1VWxwpeu0hOnM
 XoovlnnPqF3vpw7ufVQ6IuAlaT7RAS8unHMr6pqLtd+AqWLhiig3CIqia+E1w7fqX93Q
 l0zjt09saX6JHt3Q93mDtCjAHA9aRue9lTt5u264IWrHCykwYGJOIJ8h0Qkr9pij51AH
 YDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=32GBvzqULqr1PLS7WMQvWkvIMQOSOY8uDAPn1dKTtws=;
 b=GaZbUlMzyLUn29R7Q7WLvfJ67mu5oRDr8cMBcHJPAQC0kNRIb7sBX2ZTnw4B8Ph4cb
 FzTORWC0I3tgoQ7USz422exH+ePj+CEr+iGC17GXZC959W+aO4cSAfnDK7XMdfEkSbYt
 JREkh+2uB7BKav18wn+LFVDJlMDgNTAHPifTWTyqZqJn7YKnz+hIrSi+irFZUpclk3Ng
 mLZwGb5YuPVpR4xonSOtg3KqfAzYCH0yg69NyxN0u/mg5gYA+Rq8oiMZtcEzTPXdEC0f
 m1NUJQX+x2cgaiwdQZGHEp0+Ydiy3nzRiTj9ooJ6hgfzJJ/foMeEaB8bfZVjTu38KnW9
 Qnfw==
X-Gm-Message-State: AOAM533Tq3/cGo6HaVMqOfwhCB3Mtqs8sSJpza8w5EiN13xNGLwPy9rB
 KF4tKzzLq1Vlz0ozQk8wUp8=
X-Google-Smtp-Source: ABdhPJxXB7p+r/x4WzIRpDAHBgtF8yd6jgQYBzcVb6rcerdzP7sbiU6Ml51Ct6frVnYlvJUanEd/aQ==
X-Received: by 2002:a2e:81c5:: with SMTP id s5mr6962770ljg.197.1611786378069; 
 Wed, 27 Jan 2021 14:26:18 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id c16sm878016lfh.82.2021.01.27.14.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 14:26:17 -0800 (PST)
Subject: Re: [PATCH v5 00/21] sync_file API is not very suitable for DRM
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <c690b17d-7278-5d25-8316-671afd111e01@gmail.com>
 <53b7c991-7aa7-2407-eb54-d9db997f00e7@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6fe05443-de81-ecf6-faf8-a62d73c0de9c@gmail.com>
Date: Thu, 28 Jan 2021 01:26:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <53b7c991-7aa7-2407-eb54-d9db997f00e7@kapsi.fi>
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

MjguMDEuMjAyMSAwMDo1MywgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gMS8yNy8y
MSAxMTozNSBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAyNi4wMS4yMDIxIDA1OjQ1LCBN
aWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4+PiA0LiBTeW5jIGZpbGUgc2hvdWxkbid0IGJl
IG5lZWRlZCBmb3IgdGhlIHBhcnQgb2YgRFJNIEFQSSB3aGljaCBkb2Vzbid0Cj4+Pj4gaW50ZXJh
Y3Qgd2l0aCBleHRlcm5hbCBub24tRFJNIGRldmljZXMuwqAgV2Ugc2hvdWxkIHVzZSBEUk0gc3lu
Y29iaiBmb3IKPj4+PiBldmVyeXRoaW5nIHJlbGF0ZWQgdG8gRFJNLCBpdCdzIGEgc3VwZXJpb3Ig
QVBJIG92ZXIgc3luYyBmaWxlLCBpdCdzCj4+Pj4gc3VpdGFibGUgZm9yIERSTSBzY2hlZHVsZXIu
Cj4+Pgo+Pj4gQ29uc2lkZXJpbmcgdGhlIGlzc3VlcyB3aXRoIGZpbGVubyBsaW1pdHMsIEkgc3Vw
cG9zZSB0aGVyZSBpcyBubyBvdGhlcgo+Pj4gY2hvaWNlLiBDb25zaWRlcmluZyB0aGUgcmVjZW50
IE5UU1lOQyBwcm9wb3NhbCBieSBXaW5lIGRldmVsb3BlcnMsIG1heWJlCj4+PiB3ZSBzaG91bGQg
YWxzbyBoYXZlIE5USEFORExFcyB0byBnZXQgcmlkIG9mIHJlc3RyaWN0aW9ucyBvZiBmaWxlCj4+
PiBkZXNjcmlwdG9ycy4KPj4KPj4gSXQncyBvZGQgdG8gbWUgdGhhdCB5b3UgdHJ5aW5nIHRvIGF2
b2lkIHRoZSBleGlzdGluZyBEUk0gQVBJLiBUaGlzIGFsbAo+PiB3YXMgc29sdmVkIGluIERSTSBs
b25nIHRpbWUgYWdvIGFuZCBncmF0ZSBkcml2ZXJzIGhhdmUgbm8gcHJvYmxlbXMgd2l0aAo+PiB1
c2luZyB0aGUgRFJNIEFQSXMuIEV2ZW4gaWYgc29tZXRoaW5nIGlzIHJlYWxseSBtaXNzaW5nLCB0
aGVuIHlvdSBzaG91bGQKPj4gYWRkIHRoZSBtaXNzaW5nIGZlYXR1cmVzIGluc3RlYWQgb2YgcmUt
aW52ZW50aW5nIGV2ZXJ5dGhpbmcgZnJvbSBzY3JhdGNoLgo+Pgo+IAo+IERSTSBpcyBvbmx5IG9u
ZSBvZiBtYW55IHN1YnN5c3RlbXMgdGhhdCB3aWxsIGhhdmUgdG8gZGVhbCB3aXRoCj4gc3luY3Bv
aW50cywgc28gSSBoYXZlIHdhbnRlZCB0byBoYXZlIGEgY2VudHJhbCBzb2x1dGlvbiBpbnN0ZWFk
IG9mCj4gcmVpbXBsZW1lbnRpbmcgdGhlIHNhbWUgc3R1ZmYgZXZlcnl3aGVyZS4gc3luY19maWxl
cyBzZWVtIGxpa2UgdGhlCj4gIm1pc3NpbmcgZmVhdHVyZSIsIGJ1dCB0aGV5IGFyZSBkaWZmaWN1
bHQgdG8gdXNlIGl0IHdpdGggdGhlIGZpbGVubwo+IGxpbWl0cy4gQnV0IGFzIGhhcyBiZWVuIHNh
aWQgbWFueSB0aW1lcywgdGhleSBhcmUgaW50ZW5kZWQgb25seSB0bwo+IHRyYW5zZmVyIGZlbmNl
cyBiZXR3ZWVuIHRoZSBpbXBsZW1lbnRhdGlvbnMgaW4gaW5kaXZpZHVhbCBkcml2ZXJzLCBzbyBJ
Cj4gZ3Vlc3MgSSB3aWxsIGhhdmUgdG8gYWJhbmRvbiB0aGlzIGRyZWFtLgoKTGV0J3MgZm9jdXMg
b24gZmluaXNoaW5nIHRoZSBiYXNpY3MgZmlyc3QsIHVzaW5nIHdoYXQgd2UgYWxyZWFkeSBoYXZl
LgpTeW5jIGZpbGUgKyBzeW5jb2JqIHNob3VsZCBiZSBnb29kIGVub3VnaCBmb3Igd2hhdCB3ZSBu
ZWVkIHJpZ2h0IG5vdy4KCj4+PiBEUk0gc3luY29ianMgbWF5IGhhdmUgc29tZSBhZHZhbnRhZ2Vz
IG92ZXIgc3luYyBmaWxlcywgYnV0Cj4+PiBhbHNvIGRpc2FkdmFudGFnZXMuIFRoZXkgY2Fubm90
IGJlIHBvbGwoKWVkLCBzbyB0aGV5IGNhbm5vdCBiZSBjb21iaW5lZAo+Pj4gd2l0aCB3YWl0cyBm
b3Igb3RoZXIgcmVzb3VyY2VzLgo+Pgo+PiBJJ20gbm90IHN1cmUgZG8geW91IG1lYW4gYnkgInBv
bGwiLiBTeW5jIG9iamVjdCBzdXBwb3J0cyBwb2xsaW5nIHZlcnkKPj4gd2VsbC4KPj4KPiAKPiBJ
IG1lYW4gdGhlIHBvbGwvc2VsZWN0IGV0Yy4gc2VyaWVzIG9mIGZ1bmN0aW9ucywgd2hpY2ggd2Fp
dCBmb3IgZmlsZQo+IGRlc2NyaXB0b3JzIHRvIGJlY29tZSByZWFkeS4gSWYgdGhlcmUncyBzb21l
IHRyaWNrIHRoYXQgYWxsb3dzIHN5bmNvYmpzCj4gdG8gYmUgdXNlZCBmb3IgdGhhdCwgdGhlbiBw
bGVhc2UgdGVsbC4KClBsZWFzZSBleHBsYWluIGluIGRldGFpbHMgd2hhdCBwcm9ibGVtIHlvdSBu
ZWVkIHRvIHNvbHZlLCBnaXZlIGFuIGV4YW1wbGUuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
