Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01039E38B7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 12:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C33F10E1DF;
	Wed,  4 Dec 2024 11:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IkExcwUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2774110E1DF;
 Wed,  4 Dec 2024 11:24:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bny0XO2ZE2K74eJ3Z3FtvOcttmyf9Sl4+aAQVjrLPwVviCdCf30+vB/4zJHWZRszo2/bxRqKXnt+uhklXg+wIjPv7wOkVlX0ZdRxOU6wAfM6CiLyLqeqh1SyzJ5LHy5Dy4m1VA5gpDqJUS2QhnR1/3mgMnsrNfkzdqfrzSFMkBQ6CexLp+maSyY04M1H66l2xkuVTzHF2+WC9++uk8WHloM39JiQUPgM5NvsG/er6ORqutsaraR2MIQhEP1WClHtQCpAmU6tFXmMHSp/Ec1C0XDTIoA8n42k8CP9pTK3uoZ5S15EBdEue8fqO/22un75c8hH+zyQecZjdw3R9/HDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIdlSPx3I9VX9DuJF+SWlCRZnjOP7HksWCUrqa+vEhg=;
 b=jW07uPGXv/Qo/EgZ9hmBGDYcSCF6yZL2nJHTI0vEHLE9ICBKshy93JVyiZ9JTS8R7xNOqvJcRbuiAEL6XclRpf4Ngc9ZZfmv73PXivpoKgkLwtDEAaIn9C9+D2oOY37EXuCjfykV0U6U6WwjXU6KbyUTqzryN7cxvg0+F3vcxCLFwhA6ktQHUIfoDW6C06X8bqJ2AS7Ann7TUTXDbIWUhCs07zSLrW7XwZS4pF5t5a2E2bixzJvIRncX4bZ1tO4v/dun+LIWQ8g3sgtwqZR+E4LJZvwmgQt4FxVtyLmRMhKOasC47xW5aFMckU6djwEE2Td+Bixw4+kixCcrrdlNIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIdlSPx3I9VX9DuJF+SWlCRZnjOP7HksWCUrqa+vEhg=;
 b=IkExcwUd+zMMJB+zoLGK+87ylUhur3VbWj83KfmHhWMctzj5LkjCcljLd2eTx6zD62aAzXzVlfS9hG99DH/6Va7fr9wokfUQQ5NGLgJal02Er1DLrE3Mm2+4uOivZIhIb3OdkhS4YudAR89NcLwvJV3uae1TFpyE2heg5VNY/GY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 11:24:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 11:24:09 +0000
Content-Type: multipart/alternative;
 boundary="------------Q4hpSLa88gkzfZVw47cP9l0b"
