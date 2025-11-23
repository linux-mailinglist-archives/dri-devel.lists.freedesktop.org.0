Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD6C7DFDF
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 12:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C81F10E09A;
	Sun, 23 Nov 2025 11:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="bdsvfCxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazolkn19013081.outbound.protection.outlook.com
 [52.103.33.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050A510E09A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 11:03:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGmlYgULPcOIaUUhfKnIGeaLJj8DpW+2M/Da9c8ZmGYJH9T7QoHAm8ZjPIZMB739QNwXRnORR9deyFF0W6rZNSa48eWiFWjiNL2buAo4d1OmegtWVMUHfkLt7+eF/fUDeHVnOJF8nZuvoK4s0NdOkNPANr5faPje3Z0T6kh439KjwKnWI10YsNJ09csxbcgYfCKSWtzfGrXu+CfsA3RtREYkyTX5flmdVJLPOinnRO/T72gO9eRpaiZSYOpYCqSWl3VHaHsQPabEhMiz6QdxMjEehvYdr8i0CCDCsrH5Q+rL3WNJsMwvShkRbpYitxuIHeAR/W5joV5H+5BP+lP31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFuTOka239j/w+BOD27qpwY0mOmTtOp3XcU9D+tyGwg=;
 b=pH+jcbgy1ByryAbT0ck25HhtZRtO8jnEV3U14iMyl7oFoQzeJy5EI2spKDq+6gT0Vxw9ft5aeKhfPx18Hp2THip0TkClih5HoFFBc4UPQcvONav4zPb7R+ZqYjXz3AJBAbKW3ElTtr9ipazfbMKtfctI8i0pvLp3qwGkRZAkUvne0482n5h+cCjtV6FNnHFhOqXpG2/3RkfoKNe3CLGpuF/JdkS5Z5+zIaBS29Fe/RnrmXpd8PVAEtBiGhmW+RtN4hdSM84yxzgYA/NILMimWTQAaKwFRe7dAtyY7TZF2syRMGdYq87Q4JF+yOP7ww1c35VpaH/cQQdQaoJcMEno6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFuTOka239j/w+BOD27qpwY0mOmTtOp3XcU9D+tyGwg=;
 b=bdsvfCxjzasFVan6/2Lh33I/mUdoPSGRrVQKSEGKQaLPihgWHQjGW4uW74EgWlHp/B15PZ79eUNqECTtmA8rbB81lWvutzh7PVV+nWKHCQnhpP4bnruapRujy06PuuuMY65YYIhUJ4A/KhyRoMP3+SWnFHLcUCZkwgH9E0tqfYanvig6vo9L+xHqzU+j8MxblKEAerMg8ErSA0kZGqmvpy/wXCKPVf/uCJ3c/C6q3/iTO4/CjDE3RpWqes1uNEoN41+X3T87bKJM5CmGlk4AQZP0GTTA6abccvfZenrisn5WhdbBQBrng6NgbPhBbunPpmy9mnF+MWZOSSOQQYDKVA==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by PR3P189MB1020.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Sun, 23 Nov
 2025 11:03:54 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13%5]) with mapi id 15.20.9343.011; Sun, 23 Nov 2025
 11:03:54 +0000
