Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F62C2A63E
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F20F10E168;
	Mon,  3 Nov 2025 07:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="gBJEdJfL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazolkn19011039.outbound.protection.outlook.com
 [52.103.39.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A62510E168
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 07:45:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5HbTQYUmXEiqistNMPz7JszXT/qj2DfiRfbZp48ODRs9QT2N3bT/L4b7Nm/7T2hktiVLtEHayNMFunSV68smcUooAUzKWIo+mnxc5GUsCFKWdQ+uwsAy/10bXdKchmvJC72NvAuH1PGtZF773GtnPbS/K8ALarYlxch+gaIKYsLOjQbOPzKf1YkbsCHb2LuHRi3nTKJ3FyrWPflOty7pNU6uxwBPkHl0wGbX0sWmdvCRm/2Yh8xcm5qcqNUQZ88c9YVr7IJsXYNaYopEsLTaCg+6BoBwuR7pbaT0Tn3Pa5tYe6ukPqOCsCqhzSiJs+1F1hvKAMIjRI0GBuO5CTzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g64WcQ994YQ+l9yY7ZveWIOBkaWRnxOIqt+IjxvQH5o=;
 b=T7VJIlkDJXJhE7p6OrXlDZa8jcJBbO1+NYgLjZN+jZRSNYzEniSByTo0AmmJteoTeHIZo/DOtDIkR72ZjigimOcOOwNEZ/UjxBAegqOVlEG6A8gN6AT098ZQNEsnhQZHPcrP7cHO3jwPB1O0ccXYg8gyA9d+vEADGhXR09EfpBi64xBZ3y+WnFCEcYqQipqYyp6Kjyg3Te4nzLdUcb7CQv5R+WIUYrOH+X5N9u/ICygoLqG/yix1JrDp5mnTsN/hL+YNG7XjgtXLg1SEFwW9z+wuMTgYmOqTqQhdj5RNbrh80b14ELG2C7vR4IkkLccxl92L8yZtBm9r+hbpylCKvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g64WcQ994YQ+l9yY7ZveWIOBkaWRnxOIqt+IjxvQH5o=;
 b=gBJEdJfLdWAK3u2orQ0UrJN8B+LVlCOhYn4ZcPkivu6vnEo0Bcfy9+4nwCP7fixWbRIk/xxtx8jA/0Jt+Ve5A0Ki30OgNfYNC2kbNr2lswYSnrvLxyyPGBr1I6fz/Ws85CRiU7y77XtuME7Qs7oMP5cj4l28Nq+zRFW6KcLU3B0TEy25iov+y2zhhs6gIFbIuDEjbE6aD//RfgSO3OKG0hoYU+77C7VVcLZj6ScP+QJEla7i2mn6W1KK3zhYq8zjBTJFymR7urKHaf6q/XxM+ARHzkMEHcbgL4W+dA3XP8AARDykIs555BlAoCHqExTWqdHTBRaFX5b0OkqsAzcvbQ==
Received: from PR3P189MB1020.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e::16)
 by AM6P189MB3108.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:45:53 +0000
Received: from PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
 ([fe80::89e2:ab64:8c13:9c68]) by PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
 ([fe80::89e2:ab64:8c13:9c68%7]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 07:45:53 +0000
Message-ID: <PR3P189MB102045B9DE6360D9DEF1C73BE3C7A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
Date: Mon, 3 Nov 2025 08:45:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: x1e80100-vivobook-s15: enable
 ps8830 retimers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
 <20251101-asus_usbc_dp-v1-3-9fd4eb9935e8@hotmail.com>
 <vijkpvomiv3nonumyqoeut2k3ajftf7cafx56ngjlc3uuwqfcb@7o75sm3kh36d>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <vijkpvomiv3nonumyqoeut2k3ajftf7cafx56ngjlc3uuwqfcb@7o75sm3kh36d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::20) To PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4e::16)