Message-ID: <3130e373-5dbb-4f4b-a24c-a0015a638c3e@amd.com>
Date: Wed, 4 Dec 2024 12:24:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-4-thomas.hellstrom@linux.intel.com>
 <800ee040-7c2e-47d0-81e6-a352f5f689fb@amd.com>
 <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
 <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
 <73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com>
 <0595e4df-86d4-4082-86ab-b77902d3020b@amd.com>
 <cf722b696676b7383a94c2b846f8230e180ee527.camel@linux.intel.com>
 <bc762b0c-4fe3-48ff-b8df-14f741c91939@amd.com>
 <f74a7b678b5013dbcbe090bbff885827d3675247.camel@linux.intel.com>
 <c74e9f5c-3201-4083-8b79-80fdbbd903f2@amd.com>
 <5f3c04297fd6f008cad0415d6b6c04ba8c3b5a8c.camel@linux.intel.com>
 <26747cae-d66a-4bc4-9efb-4fdda4ac766b@amd.com>
 <e7654f8140ce2bd1afdca20b21b139cf810b6070.camel@linux.intel.com>
 <1e378253-57f0-46b1-b6a7-a6b8997d7e1b@amd.com>
 <9e2d75c95a9ed06912490937b1163f2a54d0196a.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9e2d75c95a9ed06912490937b1163f2a54d0196a.camel@linux.intel.com>
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a7d228-fd42-4811-97f2-08dd14562c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0ZHcmVnV0kvZDNRbytoMFpCK1NzcFRiZFY5bS9jMVhSeXRqbERvdUoxbXIz?=
 =?utf-8?B?ZnM0eUZ5N0dpTjZ5WjFFYlQvUUNJdlI3K01RckxSUVRWN1Y0REdRVGJBRGNQ?=
 =?utf-8?B?Qk5URU9relZBWkhhVmM0NHdQL29tUG5Eek8vWDFSNU9sWlFJdHNYRDRqUzMr?=
 =?utf-8?B?WXdVQm9XM2JaK1diR1pKMnlNR2UrWnhkZWExNlVkWTZUWG5MQnp3QjlJNmt4?=
 =?utf-8?B?c0hCRWdOWFhoTVNnYU1SY2hKcjJodDQ3VEtEVkpqczdkQXkydDdNMENjcTB4?=
 =?utf-8?B?TjJiS1RqQ2RFTmd3UVVORUVPM1hmVkZDM3VMMVRERkM3dndGUE5QNjhBVzB2?=
 =?utf-8?B?RDlPVWMxQ1lLRlk0NG1oZXp5MktXQ0ttbmFCcUxZTU1reGd6UDJObG1uVTZB?=
 =?utf-8?B?VFAwdm4yMFVwOTRkT2o5SklqYUI0cjdoNVZDQUdqNit4T0YrM1VrblA5YllT?=
 =?utf-8?B?OURSeUpDbmI3ZnRjS2R4bFc5UFNNTzBSSnYrSnd6U1hMS2dvZzF2aHp5elhu?=
 =?utf-8?B?SHE3MDNaeUVXUUk4YmVMVTlibkEvejFRcnExNmJGMTlxV0Eyak01NXJDS2xi?=
 =?utf-8?B?M3EvbWFLcHhZQ2RzTjREdkdrL2tzc1BWWUdBQk9TTlFiOFBBTTFVRHlhcDdM?=
 =?utf-8?B?S2FRTWgrTE1YVk8xRmNuYWxOTmRGQWZnbjZHN0RmdFl2dHdKbHpKTTRIWk1x?=
 =?utf-8?B?dmV3ZWhqekN6aUZHOFpsUnFYMmpBTHpRR0JPWFdZdG94d2NVRENha3JuK3ZP?=
 =?utf-8?B?MFJ5UEV0alVmbXpvbHg3N3Y1ZG4zUmFHWERjdTlWUVZmSzZPQWZQVy9JUGkx?=
 =?utf-8?B?c3RUUnFZaTlzcFd3UllEY3FWTXhCdlo2ald1TkltWStibnZvOHh0WWkya0lY?=
 =?utf-8?B?Yis4dEgvL2NianNkV0NoZENZTlFIcm54djJNdmJxTU16OFo3bXE2RThKUlFH?=
 =?utf-8?B?b2FBSzROME9uK05yOWNTQkQ4aEUwWVZYRUNSLzUxV0JmQUF6em5iL3QxV2Z4?=
 =?utf-8?B?MnpYVVBkcjFHNndpOTZRODZ6bDZuTnRBdHMxRTd5RkRURTJwZUY3VmU1K3FK?=
 =?utf-8?B?aWMyNTQzWE1iNjhpdEczdjFuczE3cXd3QnRsZmFUNHAxM0gyc2FJUGg4dVBT?=
 =?utf-8?B?Ym9GdE9EN1k5bjFHSXJXTDZqOS9RRUVsWW5iNzJUdC9qTE1PUTdkc3diK0Yv?=
 =?utf-8?B?VVJmaHA3U2ZDZkhidVIxRFBPbDQ2cHNNak5hNGxtZ0xLVW5oK2w5OXlwN1lQ?=
 =?utf-8?B?cXNHY290dzd5MWNsU01QUG1HVmt4MmYrZ0IzWkJ0dG9iVmQvOVE1N2cxOTJS?=
 =?utf-8?B?QWdzN2tOa2NBOGh3eUVGVE9OYjlVSTlZQ0ltdWVwTXRJdm9VY0RLaTRsUDJE?=
 =?utf-8?B?bU9taEd0bEJlRTg3NDBCaE8vVUovMmpqQktLaGt6RnJ5TWRXcFFUTGdwS3VQ?=
 =?utf-8?B?Ky9TQ283YmZBOStSdEU4dk1ROGwwekFraWJJQUZhckNJeHVMeFJhUG9Oa0k5?=
 =?utf-8?B?bW5yOFhSWEx2Tm5hRS9PVUkwSUJlclZqbm82aTgxK3dVK1RFR0JndkxnbkJy?=
 =?utf-8?B?S2tzRzdWK093YW1sc3FqSDFvR2F0VHF0eGNlQ2FoRDlRR0J0eDNoN1Z6Vlln?=
 =?utf-8?B?MzBkdEVUNXVCVGdrY3JHcWJZYWQ5UnVGTFdla0RVb1lxMFNHYVpIbTZ5MXlV?=
 =?utf-8?B?eVFwQzg4ZHZ6Um85OEN0MmcxZTJOVGdmay82ekZLbVpWZU5FbjJiWEk5VW1U?=
 =?utf-8?B?L0hqb0VtOHF3SVVLTHIveDZOZFprRHlsQ3I1dnRIVm5CcnZXci80TzVKOHVG?=
 =?utf-8?B?ZjJGQ2lEQVEydk5CdzBwQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU9BR29FU1BiTDlTU1hNUUl2MXJFWGVyd0JzbHFMOGE3cFlYRVAraDNhUEVY?=
 =?utf-8?B?Y1RZZitOYTZ2WnVKZ0RUVkM3MTAwbTJRU1NYSUsvQzUvdkVCcUZhdGVBTXVF?=
 =?utf-8?B?dDJLbFJ5a043cURyM213Y0FhL2NGbkVUNUk2S0VvVlRBbE5wYjlmdGZqSGJF?=
 =?utf-8?B?VWYxamdpc3laZm1vUnUxU1NnaUJ4RzNlSDBJbWRudUdyOGtVeWpJUERUMEs4?=
 =?utf-8?B?amJmRlZta0IxWDJWcnlJeFRYaDd3V2p5cERMbnV0d0FkRkdlQVJXNGhBNEcy?=
 =?utf-8?B?WnFJenVLOVJjUzdYenpIZTVFbXg5b2w5Z2lYYjBoTDRhbDNTRDFCajFzcWJG?=
 =?utf-8?B?NWVUbkJkM2plVElmeTVxWkpxZEZjZXl0Y1JSclFjcWxpS0xwemhnUTVGMEdD?=
 =?utf-8?B?dE4yRjFlaUp2UlYxVW1GU20zNS9TVUdrY0x2b0pYMTBNOWovd2EzdmRaL1pz?=
 =?utf-8?B?SVduRlExY3BjQ2VFZ1J2R0dkNFpiQ09aZHVLcnpaMHV6M1Y4MGJkanRTT2xH?=
 =?utf-8?B?SnUyUzRYTDdTemV6Zm5VaDJ2UGc0S1R3YXBlODhOSWFaUlRJaE43R01tNE5x?=
 =?utf-8?B?NVMyVHdwZ2J0czJjdzlIRXkzYUQ4clhvYlo2dlVPK2RyYlNnZHhzVXlhVzBY?=
 =?utf-8?B?REVyVU1WN1VtRFk3SCtwMStkd1hlWlY2VjNqNVczY0EyOXpJUUFZaEVvSW45?=
 =?utf-8?B?dmp2RUhGS1Qxd3hVTnNNQmhnWDB0RFJQcUo2aWNJNkNQNytGTE1SMDRKRzNV?=
 =?utf-8?B?L0d4ZGdHcnNsME5zVDJuTk9xV2owQUptampIamdNZ1FpTnh1Mm1aSnBmTVpa?=
 =?utf-8?B?b20wY2ZuYVM1QTdSUWV3b3lTenZjZ2pXZGNSQm1vUmVYdjNock04NDlSU3ZG?=
 =?utf-8?B?MStPYWxIaGRHYlBIdEYxeVZUdS9sb3ZZTHlSSnF5SE01YXdwanFNWDZkVllF?=
 =?utf-8?B?c2xudURXVTB4cjI5VXlLQ0cyNnJKVzlVcExibEF4V1FDdHkyVmdXaHk1TWsx?=
 =?utf-8?B?Sk9wcFRXdjNCMkl2a1ptSkdzV1hydGZKbFUvMnoyRks4R1VYVFFvWDc2L0Qz?=
 =?utf-8?B?V3psRWhMdjUvVUlPU2kvM25ZNVkxQmhnTlFaa2tpVjBUVHdabG0rNzd4UUJh?=
 =?utf-8?B?aVZ5SWIwclV3OFlJMmtHZUlKZzlJWEl0cVFaTWluT2MrcWVrRlpvSENhbFFW?=
 =?utf-8?B?Y0hKWnhBdVFoY3ZoRUQzUmxjL0V6ZnZzZWVGZ2pJRlFMd2llSDlkcnNYS1BM?=
 =?utf-8?B?QXpGY1hWYThzUnpqbHYzUmJCbFhoVzRBZTR2UkpLYUNFajEyQ1JBeHR5QXFF?=
 =?utf-8?B?blBsR3ZpcUdsTVVrMXQvV1I0Z095UmVmZzJ2aWxMS2FZelY0VE5makMyV1FC?=
 =?utf-8?B?MlkxNXdQQVExV2c0RUNPeDA4WktESzRlVFdOUVhpeTZZZVNSVXZpZndDdzBa?=
 =?utf-8?B?Zm1QTHlLNllSbjBpRXBGbDc0VjVxclBzYS9OY2JuYXZTUVUrMFdwUGR4M2Fu?=
 =?utf-8?B?OHMrRUhXcTNtanplcmVMY1UxeUZkRnB3TE91bE1yb1hQenVUVE9vWVJaSk92?=
 =?utf-8?B?SFlMTXFEcjdiL1h2UHlEaXB5ZE4xM0Y4N0RpUElrN0RhU0pLZFB5SmsyQXdl?=
 =?utf-8?B?bWxZbTc3TjhYVkoxQjNiSDdHaklUWVdDZWVSMWhSSmx5TzgyV1NNZDlUdjha?=
 =?utf-8?B?ZE0zMVF4ZThGdVplK3FNeTJMSXFGNXhxK0wzTnoxeHo4SXdMM0hkYjdZYVlI?=
 =?utf-8?B?TnRRa2hLbjdCVHBwYzhlTVVwYUlUa0JaZjNYcHVkRHZtdWh2RloxY01hbVZP?=
 =?utf-8?B?YWVsOUNJVXpaWmRwUzhoWDM0N2FvMEhWZzdQNDlaYUQ5MEdzaEtySlRYRnVO?=
 =?utf-8?B?c2M4NmFadVlIMkZhZ3dmaStnRE42WFJER2tWdllvSGFFYW1mTHVxL05VSmlr?=
 =?utf-8?B?cDVUNFkxazFwOGdQcmEwOENFcTVoQUpLUTRxRFdORWh6bzZmYWV6SGllV2N5?=
 =?utf-8?B?andXeHkrWkVWRmFPZjRkWER1R0R1WEVCM2R6ckYyMjVNWVk2bmZpU3IxMWNv?=
 =?utf-8?B?dElNUlMyU1BzKzQ4U04yTDJld0hvSEJOcm00UjNpZTZpTEE4ZWlwWnIvZklT?=
 =?utf-8?Q?WlwvzT6iMfPVlNoVqcWIiJYUb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a7d228-fd42-4811-97f2-08dd14562c18
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 11:24:09.8460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zFESJFD7KB8N0/Jxe4XKHGR2GG7ZW34EV3tyq7NR6uyuGeCQUEFODOiFEf3Tpbc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308
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

