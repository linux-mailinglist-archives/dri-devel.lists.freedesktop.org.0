Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4A2C9F1C4
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BBF10E7DE;
	Wed,  3 Dec 2025 13:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DpR4Dq3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012047.outbound.protection.outlook.com [40.107.209.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492CA10E7DE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 13:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqMJjsGF3SOaCZPGFCg5pR/FmtGMYvX9B4hFHAaaZN7h1MBZ2vcSWrglJqIJFKk8FtDeObm5GcdV0B/OMeCtvFI65V9T2XjWgmrV/LfkiiFBA+TKyt9iVqEVFgqefWLZlsz9RIfFNtuBg2kQMP0CjVvpFna5FQ6QXX/3QRoQm+gcQ8c4KqCS9eomlnrbjetuwBMF+/I6/pYlVHyVWeajWrsoTo2Qfxb1j6aEvhezcE0TfjF6t8G6v1IjA+HAS5z5FrNn9eXWqdJovCA3MXF7RqHK333jNtU860ieLfly7Ybbx16zunwuuGX8MjvjQN0bLTGyzi8NdqviRUvdHWHJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XFsHy0PuBk83vMYABbD+5hwbi2WDGZusPra7kgitRo=;
 b=SAOWGOaxn1dELc7IUrGvtqeLxyIYzZDsoZz3lCx0CUGenfN8VgVuLcX8Z3a+5xbHAghfT+AA50NBsYMCo5E0Jjl7MKBhl3QYwqoZOX20q6MjAk0p/hZgwrDalFqyT51d07rHVXwsCdixYMAX5tBEEztooGpDV1LAQpH33YMV0AYeEFn/HNXU7Ko7sO8aKP7Z8RmT6HVJvUNomnJzucUApr4jRxWcA3iTHHhDWToA621Ihg1tJF9oBLTK5LIYdQSEK0BBeCZd9mkvaXNOIVjNygn+c7tKTj0E2mT5DtNeDDk0p4BCmuSW/3KtdYkjnq0xIA60KLIQiLKLn8s/3ifq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XFsHy0PuBk83vMYABbD+5hwbi2WDGZusPra7kgitRo=;
 b=DpR4Dq3HMUZhNAcErdT4hic16FFVZPzOz6C06fCdZdoeGKgS3gPLrpmmw/SfNtP3v2+CQJMcB8JsmYipqPW2HmRoy+qyeFqbt1FtoIqGGiyA1at6umTyNZbu2Cl3tevzzXpusfrBr72kdK5HmqlAc+A/RrDrFOCnyk49BpfUjRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 13:20:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:20:52 +0000
Message-ID: <c302812f-a1e1-4ea0-91f4-d05ad47fef96@amd.com>
Date: Wed, 3 Dec 2025 14:20:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Some small TTM cleanups
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
 <fdbab4cb-5011-451b-bec9-f246f3949c76@igalia.com>
 <989105d9-fd72-4a9b-9517-be37d24d2603@igalia.com>
 <f5ea0445-c5b0-44cd-879b-9f1426640d2e@igalia.com>
 <2c660e05-526f-4885-b7d7-4e843655fb3d@amd.com>
 <93ccb928-7c0a-4adc-9374-e115033bb535@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <93ccb928-7c0a-4adc-9374-e115033bb535@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0289.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 449c245a-6a31-4097-9d96-08de326ec809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm5tVS91N2h1NHdvYkhYMGE5UktCTW5DU2syY1NBalRibXJLeHN0cVk0YWdS?=
 =?utf-8?B?dW0xUXRQdU5nblpaOFhpVk10T0luLzFKR0ZZaVpLdTlCSTdtWEVKMHIxamNk?=
 =?utf-8?B?dmRGWWNUMzBDN283WVJtSGtjRmRKSHNBU1pJcnpGb0lLa0xjQU1JRGNhdVNF?=
 =?utf-8?B?V0lRWmNXNStDaFBqRGtwK3ZXZFdLMG9WSmg4TUtyRDJocGFaRWtMSjg3RWgr?=
 =?utf-8?B?WjFRUEZLdzhwdnBmM3ByYTJ6Mkt1SFF3WnNGOVp1cS9xbWw3VnhnaGlEN3Zr?=
 =?utf-8?B?aitxNVZtTUcrcyt4MWZPaFJMdjJDMGtneHAxbWJBZ1I5WjVPZjVtaWNBOUVR?=
 =?utf-8?B?WndONjh4RDgxbWd2eUdFcW1TWjFnWk42MzZTZjh1bGZIQ1E4RTVKVXFpOGVa?=
 =?utf-8?B?cEVpUmluY0I4cS9MUnAzZkhFbUhGZHhEdkNCdDFNMWkrcWFTRFRxbnRTbnM1?=
 =?utf-8?B?bWg4YWhnZVRFdW5lanFLSWphTTVzM0QyTWNpU08vTWN5enQwSERLOXNsZ2NN?=
 =?utf-8?B?VEJXY2xWeEp2NXZzS25qL0dEU3NFVVMwb2FrbmVYTUo2a0kvTkxYZjBSbmJD?=
 =?utf-8?B?eUoxM0diRko5a0gwMlRUbjJlT2t3aEt1OWQ3dlJzeDVyK3VIQ1U1b2JXRE12?=
 =?utf-8?B?V29wNjFBamdJR3FTazgxUUJNWTAzc1RiZTZuZGg5ZE12cnN1eWMvSnkwQ1BK?=
 =?utf-8?B?b1U1WjJSSzNpN1dKdkFwcERFZGpEMVM1aUZrR2RSN3hKTWZiT3hiMlpUSllZ?=
 =?utf-8?B?WTJHUTNNdk8wK0E0dEtHUXZXN25NM0x0VERLTXYwM3ZNaWovUW9NWkpKRzZ3?=
 =?utf-8?B?QTRjd2JPb044am1lSytIVnZpeDY4dDB5SWk0Rm1zTGx6ODc1QVFxa2syWFlQ?=
 =?utf-8?B?QUg4NzI0SW81SktnV0srYVBtYjVWTytITFFiTFRUNS92S3ZzK2djK0ZhVVZU?=
 =?utf-8?B?dlFINDFrb0UrbzVaNE9SYm9jeTJpaUsrT0h3M05lWkZsdGdVY3hSbWdVVTZz?=
 =?utf-8?B?Q01CWk5aS2ErbkJLQm1lbWUyUlpJZU1vU0FXS3JRWUJBMC9CanBHbkJraUFy?=
 =?utf-8?B?MkdYL3pkY0k2RzBFMlFrSDFtUjd0MVNMRWxqYUowZEthYmhSeWovZ0g0enVJ?=
 =?utf-8?B?endpRGtHcWRXbDdWWVBOSVY2SldFL3BnMFdQY2QyZVpsMHBRdHNsQlMxT3ln?=
 =?utf-8?B?RXB2QVoxT1VVYXhOU0s2MkYwQng5NFdzeXRkUzNpd1BJbEUraS9mNDJGeEFR?=
 =?utf-8?B?UzhXL2xadHF0aTVaNE1lVmhkQmtjVmlsRXVXMDBjMmg3QkhCRHlrclVEMUZZ?=
 =?utf-8?B?WUFmOE5wVHdEZGU5NVlyV3NqbElWMmlrNTM0RUUzUHNMc1RqanZzN2JjNnVk?=
 =?utf-8?B?bFRvd0xubGNyaEx4ZnlnYzNGY1lIVHFPeU5PbUg5ck5kcmZKT2Q5ZEtiUENk?=
 =?utf-8?B?RXF3ZGFZVW9vK29RdGkzdVB1ZCtBSXh6UUlPai9EWndQYy9zaWxZTlA1dktx?=
 =?utf-8?B?SU5PSEVKdlVBaFMvT2prOWhnbStQcW14aHZ1Mm9aWW5GVzZ5azlVRzIvMVBq?=
 =?utf-8?B?eFUwRGd0SEo2VU02NzlKNWVsWjVtNm9KVFF4VWNvS0YxY2U5UlFsN0t4ZGpD?=
 =?utf-8?B?czVMczRKT1YrQ1RLVGFWNHhPeTc5QnUzZGVYd3ZrSWQwOEdBMTl5eUg4djY5?=
 =?utf-8?B?N3UvYUx5Sk1KMWc3WHBaU3h5UTJSaEhMNTFlTU1iTC9RQUgzckl2aTRjZUti?=
 =?utf-8?B?NksxQkxEMnhsWmpFZ2Q4VWlKR1NsNEZzZGkxaHEwSm94T3ZyaGNFQXU5KzdY?=
 =?utf-8?B?a2Ewc0VyQ3JlUWR5SWtzNWZ4UDJtOHViV2tCRjNsbXBtVDBoc3Boc2FhTzMz?=
 =?utf-8?B?ZUZVaXJUdTZYa0NxQ0VwMmRqRDZmOUR1aTlIdWd0dmRrVEQ5QnpmSlJzN09w?=
 =?utf-8?B?VTkrRGtBcTFYak53RS8rYm5PdmwrdTFWOXlaTEdycTNpWjkrVTd5b1hydGl1?=
 =?utf-8?B?cG5STTZIWlVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dktXUHpqQVJJbm55QnorRnowVGsrS0ZERDM2OGJsZGJtMkt4alpwS2x6SGFx?=
 =?utf-8?B?dUM0YUwrR015UjBzVjB0UmFBUjdpUmFKMG1lRGkxVXIyNGhMdCt3YjVTcGlP?=
 =?utf-8?B?NVNLQUxwSFdRVTVraW9jVWNxK0JSMUxWRVdmdGVKZW1LeThtTGFtTHZOalI1?=
 =?utf-8?B?eUcyQlRVWkJIbzg2aXA0c0xrdzAyTDUvdFFmVjZYcmI3d1RBOXRaYzF6enAv?=
 =?utf-8?B?ODgvWGxqclhyMk5SU2ZtWmhqY21NbGZkRkZFTXl3UDQvZ3g4dWxzZDZQalFQ?=
 =?utf-8?B?SGVqdXBoeDR6WEluYi9iK291YjdvSUxuMTRwTWZ4eWdwWHMveUpkT2ZvSHk2?=
 =?utf-8?B?UGNHYXExMzl0VFd2UEhVWDREa2dUK3JSN1VEUFhTRnAzc2Y3eWMzRjJrQnVt?=
 =?utf-8?B?WXp0VXByNFZlRHVQY3VFMnl5SEV1SjhOS1cvY3c1WFM2SVByODdyMWhiOWJu?=
 =?utf-8?B?aVpDTDFxRU95UWJTTFA3MFo5VXBNdkNoVEVYb21oNDVQNHcrcFFISFB5aUwx?=
 =?utf-8?B?Z014V3FPN1E0Mmx4MEZnUHpLVUVacVIrTks0R0d6OVRmRVE1Wm51S1EvaEI4?=
 =?utf-8?B?Q292b3M0bUsrUEVRY3gxZ05HNnIySnN3Rk4vMndaekJtUGM1UkMxd1hYQzcr?=
 =?utf-8?B?SWNJeWhDTHJNTk1lTnpOQkIwS3BoL0xrNGtvMzl1S1dEcFp5dTVRVjFROUQy?=
 =?utf-8?B?V3VqN2FzOHJzSEpjTTgwQ20zZXMyTHNqdkNvSjRqTHJ5cklKdXJoVkNvR1lr?=
 =?utf-8?B?Y2FIbk9EaEJtT3BOZi9EZjJCbzk1R3RocUR6OGlvS0UxaVBGTXJibVRqSURW?=
 =?utf-8?B?eEtGMjlBU0FnWWdUQmtBUzAwbUFhYmh0dTlQcW1pUmZTSXlyWmRZV013TXlZ?=
 =?utf-8?B?dUxQNTNucy9rNWNUT25yTGdNWS9qdjcvMGh5RUl6c3doenkzY0MxYXR5TEgz?=
 =?utf-8?B?RmdCU1ZhUFlkZkFNWk9WV1hUY3dUMm9VOHNqeFBzait1Nlg4M1cxVWU3dEpi?=
 =?utf-8?B?Sk9iWXJXN3FIODNQN2JYa0kxWTF6NURPeUpuTXhuaGMzK255eWJ5N21HZUJy?=
 =?utf-8?B?S2I1eHlMcUZFdXZBR1lEeWVRYmVRSzZwVkxXRzFVU0lnaXFnTzdQVU9RRkZP?=
 =?utf-8?B?QlVHcFhlM0JEWW9MeXo4ZzdWMGJ4dm4waUp5NzJBSzZ1a0V6VkdOREFJbGVK?=
 =?utf-8?B?TFVvNlR5aVp3b1FreklsbFlQMTVxQjE1emJseW1PM3pQNDJ2dlNtZ0JEOGRw?=
 =?utf-8?B?T2U3NnZjM3ZlaCtwdGNTZElLU29ZdExWNWRzQ0J5clMyY2d4aktTUUZpbUlt?=
 =?utf-8?B?L2dUQll4MDFTTTBNOCtXQjY0MVlDa0YrRU8wZTBWMWJyV3hZYlM1bmUwclJq?=
 =?utf-8?B?elFjZWZGYjhhU29OeCtYNzFtSFhyZUJjTHk1eEQzVlRtdHBGY2k5WmJNKzVC?=
 =?utf-8?B?K1F4bW5Ec3hyWWpaa2xVMEEveDJ5eHVIdm1NOHo2bXlYZnhXd0oyMktlNFZq?=
 =?utf-8?B?SnFEdDJ6Rk12cFlhUWlDUXBUQjlZblZBM0tLblBpTEVKRFgrM3pFVzQvcnVi?=
 =?utf-8?B?dU5ySkREaVRSNzZhTUxjWlE0MWVNemZXVS9FRUhtZVpyNnNqejc4cmVkSnFj?=
 =?utf-8?B?cU44bk9iL2JPTnQ3cWdZMHo2dUZtSDkxd2pFdDJUM1I1SUoyVmZMRlBWTnha?=
 =?utf-8?B?dDV1NFVFZXNzSzltcUJ4Y0NFNWdPNDVnWjVoME90UzRKNjAxNmcwYTQzeEJy?=
 =?utf-8?B?WlhRWEhVaEROeERZTFhZc01MVjRmdGlhL21WTnNMYnhxTnBHV3pySEE0MDh1?=
 =?utf-8?B?Y0NJWUh5c0NiN3k0cFFFNHRJK3hLcEhEL0JVQmNrZkY3dVZkanZKcDdPMnoz?=
 =?utf-8?B?K2ZlY2VaN1NoOGJnWEpoMnlZM2p4N3JscmZRKzE1NUZDa3dYU3B3SCs0Zjg3?=
 =?utf-8?B?T0l0b2JnL2FnWFJKL015Y3V0SkRzM0NoQUdWVjJrU2l3TkxWQkhKVVFnanJz?=
 =?utf-8?B?RTFvL2VMdzhYQVl6cnE5SUV4eEdVMXBXUlFuUEFrWDlpMXFRdDV4M0FxR1VT?=
 =?utf-8?B?ZUVpU2lMUk9tV2RoN3orWVlyZUtNcWE5UGZWRGJBcUl0MlZVelgxRHpuSXox?=
 =?utf-8?Q?tltI5SCJB2n9nEjDESk9PZX0S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449c245a-6a31-4097-9d96-08de326ec809
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:20:51.9500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnuCsYigrBAd1l/5UaJ8AZ5g2zl4E/zhFvmTYTGHGLzlShd8jCj1VbRE6gXLWSrf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124
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

On 12/3/25 14:09, Tvrtko Ursulin wrote:
> 
> On 03/12/2025 12:57, Christian König wrote:
>> Sorry, I'm mostly on sick leave at the moment (cold/flu).
> 
> No rush in this case, series has been waiting from September so it can wait a bit longer.

I already crawled out of bed, so I can as well take a look :)

