Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596E263186
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F1C89DEA;
	Tue,  9 Jul 2019 07:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F1189FFD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 18:18:43 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id g15so8099723pgi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 11:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/QMgQTKtFRkJ4v8si1Lhzq6OUV7QwuUzq9j2cNj8/jE=;
 b=ewi/EezHVgyRLSdg2PSk1qBiSsfs7rncRdZGKInx056jmXQkhzWlCys5KdyMOofzE6
 zI3MPkrL/eh0cjLW0L9zGl+RUzjYeNOfvs4mlg0vBRxEQ6LvJ4wiAUCQe9OP8Qh6rGkZ
 Tp7fEIL3Bx2/mnOO9KD6svlrv6aLkdm4t2Qk0jX+elsOb4yxkw0g6AnmNStOw7yqmiid
 lVCFnAgPXMMd8HZxQLFxnyx6uZyMJ8hgNetEZ7uoSHIQy0qPamSoWWqi20Vp0Y6xPAou
 lif7XVWe/8FXP94q0gH2fVpp8Tx72AmaZ1PIKt2AA+14b4P9LQJxeGX74RxopaMoxZHq
 CvRQ==
X-Gm-Message-State: APjAAAUCroixEN6sanm/z6PgDLGRryfpvLFIecxYK6wJ1juBSEW+gFg2
 JWWTTSteDf1EvRWkww6oncQ26w==
X-Google-Smtp-Source: APXvYqzsXmKUfVEW/k/FB3dDrJJr364KJZ/8KOYkHUL0DikG1R+45OGwaG/PKF8QRVQG5eGuniNanQ==
X-Received: by 2002:a17:90a:4803:: with SMTP id
 a3mr28046704pjh.58.1562609923292; 
 Mon, 08 Jul 2019 11:18:43 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id t8sm179007pji.24.2019.07.08.11.18.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 11:18:42 -0700 (PDT)
Date: Mon, 8 Jul 2019 11:18:40 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: add missing MODULE_FIRMWARE()
Message-ID: <20190708181840.GD30636@minitux>
References: <20190703140055.26300-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703140055.26300-1-robdclark@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/QMgQTKtFRkJ4v8si1Lhzq6OUV7QwuUzq9j2cNj8/jE=;
 b=yrveiZfDqMQPVb5N9MbMDDnxfNkt+t0+tuHlP4drzJ9vt+xF4DpLWTIFI4YTnzsx43
 vql/uZ7KD4+n/ls+9rTUSm2vlM752Xqs636O9zKJ6Hn3gvdSJ41GPnB4D3LzedFc9EAg
 /LKNFyXGm+oAgntunFj8wSOMVuI8WOG7X0g+1zAQNrr8M46zfrz3CXzgicI/ZtifWRBu
 9Rd1K0xsCEJW3aAoZrIKCP7Qsothk1dqLK7TCXQxPnIuXGpNuttws3mpmoaeapRMDSA1
 dcwJQBjDdiWzifTm0FjCPLOHYuRZRedSI2p93sI4c2IYzKT3WQTQxw9uOFfbprTYhmYF
 9BKg==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkIDAzIEp1bCAwNzowMCBQRFQgMjAxOSwgUm9iIENsYXJrIHdyb3RlOgoKPiBGcm9tOiBS
b2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gCj4gRm9yIHBsYXRmb3JtcyB0aGF0
IHJlcXVpcmUgdGhlICJ6YXAgc2hhZGVyIiB0byB0YWtlIHRoZSBHUFUgb3V0IG9mCj4gc2VjdXJl
IG1vZGUgYXQgYm9vdCwgd2UgYWxzbyBuZWVkIHRoZSB6YXAgZncgdG8gZW5kIHVwIGluIHRoZSBp
bml0cmQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0u
b3JnPgoKTXkgdXBjb21pbmcgcHVsbCByZXF1ZXN0IGZvciB0aGlzIG1lcmdlIHdpbmRvdyBpbmNs
dWRlcyB0aGUgc3VwcG9ydCBmb3IKdGhlIG1kdF9sb2FkZXIgdG8gcmVhZCB1bnNwbGl0IGZpcm13
YXJlIGZpbGVzLiBTbyBob3cgYWJvdXQgcnVubmluZyB0aGUKZmlybXdhcmUgdGhyb3VnaCBbMV0g
KHBpbC1zcXVhc2hlciBhNjMwX3phcC5tYm4gYTYzMF96YXAubWR0KSBhbmQKcG9pbnRpbmcgdGhl
IGRyaXZlciB0byB1c2UgdGhlIHNpbmdsZSAubWJuIGZpbGUgaW5zdGVhZD8KCgpJZiBub3QsIHlv
dSBoYXZlIG15OgpSZXZpZXdlZC1ieTogQmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25A
bGluYXJvLm9yZz4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vYW5kZXJzc29uL3BpbC1zcXVhc2hl
cgoKUmVnYXJkcywKQmpvcm4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2Fk
cmVub19kZXZpY2UuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZp
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2UuYwo+IGluZGV4
IGQ5YWM4YzRjZDg2Ni4uYWE2NDUxNGFmZDVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2FkcmVub19kZXZpY2UuYwo+IEBAIC0xNzQsNiArMTc0LDEwIEBAIE1PRFVMRV9GSVJN
V0FSRSgicWNvbS9hNTMwX3phcC5iMDEiKTsKPiAgTU9EVUxFX0ZJUk1XQVJFKCJxY29tL2E1MzBf
emFwLmIwMiIpOwo+ICBNT0RVTEVfRklSTVdBUkUoInFjb20vYTYzMF9zcWUuZnciKTsKPiAgTU9E
VUxFX0ZJUk1XQVJFKCJxY29tL2E2MzBfZ211LmJpbiIpOwo+ICtNT0RVTEVfRklSTVdBUkUoInFj
b20vYTYzMF96YXAubWR0Iik7Cj4gK01PRFVMRV9GSVJNV0FSRSgicWNvbS9hNjMwX3phcC5iMDAi
KTsKPiArTU9EVUxFX0ZJUk1XQVJFKCJxY29tL2E2MzBfemFwLmIwMSIpOwo+ICtNT0RVTEVfRklS
TVdBUkUoInFjb20vYTYzMF96YXAuYjAyIik7Cj4gIAo+ICBzdGF0aWMgaW5saW5lIGJvb2wgX3Jl
dl9tYXRjaCh1aW50OF90IGVudHJ5LCB1aW50OF90IGlkKQo+ICB7Cj4gLS0gCj4gMi4yMC4xCj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