X-Microsoft-Original-Message-ID: <714f372f-e150-42a5-8d3f-7bd3a8a746e0@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P189MB1020:EE_|AM6P189MB3108:EE_
X-MS-Office365-Filtering-Correlation-Id: 5288a373-d8f3-4b91-407f-08de1aad035d
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799015|19110799012|15080799012|23021999003|5072599009|6090799003|461199028|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHRwdUw0ZTdNMXFmdE8xWHptM3RKaG51VjRzeWVkWEJnMXZ1eVYxcmJuSXFw?=
 =?utf-8?B?TERxZTlXNWd6dG1Dc2ZEcGJLenJvaW5JaVB2YTY1TFo0SGc5dWpqSVEzNkxF?=
 =?utf-8?B?QzFESnRDM1FvSWpMa01qOHhIaW1abThLUDFyS2liaUhqSE5YVXFYOXNRV1Fu?=
 =?utf-8?B?c0FjVy9CWXA2UzJVSTlJNkZjK1dLMldJVExVMW4zNG16T3FjdVFFdlByYzBZ?=
 =?utf-8?B?YTRXSUdRQ0o0bURqVVVZZDNOMnJTUmRZUURZL3FCYitWblE5VFhpS0ZrbEVo?=
 =?utf-8?B?OWI5VmJqRlN0cTkrbmFXc2E4dDNYUkMyZ0g5cFBtZ3ZKTnNDYkdiUWVydkNo?=
 =?utf-8?B?T2k0QWlXWHU5T3pzTi9lTDlhZ2RQa29wUXFlMXljdnJiYUlTSjc1SEtWVFRX?=
 =?utf-8?B?QkE4clRjek8waTljZVZFWS9HTkxLUzZ1VGtSTG14Y2JWeFArZmhveFFwWmRD?=
 =?utf-8?B?YlZ6WS9IZ2F6MVM2ZEtxa2tHVmtrRXphSTFTZXpVVzIxM3g4UU5hOUpLWHFp?=
 =?utf-8?B?WUZiOGRmQlRaQ0YwZ0FJa1J3bklCa0lLbXBkb1d3VHBxVHpsTm82NEdKeTBN?=
 =?utf-8?B?VWRkYS9TQ1l6a01ZaUR4b2ZiMDEvZW04N1J5L0NwTC9hYWRzUU1XVDRaMlpj?=
 =?utf-8?B?d05rMnpXdXNPYi9xVzZDcU12enBxT2w5OWxFWTJvaDhtRzNzb29uS0V4dHhL?=
 =?utf-8?B?TjZhbkVacGwvekVGNHdTZklMQ0laSHEzZE8yMEdFRFIvTEJSS0l0ZEhxT25s?=
 =?utf-8?B?TUdTdk5maFRsV0xTdElzbWx5bHo0ZzFWN1RseENUZFBnSExMeCs3QUI2MEpY?=
 =?utf-8?B?ZDBiY09hRzluSzA0U1kzZFFVNFI0b0tVM0VoWmt5M1hiQU1jcDh3RTdhOXdr?=
 =?utf-8?B?K1NMY01qbEpTL01pdlJYSFFtMzVMcmhXR0NKVXIvcm53cWl2U3cvLzZGUyth?=
 =?utf-8?B?SFRzV0h1ZndLYVpLaVFlREdJVE9odk5oSDJ3WndyTXM2M3BEZGIwMFMweGR2?=
 =?utf-8?B?dU1LMktrbWVxbWNKa3pvWU9IRjd3Wi9XYzI4SVMzUVd1TFo3czhGL0pmVFN1?=
 =?utf-8?B?a2hXaS9wNytwNXZiUGFadkJCekVGN2pxem5ZeUh1MmtWbjhOVG83NzJycGto?=
 =?utf-8?B?UWhacm1tSWpHUkxZQ1kza2VFVWRUbmx0aXFMWmx3WTh1Y2sxZXIzK3lmUmEv?=
 =?utf-8?B?TkhLWEVCSEJoNUlETVlxOURzcnZqdU5YK3dMTWtPTng5S3FtQTZxZU5ob3VG?=
 =?utf-8?B?U2N6d3h6SHJ2RjczTkRZV0UyZUIxYkt4cVRXZ3BLRitiNWlyUmwrZURTVnQy?=
 =?utf-8?B?MUdjVjFXMmRHMmdNR09OTU00OWVPdjZjRDQ2bEVqaEJoMnIxa2UvcGFRTVhj?=
 =?utf-8?B?UEVISkVGSWpJSXp5YjFoN3NxSklqcm4zSXc4U1QrdG93R01CSnpyNWV3OTFB?=
 =?utf-8?B?QVJFQUZtR3ljNEFteXpKWlQyeVhodFhmQzVJcWdVbjBpQnMrMEJ2RTNUa1NE?=
 =?utf-8?B?d0FwSkZTK1p3ODlYUXJxM2JMQklKNmNCZytDdytFR2ZzRjd6RFlWNTR0NFdl?=
 =?utf-8?Q?Tfi+HWwN2wspehwKOv4r2w7u0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE9qenFuVFNSRXU0aEZ2Y1pDbXVQYUNWL2NQQXBTbEZtT3BFUE1GbjFINkZh?=
 =?utf-8?B?Y0Y5Y25wVlBmRDdDdG14aEdxcTl6dngwcU8yRjVNRDIzUEVEMkZxcnFGUW9J?=
 =?utf-8?B?NU4vdW14YXhiN0NlRklBKzVFWlNaem0wSzNCWURPMjljRlRjTUVEWnczTEs1?=
 =?utf-8?B?eU9VUGlSc3ozeXRuVlFXRTZPUWRuWUF5bVZPRDJQRXJ4THFDRjcxdDFzUm04?=
 =?utf-8?B?QTZMcFRPWTZubjdwNnZlR1orU2FaZEVXalpQckxRa0tPc3BQc3hVZkFUN1NW?=
 =?utf-8?B?S3VxZnRLaU0vS3FzRGt0dDJ6L2J2VGJ5RjArY29LSVI0M3A1eWdKYjdGUERw?=
 =?utf-8?B?Mzd0aTQzVmI4RG1JUStNZG5adkxXVVNSZElmUWVPMnptY0tVRnZicEVCT2Y1?=
 =?utf-8?B?VVBGNXpucXRsRUlGSThYcWFKdGRWWmJNS0JLd3RFQ0pqS2l5Q1Q2WUF3SEtL?=
 =?utf-8?B?SWpid2JpeDllKzAwRkR0eC93Vm5kWGI4a25CUXJ1OEJ0NlhMN2NJOG05L0d0?=
 =?utf-8?B?d0V4dXNKTDBtR1NYNFNDT25UNG5zTWVxTlI3MVQ1dmZ4eHZhV1FFelNGMmNm?=
 =?utf-8?B?Vyt5OFN2RXRZZlQ4cjZZRjdmanUyN3pDek1KRVRsZzVMbUxGOVJ3WER5L1Qy?=
 =?utf-8?B?bnZpdldPRUJ1MXNhNXdHdmQ0ZnhGZktNWEdZZnE3YkhXamtwdk9HM1dUbkZM?=
 =?utf-8?B?WTg4cE1lcG9YTm1kOTVBcHRkVCthOFh4MW8yOThrYUZIc0NmLzF4QWwyeDdD?=
 =?utf-8?B?dzIrT0NYbkExR3kyYnB5NEdHQXhrY0JKSjFGaTh5VWRZYTAxN0ZheHpaUkdu?=
 =?utf-8?B?anpwMWxiYlJzeXVPQnZ0WE5OSWV5QndDbWJqK0IwZ1F4WDFBOFZDajc0cU15?=
 =?utf-8?B?bncwMUd0MWhPb3k0SnJ3TE1iL3A2b1dCdElaaUY0azBTaEdRU0FUMldsc2Vl?=
 =?utf-8?B?Ris0WStaSlJDOHZyR1lJMnFzVndXaEg1VzNVMEE5NTZoaU9ocGJJaFN5RXYy?=
 =?utf-8?B?QkpyTlFma3Vsd2Q4a05HYVZSeFduajkxZDhTOEtsLzlodmU3aEtUV2dqWldQ?=
 =?utf-8?B?aGhMOWc0TjZHMWFJMXJjSzBVb21iTmxzL2l0YkFvdmNXYVplWnB2K1YvajMy?=
 =?utf-8?B?WDdWWmxxNUZiOG82dkRuSTFoQVNyNU5sOW91M0VteTVjcTJCREx0Mm8wREVm?=
 =?utf-8?B?RXJoSkJCNnE1QzN6S2ZxR2U2M0RHaEtEM3lpMUc2QTdOZ2V5a0ZMZHVheTZh?=
 =?utf-8?B?YmlEOTlNUmpJMW4yaGxiOUVWQVlrSkgyNk1oemdLN2FZMnRlVG80cktXZ3oy?=
 =?utf-8?B?andJVm5PL1VlZ3VOQ3NQcVQzQzNpQldBQjBNZVJjUG8xdGdpU0hxZ0ZMTGZG?=
 =?utf-8?B?R2g2dEV0RFdIMWw3eXBKREk1dXFFSXFwZXp5RzFrNHRXWEhJaVRxMUR4V0U3?=
 =?utf-8?B?bnhwckpHN2NVeGhCU1JkZzdoZlhia055Wm5Kc1Myc0xpN3NhVHZqdnZrQXNH?=
 =?utf-8?B?SVp3QWJ1MzZxa0VOMTJ5a0ZtNGx4NzFzYXhxTGx2S3d0VE5XaDhKZXpzUWpv?=
 =?utf-8?B?RjRFRGNLNmNGVUpwcEgzemxpdnhOYU0wWHNCUlZLRTA0ay8reWlIbFAwRU52?=
 =?utf-8?B?RHpxSVFNaVRwMFYxWGJyR2t3TnV6dzFrUlhHeG9MQTd0YlpVRy9LMU5PVVBB?=
 =?utf-8?B?REIyUkZMckk3VjJZREE1aXUwVzFKOXNFd2dSbUV4eXg1anV3eWlaN2xFNDRJ?=
 =?utf-8?Q?XWsnLUS5+U4KQXRjq2OeskcQTN//ExEP8jP613j?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5288a373-d8f3-4b91-407f-08de1aad035d