--------------Q4hpSLa88gkzfZVw47cP9l0b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 04.12.24 um 12:09 schrieb Thomas Hellström:
> [SNIP]

>>>> BTW I really dislike that tt->restore is allocated dynamically.
>>>> That
>>>> is
>>>> just another allocation which can cause problems.
>>>> We should probably have all the state necessary for the operation
>>>> in
>>>> the
>>>> TT object.
>>> Initially it was done this way. But that meant a pre-allocated
>>> struct
>>> page-pointer array the of 1 << MAX_PAGE_ORDER size (2MiB) for each
>>> ttm_tt. That lead to a patch to reduce the MAX_PAGE_ORDER to PMD
>>> size
>>> order, but  as you might remember, that needed to be ripped out
>>> because
>>> the PMD size macros aren't constant across all architectures. IIRC
>>> it
>>> was ARM causing compilation failures, and Linus wasn't happy.
>> Yeah, I do remember that. But I don't fully get why you need this
>> page-pointer array in the first place?
> So the TTM page-pointer array holds the backup handles when backed up.
> During recovery, We allocate a (potentially huge) page and populate the
> TTM page-pointer array with pointers into that. Meanwhile we need to
> keep the backup handles for the recover phase in the restore structure,
> and in the middle of the recover phase you might hit an -EINTR.

