Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E0B7C7837
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 22:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1565310E05E;
	Thu, 12 Oct 2023 20:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C638410E05E;
 Thu, 12 Oct 2023 20:55:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRZ7IjLiCH5DscXs0TT7+CrNK/CkSlHD1AtKb0xqdPRMIfF+slVI9rhGJXwVj/qo4Qe/1ZzEk4ZnClpZ/wrcsa0gYk4ZClxDbJrkufglprrvAlGKSqQMnZWZRORxgahBkWpQW+P15QnWzMghuTjO+zOXcLeiMYOeZjDPvrT17jpIf7Zv2gnT0jfGjjmK4uGNRk1G+OMZ2aYKf8WtQAKqjzLzjn1uHmgMMoALcFP00+2J42oWJyA9+ocAMdqo46kX1lmEWeBRFW8mkVHidpRID8wbOzaQWMRnBMHC1lnXZdWSaQGjQfrxNOxF9mUgCXA4hlsopfpPOpUEXu7cIeDaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyfoL0iPlA8kM6po6qheBTyPjy6eELp2BQtX+hf99II=;
 b=ZW4laYztgGuzq0r07VqWuLHBLPnOgXB8Yo+nNskAHH6W3aFLHg1XwmAeFWHsJFyox9a59mtWO9Laos34TJsCVl/E9nXmSk0o1pVW5mwm5dzFAHftb3wPiHGC3W/zR3DwvTTvPN/dD1zLTYiKkSqrF0xDK4svoVnu6aj4iaB2/ANdRkyNxoCFqsq25Co+i2ggNpR891Ee7Q1Zieghoz+9Bb3zJSvTjXxay9DCvUOGg/BlhQhuKb7CFxe6aNlRcC+0TXS1276icWpzDFUBbM6jpbOG37/Jcx7gJjKQeaJmejAQSCmAzrbHDO+tldGfQKkZkGOaAt0dqVHJ9fCyjDPzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyfoL0iPlA8kM6po6qheBTyPjy6eELp2BQtX+hf99II=;
 b=fY2n+jky9vnlSQp1C0DBiOejQpzpAW0/87kVEYa8x58/1Geca5unHCK26OYd9F2ZU14YoDoerdGq/SA3PDE7q/t5Yx1/esoZDeIYPLJMh4Re4O2/dHU826dDbHqDYWR4h1cJvuN7fwqGaifspZ0ifVKttar8RCAJ7BnGnwrlEOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Thu, 12 Oct
 2023 20:55:29 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 20:55:29 +0000
