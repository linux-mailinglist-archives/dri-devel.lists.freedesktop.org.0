Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6894C7AD032
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 08:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96EE10E1FF;
	Mon, 25 Sep 2023 06:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8F410E1E9;
 Mon, 25 Sep 2023 06:30:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4x/AWK6vQaP95qcUrx8+b2Z+WshKKiJySseIKrHEM2i5vuhzHXEEQqQ10U7r+2HxGc8IU7S6SW+dZSCEj1Ju+vGToUxd1ovluZOUf2ioYEMkOKkSxNe8vVe/U7ijqV6kncedF1D0vmJwJxMI5vjpKYcQOfgKMgyRHX2NSLl4J4QNJmpQ4n5MC/Lz7u343Ej4G9Aw/+UKJnyRYr+uHOLJlh2DVtP+PqWlcuj5Pi19QaMLQEWsF522OVI61G50rdcy2CAEeWQX+zbEE5j0OuyciaFe1elf0ICdLZ/Ahygvn/1BduvFV6B6oMWDk0dpSiig+W4FKoKpvQfY/ELCwA7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrYlWSstY2oM9E2gKHkKl91tKusbuhZyFFqDaskVno4=;
 b=VQY8mUgAS7ggoTgVZUQNoLS6Pu0qfCAuhHbF8QHiQSSHM1aAVZfY5zt40NJZI5H4TEnONHKeuSGkZXGOkNAJcgDmomIfcA5oI0S0mC4P9p3JdhRdcMTOHtpqGnVuwDo3o3CZ63AYjxp/doeeOCULf1E/PZ2dvlYdSc13ibNUK7xc7tv4LYLUZbgtMR1jK4jBW0ehfyDdGPWwwA+BRZtwx+uRCQYu1FxxN5W5sO57Cz+feBcQ/xK/a6U/anFUJ6418LGYh6JZ/7723tiEww0r2EkIsV2Qrj0Voep4clA1dPj8hz/+0azynqbjekjLqu9eYueUoiJZuheXXbnN1qYKcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrYlWSstY2oM9E2gKHkKl91tKusbuhZyFFqDaskVno4=;
 b=Q3MgY7E4ulobKORtdFNEkYbSPHx6cJWGhq1aBrhAPtV3+DrZrq34zmYWwbbTRLxqghMJhEGXvOww90PoDARbzJVOLpQKFUGIvFz6e0OMTPeIVeWNgblf/8G5mX1AAhBzDhpwRkBVybuOmr1rMPuHvNAQpUCS1HzKZa8JlKZlous=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6862.namprd12.prod.outlook.com (2603:10b6:806:265::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Mon, 25 Sep
 2023 06:30:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 06:30:42 +0000
Message-ID: <2635922e-f52a-4e91-40c6-4f1358972786@amd.com>
Date: Mon, 25 Sep 2023 08:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/9] drm/amd/pm: Annotate struct
 smu10_voltage_dependency_table with __counted_by
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Kees Cook <keescook@chromium.org>
References: <20230922173110.work.084-kees@kernel.org>
 <20230922173216.3823169-1-keescook@chromium.org>
 <CADnq5_P2p3bmczci=pU+pG6f9+hqn=-xp1EynP2345CJZRW08w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_P2p3bmczci=pU+pG6f9+hqn=-xp1EynP2345CJZRW08w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aba28b0-3b4b-4b86-ba15-08dbbd90f13a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C65ak+mOIk4p5X3XRlJQxrrgMAQPBX9ek+i4FnRenQkrPN4gka8rLf/Vxbev1aE1OnitnikeUxqapEbbRQA0LHIocv/sCxFbF2fI8y36ve6+SIg8OI2GJ361jVQH5J598LaCMuiI/cstNEFGw9H1a3RaOh41JPYZ8MD9tpl+EosioMr+1azW/iubtJR95kvKj1FhvDlba9KlCkt2fYu++c5Uv/SMiHg1xKJkB2CtpxVcOzZamKfzGBaHYWvQBUyCFrgmEheZmN3PRhGWXA6l0FO4P/yxFUJsXNr+kei+b4BlA9mOz4R88dwk9VqJi7jc5iaTENN5GFv4iztyViWDcF9+nGccAqsm4G+eS16dmGVUTS1YAWeYcqPE3hj5+lFbrK8SoAqkEHFKDolPfX0/zhP52QDhX0KCGzIW7VWZLz3hUbRpa7uR/Jr/OXtsrjdQGNhT92B3DoCOCyk1XfPnijgSeXi18mMxHOzXNDTce1sJzsvKd37cFJchnSl/Oc3fUVLNnEWzPydJo30taywVIiP1By5QnxNICUbyVT7Q1Vs93XQsU4wE/URXO2aTS9sqksUhP2SaA1V0QL/DHn0gZdObm79nsadFjRko0cgEwVxdTvshcYVDSd8z1HaKt5kuq7NrWueskKhBHgjaYM2gPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(39860400002)(376002)(396003)(230922051799003)(186009)(1800799009)(451199024)(66946007)(6512007)(316002)(38100700002)(26005)(110136005)(66476007)(54906003)(66556008)(36756003)(53546011)(478600001)(966005)(41300700001)(6506007)(2616005)(6486002)(7416002)(6666004)(2906002)(7406005)(83380400001)(86362001)(31696002)(31686004)(8936002)(8676002)(4326008)(66574015)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1gydmFKQ2ppRml4NG5SR3NwS1dkaE05WENyNGorK0RCWXpVbkJiMlZXamJ6?=
 =?utf-8?B?MXpaU2F2YU9uZ0Z0eWlNLzN0NHdibmF1NmZCZnBGbDJ6dHBMTVF3MDluZHFu?=
 =?utf-8?B?Vnk4azdZZ2FJUVV4TExhZlQ5TGxJYTFvNHI5VUJYSlBHUG1RS1lpRTJzMmRn?=
 =?utf-8?B?bk5FdldwYVBva016bE5CR2kzU0VNN3pzMjJiaU54ZHJUYksrOGUyditSRXY3?=
 =?utf-8?B?OTFmdmVWQTlDM1JvSUVCWjh5cytsMXVBeUdoUjVINzJrY08xZm9iaElMNGFS?=
 =?utf-8?B?b3hRQXdSYnFRQyt2UGpoeUlHNVVTa1cvcW4rQXVjQkRNRDlvMHcwU01sUEd1?=
 =?utf-8?B?QVY2YXpHV2JTdmVhS2VPK1kzYmJKc1hwTFlKYzVyRkZTU1VwRkoydGtXemFX?=
 =?utf-8?B?MXJ0UWY0eERGME1NM0tLaFVoaDczdVRTUmxzMkljcHlta2RuZXMrVEhEOUQ1?=
 =?utf-8?B?THB2dnJZNGg2Z1NBNVdxZVhMd2RybnRoWk5iKzBnemxGSVNRMkl3RUd5bGJh?=
 =?utf-8?B?WFZxYWkzNm8wOWlUd1dNQVI0SXRBOUV1U0RqS3dacDB1eDVXOUhnVFpYeWdt?=
 =?utf-8?B?RXlwT1ZYQzJoSkU2SlZVTENzUUkwMXJXeG5yRzZ6MUl0b2d1TXRLZU9MSUxL?=
 =?utf-8?B?cEJnS1A0bHd2cGNLTk5GNFBoVHYvTHFMU3JVVzI4LzIvV0UwekNBZXg1V1Jy?=
 =?utf-8?B?RzF0c1JydjVBQks4Z1hJR2dyem1sVmRPNVBvQnhzQzIxRkFtYkZIRjI1STNw?=
 =?utf-8?B?Nis5cVhoRjJ0RUhBM21GRDgzRk1LTmZmY2VzaG5nUDU0OWY3ejJ1d1hEMWtC?=
 =?utf-8?B?c1lwU0FyZ0UrVEJWenBIZjBVS1RTOEQ1VE9SSStjcmpxK1hxSXA2Y010dXFw?=
 =?utf-8?B?cllwYkh0L2hUcWhJSmk0NVZMWXpNRGl4VzFaVWhGWjE2dlBoYUlzbm1rdXJl?=
 =?utf-8?B?cDNOREFZYXJ2bWlkZld4TFpMbiswUkVQTjlzSytTTGVRamFUUFVvaEZEVUZT?=
 =?utf-8?B?VkVrckF0T01jdE13MDZmelVlVFYzK2NabGk0U29pRW44NTgya05GdlBvbEF5?=
 =?utf-8?B?Kzhmd1VKTVEvb2pMUGYvWUpQR2RKNHNwdGZyWWtKc1d3QzF0NENNWE5FdjR2?=
 =?utf-8?B?Z0IyZng5L2c4RDh4ck53cWlDL2RVSDFXR3dsa3VnK2R4d3pwV0xjUTNUUnFU?=
 =?utf-8?B?dTltVW50Y2FPdTJiK0xRZGkvZ2NJSUlZelpkS0tkbWcyZG4wa0J3RFk3b2ZZ?=
 =?utf-8?B?eWFrSS9UV2JBQzVLTjdoSzhGSUkxZm5vbGg4aEFJdHB4SXlmR245R1R0ckFi?=
 =?utf-8?B?aUthWDRPcG9xcXpBejRIQVFyTkpuM2FoVU1qMkVQVkdodXN2MDRuMFBWZGQy?=
 =?utf-8?B?a0tSdzJFQnIrMzVMeHloK2ZLb0h2YXlCbTEwUmx4T1psMzl6emFzQURvTUJ5?=
 =?utf-8?B?K1U3RU4zdnRiSXpvcXYxaXN5UGMyTmRIVVBFa3ljbzlVWVBaWnQ5TU4yVjdu?=
 =?utf-8?B?THZTQzlwLzFFR282UCtGY0xkdHdSQ3dBZ0djSVVkZXdTRVRkYWRmVUgremxv?=
 =?utf-8?B?S2lNd0hzc2pla3U5WUJhVy92cUVkb3p6NGpiVElkOGNaRXNBc3ZvK045QWdT?=
 =?utf-8?B?OG9DMEtEMEJDWHl3MXRKNVVCUXZralFodjN0eWFlMURoUkFuWUFndWZ5S1Ji?=
 =?utf-8?B?UW5VUElLRDk4N01EbG11YnArakNHUzcyWG4zSks4a3V1WlJuSjBHQjZBMm1q?=
 =?utf-8?B?R0Q1TkEyWmNjazZUdDBvNTZZeURFSkJxazV1OStrblNBbXlxK3NyQXRISFJi?=
 =?utf-8?B?dk9SKzlHcThUQzF1U2RaRlJFeTdoTStZUmpmL3JCZ3ZaRy8yaW1YYWdtb0xp?=
 =?utf-8?B?bkhvWlg2MWd1ci9iZmMwSXVzN0t0R1pwWkUrRmNTOEJMWUFYRE9jblhzQmFF?=
 =?utf-8?B?Y1NZSWNkQm9hZUp6TE04NGpXTGNzck9aSXFMeC9xRU1ERDFEbVhEaXJhSnVP?=
 =?utf-8?B?OVNMbXlETGZtMjNJQ1FnNEFwYTVZa3ZpMUhQdzhZQjVZVlB0S2E4MU5YbjNn?=
 =?utf-8?B?c0xmQktmWlRaQ1lWU0NaVlpaUmQrdlJVSUM0Z3MrY1F0TEdQazRISUE2YUFI?=
 =?utf-8?Q?BVDdWhKml9/7vQbbdQvRlGU8A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aba28b0-3b4b-4b86-ba15-08dbbd90f13a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 06:30:42.5809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eeredeeq8QPNAhRn5tTSES0nxTZt7SAE45bJJ3BKVkAKNa80Xf0GwsxPR7FBj1RY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6862
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Karol Herbst <kherbst@redhat.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Evan Quan <evan.quan@amd.com>,
 Emma Anholt <emma@anholt.net>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>, Le Ma <le.ma@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>, Xiaojian Du <Xiaojian.Du@amd.com>,
 Lang Yu <Lang.Yu@amd.com>, Bjorn Andersson <andersson@kernel.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, Melissa Wen <mwen@igalia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, freedreno@lists.freedesktop.org,
 John Harrison <john.c.harrison@intel.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.09.23 um 19:41 schrieb Alex Deucher:
