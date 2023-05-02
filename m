Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62FC6F3EAB
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 09:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F21210E4AC;
	Tue,  2 May 2023 07:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421A310E4AA;
 Tue,  2 May 2023 07:59:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrZrdLA/HIhTXCtAgYk/LYWaQ4mwGrMhxn9J8LTPu31XAoBdi/ipTzi/Wc05rr01N3eoHBW0c/j0v6uA83dmhq3vZhjoLDtwJlWVAriRwvBMTy+oYtdfXJMAYhEq/9aU9T/RNyhQqNnhWPPLVYzqcHTYBpPiXbjzyaxtJpSOXv+julrXPsW7BogR+2fxHESd2VvCPcvy2OSviRzK7EWuDtG0PyjMREhOSoNPxxycyq8unPng1iTDkZb5poKzbsIIue9oYdCeksp6bPU6hjk22z0Ub3z3mecKndoDSJm5ithYqF/X+GX7uP8XEs4frWePR4lm8qFTYVVn+EWMbmyscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3cpuYoCCiIXrZau5V/0X+Z59lTwq8Yh1qhGncfOYWA=;
 b=DmTNraXjd4iOV/aIUihzIJvKorXmg6OYc9vA2i4XZpM+3WWKB3NZBjf9m+JsRRLTp0rZBnWkI5pK3XAMKY1Z8ADqCADT0SeUE98IMq3Y2crPPuHNnBYfsJHJNQKDGmWLps2nNKSqltfL0TOiGIisb/5BJjTe7wspmykQLG89sSJ3sPW5vqAdBrOn0tdWkqkWf7Vt0++ixS15GiFs9eYHbbnzp3KgsyVhc9aM667b7zT2/di+caIaachSh8NtLFvEr1DIH9zCqYwHObYldfBuGcCdJ4sm5d7fkT17oEESg12svxrTy7hnF/QKlC22Zp+cPTo03abtg61kib8TNHT+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3cpuYoCCiIXrZau5V/0X+Z59lTwq8Yh1qhGncfOYWA=;
 b=VUJgBU/tofAG3fnY951y9pXEwtFRNs06LeMGHwZu6B+M36h/CfTipVzBxpQS3rlHwIhyK86LRMX2J+rWZSDCok3gL+c/CnM121iejiyF69ID0x9CcQOIk5b360PB2p70JSIAAt3dUZcaBthEtKIvWAbM4OHfcRjh2Apma3FyM3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 2 May
 2023 07:59:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 07:59:28 +0000
