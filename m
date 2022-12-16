Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E3164E5A7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 02:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A3710E027;
	Fri, 16 Dec 2022 01:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B1010E027;
 Fri, 16 Dec 2022 01:34:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1Xjzm6BXsS7qT/kjC+gf10J/BnaGvagzBaW6ALOsrtHjxp271Uo8+6wOsLhDpw90Ep0znQG7m+8pguBEwUc11YscAYHiJbYfCH1dC/4jofuqhXR4XV66gbTXikQswerhnFd3PbRyvdhkLcri2bxN07AMi4sWNH3mIYVrh3PM91C8U0uRTRmmN3xc5cVxQDaDueN1/tUDLK9PTJDhuY5K+EdyXanHhStkwk1mFA9nryi8Q7GRrKtOFArbS7mu25YQx8tat4HHW9SxLiC1qNPTxoVNl3Yf+CvYVZ2Htk2PakQCZOwSdaR5hzxt+GTQtJcCatFuLcpj/dpE/p4MKD6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCBO54r6EESoPK2+zNyIpQxkL/Ydxb5nHx5q5XEza2o=;
 b=hRxqS8iwe/X3wIh9w9GLG1rwfZnN/UuhHHK8ugBJS2IJythJrMbVpF+FA2HqI6ITvqT4Y46Ce2Ihn5YTXULAhfXr0Nz+uVYECpv9MZOX+sCqXsdHwn0EcNRODUueosvITix1TMZoeyRDQXT4WtJuntiezOdgs4LlxCWh0evGkpHZVWWkkBhCpWiJpQaMpZ5zEdvPcTxONy9CunwEDBs7bkfZRn83vXcW08A9mFVP+86HPuGMa5U3hjWLyXLjNZrLweeSGyOKK3o/pSpEIhZ9NcRUih9jtJvQye3efDAfhDNgSgrd41Nng1QVviZqhTEyOOqL7N43xMkgdq/vKCvzng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCBO54r6EESoPK2+zNyIpQxkL/Ydxb5nHx5q5XEza2o=;
 b=ERC7vSO+JyahXaPNwLpdXcYWyD8Blrx0THjV8gB1EcUoKE2tUnfjIa8HHGf3STqi+zRCIgDzz4WV1v2HP3gi8Frpwyej5kJ29/ylz3eWy0fsIn0MGXoGvJgcaMrSaCvtom8tWQy6xpYrwLuyH26opfUbUDZTdgpNq2xiX781Kbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) by
 SA0PR12MB4414.namprd12.prod.outlook.com (2603:10b6:806:9a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.11; Fri, 16 Dec 2022 01:34:24 +0000
Received: from DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::edd2:a5a0:32e4:ae3d]) by DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::edd2:a5a0:32e4:ae3d%3]) with mapi id 15.20.5924.012; Fri, 16 Dec 2022
 01:34:24 +0000
Message-ID: <96362c49-f087-53b9-a9b6-dd6a90dd9621@amd.com>
Date: Fri, 16 Dec 2022 09:34:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RESEND PATCH] drm/plane-helper: Add the missing declaration of
 drm_atomic_state
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
References: <20221215030146.1142523-1-majun@amd.com>
 <5960ab10-4929-1e0e-32a3-2c60bbbca37b@suse.de>