I still don't see the problem to be honest.

What you basically do on recovery is the following:
1. Allocate a bunch of contiguous memory of order X.
2. Take the first entry from the page_array, convert that to your backup 
handle and copy the data back into the just allocated contiguous memory.
3. Replace the first entry in the page array with the struct page 
pointer of the allocated contiguous memory.
4. Take the next entry from the page_array, convert that to your backup 
handle and copy the data back into the just allocated contiguous memory.
5. Replace the next entry in the page_array with the struct page pointer 
+ 1 of the allocated contiguous memory.
6. Repeat until the contiguous memory is fully recovered and we jump to 
1 again.

What exactly do you need this pre-allocated struct page-pointer array of 
1 << MAX_PAGE_ORDER for?

Sorry, I must really be missing something here.

Regards,
Christian.

>
> Thanks,
> Thomas
>
--------------Q4hpSLa88gkzfZVw47cP9l0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 04.12.24 um 12:09 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:9e2d75c95a9ed06912490937b1163f2a54d0196a.camel@linux.intel.com">[SNIP]<span style="white-space: pre-wrap">
</span></blockquote>
    <br>
    <blockquote type="cite" cite="mid:9e2d75c95a9ed06912490937b1163f2a54d0196a.camel@linux.intel.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">BTW I really dislike that tt-&gt;restore is allocated dynamically.
