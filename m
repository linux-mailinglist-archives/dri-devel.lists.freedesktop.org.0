Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA582AA773
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 19:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FEA6E0DC;
	Sat,  7 Nov 2020 18:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222A86E0DC
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Nov 2020 18:41:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id v5so4488334wmh.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Nov 2020 10:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VIFvmjQkWdDW6b37HhMnD+C4qQoz3DcHwcIERG/uILw=;
 b=uUhdDeWrWvg3kBhnJ3Z5YbNUUjnHf8w9qNV7Jplf6JSbdZ7NN9mecduDua0Ypen4LI
 q3RGxZW6lSDcmREgAEbrTek0BAC4ZPw3kSH8EZAB27hPAJ2kDdYvfEODw7qFdIy7DDdd
 PHbbkdyxd+Pu1lLwuRITcSqgd8dC7RL2lwV1XC+4fwKpT6yoXraAQXBmVaAoqOuKuPvK
 FhMbqAoO3BK3KHXAaNJ2ojFcmrUx92pVsgd7G78Bq+YoNIPXIb6aeM4kboMNyhspppIk
 /lv5sxHY+q2QuKUuxjBexspwuSO9Yhqp3S4NzwWjBlsFoRMNMMycqFbGs1V1+OPw8lzb
 80/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VIFvmjQkWdDW6b37HhMnD+C4qQoz3DcHwcIERG/uILw=;
 b=BlRK+RgyYdeqrHcChu6jgo5wdszscrit01pHREcwHbCxKcivfWlZQxadmQn+ZeY1ZD
 +51iD9gQwiXQAX05sI6zl2NfWywmJspOKzpWNcgGnDqdzOB0Hcn/zLOPFThZnu1h4HPw
 baUCPK49V9GqO1x9XDCxTN1EIey5+tsHJfL3FzMGdqk4+UAbrAEBVGq157zmStnVRlwx
 CWC2B94h5xS4BvXjaBJfLQjPgMkTs+H17rz/Lw3rlkWLv2klZsH3BK1MEhbAdtoyDQV2
 l1zQKjdYrCwSVaBnocWOOCUnCjdKSZ2Iw+HHM8VV1xODgI4I6oOjN9jzSCyHf0Yj9lMf
 lbeg==
X-Gm-Message-State: AOAM533l7ljCZkAyYDhJtKMuBMsGLStZFOiiusiD8eWrbDG6HkuYOfQC
 i05XVXFAe0zpmep65JW01ad8sA==
X-Google-Smtp-Source: ABdhPJweZLZnBdauFcGjFjaKCOPZtQ1RPvK4RlU+S0OevZUoKH28NQgQTvj7HEfsbFBzHknvb1VdXQ==
X-Received: by 2002:a7b:c5c3:: with SMTP id n3mr5782826wmk.44.1604774501714;
 Sat, 07 Nov 2020 10:41:41 -0800 (PST)
Received: from dell ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d8sm7061086wmb.11.2020.11.07.10.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 10:41:40 -0800 (PST)
Date: Sat, 7 Nov 2020 18:41:38 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
Message-ID: <20201107184138.GS2063125@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <9d4be6a4-4f39-b908-4086-2b6adb695465@amd.com>
 <20201107173406.GA1030984@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107173406.GA1030984@ravnborg.org>
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
Cc: Faith <faith@valinux.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andy Gross <andy.gross@ti.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Leo Li <sunpeng.li@amd.com>,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 Keith Whitwell <keith@tungstengraphics.com>,
 Jeff Hartmann <jhartmann@valinux.com>, Rob Clark <rob@ti.com>,
 Gareth Hughes <gareth@valinux.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 by <jhartmann@precisioninsight.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAwNyBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBDaHJpc3RpYW4u
Cj4gCj4gPiBJJ20gbm90IHN1cmUgaWYgd2Ugd2FudCB0byBkbyBzb21lIG9mIHRoZSBzdWdnZXN0
ZWQgY2hhbmdlcyB0byByYWRlb24uCj4gCj4gQWxsIHBhdGNoZXMgZm9yIHJhZGVvbiBsb29rcyBn
b29kIHRvIG1lIGV4Y2VwdCAiZHJtL3JhZGVvbi9yYWRlb246IE1vdmUKPiBwcm90b3R5cGUgaW50
byBzaGFyZWQgaGVhZGVyIi4KCldhcyB0aGF0IHRoZSBvbmUgd2hlcmUgdGhlIHByb3RvdHlwZSBu
ZWVkcyBtb3ZpbmcgdG8gcmFkZW9uLmg/Cgo+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cj4gZnJvbSBtZSB0byBoYXZlIHRoZW0gYXBwbGllZCAoZXhjZXB0IHRoZSBz
aGFyZWQgaGVhZGVyIG9uZSkuCgpUaGFua3MgU2FtLgoKPiBJIGNhbiByZXBseSB0byB0aGUgaW5k
aXZpZHVhbCBwYXRjaGVzIGlmIHlvdSBsaWtlLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpT
ZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIg
T3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29r
IHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