From: "Ma, Jun" <majun@amd.com>
In-Reply-To: <5960ab10-4929-1e0e-32a3-2c60bbbca37b@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::15) To DM4PR12MB6351.namprd12.prod.outlook.com
 (2603:10b6:8:a2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6351:EE_|SA0PR12MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: ffecb941-d5d4-4c8d-e128-08dadf05a9bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/yHHgxzZl6+YP/LsCzAcc6FpssCIkQkXCQ07IVucHnTYreQhQiVDTa+41F+jHGwXrI2u8Ziqea7y1Cb72oxJv6AtWZnQ8hRxXu0fcuwFaYTlhZp3QBYrYewCHFRjaKub4cNEbcyjRdzQDfF/J2fWo5c2MqNsR+YiKjNjNl0qazIN3VkQ75kYEMhbX6GJtFtNZPddcHB+CFZeDPeIHqfmoN9S/DVy8r66MRPmVZpFiKKINH8LBGorKw3TDjqZcNksl33A8UCOauOR5quQg6L7rg48In1dpOxALv77waiGVzLSzkzckTAaYf/xsUbAhN8fUkZFblcv6kphtgY2rtsrk+E3d1VmaZwQBB1IT49igTH+xB5j2wvguKz1MnO+rrypplfCxZuZWGsG5+QyCij+wtWS7kKUEtyfmXXuJCIEhYRuctO6ueeeOEDkoyhKL2yRlBHFupJcmUt4kZ42CorohmDaujCMqht5piV1nwlPFjiXReMuhvDB66JoQsoDKQUEP9SM8328VfDGxeqvIn95fhmJk2o5OsdaNz6TkIXAfe+6ZjKM3fGkp7npjVc3SGUWFvuq+pU3UJv9MBZvLdu7n7o6k+7jHtNuIUHukB3iOgkfYSUnULX0AGLmLcIxfLNGa4nVLl39nHbnw2yErx+sIzdMBQNVty7ZA0I7U+mtKfkzVU5a2G5cFP2an4Exjf+Ou6crFVNzWFufmlYvZx4kY6gf2DPHtFDNmnsX8fItw8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6351.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36756003)(478600001)(6486002)(53546011)(6506007)(2616005)(6666004)(2906002)(31696002)(316002)(31686004)(41300700001)(8676002)(186003)(66556008)(83380400001)(66476007)(66946007)(26005)(6512007)(4326008)(5660300002)(8936002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1hhZXZXanFCM2JyME1mVHFhcmY3Nlk4cnQxWW5YY3N2anF4QVczL0RpalVw?=
 =?utf-8?B?eU5XVXY3Tmp5TUN2aCtVMzR5ZXhyUVRUSHY3K0VqRHMwS3Z4cmQ2TStBWDli?=
 =?utf-8?B?Nm5QNUFNdDZuV2ZHdGsvdldsdENLSDBCc1AwRWJXaVUybjhtVEw2a09vZ1BM?=
 =?utf-8?B?VEFtQ01FTjFzZE1Ic29wdklqbGUvakp2ZWRBK0xrRDk4Szd0QlFmd1dGOGUw?=
 =?utf-8?B?WGUxKzJ2Qk9zYTRpcHdJdnRteEhQemJHZG84RExHbWgvbEZyNXp5SDJDN0dp?=
 =?utf-8?B?M1FzOVZGSHhzS1VwUGU2dHJCenRJVVo3R0J5dzJlRmFEWTJNaCtyd3hDVmZJ?=
 =?utf-8?B?b2lxQ0ZhUE5CZm9BeVlweU9jeEQ1djIyaGNqWEpTV0NUUUdBeWZ4OSs0ZXZ0?=
 =?utf-8?B?MFYvRllNeEUveERNN2hPSmJubndXb0pWTk91TFlQNkZqVVRDRXlPSk5lc2ZE?=
 =?utf-8?B?OU9NOFhPWlZqNkhNa0wxRUtBdEM4MTU4M0tnclFWSVBYWlRRT0FORk9YRFVH?=
 =?utf-8?B?S0RtaDcxVi8xZFFsOGhyOUpMdWpjUEcrZS9mUnEyNVNvdmkyUkNvaURBendO?=
 =?utf-8?B?Q2lUc2FLS1NnOGJBWEd1YXNBTU96SGg3RThuYWN3dFcyK1pRbVVyVi9UQndu?=
 =?utf-8?B?bTc3QVY5amY0Ui9rblI5YUIvQ1dHT3o0OWxtR0x0akdzOHZVaGZWMTY1RXE0?=
 =?utf-8?B?T05ZdUxqTGtvdjNBUTZmNjV3U0tSSzArZktlSGltYzZ3WkhSZWowNVU3NjNi?=
 =?utf-8?B?eXQ1VTM3VFllNGV5NXFxUy9MYm5UWk5UVW0xbkpncFVWenNRTkdHakpWM1RW?=
 =?utf-8?B?c0lNNFVmdDZoRmY5eGJLSnZPbXUydXo5aFJyYXBtN0Yrb3FvV0lLMzBrSVlV?=
 =?utf-8?B?L3cyNFUzVlcxV1luTFZoUWhoMVhYcWJnWTVaNmlZeGY2bzBHYU5BbHlvOWp3?=
 =?utf-8?B?YTBnZkRCck5QbjJrSVlFd283Ui9pVVh4WlhMbldLeEx2U3FRVXN4RDNrL2Fi?=
 =?utf-8?B?NVBKOCtURnkxRDdSeTg1dUZzUjV3K004TUZ5TWdibHNmSnNVRTRlUkp6Wm1p?=
 =?utf-8?B?Zy9KWkEyd05IZ2hQUitvMDB3Z2wycGlMbnpESEc0Sng3U1p5OUlMaUJZUk9K?=
 =?utf-8?B?QTk0RGpPTzVpYkJWNkVaS2Qyb0V4K1JEWjhnVjhzZ1JiVWx5WEFrejFMYnpU?=
 =?utf-8?B?eHljcHdhOGVtc1NUdktWU2ZYeWEwSi9LOE53UHJQRDFxcTJZS0xYcnFoQ3lJ?=
 =?utf-8?B?TlRIT08wakpuREhubC9vVnQ0bUVJYlN2OUVncGU3SS9QbUZmRndLRUtQSlRm?=
 =?utf-8?B?THFkMXJqRENicGE1T2g0WU5BSU4rTm5IbW1xL2l3b3JPcGd4elkxRTRYL0c2?=
 =?utf-8?B?YjJZalBwUDl5eTlzeTJ0cFJMYjduUjlHSzk2b25SV25qdmFhWUloS1ZDZXZi?=
 =?utf-8?B?VkRhZWJpSnNXeXoxWE5yOGRQZVBuMm1xcVJ2ekE2Q21UaWVpdU50YWtjMEdo?=
 =?utf-8?B?V28wa1ZMbnpYcGUvaGVGZ25XeDFTaHFqZlNjTFVjWXV2LzVMcFFwYTlWS1V1?=
 =?utf-8?B?azZpN1ErS1RIWDN4bms5bGZZQVlGeVdERXlRQ0JsQnRMRUpRYkREMHVEaVpZ?=
 =?utf-8?B?WWk4ZDRVZlpnTWNHdUZ3MnI4SEEyZmxrTjUxeFBpTEtiOXFsMWlWcEFCK28v?=
 =?utf-8?B?OEVabStDRG1raDJXdFQ4Umw5Yy9McENzQ25ZNytnbm8xajNScytacDNKWHhq?=
 =?utf-8?B?aXRucXl3TXRVaWVtVmd2ZGI0SzlFQlNQZ0FkSWVQRk45dk1nQWsyTzVRMDQv?=
 =?utf-8?B?Y3JaWDhhZkpmVE1xMHZmczluWDk3QTFxa0Q5QkNhOXBZS0Z6RE81bG92Mlo2?=
 =?utf-8?B?eWdxTjFQaFJGMlgwOEErWFF4K3R5SmhEQnVPVk0wMmY1aE1ydktYb2Y3a1Jh?=
 =?utf-8?B?bXdMMGxhdlRQVDZDLzBJTmsrUzNmbkxjejVrSm1tUHp6TVYrQ2REWi94aXZ6?=
 =?utf-8?B?UXVLemFMNzEzZjk5UG50VG4wRnc0MUR2aUdUMlBCYWdOT0lrNlg4ek1SRldk?=
 =?utf-8?B?cWZTNkZqdW9wUUgvUENVc1cyTDBnR2pSaTZVdVBwVThLTEpQa3JYTnRuRzBo?=
 =?utf-8?Q?NLr+T9ffKfg5ToEMtVZGCL8Sb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffecb941-d5d4-4c8d-e128-08dadf05a9bd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6351.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 01:34:24.4470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRUx1fzEZ38Vvn7OJaYZFW6aS/+rQ5ToHyvWh9MefK1ymasZg1I5DDFJvi3waPjS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4414
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/15/2022 4:40 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 15.12.22 um 04:01 schrieb Ma Jun:
>> Add the missing declaration of struct drm_atomic_state to fix the
>> compile error below:
>>
>> error: 'struct drm_atomic_state' declared inside parameter
>> list will not be visible outside of this definition or declaration [-Werror]
>>
>> Signed-off-by: Ma Jun <majun@amd.com>
>> ---
>>   include/drm/drm_plane_helper.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
>> index b00ad36cf5b6..530f88176db4 100644
>> --- a/include/drm/drm_plane_helper.h
>> +++ b/include/drm/drm_plane_helper.h
>> @@ -30,6 +30,7 @@ struct drm_crtc;
>>   struct drm_framebuffer;
>>   struct drm_modeset_acquire_ctx;
>>   struct drm_plane;
>> +struct drm_atomic_state;
> 
> Thanks for the patch. Please sort the forward declarations alphabetically.
> 
Thanks for review. Will fix in v2

Regards,
Ma Jun
> Best regards
> Thomas
> 
>>   
>>   int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *crtc,
>>   				    struct drm_framebuffer *fb,
> 
