Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D64D01D5F
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD1D10E6C5;
	Thu,  8 Jan 2026 09:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="bNmYW9mb";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="PBLmol3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD92910E6C5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=Message-ID:Subject:To:From:Date; t=1767864616; bh=+K11+gyj9g6pr1Fpatee6Fb
 hZy6Ep79Tz865ZNh+y2o=; b=bNmYW9mb+hvjiXOEHgfKR388gGi1kaK5ew8+1VFhAz3409D1zl
 Jby0ccPef2RHURAi4zCoDtZ02eNHBuoSxWQhI37IsKXjJHEO6+JyrRXf15Yn2xWsbfV4+LVnpn6
 7SfQ/AOr8NL+j7Aec1JfwKI49sfaTdjKtfAJtidseDG8G5pJqu8F7ZT1twbMbTBsxxxG++PilFc
 qUQco/aw6xKwQN9zFHABPuX5YAKofsgqe1JfCY6R2KmnPkdPTvitRZUZxyYNcM95+aBp5rsm3Tq
 Pt0BLx0R9O1y+IL3qK2sHhK5SZ6wjkdXTBFIbPAMc4Py6DSvRZavArSllhar9NwlNqw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=Message-ID:Subject:To:From:Date; t=1767864616; bh=+K11+gyj9g6pr1Fpatee6Fb
 hZy6Ep79Tz865ZNh+y2o=; b=PBLmol3zo+INqRrInBMw5dF73Z7o/6UOGtR1zM5ijDZ0zRlzzv
 3nMgGEK7kkBXP64oWTCvdMKxtMXFzIQLMzAQ==;
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 10:30:16 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Kiran Gunda
 <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, Luca Weiss
 <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy
 <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, Alejandro Tafalla
 <atafalla@dnyon.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
In-Reply-To: <52778327-69bb-4f6c-8d64-094f33809480@oss.qualcomm.com>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
 <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
 <c7bca43b1b912a6a100d83229d78abde@mainlining.org>
 <52778327-69bb-4f6c-8d64-094f33809480@oss.qualcomm.com>
Message-ID: <1d1601c3b871e67c76e4f3572400b2d7@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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

On 2026-01-08 10:22, Konrad Dybcio wrote:
> On 1/8/26 10:17 AM, barnabas.czeman@mainlining.org wrote:
>> On 2026-01-08 09:54, Konrad Dybcio wrote:
>>> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>>>> Document ovp values supported by wled found in PMI8994.
>>>> 
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> 
>>> I reviewed a version of this that said PMI8950, which is very much
>>> not the same..
>>> 
>>> Let me try and get some more docs to confirm or deny what you're
>>> saying..
>> I have sent it for the previous revision msm-4.4 contains the 
>> documentation.
>> https://lore.kernel.org/all/95f7c89fdf9b856f567a498cc56ecfa5@mainlining.org/T/#u
> 
> Right, but I didn't send any reply acknowledging that.
> 
> On v1, my review tag meant "I concur this is the case for PMI8950"
Yes, sorry. Since they are pretty much same i have considered it is a
minor change i have only changed everything to pmi8994 because it
was introduced before pmi8950 at upstream. I will be more careful next 
time.
> 
> Because you carried it in v2, it appears as if I said "I concur this
> is the case for PMI8994", which is not what I then said.
> 
> Konrad