Message-ID: <AM7P189MB10097E44F277EEC068E4B847E3D3A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Sun, 23 Nov 2025 12:03:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add
 charge limit nvmem
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
 <378c611b-f8c6-4f89-a3b3-6d8c22445e83@oss.qualcomm.com>
 <PR3P189MB1020E7393F72B285173137A2E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
 <ff773af3-d843-42ff-b4dc-e5a9d85c2285@oss.qualcomm.com>
 <PR3P189MB102003218DCCE87EEB69A0E4E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
 <57bab427-d8fd-490d-88f6-358b79367ed1@oss.qualcomm.com>
 <AM7P189MB10093041E89777C2AFAE2CEEE3D2A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <d6018a1f-12a6-431b-9367-65c65e1d920f@oss.qualcomm.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <d6018a1f-12a6-431b-9367-65c65e1d920f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0011.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::16) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <ecdc2944-4d4a-4140-b119-f32da4765b16@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|PR3P189MB1020:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ceddc1-7cd2-456f-136e-08de2a7ffd8d
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|12121999013|10092599007|461199028|19110799012|15080799012|23021999003|8060799015|41001999006|51005399006|6090799003|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnFVVGNLS1lwclVoVnZic2NXZ3ZBSkpJVWVrNWNYTVdSaXFIc0lUZGJIWlRa?=
 =?utf-8?B?dG0wRlR4ZEo1RG5JdzBpLy9FR21xNGpYZFRFWEphd0o3SDlLRWtsVEtpcHVH?=
 =?utf-8?B?NHFaUkw2M3ovTFRHMXhSUm1BRkJ3M3NWcG9ZWm5Zb3JsZmlGZVl1emIxVmhy?=
 =?utf-8?B?NzFSSUhsalQ3eW82SzQrRkJTak9PNEg2MTlKZE42bnQxWkJ6ODI5ZXo2cFpu?=
 =?utf-8?B?bFVHc1IzUGF0WGV2dHNESm1jQzdINVZPWDc4VW55ZjFUQmZpRGxCYXh3dTRL?=
 =?utf-8?B?OGZmL1dIMVVkTVRxUEJUZlcrUXM2K1NUUGx5Q0F6WFdWY2c5VHR0LzJPMml4?=
 =?utf-8?B?QkF5Q2ZjM1lVMmhIMWVXeVhkWmx5dWlBUERCVXhIdWF1czhaRmlDdkJWdFNZ?=
 =?utf-8?B?SUdGai9iTWx0ZGMrS0ZPbFZIdS85ZjVGeEpTZHFhZUdNYUU3aDlkWEZmUkxy?=
 =?utf-8?B?MXhMZ3Job2dqQ1Y5TElTeFhiNHFDdFhDbitNSVRrUHUyYTBNSlVnblJqcWxt?=
 =?utf-8?B?dzNlUGNiNHJmYWlPVkhqN1FaSVJtTUZReDJoY2ZLNk5PaTZYTzFFV0V2dGl2?=
 =?utf-8?B?R291blZKQVNzQXhKNUNhdWRLQ3FnaDM3aUwyeGVpTFdRallLMEFkeDBiSVRo?=
 =?utf-8?B?aHVUblhuTkwzMDczNlVMNTJlZ0NkYktRQXVVdklKWXg2NmQyZlhyazg2d1h2?=
 =?utf-8?B?U3paSW5ibHhRcEZSRnVvOTlLbE1iT0g1cUVjRTQzOHM4WmRyQVI2T21IOXhs?=
 =?utf-8?B?cHJpWlpJOXNYMzRFVEIxT2F0UGV0QU5mekdkem5CQVdZNFl2cFpvczRZelg3?=
 =?utf-8?B?WVJzcVR0UDRUM1U4YldxVExSYytDSEMzS3RuWTVOTWQrckVBQ3ZWSnpSZHJl?=
 =?utf-8?B?bS95QnE4RVJmY3FTZzJHd1dwZVRuY3VOcHBlMFVjRDFzRDRHSVJoUVNNY25J?=
 =?utf-8?B?OXpvMTVscml2UE45UTd6bWFZVzIxY05mYVNvTjZVM0RvVDhGVWZmSDVzTXk1?=
 =?utf-8?B?M2lvZytiMjVxWUpwYjBYUENnOWRObEpja25JTWNBLzRmZmEvZk5xcW1ta0E1?=
 =?utf-8?B?QTdUYkdLMVdFc09zSWtYdjM0eENoSDZ4cjkwemtzQ25VUjJGa1hqY1I0RWFO?=
 =?utf-8?B?YlNpMjNVTDlUZU0wUEcvbVRXd1FQZUQvMWdtQjFFVXMzSGRBamh1Sk43VDND?=
 =?utf-8?B?UDUzSER5ei83NnlLdDVlSmhWajhtSEZ3K1dpOFhhZXA1K1MxeGV6MXZrRHBL?=
 =?utf-8?B?V3VwR0ZXbHhxUDhlMTdkaWYvaEdPamR2Zml1K012ckxib1RrTkhubG9JbDNQ?=
 =?utf-8?B?UGkxMnVYbEo1Uk1FeUVtSkI4d0JNSFpjb25wYnRRYjJ5V2FSWHZaTENqcTlL?=
 =?utf-8?B?dTFsT3VZUnZaaG9NbkNqUHd3d0ZXT0VOQUt4cTVZc0s5WkM3eFR2RjJTTVo2?=
 =?utf-8?B?NmMyN28yRmFTeElIaWIzc05sbW1OditmOWxxR2c1VjRhc1N4Z2RudjZzRlhV?=
 =?utf-8?B?K2luaVhiMkhjUmx6K1YvNGdmRWVaSkZIb1RyeWdtdkJ6Yk43RW1KMkFicHQw?=
 =?utf-8?B?ZWZmSERqMFlmYzRMSDgwbXovQmM0TWh6eUxDTnZ2bjcrekt6eGVHcytyVW5C?=
 =?utf-8?B?VzVJVS9sVisxUDBkaFlGL002Skk3bmpBYnRNd1lBVE85TW55YmE3eW9OdUgy?=
 =?utf-8?B?UWx2TUwzU29JSDhZYVlEZEVza2E5VHpsMnZvWlpRRjI2YnFoSU1UbUFwV1l6?=
 =?utf-8?Q?wfPmN/SpwZ5SS7vsm5Om6ex6HPryqepPt7vo2ZS?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czBCQkZWTllHQ0FwbnJ5Z1FuSy9oZi90OS8rU1U2RFNhQlREelA2SUdPUEhp?=
 =?utf-8?B?WGFQRVZpUmw5eEluV3lwTDFSRHpxTTRNT29kWWpReHpBaWUvWXlCbGgxVjV1?=
 =?utf-8?B?Q3hvVzBkLzlpeE1vTDczbjRWdUJaVVI3K2J1MDVlc2NmTFNsYjNyaHNKcERq?=
 =?utf-8?B?bFluVzlKUmFTS0ZUejlhdVRzbDh0OTJ2VXhubnlmSEVxemhuMGo4Z3QwejBT?=
 =?utf-8?B?blpKYmxCcDdMOU9kak93L2k4VmFlcU80NURlMG5XbHhQaExpUlNFU0NwbjVF?=
 =?utf-8?B?U3BWdEJRMU1SUkg0N2xjdTZ0ekM3dWdyRFdmK3IramJOazBXMjVRUlhXUHIr?=
 =?utf-8?B?Wmc1WU0wdzFjcWRrMDJuZHJqdnRLUmRJV3REQ05vVjZ1dkNLMWRpdDFydHYy?=
 =?utf-8?B?bGlIOUNuQ1hKMm9EUTBCR0JlNmRGWUlZSzQ1OG0vS2lqRkY3UG40SEM4d2hU?=
 =?utf-8?B?cm9YUG5TeldtWU04dlgwcGZZeklzSWh0SVdLY0VwVWVuTVdsaEVBQXJnWnBl?=
 =?utf-8?B?OU9pT0Uxb1krRnBERVN6ZXIxK0FRLzVlaG8vRC8yYXpyZS8rK21PZUo3NVl1?=
 =?utf-8?B?c2p5TWErbFpHK0Q2Um40RkpWSU83eVRtZUx2eXVoclgxSUVHa3I0ZmMzUE9F?=
 =?utf-8?B?dlQvZHJXazhBSGtOeE03eDZQNEU0RHo4QnVJUDZFNW5FMFF0RU1tTElTUGdI?=
 =?utf-8?B?OEt6S1F1UUpqUGh5L1VGK2xici9udUpKV2lPK2xSWk1hbGtYM0ZwWHBndHAz?=
 =?utf-8?B?NHhIb0wzajdHZXlkcngvQnRzMUpRVTl0N2NSU1RreVo1NGNjUWxGMXlTWXBt?=
 =?utf-8?B?b3NwcUtacDVLWkhHNDhyb2Jobk92UTBnOGlBQmVYUThMLzQyWWhxVHI2dFV0?=
 =?utf-8?B?c2NRK3VGZkF2eFYvc2c3cFJCcWpjTUxQSjFsQ1ZLenJLS2tUTCtsQS9lYUMv?=
 =?utf-8?B?dVdBdTArd0hRcVZOS0k1YjN1NFdkQklpUmhXQVE3SHpXUVk3MDdOR2NJVGVh?=
 =?utf-8?B?aklCcnZhV3FBY0pHdG8vSFRieDFHRGpRbHRjQWJhb0FsZDJzNU9LMy9taG9x?=
 =?utf-8?B?Mms4ZmxlRHdERENBK2g5cU44UFNqeEdodWd0OTc2Uys4RVNZWUdReDBmT1Qr?=
 =?utf-8?B?dEtBVkdYSzlaWVdaUUFTWFNnLzQzaG1qbkRISkRiVlpPU1VCejFQUkI0WmZl?=
 =?utf-8?B?RWt2NEQzakJ5cjNrL2ZnYVRnWFZVRldnMjBnUFhPZElXbWxoaEVUcG0xMitQ?=
 =?utf-8?B?MW4wWFM3ZzV4ZktQbGFTYTdhejlLWlBGQmR3OU5SMC9wTm5TYTFqL1BUenZk?=
 =?utf-8?B?YmNQbnlrVlVJMkJEdElWUjgraVJ4c1lSOCtWR2hHeE5QS3ZkZ2w5Mms3MFFl?=
 =?utf-8?B?RFQwak9UN0IwNDBWWW93ZlpGNGE1Nmc0dGZ2NmNCZDlNbDViZFNzVDNvL3pR?=
 =?utf-8?B?WXZqK1YxVmxadWs4bVBWZ09hWWl1aUlpY3haRmVOc2VhaG5oSGVvUFBLZWhL?=
 =?utf-8?B?MWhLTTVUbnBVRzNwbndaM3VFblhoVGlUanRXQTBJRXhRN1UxSGkzdk83MFU3?=
 =?utf-8?B?dTlvWUtnbW9JcGEvUzVKYmJDaTN6ZnpBZDh0eUtVNHQxUzhPeHNRUFJObkgv?=
 =?utf-8?B?VkxVMC93YTVrRjc5NlMyZ3BtVmFlWk4vaUZLWEYva3RNczJYN1Y4b29EbUVG?=
 =?utf-8?B?Z0puZEtWazNXdSs1ZkxSMW1GUXhtK09EeS8yU283U0FsVWEwNms0RS85a1g5?=
 =?utf-8?Q?5EijsTGpmLcpMAAonWAT0713fYvjhrw9CvZuMQI?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ceddc1-7cd2-456f-136e-08de2a7ffd8d
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 11:03:54.0673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1020
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

