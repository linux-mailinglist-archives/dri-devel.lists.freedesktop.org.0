Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54B2510631
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E2C10ED49;
	Tue, 26 Apr 2022 18:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9E510EC87;
 Tue, 26 Apr 2022 18:02:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPVGKFijQq8Hggpc+vayC+QV8QUJH480fxaZ74e0XP9lYwZk14UhI6sSg1dFM+WF3NFIneaoRBphvpbyhe0mKBXubliYueUdUOm7hzgkSzdxb/he2HPS01aXJvixfAYGih61RLaWJCkRP7wGXltO0dZtOsbQQyUBZld2OOCen0M3EH3oyUuHS721C9p2uMlcBex7SbEckZ41MSLlTN4xK2Hlb8ms/KZIH2FJGeU1J6vu7xYKOsMCs0ixIznbwJmafh8Y/9i8ofEpi4O0TEE5fd4XpGIm4FDqw8osyV8bfDCjl0XVqZQj1sqE2uaoYGoBjRaCAFQgFvfQ5t8lFFtgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3ZVAMfD/ggF6ZOV8r7x88TZ/fZYmnk4vBx7jaD9Kr8=;
 b=hboVQdwNf8VFVqEuoaQrFwU4sHdtAGjmoME+14h435dA0vx5GtSv39rxkHr01bTb6A3DVLR1qBHlCFJQzHjG1UMPFMjKpr2wC7XZHFP7OEk0QoHVf/mqNwE1ykVuobI5JBdR2eGeTVHKMCCTnjZ5erW8J9me2cco9F3rQlkQAzymtqpjr6SM0gVVx4yuox1lCBIza1cpKH2HsCKNeHKBjkjmU90i0+w+67tpq6ck7PNNWwEjS0GOlYjkvZNMQgB9ogH+WPqf+G0a32C11osBj9e1kox+DMQyGQH2ZW+7m97qbFDPfQf8opMwgO0jozqpiewsGLiHVVwBxws0BDl4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3ZVAMfD/ggF6ZOV8r7x88TZ/fZYmnk4vBx7jaD9Kr8=;
 b=FXfAITlJT+YorgycFBwdsmHYLgfiswyZFAnytYf7nHms7EgGRdO7vbIEY1ZVc0ToUeu/+qNFUENhdWkeD46naMsfhTe9LXI0UcCRqjt80Gu7lV0H7PrLdxb5JYi37l5Nu4TmNq0O1RGVdb93kr3sTKAh8xW3gw5eTfIB7zxhBv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1737.namprd12.prod.outlook.com (2603:10b6:3:10e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 18:02:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 18:02:08 +0000
Message-ID: <c32bf2de-0e48-e3b7-98ae-0bcd46933465@amd.com>
Date: Tue, 26 Apr 2022 20:02:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>
References: <20220412212558.827289-1-olvaffe@gmail.com>
 <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
 <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
 <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
 <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
 <17fc1a68-747a-f707-364d-76f12a2b535a@amd.com>
 <CAPaKu7Rny7pxsPA+cnow0d6PAD2YCb+b+j1_Di5gziyOVNLaYQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPaKu7Rny7pxsPA+cnow0d6PAD2YCb+b+j1_Di5gziyOVNLaYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0744.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9513ee1b-9ed0-4db9-0ca6-08da27aee0d2
X-MS-TrafficTypeDiagnostic: DM5PR12MB1737:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB173779F1E4615B9EF251A32483FB9@DM5PR12MB1737.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1UpAc8ZJTYnie2+XUu1NT/aKw60Nh4HvgRoLjYl13WqoHCPoW3ro0nzbA3lZxM1yYmVp58zybSfIX7YIb+zOKjXZbGFwzUY+T7K7xmDbewPvWBHMXO1ciDP7Km90dAcQHhAJDeSe6EdZj2+fbiR8XSnHFvziZG9qak+2Qp65mIHEwY1okazRbaNdBNYOkLaM6F3/2dFIGiUz9k59rQmjWhCbgHf27m8nWSTjK+SRakA/C69JT+ygSyUqkxJExqyPQn2f/iwtl8FHzkOXarbCRvQi+6MFnAxSQc4tx+M17zVQbvb8gqZBm4pYvhGPLm6HnEsLsMhttc1aCsyTikxAEs9RCK7pPu7h0J0mX/Q5h44BvieKwKkwyBakTesT5nARNOwukDBnf6P2NfYbpOUVdioc3fYemFbP3k5F5Ed8PbHa0s+Prw12g0pQcHE0gN0gzEBag4QiuOiE6k82oIlyx5xz5Uh2o7CuRguEhqtNQZ6fXVfsS58MI6hFascUHsSxYIWGnyZci+S+nH2o+ARK20LFxJ4GlEvSXcdfDfX2eXnd+W+dE9nf132oCRd6wPgFOTLD9B9vGoZs/46M0OygId8tMDpy+dnx3Fu21SQy2SYnGZjTqs6J1F1wOwP85oBXqaRF3Gsy6bJz+9O2RCJLIDqYFnjRgTrH552CZKHMVvyB7VpXkrSnzPotSUHd73cJLKK9l9wKbFiHTNHqHXYF0zQirjl7a/xuU1yUNgYmx0m50snSITMK8eQ91/HSiLZptaf02kG9S/FgDKfJL8+9CO1ORnKsEsT2nZkG7nEIQ9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(86362001)(6512007)(6666004)(7416002)(31696002)(6916009)(316002)(54906003)(8676002)(66946007)(66476007)(66556008)(4326008)(2906002)(508600001)(6506007)(5660300002)(8936002)(6486002)(36756003)(2616005)(186003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU5YS1A0QTJnQzIwaCtla3IwTm40Y3BCWEVLZFNqRmRMUG5FR2FpY3NDNzAx?=
 =?utf-8?B?YUF1NkpKcUExYXVjVUpwdHp2RlUrR2ZyYnRjZ05CaVVjanJPTHpmaHpjNTRz?=
 =?utf-8?B?dnJ4d0tuMFMwRHhobEx5MVZNQ2ljS1RnSHJ1VUJFbnBVRHBaSmoraHBGbktK?=
 =?utf-8?B?RE1JQ2lnSmRjdStMTFNvSUFhSDh1UytSV3l2TUd3a0hTUmFZVVREVVhZYU1z?=
 =?utf-8?B?ZlY3QXNtdXFsajc2M0ptaE9taUdFY0FWNHhmNW1jM0lwMnhIUzZQTjN5L3JY?=
 =?utf-8?B?U1B5c3RYWE14MWt3eXRWQkxMZ1BmeEFKNTdoUGlxVHMzazV3ZDJ3eFN2Qjlt?=
 =?utf-8?B?TVpGQlNYSUlXcjhKMWl4UkxPQWNqMHQzdnhXVzlZSFY0VWppcWlBcWNyUkxp?=
 =?utf-8?B?UVROaHovYjVLMEJBbjhjc0RjNzBkQkFZaDQ5RFpJNGlSdGZhaG9PWW5CQ3Zy?=
 =?utf-8?B?SHAybWkrelJxQlUweFR4VFRpa3RjT2VsQWVJd0ZUL3I0WCszSmx0c2h1Z20y?=
 =?utf-8?B?aXpIZzM2MFNLSThNUHdDV25XSHp6OWo1a2V4ZDNxdW02N3IvZE91NFRXQnBP?=
 =?utf-8?B?dFRkeFFlK1VJN2p3T3pMZVB1Y0VUcTdRbXpkMXkrMUlEQWlRT3pKNGdpYXJp?=
 =?utf-8?B?YkE4c1VVb2l4VGZlZW5TQmVIMG8yb2Y3NVRvTnFNRWpOWGFBUVlMZ1F4N01j?=
 =?utf-8?B?QkRWaHczSWxKd2NRNUc2dWFZZ0JLRzNsT29WSHdzT3AxZHFnMXM3LzRUSzdJ?=
 =?utf-8?B?V1p1cjdkZ05hN1pGOVg0Y3d2TlZRTXVIRmNtU1NwQ1VzZmJuVm1XM2gwTStH?=
 =?utf-8?B?MG5sVkJOUWpHQTh3bzUzN1NDUTVzWXZPRS83bm9wa3lLRkY2Zi8wQ1FrR0Q2?=
 =?utf-8?B?M01CRk5SWTNmOGl6OGJ3ZVQ5eGZZY3hIcnYzTElVcEZrT2l6eEs2SWpxU2Yv?=
 =?utf-8?B?VThEbW9SNU1Yc2lUNXArMEhHUjB1MlhxYkNXcDlHQXp0TzZxNjBaejFoMXlu?=
 =?utf-8?B?TWtnaTBTWVd5dkNoZ0M2YXUyL2xPbXB4ZTY3ZEpCVFg3Y2tHa0dhWVp3eVdS?=
 =?utf-8?B?YTRscVB3YlJYaVVnZUpIeXJ0WmJNVi92cWVUTkxZRmRPR2o5a2JDd0JCc0R4?=
 =?utf-8?B?S2xXakpRMllIeDBlZXl1U0c1VVFUS0M5dDYyRW1Kb0xWY0pURTlwYmZxcE5X?=
 =?utf-8?B?MzlEWERYQkY2QXRHWU5tdzdxN1ZqSTRWY3kxVVZUdEpjd0lGWU1KUUt3SUls?=
 =?utf-8?B?cUR5TU5HRnliNERIbGdKNlhyTGo1RCtPZjVNY1g4NVpzY0dYYWE2NWlVTFpL?=
 =?utf-8?B?cDltTG81cm9XMzNiOU15dncrYjdSdmIxZDFQQ3JYZTcvR0x2blhBYVNYRnNv?=
 =?utf-8?B?ZlpNalhEVWl3SklRcktVTDdvZHJRTWNYek5veEkyRkVqbGY1Y2dYYURmMDJP?=
 =?utf-8?B?OWR0Zm5zd2RLRU8vMTBzeXN5NEN0d1lvZXJOaXYvbmk5dGhZbTgvTnV4ZTVw?=
 =?utf-8?B?TzZTb2tEYzhxckhsUHJzbmQ1YW93a05wejNpbzlPUWYzRFZXVGU5aEhXWFlY?=
 =?utf-8?B?dnN3RytZdktnbTloTDJXMnRjaEZ4aUlwTGRWcmRKaW1sQitvYVRwSTdIWjRm?=
 =?utf-8?B?NUw3S3BGaGVkN0lGMkdTSmwzVEhxRU5PUUZ0TTRzQWNDSVo2TnVuRm56eXN1?=
 =?utf-8?B?eHUrQkFaRlpQUkpncVZWalhEQWN5V2pCQlMzRnY0QjhCZHcxYnBoOFRlNEY1?=
 =?utf-8?B?Qm1UWkI1ZFVJQnFYUngzWGtWZE9zZ0ZWQ0VpcmMyM3k0aTVwbHpteU1IeVFk?=
 =?utf-8?B?cTZqYnZYb1hydHh1RlFveGRjNFp0azVQN25IbUtSUWF6enNnV1k2ZEVwSHI3?=
 =?utf-8?B?RXJneUErZGUrOVp4MUF0M2xzL0ltVnora0tiMUJ2SU9NdjZCSXM2VFY0UnhB?=
 =?utf-8?B?TjVWSDh5M05uV3JON1QydWZTWHphSlE2YTMzT1R6Zk9XSHgvZkdrQVNPZmty?=
 =?utf-8?B?VXFwZkQ2ZTl4U1NHdGNOWlFSdWhCQldTbGlYNXJoV002TkRQVU81SEttN0Ji?=
 =?utf-8?B?Y3lKNVhrMUlnWUUwbzNrVWcwQU5CMVFrYWlUTnp4TDdoOG4xTTZwY3YzL0Fn?=
 =?utf-8?B?dldsVktOZWNKOG14RDZpNFV3WEhGM2hWVlBKUThtbWVuRnorWXlVOXBWVGFC?=
 =?utf-8?B?bFRxOXJ2dnZWMzRPbUtOZ1VqMlAvbklqNmhQQ283TzArSWVqdDJqZzRkRFJC?=
 =?utf-8?B?cnZnYmNsUG5BcmI5V2JkbzRrNEpDb2RIOEk0UE9iQWQrYzU5enF4Q3oraG9m?=
 =?utf-8?B?Sy9MNzNJb0xRNUt0VHNXR0lPMjJWNDhxbmdIeEt6L1NQM015TlM0VTFqakdx?=
 =?utf-8?Q?UfK9OFCQ0wUInKbs4/2T/BkD0Tquyt7DQovqVKDfdWlwp?=
X-MS-Exchange-AntiSpam-MessageData-1: ca3ShMtA+73JEg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9513ee1b-9ed0-4db9-0ca6-08da27aee0d2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 18:02:07.8657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExZ5HeSDj1IlCEOX/J7F1UhTq8mjIFnQ6hiLAeTHD7FXGRu0Ct84B9cpDid0jBRk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1737
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.04.22 um 19:40 schrieb Chia-I Wu:
> [SNIP]
>>>> Well I just send a patch to completely remove the trace point.
>>>>
>>>> As I said it absolutely doesn't make sense to use this for
>>>> visualization, that's what the trace_dma_fence_init trace point is good for.
> I am a bit confused by this.  _emit and _signaled are a great way to
> see how many fences are pending from cpu's point of view.  How does
> _emit make no sense and _init is good instead?

We had exactly that confusion now multiple times and it's one of the 
main reasons why I want to remove the _emit trace point.

See the when you want to know how many fences are pending you need to 
watch out for init/destroy and *NOT* emit.

The reason is that in the special case where emit makes sense (e.g. the 
GPU scheduler fences) emit comes later than init, but pending on the CPU 
and taking up resources are all fences and not just the one emitted to 
the hardware.

On the other hand when you want to measure how much time each operation 
took on the hardware you need to take a look at the differences of the 
signal events on each timeline.

So there isn't really any use case for the emit trace point, except when 
you want to figure out how much latency the scheduler introduce. Then 
you want to take a look at init and emit, but that isn't really that 
interesting for performance analyses.

Regards,
Christian.

