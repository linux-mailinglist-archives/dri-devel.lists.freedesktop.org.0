Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D44C338B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 18:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A43110EC72;
	Thu, 24 Feb 2022 17:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7966210EC72;
 Thu, 24 Feb 2022 17:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PH1jM/yQw1/LqlRRy/T/zhJtM91XepHFv6gek6xLkz3Hu+VCs2WG2QIo76dNDzimAwiMo4bdjqBgqodk3BMz1rKWh0TDmndp3lGjwe2fvK4NAU40EIqeEciFIg6kY2x5UoKOmkuWEy7LASteMc5wzUOs5wJYg5enSbxJvXNSG4HIkVmsn1blxjIbMNJoZrJCGMliETIDxMnfbEr6xS4vxUx/PgXDKg/PsjfS3K15lmfEfuXue9AA+SrXYgJBiXDKXo+QOA0/u1CbV1z6Qk5sMCTOiqGpUem/S/pNNwdctkh3NMrPXrRUQX/ucs8YuSRd/27WHQ4zl26CZTNT7IdAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yETWQkuKsXv+/Xr0AmmtyGF64TXpUhTdsaNHhKJIKoM=;
 b=F8IWkqq1OrdJxXtiIT+o/uf2tDrg+q+YgFKeL/S5WUAoEBozb/AKXGpOTkQHJGIRjEctM8Ph+p4BBvV11D8SEHEv/CAC6qvOEVy5Fjj6yv5hdUmF7LmLRtQCWC2fwEHxKaYEIfkB4QZEggndT4wscu5MW6G+CzZ55k3FUmy3J0AkEIgsCjM0r+FTpERac9sXFdCjOrIRXQuaPWVxyfvsdtPU92St+4d3bIRn3MPKiIBVvVrPKuygTp5PzVfcWvctRIPFuXe24yXYuvJqPSu0++ViQthYCycdBX6fuxW6/pX4+9KOKoC6vYEQX4zQf/NTZG7n8sioDWSgWNX4QqoTRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yETWQkuKsXv+/Xr0AmmtyGF64TXpUhTdsaNHhKJIKoM=;
 b=ArfvcJz13IurH6tv8EWt00zpMfNVniFbf6SdIHXAP8Bdkr4dI+6csvop8q4/2mqxNuwFyPj8gjpHVr/gdWqW+6pS5e5xQfLKjZK6xsSKCIAI4j5pW8EWRl4uhlYVw6Lewhb1fFV863tZeW/nocxAOOwRqHPG+WRddmV5JsY5OLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (10.175.90.151) by
 MWHPR12MB1679.namprd12.prod.outlook.com (10.172.55.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.21; Thu, 24 Feb 2022 17:26:06 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 17:26:05 +0000
Content-Type: multipart/alternative;
 boundary="------------00v3gapjhI8QwoyXAAm5ochA"
Message-ID: <91b8771b-695d-b126-13ec-50dddd56f200@amd.com>
Date: Thu, 24 Feb 2022 12:26:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after XGMI is
 ready
Content-Language: en-US
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Chen, JingWen" <JingWen.Chen2@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-3-andrey.grodzovsky@amd.com>
 <d82ac1a0-d81d-9861-fc1b-8cc06017a2b5@gmail.com>
 <1d7cb471-c32c-416c-4336-317ee9f171ef@amd.com>
 <3752a89c-d468-8c39-03a9-37d592dae89f@amd.com>
 <48c207dc-cc7a-efda-a4a8-4f1f1a6511fe@amd.com>
 <BL1PR12MB514424A75728E78BC0E5B848F73D9@BL1PR12MB5144.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <BL1PR12MB514424A75728E78BC0E5B848F73D9@BL1PR12MB5144.namprd12.prod.outlook.com>
X-ClientProxiedBy: CH2PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:610:4e::35) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bf2d98e-0d75-4319-26a4-08d9f7babce6
X-MS-TrafficTypeDiagnostic: MWHPR12MB1679:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1679642B1803F714E7EF50B3EA3D9@MWHPR12MB1679.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jyOtQ/EGHOSWdy493C8Sssu8JKNRkU394nKzX6Y9CSWt85zlld7GRc7j/7RWspWV5oGvJ4wthaK8fefchnxBxT59o4ItyIy2BX8ew+abSd9GGwqxVquoobfbC3gQK58P0ysU3HSm5BOrjyTfETiEQTV/6s06tcr4JZ/BJbh52xY5d9Gfe09dugoPkrKCccF6tr1AViLo7tHAKH7DtjjopCFatqMS99Ttq+ce5chjRs2aWeUasyWYzGa8YCU4cugln4D2lcnjVYNEBXYO6Ij/k8F4C90xI91BWvG2GuMscZHeUtIPGe659t3VPhQnY+jpERw1o5NoCvmBXqe9isbaOCq7q80A1bAms0E7di+u3Q07GmOpCY6rnHUi1xdXM3uQMsyAfKFiznT9Ma681ScMFIUFqvkUPSmmP07qBtXbRBdyTE1l4qdIXF+q2n+VHHG54Hj+yU3QaSjzY8SNgEhnD9cyJmruVRQp3I7ITNMVAQZu/G383CbMet3LQAPQZu4paq9JaHSMQR8yUekEqub67kKteZ9+RsecRbFuBhDhcpBwYryRxc4BGWjwL1QHj1ZabAhk/6xQOQhCXrk/2QkO09amZBT60hlczcPXZe9rpZPhvGIugK0M/9Asc5c5KZQWCLKGzp3/o6wckmzbaUrFKnK6AOTjP1+tzYs1lvEE0qfYxUGexRmPJn6ZwYp/XfQwNGQ6ijwFwwSMWTKPhZrnKWEZrnVTh900RzyhMHpWZ4FS4ZZ9IRfAAZmSgsjm0DkR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66574015)(31696002)(2616005)(54906003)(186003)(31686004)(110136005)(38100700002)(2906002)(4326008)(19627405001)(86362001)(66946007)(53546011)(66556008)(66476007)(8676002)(8936002)(5660300002)(6506007)(508600001)(6486002)(36756003)(83380400001)(33964004)(30864003)(44832011)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0FPRDRxdC81TElXeUV1TzdYSTVuVVVYU0oyTEcrYVBlbGlrM1QzY0FJQ2V4?=
 =?utf-8?B?S3dHK1psWmhvbm8vYzdyeWZhUVNHRXRKdmRzZUh0dXdLb1piQXJjeCsvcTZq?=
 =?utf-8?B?L0w3VkQrU2ltUkgwN0NFRmJJblJFVlVWV0UvZHhCUDhaS3FaOThRMnJkV3Js?=
 =?utf-8?B?cTlGN2dLU1pia1hicnJ3S1JiOTRiMGIvelJZcEtWOEYyazNla0EzOGQvbkZl?=
 =?utf-8?B?Q21oWERWZVBrK0VMMC8rSzFxdm1Ub1RCM3BaMmhsNml2d1gvRzBXaEE5b0lC?=
 =?utf-8?B?ZkdpK1U1YU9DVnJMakJFTEZxTVJQYmowMzJMYTR3THhybTlKL2V5dU13QWlL?=
 =?utf-8?B?WFkveUlkdG5tTmV0WS9wOFBMSGV0b0Y3dW9rVFZmbWRqakVrZnB1Y09rZnhy?=
 =?utf-8?B?eVRmd1RFRFFVVFBMUTJ3dUJhbE1iV2ZrUm01NFVIWGhyTHdIRXpVejBVOCtl?=
 =?utf-8?B?TnlHQ0ExRkVTQmRUeURraWpVRlBzZ3ZPTktjeTZVYkVmUXZjUk8wY2g5bUp3?=
 =?utf-8?B?b3FlYUxvbWJ6WXZ0S3hteTJoVW5lU3F3SzlWaGZaUnhiVFU4aDF1Y3hlVlRQ?=
 =?utf-8?B?cE5EejFDazBIQW9jdkQ2aFVDM0VPeThXajBTd25wUHozcktxaGduM3IxTDdS?=
 =?utf-8?B?YnZPbmh0OEx3YjZDUXVOZWY1UDFpY1RLeXQyM3JSbTViMHRCVGVSV2FYaWY2?=
 =?utf-8?B?ZTdkUlNYNUR2eEN6eUxIbnRQQW80NnJwU2JJVzIxenpPWnh2elpQK2RKbTFi?=
 =?utf-8?B?cFVKSnVLb1Y0WVVYcDZsS1JvbmZBTUFkenF0bVNGUzBmOGcwUnpHZ1FwSmpv?=
 =?utf-8?B?Uml0K09CbnBjSWJ0SEYxWkxxL0dQWU53Z0Y4OTA3cXcwb2NCcWkwVWVpOWRY?=
 =?utf-8?B?dEJDc25iYlVjRWNGcjVZZW9TWWR6ZmFJejBCM0FRNWVkelZqeXU2TEg2dUoy?=
 =?utf-8?B?ZnJyT2VYM01pdHRORHFHanFWWjZkUzM5VkRkYU83Z0Y1K2ZaTnFZRmo1Titp?=
 =?utf-8?B?YWhoN3AxV3VRN0lmeVRibUd6bE5nRVM2dk91elVLMktQclREUlA4eEhPbnll?=
 =?utf-8?B?RXVzbG9JV0ZHN0Q4QmQ1NFltMm9mYnJhNTFVZ2hSaVRYMkY2NWc5WEl3QUtr?=
 =?utf-8?B?c2tSTXYyNkZBTVZFVUhMVitPWWoxQnBROXROWmlhTy9kZ1dNeHpNbE1lR1VX?=
 =?utf-8?B?bWVIQXVYd2ZobDMwcHZXdGg0NksvUHJjT2pMbEluUSs0TWNud0pML0loL0hB?=
 =?utf-8?B?TXVvSU5vSCtwN0Zyb0phN2NDZ3lWbG9kUnlFcUQ2R0VOVGRwUG1peGsxVyty?=
 =?utf-8?B?cE9QZVJoWWlHcnBtYmtVeW9zSi8ranFaRUhYWThOUkZES3AyNkhHWTYrOEoy?=
 =?utf-8?B?SHRkNFU5UGVZSVl1Y2NpSmJDQjJSMXc2dUZWKzRtUGJ3TDlLbGJ5WFpTQjZL?=
 =?utf-8?B?Si90cDcxdVNoZ0J3N25JVjlRdG1xaEpZRTBZWEdnQ0VrbmVicU1vSzl3eUtN?=
 =?utf-8?B?UXRNcm5OWFFnclI3R1gwR1dHKzN0K05nRDEvcjdscWMxdlJiemFuSGRtT3ZT?=
 =?utf-8?B?VE1CeUNKZ1JQcklNaEJiS2VHdmkrdUVDZmpDdWcybTN5VEdVNm1RTm9pVG5h?=
 =?utf-8?B?cElhcGdnTFJXRXhvRi9oU3RwT2FUOVZUdFY5QWVCaVhnVTJFTUM2b2h3ZUQz?=
 =?utf-8?B?VUZTSUxYM1BWZFRtWk1TTDlZSW9DK0xsKy9wQmVDTGdPaVpkVjlrajFPMUpL?=
 =?utf-8?B?clF0cHowN0NOVExsbGtJb0hKcWV6NzVvWjg4T0VkeGRhdkVaNitWUktCTmZo?=
 =?utf-8?B?OEc2eWVKb3I0V01SeG9DajFkM3MxUG9aZ2pGeGxLbkFXa05KSXV3S2xkNkZC?=
 =?utf-8?B?SVpnZEJyaGZ4V29LKzYzcEJlbWIzYk1HVlRBbXNoUC9aMGRTRlJveXhxeVlp?=
 =?utf-8?B?WmVjK1NBU256L2RJT01NekNCdkN3RWE0clZ0SGhjaTZycXpjcmQ0Zm5iYm83?=
 =?utf-8?B?aDNLZFh2QjhXZzNVRWg1RVd4dzJ2LzljTVplUGs0NitRSVJIRUR0K2pSQ0FP?=
 =?utf-8?B?b0FvemdRSmEweVlveTRtV3RGUTNFekNyM2NJdVRBdnkxTVUvdDMxN1NDdEk0?=
 =?utf-8?B?SlRRRGlxUFJJYTRiam1FZ1B6WUlQTWhoM0Y4NlA3QlBHMHU5Z0NOcFRJc3U4?=
 =?utf-8?B?TldwWm54ajUxQjRNV0ZTRzFlVFowMTJpbFpwaCtScUdPbi9UYTRsMWxLK3JV?=
 =?utf-8?Q?D9k9kwtg4f9LaXY5BUiKDEtQhKoNJrADi12fO5GKh4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf2d98e-0d75-4319-26a4-08d9f7babce6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 17:26:05.7156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xvH9/Dgv2DuRLWkmE+nA4mTR1JcLPO5sB9oCVhiyUUPXksj+z91ajcLE0tCSfW3yL+ghcBDu8hqPwEzX/44tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1679
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
Cc: "Chen, Horace" <Horace.Chen@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------00v3gapjhI8QwoyXAAm5ochA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