That
is
just another allocation which can cause problems.
We should probably have all the state necessary for the operation
in
the
TT object.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Initially it was done this way. But that meant a pre-allocated
struct
page-pointer array the of 1 &lt;&lt; MAX_PAGE_ORDER size (2MiB) for each
ttm_tt. That lead to a patch to reduce the MAX_PAGE_ORDER to PMD
size
order, but&nbsp; as you might remember, that needed to be ripped out
because
the PMD size macros aren't constant across all architectures. IIRC
it
was ARM causing compilation failures, and Linus wasn't happy.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah, I do remember that. But I don't fully get why you need this 
page-pointer array in the first place?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So the TTM page-pointer array holds the backup handles when backed up.
During recovery, We allocate a (potentially huge) page and populate the
TTM page-pointer array with pointers into that. Meanwhile we need to
keep the backup handles for the recover phase in the restore structure,
and in the middle of the recover phase you might hit an -EINTR.</pre>
    </blockquote>
    <br>
    I still don't see the problem to be honest.<br>
    <br>
    What you basically do on recovery is the following:<br>
    1. Allocate a bunch of contiguous memory of order X.<br>
    2. Take the first entry from the page_array, convert that to your
    backup handle and copy the data back into the just allocated
    contiguous memory.<br>
    3. Replace the first entry in the page array with the struct page
    pointer of the allocated contiguous memory.<br>
    4. Take the next entry from the page_array, convert that to your
    backup handle and copy the data back into the just allocated
    contiguous memory.<br>
    5. Replace the next entry in the page_array with the struct page
    pointer + 1 of the allocated contiguous memory.<br>
    6. Repeat until the contiguous memory is fully recovered and we jump
    to 1 again.<br>
    <br>
    What exactly do you need this pre-allocated struct page-pointer
    array of 1 &lt;&lt; MAX_PAGE_ORDER for?<br>
    <br>
    Sorry, I must really be missing something here.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:9e2d75c95a9ed06912490937b1163f2a54d0196a.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Thomas

</pre>
    </blockquote>
  </body>
</html>

--------------Q4hpSLa88gkzfZVw47cP9l0b--