On 11/22/25 14:37, Konrad Dybcio wrote:
> On 11/22/25 12:07 PM, Maud Spierings wrote:
>> On 11/20/25 16:36, Konrad Dybcio wrote:
>>> On 11/17/25 4:44 PM, Maud Spierings wrote:
>>>> On 11/17/25 16:35, Konrad Dybcio wrote:
>>>>> On 11/17/25 3:13 PM, Maud Spierings wrote:
>>>>>> Hi Konrad,
>>>>>>
>>>>>> On 11/17/25 13:59, Konrad Dybcio wrote:
>>>>>>> On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
>>>>>>>> From: Maud Spierings <maud_spierings@hotmail.com>
>>>>>>>>
>>>>>>>> Add nvmem cells for getting charge control thresholds if they have
>>>>>>>> been set previously.
>>>>>>>>
>>>>>>>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>>>>>>>> ---
>>>>>>> Have you verified that e.g.
>>>>>>>
>>>>>>> connecting the charger
>>>>>>> setting the charge threshold
>>>>>>> rebooting to windows
>>>>>>> rebooting to windows once more for good measure
>>>>>>> rebooting to linux
>>>>>>>
>>>>>>> still has the settings persist?
>>>>>> Hmm I have tried several things but I can't seem to get the values to stick. I the spmi-sdam driver is compiled in, I am not quite sure if I might be missing something.
>>>>> Hm, I wonder if Windows/UEFI overwrites these values or whether they're
>>>>> used by something else..
>>>>>
>>>>> Can you set a threshold in windows and see if Linux can read back that
>>>>> data?
>>>> the values in /sys/class/power_supply/jada-jada/ are zero when rebooting from Windows into Linux after enabling charge limitting in the Asus application.
>>>>
>>>> I remember my old vivobook (x86) also forgot its settings each boot, but given the nvmem cells that should not be happing here I guess. It is odd that there seems to be no collision between Windows and Linux. Maybe the Windows mechanism is doing the old trick of writing it in there every boot?
>>> Odd indeed.. Does it work if you reboot from Linux to Linux?
>> It seems not, I seem to remember testing it quite some time ago, but I cannot get it to remember any way, at least it is not popping up in sysfs, always back to 0
> It seems like the driver currently only populates the sysfs start/stop
> values if the "enable" bit is set
>
> Could you check this (hacky and wrong) diff and give it another try?
>
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index c8028606bba0..9ebd8adfb8eb 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -733,7 +733,7 @@ static int qcom_battmgr_charge_control_thresholds_init(struct qcom_battmgr *batt
>          u8 en, end_soc, start_soc, delta_soc;
>   
>          ret = nvmem_cell_read_u8(battmgr->dev->parent, "charge_limit_en", &en);
> -       if (!ret && en != 0) {
> +       if (!ret) {
>                  ret = nvmem_cell_read_u8(battmgr->dev->parent, "charge_limit_end", &end_soc);
>                  if (ret < 0)
>                          return ret;
>
>
Nope still nothing, there is one err about "failed to send synthetic 
uevent: -11" during startup, but I don't know how relevant that is.

Kind regards,
Maud
