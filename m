Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB84330A2B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA6A6E83D;
	Mon,  8 Mar 2021 09:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9136E840
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 09:19:37 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso3327590wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 01:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hEOGgoBFFfBcRYu8R+ZFzD5oTYtm/qga63LL53Ov/bU=;
 b=evLEsiqayrflm8/aMCMFF1KGm9tCqy5TgmLozN1pf5OV8v3XOrrOZ7dusez6ueByqx
 QbfNJbn3Tb6TelmwrFWDd4WHxalQui+FvvMLcnchyO2FEC0WH66rXpO7Bg5MqXxBzX+Z
 cc9Pr7PgNkEy1bM1xcbTqIIGCmKoaS4GNgx3Ck/1lpofYRw8U2M/EjDO4iJe0z6SkwP7
 NEfv8QFCktFfq07V+8oK+WYbUu5K7JfqkfwOCUZH8ZfaC1XQzqb4v836tecMta/an5NF
 q1zYSc8uWIE/dnLOv0rAgqCp8RZ+/3Pe/2mlOOfPdm/KIfJDoR0E3DqxqFiDR11IYcOx
 uh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hEOGgoBFFfBcRYu8R+ZFzD5oTYtm/qga63LL53Ov/bU=;
 b=Wtn7L1Y06Ar+7arVYrl7cWwWNLB135vHnT5f7HHBE/ROyIUM5ie/PGg06Rq+iGJA0W
 QlhAHAz+ZDPO7UGhU4qU/RlNhbc6FGgiZqn5upuwoVWCL1S/qXbWEtu/yaG0wTVrVRF8
 m3EcW+kMExHUM7PidwfxzJXl/s+EnwwG609tDyFVk6HsOo/RBeYmDSVU0MLnrJM/1t6e
 zzSGVc2OmoRjSrB1Wgc0AHMc7HakfFFIVqmRZsSZh81qEZlnC+OX1iln8Kl7LzmSCwPk
 umB5OmXQGR6sxC2dw3lprq4LomMDu84FekmvKTyLVYR5Kn7yLye5VQbwin/g070SRMMg
 0TgA==
X-Gm-Message-State: AOAM530IjvOGGKUL3e/LlZhZYdCtytS+0SQmVaSO4Jt7jR81EcvGgI2V
 0rzZPUEe59ojebIt5Ote7liGig==
X-Google-Smtp-Source: ABdhPJySpXzmJ3MCPU31zc4PaUGqi7NmkyvQv0pK/pj0WvYnEHQRAY6VwjmHVQ6JfBzbPkybjDafLg==
X-Received: by 2002:a1c:400b:: with SMTP id n11mr20979920wma.167.1615195176468; 
 Mon, 08 Mar 2021 01:19:36 -0800 (PST)
Received: from dell ([91.110.221.130])
 by smtp.gmail.com with ESMTPSA id i11sm17599389wro.53.2021.03.08.01.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 01:19:35 -0800 (PST)
Date: Mon, 8 Mar 2021 09:19:32 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Roland Scheidegger <sroland@vmware.com>
Subject: Re: [RESEND 00/53] Rid GPU from W=1 warnings
Message-ID: <20210308091932.GB4931@dell>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Jeremy Kolb <jkolb@brandeis.edu>,
 amd-gfx@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 linux-media@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Leo Li <sunpeng.li@amd.com>, linux-arm-msm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Sean Paul <sean@poorly.run>,
 Kuogee Hsieh <khsieh@codeaurora.org>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNSBNYXIgMjAyMSwgUm9sYW5kIFNjaGVpZGVnZ2VyIHdyb3RlOgoKPiBUaGUgdm13
Z2Z4IG9uZXMgbG9vayBhbGwgZ29vZCB0byBtZSwgc28gZm9yCj4gMjMtNTM6IFJldmlld2VkLWJ5
OiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRAdm13YXJlLmNvbT4KPiBUaGF0IHNhaWQsIHRo
ZXkgd2VyZSBhbHJlYWR5IHNpZ25lZCBvZmYgYnkgWmFjaywgc28gbm90IHN1cmUgd2hhdAo+IGhh
cHBlbmVkIGhlcmUuCgpZZXMsIHRoZXkgd2VyZSBhY2NlcHRlZCBhdCBvbmUgcG9pbnQsIHRoZW4g
ZHJvcHBlZCB3aXRob3V0IGEgcmVhc29uLgoKU2luY2UgSSByZWJhc2VkIG9udG8gdGhlIGxhdGVz
dCAtbmV4dCwgSSBoYWQgdG8gcGx1Y2sgdGhlbSBiYWNrIG91dCBvZgphIHByZXZpb3VzIG9uZS4K
Ci0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxv
cGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0g
U29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
