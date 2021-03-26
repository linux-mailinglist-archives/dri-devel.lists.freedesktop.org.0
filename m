Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA9B34A992
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7233C6E1E9;
	Fri, 26 Mar 2021 14:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B5C6E1E9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:22:21 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j9so4097024wrx.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jPrss6MgeIvEfu+cUNSjrJCOpcljezeh6+dDf7NPDa0=;
 b=NjVCbBdVhpCtF7cQoLz45keDeqicZaSTkXDP951der0x2QQYIp9fHHev6kcunhfpz6
 bUdkTdaiPd2oW5CwM83DHOv6FmDQCUbkZxXVzeOz3Qrd/FjNADrDk6oRM7POjoYXOPTT
 x7PNhS1oVP1P3xCW6vYeVjOCO7CA7bbiNY9Ik38D3mcwW9SCYHoqci7628F8tm57vSmm
 VO+NUhBWAh9mib0vaqb2FCXCjHfWhxHX0b8FhNx8eIMBdoF78kQ7/f3pD2QO8ovWqMwx
 uAAUplq3CihgzTk3bAjsK6w9XUzDrtieZd7xiYqxupACowD34HMzX3HWc0fo9RnjanJc
 elYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jPrss6MgeIvEfu+cUNSjrJCOpcljezeh6+dDf7NPDa0=;
 b=mWYhmNPFtOhSCp++xvaB/24ROZD5wulqWTOO3WfY3/hOg6N2QCPlmauWkoecO5psyq
 EHjcQQ20U1jhPlg72u/gSgmu/soB11Du6jDciS6nqMg48diwQt4xMuQVH+qyOkNf3Dp+
 QgBhG9DN22A30rrBq3LDcpc5zIZzQsZUg5Wun0VblX3jOcVYmMoDCL/uVxbwkMSKY2Tm
 dXxuwGn8A1+i4B6QEMglhUGvnw3ugglyRPOHbmzTExTkZZufOBzK1Hue+AuElO+kXqpF
 FYG87GWKa5omAHehz3XVn93EHdVWTlgVrRvw/PkpVw2r0k1maAaqyyUqIGEYkFT46/ym
 ZbgQ==
X-Gm-Message-State: AOAM532FlAfD+LxclaWEd8mD75qRGxMFVRF1nomaSaNML2ZOJkGmPYA3
 21/8GMiQwUpcCGAGrtBpblz4eQ==
X-Google-Smtp-Source: ABdhPJwZ8BOpa2TGeYwtefzDJ+tZQkFdJIoEeZ72w1wchMYOQ50a7VJGaZoN4pp7Dmug5Uv1b+VT2A==
X-Received: by 2002:adf:d207:: with SMTP id j7mr14783922wrh.150.1616768540289; 
 Fri, 26 Mar 2021 07:22:20 -0700 (PDT)
Received: from dell ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id f16sm12744884wrt.21.2021.03.26.07.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:22:19 -0700 (PDT)
Date: Fri, 26 Mar 2021 14:22:17 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 00/25] Rid W=1 warnings from HID
Message-ID: <20210326142217.GA2916463@dell>
References: <20210324173404.66340-1-lee.jones@linaro.org>
 <20210326114202.3862b8c5@jic23-huawei>
 <20210326142041.GZ2916463@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326142041.GZ2916463@dell>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Zhang Lixu <lixu.zhang@intel.com>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Anssi Hannula <anssi.hannula@gmail.com>,
 Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Henrik Rydberg <rydberg@bitmath.org>,
 Lopez Casado <nlopezcasad@logitech.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Masaki Ota <masaki.ota@jp.alps.com>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Vojtech Pavlik <vojtech@suse.cz>, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 message to <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>, "L. Vinyard,
 Jr" <rvinyard@cs.nmsu.edu>, linaro-mm-sig@lists.linaro.org,
 Michael Haboustak <mike-@cinci.rr.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Drubin <daniel.drubin@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBNYXIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBGcmksIDI2IE1hciAy
MDIxLCBKb25hdGhhbiBDYW1lcm9uIHdyb3RlOgo+IAo+ID4gT24gV2VkLCAyNCBNYXIgMjAyMSAx
NzozMzozOSArMDAwMAo+ID4gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGU6
Cj4gPiAKPiA+ID4gVGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGlu
ZyB0byBjbGVhbi11cCBXPTEKPiA+ID4ga2VybmVsIGJ1aWxkcywgd2hpY2ggYXJlIGN1cnJlbnRs
eSBvdmVyd2hlbG1pbmdseSByaWRkbGVkIHdpdGgKPiA+ID4gbmlnZ2x5IGxpdHRsZSB3YXJuaW5n
cy4KPiA+IAo+ID4gTGVlLCBpdCdzIGEgYml0IG5vdmVsIHRvIGNjIGxpbnV4LWlpbyBvbiB0aGUg
Y292ZXIgbGV0dGVyIGJ1dAo+ID4gbm9uZSBvZiB0aGUgYWN0dWFsIHBhdGNoZXMuLiAgT3IgbGVh
c3Qgbm9uZSBvZiB0aGVtIHJlYWNoZWQKPiA+IG1lIG9yIGxvcmUua2VybmVsLm9yZwo+IAo+IExv
b2tzIGxpa2Ugb25seSAxOCBvZiB0aGUgMjUgYWN0dWFsbHkgbWFkZSBpdCBvbnRvIHRoZSBsaXN0
Lgo+IAo+IEhvdyBvZGQhCgpPdWNoISAgVGhhdCdzIHdoeSB0aGVuOgoKICA0LjMuMCBUZW1wb3Jh
cnkgU3lzdGVtIFByb2JsZW0uICBUcnkgYWdhaW4gbGF0ZXIgKDEwKS4gcDE5c20xNDY2MzY3ZWRy
LjU3IC0gZ3NtdHAKCj4gSG9sZCBvbiwgSSdsbCBzdWJtaXQgYSBbUkVTRU5EXS4KPiAKPiA+IEkn
bSBzdXJlIHRoZXkgYXJlIGdyZWF0IDopCj4gCj4gTmF0dXJhbGx5IQo+IAoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMK
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBM
aW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
