Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E97BF707C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE9B6E869;
	Mon, 11 Nov 2019 09:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CF56E867
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:25:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i12so6853475wro.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 01:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=bSMoujBCOiShaOME23UahvoRFbCvakiXJQBAxitgQQI=;
 b=HI+JUwIRFom1hYrxLys0SrfADpBcCT34igijNfc/B9yF4snFJpwvn9TEZNsEyQmWVN
 FaGvzDHVXKvyFW+pbCZ4loPjWEnhD1Qikkt8MqyZeXoPoVG0Atl9jOOWoOdhrQt9A5d6
 gO9sH2kCEEz71HWeudAWRUJiwMTekbTgJHEMRjYyWIJ3whqdmjHk7eB50r03LIDX8rp6
 WppoVk0Qqlc13A6fzP3I/dU9GuqQaVmEI5eKqWJ68PRVGBG1dfr/eqKayDqZKx1myRdE
 ACmkF51el3uC+UAeg+TFwC1RCpMtA+F5PnIhDL57JCoJSMTesSLjlOa+H78MR2P4lsSq
 yODw==
X-Gm-Message-State: APjAAAUwDMshQmx4JCkvvOJd9HhlbNlFWWyiqQ8cudQ/THtYlyeZ6QLg
 4/ZfOJinzpZYhQ/xDnnicIIGrg==
X-Google-Smtp-Source: APXvYqyfcu9bp99G9saaiWZdJypi7e3YwTOAFrPM3hIAg05FdWhgae+G6d5UMCrhcrMkQIAoN8iJNg==
X-Received: by 2002:adf:ed4b:: with SMTP id u11mr262428wro.215.1573464302760; 
 Mon, 11 Nov 2019 01:25:02 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id i71sm32275541wri.68.2019.11.11.01.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 01:25:02 -0800 (PST)
Date: Mon, 11 Nov 2019 09:24:54 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V10 2/8] backlight: qcom-wled: restructure the qcom-wled
 bindings.
Message-ID: <20191111092454.GP18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572589624-6095-3-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=bSMoujBCOiShaOME23UahvoRFbCvakiXJQBAxitgQQI=;
 b=s6upeI4FnIvRR5zLwQsUkI3/ZMzqr5DgNeHpWoPb+6H2V3hXM7UvBjdCn4Nux32H5U
 MvManwUvVpVjjkeVUULBcPUHTNxvLKVKzixF5laNWDCZUDW4F95Q3AsdD0IQHsGxBTQn
 B+BbSW/DT2hgASvbgYv4M42NmdlPcmU6qlv3n72TntMXJPXH64H72RWa1NSssjin1nIT
 vakgqvqU8lLKyCnj9zOgp4jk679iFCmIpMjH34kNjJ+igjToxEFjoegas90cWTR0x3Cu
 E8siF75VAjfQdqt2f6WyUGKKlkr/NlVNQaieU/RMCxT16e757uUePZm/zogW6mnRMYzv
 I8Jw==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwMSBOb3YgMjAxOSwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IFJlc3RydWN0dXJlIHRo
ZSBxY29tLXdsZWQgYmluZGluZ3MgZm9yIHRoZSBiZXR0ZXIgcmVhZGFiaWxpdHkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogS2lyYW4gR3VuZGEgPGtndW5kYUBjb2RlYXVyb3JhLm9yZz4KPiBSZXZpZXdl
ZC1ieTogQmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4KPiBSZXZp
ZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBBY2tlZC1ieTogRGFuaWVs
IFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiBBY2tlZC1ieTogUGF2ZWwg
TWFjaGVrIDxwYXZlbEB1Y3cuY3o+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9sZWRzL2JhY2tsaWdo
dC9xY29tLXdsZWQudHh0ICAgICAgICAgIHwgMTEwICsrKysrKysrKysrKysrKystLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgODUgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgpBcHBsaWVk
LCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNo
bmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNv
Q3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
