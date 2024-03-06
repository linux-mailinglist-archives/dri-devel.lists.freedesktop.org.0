Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B687400B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D9C10EAB3;
	Wed,  6 Mar 2024 18:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AtnoDe9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0611010EAB3;
 Wed,  6 Mar 2024 18:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faDlQcM7vUxW1jpvf6RXNQGhZedyUdnbLUAt+sks9iMflu10fsNga51fe82s+6DAmeW/XtJSs11+Vpn69Cg4B9eiNf5QclcYCEKKHqM4xXL7BI+kC3U3iatnJe+6upGHZy9Bam8yE9FAMPk0AHh3kJMtjFOX203Kjdr7QtM9Zkhqz9D1gJMDK/Fc2z0b0gO3L5m+/r5kC86J1J1NqAxGk7RaVQPQUoqfIt+/I7vBi91v7mR6VJCGOM6YDWYgh/42pvmgyXVZ1yT2QP+Jh2fvfvyei5WBRlgo2OPR9GjIwuWYTRvTJXzG3lKkNChiAI5TaGdl/V+5Tqa7k+ovgVYVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6g6N9dPrOztuInCew6yoGxDgX6l9A+hAZZHVW05jtI=;
 b=VFlhFk9az4c7/LqHhGSmywSvGr24/o5oU4GnejZ/igbA5WeBvATXWzy0/gvJ1iuWPW1OiW+AiM1XGLflItydOp7b8uMks1aWhm/SgZOi74ymUCGcuKqgCLRgiOXV0zTopLS6N9mpkAYFVcDekAizuxCk8Wak8g/0TcZzYMnsR96at6VBX1ZBYUJyVkUOkdFLywTnCcyu3QPcCKVjYHIXTLcTCmqw76c/4ZY8XD+iE/Sv+V/dqZeFDRWuk8e8aFlUMD9qfzf0I983D5HgEbvXoGBSTzELDRGI/C+hNlmDOaIO7+7K/CsuE5ovAGA4VskE8tC6aHpiseH2JMkMQLmMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6g6N9dPrOztuInCew6yoGxDgX6l9A+hAZZHVW05jtI=;
 b=AtnoDe9DFr/+vHcehA+w1NXnFE+zcEZHriVktsFEYBsoITgwMiksguSiJ4VkyMEg0H1ABl/CcFNlbaZhvcRzTgD9LkjRdbfbNIk0cUpfRGyX5IOUXeEyq6WIadTCVZdqeiNFmLf7S18UPKeSHam8uJPub5vLTk0attIxPYiL5sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS7PR12MB6120.namprd12.prod.outlook.com (2603:10b6:8:98::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.39; Wed, 6 Mar 2024 18:59:43 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4%6]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 18:59:42 +0000