Message-ID: <e8a7daf5-3205-4103-a02e-59fe415e0be6@amd.com>
Date: Thu, 12 Oct 2023 16:55:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/edid: add 8 bpc quirk to the BenQ GW2765
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
References: <20231012184927.133137-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231012184927.133137-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0272.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::13) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d89916-7f27-47f6-d0ad-08dbcb65912f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ocyDXaRBjSAtntAXm/F/IshA6bq3KIymvKLBn/ATvXRGUns+wq5atkbVTarwc/Jl7fwQ7S20zNRRR0mszdbuZWk8Ynvh3gqQlVPv7BR/nC2AVN7iO7hmdSjPcTwsnXRjBrPVbvJGhVI2NNKJ4HhqpgFAw37zyH48/Zxid2lEmW9wwJdj1RA+Unkj90YxIOoveeXg2aUSd76v9wrr6oI3+ruzmOJKcc4jYX7SXYYV9q/+SL7O+0bemTQfimzyXzixwUL4zVzjjLDaxS0S7+gU/JEoQTnaprjdSrKbXAP16v9GisFrOD9d3uUnrZDWxh4JH5sZppmbW65aLDb+csjJm7z2UiRWwTNEf0yribhdtA/U8pxNYO8FTBBUJde/wFUqO7x48Am2UMOnnXB+QNS+AjxlyPA/dkNL9Y3hJs9wXjhB/FeOghrHJf3mkN98eZXXm0yw7xvkCXNdKCfKa89jVcL2TcvpW+mFSqDgiLPGCB9/0o4p4HwlL4WIaHnvRKEVKswp0aH3xvAynEZCSiXC1inoPMPijOhIGlhRVQsmifYCNpBseDIVXVv45aLpHdXIohN80L8+5kZhAoqaMFOUbxoobXFft71bhmZQY1ZssJAhxvW1NcOTle0wHyEF1lBn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(6512007)(53546011)(6506007)(6666004)(966005)(478600001)(6486002)(38100700002)(31696002)(36756003)(86362001)(4001150100001)(2906002)(5660300002)(316002)(83380400001)(2616005)(26005)(44832011)(54906003)(66556008)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BqbXA5b0dmNVlIMU93MkdNcCt6QnV2WFh2NFdub29Xa0pHNXpiZTJtMEw0?=
 =?utf-8?B?MmZCejR5SjBoVkh6a2ovUVg0cXIyRmdubXVOSzRUOHJOcGQ5dE02RTZyWDNH?=
 =?utf-8?B?UGNmZHRNUXJoZE52d3BwcVc5RDNFRk5qT2V1Z0liNm03ZUV5ZWcybWhjekZV?=
 =?utf-8?B?bThEY1lFMlNjRU11Nm8yYkV0SVJBa01hZzhKSE44ZGhFMDZRNjk1VEFyWkRS?=
 =?utf-8?B?Wko0ajZyWGhsZlJpRjNoYUltUzVvWFZZS20rZkNYc1dRcEJjSmNveHdQaTNV?=
 =?utf-8?B?eDUwc0h0T2V0bXp4R0d2T2pQU1N0Qkg5WjdPU2R5V2VuOXNXaHEvbVZkdDZl?=
 =?utf-8?B?NjZkTmhLY054Yysxd1V3Z2ZTYXhLb1RmQXdRUVFQQ0srREFvbU1CWWJKdGk0?=
 =?utf-8?B?dDJNQ0k0MlVHRWRWTjZTQ3lWSVZtYTR0bElkeHhHZ0dKRDd6Rko2NFk0K25l?=
 =?utf-8?B?ZDM0Yjd3MTREWURGZUtheWJHeE5Tc01nakZTTWlYcHphWStmaE41MVlFelJM?=
 =?utf-8?B?K3ZoVzlDSklhUjRnS2dJOHFEMjVxbFpMVm9CdjVHMDFvZkV1TWxyWTBkaDg0?=
 =?utf-8?B?dzZpUDZXR2c2cENGalJnWk9NSkdPQTIyOTJrTHJwcU9DM0tEV2ZPR1g2UURX?=
 =?utf-8?B?TzdpMndGLzRwK29nQkRUQjRRd01aZnBPaWJWek9RbGxRYlJtWm56VXBoS1l3?=
 =?utf-8?B?dGU2cVNpend6ellkTnlLSWlLYTljQStXZkR4bmoxYVB0MkZWaTNGaGdkd2Jl?=
 =?utf-8?B?bmowM3FqZ1JaSFFNOWxQVFlrQ3ZIQmlHd2Z2SFpMYkNTck91bUFadzF3NzZk?=
 =?utf-8?B?cW04Qkg5dGxsZE1JN1REVEQvRG1JaTQ4c3ZUVW5FaXErSXVWN3Voc3lCcDZG?=
 =?utf-8?B?ZjR3VzVPY1B2Zk5ENDVMcFUyWWpWN2VTSVFJamFDSFdDbG9pWDZ3ejBjbDFI?=
 =?utf-8?B?cmswK0I1RVZzMkY2aGN3blBSUHFoS09HM1NTSmJQbkpqaGpZVWg0QXROWWhu?=
 =?utf-8?B?MXNzNmdTUHN0ajdxc1I3eUdrbm9hSURNN2FXdUNUZUNyN213VlVOVW82N1dQ?=
 =?utf-8?B?eExlR3Q1NCt4cjFpc2ZtQkcwR24yMG05ZEovTndEYnRsWTgvdGtaT0RrR0FH?=
 =?utf-8?B?cit5M0lOVDQvdVh6RUF4MjFjMTMrVjFtZ2RjcC9Ta3FDMGExQVhobGJnSHVr?=
 =?utf-8?B?ZWFTdTU4L3c4OTMzSFpSWk8xZFQyS1VEVkxVbmoyMlJ4dDJCQU9mOEM0d3c0?=
 =?utf-8?B?ZGViT3VuUGdWWTF5ODVpMTBJdkdZR2hFZG9WYnV5amRUZXZhTFBodytmcTZG?=
 =?utf-8?B?MEtsa1VucGJoQWM5VmdkQUZ5aWk2b1lrRUNYR0ZraVk3RHZnUVJrNzdHZDNT?=
 =?utf-8?B?R3JnNWZJaE9XWVlTQ3dKVng5UTRCd3FjZ21jQ24zZXVmODhkY2J0eTBndkJZ?=
 =?utf-8?B?bmk2bzJlRDFLbDJzSEFoamJKWGhBSGNBZ1ozVjhZenlSM2MzRjFYczlSTXJP?=
 =?utf-8?B?aEtBNFc1aVluZkZQcmppNloxalNyNDVRTThGamhPVm1RaStxRnl3ZDNBdkJF?=
 =?utf-8?B?QytYTWgramxGbzRYcmdmRFMzYjNhdDhMZmN3QmhxQncyTEFHZVpzYkU2dVBS?=
 =?utf-8?B?bjZBRFBobTMwNWIxRDlIS240SS9WaXBkb2JnbUpWY3ozTTlLWDNpQ1VuSUZZ?=
 =?utf-8?B?NXBjT3hwd3BnUmQ3eXVOU0RTZkl2NkRaUmVGNHhJdnBWWXdwcXdJTUIzbUJk?=
 =?utf-8?B?a0k3cldVanhzUTFoVS8xTVAwNDU4M3RrU3BZZG9rL2syam96aU1GSHBPeUxM?=
 =?utf-8?B?MWdNdGprSjVUN0t2cHJkbUhwdWVYN3VGeWRDdmtuSnRrbEJGS0tiQ0kxY0p0?=
 =?utf-8?B?VW9nK1B5cjN3SXNrT3Bqa0w3bCtEd01kMU43RkZGUnRndWlCUm0vY1FLYTJ1?=
 =?utf-8?B?Mjk2MXB5WXBDZVNvVDdZNnR2bGdhcFhQSkZKc3ViVUVxRzdJMkJNT29PSTlH?=
 =?utf-8?B?cmFHeVRsdTYxZWQrTjlRMzlqSHBWV3d2a1M4Zks5THdIR0NwNzQ0TmZxWmlW?=
 =?utf-8?B?OHZ5aDRsN1VYbWdXNmh0Z1Zqamx0TXJJK1VFV3huZTU4Qmx2c29PUThYV2JC?=
 =?utf-8?Q?wTaR5Pk/NuxGwJ1QmLDqCp/yK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d89916-7f27-47f6-d0ad-08dbcb65912f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 20:55:29.2922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZtzub8KISD5NFHbuo98oJl0i5QsHFrTPFM4cksWvGmXYiiHWyfoOSbew4n9ulLWtdt5Xo5t71CBIaIjp/NcgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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
Cc: Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-12 14:49, Hamza Mahfooz wrote:
> The BenQ GW2765 reports that it supports higher (> 8) bpc modes, but
> when trying to set them we end up with a black screen. So, limit it to 8
> bpc modes.
> 
> Cc: stable@vger.kernel.org # 6.5+
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2610
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/drm_edid.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 0454da505687..bca2af4fe1fc 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -123,6 +123,9 @@ static const struct edid_quirk {
>  	/* AEO model 0 reports 8 bpc, but is a 6 bpc panel */
>  	EDID_QUIRK('A', 'E', 'O', 0, EDID_QUIRK_FORCE_6BPC),
>  
> +	/* BenQ GW2765 */
> +	EDID_QUIRK('B', 'N', 'Q', 0x78d6, EDID_QUIRK_FORCE_8BPC),
> +
>  	/* BOE model on HP Pavilion 15-n233sl reports 8 bpc, but is a 6 bpc panel */
>  	EDID_QUIRK('B', 'O', 'E', 0x78b, EDID_QUIRK_FORCE_6BPC),
>  

