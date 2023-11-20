Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A321D7F1770
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 16:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BF210E04E;
	Mon, 20 Nov 2023 15:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB0D10E04E;
 Mon, 20 Nov 2023 15:36:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GS+qN7AWaYjGnRe+RfEGEhpNqVbNGbdtXXcslmWwWyCsCfkt9DcqBeRrnHO4atWXS+1jy3sK4oSOjQlHmFfnLeFQSZrJePovhi9L9qP2ZcBh2+5NgsBbaE2DWlP693JKrztXl6jYzHbattpjVGMpYwGevq2FAHx5Sq3bJJROZnenl9Bj3nQ1t4ypG8g/RZMAyEGA/XwLhpW1MuivFH20TkP32zbx33AuVuBJqjDft7L5sD/WRp8UZzVR1p9ETtM5gOZt5XLQVglkw/vbUlRQBeScBRYgP6BwtH3JSTN6hLx+fAl9vZ2n3i1OjklI3KPQxog5LLzUvP6N/EzXpcVNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5Msi3veq7g2BYPRCBLmE6LY9CBzSyijyYsZSKUQIg0=;
 b=ehY8sOEV1iA5kcA3e/wSfuMg7uRofLHEsIrfa4Km/LZ0c4Ot3kBbmf0HSf9G86rBR6MYLgpXbUlDmM5t08MrhvT9Vhv8XymENA1oMLfAmrPuN5f9+yIWIpSnKDwqERGbUzffedYkKN9IwuzIvKZ8IH1ZMKctL97Da6PAAhS9GRzngAWr386uPg0bEAXBATZ33dl6E83GosOh2VUFoojDBa30gC+j2zQPDKbY+bPduslQouxucXjtHb/dTKFOgERYdmzwiX60OQ/+B+cc4oAZkeSDGiS2B1a78RXpvh885FSPCnfbJcB5VIe1/0xrM7vMBdCHqcLZtj6LVmBupkj/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5Msi3veq7g2BYPRCBLmE6LY9CBzSyijyYsZSKUQIg0=;
 b=GYrrbbtes60H8C78j1/xJFah2u8E64ecsD5WK8foWEcWK7YzrlpuY6v6GYyI4NVjkMU1tt5CUNIy361yjV8UsAym/eiPtTC4c5uigSjMH6UGYhiKLHRCbJaQ57lj5fj4hZhzRa6IzqTQQCY/3EhBVqlnuW3V9xqA0Qwrodlci9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS7PR12MB6168.namprd12.prod.outlook.com (2603:10b6:8:97::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.27; Mon, 20 Nov 2023 15:36:15 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%7]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 15:36:15 +0000
Message-ID: <22a0edcb-26fa-415a-a05a-e4d807e2b703@amd.com>
Date: Mon, 20 Nov 2023 10:36:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 218168] New: amdgpu: kfd_topology.c warning: the frame size
 of 1408 bytes is larger than 1024 bytes
