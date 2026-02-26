Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKZLLxCNoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B891AD5EE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8C810E9F9;
	Thu, 26 Feb 2026 18:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mYjiUUBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E8C10E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 14:22:10 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2bdc8db07a3so786387eec.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 06:22:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772115729; cv=none;
 d=google.com; s=arc-20240605;
 b=gYXqGY3oivu3Lpu9Gl+/c0arSbsJ1Lyo3obTf2IdqY8AEjDRypl0Hg6noTez8iopji
 eRdx66OE9udh3V5whb8P85l9jrKNrRaw2bKkduEdEIDWpsuUFZIRGPQX5UjQypOKvZVR
 Z6PnVgDxcuwHfsPMglKDi3JOW1o2rvuP1ZX9gS3lZasV4hM/gHSwGfVxWBwzaZBXdm12
 zv2DjBezP15e2KBC+s5KuMxm1ooM/RFuA8mU/1FZgQLwXETpDFUmNd63j24QqFsrFpCX
 cKYUFZu5eMZV8Oe6MZFBe4JdphbGnvivGZHRF7afNDaIr98um2Cim2Sxq+sum9wXzFH5
 LOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2hlesacO2IXzOls7xphFVXkWYV7iYxmey5eNTFKv+p4=;
 fh=+q+bybzCPH+1fC8xE2oQGI4LX/QkdYDpAid+CbO+Evs=;
 b=RfXLh6XXytXIWIYsFzirL4Ie7Uq01aSviCWhSm3TMeYOTvpZSpeLCSFwP1wCIk8lUs
 B9uvjDQvXp4t2cvJiqPKYCcvy8K8qj3jqg13AgNwq7ZMKrVnlJZfRTSZxB7RkxC86gWf
 AwY286ujU7kWNVwN5PlwbAph62ztZmXqbzzMi1Az5f2Q706DMYWhaiZZ5meFYMgn27S+
 Z0k3hKh12vDbS/wRw3L/Wox59dpp1tIHwILkr+w0/lvSAp9Gyo/QiRb1qcDA7mvZSOKq
 h6bd4XbJyC2itabVXVXiJFSvfIjwOVTNiPixAaYafVwuw3+HXr4k6W+HAIdf8+tQNeBP
 TBTw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772115729; x=1772720529; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2hlesacO2IXzOls7xphFVXkWYV7iYxmey5eNTFKv+p4=;
 b=mYjiUUBvlbCMBs8Zal3WVpyPavVMZliyZumsW1+x/sFvejtexXp2KQMPEWFOH1FqKM
 9UHUP+Gqf6++/Ek5yet12WIrJeSjdodfNDMaQXXxVOLq1QWtDOOhSWsuouT016F3dT4a
 1Zj69TLtrn2w/KDRjt6wDZlWX4/+9z56x7GgWI7PyxB1hHmAGLi6JzCq4G36OqWb+OYL
 nxPjCnVKh6qwNGG6bdJbCgGtAiaUCHztRSaMLeESps94QN7U37jWFmuoFdmtUYRJO2eY
 +dL4mI/GDhkE4OfpzwHIeN8Qn91yPs/9ptB7rff+UttLzGnq8ftWfu+cfPi6R/W4HINm
 mNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772115729; x=1772720529;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hlesacO2IXzOls7xphFVXkWYV7iYxmey5eNTFKv+p4=;
 b=itPsDvnOHD3t+EuFQ0fYPyXsn+hjl3uQ0fnoEtL+Gje9coqjocnetUZ+9RnVTCHpRx
 iLTuenXAJxYyzgReQUbn4FsuUs13Ch5QinUXQxwC4T7B9bHwjyrzcwCG4C0VWGivWxXq
 Z+YcuLR240De+smtWa/2+3q2CrqDt8Jvwr/Croq3ov3QRuhAzmER9u5tKtxhyqqmxrzs
 U3iSISjInuGs4mGfgv9riw5hshoX0dNQu4lewkFU3K+j9E8EcGckuyyYoE7mHLjYGzNh
 qIRvL3PJi8nrfK9LX8wa9o7bcc8xxmiXXGIsJ4kYHDX2rgch3khJCRAoMksvUiiZV/zh
 nsZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsqUDwjnn4KLItPn7XgYdvmxMAdYgvCgdb7L62dKYsgfPbSz3Xetr98qFLehy+Cn6JJTmVmlWkuNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4Qpox5h6Hv8Ytou/fsWTz77ANzaOX/squeHOQNNOxjPPLMCfY
 6tZqHonYsYlptr4mOaI+5xqgzZ/DxUQust50Ml62XcFSRg+I9eeyVBphRDLulOUKZond5+ncLHX
 n8RPrQyMriNm6lzg5c1JmuJjx082KG4s=
