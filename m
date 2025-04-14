Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81ADA88098
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 14:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36CF10E594;
	Mon, 14 Apr 2025 12:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="NNWvRLzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E50310E594
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 12:40:13 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7c560c55bc1so435164085a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 05:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744634412; x=1745239212;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rpIHE//hKP8VhrsONThnQAnp41zdFJC48uql62litoE=;
 b=NNWvRLzhJNtVcHXcZ/vvusVbpHau8te5AdcMCJdf1rcKFcE//wuQehw30br2Vb5oA4
 CVL0lcIp/4EELC4pwuuHENxeeY2CI9LphV/nvQQ7b92RRAiRggPF5HI6HDQuoIi8ABtu
 d411t70E7UQu8hDRs55kiq6rd+JxE7jEzCGQ5R5vkr172PFNKv1HKBC+wRoZ6+JxuYso
 PSYTMwBRk1b0z4m/jjE9jcGA5mC/vlxytNS9EQ27v2vu6HG3+p9r9tRH6/vLEN/BFHgx
 TO2G9a1L+Ht55HaRJ7sOYKolIC8G/jj/BPum79iX/0YyV+LXGIzFlpfTWcjFyEFt2RVW
 bdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744634412; x=1745239212;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rpIHE//hKP8VhrsONThnQAnp41zdFJC48uql62litoE=;
 b=G/UFk+Kv5uztswJPdB7WhblNfGpkUyFo1P0BOgPMzVHi+W7w3Zh1Zz51eSUJT7zrE/
 C7czg+HxkPKsPsI47fKKAHA8VJ1aY3usKvjcNiUue3kuS27RBAdIFUQnIBV+8cSQOoZR
 wghhtgZKnvrPtL6dmL8ZPIzdqDnQyGSvrnD5mUOc3NvhhEzaiFUzlJpGXZEAyn/dCF4T
 AKDvflR6he8KcwXr0rUcsdbiBHkA8MkLLespSKvjfwNMJ7wI9dIuysnEVKDWtnJQFNj0
 SIg8uPuPZt1bLBTgfjtF57JUnGUVrf14QQrQgCTHxMMR5qpd6r4id2HtP1dJu/tyPr+W
 fhjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBspDujzTcTozx3r3w+fTsbHChZJx47Tk+aUoRIT3VEXOYnijSHP8eb1IAMKVH41FGf5Nm8ExSI/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHzymdCgG1E5rPDDI2WlrXSW3sN21JJMr+VNAh6xALNmpymrKN
 499wM4Tv/zaahZwIwQ0rtPvsemS1wWI7ItO7ft5QA6/JAtGOuMpvDdHkw54Nkrs=
X-Gm-Gg: ASbGncvWfHPp/8zYTUjdcCJMYbAakWPbuUxbHBWenKl4c/0BIparUClliLRDx/K7bcc
 SvGXd3L8ej3IEekjBrSteA5P/2fmNgHCRa1hoF7PpiASIJ7ayxlvdB3y59QsLLgmLA4nwzuM3xu
 /WdhKx2KS+6q0DCd+uM8yJmVK3Jhq8iK372H34005WRfFFkTZ3LYzJ9rpx6Y56hFnbjtMqH4aX5
 kx4rVLP+G3d9Mm7BkjEidK1A/l1bHYCwsglN2Wh/uod214IQ4qoM+a/1+BZfyKoovQ+nw1K2P7H
 czKoL0f5/WEK4zMPzzPodL4ZzsyvMUpjN3OWrGlaH6L4UQ==
X-Google-Smtp-Source: AGHT+IEkbFkFwojQpGraee89v+X8dSxjfxKK65sER14n9Mv9RQD0FEdieKFkmsXCfg907A7TCfC9Lw==
X-Received: by 2002:ad4:5763:0:b0:6e8:fe16:4d44 with SMTP id
 6a1803df08f44-6f23f180df4mr213244336d6.31.1744634411886; 
 Mon, 14 Apr 2025 05:40:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f0dea08007sm82522326d6.86.2025.04.14.05.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 05:40:11 -0700 (PDT)
Message-ID: <a43b8d8f51577fdf579f1bd602eadfdafcd21c08.camel@ndufresne.ca>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles
 for MT8188 MDP3
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mchehab@kernel.org, 	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, 	sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
Date: Mon, 14 Apr 2025 08:40:09 -0400
In-Reply-To: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
 <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWVyY3JlZGkgMTggZMOpY2VtYnJlIDIwMjQgw6AgMTE6NTMgKzAxMDAsIEFuZ2Vsb0dpb2Fj
