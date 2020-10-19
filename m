Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A47A2292E70
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 21:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC186EA46;
	Mon, 19 Oct 2020 19:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744836E32A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 02:21:21 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id v6so12146661lfa.13
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 19:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m+DOuOMWvvKHKiCURgikN8Y0Kr2cQb9cXTckw8NyNLE=;
 b=kvCnVlGwso7Jf67TjHV+ieOnUVecJsa7ctXI2WETH7qn/5IR6iriZkC0oyTnMR43mS
 /xUd6IcfLCve17t9Quie+Gk8uomjSh4nlgL7VwR1aPP1bzV06qKr3lgazXitAKOjWK1u
 87BR2mFaz1EmQpnGj0MOuqsYbFVGG9swF+omae2ubEJMIgSYCy8ffWHPe0wBnSD4cK+n
 HVVTSY4xMUNfJ6/Mb6TCnFMJ3kc1ZFtO2eintus/moZIJG45wdpfG+sfBwezJAEztJye
 8lYTOMhhU706ZRn6aDHkIGhBeZtVxfEdE4wB8MPjTOnxtLEzZh+O7jwbJ62d7EF3io3L
 Ae7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m+DOuOMWvvKHKiCURgikN8Y0Kr2cQb9cXTckw8NyNLE=;
 b=hoJ2nLjNUEn8s8YOkrvf/ystnOc52Q9GCRA9ETbF//9P/pO+vofjvxJYx5zB1nRFTj
 8OToCIf+pUF59Ey3cuLPzz3GABvVC4xovFVnVsJEoK+hKsfJxqtDOEVr07bMJCfOAh27
 WeLHK6BsGbAl53QoCXdwXDoEUET94wUwQuxqi0vm68v7Btghgm3zuMfVHfWYwsO6keNY
 Gug5F+DtZEb87e5DVPVyOli/mEfGEfp3qRRmEYJ2qCLbnAaKc2WENNTdn2YfcoQMqcMV
 bTXvMqq2Ncy4VIgmFeKmpLxsKdvqcjPH+RT9vG5kXSxUwK5lpv7haOZ6iXzrbIuf9v6G
 cYcw==
X-Gm-Message-State: AOAM533VZLsLMSE0mvHDUxr/q2gzOwhzZVU18LGKyGVf+mKz0X63x28S
 pgp/tLGkpNSCCEu3RuaI4oA=
X-Google-Smtp-Source: ABdhPJx7PACSdz0Ay2NcOuJC/k7L5C2ZbWYRB+SqDKWIU+wlNbeITzTUrKJkMZZ8yGnBbSaMnErQ6A==
X-Received: by 2002:a05:6512:3053:: with SMTP id
 b19mr5441996lfb.338.1603074079944; 
 Sun, 18 Oct 2020 19:21:19 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id o4sm3048145lfg.247.2020.10.18.19.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Oct 2020 19:21:19 -0700 (PDT)
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
Date: Mon, 19 Oct 2020 05:21:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201007171238.1795964-20-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 19 Oct 2020 19:28:29 +0000
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

MDcuMTAuMjAyMCAyMDoxMiwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gK2ludCB0ZWdy
YV9kcm1faW9jdGxfY2hhbm5lbF9tYXAoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgdm9pZCAqZGF0
YSwKPiArCQkJCXN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKPiArewoKSGVsbG8sIE1pa2tvIQoKQ291
bGQgeW91IHBsZWFzZSB0ZWxsIHdoYXQgYXJlIHRoZSBob3N0MXggY2xpZW50cyB0aGF0IGFyZSBn
b2luZyB0byBiZQp1cHN0cmVhbWVkIGFuZCB3aWxsIG5lZWQgdGhpcyBJT0NUTD8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
