Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7389AD8B5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 01:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9A010E874;
	Wed, 23 Oct 2024 23:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="tMX4Rfvu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic312-26.consmr.mail.ir2.yahoo.com
 (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB8D10E874
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 23:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1729727577; bh=3M7OH4HoZlKMnnhKf1C/0ZDF12iGNKASzjBaElkoH0k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=tMX4Rfvunh7rn7zLZM5NmdH2IFll4muRpXEp7gqF6C62S0p7y4lsLDXX5tPlvedz+GcynUVVW3090IpcxOdRPh5aLBNOTjEQz6PaBtqLiTCdXgjHTPy0iPohjAaVqCoboPAwmMis7Yq0KG8+oa6wml6Tuas2KEfmZEZPgd7ar0cV9dogPBiLwLk3r78yN9CoKkUVU+BO9wF3gdq+jOhim2M9YNLnQWCz6vSPiv9qtKtWrejR3FPyCpEpT/8a1t77xACjYPy34iqd2fFGyPmOQVwMDJqVXXuI8+7kPwkwmLGNHgSTcGhQsS+nbocejOyKn6PWjpzYwEPTZ2SzIaW7ig==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1729727577; bh=0CpDsy1M70THEKr4JF38Y15+V8F6T7u2+69FLTRTAmR=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=lc/c9++FikamwJxx1Af8LOgIdIPzBCTBE+I1aIqGo0JGOPTp52bFg/KXvhUwGZQq97i06YGEZyqZe5afQf1AWrVUBaxOr6On8S2aNpI1mFnivnACKAeYpu+aGKGD/cbYoyHFT5XVv2yhtLfrzJuYBFwbmJyfiF0CBCl1F+az9OWVny0W2jhYVmlbJNYfloewbTmDEGlSI2NuQR6I4jC/9zVWxj8TO/yJdDqbSOSw7tJ6WxlNltSKbhmmu6Ozbw7jl6HLgL32jTYNGl2+jxxIx0DB649OqdAbCwRlujvxdNURCs2dSB4VbQrXe2csOaj5qsJrihsT3i/t+KE5CnOYDw==
X-YMail-OSG: NvFvbF8VM1k0KAKc96_cF5AJ3ActjRy_v8GV.1f.MINJ0qgX3dMKvxUUpT4upUk
 05u83Dxm7QYbm_Ua8UhHW0s_YkteVb_QwfuUG67DqEfys_0ahY6rjJs6rJoEA.BbK2nqhpaE8sq3
 UxuIBdS9oGiBX0jZoQBftpwrvXYYI994KtkNeYzsO3rUNt0.7rK_VHnJ.O8SADGPxOwkbRYn_aF7
 EWn.XkYakoY8V2gxz4fij2vS.NhXLMwJpIfPQeEgB6cKHfzxWrqsQonCgHA5fCGt7KmvuKDhSEyD
 QhW_XkSV2zPPyk6u4VOnCdXVBuyHubP2nA4a2mKredEEgayR2Q1AElLmS1D796s_0dQecWBKAX5e
 7Fjc0Eefdv1KYVFMwFhObaBBfryghrgDLtpzvkWfmBYKj1c.AFSaEktzCWgahgGTG2mfX8mDOEJ0
 LgL5kofQdJDnTHyAC5fxpKz8DnM4fgGTGbyVmKezlRQVmp3RTJaTGyfLxdZmMM7w6WQO1Hf.GQDg
 LJyQEH5SAPXeEAuYIG3C4Cvq0yoNL7pabmOy5eF_fHwQtlr7mWeXN5KPb0pqlbk7FA5XEacg6sUh
 hcKWe4u_vH0bh3mY_NSvoKTBsMI.6gdbx0CCrktl03fgpTw0uZOOwxDYu3gj0I_At4Ys8hqvD5EB
 M7ChU8apos8inCvYhQlA8l3k24JRhQFYvhKdmGlPLeC1_a9pdAd.hsyludg3ZtIJpIhaVNOSSb2V
 Gb6T1lim20aeo8FYtBuneaa6ku6DZbH3XZrxymfDDWKqdascIMl94r8vmqkfPAyO2OJDd4fYrS97
 3QWeiLgyTIu2KabInqzEKi7Ai5xujYjxHupBfkqFe_Y7Ke.2J.WSkUy2LhtLvI3FMsQJc5Qkx_3p
 Cpd3YDl4Qzp_xwBpAxezsZAFI8Td.tvq3QZyeCYMLazLrKTokV9vlgzUe9vTR_n4ylqdR26Fi6tn
 xf9Q79nmZ8ea1FgHPApIBu1FFpfvs4FRPLQ_rJGipQI5_qRnTGcqLZhmuddMMpUYFQfNCEizpEfW
 3lM_4sJspTPY4iZi4jKBfr874V_9LxyqiUaz3jsAgqlDhegYKOOijAHYvKgq2_VIUSWsfl3OKjGX
 TX5K7V07pBA4Po6TMiEY7lL5xmY6evn3wMMmBEZjxLQSfbxb8ym7o8gFiyTosmZCVs0VUeaYPfYt
 f6nW3ir8MOAesjVzjdG2vOM51.fCM339wRy6i0BppmlfuhKd2e47JOxDD.IZ2oKvqU8ec41KwsLT
 zE0b6KDhqhs9WZf1hq60_5WPqEgMiCv6Oulx2nRaUIL9rmkaH3pEI4RJEzMTyUg6zCNZgaeHKIKA
 bTcYlYSfQcOKlEnuGE0LtKg39uKQLqUZfHVsqKBjd7auq0GZgQeol0vn1GUVI2LcM4_40YfsNpao
 rnjTdvPgBFh4Tdzr99_xFwcL69A191yM.EVqEg3bFN09hyV8fwnB28O2CCT.XvSzjK8PPSpwL5ik
 vHEEkljZwS5wL9f4n3gBdnlhz22Mp7SkXpgtmv5_qnvt74FvSp70eR3.eg2BszMwYSj6qpnQkWc6
 s1BM05nDdEVrQJRwB9nbz..pszUuQEL21n0pAVNR7VF.ubpdfukS4lb1ExqqLO0nK17Ukj9SDZXF
 a9tsD80NStMDoA3rrZrcvpcpq1J5etK9uvrDgmG8I76.HGPwr.PLCxKCsGKIjKOf_WbsmbPUIYd9
 XodwxqJYbgepv.Or.0HrJBRCmwn0Q1W8K5NnRwmxZIy7.sZC9lMAYQ80ZmSAlFEXUPh7u3EaEcQk
 o2c1CoWmXZVdLyxc9aCa_7F4JibkfF.bi.xiEheGRBnIdmlqdT73a0Ah.W6x_1eukPZkPqMVjpsR
 B9ffoBTnqmKmweU6d8PUf0DC2GY73zD8HXn9fIISUre6wxaiQ4ep.d131XuaLQY3Vpyh9WzdHHDB
 BkqwT.i_QAeGcR_filMeOSOHV43hfYkODdZ2TJM.u_KpRd1DY8cTaoWckC3rhduZTuYFISnRkr.E
 XQnXSaEIDS7v5d_StEFwkOtiLxxuuHvcEqCYNV0LPrPKrZ.a.fqVKD1LCjxizLKm1Sv5SOvYhNCp
 GaFrjkxqtKbjDr_Of30GeeZ_tTOAinXHSOk840aJi7yjJLJ9NrMI_BRS20hKEkFI1rTk2ocKD898
 4l3S.al5b6ayqsCr2_33PhpTI7S_AyAs2SwOz3rMxMOjrVThrhgF4RHql4_YalCFYG35xTOX5Sqz
 _7nEMk72ncQukq_5VlB7xhZ2ufOhGTUGWz6PhS9dVM_8KjEeO_61IGEfidmEDiuTnbip.azbSI6Y
 rO12u2kmICa2wLLlVK3d82qQpPmo7ZM1MS35CEPRTiROnCw--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 1aa0b617-1d8a-4930-a090-0cab9e1b224f
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Wed, 23 Oct 2024 23:52:57 +0000
Received: by hermes--production-ir2-c694d79d9-d879w (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 2aed7270ea53ee049cc46986fdcd6d7b; 
 Wed, 23 Oct 2024 23:52:57 +0000 (UTC)
Message-ID: <7025fa62-b178-4ff7-94fd-f7fac0452178@rocketmail.com>
Date: Thu, 24 Oct 2024 01:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: panel: Move flip properties
 to panel-common
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1729630039.git.jahau@rocketmail.com>
 <18a0d8787b5714633a574f2e15f0cec1addddcfc.1729630039.git.jahau@rocketmail.com>
 <yq7usspbou5lj4zz5giw472icd655als7pdik4ito2ziaidkwv@7yrkrgqs462o>
Content-Language: en-US
From: Jakob Hauser <jahau@rocketmail.com>
In-Reply-To: <yq7usspbou5lj4zz5giw472icd655als7pdik4ito2ziaidkwv@7yrkrgqs462o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.22806
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

Hi Krzysztof,

On 23.10.24 09:15, Krzysztof Kozlowski wrote:
> On Tue, Oct 22, 2024 at 11:33:35PM +0200, Jakob Hauser wrote:
>> The flip properties were used by "samsung,s6e8aa0.yaml" only so far. By
>> introducing "samsung,s6e88a0-ams427ap24.yaml" they become more common.
>>
>> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
>> ---
>> Patch is based on current branch drm-misc-next.
>> ---
>>   .../bindings/display/panel/panel-common.yaml           |  8 ++++++++
>>   .../bindings/display/panel/samsung,s6e8aa0.yaml        | 10 ++--------
>>   2 files changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
>> index 0a57a31f4f3d..087415753d60 100644
>> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
>> @@ -51,6 +51,14 @@ properties:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       enum: [0, 90, 180, 270]
>>   
>> +  flip-horizontal:
>> +    description: boolean to flip image horizontally
>> +    type: boolean
>> +
>> +  flip-vertical:
>> +    description: boolean to flip image vertically
>> +    type: boolean
>> +
> 
> I actually wonder how or why would you need to flip the images. I
> understand rotation, but this is mirror flip, right? Is it for some
> transparent displays?

Yes, it's mirror flip. The two cases we have here so far are displays 
for smartphones.

The panel "samsung-s6e88a0-ams427ap24", which this patchset is for, is 
used in device "samsung-serranove" (Samsung Galaxy S4 Mini "Value 
Edition"). By default this panel shows a mirrored picture, it needs flip 
to fix that. I can't think of any good reason and it seems rather 
unique. Maybe there was some mistake during fast-paced development and 
easier to fix that way instead of changing suppliers specification, or 
some purchase related topic, but that's just wild guessing. I 
implemented the flip as an option because I don't know if this driver 
could be extended for similar panels that might not need the flip, e.g. 
older device "samsung-serranolte" (Samsung Galaxy S4 Mini LTE).

For panel "samsung-s6e8aa0" I can't say much because I'm not familiar 
with that. Within the kernel it is used by devices 
"exynos4412-galaxy-s3" (Samsung Galaxy S III) and "exynos4210-trats" 
(don't know what this is). Looking into their devicetree files they 
apply horizontal and vertical flip at once, actually that's a rotation 
by 180 degrees. Looking into the panel driver it seems that this is what 
the hardware interface offers.

> The change is fine, I just really wonder about hardware.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

...

Kind regards,
Jakob
