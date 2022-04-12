Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983804FE9A2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 22:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E594910E5CB;
	Tue, 12 Apr 2022 20:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817AD10E5CB;
 Tue, 12 Apr 2022 20:51:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZm3Xb/0CMuaTugNXq6BaPgVy8wMqaaABLm0Z2LbeAw+qmt+IszeapX56gvb2tznU3PMdfn0jiy2P9ZxFxg5wmyY+hpu50VrfOFuBtx6xw1N8AfFOBF1RCuh2bMeffDonNbAEt8CttJlQy5CnE6kDsUE8GGMh+6fA79DwGytrhu8NexUzoH3B6GYm3eWR9ZDwWb82CNS2T6FEfFY2ogJy0g1zvbQFZNwLlxfMBD4DkceKgAXeHVsyEdm+q3UcgZfdq43hUckUoM3e20eErYVnSBVNRtw+j/5J2GJHo4BnwTXiTjxiAWPNsT8fF8BGkpti4YOmuh5f5nafLSBHpTI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0/IZHTzcS7MQ5HaddCUdA9vCUCdVxQwxJj8OOtlM1k=;
 b=lf6rfROHlszyeP8uNKERZsLyyyydMDnXXfuqZfj/Yn6ap55yME5Cx5QDNGdoTwG02vlsEXDhlFeXL8fo33GnsAxcQSCiW0Bb6a0ctIeWLNYUTl+ty7YyyVzp+TTEANaX7QHUd5Qcp6cuH2DBOCRiCOQeqF4Tcm17vtQBBeCMQK5EXjLBVZHqnPF4Ei7K+e0H6L1HkA3ypSVqZPz7bVgMUQ3GV7LtO4kEou+s8yohLljSR33LCfipx0x7lKlDWvht5jrK+ZRGkU6cJVIXzI8ZFzu6wloEqbakNTsZGh1enJbY+Z0bYir3NPjdPTjJwZyXhHRhXhKOz8yCrzA8SoDcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0/IZHTzcS7MQ5HaddCUdA9vCUCdVxQwxJj8OOtlM1k=;
 b=CSqW6RppkWJItABxcSYYj3da9Zhdshe7B9Rc7jO93yGbl2igAq7LErduwFRfqKWOFkS4bxKMCw3ORuwiKRenKsugVQflMOkOdbCm2HHaTPfxKb9w71lEVG/4K4aJwWhkbgS2eI+ewv6i4QgeKDXl7by5PZRWhc65oOf6RIfNJWYor4ILpzDJCof1bewawt9PV9WJ+K/R2dwbYJOCaPqzMd2uF5sPmcvnFKnHv7RSf544z/HD+kXTOJ5by238VsiC1JiCJJeTfLD+Hi3+RNdkpJxezAZ/TOY/GRxZb4v31aEPcoS1KHD27GqNfmGqyPGSqqXLdDUfaafctPOydTNZSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 by MWHPR12MB1679.namprd12.prod.outlook.com (2603:10b6:301:f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 20:51:49 +0000
Received: from MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::211e:d78f:c944:6665]) by MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::211e:d78f:c944:6665%7]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 20:51:49 +0000
Message-ID: <4d03a738-a023-21a5-fe32-675861f48646@nvidia.com>
Date: Wed, 13 Apr 2022 02:21:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 30/34] vfio/mdev: Remove vfio_mdev.c
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-31-hch@lst.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
In-Reply-To: <20220411141403.86980-31-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR0101CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::30) To MN2PR12MB4206.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4899cfab-aee4-4376-d412-08da1cc6439a
X-MS-TrafficTypeDiagnostic: MWHPR12MB1679:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB16796D6FDA370C882418EE45DCED9@MWHPR12MB1679.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxFdSeHjLcUxVdFpecNOFbY+EW9aeZWjlBTpYs2Tn//r/ejyLmEp4Rx4Z9fg04N7cM4iEYIzYLy5Dh2hvwLia1CMdmZe8YmG3pr6AGRRpg454ZStIFWOv94mp5UivvRvqGjKQE9HYGElFZ5TiK6hBvN+iSiyytGC/pNRNthcJibwPHV1xyG9rd7ROiefNvsLiwB74b9kTDg/wEYfmXsQNsQIOKfg7XkPAmS/CCXV87BCMoQM7kjGiwnc1wM9tf2LTA5SaX87hoI5nfnf2sEbGzzyPjIAXXyWWaFD77pQKqjpjmeyjgd6lWQUQPudwwu6lkqVixu7ZLrvHhroYFa+QOSJSLL97uPjNjO947KqaLBy27wGLkTbpV0xZKVTGx7GvYeEvLyw/BymdsY1A/s93Dn+29mKzLYc4NGBUwKY48zePbkBstPiNB0YUXytSnrLlsE9jhqHwH0coWIdCOAxsvW94V8G9bqUjJUfZ1LM6DwpgEoyBcUMqKBoczsrkpeHIep+TGGLHnNgTzjbJNMnOudPP5u4OiYo48QebBBly93vuCQDTvBhIp7axDJxuvt896b4yO3Nv7p1q4y9HMIBWNzmpz2BHr/yY6QQGM7MfrPwMqtvOJLBZQ3zcAuIV+DNfxosPHZtaIF3ao5Vp0VL4pYobGEIyR/z1WwYFt3HTonGWFhPtX5oCjq/WLLnrsTp64B19qGsZNPCT6XscDntMeZP6lJbdWhb6rkx1G04VmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4206.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(2906002)(6512007)(31686004)(66946007)(31696002)(4744005)(8676002)(186003)(26005)(4326008)(7416002)(53546011)(8936002)(5660300002)(6666004)(86362001)(66556008)(55236004)(2616005)(6506007)(508600001)(83380400001)(66476007)(36756003)(316002)(110136005)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEtHbFNSUHYrNVdDbVRKZ0cxT3RTQ0ozdytBNXczbGVoU3h0NlNUZGYxdlA2?=
 =?utf-8?B?aWpvRzA2b3dpWkRqVUNPRjBOcndCQlc2VzFSbklwd2lTWTUzNDVpeXcvMjRE?=
 =?utf-8?B?OVE3YjJJcU1OYXZkbzJ6djNlMEFCVzlta25oUVRFTkNhVVYvM242eDNmNkQ3?=
 =?utf-8?B?WmNPNytsbFc1R21penlYR2JoaDFiM0doNmJFOXBXSExIb0JCTTZHZ2lVVDdZ?=
 =?utf-8?B?Y0VsSXZBSTdoeXd0QzlCZ2VhdjdTeG5FWjRPQngyUXkwOHJ2cmxoeEE2a0hz?=
 =?utf-8?B?L1ZaaklLUDNUczU5b2YvZVhsNDk5a0gvcXp1QU1odnVLdnZyNmQyRGk4anFY?=
 =?utf-8?B?c0pRQ05HSWtDRkNPMkFEZ2ZjTmNJRTRyZXpxZTNpekxnQzZxeEJ2Y1BjM1pO?=
 =?utf-8?B?eFRaQTI3b0d6Nk9UYy9qT2s1elFnRHpoRkcxTXhobnJFMFg3SGhyM05iOVpu?=
 =?utf-8?B?SFBVM0Zmd0tXT3ZobkpYWHJmeDNndFZIc3pvS0JiM1VvanAxb1k2V0szYWw4?=
 =?utf-8?B?OWpSM1ozdlNDeng3a0lBNThCNkpOdkI3VWh3RGpKbC96dGx0TnorOGhqeXNi?=
 =?utf-8?B?WVpGRDlWcjhGSHh2T3MvbUVEaWV2NXFBeUw5R1d1S0xnbHFKZnR6ZWZUa0ZV?=
 =?utf-8?B?MEJIM0lhQzVNenVXRkd0WFZQU3BIZzVHNysvZnRnUTRGdFhwUjdUT2d0SFlh?=
 =?utf-8?B?R1A4TW1jN2ZUaVFmZ2pmVTh3eDhlbnp3L1d5MkNBeGZIQWhoSkxENWVjWjNh?=
 =?utf-8?B?WDE0NjVrM24wdXVFWGhnVE05LzVHWWdKRDNTQ3VKMG11U0lKeXRjQVFIaUtv?=
 =?utf-8?B?emhISmN0K00wbjJ0WHdORHVLb2VsVDVINFJBeS9hcXZtYWgvTjRFNC9tc3Vn?=
 =?utf-8?B?R3FqUGVHL0hKSUpHcUMrbTh0TUlnd1RVcWtSTm40dHdXc3dMR2ZyelF3NXFu?=
 =?utf-8?B?R0dka1lGZXlob1hJSlpTOHkweFhPL0JJbXhsVGlraXd2T3IybDZFQmVaS2hX?=
 =?utf-8?B?eFhxZDhMUXNyY3RFRDR6ek9mUFhSNGxMSnpSUzBoMThiV3dqNHJ1M1lGZS9M?=
 =?utf-8?B?WW80ODJtSlMvSUZCM1JYTHgvR3VYOGhLcE0wc3pwNGZ4QWsvc1RZV09pcDFY?=
 =?utf-8?B?UWtwUm9mNUUwdTIzMDExQ01UdEplZ25zUkFwazVSenN2TTBZRFlzSVZqOExW?=
 =?utf-8?B?U3FwcVBYMnozeTlFWmNETlRNRGhWdWhNck52U3JnamNpM21BK2l3VnhsaUxy?=
 =?utf-8?B?TDJERDgxaUVKaDRKU0k1RHA4SnhHSzNwYlpsRU85SWhSU091VDZkVnlzbWdr?=
 =?utf-8?B?R1RFcklyVlA0UmkyQTdydGpkN1dxNHdYYVlFNTV5Q2F4bHJOSmhzaS9xNC9r?=
 =?utf-8?B?M1dHYUMzMFoyWUVMSHRCb0JjM3pTc2ZtVjFmNHhjZGQyaGpMUVdNMzdPbGlv?=
 =?utf-8?B?QVhDMmY2S1lrYjFpdHNPY25CUm41SGxycjdwRUd3Ni92WS9BSDVXTU82emhH?=
 =?utf-8?B?V0pzaTFHR2RkTEVMY0t3MXJsSmY4NGdPM3FHQ0FUMXQ4ZE1GWUdCUGhSS0xS?=
 =?utf-8?B?NHBTZEQ2T0RJMGpKVXlSd3BhL1VPS0lscU1sQTRMZ2gxZFRRN1htMnFuZzZM?=
 =?utf-8?B?NmdIbmlIVkZQZzdTRjhLei9CRWJtcnRhWGM0eHIwRksrcmV0VTg2MWFTRHor?=
 =?utf-8?B?aXJwaHYyV3BDQjc0bU9BRkVDc0tCN01pY3dGdGllVEdBTndFSTNyR3VOL01I?=
 =?utf-8?B?V2xPemJPdnZ5QjZNZWZTTUR1M01jcmFwUmo0U3V5Sk1Wa1UweDdZN2lhR0ZE?=
 =?utf-8?B?eW52WjdtWlhDM1VRS1hLSDU0RnRTc3ErT1RrK2JIZnlWNFdrL3BwSFpnUlhs?=
 =?utf-8?B?ajh2VVhmMEN4eDhQUm1jVFdGVllIclVGeTVQU3VmakZweGh2amx0T2dzUEJB?=
 =?utf-8?B?RklDUUQwSDZwSXNKUmsyWkJTOU15eFZsODcwMi9OQXVQZkhJYmpVTnVVWE1L?=
 =?utf-8?B?VnoyMUlHWGZ4Qzg4R20xMUV3TERqYlNmbnpWM1daTlRRcStFbitNeFNmOHdl?=
 =?utf-8?B?RnRjYUcyY0hrUmFScmdocit5Tzc0VEZGM0V6a3FpYlNjZ1hHSU1GUkdZOE43?=
 =?utf-8?B?bURmWWRSbndDSXZDTTA0elZuQ3dDMjhEVHZuRjgzU0VwRHlrWlU2Y3VOYjlC?=
 =?utf-8?B?WUg4Z3FTYjM0TmlFUEpWVVphQWl3TVFqMFFFS1FISEpsUEc0M25uR1QyUUhJ?=
 =?utf-8?B?SkpwMkNtczVFcGxPa3laejFmdXMwT3JGOUJhOHJueTY3czdwZFRsRVc1MkV2?=
 =?utf-8?B?eVp5VU02YmZvTVcwK0s1TExjdVNLS2R1NlVPU3d0Yy9rbzJPTk1KcnY1ZWZp?=
 =?utf-8?Q?azctSi4JlnRj6UBc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4899cfab-aee4-4376-d412-08da1cc6439a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4206.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 20:51:49.3574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWgCR6T//D4Kaw4iq+QQj/weu+4rl3dSLSSgwS/T5Nx8QNb5DYW2ilKPs9IV159dYz79/ImID/QVsI2RC6uTIQ==
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/11/2022 7:43 PM, Christoph Hellwig wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> Now that all mdev drivers directly create their own mdev_device driver and
> directly register with the vfio core's vfio_device_ops this is all dead
> code.
> 
> Delete vfio_mdev.c and the mdev_parent_ops members that are connected to
> it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