No problem if so but before I do,


JingWen - why you think this patch is needed as a standalone now ? It 
has no use without the
entire feature together with it. Is it some changes you want to do on 
top of that code ?


Andrey


On 2022-02-24 12:12, Deucher, Alexander wrote:
>
> [Public]
>
>
> If it applies cleanly, feel free to drop it in.  I'll drop those 
> patches for drm-next since they are already in drm-misc.
>
> Alex
>
> ------------------------------------------------------------------------
> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of 
> Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> *Sent:* Thursday, February 24, 2022 11:24 AM
> *To:* Chen, JingWen <JingWen.Chen2@amd.com>; Christian König 
> <ckoenig.leichtzumerken@gmail.com>; dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>
> *Cc:* Liu, Monk <Monk.Liu@amd.com>; Chen, Horace 
> <Horace.Chen@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>; Koenig, 
> Christian <Christian.Koenig@amd.com>; daniel@ffwll.ch <daniel@ffwll.ch>
> *Subject:* Re: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after 
> XGMI is ready
> No because all the patch-set including this patch was landed into
> drm-misc-next and will reach amd-staging-drm-next on the next upstream
> rebase i guess.
>
> Andrey
>
> On 2022-02-24 01:47, JingWen Chen wrote:
> > Hi Andrey,
> >
> > Will you port this patch into amd-staging-drm-next?
> >
> > on 2/10/22 2:06 AM, Andrey Grodzovsky wrote:
> >> All comments are fixed and code pushed. Thanks for everyone
> >> who helped reviewing.
> >>
> >> Andrey
> >>
> >> On 2022-02-09 02:53, Christian König wrote:
> >>> Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
> >>>> Before we initialize schedulers we must know which reset
> >>>> domain are we in - for single device there iis a single
> >>>> domain per device and so single wq per device. For XGMI
> >>>> the reset domain spans the entire XGMI hive and so the
> >>>> reset wq is per hive.
> >>>>
> >>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>> One more comment below, with that fixed Reviewed-by: Christian 
> König <christian.koenig@amd.com>.
> >>>
> >>>> ---
> >>>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 
> ++++++++++++++++++++++
> >>>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
> >>>> drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
> >>>>    3 files changed, 51 insertions(+), 30 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>> index 9704b0e1fd82..00123b0013d3 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>> @@ -2287,6 +2287,47 @@ static int amdgpu_device_fw_loading(struct 
> amdgpu_device *adev)
> >>>>        return r;
> >>>>    }
> >>>>    +static int amdgpu_device_init_schedulers(struct amdgpu_device 
> *adev)
> >>>> +{
> >>>> +    long timeout;
> >>>> +    int r, i;
> >>>> +
> >>>> +    for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >>>> +        struct amdgpu_ring *ring = adev->rings[i];
> >>>> +
> >>>> +        /* No need to setup the GPU scheduler for rings that 
> don't need it */
> >>>> +        if (!ring || ring->no_scheduler)
> >>>> +            continue;
> >>>> +
> >>>> +        switch (ring->funcs->type) {
> >>>> +        case AMDGPU_RING_TYPE_GFX:
> >>>> +            timeout = adev->gfx_timeout;
> >>>> +            break;
> >>>> +        case AMDGPU_RING_TYPE_COMPUTE:
> >>>> +            timeout = adev->compute_timeout;
> >>>> +            break;
> >>>> +        case AMDGPU_RING_TYPE_SDMA:
> >>>> +            timeout = adev->sdma_timeout;
> >>>> +            break;
> >>>> +        default:
> >>>> +            timeout = adev->video_timeout;
> >>>> +            break;
> >>>> +        }
> >>>> +
> >>>> +        r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> >>>> + ring->num_hw_submission, amdgpu_job_hang_limit,
> >>>> +                   timeout, adev->reset_domain.wq, 
> ring->sched_score, ring->name);
> >>>> +        if (r) {
> >>>> +            DRM_ERROR("Failed to create scheduler on ring %s.\n",
> >>>> +                  ring->name);
> >>>> +            return r;
> >>>> +        }
> >>>> +    }
> >>>> +
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>> +
> >>>>    /**
> >>>>     * amdgpu_device_ip_init - run init for hardware IPs
> >>>>     *
> >>>> @@ -2419,6 +2460,10 @@ static int amdgpu_device_ip_init(struct 
> amdgpu_device *adev)
> >>>>            }
> >>>>        }
> >>>>    +    r = amdgpu_device_init_schedulers(adev);
> >>>> +    if (r)
> >>>> +        goto init_failed;
> >>>> +
> >>>>        /* Don't init kfd if whole hive need to be reset during 
> init */
> >>>>        if (!adev->gmc.xgmi.pending_reset)
> >>>> amdgpu_amdkfd_device_init(adev);
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >>>> index 45977a72b5dd..fa302540c69a 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >>>> @@ -457,8 +457,6 @@ int amdgpu_fence_driver_init_ring(struct 
> amdgpu_ring *ring,
> >>>>                      atomic_t *sched_score)
> >>>>    {
> >>>>        struct amdgpu_device *adev = ring->adev;
> >>>> -    long timeout;
> >>>> -    int r;
> >>>>          if (!adev)
> >>>>            return -EINVAL;
> >>>> @@ -478,36 +476,12 @@ int amdgpu_fence_driver_init_ring(struct 
> amdgpu_ring *ring,
> >>>> spin_lock_init(&ring->fence_drv.lock);
> >>>>        ring->fence_drv.fences = kcalloc(num_hw_submission * 2, 
> sizeof(void *),
> >>>>                         GFP_KERNEL);
> >>>> -    if (!ring->fence_drv.fences)
> >>>> -        return -ENOMEM;
> >>>>    -    /* No need to setup the GPU scheduler for rings that 
> don't need it */
> >>>> -    if (ring->no_scheduler)
> >>>> -        return 0;
> >>>> +    ring->num_hw_submission = num_hw_submission;
> >>>> +    ring->sched_score = sched_score;
> >>> Let's move this into the caller and then use 
> ring->num_hw_submission in the fence code as well.
> >>>
> >>> The maximum number of jobs on the ring is not really fence specific.
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>    -    switch (ring->funcs->type) {
> >>>> -    case AMDGPU_RING_TYPE_GFX:
> >>>> -        timeout = adev->gfx_timeout;
> >>>> -        break;
> >>>> -    case AMDGPU_RING_TYPE_COMPUTE:
> >>>> -        timeout = adev->compute_timeout;
> >>>> -        break;
> >>>> -    case AMDGPU_RING_TYPE_SDMA:
> >>>> -        timeout = adev->sdma_timeout;
> >>>> -        break;
> >>>> -    default:
> >>>> -        timeout = adev->video_timeout;
> >>>> -        break;
> >>>> -    }
> >>>> -
> >>>> -    r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> >>>> -               num_hw_submission, amdgpu_job_hang_limit,
> >>>> -               timeout, NULL, sched_score, ring->name);
> >>>> -    if (r) {
> >>>> -        DRM_ERROR("Failed to create scheduler on ring %s.\n",
> >>>> -              ring->name);
> >>>> -        return r;
> >>>> -    }
> >>>> +    if (!ring->fence_drv.fences)
> >>>> +        return -ENOMEM;
> >>>>          return 0;
> >>>>    }
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> >>>> index fae7d185ad0d..7f20ce73a243 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> >>>> @@ -251,6 +251,8 @@ struct amdgpu_ring {
> >>>>        bool has_compute_vm_bug;
> >>>>        bool            no_scheduler;
> >>>>        int            hw_prio;
> >>>> +    unsigned num_hw_submission;
> >>>> +    atomic_t        *sched_score;
> >>>>    };
> >>>>      #define amdgpu_ring_parse_cs(r, p, ib) 
> ((r)->funcs->parse_cs((p), (ib)))
--------------00v3gapjhI8QwoyXAAm5ochA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>No problem if so but before I do,</p>
    <p><br>
    </p>
    <p>JingWen - why you think this patch is needed as a standalone now
      ? It has no use without the<br>
      entire feature together with it. Is it some changes you want to do
      on top of that code ?</p>
    <p><br>
    </p>
    <p>Andrey<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022-02-24 12:12, Deucher, Alexander
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:BL1PR12MB514424A75728E78BC0E5B848F73D9@BL1PR12MB5144.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p style="font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" align="Left">
        [Public]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          If it applies cleanly, feel free to drop it in.&nbsp; I'll drop
          those patches for drm-next since they are already in drm-misc.</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          Alex</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <hr style="display:inline-block;width:98%" tabindex="-1">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
            amd-gfx <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on
            behalf of Andrey Grodzovsky
            <a class="moz-txt-link-rfc2396E" href="mailto:andrey.grodzovsky@amd.com">&lt;andrey.grodzovsky@amd.com&gt;</a><br>
            <b>Sent:</b> Thursday, February 24, 2022 11:24 AM<br>
            <b>To:</b> Chen, JingWen <a class="moz-txt-link-rfc2396E" href="mailto:JingWen.Chen2@amd.com">&lt;JingWen.Chen2@amd.com&gt;</a>;
            Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
            <b>Cc:</b> Liu, Monk <a class="moz-txt-link-rfc2396E" href="mailto:Monk.Liu@amd.com">&lt;Monk.Liu@amd.com&gt;</a>; Chen, Horace
            <a class="moz-txt-link-rfc2396E" href="mailto:Horace.Chen@amd.com">&lt;Horace.Chen@amd.com&gt;</a>; Lazar, Lijo
            <a class="moz-txt-link-rfc2396E" href="mailto:Lijo.Lazar@amd.com">&lt;Lijo.Lazar@amd.com&gt;</a>; Koenig, Christian
            <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a><br>
            <b>Subject:</b> Re: [RFC v4 02/11] drm/amdgpu: Move
            scheduler init to after XGMI is ready</font>
          <div>&nbsp;</div>
        </div>
        <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
              <div class="PlainText">No because all the patch-set
                including this patch was landed into
                <br>
                drm-misc-next and will reach amd-staging-drm-next on the
                next upstream <br>
                rebase i guess.<br>
                <br>
                Andrey<br>
                <br>
                On 2022-02-24 01:47, JingWen Chen wrote:<br>
                &gt; Hi Andrey,<br>
                &gt;<br>
                &gt; Will you port this patch into amd-staging-drm-next?<br>
                &gt;<br>
                &gt; on 2/10/22 2:06 AM, Andrey Grodzovsky wrote:<br>
                &gt;&gt; All comments are fixed and code pushed. Thanks
                for everyone<br>
                &gt;&gt; who helped reviewing.<br>
                &gt;&gt;<br>
                &gt;&gt; Andrey<br>
                &gt;&gt;<br>
                &gt;&gt; On 2022-02-09 02:53, Christian König wrote:<br>
                &gt;&gt;&gt; Am 09.02.22 um 01:23 schrieb Andrey
                Grodzovsky:<br>
                &gt;&gt;&gt;&gt; Before we initialize schedulers we must
                know which reset<br>
                &gt;&gt;&gt;&gt; domain are we in - for single device
                there iis a single<br>
                &gt;&gt;&gt;&gt; domain per device and so single wq per
                device. For XGMI<br>
                &gt;&gt;&gt;&gt; the reset domain spans the entire XGMI
                hive and so the<br>
                &gt;&gt;&gt;&gt; reset wq is per hive.<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; Signed-off-by: Andrey Grodzovsky
                <a class="moz-txt-link-rfc2396E" href="mailto:andrey.grodzovsky@amd.com">&lt;andrey.grodzovsky@amd.com&gt;</a><br>
                &gt;&gt;&gt; One more comment below, with that fixed
                Reviewed-by: Christian König
                <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>.<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; ---<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;
                drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45
                ++++++++++++++++++++++<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;
                drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c&nbsp; | 34
                ++--------------<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;
                drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h&nbsp;&nbsp; |&nbsp; 2 +<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; 3 files changed, 51 insertions(+),
                30 deletions(-)<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; diff --git
                a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
                b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                &gt;&gt;&gt;&gt; index 9704b0e1fd82..00123b0013d3 100644<br>
                &gt;&gt;&gt;&gt; ---
                a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                &gt;&gt;&gt;&gt; +++
                b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                &gt;&gt;&gt;&gt; @@ -2287,6 +2287,47 @@ static int
                amdgpu_device_fw_loading(struct amdgpu_device *adev)<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; }<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; +static int
                amdgpu_device_init_schedulers(struct amdgpu_device
                *adev)<br>
                &gt;&gt;&gt;&gt; +{<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; long timeout;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; int r, i;<br>
                &gt;&gt;&gt;&gt; +<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt;
                AMDGPU_MAX_RINGS; ++i) {<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring *ring =
                adev-&gt;rings[i];<br>
                &gt;&gt;&gt;&gt; +<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* No need to setup the GPU
                scheduler for rings that don't need it */<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ring ||
                ring-&gt;no_scheduler)<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
                &gt;&gt;&gt;&gt; +<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch
                (ring-&gt;funcs-&gt;type) {<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_RING_TYPE_GFX:<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =
                adev-&gt;gfx_timeout;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_RING_TYPE_COMPUTE:<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =
                adev-&gt;compute_timeout;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_RING_TYPE_SDMA:<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =
                adev-&gt;sdma_timeout;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =
                adev-&gt;video_timeout;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                &gt;&gt;&gt;&gt; +<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =
                drm_sched_init(&amp;ring-&gt;sched,
                &amp;amdgpu_sched_ops,<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                ring-&gt;num_hw_submission, amdgpu_job_hang_limit,<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout,
                adev-&gt;reset_domain.wq, ring-&gt;sched_score,
                ring-&gt;name);<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to
                create scheduler on ring %s.\n&quot;,<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;name);<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; }<br>
                &gt;&gt;&gt;&gt; +<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; return 0;<br>
                &gt;&gt;&gt;&gt; +}<br>
                &gt;&gt;&gt;&gt; +<br>
                &gt;&gt;&gt;&gt; +<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; /**<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp; * amdgpu_device_ip_init - run init
                for hardware IPs<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp; *<br>
                &gt;&gt;&gt;&gt; @@ -2419,6 +2460,10 @@ static int
                amdgpu_device_ip_init(struct amdgpu_device *adev)<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; +&nbsp;&nbsp;&nbsp; r =
                amdgpu_device_init_schedulers(adev);<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; if (r)<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto init_failed;<br>
                &gt;&gt;&gt;&gt; +<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Don't init kfd if whole hive
                need to be reset during init */<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
                (!adev-&gt;gmc.xgmi.pending_reset)<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                amdgpu_amdkfd_device_init(adev);<br>
                &gt;&gt;&gt;&gt; diff --git
                a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
                b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
                &gt;&gt;&gt;&gt; index 45977a72b5dd..fa302540c69a 100644<br>
                &gt;&gt;&gt;&gt; ---
                a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
                &gt;&gt;&gt;&gt; +++
                b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
                &gt;&gt;&gt;&gt; @@ -457,8 +457,6 @@ int
                amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_t
                *sched_score)<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; {<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =
                ring-&gt;adev;<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; long timeout;<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; int r;<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev)<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
                &gt;&gt;&gt;&gt; @@ -478,36 +476,12 @@ int
                amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                spin_lock_init(&amp;ring-&gt;fence_drv.lock);<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;fence_drv.fences =
                kcalloc(num_hw_submission * 2, sizeof(void *),<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; if (!ring-&gt;fence_drv.fences)<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; -&nbsp;&nbsp;&nbsp; /* No need to setup the GPU
                scheduler for rings that don't need it */<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; if (ring-&gt;no_scheduler)<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; ring-&gt;num_hw_submission =
                num_hw_submission;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; ring-&gt;sched_score =
                sched_score;<br>
                &gt;&gt;&gt; Let's move this into the caller and then
                use ring-&gt;num_hw_submission in the fence code as
                well.<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; The maximum number of jobs on the ring is
                not really fence specific.<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; Regards,<br>
                &gt;&gt;&gt; Christian.<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; -&nbsp;&nbsp;&nbsp; switch
                (ring-&gt;funcs-&gt;type) {<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; case AMDGPU_RING_TYPE_GFX:<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =
                adev-&gt;gfx_timeout;<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; case AMDGPU_RING_TYPE_COMPUTE:<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =
                adev-&gt;compute_timeout;<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; case AMDGPU_RING_TYPE_SDMA:<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =
                adev-&gt;sdma_timeout;<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; default:<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =
                adev-&gt;video_timeout;<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; }<br>
                &gt;&gt;&gt;&gt; -<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; r =
                drm_sched_init(&amp;ring-&gt;sched,
                &amp;amdgpu_sched_ops,<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_hw_submission,
                amdgpu_job_hang_limit,<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout, NULL,
                sched_score, ring-&gt;name);<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; if (r) {<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to create
                scheduler on ring %s.\n&quot;,<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;name);<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
                &gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; }<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; if (!ring-&gt;fence_drv.fences)<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; }<br>
                &gt;&gt;&gt;&gt; diff --git
                a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
                b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
                &gt;&gt;&gt;&gt; index fae7d185ad0d..7f20ce73a243 100644<br>
                &gt;&gt;&gt;&gt; ---
                a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
                &gt;&gt;&gt;&gt; +++
                b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
                &gt;&gt;&gt;&gt; @@ -251,6 +251,8 @@ struct amdgpu_ring
                {<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                has_compute_vm_bug;<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no_scheduler;<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hw_prio;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; unsigned&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                num_hw_submission;<br>
                &gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; atomic_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *sched_score;<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; };<br>
                &gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; #define amdgpu_ring_parse_cs(r, p,
                ib) ((r)-&gt;funcs-&gt;parse_cs((p), (ib)))<br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
  </body>
</html>

--------------00v3gapjhI8QwoyXAAm5ochA--
