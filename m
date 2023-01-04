Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B24A65DFE2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 23:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB79610E0E4;
	Wed,  4 Jan 2023 22:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2054.outbound.protection.outlook.com [40.107.101.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952FD10E0DA;
 Wed,  4 Jan 2023 22:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKbMUHptyxrdG58MGKJG2NXQlaJw9NSANH64YAj7m29to9evbBVZlewaHz5Cet8+4DIJfuqE0tGSJevabaFSwZeXAAnDkj6whLwN6L0zPGSlLajHz2/ongUBa7hq9ZJRXx2WqpNTSOXZIXg5wHw0EWCnW0QXcDqW1jzXrA+UsaKLNpul1riBfCGNG63DrxQsnedkK7DPdDjOx0li43MfPvaio8Ch0gngXsx/31+zs0+OT4sUzCnkYlGFPsvjWgUxtaON6slIhLeutT8Ad5Kp73RECsXgPlXIXUlnSiuxdxqKQnX5iXucVy+LVGALO31bhDloiSZrbA1dP2wWYMNu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBvIQbjs6lbPVa0ekSPO7b6yXyv+nU2g0St7nirFVHk=;
 b=jbYGu2ULSNt/DId2qlqIARz4F3Fd8KDeDh2ZAaYB+av4v0FvKMo+RUwfCf6x2Z+INcUc1U/utiWtagjFDGN0SlezyyjAVEStg1xAckAC4a2AlEqE3LfTy+i6PcoMLfsa9Vt/J1IQOtgHP7dkQoaDsNDbZRaDXgV4RxI7U+uH+34hapdEDrZrydBN0tURPyUgqHUyE3y1XZktVNipI7ICEdmCbeNwLyU7rA97qESlHcPxOlkwP8fukgfVr2zf1UjU0is+97vAddFeatHceaEO4ymUkZJsBg8CYl3ckTWL+hILosrjSvaoa1VBP0U7PZewgevQLHsHhPO7M8f9xPSGvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBvIQbjs6lbPVa0ekSPO7b6yXyv+nU2g0St7nirFVHk=;
 b=Oht9+f+bIp4CBClEXy3sCZTzWOE/YxJup5O2Vu5SGbyDcJvsJsBVZkWaahvQsWYX2gW5yOPtBsmIAFnBmbpEZYSX4tsne4/B+NbNqsgIJrPJWmE9IYaKnKYXGtJSMjq3oWyeYZC08mgWZcN7PdIfWFtkgEzURz0Zi5eOGPshi24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 BL1PR12MB5125.namprd12.prod.outlook.com (2603:10b6:208:309::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 22:21:54 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5935:7d8d:e955:6298]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5935:7d8d:e955:6298%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 22:21:54 +0000
Message-ID: <f848623a-a1de-23f1-3334-5cf4ea0f4d89@amd.com>
Date: Wed, 4 Jan 2023 17:22:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gZHJtL2FtZC9kaXNwbGF5OsKgZml4wqBhcnJheS1i?=
 =?UTF-8?Q?ounds=c2=a0errors=c2=a0in_dc=5fstream=5fremove=5fwriteback=28=29?=
Content-Language: en-US
To: wenyang.linux@foxmail.com, Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
References: <tencent_13506618BF90E7B2AA796A9920DC49BEF407@qq.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <tencent_13506618BF90E7B2AA796A9920DC49BEF407@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::6) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|BL1PR12MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 566fe66d-ee5d-4563-0b4f-08daeea215a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uACE5p4H2gxoBWVbn6HjVuqUjaEOYANM0ZOzQ39UZ6I02r6mCVvuupHK72C4/Y7Um+/jMDcgXQ9zAddTNfXcFMEQugbwSTGug4WZgczt9AvxsCplOd36tjOa55OuHxXJBbxzxri/P/B/dyL1IKcEMY8gP7RSQHq8TY6YwlF+e1xsdKoQAEmxv5S+Kt7iD4jQPc/ZvzlLXhSDHjAwTH9rsImnNAMolvc3jmiVdNsqZ4i5h7oGpx/sAtrnW1QrWXzvqjAF6yYfnEGU7sfdUcXSKeAjToA0T27VuHypCjSPmq/fJ8Y5H7eVIW2QKLLh2O7Xo046frUQQIlNecnlcq6iDVO1i5j5PDXTDbQKbjpSxENfo9OaWen1vdtgNs/ILQxVPVCG1ZhSjTV/50Q5baI/qEuUSqAM5XICh6SnakKbVY+Fr1ugoUSBIgjq8FhhKBCrJ6B6zGvWLhU1yfOqY2FO7qJ8yCUwkwq0DfQCRnPa24FGxA6C1+EYgB5liIQP93Q6lU4p4sduL0QYuZokhvd53YGng3dfcOatKxH+DBMehOCX0uF7i2iC5gBGPs7NVsl103TFM6lQ5kbsnUBFJWws0lWMdwBqUUdT04/H+LY1qeLhhiBwDt9aMaXv8kpPiLmvGA6E0tMyrHd19aZttQy+TTvvjCaymqPMDKQ3JQTnx12meRolfZHdExM1g/E6XmeYq1RpTITtqtjfMsRupJGFIasvqggEZBnkdsx2OhCeUfblFkYGPF6zdVwQAo9sOhLKy0NyHj5DLjMlnBhtv1n9kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(26005)(186003)(6512007)(83380400001)(8936002)(44832011)(6666004)(41300700001)(2906002)(31686004)(5660300002)(2616005)(4326008)(66476007)(66946007)(66556008)(6506007)(54906003)(38100700002)(316002)(6636002)(478600001)(86362001)(6486002)(53546011)(110136005)(31696002)(36756003)(48020200002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bS9jRXl5OXlKcWU1VDlNdHdxOXlUN1lBZkk0MjZCUDl3cTlVbXpmb0Z2enM4?=
 =?utf-8?B?ZFBGOVBmNkszS05MTjJoWmdXZk5TWDJMZmJZS0FKaXRweEE1UGo5RjJtQ09r?=
 =?utf-8?B?cTJWbDMzRnlOY1B3RzZEbERnTnprSzBEMFQ3ZGh1YWZENlRTQzNIK2ZxbTRy?=
 =?utf-8?B?VGpQeU1GeWsvUmxVL0NUclpONEcvTWdON3Z2L3U5UnNUNzVNNDhvQnh5a1pQ?=
 =?utf-8?B?N0M5alppV1NwTVhqdE1jYjFocVh5d0t4SFhrc0NvSFFxanJkV3gyRFZEc0xw?=
 =?utf-8?B?N0dsN01NNzlwd1M2ZkVxbkFUYTF1cWZtUmZQY2ZrWHU4WWVuRDUzMEpLZ21s?=
 =?utf-8?B?V2I2Y1lmd2JrMEY0WklsS3FvM25qaVZzOE54RmFsUW05SGxCOGNBUFp4cVhI?=
 =?utf-8?B?cHFsSGZ5N211YzFmT3M5R3V0WEE4NUhYR0ZCS2c4dTdmenFxOUdSQnJoR0xB?=
 =?utf-8?B?cDYxTi9lK1hjZ1I5dkRBZlMxL3lDd01qVldYeERPMDBHa2Uzb0VQWHZ1dFQr?=
 =?utf-8?B?a0xUWGFTK1VIaWkrd1hHRHZEVVI3cG5KNWp3ako1K2NCMjZ3Q3dHcmJibExt?=
 =?utf-8?B?UjJUdGVaRGJSZHk4SjEyaHp3SEM1TUdFWFlJTUs5U0lXRER5ZERRL0RFTFFh?=
 =?utf-8?B?Q1NaRzFLcFgrNWQ3RDJpV3p6Z0tWVzRwNGlCcGU5TUtqZ0EwT1M4bzIvSW5s?=
 =?utf-8?B?Zm1rbmRGdlNHOUFNaDhVeHhmK1JiWHVLd3BwU1huaWlGMUZZV2VJdjF1SmhR?=
 =?utf-8?B?Ui91anB1SEFhdGUrWHBkeW84enlMSDZ0dUZRTVFEbEVSUTk2R3RzWUdNdzZa?=
 =?utf-8?B?L0xvSU1hTTlrKzdOY0FIM29Jbk5mc1pxVWhzV29TR2h6RnFzUDhHcTRtSWx0?=
 =?utf-8?B?RXZmVzlwNEFBV2tteVpYZkJqZE5DVzJ6dkdQRFFFamdna2E4S3dER05FNCt1?=
 =?utf-8?B?WGFuaUpjcU9mbTlzY21ITW5KNlA3YmNOVkJQeDlkSDRZYU8yVWJmd1ArMEpH?=
 =?utf-8?B?VEV1ZzRocXJHZ2YyLzZZanAzOGNXcUhGMDBPVlF2UG5vTDVjdzV2V1BHU1o4?=
 =?utf-8?B?RytFU0lUaW5TUlkraXV6MFkyVVNpNXBzeVNSUlF2K3U2eWwzWUllUFRCdkFs?=
 =?utf-8?B?bm9RUkFhWDNhMThicHNxa1c0WWN0VllUMXRKbmcyd0JMQzg3czZDSElsMGpN?=
 =?utf-8?B?Y001Z04rRjBjN3F0Qm8rQ2ZuTFlNZnJPL3U3Q2JCZTFOcGdLWThyOGJKQlNH?=
 =?utf-8?B?alpEdWVSYlFnd254M2ZGYkRaWVUzVzhISmRrd2QzTkhXMXkwd1FqZmNndTRo?=
 =?utf-8?B?ZWt0enNKOXZNMWxUWFNzaFNva3NjN3ppYy81T0hZYXkxRmpwUFhOSGRtTm01?=
 =?utf-8?B?U3QxVUpYSEZMZXJQMWRTOGNOM2lTS0NxRlN0eGtuQmRVQm9hd3R0SGJ0U1k4?=
 =?utf-8?B?SE91eWk3VTV2a0lRb1VNczVOdjlWNE9ETDdYT2h1SUxYTHhKUVpFRjIwUG1z?=
 =?utf-8?B?c2cwb1REZkl5VXlPYXNzb3czeXdYSGIxQzlMa05lQ2tWL1A0emJ4U0FTOE12?=
 =?utf-8?B?L0xBaFEyWkpwL1FzRFZVOVp5THkxYWZBWVFqNVV3eDQ5RkZXTkJEU2FPWlJn?=
 =?utf-8?B?djBsOC9sc1oyZXZtSi9va2pLc3ljak9LMzNnR1BUb3dOUzdTM21RS0x3S0ov?=
 =?utf-8?B?S2RSb1dSdzlZR1VFNGVzelJwT3hodGVDeXl1Y2ZuZ1F5alVaUjIwTGVvWTlL?=
 =?utf-8?B?ZFZna1orYmJHOS9sT2NwRmxsUi9oOXFHSlh3YjhoakMyKzZReEdNVm1WQmdH?=
 =?utf-8?B?eW1tMER5YnowUkdLOWNKZFROakgwK1lSczNmTU4walRtZE8yTGZ1RWdMZkl2?=
 =?utf-8?B?azZVQmZjOEdhaFJWVnNUWlJWdGRIWXQzYTB1cjFpeXRucWRJMlRnWHVlVHk1?=
 =?utf-8?B?RmFHWWZEb05mK3FWbEh4Q3RrYTdHRmhFSzFmRW8xdlU4Z1VyblNGNm0rU0Jz?=
 =?utf-8?B?TlJmdjlYTTRWcHMzMUVQRmJDUHAyK2RhZmE0cEt5WVUwczJYSG5wVlQ0L2dU?=
 =?utf-8?B?TkdqTmhjaTV4ZXN6VmFINmp1d0h1cTRvUHhZSHM5NFM0aVFQSkQxRytGR2F2?=
 =?utf-8?Q?Ux/GqUTpsp97sqxBtHa79TF3z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566fe66d-ee5d-4563-0b4f-08daeea215a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 22:21:54.3290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6UOnr33jeGTwNBoeeOXLPb8qLgtDdbYArZQXvzkqBYkGVPcS2kH9MaGqpTYixdzok/k1EvvbboyWitYUJS65g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5125
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/25/22 10:10, wenyang.linux@foxmail.com wrote:
> From: Wen Yang <wenyang.linux@foxmail.com>
> 
> The following errors occurred when using gcc 7.5.0-3ubuntu1~18.04:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function ‘dc_stream_remove_writeback’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:543:55: warning: array subscript is above array bounds [-Warray-bounds]
>       stream->writeback_info[j] = stream->writeback_info[i];
>                                   ~~~~~~~~~~~~~~~~~~~~~~^~~
> Add a check to make sure that num_wb_info won't overflowing the writeback_info buffer.
> 
> Fixes: 6fbefb84a98e ("drm/amd/display: Add DC core changes for DCN2")
> 
> Signed-off-by: Wen Yang <wenyang.linux@foxmail.com>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index 20e534f73513..9825c30f2ca0 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -481,6 +481,7 @@ bool dc_stream_add_writeback(struct dc *dc,
>   	}
>   
>   	if (!isDrc) {
> +		ASSERT(stream->num_wb_info + 1 <= MAX_DWB_PIPES);
>   		stream->writeback_info[stream->num_wb_info++] = *wb_info;
>   	}
>   
> @@ -526,6 +527,11 @@ bool dc_stream_remove_writeback(struct dc *dc,
>   		return false;
>   	}
>   
> +	if (stream->num_wb_info > MAX_DWB_PIPES) {
> +		dm_error("DC: num_wb_info is invalid!\n");
> +		return false;
> +	}
> +
>   //	stream->writeback_info[dwb_pipe_inst].wb_enabled = false;
>   	for (i = 0; i < stream->num_wb_info; i++) {
>   		/*dynamic update*/
> @@ -540,7 +546,8 @@ bool dc_stream_remove_writeback(struct dc *dc,
>   		if (stream->writeback_info[i].wb_enabled) {
>   			if (j < i)
>   				/* trim the array */
> -				stream->writeback_info[j] = stream->writeback_info[i];
> +				memcpy(&stream->writeback_info[j], &stream->writeback_info[i],
> +						sizeof(struct dc_writeback_info));
>   			j++;
>   		}
>   	}

-- 
Hamza

