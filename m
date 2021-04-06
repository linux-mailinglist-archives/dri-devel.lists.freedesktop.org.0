Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB78B354F22
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 10:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E1B6E5CF;
	Tue,  6 Apr 2021 08:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3547D6E5CF
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 08:56:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id f6so7222184wrv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Apr 2021 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=k0R/CpFQIO0LutUTt6whAWYDSEEYWanyJgecDTp2qS4=;
 b=OUtsvTywwF0/bDjP4cBmo4dT9qHLCQLOTKohdrUdMDdMtVgNZ88XIn0SLwDK4A4/qG
 EwEU/kFbpjoldb1LlsU7Sqe+FySEhPAaMbHfWEcGqojHKt4e7wg+lkYfX7k+1mdJfOVx
 AjbNMxpoKsRjSZwo0SNnNf4pUy1J3mi5/xwF4b9nJ8LW3P74wuWx4TkCXBTstUnV4lA7
 s0BPsgsPGkujSf2teVKDJ6yAKtQsmGArOMiabQxqM/i+PjKovEJjU6RlXGqdh4zTEWgS
 VM+UO6/Fxg6nQHnz7gGc/T35KZHHmhVOm5MYpNnNbtSejPeRXePMPVHTzDl4t2JCGmVy
 HLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=k0R/CpFQIO0LutUTt6whAWYDSEEYWanyJgecDTp2qS4=;
 b=IBMt+ER5ZpAVkrY9IezaoHcKF1Zgvj/+cEAn9ZnrwwY+51y2cLQ13G+zhwYehfd/P9
 21pumTmD/xXgQgb6VzXDActBUtSGUXWw65AHvjUzLRieOjJ065mfiXQiPzbk9nxQJx+l
 K8J+YTIzF1yuO7mNsuXC1VjliS/8yAVlhFzqievQ9Qqr0VoEoRntq2eg1GO2Im5twRSK
 iZAl7NaGoIEQ0STIAIPJkj2efX+ru4nu3ySfwvD4i7AwjIK+/mRf+DMVCVlUqvTSgtqO
 rjQEETn5gGReWNkchKM197EwOIsSNKeHH+mMZk8o7834D+if6o3M8itc2+2M/sBFjO35
 OXuQ==
X-Gm-Message-State: AOAM532HF1HblsI4buXAsdZ8vI2jcPEqqhdIwAZsozrQJHoi/Ud2QLKr
 ApA8jOOK5r9aAwfeftSMdnEIaA==
X-Google-Smtp-Source: ABdhPJy5liwwM3Ot+2W70tIkjSPkDW++gyVE8uJhSgWpBItS06FaUlff1OXTLSFd9M921fWjlzp4KQ==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr33668042wrx.236.1617699367868; 
 Tue, 06 Apr 2021 01:56:07 -0700 (PDT)
Received: from dell ([91.110.221.193])
 by smtp.gmail.com with ESMTPSA id u12sm5987318wro.51.2021.04.06.01.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:56:07 -0700 (PDT)
Date: Tue, 6 Apr 2021 09:56:05 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Anssi Hannula <anssi.hannula@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Drubin <daniel.drubin@intel.com>,
 Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
 dri-devel@lists.freedesktop.org, Henrik Rydberg <rydberg@bitmath.org>,
 Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
 Lopez Casado <nlopezcasad@logitech.com>,
 "L. Vinyard, Jr" <rvinyard@cs.nmsu.edu>,
 Masaki Ota <masaki.ota@jp.alps.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 message to <vojtech@ucw.cz>, Michael Haboustak <mike-@cinci.rr.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 Vojtech Pavlik <vojtech@suse.cz>, Zhang Lixu <lixu.zhang@intel.com>