> 
>> I couldn't find the original patches, neither in my inbox nor using google.
>>
>> Could you send them out once more?
> 
> This is the series:
> 
> https://lore.kernel.org/dri-devel/20250919131530.91247-1-tvrtko.ursulin@igalia.com/
> 
> It still applies but let me know if you would regardless prefer me to re-send.

Patches #1-#3 are Reviewed-by: Christian König <christian.koenig@amd.com>

Patch #4 looks good to me as well, but has a bit to much changes at once for my current brain status.

Feel free to add my acked-by if you're sure that this is correct, otherwise please split up into smaller cleanups.

Thanks,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>> On 12/3/25 12:34, Tvrtko Ursulin wrote:
>>>
>>>
>>> 3rd ping, and apologies, for some reason I thought Thomas you were listed as maintainer for TTM.
>>>
>>> Correcting the To: list to Christian and Huang.
>>>
>>> Again, asking for acks to merge this trivial series.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>> On 21/11/2025 10:02, Tvrtko Ursulin wrote:
>>>>
>>>> A gentle ping. Two really trivial cleanups are ready to merge just need maintainer acks.
>>>>
>>>> On 05/11/2025 15:33, Tvrtko Ursulin wrote:
>>>>>
>>>>> + Christian & Thomas
>>>>>
>>>>> On 19/09/2025 14:15, Tvrtko Ursulin wrote:
>>>>>> Some small cleanups, nothing intentionally functional. It is mostly about
>>>>>> applying some consistency to when to use a local variable to cache something,
>>>>>> when not, and making the code use the ones already there.
>>>>>>
>>>>>> Tvrtko Ursulin (4):
>>>>>>     drm/ttm: Make ttm_bo_init_validate safe against ttm_operation_ctx
>>>>>>       re-ordering
>>>>>>     drm/ttm: Resource cannot be NULL in ttm_resource_intersects
>>>>>>     drm/ttm: Tidy ttm_operation_ctx initialization
>>>>>>     drm/ttm: Tidy usage of local variables a little bit
>>>>>
>>>>> I got acks for trivial cleanups patch 1 & 3 from this series. Are you okay if I push the two to drm-misc-next?
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>>    drivers/gpu/drm/ttm/ttm_bo.c       | 64 +++++++++++++++---------------
>>>>>>    drivers/gpu/drm/ttm/ttm_bo_util.c  | 57 ++++++++++++--------------
>>>>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c    | 12 +++---
>>>>>>    drivers/gpu/drm/ttm/ttm_device.c   |  5 +--
>>>>>>    drivers/gpu/drm/ttm/ttm_pool.c     | 26 ++++++------
>>>>>>    drivers/gpu/drm/ttm/ttm_resource.c | 14 ++-----
>>>>>>    drivers/gpu/drm/ttm/ttm_tt.c       |  2 +-
>>>>>>    7 files changed, 83 insertions(+), 97 deletions(-)
>>>>>>
>>>>>
>>>>
>>>
>>
> 

