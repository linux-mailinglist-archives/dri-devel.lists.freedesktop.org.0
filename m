Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7A9319C42
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 11:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF83C6E570;
	Fri, 12 Feb 2021 10:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522696E570
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 10:03:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id u14so426798wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 02:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6QG81ZJM4e0Z54tok2YgM5IGXnuCS+PLSTvaXCs4Z2g=;
 b=E49ErNQfQ4F7JxhwHQzgTeuC30dIMojbTZRbamSdRwdB3czRTqDszNo7Sn28rJt8uz
 pSHlux1bTy4D8YSk1yTP8mIijFRDhlzYmH2FHRhXwzEYCsl3lb/DVyLWpaQjnD3rifEe
 AcPp6Pv/KAcjhfVAMxvUUaTfgr+4ih/AK6xnkbQewosmXjyliD9D132vlCeyqD0iCIB6
 07Tdh35P84eeMy37RQ39pXsCdHM8NNLteZHW3YplNJwEPGBYAn7fFj1nGDXSmQmW7Wtm
 rVvVYkGhsS7vplIxHyOpOTwh4QmNkwNUokld7BmA+QRJE6qRJc6PYSUmA0+yAENfJZhB
 1+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6QG81ZJM4e0Z54tok2YgM5IGXnuCS+PLSTvaXCs4Z2g=;
 b=XMZR4u0rIEQ6A6KN60irSnZ8lJBQ62Y20wQKY1T/tm0ilqLbU2CKt0QIrMmwZC8Xmo
 8miV0ACNS+auSGAbWuH2Wr8YeXxUxVg/1+cBb8C4FFbza7G6O7YTReM6v3oeWZriKUw1
 2N9BvUTDtO+7JFyFbBvQGh5lKblYZ8pKpGbpGth2nSSUylraT05ieXScg42Qj8V93fz5
 vTapBDznXHn/XtTLT0VocKRuJoYoAmxmBptVmsIEhiJAp+A6oIC/UnN5m8PW4LLI2Jn5
 sV5kP8xVH5GK9TSSOTtibCPWs05a69xciWqybAyc8lVRSlSgXkD51ZnHapj0ycb9Mm3k
 vZ3A==
X-Gm-Message-State: AOAM531coNwjR09oJ8THFSvkWu0KzN5KUWhDpLYjx50gZDyQqO0cqZBG
 xH9N7akxrk5TlSw26ma5B89pfg==
X-Google-Smtp-Source: ABdhPJwSdOB4cVf8xwsazH54/QT4EC/+//VnZHLp3grjPTZFnxNJeQp+4pBdBM3/PFw9nPHrQYh9LQ==
X-Received: by 2002:a1c:6487:: with SMTP id y129mr1865928wmb.106.1613124178877; 
 Fri, 12 Feb 2021 02:02:58 -0800 (PST)
Received: from dell ([91.110.221.187])
 by smtp.gmail.com with ESMTPSA id u14sm9972510wro.10.2021.02.12.02.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 02:02:58 -0800 (PST)
Date: Fri, 12 Feb 2021 10:02:56 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] video: use getter/setter functions
Message-ID: <20210212100256.GB179940@dell>
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwOSBGZWIgMjAyMSwgSnVsaWEgTGF3YWxsIHdyb3RlOgoKPiBVc2UgZ2V0dGVyIGFu
ZCBzZXR0ZXIgZnVuY3Rpb25zLCBmb3IgcGxhdGZvcm1fZGV2aWNlIHN0cnVjdHVyZXMgYW5kIGEK
PiBzcGlfZGV2aWNlIHN0cnVjdHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpYSBMYXdhbGwg
PEp1bGlhLkxhd2FsbEBpbnJpYS5mcj4KPiAKPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcWNvbS13bGVkLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyICst
Cj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvYW1pZmIuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgNCArKy0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvZGE4eHgt
ZmIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNCArKy0tCj4g
IGRyaXZlcnMvdmlkZW8vZmJkZXYvaW14ZmIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgMiArLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBm
Yi9kaXNwbGF5cy9wYW5lbC1sZ3BoaWxpcHMtbGIwMzVxMDIuYyB8ICAgIDYgKysrLS0tCj4gIGRy
aXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy9kcGkuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAgNCArKy0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZi
L2Rzcy9kc2kuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNCArKy0tCj4gIGRyaXZl
cnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy9oZG1pNC5jICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgMiArLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3Mv
aGRtaTUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0KPiAgZHJpdmVycy92aWRl
by9mYmRldi94aWxpbnhmYi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgICAyICstCj4gIDEwIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0
aW9ucygtKQoKSSBmaXhlZC11cCB0aGUgc3ViamVjdCBsaW5lIGFuZCBjb21taXQgbWVzc2FnZSBh
IGJpdCBhbmQgYXBwbGllZC4KClRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2Vu
aW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8
IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
