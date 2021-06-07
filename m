Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E520239DD83
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 15:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15CD6E8BF;
	Mon,  7 Jun 2021 13:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2074.outbound.protection.outlook.com [40.107.96.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407746E8BA;
 Mon,  7 Jun 2021 13:19:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAOSpVShLfqXFCFDtcx+IbvKvlhaCZVYmpQCfRsYwxHQoKSFU+ITEI899Tsbsw01cZ0HJQNJCdOg5v08Be2Hps/PWMDIDV1uzf4XOWUszg1HHNCQj47p96cF8puQrXZndc82Jf2r1s7kTQ40OsN5H6zJzJl9kgTTkcohTHQbvQbf5nF2wWIgVj0vDCvoSI1+DI/35xQNA8R3bVZqopKsM8NQ2Gq+LLlboGayaF8VU+HMow6NHNEpbOKBml3hD7UC50vCeDmRsynINwrh/0lIo72DYmWL1U2npxN2qnP7VJD0GQuoAd58J4xXfWF5aSHN9987gfT0KrwaHsp+X4fwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k61OScfR8zCh4liHmnVuexzePxIZHP5CkmGC6HJlvk0=;
 b=F0T2hqXuf5DrZGJ6aSmiTZI6VOXearEdh4D14+dKbU8/ImNgmur1kfBOyq2z8yQPtJnVwOyiYftnT8hROLgfeFgfab8zwjvAcX2OVPpHWClF7R0Zr14vrRHuUYTjh2CuKWua7qTMjlp+XgvpUs1ga5SOiTziiuhtViD1+4Pu363da53UgZSf3C8zDrSQwYXUxNkFHjAykrVdU0bOYozjXt4zmJ4lnv/uxfSfQNyiVNKEXaXFtGlt/wOSb4Tb5seCKqXuTbvdVZPDzJUD+1wfWC29RhfWfWLp/Uh2Z7rMuBdOj+Wn2Pz4Fxjjs6cY3+4JSC1CXyoMMXPwUskcOfosHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k61OScfR8zCh4liHmnVuexzePxIZHP5CkmGC6HJlvk0=;
 b=YmUxuzpHshazi/t1E/eaEL3A6zATr/Qi8McYSloSOixyuOWfrVQBKulhOgsBSMWF8pWqX7bZi5S4OFmo1M60VdFVJDlZ1IE9qC4ikRdunDW4sAc7nOBuIj35hXJRJooKz2PuBam8/vQMMCI/iHRTWI5QnXy8Vt4mlBMMR58oRXg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5162.namprd12.prod.outlook.com (2603:10b6:408:11b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 13:19:52 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 13:19:52 +0000
Subject: Re: [PATCH] drm/amdkfd: remove duplicate include of kfd_svm.h
To: Wan Jiabing <wanjiabing@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210605025406.14058-1-wanjiabing@vivo.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <8c03bb1b-d14a-81d8-b2bc-c44df34f43f6@amd.com>
Date: Mon, 7 Jun 2021 09:19:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210605025406.14058-1-wanjiabing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [142.116.203.225]
X-ClientProxiedBy: YT1PR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::31) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.203.225) by
 YT1PR01CA0092.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.25 via Frontend Transport; Mon, 7 Jun 2021 13:19:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6000661-d7f5-4296-aa97-08d929b6ef16
