Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB36346225
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C9E6E91D;
	Tue, 23 Mar 2021 15:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8436E91D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:00:37 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id o126so17591596lfa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=60EfMvM37qn0EhwNos9h/7fWqDVyOdNY4qBVAv1lRe0=;
 b=QugGOQXZYpg+gt9e/l75epoiRg+Y8Yph2FPX5l88o3OA7/aDJENvxzxRYgfD5HDefi
 6NnZv4lfoadqlbxFfHD5AN3058f0VzY9Uu4McLJvJvPN1cE1UEE/7K1ELMrJVHucEC9+
 0QRgCXZm7AG1giJmTYo8U/BRXlXgfVe1+YQwdS01AD1RbG53B4SJGX1lz0pDgnDZkyiF
 wEpFKn0z8/WcPg9cWrimuOKC6zWxjOQgREvz6hQ2lIR41tc55LooXB5atgLRL3aEl023
 ZfDhCTXRIZmqHC3Ljy46SMsHgbKjESsC3yY0MykSELhvcprAPRoD7IoXuz1fuMTcp6xR
 3EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=60EfMvM37qn0EhwNos9h/7fWqDVyOdNY4qBVAv1lRe0=;
 b=SDfRLKMKBQBFf1onPwkDGoEauuxGC32xJpAlBYBBtNzJfa76kf6auFuMOzqlw8U2IJ
 06YbZ1/pCkx3Vts/uVtzoTE1siqf4IlwHp3ukUvvWMWQBzaT0Pdvlih2VcsoYZTYp0lD
 FiVXlxAT/r+rkWVuK+YiiZhuZ3gLHbxnJqeD8lQvVQh3X1CGxQtaZB4bmMJcn+E5MxR+
 /jtfcN0bA/aYRwoFO/XX5xwTx1YajBiQRdhJr6RfH/e7InPju3iuUlg1ZNOBpTj2Cmhj
 8bPfZmqABfBpLZNuwicXhjWj+BxVldnosMoeDTKWVUS61OaN0OYPJcgTSpqXp243HTKp
 N2MA==
X-Gm-Message-State: AOAM530l9TeflRmv0+Qo4+KeYkvu5yx2oeDIHiJ7uosSb3QTWw8kD5X3
 hFo0GmUzUaKV+H0PrJxgAdA4W/tzj4A=
X-Google-Smtp-Source: ABdhPJyGBDep2PCcbA1WpB8VpiD3oIAD3OKKWLAGjP2y9Kat5HAthvWKJdyXuIYa01srFVx9vX4ZJA==
X-Received: by 2002:a19:3850:: with SMTP id d16mr2916590lfj.473.1616511635688; 
 Tue, 23 Mar 2021 08:00:35 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru.
 [109.252.193.60])
 by smtp.googlemail.com with ESMTPSA id a26sm2290151ljm.107.2021.03.23.08.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 08:00:35 -0700 (PDT)
Subject: Re: [PATCH v5 19/21] drm/tegra: Implement new UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-20-mperttunen@nvidia.com>
 <YFnsQNiLg/5I/qKA@orome.fritz.box>
 <494e3858-5b29-0b44-f2eb-7a7cc16ff325@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2c557b45-f78c-5f49-7f9f-e84edacd4a08@gmail.com>
Date: Tue, 23 Mar 2021 18:00:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <494e3858-5b29-0b44-f2eb-7a7cc16ff325@kapsi.fi>
Content-Language: en-US
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDMuMjAyMSAxNzo0MywgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+Cj4+IEZXSVcs
IEkgd291bGQndmUgYmVlbiBmaW5lIHdpdGggc3Rhc2hpbmcgYWxsIG9mIHRoaXMgaW50byBkcm0u
YyBhcyB3ZWxsCj4+IHNpbmNlIHRoZSByZXN0IG9mIHRoZSBVQVBJIGlzIGluIHRoYXQgYWxyZWFk
eS4gVGhlIGNodXJuIGluIHRoaXMgcGF0Y2gKPj4gaXMgcmVhc29uYWJseSBzbWFsbCwgYnV0IGl0
IHdvdWxkJ3ZlIGJlZW4gZXZlbiBsZXNzIGlmIHRoaXMgd2FzIGp1c3QgYWxsCj4+IGluIGRybS5j
Lgo+IAo+IEkgdGhpbmsgd2Ugc2hvdWxkbid0IGhhdmUgdGhlIHVhcGkgaW4gZHJtLmMgLS0gaXQg
anVzdCBtYWtlcyB0aGUgZmlsZSBhCj4gYml0IG9mIGEgZHVtcGluZyBncm91bmQuIEkgdGhpbmsg
ZHJtLmMgc2hvdWxkIGhhdmUgdGhlIGNvZGUgdGhhdCByZWxhdGVzCj4gdG8gaW5pdGlhbGl6YXRp
b24gYW5kIGluaXRpYWwgcmVnaXN0cmF0aW9uIHdpdGggRFJNLgoKKzEgZHJtLmMgaXMgYWxyZWFk
eSB2ZXJ5IHVubWFuYWdlYWJsZSAvIGRpZmZpY3VsdCB0byBmb2xsb3csIGl0CmFic29sdXRlbHkg
bXVzdCBiZSBzcGxpdCB1cC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