Message-ID: <0f281978-4be9-4593-ade5-3d677723bbf9@amd.com>
Date: Wed, 6 Mar 2024 13:59:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Drop abm_level property
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Xaver Hugl <xaver.hugl@kde.org>
Cc: Hamza.Mahfooz@amd.com, Sunpeng.Li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <2333702.irdbgypaU6@xavers-framework>
 <e046ff23-8dd8-43ce-8249-c42d0bff7f5f@amd.com>
 <CAFZQkGyHo8wWXhQYeSm+F37unvfE6O2USiNu5RVu5Zq+EudQmQ@mail.gmail.com>
 <1ce952e9-ba06-4b02-83d0-107df0e4d13c@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <1ce952e9-ba06-4b02-83d0-107df0e4d13c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0184.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS7PR12MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 1149325e-a9a2-4b0b-1265-08dc3e0f9521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mWjHKpFjRK41UR8OWoAV7eFH9JouimdT+3wOtSjjAoqprtu4nfiiT48X1ITc3C3ruKs/6PjshJgLLhDwYLasQbLADOsS/CFnjvGX7arbEQ1EiA70BQqdNSAr0p0QGzfKpO3+l3HyXxFGtYJD5p2aBeekz0iYT9vVxKp16wXS8YgaFcsjZtaneHu037Fd1NAvVu/H3o/R6ZsarUlRUB0K8IB/EllsdpE+nWAIcev/Fa6w/2/bGnvP6500Eve4wGlxQ1IUcdzq0BWSp6o7cDe4/9GWMLVVcWVkGrw4G6gro6wpiqudIbnMAyCsNyzdt+69HMVqeqPReswBOdJ7ihtOOmJufyRII4UGqZ6Uahip8OpxOdkbBMF/k/K/8tnfGcQz7rG7oMH3TPtqK3KLb20elnNunR9wdcNtZAZbtHzGY/k2qse8h/w6qwvgWBu0uEA0PR7LtVtjmb6uZBrfe3lLvz1cHQxlLeFGq+d24S6BH4m4j9m/Wrm78TIKbd2f4PKzFRWm3HbEpqv2j3ryrS8kqZqELuVlPEz4006zARPHTNsWD0X4Fh0qQ5ihpjVg+woz1BFjan9zzrpllw5L2iNbL9dbnV1RMJVozy++AsQTuoPFGWza1622Ihb8fF/jz3U/t9BKiv5f62yhZWZbukR5jJ3goOLvD45MRDjQBQFbCfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW4zd3dFRkZsNHdvMDhBd2lKWWZYaGdVVzUrR3k2cDZ5QUppZjFhekd4SitY?=
 =?utf-8?B?YU1yUURWL29ZamtlaGF6UlEzWlVTNXludWZvVnNZM0xxVXZGU3p5SEJ1dHRv?=
 =?utf-8?B?bXlNUE5aS2QwRnFidWhsNytxRDR0MUJRa3l1UzlxSlJOMFkrZEE3d2RMZCt2?=
 =?utf-8?B?NDhlemVhekJDMlJmQ0Z3STJMQUl2SlZWWnoyanI4bk90Tm53VUgwY2RaZFlv?=
 =?utf-8?B?dUxCdmx4Z0x2YmJMM2docDZHK05CdGJ0S1duRnpZa0hzUFJvMEllSXFVWkM0?=
 =?utf-8?B?ODVOc2c1L2MycFh3Y21RWEhBWVo5SlVTdXI0cXZwU3MzNkVOSUtUaWpZMWZE?=
 =?utf-8?B?SHJHQVlxdW9xL1QvT0lzaGZaQmZOUkY3Z2pqeFhHQ2J0ZUNGOTFxWmFEalBo?=
 =?utf-8?B?NGN6czhpRHUvcitPRDJyNzNRbHQ5VDlGeTh1bXllM2cxeHgzelZVWERGb0Zw?=
 =?utf-8?B?TGMxTmp5TTUwNUczbEhFTXExb0sxclRQK3o0alBLYW5GK29oMUxSaGdLM3Nz?=
 =?utf-8?B?NGJSc051MnhOaWJFdTVoZGlqNlU4bmVpSnZCU0JlQS95clZuY0wwSWN1Zzl3?=
 =?utf-8?B?VmdtUnNWWStmUDQxU0RuQXNFQVpLb1B1UU16ZFo3VkZCVWpQUWJlNTFyQTRU?=
 =?utf-8?B?clIyR3MwMHlxMXNZZTFJa3YwdDltTFQ3RytFc20zQWI0eW1EUlYxc1J0MXVn?=
 =?utf-8?B?UFhIdXhmNlI0Q21pbHQ3UFl5cEVBbnNKK3czRDFtQ1FCS0h4cWI0SGdmNURI?=
 =?utf-8?B?R0dsWG1ETmVhZ1k4S21JZ3cxRXg2WEFnbWVadTdteUFzaWY0enJQdWFSdi9y?=
 =?utf-8?B?NnVSbUhNcVoxcUFqTE13c2pHckQ2WksxSlBHYnV1cWJBVWlLQWpObjZSSDJJ?=
 =?utf-8?B?Z0JERFVsU2R2RDg3ZW1XU252MDJoL01VYU9XUXQyLzFPcEFTc0hvMFdKUTdY?=
 =?utf-8?B?U2IxOThPNml1SlZZa2w5KzhsTXFTcXRSbGpoUkFpZlJsdlBFVWFRUU5YQXhL?=
 =?utf-8?B?WDRnNm04b2ZINVVLdVFNNzJha1RRcHpRRFlQd1Z5cHdVcStrSXhVblQ4OTZG?=
 =?utf-8?B?SW5nUHNhVTVxQ0lxcXRqdU94WStlWVFoWW9ZQTd5WjdPMC9WbnN4UFF5WXZ2?=
 =?utf-8?B?MlVZSkxGeWp0Ly9tKzV2ZUloVlIvRm8zc2ZhSHhQY3NUTFZyYmJTN0tMSTFh?=
 =?utf-8?B?ZTlzS1IwVjY3RFZsblVuT01zeEtWVXFnbFlYd2tYU2lHa1RyalJmM0VyTmpY?=
 =?utf-8?B?bW5lbTh4dEdtK0M4YlBpZ1I0bnlNaGJ2UWVqcVFJZ0x0QUxCaDgvS2dkRmZT?=
 =?utf-8?B?d3VnV1B4d0cySUVpbzZHeWt0dHNjTTMxTmhtOGxPUzhIUGs1RUpacGNNZ1dk?=
 =?utf-8?B?Q1VDUEhKUnhqaXYrVEFOTXpsQjlKaVFSR082ZXVOTnN2NklDTGNMZ1ZYUThs?=
 =?utf-8?B?OUlQYThxeVBGcnN4WnExZWtueHNrM0Y2ZFZzR01SRFJIci9UOStOK0ZXRDlt?=
 =?utf-8?B?S2J2VFJ3cEx0cEdxakNUa1o3SDNsbFV4UnQxTzlucmt4SzFKWEVBNE13WHNL?=
 =?utf-8?B?eWd0OWU4WENxd0k4Z01nSjdORHJFdE83dUpCbUtzQ2l4V1VkZTRGTnAwS1dR?=
 =?utf-8?B?UXh1TzN4R1Z0TjVGQVhNZ0Z1Z2NxSlRjaE5oM1RiQnEwcGVmVXF0WTFwTHVy?=
 =?utf-8?B?TjI4c0FwZ1k0L0Z2RmpnT3hCZzRoVmZwM1djMTByWXBSSzlZTUp0UU1nL0dv?=
 =?utf-8?B?c0g2K05XM3czdjk1Mk53S0RKb0x0S2llYm9MUURLbi9yOGpNNENnMXA5RWdR?=
 =?utf-8?B?UERPMVVNVXB2aWlSbnVOVlFybllCNXNhb0dhR2l0Y2gyU25UQ1VRMmxNZEo5?=
 =?utf-8?B?MTE3TFcxV28zSk9pZjljckhRc0hVdHBRYTV2dW85cFExVHpQRFNicUhka29P?=
 =?utf-8?B?ZkEzYWtnNHhNZ1YvckpQaklScDFzK1FOeXFWbVNrOUQ2QVRLZkIxaW9uK2RV?=
 =?utf-8?B?S2NuVVMwZ0p3YkFUc1JQVUFUT1J6ZjZVMC9FMTJtUnFNKy9BNjdxT0t2N2tU?=
 =?utf-8?B?WkZWUTBtWGp0dVZoYmQxbWp2TktFZUh3OGlGeGZ3TmZHaTFzTXEzS092dWJy?=
 =?utf-8?Q?9Bq8ShLWoUo5FUiMijLvWAiix?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1149325e-a9a2-4b0b-1265-08dc3e0f9521
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 18:59:42.8625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4BsCujPql//NoU1fBe1CrcDFqBC1sKGf8w5RZm8bist7/c4PvMRVyv0BEHTeeqqUYAaqY4ui/bEU+rqDu1wgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6120
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