X-MS-TrafficTypeDiagnostic: BN9PR12MB5162:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB51624FE1335817C61C6D97AE92389@BN9PR12MB5162.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XsGK7JVDHbCgrrVG6s9DBuYLNF1Ne98SGxEDYBsjIptxui+HFR/OrwEy/vZ7+bpZ3wt3BG0+rmLVf3HPfxK5IkQoi4RB2kOeNJq7ajnJEGECVTUY9hfnW/LMMKB1ssxgwr2mm/hUEFUmlmxpidijw/lG4DIrMC2Jflc90oYsKh6vxsx6XIYVRD2mHtbDmfd3Cl2VmyX+sAuvPcyKGDhy0iYj3UScxvncI3XxU01BFEn1VO2NzL+Kwk8M7jLa76bdT6DpoYtS4UCEe6wVPR2V6mn7FaU6kecahYy/KglXyOXyK46whIHznEsupeFfkXj2xrpYCTI1BZRfRZN0PHWraDKq8MPO95pWaRytu5NQzF9a8N6YNHiD7JG0deNlniHV4obXfI78k2aMQvcNGOYQbWAkLlCAxI5bt+csGsowrxWX8n0XgN2bMhHU+2KufhdC1GZ1VeghHN3WRXH2dWnoHHHC3vnVhR4gKhs6iPzJ22ew6qe8OtpDCiMu7WJi+s4xQOrTswHo8VnYBRXq+PnSkr42qqxH570Wa/4z32EGsQAIqbjJF+G4h0zMtfoBcU1VDcPd0x2tbcT5xqovvG5TOZ69zSnXssfcNlXUvekLRaVjidqfRKSFt8S95DXpA5AnTO7qDxZUZP7cRTRhXEigE1IqggyHBMib+AENboVkWqtMfXM/ZMU3jIf4/kWkit1gKscHLP7yIw+3SlCITTULDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66946007)(66556008)(66476007)(110136005)(16576012)(5660300002)(956004)(26005)(31686004)(16526019)(921005)(31696002)(8676002)(8936002)(36756003)(6486002)(2906002)(38100700002)(186003)(498600001)(2616005)(83380400001)(44832011)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzkzWWE1ZFRxZVNSZFRHL3c1anhJNDRXOEUwakt3UHFtMzFuQlVxSThrSnB2?=
 =?utf-8?B?YnhDeHB1c2x1TUplRk5nUUtReGlwb2N6SVFBazF4UkM4c3NHcU02QTF6cDVJ?=
 =?utf-8?B?YSt2WVBKaC9LVFd4VThoUFo1TCtvZStIdmxYb21KeUxrVmVDSndSZmc4TFJT?=
 =?utf-8?B?byt4emxxTHgwbHJCQmgyc3FrT0ZNTWJ0OGxtTUphRGVXM1ZQNUtGZnUrbUpr?=
 =?utf-8?B?eDczWjg4czVuSXEyYTRQU3NHR0VFa0dBNjRCaVJtM05URnlDOUNud1FGTUtX?=
 =?utf-8?B?SUlIcVkzMkdHallBU2NwUFBhem5MNGRKSmxHR2xIVDhUdzFRNEFyQ2Z1VlM3?=
 =?utf-8?B?dlZrSlp0ZUh0SDN1N1UyUjY1YnRaVWVPRmdva2lCZmtHeXlkRDlteVdnNElW?=
 =?utf-8?B?Q0JlV01od2wxUnBSODBHL0RoSmtIL1M3WVpUOFk0UFpkd1VIOFYzOUpxNHRL?=
 =?utf-8?B?WmVtVjZvek55czcySTJRcDFrK3o2Zk1HYnZaVWdPK2RLRTNLVFRCTXNpZGwv?=
 =?utf-8?B?L2owWTNrMlE5aUtkanY1Y3U3U05KN3dFM2JCVHlsVU9tUjFSblhudllmM3VE?=
 =?utf-8?B?a3M4dzVOOS9UYXV6NE9NSkpBT2dmQ3dZNENxaTEzdmdJUEY1cmV3ZERpd2xP?=
 =?utf-8?B?Z2kzbzk4Zm9rZDRDZnFXVWV1VW1GSEVqNVdZR1lNVklpLzZsSXJ5Um00eEtQ?=
 =?utf-8?B?ZllRNXpEZ3IwN2N0d2phS1JSRW1Xa2FpRHJYVUpGUS9wOUNzSllOc01zZVN0?=
 =?utf-8?B?Rlg5TW1jSXR5eFAxS3RpckNFTFFCY2ZiYXdXNnlGRm5rRW1lQXBxWk5paXlo?=
 =?utf-8?B?QWVweXE1VUZYRUs1aTJaSDY5dDc2Wk1GMUxWMUlPQU5ZbUhDc3hvanRLNjE1?=
 =?utf-8?B?aE1qUElOY2JmTHdLSnI3N3h2VnNQc1pRcXRuQTZnNUh5aEV2YzlhazVrVWJ6?=
 =?utf-8?B?bGNoNGtmSUhuMm82ZlJnbFZLTncwczNXSFVTa0gwV0JOSXk3ckFrNUpCaTZk?=
 =?utf-8?B?K0plMW5nZFFtbGxsVHhrcER5VGRldDJ5T3NNMldDRVVhK3V6NUVkb0pvc2Zl?=
 =?utf-8?B?VXY1VVRlaUxxckNUbFdzc3NkSHA3ZVN5TE8vS1ptZ3dMQzBVemhvSDI3YVNL?=
 =?utf-8?B?Nk5yMjFGU09SL2dpWDVBdFE0WFRuYXNURlFjZXNjSnhYbTNGYzR0c240ejJV?=
 =?utf-8?B?ZkhBS2FkZjFQSzJxK2tDNWE2VVRPTXc2Z3BUbmhkOHVaNVczbWhXU2RGajZZ?=
 =?utf-8?B?VVNaZi9XbTlYZWdEYTlvb2UzK1JjbTFLeDM3OEpCdGVXR3JDd1NOdm5TdDFv?=
 =?utf-8?B?cUFNM3VObEd3Sk94aDlqWG4vY2RYOVRMemdwRmh4cHl2QXpUbVZROGZKSGxy?=
 =?utf-8?B?dEh1U1pZM3hFTGlqYmEzOWY0RzY3YXQ0OFF6VG1QSHBnc0J5eEJKSXEvMVRV?=
 =?utf-8?B?eHFUTWhETlM4UnNBUkZjL00yTlBmMU44LzZIT1VyWGRQRjBOaEtNQjlNVFB2?=
 =?utf-8?B?MGdYeXkrSTRNOTl2L1p6S2hFTyt1cEtxY2JlUkQ0MDJZNHJ4eEtPdThzNTAw?=
 =?utf-8?B?Y3hmTzY3QmlQWWQwaEEzU2tvNllhN2NUT2lkUDlrdmhWYlhkM29ibVVZTDYy?=
 =?utf-8?B?eUpHTEdQVDlGVEQzQkxkNTRZa0xsM2lYRmhiNHdpRDVXNjV2V0xLcHZkY09N?=
 =?utf-8?B?TDVaWHpnMHNSZjd5UWc4cjMyb3lGOE54WllwV3V5TkFNa3oyckJQUVZSVVQz?=
 =?utf-8?Q?el5IuhYyP7urpgdg4LCrr1U3zCTiSY2BTHj0Z7u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6000661-d7f5-4296-aa97-08d929b6ef16
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 13:19:52.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNbAEDps3Cqv3KwVQ4bTaP81+9bbjlAPax7TMX/N0FtihaV1xeykOt9aaeyXhnT3wbzOsRR7fBCtSIeHb7sREQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5162
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

Am 2021-06-04 um 10:54 p.m. schrieb Wan Jiabing:
> kfd_svm.h is included duplicately in commit 42de677f79999
> ("drm/amdkfd: register svm range"). 
>
> After checking possible related header files,
> remove the former one to make the code format more reasonable.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I will apply the patch to amd-staging-drm-next. Thanks.

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index bfa6c4cd2f44..f1f40bba5c60 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -35,7 +35,6 @@
>  #include <linux/pm_runtime.h>
>  #include "amdgpu_amdkfd.h"
>  #include "amdgpu.h"
> -#include "kfd_svm.h"
>  
>  struct mm_struct;
>  