To: bugzilla-daemon@kernel.org, dri-devel@lists.freedesktop.org
References: <bug-218168-2300@https.bugzilla.kernel.org/>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <bug-218168-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::40) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS7PR12MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: f40ba01d-c6f6-4ad4-e50e-08dbe9de6ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kAXf1ThykHo5M26v3JI0TgNHRB5qZwZV82CLtbe5UL2zrJZXggKw+bqO7McJpFa1NQkhDBxxTK4rgsEW5haOEnabf+IjGkPyAHMnhl99/yrK35Cut3YiNVxPBLXPv6jwBW3hRMXDxWTIkHkWKjMKRSqpoHWuiGJa64FWzIDWpTVJTTSg6FrE3yOhylQMyD9oIl9pdciqnAPrZG593k7FfFjeBp3Xt4T/O53vezhymCZlGK89vX5EMnnKmRIsQImi9uTuplACdyvboJONl6Hfjb4xb4iPcKmzmQ8gDFzW5LZi99cX/HCUZkv+Sr130yEP+ZZrWsWb3OQn8MJU1Piulg3cfl8CnqvU/yocvC+g4j/AGgtCbLXrCkHV+AQgbOdshQBcwYsAbWRrzMxwkRjBn9z4LxV2x45BJpkqDs5VyOdLTmj262ua6jgmR/UC75vigaVHZ+S2Rhl4is/739lXMK+EDbWvMOKf8e11BTEFrG0ToL/7R9WrE1z8O3K6cC2BCxbpT0IQl7Q/3x/0tSYfs6l8Lawk0ywSNwevUu04uAS4VABmlNZfClqw5FuaetjzieEMi/3mIjuH+Fa9eRbRDo73451zqNmzXhg/dDXacncoxPoEn3potHWGM/WdfzxHMixod+bKTCtapZTEzBN8VseoS7hNX7a4wHcvZaJVuaW1wSoh/eVKdusaJswghvvp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(6512007)(53546011)(26005)(4326008)(8676002)(41300700001)(38100700002)(8936002)(2906002)(4744005)(44832011)(5660300002)(478600001)(6486002)(966005)(6506007)(6666004)(66476007)(66556008)(66946007)(316002)(36756003)(86362001)(31696002)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXByS2VGUXNKL0JtVHo2ekZaaVB6Yk9tVWdwUXZxY1JxQ0phUlE1emxNRmpN?=
 =?utf-8?B?Mkp5VDBhcXpXcy9SMGhSYjA4aS9tWGcwazExSUVobHBMWEZ5T2tuaGxkK3cy?=
 =?utf-8?B?bDNDaUkwVEhGamppMmI4VnJleFBJL2xDeDhjMEZGdzlTOENQN2M0ekhRN01V?=
 =?utf-8?B?OTJxZ2lqL21CdXpHM093eDQ4b3dhVGZ2MFR1UisvUUgrRi9CTmNnMFBvV014?=
 =?utf-8?B?cldEU3VBK1R0OHlSWDFaN0RXTVlrVnV0K1ByMUdlZGVZc29NaUFhQnZPSnNO?=
 =?utf-8?B?MnMvbGFNRnpKL2JiRUR2NFlmdUc0eDFaYmVaaVNtM010NWFWUlljL0paa2o5?=
 =?utf-8?B?M2dIUC9raG12b1pPSUo4dEZ5UGZmQWZSL1lBMnBOb0pDL0NESHNIVDM1QXNa?=
 =?utf-8?B?UnB5cjV4U3pmOENpNm1vNmVIekRkb3JJbnRjYU1Falc3clNEZ2w0Y293cHlL?=
 =?utf-8?B?MlF2b3VrMXhNejlOc2k5U2Z0eml1amNuY3N3QmNONHpNQVYzdkhyVXlVaGxj?=
 =?utf-8?B?eUdlUzU3d0EvUmU4RlJua2UvTUdPc3dQM2owNkpJN2FDZ3RHZldNem96MURB?=
 =?utf-8?B?TzFqckkvcGdVTzlaYlhpcUQ4M1loek12ZXAyK3ZHaGI5VzFEYU5YWUVRSGJL?=
 =?utf-8?B?cEVsLzBVd0xRUnRZQVZjdXFUOFdDZndRbEI3bUUxcEtUY1V6aVdSQ2l1THgr?=
 =?utf-8?B?V24vZ21tc2tyaHhsQk1EcEplVHNJcnp1MGttTFdvamlHRWpuRWM2Qi9XMUo1?=
 =?utf-8?B?cWJIdGpSelQybkpMaWUyS0I0aFl3ejRuN3VlNEQvcUF2RlJNNlFMTE9CMmhT?=
 =?utf-8?B?Q0IrTUJyMlFiVmUyak5mV09ramxWUldlMDA5Ym5XcEJ5enZUUEdqMVNXY2lU?=
 =?utf-8?B?VmR0VDBpeitYeDhFd3BGK2RhUHRFZ0lvVjQ5c2FTVXlBV29NWGlVMnkzVktU?=
 =?utf-8?B?dWx5R0xhODNHelFla013K056Q216L2tzSVQ1bi9wYkxEd3gyWDZ5R3JodlpP?=
 =?utf-8?B?VHBvS09leitaNDNyV3dvWnllTk5nZkw0VlY4NGNGTmpsaDYvbkhNS2xheUNY?=
 =?utf-8?B?MzJ4NlJBK3V1RXNvWHBTdDBtUzlsTWMzd040TU5xU3dlemRuTHZBTitVR1c1?=
 =?utf-8?B?VDVydm5TNDRJMElVYVU2ZGNCR1h3ZVZNMjlRYUlhRWptdXo5OE10UzNjT21u?=
 =?utf-8?B?WCsyODVBUGpoeSt5dXNhc0tGbENzSWJ4K1ZBM2RpZXRXK3hmdkZjSEZyNDJa?=
 =?utf-8?B?SkI3WStTV3JLNm9ZeFNKWVBPSmZ6Q0NKRk50aEdDMDVQeko5d3BGcXRBcm8w?=
 =?utf-8?B?bmxOeHpBVVN2UENVZ1ZGaUtTallBemdkTmx6bXVHNDM4dHF2aTJKeHhYS2Zh?=
 =?utf-8?B?UVZsTDMvdFZPNGoxZXp5U2dLVUNWSXU2NHo0aEhicDlwbWY1VTl4Q1ZadUtv?=
 =?utf-8?B?ZkNWVkNMRDJEMXpmTWo0c0hJbGp5YnVCQjVOQ2dRak5wNVlDZWxLQVBUczJY?=
 =?utf-8?B?M3pON0UzQVp2VHJEVEk5Uks0UEFyWDJhVm9JYlMrekVKZEZLU0xOYUY2OFNW?=
 =?utf-8?B?dEZMTWpOSmk4eWFVWjI5NDFFQldUQStIb29kUUhpRGZkNU4zSzdXLzU4RW9y?=
 =?utf-8?B?Ykd2NFVGcTI4aE9vRzdlQ3QzUjdoMkZQOEtnVW1BVnFqcGd2aUo3VTRtR2Ru?=
 =?utf-8?B?RjNGQ3VUVHEwaTBETGRhbFpaLzlGNjRmQm1PdUp4bkRnZ2VsMXFzOXRURU4w?=
 =?utf-8?B?VVRjS1ZSRnJMT3ZOelZxRzNPNHFFT2E3RDB2YUN1WHR3SUplVFpuTTJyWkps?=
 =?utf-8?B?ZTkzZW9yNUU0MTcvS0NYbFJlbDEwRTkyVDBETU1jMXhOV0JaV0ZyQU5tUU0z?=
 =?utf-8?B?ako1Z2pOTHJwdGF3SWRUNUEzLys5TEF4cGJNTnNEc3hPL3BFQ1RYM0hseE42?=
 =?utf-8?B?UDAwY2Z6M2NQV1FHaXFUTzRkNTRRT1pBQmg5VHlBVDhWUXREbnIzS3puVDIy?=
 =?utf-8?B?SU80bHdKbHQ0eWREN1Era1V5Q1paV2dMeG9wb2t4cU5NV29yNGx4SHNPZmc4?=
 =?utf-8?B?elFycUxLbG9qUjNmOVF6Sys5NEFOY2hEUTc3aGE4Nm9NN29haVRTajBROVJG?=
 =?utf-8?Q?oDjr/4Tr9vd5bLE0e1j9yu4ej?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f40ba01d-c6f6-4ad4-e50e-08dbe9de6ead
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 15:36:15.3449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMrgyKNy4DoNlWbBKeM7xOxxXI4io/DZozmVUEOOQ6/+xKSwNsrYF8ElNof8gR9LgPy479/DcT4lqcaVoX4grw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6168
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
Cc: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ amd-gfx
+ Felix

On 11/20/23 10:16, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=218168
> 
>              Bug ID: 218168
>             Summary: amdgpu: kfd_topology.c warning: the frame size of 1408
>                      bytes is larger than 1024 bytes
>             Product: Drivers
>             Version: 2.5
>            Hardware: All
>                  OS: Linux
>              Status: NEW
>            Severity: normal
>            Priority: P3
>           Component: Video(DRI - non Intel)
>            Assignee: drivers_video-dri@kernel-bugs.osdl.org
>            Reporter: bluesun654@gmail.com
>          Regression: No
> 
> Trying to compile Linux 6.6.2 with GCC 13.2.1 and CONFIG_WERROR=y:
> 
> [...]
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: In function
> 'kfd_topology_add_device':
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2082:1: error: the frame
> size of 1408 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
>   2082 | }
>        | ^
> cc1: all warnings being treated as errors
> [...]
> 
-- 
Hamza

