Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDB7A7815B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D6410E637;
	Tue,  1 Apr 2025 17:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=chir.rs header.i=lotte@chir.rs header.b="UdyHWwB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2081 seconds by postgrey-1.36 at gabe;
 Tue, 01 Apr 2025 08:54:14 UTC
Received: from sender2-op-o17.zoho.eu (sender2-op-o17.zoho.eu [136.143.171.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2040710E523
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:54:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743497646; cv=none; d=zohomail.eu; s=zohoarc; 
 b=GkWngAyi+uzuViOiCY6JCGHZUgbWETG/+kT53OAui4q2sT3kKd3Zquz6l17QyJ26vfD28cIUdcfhSJSaikZWOpi/S9ZivrQZmFIMgyx83PTzxfUMwzPHvE4Hf27UXQpEScRCX5pT1r9bKanCXC4c92lLGhzNUjnv1koeXN2p6kA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1743497646;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IKWd7/S8ecvupAPGxLPLAgyuVQEO8m2WiEs8ZQCSIDE=; 
 b=hlU22wub2xiYbovhm07uqMVlsCNEyAoUUPqtQQIot5PjhY3bAwnFMJA0x6JTSLLxGoulyAHbGYTihj7xxJ2bd20r3PTM8AJrEdVK/lh+xLllJoKnwwNTk+6L+FHzzdOx+rTLohy+v8ZgDn3EGeKyZFM2j42/DpVRZfCsaQvI8NQ=
ARC-Authentication-Results: i=1; mx.zohomail.eu; dkim=pass  header.i=chir.rs;
 spf=pass  smtp.mailfrom=lotte@chir.rs;
 dmarc=pass header.from=<lotte@chir.rs>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743497646; 
 s=zmail; d=chir.rs; i=lotte@chir.rs;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=IKWd7/S8ecvupAPGxLPLAgyuVQEO8m2WiEs8ZQCSIDE=;
 b=UdyHWwB1/Sh3ODklYLF2YexzS6g3Vw+lkmkg5iR5lMQq4ou/hgMfChTIWoLlvMCu
 W4REsTLWyOeI41rMYSm/EtUvTg7mDhjUqcI9SI4rhslVEm5FHKXRXP9InJntsKwc4aQ
 dnooQFpJABkCcF3QSpNiisNjhtnKXeZ/h3JQC+aY=
Received: by mx.zoho.eu with SMTPS id 1743497642823882.9940100806688;
 Tue, 1 Apr 2025 10:54:02 +0200 (CEST)
Message-ID: <5c9f59c3-2868-47c2-b2af-b515a8ec9349@chir.rs>
Date: Tue, 1 Apr 2025 09:54:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: display: Add Clockwork CWD686 panel
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, max@maxfierke.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250401081852.283532-1-lotte@chir.rs>
 <20250401081852.283532-3-lotte@chir.rs>
 <abfea9d8-9992-44e6-975e-a18b01753aa5@linaro.org>
Content-Language: en-US
From: =?UTF-8?B?Q2hhcmxvdHRlIPCfpp0gRGVsZcWEa2Vj?= <lotte@chir.rs>
In-Reply-To: <abfea9d8-9992-44e6-975e-a18b01753aa5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Tue, 01 Apr 2025 17:22:19 +0000
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

On 4/1/25 09:34, Krzysztof Kozlowski wrote:
> On 01/04/2025 10:18, Charlotte �leńkec wrote:
>> From: Max Fierke <max@maxfierke.com>
>>
>> The CWD686 is a 6.86" IPS LCD panel used as the primary
>> display in the ClockworkPi DevTerm portable (all cores)
>>
>> Co-authored-by: Charlotte Deleńkec <lotte@chir.rs>
>> Signed-off-by: Charlotte Deleńkec <lotte@chir.rs>
>> Signed-off-by: Max Fierke <max@maxfierke.com>
> 
> That's not a correct chain. If you co-authored, how can you sign off
> before max did?

I missed that requirement in the patch submission guidelines.

> 
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Best regards,
> Krzysztof

Kind regards,
Charlotte