Subject: Re: [RESEND 00/25] Rid W=1 warnings from HID
Message-ID: <20210406085605.GS2916463@dell>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBNYXIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBUaGlzIHNldCBpcyBwYXJ0
IG9mIGEgbGFyZ2VyIGVmZm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MQo+IGtlcm5lbCBi
dWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4g
bmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiAKPiBMZWUgSm9uZXMgKDI1KToKPiAgIEhJRDogaW50
ZWwtaXNoLWhpZDogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAnZXJyJwo+ICAgSElEOiBpc2h0cC1o
aWQtY2xpZW50OiBNb3ZlIHZhcmlhYmxlIHRvIHdoZXJlIGl0J3MgYWN0dWFsbHkgdXNlZAo+ICAg
SElEOiBpbnRlbC1pc2gtaGlkOiBwY2ktaXNoOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdyZXQn
Cj4gICBISUQ6IGludGVsLWlzaDogU3VwcGx5IHNvbWUgbWlzc2luZyBwYXJhbSBkZXNjcmlwdGlv
bnMKPiAgIEhJRDogaW50ZWwtaXNoOiBGaXggYSBuYW1pbmcgZGlzcGFyaXR5IGFuZCBhIGZvcm1h
dHRpbmcgZXJyb3IKPiAgIEhJRDogdXNiaGlkOiBSZXBhaXIgYSBmb3JtYXR0aW5nIGlzc3VlIGlu
IGEgc3RydWN0IGRlc2NyaXB0aW9uCj4gICBISUQ6IGludGVsLWlzaC1oaWQ6IEZpeCBhIGxpdHRs
ZSBkb2Mtcm90Cj4gICBISUQ6IHVzYmhpZDogaGlkLXBpZGZmOiBEZW1vdGUgYSBjb3VwbGUga2Vy
bmVsLWRvYyBhYnVzZXMKPiAgIEhJRDogaGlkLWFscHM6IENvcnJlY3Qgc3RydWN0IG1pc25hbWlu
Zwo+ICAgSElEOiBpbnRlbC1pc2gtaGlkOiBGaXggcG90ZW50aWFsIGNvcHkvcGFzdGUgZXJyb3IK
PiAgIEhJRDogaGlkLWNvcmU6IEZpeCBpbmNvcnJlY3QgZnVuY3Rpb24gbmFtZSBpbiBoZWFkZXIK
PiAgIEhJRDogaW50ZWwtaXNoLWhpZDogaXBjOiBDb3JyZWN0IGZ3X3Jlc2V0X3dvcmtfZm4oKSBm
dW5jdGlvbiBuYW1lIGluCj4gICAgIGhlYWRlcgo+ICAgSElEOiBpc2h0cC1oaWQtY2xpZW50OiBG
aXggaW5jb3JyZWN0IGZ1bmN0aW9uIG5hbWUgcmVwb3J0X2JhZF9wYWNrZXQoKQo+ICAgSElEOiBo
aWQta3llOiBGaXggaW5jb3JyZWN0IGZ1bmN0aW9uIG5hbWUgZm9yIGt5ZV90YWJsZXRfZW5hYmxl
KCkKPiAgIEhJRDogaGlkLXBpY29sY2RfY29yZTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmV0
Jwo+ICAgSElEOiBoaWQtbG9naXRlY2gtaGlkcHA6IEZpeCBjb25mb3JtYW50IGtlcm5lbC1kb2Mg
aGVhZGVyIGFuZCBkZW1vdGUKPiAgICAgYWJ1c2VzCj4gICBISUQ6IGhpZC11Y2xvZ2ljLXJkZXNj
OiBLZXJuZWwtZG9jIGlzIGZvciBmdW5jdGlvbnMgYW5kIHN0cnVjdHMKPiAgIEhJRDogaGlkLXRo
cnVzdG1hc3RlcjogRGVtb3RlIGEgYnVuY2ggb2Yga2VybmVsLWRvYyBhYnVzZXMKPiAgIEhJRDog
aGlkLXVjbG9naWMtcGFyYW1zOiBFbnN1cmUgZnVuY3Rpb24gbmFtZXMgYXJlIHByZXNlbnQgYW5k
IGNvcnJlY3QKPiAgICAgaW4ga2VybmVsLWRvYyBoZWFkZXJzCj4gICBISUQ6IGhpZC1zZW5zb3It
Y3VzdG9tOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdyZXQnCj4gICBISUQ6IHdhY29tX3N5czog
RGVtb3RlIGtlcm5lbC1kb2MgYWJ1c2UKPiAgIEhJRDogaGlkLXNlbnNvci1odWI6IFJlbW92ZSB1
bnVzZWQgc3RydWN0IG1lbWJlciAncXVpcmtzJwo+ICAgSElEOiBoaWQtc2Vuc29yLWh1YjogTW92
ZSAnaHNkZXYnIGRlc2NyaXB0aW9uIHRvIGNvcnJlY3Qgc3RydWN0Cj4gICAgIGRlZmluaXRpb24K
PiAgIEhJRDogaW50ZWwtaXNoLWhpZDogaXNodHAtZnctbG9hZGVyOiBGaXggYSBidW5jaCBvZiBm
b3JtYXR0aW5nIGlzc3Vlcwo+ICAgSElEOiBpc2h0cC1oaWQtY2xpZW50OiBGaXggJ3N1Z2dlc3Qt
YXR0cmlidXRlPWZvcm1hdCcgY29tcGlsZXIgd2FybmluZwoKVGhlc2UgaGF2ZSBiZWVuIG9uIHRo
ZSBsaXN0IGZvciBhIGNvdXBsZSBvZiB3ZWVrcyBub3cuCgpJcyB0aGVyZSBhbnl0aGluZyBJIGNh
biBkbyB0byBoZWxwIGV4cGVkaXRlIHRoZWlyIG1lcmdlPwoKSSdtIGNvbmNlcm5lZCBzaW5jZSAt
cmM2IGhhcyBqdXN0IGJlZW4gcmVsZWFzZWQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNl
bmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sg
fCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
