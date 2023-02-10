Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41EE6921F7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 16:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E5D10ED4C;
	Fri, 10 Feb 2023 15:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36A210E272;
 Fri, 10 Feb 2023 15:22:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAPLYMft6FFd1MlKQiE88uXifei9qlbaytSYfTCJLo9i6Uy+2bMAkBVw/XGdv5myO/KLFH+SKmJT/VEsgfq/3W8Iof5UqzNMGB6R+0KWJ08/7b1tOLMKwDlC1FgZBN/s8YJMaXGdXe8bVoESMdLRWA6gNytLqI4DfuwGYZEU5NgiFcYSLKLqpHPdG89J6Rk5lU9XK5dNd7lZ70i3Qf2PETf/zlFVJbOKyJRm0EZxiAmx4vp0Ler7QBvRturjRGiFF2F6BJRJ9axvK6dIswtS/1vBbunrHNivsmyw0MEQ2nXq96Vqt6qurdIKZiuDwuX/RYeQa6rYKRutGZT21GrLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqIvrAMaBzzy6M2WhM+KwX4W2zK2mgtuUCVDH4Zt6XY=;
 b=j+RZBpf1DAeQvduHMKqQ6z7htgr81lQZ4+ahTXQT2SSJs7xtdkD7RQpWVpLLrtnxQeOELJOOpBLsxKMQzvV7yyNOqP6wlI6/d1jEVEEAiKAzeGzhu+6CjRc4b8e0Vs08E7ezTlQE3Z79W8zcP8ew7LsmYbqeks9PCTe2vC0jHnQcvkK7wpcsFA4rFBPWfc+kN0bxe/2wVqvyAlRg3atg8FxoGS2/hkUCDKCN4fEfg8OHtuWzna1aLTW5tV0o/Sjows4LeH70OqZqkqzlfUW04cIaCLWMbZfRqEjyUa8AuIwoBRJzpLvst/od988fnVcnv2FrsmOAvdodAJ7PrJAjfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqIvrAMaBzzy6M2WhM+KwX4W2zK2mgtuUCVDH4Zt6XY=;
 b=M3wMJmlw9cjwhlYNyDcP6tCaLMVolOUz0LtOjeU+yw6Io3nutPHs43cuLpOtG4SYD98kc+0Kyn+pEhJpUr5Mrq2u1oDvORfm3GAPXVPv4O7S/QLeeWwNErs8AjrKt8s28ZBZUVZD9mrvEk/Kkv/FpPcM/Yngx7P0ccDuJIiT7sg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB7411.namprd12.prod.outlook.com (2603:10b6:806:2b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Fri, 10 Feb
 2023 15:22:05 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 15:22:05 +0000
Message-ID: <c64bb7b8-ab50-78c3-bb56-820ce96a1e14@amd.com>
Date: Fri, 10 Feb 2023 10:22:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amd/display: Remove duplicate/repeating expression
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <Y+YYZ4SbMQBcpTZP@ubun2204.myguest.virtualbox.org>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y+YYZ4SbMQBcpTZP@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0261.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::12) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 59cae427-a75f-4d59-73dd-08db0b7a9130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61QA0uw7J0ocjs+j4m1H62sJSbf6XbJe6brzG1b8ymGvGWsaINd1CqTjDShMxVg5mjeQZCQxMu7H6h6VgDI5+8dOqiNp8BfeuL6qGX4bntA66o5WqpOYkLdPbAiDRBgvv3dxr1hqO5ntRHQm6o7QqytyThQWkpUmHDggUkb44XxE4+cqdLXo+3R0RDI7MGsGhxSlIXChPtOyOnWxBgYRAbCwpmzFvqnsOHd4ucuxz3r8Sa3ZgdgJiYIANe1jukrHIEicHSSDkC8NPELm5M6W3s8aT7eiKz37bPSruMLOyYLf44cjSXwAKUyjF+igzI7zfPr3WcsrZs2hxrlfbfHAv/JqZFJ63RnR+aRKLQ3F2Vij+pKAG8rEdCSuYg46MwY0/ufPneSy5JYxDqPDSrObnNKBDjvMvy5zNo4IReDjRvnvBzrYmztV+zG6aO5+UCFnp8gjR/pqk100sQNCsj7Pn7aaCd8ym+p+Qwso9sWgWnsxZPk91DXwxW3zJsuwTM2waLqj3Ms+ie2tuyjJGk/WaS+HcmAEqFSv6x/rXuiYAxg/L4gCZPR8nlBHK/G4n1lXuKNhA/b1DIdmos8Jop2RZHh8ruHfNu3SFvwT3gVvvxxnAGDKxtUD88R5st6EITJPFUCyExC7HzUCsTmtWeCauGhlMrCM6CwPQZP8ecfjQaSaxyG4/09ldswlmZfvhT4eQyPFkGxhrvxyK4OhC5IGVhvTsZWOqsEYE6j+V9X5av8RWTVFWT0FXYtBG8VlpmvA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199018)(54906003)(110136005)(316002)(4326008)(8676002)(66946007)(66556008)(41300700001)(66476007)(8936002)(36756003)(31696002)(38100700002)(921005)(5660300002)(86362001)(26005)(6506007)(6512007)(6666004)(186003)(31686004)(2906002)(53546011)(44832011)(6486002)(2616005)(478600001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTRzck1US2lsNUpQZm4yRDRHTkJiYUJpTlU5YkpXV2xJSTF3VUJPRU01Z0hZ?=
 =?utf-8?B?UjUwZ3RrZ09lL0VqdU0yVXc1cUEya2VYTGd4RmhjdGV0aUZqOHZTRWRoSFdP?=
 =?utf-8?B?ckhUQkRCUFJEZHpiMUJKdkpranR1N2ZtZkY0clo0Q0M4RWZkeXNRUXo4VTJv?=
 =?utf-8?B?QkIxd1Y5OVJtTDdmZUoyMjNzWHF6M3FNQWVPVnhSQzJxYkZNTFFZK01jWlJ1?=
 =?utf-8?B?bmpSeHhXY0VCOGpNSVd4ZkxZT0pqTlI2ZWVwdXQ3K0tNSzgxMXRjTzdpREtF?=
 =?utf-8?B?WDRxWHVybXZxSWFWS1lsS1pxSTdjSGdheWJNUjZUNDFzWXZqTUN6Mm5lb01p?=
 =?utf-8?B?ZVNFVFNiUmVKN3FaNlF1ZlJRTWU5MTMrZHNNSCs4K28wSjNMK0c3MmpsaUdB?=
 =?utf-8?B?ZjgrQWErWEJyMW93akQ2WHNCNzQ2SHV6aW8wU05ISFVKREhwa2E5N3Z2UEJn?=
 =?utf-8?B?dkhkLzNQemJJMkFsNit2dVk1MDFjZk5oQnA2eVh2NXpEa3JtbTRUZGVnVnpn?=
 =?utf-8?B?VlIvQTBVOThnSDlCYjkvK0xOc0p0ejU2ZUwrOFQ3VE04c3RBQUM5dzhZazBh?=
 =?utf-8?B?QkpJQlcwZUFwZ0JZbm5RQ2tIV2FSSnhXeEFUWnpWSVlTeUp6UTg4ZjNhUDJq?=
 =?utf-8?B?VXUwTW5HazF4aXEwK2IxTjlpOTUwSDhnNzIrVmtSMFNSQjJIOXMyNTQrR1RR?=
 =?utf-8?B?OXJYRVpJYTE4QTB4ZkhXOC9pMU9RY3MrRkFzbnJBOUEvWVZmLzRvSHdrR3A0?=
 =?utf-8?B?L0YvemxrRDV0SFhCamJWakRKZkFQSXgvZlgxbGVHZ2FGT2F1eE9SR3RXNFZs?=
 =?utf-8?B?UlRTVllZZDNzb0JPQmhUREFPVjZLWXpqWWl6ZE1Pd2J0UUozMVlLRnJFaVRm?=
 =?utf-8?B?RzNRL0lWcTY4WGxNUytlTzNkTUVrOXNSY3V2bkNlazNUYUZDS1NhWHZDazdS?=
 =?utf-8?B?bWdTREdtTERMNTNuaVlwdDdWVERscjFZK3VVUmdNZDZ3ZTZIR3J3NHQrLzFK?=
 =?utf-8?B?OHdhMm1aM0drQk5wQ05KaWYwQnRnVktUK1h5ZVUwV0RueXYveUZ1VlhjVzAz?=
 =?utf-8?B?U0tueWFkcGN6bG1NbHVpdVdrSzNISTRTYVY1ZmdsbjYzRy8rM0ZOeWhkQlFD?=
 =?utf-8?B?K1ZjbVR6UWYvVEJaM09oNnl5US9pdEpKVjhWRm13N3RGdno4Yk1EZVhTTEx0?=
 =?utf-8?B?NWtPNklWdVVOSTNCNjYwdCtxSVpCVTRHdVZVZGdGcXpYd05qYTFLb0grRksy?=
 =?utf-8?B?Y3NwR01uVnFvSEZXWEJ1dXpIa0o5WDFpd1dJajZSMFJxeWhMbC81NjhJZElz?=
 =?utf-8?B?aFRSaXBXTFcwQXBnUnh0UTQ5NTRlOTlmd2VOYzhuRmJLbUpkV1NqNHNmeVFC?=
 =?utf-8?B?OWpzYkZaR2s0QnRiR1EvMmJKeDlpSVh5S0ExandUbEFPV0Q4cURXQTAvWnVI?=
 =?utf-8?B?N0JwQStNZVA1aW56UUZUWFVuUWJTakFxc3U4NTdFQVk2dEVjMFQyclhXOHp4?=
 =?utf-8?B?SldhMHRsSzNTcmFuT2FSYjg2OWl5b2hJUE1uN0RubGMxYUduL1hvNG9veitx?=
 =?utf-8?B?dW1Eb2p4Q0hxTTE4b2xCQ3dOSU9BODdDSjVWamRYREtFNGIybDVtWmk1SnFB?=
 =?utf-8?B?MGVPeVFRaHd5MGtGa1pFNUNqaGtGSmxJOGxCWGNpRTlrK0ZIcmJ0NkZnR29x?=
 =?utf-8?B?NW9xRllKdWNOcHpjR0lRek4vNmlFK0QvSVZJVG1tN0hITVFWTFpja3lOTDlH?=
 =?utf-8?B?N1owMklqTmlYcWtBRlJJcVFlWWRDZkVPTk9vRnMrMXZsckJhM21KOENvRjEw?=
 =?utf-8?B?ek9CY1RDV0orcTNydGFQNm1haU16TmhLSHJacnI5Uzg3MEhlbUQxcUh0WEJK?=
 =?utf-8?B?Y05QTEVGSFNMcGNXcWRFUUZ4TU1INU1RejUyT0kwL0tXTSt5MmVsRllZQ3Ji?=
 =?utf-8?B?OU9QbHFIQUtxckpvUUlTQWM4LzdpUnBmK2hmak5wN1pQRUNFZG1veW1QTVhS?=
 =?utf-8?B?OHYwTVN6T3ZXcFZHbkFYY0Y2ZzQzYVBzbUZlTlZkL3NuZjRCTDduUjNJSkFI?=
 =?utf-8?B?MlhwSWgxcVEyYTdOeGczT29Nc0pmR0ZMZW92dTU2Z2IyVmM0R0ZPbWZLY3l4?=
 =?utf-8?Q?I0dc0aEoYUHXNMNjphv4D2YWb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cae427-a75f-4d59-73dd-08db0b7a9130
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 15:22:05.5968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5snxdU4WV4rZZcQv6joEMWl2xEVTfzY20jGs3zzb7oCTbxzalFIYCzVw19B/PUohePiPU5x7pSuq+DUI6HDXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7411
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/10/23 05:11, Deepak R Varma wrote:
> Remove duplicate or repeating expressions in the if condition
> evaluation. Issue identified using doubletest.cocci Coccinelle semantic
> patch.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> index 61ee9ba063a7..6576b897a512 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> @@ -51,7 +51,7 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
>  		*BytePerPixelDETC = 0;
>  		*BytePerPixelY = 4;
>  		*BytePerPixelC = 0;
> -	} else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
> +	} else if (SourcePixelFormat == dm_444_16) {
>  		*BytePerPixelDETY = 2;
>  		*BytePerPixelDETC = 0;
>  		*BytePerPixelY = 2;

