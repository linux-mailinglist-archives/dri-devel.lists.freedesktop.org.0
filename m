Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0FA2F5D87
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61046E17D;
	Thu, 14 Jan 2021 09:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3EA6E867
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 18:14:24 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u25so4167659lfc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 10:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fDpcPGN452QW5OstMWYz6Q82ZuKqAUV5xehi8i2tN9I=;
 b=KNIpNxOC+0ROwINquN8usqkfwfSG1mVjw4G5frTgIAtMXE/ZlrsvZ9RzieWI1aAUar
 1SrvSfGs2AwG8TwkVEVddhPNl2E1MTBkFbhWbVRNeCJAojAqxVx1trnCDTsAuECAdUMH
 rHTcLYcLmBOBY+ugXSuWGyD+3C1YjIjQdSCU6Qm4Xtu+loXqQK/6IEobK2aJ/LjKYgLf
 LQe77X1Kcc0sN1PYh4riwM+/vgpb6bcC78JzMTt/uRh4NftsSEqZ0BT92RxnxPrEOji5
 AgM1Z5XoRCPxSvrllK7DCROD54YDlhKqKkT8LnnxGr1kcKLCx1/Cm8/W97vHNqxe1pT6
 Ulig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fDpcPGN452QW5OstMWYz6Q82ZuKqAUV5xehi8i2tN9I=;
 b=Fu1ZIcf0U4V0qD1myiklUqmDzKm+5to0eoLbsmlCses92gK/zpJDntE4fLS+CA1KSY
 y84cfAPdwm8S7GgPCWXY06CW7ToA+R76bl9Pe5ViMNNTvsnfR/OYCKyBe1SKJFnvaIeP
 vPd9xSh/WOBhUCi7TuVji4chGR7BslTO8SwGMbFDG/GM3Gtnyry90WZ/Zxt+YWcnGN7A
 erc0h+wRZ84dEt8JuPWZUYgQOh8bvHqdRCToTFzahws5UuP36A1y8GL8F4D/NgpzjnJz
 ttF1LowMFsC5N+Wxdq8G8kXlWIOr0nkqKfdL+iA49FFoPEZ1TvhWnHmra7ocPjek7R6B
 o5hg==
X-Gm-Message-State: AOAM533zzZbqGtN+tnTgVOhyya4MqdgjJexEWYvrF9y3OOSYKRwYFy+J
 zHV4x1HuCbBtQh18/n2QLxA=
X-Google-Smtp-Source: ABdhPJw3rJ5CLT9LFCN3W+KjUdWcmLiOEm8u1wnTDpduvU3f3O2g3ybptVU+hhr5ywH3iJ0HBkFFAA==
X-Received: by 2002:ac2:4950:: with SMTP id o16mr1327813lfi.19.1610561662520; 
 Wed, 13 Jan 2021 10:14:22 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id z14sm284407lfq.130.2021.01.13.10.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 10:14:21 -0800 (PST)
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
Date: Wed, 13 Jan 2021 21:14:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-16-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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

MTEuMDEuMjAyMSAxNjowMCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gK3N0cnVjdCBk
cm1fdGVncmFfc3VibWl0X2J1ZiB7Cj4gKwkvKioKPiArCSAqIEBtYXBwaW5nX2lkOiBbaW5dCj4g
KwkgKgo+ICsJICogSWRlbnRpZmllciBvZiB0aGUgbWFwcGluZyB0byB1c2UgaW4gdGhlIHN1Ym1p
c3Npb24uCj4gKwkgKi8KPiArCV9fdTMyIG1hcHBpbmdfaWQ7CgpJJ20gbm93IGluIHByb2Nlc3Mg
b2YgdHJ5aW5nIG91dCB0aGUgVUFQSSB1c2luZyBncmF0ZSBkcml2ZXJzIGFuZCB0aGlzCmJlY29t
ZXMgdGhlIGZpcnN0IG9ic3RhY2xlLgoKTG9va3MgbGlrZSB0aGlzIGlzIG5vdCBnb2luZyB0byB3
b3JrIHdlbGwgZm9yIG9sZGVyIFRlZ3JhIFNvQ3MsIGluCnBhcnRpY3VsYXIgZm9yIFQyMCwgd2hp
Y2ggaGFzIGEgc21hbGwgR0FSVC4KCkdpdmVuIHRoYXQgdGhlIHVzZWZ1bG5lc3Mgb2YgdGhlIHBh
cnRpYWwgbWFwcGluZyBmZWF0dXJlIGlzIHZlcnkKcXVlc3Rpb25hYmxlIHVudGlsIGl0IHdpbGwg
YmUgcHJvdmVuIHdpdGggYSByZWFsIHVzZXJzcGFjZSwgd2Ugc2hvdWxkCnN0YXJ0IHdpdGggYSBk
eW5hbWljIG1hcHBpbmdzIHRoYXQgYXJlIGRvbmUgYXQgYSB0aW1lIG9mIGpvYiBzdWJtaXNzaW9u
LgoKRFJNIGFscmVhZHkgc2hvdWxkIGhhdmUgZXZlcnl0aGluZyBuZWNlc3NhcnkgZm9yIGNyZWF0
aW5nIGFuZCBtYW5hZ2luZwpjYWNoZXMgb2YgbWFwcGluZ3MsIGdyYXRlIGtlcm5lbCBkcml2ZXIg
aGFzIGJlZW4gdXNpbmcgZHJtX21tX3NjYW4gZm9yIGEKbG9uZyB0aW1lIG5vdyBmb3IgdGhhdC4K
Ckl0IHNob3VsZCBiZSBmaW5lIHRvIHN1cHBvcnQgdGhlIHN0YXRpYyBtYXBwaW5nIGZlYXR1cmUs
IGJ1dCBpdCBzaG91bGQKYmUgZG9uZSBzZXBhcmF0ZWx5IHdpdGggdGhlIGRybV9tbSBpbnRlZ3Jh
dGlvbiwgSU1PLgoKV2hhdCBkbyB0aGluaz8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