Y2hpbm8gRGVsIFJlZ25vIGEgw6ljcml0wqA6Cj4gQWRkIGNvbXBhdGlibGUgc3RyaW5ncyBmb3Ig
dGhlIEFBTCwgQ09MT1IsIE1FUkdFIGFuZCBQQURESU5HCj4gaGFyZHdhcmUgY29tcG9uZW50cyBm
b3VuZCBpbiBNZWRpYVRlaydzIE1UODE4OCBTb0MuCj4gCj4gVGhpcyBoYXJkd2FyZSBpcyBjb21w
YXRpYmxlIHdpdGggTVQ4MTk1Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgpBY2tl
ZC1ieTogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPgoK
PiAtLS0KPiDCoC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGFhbC55YW1s
wqDCoMKgwqDCoMKgwqAgfMKgIDQgKysrKwo+IMKgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssY29sb3IueWFtbMKgwqDCoMKgwqAgfMKgIDQgKysrKwo+IMKgLi4uL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbMKgwqDCoMKgwqAgfMKgIDQg
KysrKwo+IMKgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55
YW1swqDCoMKgIHwgMTAgKysrKysrKy0tLQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxhYWwueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGFhbC55YW1sCj4gaW5kZXggY2YyNDQzNDg1NGZmLi4xNDc5MDM1ZGE0MDkgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssYWFsLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxhYWwueWFtbAo+IEBAIC0yNSw2ICsyNSwxMCBAQCBw
cm9wZXJ0aWVzOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVkaWF0ZWssbXQ4MTczLWRpc3At
YWFsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxODMtZGlzcC1hYWwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE5NS1tZHAzLWFhbAo+ICvCoMKgwqDC
oMKgIC0gaXRlbXM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gbWVkaWF0ZWssbXQ4MTg4LW1kcDMtYWFsCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtbWRwMy1hYWwKPiDCoMKgwqDCoMKgwqAg
LSBpdGVtczoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10MjcxMi1kaXNwLWFhbAo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxjb2xvci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssY29sb3IueWFtbAo+IGluZGV4IDdkZjc4NmJiYWQyMC4uNzk5YzBi
OGZjMWY5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGNvbG9yLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxjb2xvci55YW1s
Cj4gQEAgLTI3LDYgKzI3LDEwIEBAIHByb3BlcnRpZXM6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LSBtZWRpYXRlayxtdDgxNjctZGlzcC1jb2xvcgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVk
aWF0ZWssbXQ4MTczLWRpc3AtY29sb3IKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVr
LG10ODE5NS1tZHAzLWNvbG9yCj4gK8KgwqDCoMKgwqAgLSBpdGVtczoKPiArwqDCoMKgwqDCoMKg
wqDCoMKgIC0gZW51bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtZWRpYXRlayxt
dDgxODgtbWRwMy1jb2xvcgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogbWVkaWF0ZWss
bXQ4MTk1LW1kcDMtY29sb3IKPiDCoMKgwqDCoMKgwqAgLSBpdGVtczoKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIGVudW06Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVr
LG10NzYyMy1kaXNwLWNvbG9yCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJn
ZS55YW1sCj4gaW5kZXggZGFlODM5Mjc5OTUwLi40MTVhMjViYzE4ZmEgMTAwNjQ0Cj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssbWVyZ2UueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwKPiBAQCAtMjUsNiArMjUsMTAgQEAg
cHJvcGVydGllczoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE3My1kaXNw
LW1lcmdlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxOTUtZGlzcC1tZXJn
ZQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVkaWF0ZWssbXQ4MTk1LW1kcDMtbWVyZ2UKPiAr
wqDCoMKgwqDCoCAtIGl0ZW1zOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE4OC1tZHAzLW1lcmdlCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtbWRwMy1tZXJnZQo+IMKg
wqDCoMKgwqDCoCAtIGl0ZW1zOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IG1lZGlh
dGVrLG10Njc5NS1kaXNwLW1lcmdlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogbWVk
aWF0ZWssbXQ4MTczLWRpc3AtbWVyZ2UKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWsscGFkZGluZy55YW1sCj4gaW5kZXggYmUwN2JiZGM1NGUzLi44Njc4Nzg2NmNlZDAgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sCj4gQEAgLTIw
LDkgKzIwLDEzIEBAIGRlc2NyaXB0aW9uOgo+IMKgCj4gwqBwcm9wZXJ0aWVzOgo+IMKgwqAgY29t
cGF0aWJsZToKPiAtwqDCoMKgIGVudW06Cj4gLcKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxODgt
ZGlzcC1wYWRkaW5nCj4gLcKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxOTUtbWRwMy1wYWRkaW5n
Cj4gK8KgwqDCoCBvbmVPZjoKPiArwqDCoMKgwqDCoCAtIGVudW06Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoCAtIG1lZGlhdGVrLG10ODE4OC1kaXNwLXBhZGRpbmcKPiArwqDCoMKgwqDCoMKgwqDCoMKg
IC0gbWVkaWF0ZWssbXQ4MTk1LW1kcDMtcGFkZGluZwo+ICvCoMKgwqDCoMKgIC0gaXRlbXM6Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODgtbWRwMy1wYWRkaW5n
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtbWRwMy1wYWRk
aW5nCj4gwqAKPiDCoMKgIHJlZzoKPiDCoMKgwqDCoCBtYXhJdGVtczogMQo=