X-MS-Exchange-CrossTenant-AuthSource: PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:45:53.3090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6P189MB3108
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

Hi Dmitry,
Thanks for the review.

On 11/2/25 23:21, Dmitry Baryshkov wrote:
> On Sat, Nov 01, 2025 at 01:54:14PM +0100, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maud_spierings@hotmail.com>
>>
>> The Asus vivobook s15 has two usb type c ports on the left side, these
>> use parade ps8830 retimers like the others, enable them to also enable
>> dp altmode
>>
>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>> ---
>>   .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 310 ++++++++++++++++++++-
>>   1 file changed, 302 insertions(+), 8 deletions(-)
>>
>> @@ -158,6 +174,102 @@ vph_pwr: regulator-vph-pwr {
>>   		regulator-boot-on;
>>   	};
>>   
>> +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> 
> 'vph-pwr' > 'rtmr0'

Will change.

> 
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR0_1P15";
>> +		regulator-min-microvolt = <1150000>;
>> +		regulator-max-microvolt = <1150000>;
>> +
>> +		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR0_1P8";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +
>> +		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb0_1p8_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR0_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb0_3p3_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR1_1P15";
>> +		regulator-min-microvolt = <1150000>;
>> +		regulator-max-microvolt = <1150000>;
>> +
>> +		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb1_pwr_1p15_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR1_1P8";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +
>> +		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb1_pwr_1p8_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR1_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb1_pwr_3p3_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>>   	/*
>>   	 * TODO: These two regulators are actually part of the removable M.2
>>   	 * card and not the CRD mainboard. Need to describe this differently.
>> @@ -506,15 +618,62 @@ touchpad@15 {
>>   &i2c1 {
>>   	clock-frequency = <400000>;
>>   	status = "okay";
>> -
>> -	/* PS8830 USB4 Retimer? @ 0x8 */
> 
> No retimer on this bus?

Seemingly not, it look like there is in the DSDT, but can't find 
evidence for it on this board, there are already 2 now for the usb c 
ports. This third one would be inline with the ps185hdm hdmi bridge, 
which does not make a lot of sense.

> 
>>   };
>>   
> 

Kind regards,
Maud

