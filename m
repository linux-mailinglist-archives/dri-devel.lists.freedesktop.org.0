Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C618A56D761
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 10:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFE114BB3A;
	Mon, 11 Jul 2022 08:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4771C14A837;
 Mon, 11 Jul 2022 08:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+2qG/y+L5Plnf4pA7z2x6ILKUfWDJlGRofwU9SXKk7BuXgdttDesUO3951AF+4WTOE3VIrBubHku1XT18Z9Qen1cR+8qXvgsSQXYkJ/b5hdWWlqezrKFdIZvQ+gM0xdxRrB775Wz3tgW5JyOhmDW/6/PoWMKUchZwuk6LASwQEmmeY3ZWOiSbDY32BBkhXuEAIr8klsGNJDO0TvZopnjWzy3U4LKwpXIZuKneMhuMT8e8cVjwyeVIeq9nkyzjm8VAlDMpMR3z9GoP5tupPCZaJQXt/LAjHRW+NOkRZ+Ds59137thM7rsxyYPwm/BCUKlwUh1tMC0roeuIuVpszhgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AShQGiUOJkL+QN9HjFT1tpZk9/MlPWUgTxspdXuYH5s=;
 b=ZLoUkTlXP0/wf8JxexTEq3MR0HF4HNh4uKmCwPKlIFIb58RCGqJ+YvhgS2EmRXLRLAcTicyfEWJXYskftoNOhb97j3g2mYPm9VXvvhGDMy001g8v/RanxVZHfBQMYqL9A0xOaP/k2BSWqsNphzfI9C14jw/brds54BALPptUNNWZ1VIWVtzg01/NV27UwaqL9lbNkKsmMahzvattXC5tZ0zHus4IQCknPf4oAs5QO8GOLbgHRwiQcsUiFk514jHxcQ6JqWSd/YOtmy8G0hm2d3EF4zOh5bS6gjQCOevDbhuriGTwYcs/0DziWyblLxpZE4gOfLmY+46FoJktdrIvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AShQGiUOJkL+QN9HjFT1tpZk9/MlPWUgTxspdXuYH5s=;
 b=yCOOrw5niXStAu9qd8YcEIgs6HAGG8CFRIh5DA57HUmMVKLFJvQpUjRV0IRFlYGjcp++j3O1COjC02aDNFzalITPLXrvFjxfiI7B4OAb+0W9du09BouDcVFu/ImSLX0VlmIqaHa2MubF6Lf4wmVBfyXsLpwDZto/+LrdBehlSFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN6PR12MB4751.namprd12.prod.outlook.com (2603:10b6:805:df::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 08:05:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 08:05:51 +0000
Message-ID: <6e60d396-2a52-d1fa-f125-3c585605b531@amd.com>
Date: Mon, 11 Jul 2022 10:05:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220711124742.3b151992@canb.auug.org.au>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220711124742.3b151992@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68869396-f461-4a1c-6c19-08da63142bea
X-MS-TrafficTypeDiagnostic: SN6PR12MB4751:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yAgGBG4jTpFjRyimtq6wPO13YrRC9Iy/7xY6UpHOAHJPKwKxiElQGavgIkC+sUkkWvecGwXSwazM+26naIea6eZxWej67/S9timzD+rD74w2TZlcc38zKBMFcfwcByxngRhcAUb8aY9DC4/hdbmU6NOoNp96tcQTPWwWBdqs/dJv66hDlezYIXUeYGF+hKEXAEpwOrT2TmTcUqUiM19kd+PtPTrTiVMbDyq0cVdqxMnTri6JPym1RkvzzTiWIehfEXZRX7hKjzjJ3uFST0JDhV2TIlSh72+vNJN/nNGAB/Pv1d/IhlgT+7NWwK7qOkhO3kPFOS0kuPt+CH2oCUr3V2h5+ef9J/3YdNW6HTLja9kGernerVGjXQAFeI8E42UR1Zskr5qn/4e9XuMZ6sTCcwdqGOLIJHRHSsrqB2ZV2orWe8ByxdoHM2pcFZAeHbl0qrmJ9muhViy39XV0C78Nsb7iU88SorO4gLgaktTrpT1w0H3FPD2kz9yb5APramo5vJgdaAz6S4utD7lCD+8t29Lo3vc+vi0XPjqcYBCHjzvDO3+ia4lDsc5KNPnZC2EPiceovcnUv8B7eFQgFj2rbcsJO+ASJ1dWPL0jncEMdFXUfwlDG3qVIll0uOWJQ/LhdGTBND6sZkI8d2MmD9TFfvnyKRLcXOx0cov4eOOUlHv3Nt0/j5LUYj+hvOwvgxRZNeKmeGEpCQxsGS1l4oGYLr0/SHU+2kfRPtnddeYK/zHeuuvcSmp6MCSergUoDNWYG5YQ5RiaKDpljBq1gc/xq3DOQGP4VHciXaKzlImhTLqvfbFWkPIxE5IaMBI7jIRONE49Nj5/Q0Wjxq+dhFtbWhwffkQiba4Xixn73j66+C4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(36756003)(8936002)(4326008)(4744005)(31686004)(110136005)(6506007)(6666004)(38100700002)(54906003)(41300700001)(26005)(2616005)(6512007)(66476007)(2906002)(66556008)(8676002)(66946007)(316002)(6486002)(478600001)(5660300002)(186003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUxoYVlMN2VBWEJTQWpPK1V1eU9BdGVYeWl4K0EyK3pacU5abitNb2RobW5W?=
 =?utf-8?B?UWcza290Z204amxJcWZvNHFuZXJpSGxMTTAzWUwvSFk1Sk9idHl5VFB0M3ZB?=
 =?utf-8?B?Y2o3YXpJTEVlbSs1bkY5c3lXYUMwMmhYc2FDTHlLNHE1S24ycERJajhMbmw4?=
 =?utf-8?B?ZTQ2Yys5ZW5tN2tpMzVmOUlMdWxvYnlYNGRQYldVUEQ5OEI1VlQ1ZlVucVNN?=
 =?utf-8?B?Tnc3MWdSWkVJWWhldzAxN1pKNVlJdUgyQzhhcXZ3QnBsNzZXY2RtN2plTFU2?=
 =?utf-8?B?S3FlQnRlREFpSDlHQm5lb0pQVkpuRWtSTUNPUW1BUE9XMUZKVVRuem1FNzBj?=
 =?utf-8?B?NEtod3BxWmRLMUZhSFozYXdySlJ6a2Qvak83WmZDcXRWMjVSU1Boa1Zra2hr?=
 =?utf-8?B?YkNQUjh1RUFQM1dZTGczdTFlYzNHWEtuZTJOb0ZYOTRISS9ra21NSlI0SVBx?=
 =?utf-8?B?VFpWSTY1Q0dJcU9neWN5WjVTbnFsZS9iWnB1S3hRWGpaeVRsbS9qWkhhQU5s?=
 =?utf-8?B?alJoTG1lTGd4QVQ3WXpNanJNWUJpY0VzeHl5RFFMRVpseEVuN2ZqRmRIejlz?=
 =?utf-8?B?d1hRSVAwU0pJQWpYdDBndjdtSkxxS2hMMkIzc0JvR2FSSThsY080OVZ6YUlj?=
 =?utf-8?B?QnNjUGhabzIwbXptdjgraGhJcG9uRlFEV3BRRjIzV0I2VTZZWXVEUnhHN3Bw?=
 =?utf-8?B?Vm1yK0FIaUJZK0ZaRzJ6eDRLUWx0em9BZXJtVS9xWUwrb0ZTeDlVMHJ0eHhq?=
 =?utf-8?B?OVoxWkxjTWJCOHozSFVQazZOUzFUZDlleG01bCs1RFAxRSsvQnRlRWxjcGtl?=
 =?utf-8?B?TFhkM24wcktjaEhVcnZPUEFidkloZHk5cHVKd2p4WjFuTDVQcHdBdnFYSHJz?=
 =?utf-8?B?Y09NQUVPWFVSMU1wampSOFZHZUF3TG1tRkY0NUJTcEp0aW5WRU5LbFpYVnNJ?=
 =?utf-8?B?ZDF2VmV6aGZOL1JZQ256WkhTYjh2UGc1Qi9yYUhHUjI0cVF2VjZZbGR5V0hh?=
 =?utf-8?B?bDNYbFJhMDlwN29ZUjBHajZaSDdjWDlpMGZWcklOYktYMU9OMi9RYThMUE5z?=
 =?utf-8?B?b1V6U1hINExReEs0SnpzWE5abUdzR3AwOEFGZi9TbSt5OUtSSEVzQXYyS2s2?=
 =?utf-8?B?RDZheFVnYVhFai9aWFptM0lVaktKc0VGaC9hS2dhUi85U2pHWlhKVlZWb0hB?=
 =?utf-8?B?NllIOVhnZS95RS9qVkpuZXhUOC9lWTRuSzAwVnE5cE1VQWZDRGZTS2hROVJh?=
 =?utf-8?B?NVNZNVZndmpZUEoyNXh3SU1NaU1yR2ZEWkY2dTdDd3lVc3pwNlpzeHhwdnc3?=
 =?utf-8?B?VllLbVRSMjlsaERTNU5kb2tRcWFXRkxDUEhURFVYTk5meThlRWFxQ2M1MnRR?=
 =?utf-8?B?SjlPVVBielQrWGl2dTlMOSt4UUt3TlB3a3FhZFRLcTdaREJ5TFVqZ29EMzBL?=
 =?utf-8?B?NmJUUVBlRHlpNUJFTmRvUmJSUE9ydEdFWE5SbFFsSDh4K0kyNklVTVlubWRG?=
 =?utf-8?B?YjBxb3dhRDR6TUZNZTRvenpQaE9oREx6TWpxL2NjWldIZEJDZ0czZGVKNmlG?=
 =?utf-8?B?cFdEbFNpWHYraDRsMkhZRUkrQVgwd1Y2Z1pxTjNTSmdBUGlJWGR5MWxzdUNB?=
 =?utf-8?B?bU9JMjdBRnhVWHVpOGpDangxR2JtVWtJTXFLRCtPVWgyallERmE0UVNKanpR?=
 =?utf-8?B?TTc4S3ZHTHlGeEhpTUxnaWh1aUc5bnBtUXIvTmx5ZEhzSGp5a0g5S1VtYTUz?=
 =?utf-8?B?ZHFBQ2RnT1JvWWdCT0FjMkZiZkdqZzlNeDRsWExmTkVvRkhqcmhhUlN6b3hF?=
 =?utf-8?B?NXM3ZUFFVGVKRmsxdjg3QmJML2tleGVaUXhmUlArSTY0UDdscUFnVHQySlFS?=
 =?utf-8?B?K1JCSllYK0hUbVRTb05pOUcybWZ1SVVuTVJKK0J3QjNtTll1YzVhT0wycXVz?=
 =?utf-8?B?VzQvSFppRllaZWNHdU1JMWFocWIvcElBZzBQS0s4eThDcFhHL05aZUd3MS96?=
 =?utf-8?B?LzV3YlRET1dwa0tYblBvSHE1TVpWQXI1ZXhwMFFhUkR2RkhGWUttYVJXVmVG?=
 =?utf-8?B?R1B0UU05NHR4TmJTWVI0VGltcXNYdFNlbVp0RWtqeUFFUHErbTY1NzVZUS9X?=
 =?utf-8?Q?8VRlMpfTqvyApm13yp7Gf/KIY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68869396-f461-4a1c-6c19-08da63142bea
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:05:51.7219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vN/qXaRD+K/YwjRqNHL+z8Oi+FndnW3v+i+eXIrizxITrSFMdOCUpEfVTYvopshC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4751
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Am 11.07.22 um 04:47 schrieb Stephen Rothwell:
> Hi all,
>
> Today's linux-next merge of the drm tree got a conflict in:
>
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>
> between commit:
>
>    925b6e59138c ("Revert "drm/amdgpu: add drm buddy support to amdgpu"")
>
> from the drm-misc-fixes tree and commit:
>
>    5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new")
>
> from the drm tree.
>
> This is a mess :-(  I have just reverted the above revert before mergin
> the drm tree for today, please fix it up.

Sorry for the noise, the patch "5e3f1e7729ec ("drm/amdgpu: fix start 
calculation in amdgpu_vram_mgr_new")" and another one is going to be 
reverted from the drm tree as well.

It's just that -fixes patches where faster than -next patches.

Regards,
Christian.


>

