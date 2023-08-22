Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AE2783E9F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A245210E2FF;
	Tue, 22 Aug 2023 11:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B9D10E2FF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 11:14:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/QhC5ojTCP8l3ytwlat1Rh4gfVsda7Kx6o08Zei48pgBAmL5l4dpcM1TnP2IDyaMsUD9/A78xyu16jJqe7rfXFhspmZ7XqFq132z+PGJhgjpbY5fuxWFeS1LM8mWwqNMAK4pWSeAs6ay/Bc8K8t8WgsmbK6dQcigkL0QVatd4+GWJ1rTEJaKDJ0hHANqXEEWBbwvDHgUhAcIxm3w+1dtlYT7NBp3Rr4J1X2boJuJE0I28O5gIUb3y+T7hzot8E7TwQPbaHB1bb9WGwwC/d6aSMU5mXEWFAPjwc+/KJ1l0c007YPhmHDnJ9l2VbwOb3sTkLkqcCujgwOc1R66zg6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnJWT3eHm6EmVc5QCzLjLhF/9dFsMbB7YFrLcHz7Q60=;
 b=TL533DcdRWSgk5h3dUaAk2JoE+20dgdPVGmiaX1B6u8G1pCTO/fRD6ZyIKpsyERKnhIlvCXztH0PyLEHqGnPNuFiPiOqVZhuHwWlHw3ChywwTwn2Gp5B0ObxEUlNJk8bRBWK7BZRMddEWF3MbIWtSTvBUp8q5lvZZoTNCp9jkZzdCCrtRR47v4CillVFfcph90C6TnaeQKmvklJDrG7X7LjsNCQ7lYyhCMU+jvcJ7dq0LOX9VW8cNbgv01s1/rNyTrpcUup26jA3BdOnEZASPVSr1/6KyoUYaeebxkdeSg28x7/klFZW05hRspWRTGWKfL9Goko8G8yayqt5xrOM0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnJWT3eHm6EmVc5QCzLjLhF/9dFsMbB7YFrLcHz7Q60=;
 b=gUJMWJYjoYAs2RoqdsqkOHUNEpP0MxPCM6emg5qTN497c9zHVOPd1dE8OyX1yz9ZooY1UIAcwkkU1sM0/xfmIhGKcTMNwLKPOYt0gHIcfK9+EbD1sb+vQFfZT3oZQPQ3pawsMJhnGGHLx/i4jXBCQO1b+K9Z/AniADXmcGi5NXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MN2PR03MB5118.namprd03.prod.outlook.com (2603:10b6:208:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 11:14:45 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::411c:e486:3837:cc25%3]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 11:14:45 +0000
