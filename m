Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1818470986C
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 15:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CCB10E18E;
	Fri, 19 May 2023 13:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4599710E104
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 13:37:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI4BH2qIFAZP89CJXJY7p1e1kgZuH3z2WCkQkjQih3uSIzcELK7qnMdCJAtGMoH/QRnjDzq5maeLc16TJsu9qtlK6rQ0SBBBDNe/ZiQmMFH5wJ5+6SqwzYEGGTtRr02Q2DpCMGt1spy5rzXGd18cjtZHCsISVf5Sn1Zke13DHDQ1pBuEeXgzcxcamnIMAzXMP4SP8pLMGQNNwDYhMxVVy8F93iwcA6gHSGIteM0qgHhy0XmWdZrX1hHcmWfQtMv2RxznKqggBeHAIuJ48qZzq7yZbIOv332NE/6+xNBstAd/ZEQg27s1DWlvGOv6A+VvlXwtbSwsbkJWCYCM6qYpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuGC7Fke+W0eFI3eNU4WgqJ79fFNvanzYmZ3IzVS7fI=;
 b=O0c8uuk0SezLU5doARuJLyFeY/roikSJCi0MFtPBSyexWSZ+Gqj5bFAXybq8iZqI7066VN0fSPWP0kW1L105Z598GSqdn5qpyo17rH0jd0BPNkw+gVDQ6/wym34DMDNJNcN4qrnh/NxI0fS8zeyJlJhGLUUwX+wQBHSmav/LU0nFbjHy6VzO58rhXPolyt+O+lgdCv2Nkq0o/cNWI7iOEfaJuxze88pXexLx47BcMC0JcZEZ9f1L0mM43+l68yphO/OZY0k0RW0FTRbqRDdm53EJV1S0Sfa11MQjlp7G1cA703GwGRCrPsxrG6NjnmQ7gwSh8ECNwUuAylSdL/z6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuGC7Fke+W0eFI3eNU4WgqJ79fFNvanzYmZ3IzVS7fI=;
 b=LvBgUlWJ9dbMitxb849jQQhHzCxuCQu7F7euI6htOH34WDE3wI21Lp7x7PNgH1REdL6wKLD22Hwb266NZsg5oMrJO8JHWjQVd5tfpH8CdVB5ACQ9/J8qATpAHTAcV+yy4NvZmV5PBsxx/GI67e7kR+Fnb+/0uAftHcdydLosfi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN2PR12MB4453.namprd12.prod.outlook.com (2603:10b6:208:260::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21; Fri, 19 May 2023 13:37:10 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:37:10 +0000
Message-ID: <570f1771-cecc-edf0-185e-f6f76b681684@amd.com>
Date: Fri, 19 May 2023 09:37:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/sched: Remove redundant check
To: Vladislav Efanov <VEfanov@ispras.ru>
References: <20230517125247.434103-1-VEfanov@ispras.ru>
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230517125247.434103-1-VEfanov@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0103.namprd02.prod.outlook.com
 (2603:10b6:208:51::44) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN2PR12MB4453:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a082b7-2e09-4b81-ca21-08db586e257a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ibdN0vJtss1ZvgLN/Z/uUHKY0lo4COD4k+4HpoD9g3cn2S5DOxaHC0UVPa057jdgnxXFgCRp8gwLOpdV1bMl3NzLMdV+gEqyAEp9PTrTjHXZRTzEfddbq70kSzWCPEWI76uT9xISR+WLH8/8J/IW+Y7xNjj9f7eeOPEmUiXrq0JRAJBawvYYuksiGgnswQ8Rp35TpnAahvQADPzzyi96PGf60QCSDLBlzNFOITO5Sub9ZQd1CVyJxMdQeVy7LtowHO8KQFfzkwJo0H6dBVt9RPMIwXtMYTnLXwG3O7H4A9bcVOgfOTzL87t1XXipNKdMtoxecMg+AmKN8mCR9ZC4U3YYZn+UfUAKzGm7lSiyiMP6Dq7eUnz0caBtEzCpZ5JGU0jBKQClzV5Ohs1hbt9SM5fajWN0Aro+Lk6fwcx1ikJ2xmMFIdr2o5Im72p0DAaj4K5Ic5dlj0MLJBcDGYSC+GSdIrUGwrSanXGYsiLTaal5MstzGAwN/xzln8BfO8XnC2bWnit5b2h6pE0cisb65yXcghmBVY6oYgVYppH5Htr0WXf9F0ib/p+GhKeI3fR0SAggBtBCWRHTCZPPe1o3ja6WdSF0kU7QH3YoyUhNFRWI6vuVEGTg5oIimt4XCa2ElAxpBx2iALJlZxJPDGTgcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(36756003)(86362001)(31696002)(54906003)(316002)(6916009)(66946007)(66556008)(66476007)(4326008)(478600001)(6486002)(8676002)(5660300002)(2906002)(8936002)(44832011)(38100700002)(41300700001)(2616005)(186003)(53546011)(6512007)(6506007)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFBqTkVnTEV0aXhsV3cxSFNQN1l6eloxcUV3Zm9GOWpzU3o3VXFYZ1Z4Rm5X?=
 =?utf-8?B?U1M5ako0M2h2SG0rZUljRXREYzFMd25jWDdSVnlXWVNYak5LWi9xUmFYVGlI?=
 =?utf-8?B?QU9vSS9uVk1FWTJRVzVadUhLckllYVN1NnRFaDNOVE5Vd2JqeUs5VDZZelZu?=
 =?utf-8?B?TkpuMU1hZ1gzVHpFeUs3aVRvNG1WZFEyaWhLdmt4RkExK3pHN2lYeFVjR1JW?=
 =?utf-8?B?SS9WUlhEbkJpVEhFRkFUMUU5WHM3bm50Z0lSd1dIdFE0MXZUREVuU0RZL0Vr?=
 =?utf-8?B?cVJ5NzRrUWFFa1MvRzFBSklsN2xmdXFwb0IwNVhzNXZ5dWo2L3Q4a3V2UzJJ?=
 =?utf-8?B?RHMySzlVRldlM1d3OUUwbzhIbXBFbnlORjdCTWRabnU3Y0dxM0l6YWFVeFda?=
 =?utf-8?B?ZWlVejhNMFkyR0g5WDRjdVVrZmdOeXU3SHdrVFIwQWRwdnN0clllNDRtakZC?=
 =?utf-8?B?eWFSeThnVzdnQzdlMytVTUM4MHdXeEQxelAxa0V1RFoyRTF0ZlM4V0xUUFg1?=
 =?utf-8?B?RkFJOEViTlFiOFRHdExIeXpvRDIvZXhaTGNNa3p2bVIxVEtpbnlYWW9sSk5F?=
 =?utf-8?B?OVRTaXFkeHNSQnVVM2pwYUlSZDAxZGNjRjBaR0hoK2huVlhGOTUxaXNzZ2d6?=
 =?utf-8?B?TThjUlpOZHZ0M1Urbk1HeVZsRG9wOUJYb0dWSFhuejZzR1NWSnlFZlMrbXl4?=
 =?utf-8?B?U0ZFa0t6UUlOc2NDUER5WTBhWUQrUUc1djZta2hQTGJSdGZQTENPazBtVUs3?=
 =?utf-8?B?azBhNjBtZU55NlFKQ1RPYVl5MEFINjlyeHNqTFFxWjlSUGZ2aWw5dEVFeGxZ?=
 =?utf-8?B?LzZYU0dsZ3BUNmVqaVBmMkFxVTR2VG9EdEpTM1NaVHBleTE1NzRWMXRPYmRR?=
 =?utf-8?B?OG5vQ09VTXVCVXJFQVVvY28wM05xc0ZCV1lWTXNvRWp2RDlGUHdWb1JMWllP?=
 =?utf-8?B?TG5PNHdyaFFCbTZrb2VwWWFMT0lvYkNTSWxUYVlyK2poTzlyZzhTTEYyKzJ0?=
 =?utf-8?B?WG1NcFN0Z1Y3SGRTc1dzWlV6aHpsakpSWG55ZlZFaGRsNmJ4UDdQa25hTU1x?=
 =?utf-8?B?WHQzcE0waUhadnY2cnhYSk44L201TG1UdzhKWWJ2ODJqekNRUXFSRjFjMHRO?=
 =?utf-8?B?Umt0TVY5RjBuNXR4d0o2V01ia2NzSXI2OGVQdUlTSEdrOU52YTZ5RE9lM0hZ?=
 =?utf-8?B?S096SURMTElzb1paMkdxZXpoUVVsU05wdE4yT1M2ZGlCa3NEQ0IzSDZnVGF3?=
 =?utf-8?B?aWlKOEpMYStrLzBNUHBQUEkyVkJaUHo3c0JLc2dZbG5QZmRBTVZiUzlQMU1Q?=
 =?utf-8?B?QUZSU2w3cE9sVzZKNDhOZ1pWbEJsbHk0WHY5dEVPMTFXZHgvWE1hSys3Rkhi?=
 =?utf-8?B?dDRoa0J0SDFQdGdXVmMvdDgveFNOdytWYloydXkrZ2FKam5xVEQ4VDNPbm9Z?=
 =?utf-8?B?ZUtmRThNa0cwY0R3OW1ueUZudmVqdmtDcE0xd2d5ZWJWaVppSmFGN3FteUhB?=
 =?utf-8?B?SlFzdEV0amZhVzdCT2dHUTRRNjhTZldUMGFLR3NLdHJHMDY3Y01tWFBOV2ti?=
 =?utf-8?B?bGwyUHJEMW5ZU3NlejAvcmxOTUs5NXBETmd4R3Zvd2Z5bzcxeFByR1ZHc0wr?=
 =?utf-8?B?M1crTDFLcm1zSkRUMWNET2xHV3dsTHc1UjR4K3VpeUppcFlHQmxSMzR0SGgw?=
 =?utf-8?B?eGVSMUJYcVB0WmtiNlZpeEJlVXRESDlHaXIwc3FlWWdheEthK3BkeklnYXpH?=
 =?utf-8?B?dUg5KzBVdE95YVFQdktOUnphc0hpeTBwWUd1eGNYcDVGMzJRc01jcDZNTjVS?=
 =?utf-8?B?aWJ2ZzloZEY4UUVqaXRQUEtSbUxrKy92blJ5ZW96dTJKWTIzS3Bub1I5R1Fp?=
 =?utf-8?B?dDVqZy8zZVhuQVlzWXo2c09FMUdHOFdJcVJPNUpHZWJVeW1IRUVlRUtZNWVn?=
 =?utf-8?B?aDZwVkNEbzBCaEovM3RBVThyMlFpUUY3VDJvZkpTMVNHQWNTWlQvSG1XMU1z?=
 =?utf-8?B?UndBK1pMLytzYkEzUVpXMDZVL1FDZG5Fd3R0QjFlY0ZHWTFWOVA4aDR0eDMx?=
 =?utf-8?B?QlBINzNJdlpidlgxSVQwVnV1UGhxenR6OXBoeDVKc2lEWVh1VU9pRUJCTzJQ?=
 =?utf-8?B?eTZWU0VTdFZjS1NISW45ZFMveUFabFd6MjZKM1IrQVN5c2ZTM2p3c1hURy9H?=
 =?utf-8?Q?ab+E0d85lusR2kC18PYR+BhBmD6h3gMZ4Tu+Qdj5Gz9o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a082b7-2e09-4b81-ca21-08db586e257a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:37:10.3505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yC3f6joJuHA4vWy07GdDDCsbUyd8B3yt6EkuzSy8/38QoWgbpIle2evR/nZMj7LA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4453
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks!

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Applied to drm-misc-fixes.

Regards,
Luben

On 2023-05-17 08:52, Vladislav Efanov wrote:
> The rq pointer points inside the drm_gpu_scheduler structure. Thus
> it can't be NULL.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: c61cdbdbffc1 ("drm/scheduler: Fix hang when sched_entity released")
> Signed-off-by: Vladislav Efanov <VEfanov@ispras.ru>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 8c183639603e..aea5a90ff98b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1141,9 +1141,6 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		struct drm_sched_rq *rq = &sched->sched_rq[i];
>  
> -		if (!rq)
> -			continue;
> -
>  		spin_lock(&rq->lock);
>  		list_for_each_entry(s_entity, &rq->entities, list)
>  			/*

