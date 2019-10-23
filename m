Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026A6E2B11
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 09:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BB96E103;
	Thu, 24 Oct 2019 07:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763CE6E154
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 20:21:43 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id b24so254710wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 13:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JvlbyXuPyFTwAied7QnteSmnSAks0nnDSQo1KMTiaVE=;
 b=nHfxyZ408fhOTY2Qquc8P4VRIbZM8UqR7B4uLxxD4+Rgyc9CKnGtS3mInPY/NobySY
 tIEZKJDtG+BlEnRQfapkFTZO6uWo5p4X0++pWc1SBqZ8seNXEtLMYsptE2+J7Xf0IDwW
 loymZ78aBDVbxsIC8EwvM6lqt/AVXhREMKKh+++g1pxmwzqy4/nZd9eLJPbT15oXtLGv
 ZpuxP0yqdJSiquS7ycri78USgeIt6rQZuhVo91kObVUNW4fwVY28SzAUeyBS5LsfqDuY
 MbZhJjl1XkQQ0zF046Gsr0hZ4bPsz2Vwov/1yZNwA0MGfxfkitKFf9IFkwrw/QiQ/0yj
 1j0A==
X-Gm-Message-State: APjAAAVLI6azGrO+UGkEWIOyNC5DrdaFkrPvubIPjDXxAcMEl/e98+/8
 P8LGgTSBAkmaH0fxY/jEWmmT2g==
X-Google-Smtp-Source: APXvYqx/TQ4n7MgqmhhUNyCHVlVoWUDwk6UPKxs7AhubFXQlhlXDfD+59nnAXt9e3Fhnux5l8ALyIw==
X-Received: by 2002:a7b:c011:: with SMTP id c17mr1570137wmb.95.1571862102054; 
 Wed, 23 Oct 2019 13:21:42 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id v128sm365873wmb.14.2019.10.23.13.21.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Oct 2019 13:21:41 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] backlight: pwm_bl: fix cie1913 comments and
 constant
To: Lee Jones <lee.jones@linaro.org>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
 <20191008120327.24208-2-linux@rasmusvillemoes.dk>
 <20191014072710.GE4545@dell>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <d716cb92-4d72-f661-2ef9-2771846569e8@rasmusvillemoes.dk>
Date: Wed, 23 Oct 2019 22:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014072710.GE4545@dell>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 24 Oct 2019 07:27:37 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JvlbyXuPyFTwAied7QnteSmnSAks0nnDSQo1KMTiaVE=;
 b=Xj42kaG68KB2VqgfIb5WaldkwjZPYh7u9UuIqn13LK273eVvgXA00Y6Cswp8d1l7qz
 T4/UEKKv7M1R1vyNyt7A7scnybyl1yjgaLmKbryMQECyRBLKXIo5TbE8jP6iPxa6Lsp1
 erAhoFjfmB25XdzGmrcYkhnwlrc9jd7YJADBI=
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMTAvMjAxOSAwOS4yNywgTGVlIEpvbmVzIHdyb3RlOgoKPiBBcHBsaWVkLCB0aGFua3Mu
CgpJJ20gbm90IHNlZWluZyB0aGUgc2VyaWVzIGluIG5leHQtMjAxOTEwMjMsIHNob3VsZCBpdCBi
ZSB0aGVyZT8KClJhc211cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