Message-ID: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
Date: Tue, 22 Aug 2023 19:14:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Hsia-Jun Li <Randy.Li@synaptics.com>
Content-Language: en-GB
To: linux-mm@kvack.org
Subject: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::10) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|MN2PR03MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: a54fec06-acce-4dc2-6fb5-08dba300fd83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9g5Vq4Xr1GZAtk/HQLe2XSX2iKb7BV25heHqgG6Bo8qP8dFvL1ZRwO1yjKsCQYAq5tKSgFxNqQ0TAOciLsk2njsKnB9kIel7poM8TVwF5X/HFyoQqhdP/vtI0dz1WPRMvTsrxq/avRyFCjRS7qNPCUvoyOb4qJexD0rl5njcDNxOHYEA0Lr/+fwsbzGbUtmNaU4jSv2z4fQPuLi10N8tV7yx0FZXu9LPeAGgYj5F0ZxN282pxAwyPLbbJHQToPWCf31hVcX6CG3uxo6yZmKVVuP5eKc0OZ+1LzPqrFbO3j5+0DDip53OWFh6li+y6Cv/PijyMxEnPV/+419f5eOFIVbUDqoC9fxEHNEk8wYFDJt3H5T7H53Y3vaSJqPPZYy/7DrfnyDR+4S5+QobhTAGjECBINg2d/tPruwjYx13Q5Pt9l6RhBF4Jz6i0Qq2A1Fi9McF/pdP/fsXjJ9+06iN/gIsCqa68BtCjJZVIfav0w9FKvBMhm20E3Okr3Al2dyOjEL7eSICL3+ilQWHLH/ZX/KZumSw7HHTEt7DOO8TlNLTujPCsnhliH+9/j6Rvgg372mqvU76jPL2H4AboDkD4e3kD3XmnwenSgvXjHJ1soCBxaZ0mP0KRKz4QSDMQ12/GL3dCJaQf0VlJoLRGeJcglk7PPFN4kV0V79oVDeGzkynhr35B/itd70Bs2wFXhh8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199024)(186009)(1800799009)(86362001)(5660300002)(66556008)(2616005)(66476007)(66946007)(316002)(6916009)(2906002)(54906003)(7416002)(31686004)(8676002)(478600001)(4326008)(8936002)(41300700001)(31696002)(6666004)(6486002)(38350700002)(52116002)(38100700002)(6506007)(6512007)(26005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFJSZFlXKzdNLzVzUnFSM29YRElXaG9mRW9mcVluQ0V0QjRiZnltbWxXQ3lo?=
 =?utf-8?B?N0o0azR3eHhxZkVJQldZUFl6MW1EVUgyOS83dmFCL3N0SEVKYW1mc0trdXlO?=
 =?utf-8?B?L2tWQy9nVHBvL2FUTk8yZWh1QlFSZnMzd2QzYW9GRnI1Z0NQSG9FWkp3azZ0?=
 =?utf-8?B?Mkp5eHQ5bmM1SzlOSXVZcUU2WmRuRS9KMnJ5OFFLZkY2YmVTZEhWelhZTkZ3?=
 =?utf-8?B?UnNtc2hXR3VxM1Y0NnB3Q2hDUmxzWW83L0xUdVZjOThTTkZhMWVJZ0pmQlcx?=
 =?utf-8?B?dE9PZWRKeENZTWNGK3NCeWJBZkxvOXlJOE1OM3RIOE9ENHphcExaaHpjYVFH?=
 =?utf-8?B?NVc4SGNlODNDM0dJc3Vsd2lMR2taUnZMZ1UrZDBBWEY2NUNzR3pFRnRMZlpt?=
 =?utf-8?B?L3RJcWdKNWxYNDFtM2VPbTdsa0NGWXVGcEZVWWxjcW1yWEFDb1VDbHlycFc4?=
 =?utf-8?B?QzF5VjU4UnBib1hLaXlsUWsvUzdybHdXTlowRktEK0FUUW1zbkhEM0orT0N1?=
 =?utf-8?B?Y1pRNUNQK1o5aEdDWVYxU0ZhNkJJY1Q1SnUrdUhvSkdGaUVFR0tMeFI3Q3cx?=
 =?utf-8?B?SDl3NzNrRkNUcXpjOE5HMHJnVmtVVmxLSHdGWUgzRlQ3MDEyYzVlS3BFOE5E?=
 =?utf-8?B?M3lTRzVZbngwWG9wVlo0N0llM1g1aWtabU5LVCt6VnFpbkViU3pjK2VDYzhR?=
 =?utf-8?B?b00wUWNsMm00TEtlMGhhdVpobDhzWlB6UlRoTjEyMzhpVDZqYk9sZFM0ZzFa?=
 =?utf-8?B?OHN0cGVkaHZqZXROU1ExZXdpVEpMbDFpWFU3YUpibzNNNnpqN1F3d1hTUnhX?=
 =?utf-8?B?eWhucTh3NDIyaHFxL0o1QVlUTGV6Ujk3SzJVd0JEYjFBYjJYTWd5RnpTUTVF?=
 =?utf-8?B?NWN5a3pIa2dLbjdMQjZranZhUHJNT1YyWnZRa3Q1MWhROTZxQkJobndiYjEx?=
 =?utf-8?B?ZWVOVWZucFQwZ2tFTGJyd1dPem5aekFBNTB2L3VKSzdTY3ZBbkg5Z2ZjNytC?=
 =?utf-8?B?MERvdEZza1M5VTdDR3ZRMEtJZ1lyOXpiWDhkcGJMU1Z1aFppVzhsWFVqbklh?=
 =?utf-8?B?YmVqdlVjdkkzYWpLbjg1bENNYlZUT0FJc291Ukl6VW9GOEpmcE5Oc2syTWdZ?=
 =?utf-8?B?cGdNd1R6YnRNL3FBM1FnNkNiT3pHdGFOVXgvNmdJWk40RnBpM0Z3UWQ2WGNt?=
 =?utf-8?B?YWlyQUs4eE1ZaTBBdzFBU05jVU1kTHlIY0JIU2tzbjFtMDAxM1VrdUVJcmI0?=
 =?utf-8?B?ZGRpRGp1V1RLVVAyaUpqMFBlS3dsTm5FRWJPVGgzZk5JNURtYnBGb1dHaDM5?=
 =?utf-8?B?RDU0VzROOXpKUGZSc1c0bjA3cjRDYmdHeUxkaDBKbjRsdWFNMTVrYzVzdnJ6?=
 =?utf-8?B?TXlCaHBjakdQQ3pjeCtkWlppYm9BTzdtODlieUR6dkdzaDBkUE93WGJyV0NS?=
 =?utf-8?B?Q3RuL0FxdkNvUERHb0J0WmFPUE56V0dVQkxxYW9MdTJsWVZUaG42MFFIbzFx?=
 =?utf-8?B?TVcrV1dsRFB0Z1BwMlVON1NJdmo2SlE2cDhqN0h0SCtzcDY1dzl3MUlaTzY4?=
 =?utf-8?B?Yy9lS3AwbGpqanpSUVU2SnpST1ROUkdqS2ovUFIrSndzd0JHNGZ1a205amJ2?=
 =?utf-8?B?SmFPdWZaaktKdVpoSzNRNnpHY2xuYk9jb0dBY0ZPK3ZNTlFCYXdoZ2RZYmNZ?=
 =?utf-8?B?TTFrQ0xWOVl5UWdJMnlZSE9VeWZSM3ZoRjgrN2lEeWh4QU5DMndPVWQ5WXFC?=
 =?utf-8?B?NnJ0azZtbG9lUDlhMWNicnZOMElFVVZrTGFyQVIwVHR1TzFNSnZ2Nmx1L1g2?=
 =?utf-8?B?eGZraUhrYXEzZitkTkdWMVZtQXh2M1h0U0FlWDVQWlVCS3FSVWtEckU3WUlo?=
 =?utf-8?B?cit0SGtmZVZ0V0E2SSs3b0Rwc05QYUwyYk9NSW1VT2w1RHFZTmM2V0NIZ0Fh?=
 =?utf-8?B?a05TMWwrNkxncU5UUWZxY0R5ZkRLd3dvcHpzYkpJbjdzVUtwaXlaallMbHZX?=
 =?utf-8?B?aisyWm0zMzdWMmZQKzFkRUFCbExsM1hsOEhhSXhIL3U5THZ5RVhZK0hjb25C?=
 =?utf-8?B?UVpUQ1pWSlN3ZkhWaHZTT2NnTkxIbUhOdDFjRzQrYjZHK013eTN2Y3hkZkoz?=
 =?utf-8?Q?FoYaWzpEABzzQW09eh0RorhTF?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54fec06-acce-4dc2-6fb5-08dba300fd83
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:14:45.2831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OKxs+NJxG0V4mXaHnGhE/Q9l7Bp21NqhjMUKfBNZ87rh0tItA5G5Ys++h6YjuRHMM3Rb5/rfZFqjKDXd8J6+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5118
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
Cc: daniels@collabora.com, ayaka <ayaka@soulik.info>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 akpm@linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello

I would like to introduce a usage of SHMEM slimier to DMA-buf, the major 
purpose of that is sharing metadata or just a pure container for cross 
drivers.

We need to exchange some sort of metadata between drivers, likes dynamic 
HDR data between video4linux2 and DRM. Or the graphics frame buffer is 
too complex to be described with plain plane's DMA-buf fd.
An issue between DRM and V4L2 is that DRM could only support 4 planes 
while it is 8 for V4L2. It would be pretty hard for DRM to expend its 
interface to support that 4 more planes which would lead to revision of 
many standard likes Vulkan, EGL.

Also, there is no reason to consume a device's memory for the content 
that device can't read it, or wasting an entry of IOMMU for such data.
Usually, such a metadata would be the value should be written to a 
hardware's registers, a 4KiB page would be 1024 items of 32 bits registers.

Still, I have some problems with SHMEM:
1. I don't want thhe userspace modify the context of the SHMEM allocated 
by the kernel, is there a way to do so?
2. Should I create a helper function for installing the SHMEM file as a fd?

-- 
Hsia-Jun(Randy) Li
