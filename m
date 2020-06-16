Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE281FC759
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2456EAD5;
	Wed, 17 Jun 2020 07:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2C36E8AB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 12:00:52 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 9so23204610ljc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 05:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QSDz1CcTlXHevMdT17dfagrIIYP8BvIZ7bez+W8TR/I=;
 b=oVXqvcoYIkCXNR7wL6n3vOVqa4vsvz555GXgN3SvQbk++DqCfyY3ihS6C44FTj/1l6
 oxmN6rQSl/0N9Rs3GD1cLcFTRNOKZVrFi+4MTLxT4A2/TIruex3OouFYhG8DGyT0KOei
 Egd1CQ9keFWRBVCIckvgZJkqKf+CloQ3UDJ82KcY8QsjVL5gnReCpUBL/e/CbpjQs1IB
 8i7oNBfAdR0pwujcU3YFsnbfNvsFqW8GB4um9FicmqKBkBg+cjmgG00mhPHH06pjiOMn
 Yh7v9I+PaSONtPPasNP/XArF6pxddi6OvJDr7wTny6RMQ7M6/XNYqeMBP+Vd+B4k5NLy
 MlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QSDz1CcTlXHevMdT17dfagrIIYP8BvIZ7bez+W8TR/I=;
 b=e9Axvfhr9ibU/GMwADpdwlJN6SfluLuJxVNB9bC/INxnNmh4rjUb6OxACoK4CRs9Cx
 HsTUG9IWThQeuGbqeIhYUwHDdwKznYKXUC/ypkkwk1h16u1ftdD9RG/PpYCM6pwP8vZT
 9p1JQgh5LbMBRsftx58SLFGxuDatBtdaPHPjJ0GQBg119gUBO1y5p7HOtJrC3Z8tS3d1
 +tzotj+8Rfn6lK76DFx4GA2edKZgAB1Uh1/xgtQnZ1UZG4sX+5WGXDulAeNWCWSDdf/Y
 jolUv5QYblnUh/lxhD9d3esw3jPCAXSd+4Qhby7bU1xT8uYJrsgRk41xer4h/w1v2GDp
 tKhg==
X-Gm-Message-State: AOAM5308Ae0O0p4rscGl6eWRz2NHqZ15R1B7d2BRyQHQXpqcwqmy8mtR
 RHUGXsDmKGcsacqhbaDpGiPfY1zH
X-Google-Smtp-Source: ABdhPJwuQbHaMDqXb3iB07dLDs9sxQLsnHPublzf3ks7pGsQG6s9Bp48XpLM+JQKBc+w1SQqlJh7Iw==
X-Received: by 2002:a2e:98d4:: with SMTP id s20mr1343979ljj.83.1592308850862; 
 Tue, 16 Jun 2020 05:00:50 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id i22sm4343234ljb.21.2020.06.16.05.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 05:00:50 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] 180 degrees rotation support for NVIDIA Tegra DRM
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com>
 <CACvgo51QuXMgWhFk4C=3rGvUZDX1_W0RZtVb5RtRPiHTpMebWQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e6b50ec8-08f9-a15e-6aa5-2ca306613e97@gmail.com>
Date: Tue, 16 Jun 2020 15:00:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACvgo51QuXMgWhFk4C=3rGvUZDX1_W0RZtVb5RtRPiHTpMebWQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Derek Basehore <dbasehore@chromium.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDYuMjAyMCAwMToyNiwgRW1pbCBWZWxpa292INC/0LjRiNC10YI6Ci4uLgo+IEFsdGhvdWdo
IEkgc2VlIHRoYXQgdGhpcyBzZXJpZXMsIGFsaWtlIERlcmVrJ3MsIGhhcyBhIGNvdXBsZSBvZiBp
c3N1ZXM6Cj4gIC0gb25seSBhIHNpbmdsZSBwYW5lbCBkcml2ZXIgaXMgdXBkYXRlZAoKSSdsbCBz
ZXBhcmF0ZSB0aGlzIHNlcmllcyBpbnRvIHR3byBwYXRjaHNldHMuCgpPbmUgd2lsbCBhZGQgb3Jp
ZW50YXRpb24gc3VwcG9ydCB0byB0aGUgcGFuZWwgZHJpdmVycyBhbmQgSSdsbCBpbmNsdWRlCnRo
ZSBEZXJlaydzIHR2MTAxd3VtLW5sNiBwYXRjaCwgc28gaXQgd2lsbCBiZSB0d28gcGFuZWwgZHJp
dmVycyBcby8gOikKClRoZSBvdGhlciB3aWxsIGFkZCByZWZsZWN0aW9uLXggc3VwcG9ydCB0byB0
aGUgVGVncmEgZHJpdmVyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
