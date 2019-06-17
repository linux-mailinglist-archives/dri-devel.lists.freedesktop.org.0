Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B6747A7B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D9C8916D;
	Mon, 17 Jun 2019 07:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD9289165
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 04:26:57 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id n65so573045pga.4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 21:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PmqFguwW3dYc7xJhH5/ZTk/3G85fwsIEI5IZBeTVbMI=;
 b=kZbtJWCa59Evov5sguCBsFYdljNVo2Tk7CWF7ZueMRJYgeQQfGJh17FYsb8Wrj1elg
 O3aEw8Rx46qPYVlSnm0wmfvywaAJSHkuxdn7ZqRprrH0pvJAIGhYAqYFNfFuXWZX2Bxh
 u1YumiFWT/VvAQSNlPyf/jkFB6uCmXx/PmjDP0au03E1asiAdjX5mU9ihVgu+ijLxp3K
 JpRTYkkELaw3iDtPUTq3DMJw+3ai225VM+MjR4jSvyZTjslrauWqKdMgQ8oXJmM5MW5n
 zsDAI5LRcZ6IVNhbKZjTlmAdZTOt2CV7pK/tV3/Li6uzCl2s0K/QMSqZqZiRwSzN/8BM
 CTiw==
X-Gm-Message-State: APjAAAXAbenlud8OPAnXE7Rtv+bZxugAIP/jl4tyqxx47RZc9Gswyu8a
 uTWyXQi738v5ubhPEeX/m2HrMA==
X-Google-Smtp-Source: APXvYqzqf2rvVzZQ9jtplmCuuCEzv3tRRPzxsJ+P8Z5XBfMDeAYsYxpXV5gZplXN6I0Z9Bp2k24iCA==
X-Received: by 2002:a63:246:: with SMTP id 67mr48365918pgc.145.1560745616533; 
 Sun, 16 Jun 2019 21:26:56 -0700 (PDT)
Received: from localhost ([122.172.66.84])
 by smtp.gmail.com with ESMTPSA id s64sm10266562pfb.160.2019.06.16.21.26.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Jun 2019 21:26:55 -0700 (PDT)
Date: Mon, 17 Jun 2019 09:56:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [RFC v2 00/11] DVFS in the OPP core
Message-ID: <20190617042654.xdqx5naxo3lq7kv6@vireshk-i7>
References: <20190320094918.20234-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320094918.20234-1-rnayak@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 17 Jun 2019 07:13:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PmqFguwW3dYc7xJhH5/ZTk/3G85fwsIEI5IZBeTVbMI=;
 b=T1bv07G606y22acLgdMZkhaLJx08RUHyZBX7NdaHMzsC4fMzVPcJ02aU7u5IykZhqg
 SlAfQR0uFoGC+bPxUEGOXI6tFFYfoZLFmk1py+M7f9MftwDzqJCzY/6BvQ/k10SbjYt1
 Sg1ky4ojNLm9kyNOa+3B56ibkdrvgeDgx55vLLfg6TT86hDy2fCvMyIViyZ5nFPI/4lW
 8RDCU91bKDgJHKygUFl6M+7lyW6y3JosmhS2sCekPqqmfPvshQ/fh9FJsbXHh/LF1BcH
 bCzZn5g4twxBZ7Rsn0H8SegEmRp47yDF57icq13SQvZfGTFfOwW9xlLbgilfbDOsQkQI
 LETQ==
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
Cc: ulf.hansson@linaro.org, dianders@chromium.org, linux-scsi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, swboyd@chromium.org
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
Cj4gWzNdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzMvMjAvMTIwCj4gCj4gUmFqZW5kcmEg
TmF5YWsgKDEwKToKPiAgIE9QUDogTWFrZSBkZXZfcG1fb3BwX3NldF9yYXRlKCkgd2l0aCBmcmVx
PTAgYXMgdmFsaWQKPiAKPiBTdGVwaGVuIEJveWQgKDEpOgo+ICAgT1BQOiBEb24ndCBvdmVyd3Jp
dGUgcm91bmRlZCBjbGsgcmF0ZQoKSSBoYXZlIGFwcGxpZWQgbW9kaWZpZWQgdmVyc2lvbiBvZiB0
aGVzZSB0d28gcGF0Y2hlcyB0byB0aGUgT1BQIHRyZWUgbm93LgpUaGFua3MuCgotLSAKdmlyZXNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