X-Gm-Gg: ATEYQzx1fTW2sbx+iosuXZaDd3WyzbTARfdd2hmgDfK5J8yEoOZU+wJKEZ/NZF+quxq
 SBfBQtMdBXrSNmxXdj2mAFXjZkFHemkY4Nd5Kd+I12lLvgZNdpD6CtyEATg8CpcnM5EWts49/8x
 KhlVK2rZcqiW2kzK10566qJAE2sPNXgnrJO0CWqxnI6tZW9+lSVKW0C+BECHnJc8G/1Ixfeh3Pu
 S9C0zI0x7pI2H645VsSSRXgGUQW+QMWTFJLrFPD4RtAaFuJ/YgIp6+5nocXlWkutQD/+5jIlTKZ
 AO+vSVI=
X-Received: by 2002:a05:7300:72cd:b0:2bd:d1e0:edbf with SMTP id
 5a478bee46e88-2bdd1e0f061mr1060447eec.15.1772115729246; Thu, 26 Feb 2026
 06:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <20260223-panel-patches-v2-1-1b6ad471d540@gmail.com>
 <20260224-bulky-rabbit-of-courtesy-83fabc@quoll>
 <CAHuF_Zq=Rpg0HoRJv-BSREEhT8tYH4r+BCbZ7obrG36vSmwMQA@mail.gmail.com>
 <54abd390-113a-4c99-b024-2029c4d68099@kernel.org>
 <CAHuF_ZoEAT+91trLabyo8rc8afXW=Wd0Q9yxu_v53nXoRFJMTA@mail.gmail.com>
 <26dc41ef-1a98-4a16-a60d-c7654acba758@kernel.org>
 <de83847a-67b9-4877-a52a-ee1976d68ced@oss.qualcomm.com>
In-Reply-To: <de83847a-67b9-4877-a52a-ee1976d68ced@oss.qualcomm.com>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Thu, 26 Feb 2026 16:21:58 +0200
X-Gm-Features: AaiRm53NJdysK5cQihGYwFMsFJSJchpZpGioTorVxUfiq8Iem_ldmJOfMXkJJC8
Message-ID: <CAHuF_ZqA0cQwbRehBaKxUxfmhtnYTX-xLLMAfEo3E0EN_ABP=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Add Samsung S6E8FCO
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 =?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	HAS_WP_URI(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,wikipedia.org:url,androidfreefile.com:url,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 38B891AD5EE
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 at 15:42, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/26/26 7:55 AM, Krzysztof Kozlowski wrote:
> > On 25/02/2026 21:03, Yedaya Katsman wrote:
> >> On Wed, 25 Feb 2026 at 17:45, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>
> >>> On 25/02/2026 16:29, Yedaya Katsman wrote:
> >>>>>> +  vddio-supply: true
> >>>>>> +  ldo-supply: true
> >>>>>
> >>>>> LDO is the name of the type of regulator. Why is it called as name of
> >>>>> the supply?
> >>>> Can you explain more what you mean? Do you mean to change the name of
> >>>> the property? It seems that all the regulator properties are named
> >>>> foo-supply.
> >>>
> >>> I just have doubts that the device has supplied called LDO, considering
> >>> what LDO means.
> >> OK. I don't really have a way to verify if it's true, all I have is
> >> the downstream dts
> >> which calls it LDO [0]
> >>
> >> [0] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/d3766fc8cda2d96de2850faa9ce58e5a37ea9f9c/arch/arm64/boot/dts/qcom/trinket-sde-display.dtsi#L24-L36
> >
> > Obviously the regulator is LDO, so they called it. Most of the
> > regulators are LDO, so why VDD IN is not called LDO?
> >
> > This is name of the supply in this device.
>
> Yedaya, in case you didn't catch it, LDO is an acronym:
>
> https://en.wikipedia.org/wiki/Low-dropout_regulator
>
> The vendor driver probably calls it that, because the input leg of
> the panel's driver IC just so happens to be connected to a regulator
> of this kind
>
> If we don't know the actual name of that input and have no way to verify
> it, I think 'power-supply' would be a good generic consensus, it happens
> to be reasonably common across other bindings
Thanks for further explaining. I managed to find the schematic (Thanks to
Kamil finding it first and making me look for it)[0]. It seems that
this specifically is
VDDI supply regulator, while the one called iovcc in the dts is
actually a VCI regulator.
The vddio-supply is called VREG_L9_LVS and connects to the output of the vddi
regulator.

My current plan is to call them vddi-supply and vci-supply in the
binding, but I'm not sure
what to call what's currently vddio-supply.

[0] https://androidfreefile.com/wp-content/uploads/Xiaomi_Mi_A3_Schematic.pdf
> Konrad

Thanks, Yedaya
