Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D6D25FC0D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 16:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F168D6E478;
	Mon,  7 Sep 2020 14:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2716E342
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:10:09 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v23so15072529ljd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xDotO2hIGScy379wQahz2M8ztp2ZYXXRt81YQ3ss4Dc=;
 b=msB7OU2C6lpqrvWjU5mynyi/AaWRIZpWT7OdJNJZar90EMPKIjbjrY7+YNSZsXIAIg
 fO67nUaPkNlL00hW0fh95bP/BxXjC07MLRocHkg4A5+nz/sJ7Q5AcT9p/aLq93on33bX
 8dCf8HLPjYCbsIhB67O9HfEFH7xTdYmYdK0MCV3tjHPRdpA1I4NY8vXWurngNB/SkZxC
 RruyXTnwmmb44N2Nh8kPrSVvfuVEwc3ndKgZNAWr9qU4w7qUKnI/eiZz2XJAzjdN1Jav
 Dks66b9luVSZJDiYXAIPSrp9RI9Shncznxp7WjkTVPPzpggT65T+WUsxSFR0SCC6NPy4
 ZZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xDotO2hIGScy379wQahz2M8ztp2ZYXXRt81YQ3ss4Dc=;
 b=JNT4I5v975E7YY5Bh1gGc2LP5rUY+BnCWXY2saPT380PoXZkiGWbi3nQsmVnxlLsKi
 CLQsBxS9arpcyLZp3o9+lRLrK1qP2D+AUZUzyVjG5lOWEl+50KTtABCqBjYvhIGuGKgz
 NvvEtfnqd//3Ph7BM43ZQuQAusKVdPQgsiX71T1Y0dnKBV0JQB6hzDH3o8l1RWR3Hpfu
 zunpXYW1kKyCQWZLwtvSpkzyOUyrba8axoivv6Oyc5pduquiFa89DyGYcvin0vUhYEuB
 P+utVoV4fb2WedWkF0mH8eU6uyi+2zLuISN8vbxkhO2G9FEOOtttisPz48RWbTAKKqGi
 Fwfw==
X-Gm-Message-State: AOAM532uVz3HAWBTvcA3+E9BD2MKyyfdnGISIvLhNWELC2L8jU1FZiGR
 LCED+KKKc/LHwYDklrPe7IbkLW/qM9Gkbw==
X-Google-Smtp-Source: ABdhPJzNlKcJI7jtGEMuFEx/r/EP1I4zmImDZ2D8wVruQ/zbs+0BIL12VhKglLQyvxFgHbntWx1GYw==
X-Received: by 2002:a2e:548:: with SMTP id 69mr10216545ljf.386.1599466208061; 
 Mon, 07 Sep 2020 01:10:08 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276?
 ([2a00:1fa0:6a2:89f3:b416:2a89:c3ba:d276])
 by smtp.gmail.com with ESMTPSA id p18sm4538854ljg.26.2020.09.07.01.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 01:10:07 -0700 (PDT)
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Laurent
 <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
 <f106c6df-b85a-1850-d36a-ac18ec629986@gmail.com>
Organization: Brain-dead Software
Message-ID: <fc837810-9d86-df62-94b2-a2976f6d5463@gmail.com>
Date: Mon, 7 Sep 2020 11:10:05 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f106c6df-b85a-1850-d36a-ac18ec629986@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Sep 2020 14:29:04 +0000
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
Cc: Linux-DT <devicetree@vger.kernel.org>,
 "\(Renesas\) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDkuMjAyMCAxMTowOCwgU2VyZ2VpIFNodHlseW92IHdyb3RlOgoKPj4gRnJvbTogS3Vu
aW5vcmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+Pgo+PiBU
aGlzIHBhdGNoIGFkZHMgVlNQIGRldmljZSBub2RlcyBmb3IgUi1DYXIgTTMtVysgKHI4YTc3OTYx
KSBTb0MuCj4+IFRoaXMgcGF0Y2ggaXMgdGVzdCBvbiBSLUNhciBNMy1XKyBTYWx2YXRvci1YUyBi
b2FyZC4KPiAKPiAgwqDCoCBXYXMgdGVzdGVkPwoKICAgIFRoZSBzYW1lIGNvbW1lbnQgdG8gdGhl
IHBhdGNoZXMgNiAmIDcuCgo+PiBTaWduZWQtb2ZmLWJ5OiBLdW5pbm9yaSBNb3JpbW90byA8a3Vu
aW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+Cj4gWy4uLl0KCk1CUiwgU2VyZ2VpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
