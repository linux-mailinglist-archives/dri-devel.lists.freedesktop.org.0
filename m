Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0615A2A2068
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6CD6EB29;
	Sun,  1 Nov 2020 17:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0146EDC1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 11:28:06 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id o129so5012330pfb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 04:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=hxTRuwuwoz+yNxAP/6AWKELjPIZFSOzk04+9b9KVhAk=;
 b=LrI15tSUqq1g/++IsXJr71dx/QBn6k6L9Fbp9JFRnnkpYtM3Mid6lAljpFwTjKxdFI
 ryCb6zAG9h7WLR7zUbyXvcU3iMVHkzhzegveXZLDM94k/zDC5eyP1DvXuZN96JhsL9f7
 FunARwjR38C8GhD/kf3V0y6EhoXB0bNklTa+fQhbyvKaC+uo4hjasdJZRF6szEGoCoKb
 8lv1tO1aJdagIeVJpagB1zliwoXnLf9rigebiVErrPDhYBrbZdBdnBNmqwR5GD5iCKmy
 MQ8VS8FmeZybzY45j7a/cF3rThP0ZxGN5FQrEa7gI9BQh/8mhwYyvcZ8AWu52g8LiFEr
 ttuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=hxTRuwuwoz+yNxAP/6AWKELjPIZFSOzk04+9b9KVhAk=;
 b=DtCKydZSghBl2+WHLvsReHfWDUKGzOVgeIDtackyT9muFBXKxPO+oHDslDXEVk9sdH
 i9TwWcpBAUFThe9Dn90Q0LWbbWS7FnSU8wKJmO+/GxsevUfz1pGH5P4xXfA8PPOdkTIp
 BDHr7uMeaCrlw3prfrr/LUARd+gna8hihwNeU7+qL141+48yTk7ZHeC7kqjokVgrR2XM
 usORaPq6BvLj5nGC4LVJqJ/JlnRYphBmg9Os7U77Qzz39dO/ZtHc8lRTBkH2uC5A69LZ
 RkxbpdZdRfiehgWgilh62AcHOrUfS/KthfboMdZp4GdG3tyVmSGCePNf4ifm89/WRPUI
 LQEw==
X-Gm-Message-State: AOAM5324K02VKvQCrlYoUBZmN9Kx0VcI7r2sO1ET9sv8Fv6ur+hq+yc1
 0mB/30GnNeegIrai+lD7BpGcgQ==
X-Google-Smtp-Source: ABdhPJwwggNEsnZknRY5cUfKVjS9yEm36sJPzqX9ONPiz7bO+HrPfpDp5q8F40r8hZSSop3cFhXPWA==
X-Received: by 2002:a17:90a:7bc5:: with SMTP id
 d5mr2184292pjl.99.1604057286210; 
 Fri, 30 Oct 2020 04:28:06 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 15sm5321549pgs.52.2020.10.30.04.28.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Oct 2020 04:28:05 -0700 (PDT)
Date: Fri, 30 Oct 2020 16:58:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH 2/3] opp: Add devres wrapper for dev_pm_opp_set_prop_name
Message-ID: <20201030112802.bptlthpxl2qvbvr6@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201012135517.19468-3-frank@allwinnertech.com>
 <20201028102942.zc5hgqpo2bfrn6in@vireshk-i7>
 <CAEExFWvNgK2wbvmxZjsJR4g-VBq=ggsBLew77rzmNdkpqTRuDA@mail.gmail.com>
 <20201028144628.qm2t2hbzmouqkciy@vireshk-i7>
 <CAEExFWtYrT3psuLC0fd7cX2GrmPaYxqZK65OLUv+2s97ehz97g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEExFWtYrT3psuLC0fd7cX2GrmPaYxqZK65OLUv+2s97ehz97g@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: Nishanth Menon <nm@ti.com>, freedreno@lists.freedesktop.org,
 Frank Lee <frank@allwinnertech.com>, airlied@linux.ie,
 Viresh Kumar <vireshk@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, dri-devel@lists.freedesktop.org,
 gustavoars@kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, kholk11@gmail.com, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAtMTAtMjAsIDE5OjE5LCBGcmFuayBMZWUgd3JvdGU6Cj4gR1BVIGlzIGFsc28gYSByZWxh
dGl2ZWx5IGxhcmdlIG51bWJlciBvZiBvcHAgY29uc3VtZXJzLgoKSSB3YXMgdGFsa2luZyBhYm91
dCB0aGUgbnVtYmVyIG9mIGZpbGVzIG9yIGxvY2F0aW9ucyBmcm9tIHdoaWNoIHRoaXMKcm91dGlu
ZSAodGhlIGRldm1fKiB2YXJpYW50KSBpcyBnb2luZyB0byBnZXQgY2FsbGVkLiBBbmQgaXQgaXMg
b25lCnJpZ2h0IG5vdy4gQW5kIEkgZG9uJ3Qgc2VlIGlmIGFueSBvZiB0aGUgb3RoZXIgY2FsbGVy
cyBhcmUgZ29pbmcgdG8KdXNlIGl0IGZvciBub3cuCgo+IE1vc3Qgb2YgdGhlIHRpbWUsIHRoZSBk
ZXZfcG1fb3BwX3NldF8qIGZ1bmN0aW9ucyB3aWxsIG9ubHkgYmUgc2V0IG9uY2UuCgpSaWdodC4K
Cj4gSWYgZG9uJ3QgbmVlZCB0aGUgZHJpdmVyIHRvIGR5bmFtaWNhbGx5IG1hbmFnZSBhbmQgcmVs
ZWFzZSB0aGUgb3BwLCBpdAo+IG1heSBiZSBPS++8nwoKRXZlcnkgY2FsbCB0byBkZXZfcG1fb3Bw
X3NldF9zdXBwb3J0ZWRfaHcoKSBpbmNyZWFzZXMgdGhlIHJlZiBjb3VudCBvZgp0aGUgT1BQIHRh
YmxlIGFuZCBpZiBpdCBpc24ndCBiYWxhbmNlZCB3aXRoIGEgY2FsbCB0bwpkZXZfcG1fb3BwX3B1
dF9zdXBwb3J0ZWRfaHcoKSwgdGhlbiB0aGUgT1BQIHRhYmxlIHdpbGwgbmV2ZXIgZ2V0CmZyZWVk
LiBTbyBpZiB0aGUgZHJpdmVyIGlzIGEgbW9kdWxlIGFuZCBlbmRzIHVwIGNyZWF0aW5nIGFuIE9Q
UCB0YWJsZQpldmVyeSB0aW1lLCB0aGVuIHRoaXMgd2lsbCBsZWFkIHRvIGxlYWthZ2UuCgpUaGUg
YmVzdCB3YXkgdG8gZml4IHRoaXMgaXMgYnkgY2FsbGluZyBkZXZfcG1fb3BwX3B1dF9zdXBwb3J0
ZWRfaHcoKQpmcm9tIHRoZSByaWdodCBwbGFjZSBhbmQgdGhlbiB3ZSBhcmUgZ29vZC4KCi0tIAp2
aXJlc2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
