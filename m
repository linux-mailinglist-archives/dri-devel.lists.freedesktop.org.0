Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DF656A4A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 15:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A466E426;
	Wed, 26 Jun 2019 13:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAE46E426
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:22:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x4so2723188wrt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 06:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=cuxtZ9Aae3DH1NJCfDMKnoPl+FBHAa2h/EExjT0fQNc=;
 b=gdpLe5vdDD5KRxXGWkFfbkBilNijcje64x2JBbFBKNLZZIyaSgYpXnN2xKubxEq+iO
 oBl+1UN+7jSkcPTGuTQYkZL+cYou7nC9KSUPQThANI8ulHiz6A5YTSGqTOnlBDG0dq2a
 ZYIP1MNkZvMa5yUJnbKQ1X8T+abugE9YBKKjgKsAUa1Xo19YcdCcg942Y1cvbxb5C9AQ
 evB4mruuClssS6AiNn9It9Jmsj5yuRQZ5fVpGKqb5nkrPHQGtESDYxzljFEoh0n9Gig6
 7Dbh8OHEXElrIAXVVsROBEeQSxc5+bCJqylUKAoiYWtchKW0UeuxxevsfyUpuL7RyCyH
 yjUQ==
X-Gm-Message-State: APjAAAUUqWGzTi0IHrEgBo3Wqy9gvjUmS8UM0nIiCcLb5ov/ngYD+Jdv
 A29rFs6eezTxYkALF2KgQrbmiQ==
X-Google-Smtp-Source: APXvYqzycz2lKwnCYPycV/KI1zIZm5ZA2Kw7FmtYekLbuzv56bWJYZ2WZIyiB7E3oEK8U8XQ2vtJlw==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr2629049wrs.58.1561555335964;
 Wed, 26 Jun 2019 06:22:15 -0700 (PDT)
Received: from dell ([2.27.35.164])
 by smtp.gmail.com with ESMTPSA id y133sm3197821wmg.5.2019.06.26.06.22.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Jun 2019 06:22:15 -0700 (PDT)
Date: Wed, 26 Jun 2019 14:22:13 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
Message-ID: <20190626132213.GX21119@dell>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
 <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
 <20190626105614.ujmryi7qou2ra7aq@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626105614.ujmryi7qou2ra7aq@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=cuxtZ9Aae3DH1NJCfDMKnoPl+FBHAa2h/EExjT0fQNc=;
 b=KGHXnME8o1CNzuLsNPnksWtUosw23qQsHaBKXq7l1B7ki3v5PtB9qp1S2vlfHrc9jj
 SXdwe77palkdFKReSxHp+34zIFIX60YKsS3Za8CENaN7Xc8mWa2p39JJw5gT043pKVSP
 Re0bvBqiAnJGmlUNu5jzeFx82sJo5RKtEZh0hwm8U+Ov0mYzkWnFXQMgWVhlCEw9Vrph
 tcxtM3p+ojk81iUVnyYM2+PzCn6Iw22csDFhJ9TdGFkAtuf025EW/xyVtFVMehffxiXZ
 /8GW+qcbApofZG59odL2ArxowKdnQIHafbR+o99bCvHOXZQqoEUwcRcyTYsT6Mq4l28C
 ZJVA==
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
Cc: devicetree@vger.kernel.org, Brian Dodge <bdodge09@gmail.com>,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, Pavel Machek <pavel@ucw.cz>, pbacon@psemi.com,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNiBKdW4gMjAxOSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiBUdWUsIEp1
biAyNSwgMjAxOSBhdCAwNzo0NDowNkFNIC0wNDAwLCBCcmlhbiBEb2RnZSB3cm90ZToKPiA+IEkg
d291bGQgbGlrZSB0byBkZXByZWNhdGUgdGhlIG9sZCBwcmVmaXggaW4gdGhlIGZ1dHVyZSBhZnRl
ciBjb21tdW5pY2F0aW5nCj4gPiB3aXRoIGFsbCBjaGlwIGN1c3RvbWVycywgd2hpY2ggaXMgd2h5
IHRoZSBvbGQgcHJlZml4IGlzIG5vdCBkb2N1bWVudGVkIGluCj4gPiB0aGUgbmV3IGJpbmRpbmdz
Lgo+IAo+IERlcHJlY2F0aW9uIGlzIGZpbmUgKGJ5IG1lIGF0IGxlYXN0KSBpdCdzIGp1c3QgdGhh
dCBJJ20gbm90IHN1cmUgdGhhdAo+IHJlbW92aW5nIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUg
ZGVwcmVjYXRlZCBiaW5kaW5ncyBpcyB0aGUgcmlnaHQgd2F5Cj4gdG8gZG8gaXQuIFdoYXQgaXMg
dGhlIHByaW9yIGFydCBoZXJlPwoKSSdkIGxldCBSb2IgZXQgYWwuIG1ha2UgdGhlIGZpbmFsIGRl
Y2lzaW9uLgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmlj
YWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MK
Rm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
