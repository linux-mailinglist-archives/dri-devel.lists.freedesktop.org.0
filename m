Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25178265FA
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D38289B83;
	Wed, 22 May 2019 14:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DD28921B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 06:22:51 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id g69so7915064plb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 23:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y2m5dpNz16ZybgYk5tQ8GutOzZqz8vAuz2rdBiTBnjw=;
 b=Q1GIJZBfSUnFIz2/Oi8090Kbb40D79ZunLkg+Jmvw7t88MYDnY449CzRMlmFcvRVRR
 83ElCcACddBnmJ/ADuzBmZde0Uq8D1dt08ZuJu6O8QjeULBSt5rLhiTSb2t1GrzPrTpj
 ybb2OYuyAaopNJzBDJkJl49QEKcFQ3iCxGqTt6Zi1rHP6itFnr/8ZSz/Cl6CNwmNaNYv
 jIYawJ0szyhfaiLCa8Yw+5GUAeki7Mxiz/mfS8WU3FPeoPtNySrpB9IRbF6fgNtJtlzL
 qEo8qXud5wS63cdPeWIOwERhtMasBu3e0NkZByivHFVpr1qe+1ldWsQZ0AW37lSMj9aW
 RYrg==
X-Gm-Message-State: APjAAAUQu2mryOYK0NP2G8oGu/OBtxaVJ2l+Xug5fmZJMZdZmZqZs4jv
 3ZKWMvvqQqoeOQ7gjM5Yoi2xeQ==
X-Google-Smtp-Source: APXvYqz2YMCSRvKN2MJ+jWniKEVRU5sQ/FMpg7ookR4wjHFWBAIZ3T0Rpg+BvD1LhysbsKdoQyBKgQ==
X-Received: by 2002:a17:902:8d96:: with SMTP id
 v22mr5073943plo.282.1558419770837; 
 Mon, 20 May 2019 23:22:50 -0700 (PDT)
Received: from localhost ([122.172.118.99])
 by smtp.gmail.com with ESMTPSA id n27sm42589245pfb.129.2019.05.20.23.22.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 23:22:50 -0700 (PDT)
Date: Tue, 21 May 2019 11:52:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [RFC v2 00/11] DVFS in the OPP core
Message-ID: <20190521062248.ogjetb2rwtqekflx@vireshk-i7>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320094918.20234-1-rnayak@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y2m5dpNz16ZybgYk5tQ8GutOzZqz8vAuz2rdBiTBnjw=;
 b=l9FHorTul2Tyg2dOrb6zBPnqrZNmerYqH7eUWz8QrYYH0IhCHHLfh32l4hP3eIA/X7
 vAjYlCEuZb1wqfD9LentK6vgUI8A/1mrqJ9S052A1vrO93c315n4VxO7f9kRYZ/dwhpt
 a2aJmXtu4Ef1cIkwGn8dhSCJPXp5lNBa9khww/rmBXfha/2d2tEcDNaiPXcmM3XDnEaQ
 mx1DNLV+4klz/BgBK87ZGo3hmiGMX2Wio0auyYuss6yzMBipwqekj/2uRHVRH1p/MxLn
 /xGx4aZ9zZwmOx4XOBcEUeoMV+xdaLp+hhXsm7XNYpMPkIwBvPkWXUbq5Wi0Owu0YWlS
 uo5w==
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
Cc: ulf.hansson@linaro.org, dianders@chromium.org, vincent.guittot@linaro.org,
 linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, rafael@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, swboyd@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAtMDMtMTksIDE1OjE5LCBSYWplbmRyYSBOYXlhayB3cm90ZToKPiBUaGlzIGlzIGEgdjIg
b2YgdGhlIFJGQyBwb3N0ZWQgZWFybGllciBieSBTdGVwaGVuIEJveWQgWzFdCj4gCj4gQXMgcGFy
dCBvZiB2MiBJIHN0aWxsIGZvbGxvdyB0aGUgc2FtZSBhcHByb2FjaCBvZiBkZXZfcG1fb3BwX3Nl
dF9yYXRlKCkKPiBBUEkgdXNpbmcgY2xrIGZyYW1ld29yayB0byByb3VuZCB0aGUgZnJlcXVlbmN5
IHBhc3NlZCBhbmQgbWFraW5nIGl0Cj4gYWNjZXB0IDAgYXMgYSB2YWxpZCBmcmVxdWVuY3kgaW5k
aWNhdGluZyB0aGUgZnJlcXVlbmN5IGlzbid0IHJlcXVpcmVkCj4gYW55bW9yZS4gSXQganVzdCBo
YXMgYSBmZXcgbW9yZSBkcml2ZXJzIGNvbnZlcnRlZCB0byB1c2UgdGhpcyBhcHByb2FjaAo+IGxp
a2UgZHNpL2RwdSBhbmQgdWZzLgo+IHVmcyBkZW1vbnN0cmF0ZXMgdGhlIGNhc2Ugb2YgaGF2aW5n
IHRvIGhhbmRsZSBtdWx0aXBsZSBwb3dlciBkb21haW5zLCBvbmUKPiBvZiB3aGljaCBpcyBzY2Fs
YWJsZS4KPiAKPiBUaGUgcGF0Y2hlcyBhcmUgYmFzZWQgb24gNS4xLXJjMSBhbmQgZGVwZW5kIG9u
IHNvbWUgdWZzIGZpeGVzIEkgcG9zdGVkCj4gZWFybGllciBbMl0gYW5kIGEgRFQgcGF0Y2ggdG8g
aW5jbHVkZSB0aGUgcnBtcGQgaGVhZGVyIFszXQo+IAo+IFsxXSBodHRwczovL2xrbWwub3JnL2xr
bWwvMjAxOS8xLzI4LzIwODYKPiBbMl0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMy84Lzcw
Cj4gWzNdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzMvMjAvMTIwCgpIaSBSYWplbmRyYSwK
CkkgYW0gaW5jbGluZWQgdG8gYXBwbHkvcHVzaCB0aGlzIHNlcmllcyBmb3IgNS4zLXJjMSwgd2ls
bCBpdCBiZQpwb3NzaWJsZSBmb3IgeW91IHRvIHNwZW5kIHNvbWUgdGltZSBvbiB0aGlzIGF0IHBy
aW9yaXR5ID8KCi0tIAp2aXJlc2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