Message-ID: <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
Date: Tue, 2 May 2023 09:59:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 92128c1e-f100-4379-0cb7-08db4ae32794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3WLhOgrQ76JJQWA11GsB/y+qH0P5PU8IlBym1nakcpSqg00A0iuiLse12kCNzl4vWl/7Q4u50wHS395rb2t+D3xh9RXsGrOWT0YOTX5fxpMhflTGoSF2vrs81JCvFekOBtGHWAUOlx/P8007+2N1fJ+5aBKzIWp45dwkiCPqtPQUxH8bt/+KYTFjbqxZj9zxtZq80RJcy05KresY+lc7nCkH9zIsIuohxtMMINBVWi7hCjxnvykgibx4qDsb+USal3AjwthqmpbzoA2iE1pIVagW+Mnz/A8Aylc0+oX7cG21FecaVWZe3Nd5EAqV2bktGsLmcF5mftRXK9Epii1ZORyfWY+2zhxJGVAYvK76NAt+Lu/te/05FdITnmGJhI1KweJLi81OckEMhcJMxT150fxMMefCZk3BiDVQoj/p++iixqFkOjD1i1+WALTSN7g7eSI7zH9NuCePKpO5UKct/Xa+2q8UhbDYlgIMg6zXV+o6LH032ASqGicKZ+Hn7+YuarkIncSKwAVIp9jtWV0Mf3pi2jPAQsXn+gS8kQ4kXQhmq3QDd9Sqstwu8CTNsmW7pZQNdICnE7XTxsRYieNl+Alx0N+OlXkwqG1GMZDWpJOvFDuSXCntoRo6TzXSXLu/Vmt5TX82jFOCq8PLk91Eww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199021)(316002)(110136005)(8676002)(8936002)(66476007)(66946007)(6486002)(41300700001)(7416002)(478600001)(54906003)(66556008)(6666004)(5660300002)(6512007)(4326008)(31686004)(6506007)(2906002)(53546011)(83380400001)(2616005)(186003)(31696002)(86362001)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K05VMXpQMEQ1eHo1V1VkeGRXUXdtQkE3SzZCWnFQa01aU1pPeUVTN2RWVnBV?=
 =?utf-8?B?VDNDMXlIa09IM21jRWUxbk1zSVEzWDV6UnJEejA0MDJWOC9kajFpQmYxV3Zj?=
 =?utf-8?B?dUdURjRPeW9xUW83VmsvZjBuUkNEM0pPV2xvTWNjblZQeFpDMnp5UEk1TStQ?=
 =?utf-8?B?WmdDMXkwT2MwempEd0RuRm1Gb2lPaDNVZGFTMi9CeUgxL0dIK0djWmw5anNN?=
 =?utf-8?B?ZUtiUkQ0cWpabFN2M3pEcEpnOUQvMHA1UUV5d3ZTTXRPaUJ2Vjk0cVZkdS85?=
 =?utf-8?B?d3lTeFRuMFAxMFJCY0pSa3hRNkMzU0FXYlIxR3ZZd1BuSkdPeGxjYytkRWhH?=
 =?utf-8?B?ZnVObWdVNXVjVk9XZnJWK2hpQjZTSWRoRDRWdDBTaHloODJIaEthZEgveE1M?=
 =?utf-8?B?S1BHTFViT1cza3J0dWlPd2hFSEVZNWNwWDlXWU9kVEdhTXM0SU9PYnJwNXhm?=
 =?utf-8?B?VDFLVTN3ZktlTjVBSE8ycDBYMWVjc01QUk83KzBWT0xPL2RONEc5MEg3RmIv?=
 =?utf-8?B?UG9DQUl3emVmV2tKV0NLUnFkRWg2TVJvWmhrRW80N25Wc1lJZ3VJYXZNN1RK?=
 =?utf-8?B?d1ozQ2luU3JNbVE0VU5OTlVZMldCS1JCQjE4cDY5SkdlZWE0Q2M4SnZlblhK?=
 =?utf-8?B?SVdWajFmdmVEeVpoSEVSTjJtc2QyTnJnV1NpOEJ5VGZadml0KzY3YkNOaU1k?=
 =?utf-8?B?RFRCbjBuQ2dMOENIVzJVVkdsVi8vWGFueVUxUzFIejVTVGNGTndnTlRGUTlI?=
 =?utf-8?B?YkRxSTJIQU5aWFVGM3BUUHIzMEVLbDRZU2lrbnRGUWJ6STd6VGV4Y1dQSUxR?=
 =?utf-8?B?Mk9EcSs4ME9BLzA0V0x1dUJYNjV5RW9nTll4ZTNTdUhSUDVuTkVlRHpveWJl?=
 =?utf-8?B?MHFNTVp6R1lYRXZray8yUStIaThjbWtrNVZjM0kyNWE0SFVKc09PMG50OGVv?=
 =?utf-8?B?WFBraUg3b3AwSFVHMSs4K3d1bHlObENqNEVMRnhZMmp3Q0ZHR1ZkeCt6azFS?=
 =?utf-8?B?RlA1UjZSeXlGUDJrcWpkTndUM0krd3JsalNBN05zNStVRFRjbVdGRWRsV3pv?=
 =?utf-8?B?djZxcUtCSnhuL1ZBUVdSUjJZU3dqWDZuZjV5OVFzMzBQaUhRMHYzc2t2Z242?=
 =?utf-8?B?RDBFMmpnNUZVejFnVy8rbnp3TW5PbHo5b3B6MEZiQVBsWmI5K2t1RXU2SDBY?=
 =?utf-8?B?YnRMU05jTW9JOCt2R3l0a200cDJHZUxTaXFaRS9KejRQdlN1cXZjRnVTWjk1?=
 =?utf-8?B?a1ZZczh6dnhqeUJGdkJUVzUvU2JhWHpZc0pZSmVIUFFibGYyTEVrcGpWRHFp?=
 =?utf-8?B?czA1QUIxSUdwVVo3M3ZaTnVPSERGK2Rab0lvMWxOQzRCdUVESHQyeXBEcXhr?=
 =?utf-8?B?VHMxZ3h1WU1ES2dMVjRoZWExZDExSk9nTjFwSU9CVGFiMTBxNVNzQ2J5L0I2?=
 =?utf-8?B?eUJsejUzMlZyQ1dXZnpyaHg4OERoTXNHdTl4Zmt2cURGVXF6VmFqOWNWR2xq?=
 =?utf-8?B?bVdJU0syczJhMmRCK2dSeUU3K1pjMnlKVXJFRHpXd0YwSTBxbHBsVGxWRGpB?=
 =?utf-8?B?R1QyMk1Vd3AxUkZ1ZXVrVWhsUm1RYXhveHdWTXBWYVhsY0pjb2hOUkpIaVRi?=
 =?utf-8?B?M3Z4Rk84NDBhU0ZoNG9mNTN2L1paUWpQb0tzeE0xRnRybW1YTHRudDk2QzNJ?=
 =?utf-8?B?VS9tOEU3YU9QWkJrVWwySTc2aDBRdmpmMktGY0ltblh0aGk1M1ZUMW1yNjhD?=
 =?utf-8?B?T2RCQnJKeHBaRldWNTlqdTNrUzNKK21tQnVIc3JtWlVyamh2RDlIR3E5bmEy?=
 =?utf-8?B?cUtvUFBKb2VQMWxwSDY1OTUycVhpcGo1TTZCZlZXM2djQ2hJdnBTcXdVWlRv?=
 =?utf-8?B?V0VySmhrRUVoaHl3VmtWTnhEVDZDYnFkN2QycVVFV0dYSlBLYTFzTHVicnQ1?=
 =?utf-8?B?VFloaFdRSXFES0xZbVFqL2kyeThZWmxMcE9jWUQzVFhEYnEzaEtiRU10THZu?=
 =?utf-8?B?RHRQUmUyTitXUFhhejFlZllwMXlISU44STlrOUkxb25vYlBSWSsvbW96MFAy?=
 =?utf-8?B?TUFhSEVCNC9OUktnQUFqeE1MaGhic3MrZDRXbUhla0MwWEpoRm1oT08ra2Yw?=
 =?utf-8?B?V0tHS3JmSTNuaU1RS3JxT2RGRmlocittL0JXRUNMeVJuZmZhZjdWbitFYmFy?=
 =?utf-8?Q?5r7JY0ZPNxF4d6whkUZMKiLYhzxFI2AcCG8aWkq1Z0NS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92128c1e-f100-4379-0cb7-08db4ae32794
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 07:59:28.8005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k67V9uGptGv9kBp2BDdPHP6undj1gO0e4lKQqR3D6MPpv61ZfC+GJCEpkk7a46/A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.05.23 um 03:26 schrieb André Almeida:
> Em 01/05/2023 16:24, Alex Deucher escreveu:
>> On Mon, May 1, 2023 at 2:58 PM André Almeida <andrealmeid@igalia.com> 
>> wrote:
>>>
>>> I know that devcoredump is also used for this kind of information, 
>>> but I believe
>>> that using an IOCTL is better for interfacing Mesa + Linux rather 
>>> than parsing
>>> a file that its contents are subjected to be changed.
>>
>> Can you elaborate a bit on that?  Isn't the whole point of devcoredump
>> to store this sort of information?
>>
>
> I think that devcoredump is something that you could use to submit to 
> a bug report as it is, and then people can read/parse as they want, 
> not as an interface to be read by Mesa... I'm not sure that it's 
> something that I would call an API. But I might be wrong, if you know 
> something that uses that as an API please share.
>
> Anyway, relying on that for Mesa would mean that we would need to 
> ensure stability for the file content and format, making it less 
> flexible to modify in the future and probe to bugs, while the IOCTL is 
> well defined and extensible. Maybe the dump from Mesa + devcoredump 
> could be complementary information to a bug report.

Neither using an IOCTL nor devcoredump is a good approach for this since 
the values read from the hw register are completely unreliable. They 
could not be available because of GFXOFF or they could be overwritten or 
not even updated by the CP in the first place because of a hang etc....

If you want to track progress inside an IB what you do instead is to 
insert intermediate fence write commands into the IB. E.g. something 
like write value X to location Y when this executes.

This way you can not only track how far the IB processed, but also in 
which stages of processing we where when the hang occurred. E.g. End of 
Pipe, End of Shaders, specific shader stages etc...

Regards,
Christian.