On 2024-03-06 13:02, Mario Limonciello wrote:
> On 3/6/2024 12:00, Xaver Hugl wrote:
>> Am Mi., 6. März 2024 um 18:19 Uhr schrieb Mario Limonciello
>> <mario.limonciello@amd.com>:
>>> So the idea being if the compositor isn't using it we let
>>> power-profiles-daemon (or any other software) take control via sysfs and
>>> if the compositor does want to control it then it then it writes a DRM
>>> cap and we destroy the sysfs file?
>>
>> Yes. That way still only one party controls it at a given time, and we
>> can get both good default behavior for display servers that don't care
>> (like Xorg or compositors without color management support), and
>> compositors that want to put in the effort can do more specific things
>> with it.
> 
> I think that's a very good solution.
> 
> Harry, Hamza, what do you guys think?

In theory I like it. But how will this look in practice? Is PPD or compositor
on the scene first? Would it be possible to yank the sysfs away from PPD?

DRM client caps are set by the client when the client interacts with DRM.
At driver creation there is no client. How will the driver set things up?

A user might switch between DRM clients (login manager, to desktop compositor,
maybe to another VT with a different compositor). I know everything but the
login manager to desktop compositor hand-off is today considered exotic, but
what if someone starts building a use-case for it? I've done a bunch of gamescope
or IGT work in a different VT while I've had Plasma running on its default
VT.

If someone can sketch this out, with answers to all the questions above and
any other questions you can come up (be creative), I'd be happy to review.
Alternatively we can discuss this at the hackfest and maybe arrive at a
solution.

Harry