> On Fri, Sep 22, 2023 at 1:32 PM Kees Cook <keescook@chromium.org> wrote:
>> Prepare for the coming implementation by GCC and Clang of the __counted_by
>> attribute. Flexible array members annotated with __counted_by can have
>> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
>> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
>> functions).
>>
>> As found with Coccinelle[1], add __counted_by for struct smu10_voltage_dependency_table.
>>
>> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
>>
>> Cc: Evan Quan <evan.quan@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Xiaojian Du <Xiaojian.Du@amd.com>
>> Cc: Huang Rui <ray.huang@amd.com>
>> Cc: Kevin Wang <kevin1.wang@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Kees Cook <keescook@chromium.org>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Mhm, I'm not sure if this is a good idea. That is a structure filled in 
by the firmware, isn't it?

That would imply that we might need to byte swap count before it is 
checkable.

Regards,
Christian.

>
>> ---
>>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
>> index 808e0ecbe1f0..42adc2a3dcbc 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
>> @@ -192,7 +192,7 @@ struct smu10_clock_voltage_dependency_record {
>>
>>   struct smu10_voltage_dependency_table {
>>          uint32_t count;
>> -       struct smu10_clock_voltage_dependency_record entries[];
>> +       struct smu10_clock_voltage_dependency_record entries[] __counted_by(count);
>>   };
>>
>>   struct smu10_clock_voltage_information {
>> --
>> 2.34.1
>>

