Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474A3AF764F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 15:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BBA10E84E;
	Thu,  3 Jul 2025 13:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="onh1XgJj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB60F10E84E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 13:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4r2uaR2gqpUm8ynOrw3ugtxPRLRsp1eUvxgvhcCeklS3p/2c3XAiW5nrXyuY0R5dT9H6lrLwnPqQog4Fvt+IXYxklexAJYqkE3YqNFIATUCJL+nZb9RhOdFSsDVFUkbZCW1CS28QRcbyQ76K8Bghlq7A7voaZd3yStpvLFWDncd7/thMbCBb9FYCxmzdPMccfb+b2NHE7lNJfjyZ88bWc60CeK8Vk+twdv6DF69s6rFa83JlX6xnXFeBrpSyJr6maoLzJC0+TnnyRmf/bEMeXlmQuPvUHreX8S3i98gMnM5cwFrxs9doXzTJwKzavsUj7u46XVcaPvfom46lUUC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlnwtoytsx8i8WsqJ+J/GbaeougGnWON7NlwNdHA31E=;
 b=RguTqX+0N6JXrpfkGm5q3hLcOF7fZkxqUI8qtX/rXZygKXCniv6r+SiHIpwS7RqtaLrl6AcAtYNxQcTIO4AjJ333toEru/S8s0CpPtj/FL+M5dO3/+dueApm8pOnMvqpUqocyOJwefSEA6DDc9RwXnKXdZZ/d4AKP20Xa+ixPULuEKxF5gV0KUJ1jC3YaiSotEHKEnTxYbTG0oFlGoc60WFDUxWk+GgV7Jqtm3E7/QTVs3a07lYJOUpW6QNx1NZv/YYVNcTcfmuA8dhI4vMRobAaP/npDAJKsSODRci/4ZrU84aStFu+Dqxfln7aR2DYrSTgENSfGXBUIrR+onAc8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlnwtoytsx8i8WsqJ+J/GbaeougGnWON7NlwNdHA31E=;
 b=onh1XgJjGnZ6Ex0cDLRvwA8NX1bbOKIjMmOb+zT090+tlnoKfX2UsZhS1dd6drnUcRUnv8/FPn6LVTDOq/d+9JFH1W0Xslruj1LDYrznn954pXCcz/ha06LQ5DA2ErOctGFfJoHzyVmt8ra8FgReWyJUBxlOpFvqRmZqqGIlOzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9329.namprd12.prod.outlook.com (2603:10b6:408:21c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 3 Jul
 2025 13:56:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 13:56:50 +0000
Message-ID: <6298d903-9da3-4d66-9a57-8208eef8f6fa@amd.com>
Date: Thu, 3 Jul 2025 15:56:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Warnings in next-20250703 caused by commit 582111e630f5
To: Thomas Zimmermann <tzimmermann@suse.de>, Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Anusha Srivatsa <asrivats@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250703115915.3096-1-spasswolf@web.de>
 <d81decff-35d7-402b-83b2-218aa61f6b09@suse.de>
 <24bf12cf-12a3-405f-9fec-ea1e8ce21a7a@amd.com>
 <a4fcdacb-1cb4-4a40-928a-b64ed3f0d1f0@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a4fcdacb-1cb4-4a40-928a-b64ed3f0d1f0@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0368.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: a1cc1143-5943-439e-126c-08ddba3975a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkR6M1BUOFZZUlJlYVNoVHh6ZGY5QlBRZ1hhZTc1OU01R3dRV1Jxakg3YnhT?=
 =?utf-8?B?Qkg2LytaTVQ2cTJzeXhFZE44QUI3VmFqZnJYV3JiTFpFUVJnWVNUR1dqWC9m?=
 =?utf-8?B?S2VDL2dZd0xaZUdGM3lnMWRNbTFjUkhLcXF1bFRkSU85SkNSTC9vc21kME5L?=
 =?utf-8?B?TURiSWlkcjc3dXoyM1Q1VzhieEhVNmwxUE9maUk0N0dtZWtHRDFRSFZhenZ5?=
 =?utf-8?B?Q0JDUlkrMUNOQVY0MHJQWlhOODVLNTUrLzR6bmpWb1hUU05PMURhNHFDYzB5?=
 =?utf-8?B?QWpIeWhZbzNGSC85bGZQMjdLSG8xK2FhUnpBT3ZDd1MxajNPaENkS1BnNHZp?=
 =?utf-8?B?NStZUzhXSXp5dnB5dVJGMi9nWC9JNmRUYTVzemRGV0dnMElvZEJqMGhESEFL?=
 =?utf-8?B?eEtIUmRidHU3Ri96U0t2UTBnNUU0Njg0alpMVFlrRWJLb05DeFBwQlFvTHZ4?=
 =?utf-8?B?ZGw0K283bmx6dkZEU05wMFFEYktoVm9Semw2SWNERE0rdjcxK3k0UDJGdTRn?=
 =?utf-8?B?WkV5Z1hFR0pjNk5Ta0JNUG9vME9qM3d4NHBwSXdPcC9UdURjUFlaUlFtc21j?=
 =?utf-8?B?UDBwVFN2SkhuNko5WC9YcHREMHBrOXJZOWFlNU5oc1hOVlF5eHdoY2FPbG81?=
 =?utf-8?B?UC9nSU9tekJvK1d2WVpOSjdqdERGcm45OUREYVFMRUVTRXovWG5hSUE4eEIz?=
 =?utf-8?B?VnBWNmpTazVHL3AvSDd5K1M3bVhoL0VBT3daZ2g2S2tDeitPdExEOGJZRExx?=
 =?utf-8?B?b0dzdnpLdUFZSkxVYVV2Q2YyS1ZBT254RDNGSzJDYkRuNjdCckZFcUZRdUhK?=
 =?utf-8?B?cWN0djY5SEpQNXk1ZVRwSERVNEdLYVNoeFNwL1B0QkgrZGw0OSs1K1JtQXdK?=
 =?utf-8?B?aTI3OU84bmZibDdkbTNZSGg5TDhHN1ZPb1NqcjNOVHhQVUo5UTlJb1RzWDR3?=
 =?utf-8?B?c1lTd0J0Sk11RXlLQzVpTWtPNDMxbWw4TmJmS0xlWUNlSDJuUnpWV3hOQU1B?=
 =?utf-8?B?SU4zWjF3MTNMTXBWZGxCd2FFQm9sUVgxNUxUT3R0dDlhNnF6a2RmVklZSG5o?=
 =?utf-8?B?SDZPdG14YVl3SXY3RTJCZ3RJcGRTZUxlUEFocHh5aXV1cUhKUTRQSTVsMlpY?=
 =?utf-8?B?RUVQZTh1RXJlM0srSmRzYmhwWEYrTHNQd2xGNXh0SXJQY0VveG5vZ3RGY3ln?=
 =?utf-8?B?eWZyQnc3ai9DSjh6Um9JbGFHbHJXdm9mWER3UGJ0MHJzNk5vbHc2ak5rZkI1?=
 =?utf-8?B?aS9kVTQxdWp5STV3SjFVbHdZd3JGRXNuK3NWZ21pTzJWWUpYV1oxVlJxKzhx?=
 =?utf-8?B?RUtqa2hlUkQ3UkJkdFozanZzWXVXdjFxVjdUWGZ5KzBpVC80c2k0a1grU3pP?=
 =?utf-8?B?RE1VOGpGdWpmWEc2WXdUcUpIeTR3ZkJMMC9SSWZSa3NwQXJkVFZRZ3VWMmY2?=
 =?utf-8?B?WkxsZVRuL3BCbitIcnVJYVVXUis3cVkxMCtIRHpRWUhybm11MVNYK1BwN2xT?=
 =?utf-8?B?TU91Q0dSMVJFcHdyelMzcFJ3clFvWWxUNi9Id0xGMFE5TXhIUmhrdWh6V2xv?=
 =?utf-8?B?TWg1M0o3M3B6eU9GWWR4ZENaVENMR055QW5RMmJVVUxQNmVhamVmWXErZDBx?=
 =?utf-8?B?REFNcENpMWhUN0MrQlg1ZDJkTTYrK1hySHQwSGRmNWhVWDh3dEVNZTV6RUln?=
 =?utf-8?B?d3FaelNINjNIK1VCVytoY0Rva29xMklBOHRwVFJreCt2NGhoeXMwK1RpWHV1?=
 =?utf-8?B?TVphS1BBRTgwNi9WUDIyOVJEY09ySVZBY0tMR1J1ZnYwTmdobUthZit0aFFW?=
 =?utf-8?B?TG1XYmU3RE9RLzE3WTEyUEdtSmIrbzR1cUUvUUQzSnp6RkRWTnUvZnZONS9H?=
 =?utf-8?B?Wm9XYjBwSnhmcU5HRzhRNUR6WjFCalBycTJqQnlGbjFMN2dyVDNwVHdKc011?=
 =?utf-8?Q?ezVPP6jOdp4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1VWd2srbnRQbkJUbDlWeTliNW9OaXlRRlVTNzJtUTJDemJOUkU3a3EvNTZD?=
 =?utf-8?B?Mi9xekM1UTRqcW8vR2RLbEQwQWZWQUlvSDBmaHVoUERxa3NiMGhFWWt2Y1VG?=
 =?utf-8?B?UUVFQWpCQjVuSkhnck1SZ2NiVU9XMDJDOXdyb0pxc2l5MXJReC9rU2o5OWJ5?=
 =?utf-8?B?VWZHaGZxQmFGTk4weThXZnliNm52dUlwWGZDZFhLK29rb1RtK0tZSjV1YlNY?=
 =?utf-8?B?ajhlR2hUc3pBQ1JoanhZam9ZWGo2UndBd21XZmZUanA1ekROTmJVdXA1Mm15?=
 =?utf-8?B?Q3BiZkRhcjB0U2xnU2J3bmRRV3N0TWgrM3BLby9mRjNEWlA4YVBMRURMbjlH?=
 =?utf-8?B?Rzg0SnliOEI3Y2JERUM0ajF2LzZGTFlXQXVNWWNFSVQrWk9GMHRqMjRCM0o2?=
 =?utf-8?B?eGVueTVxcHhrUlltWFY5WW5kUFA1VEJZSjFCWVFQUXUrTHFSYkFuRjR5THRY?=
 =?utf-8?B?R2dVdVJxYkJudFpwbkpWQXNoNkNkZFZ6dWtCaEM0OVg1T0N6R3dPVmdZR2Nj?=
 =?utf-8?B?ZTU4T2dTbHVhUjVEbzNMUk1DTmI3Yk91S2EwVFlkbE1NRUUyLzdaVThJTm5z?=
 =?utf-8?B?SDJ3dndIYnl6cUtFeUNOZWJhN2hqanQ0Y1p2S2RHK0xKSkxTQ2lCRXRGWmth?=
 =?utf-8?B?MGhmK0wyYlduMkdiOVpHSERiOE1tcExPNGoycGM5NHk1RkRwSmRVaUNsWVlF?=
 =?utf-8?B?dmxrRThtc3hWZmZ0d0ozamk5OWFXZ0lURlN5dUVWdU9TODFGYTlZczlaTXFa?=
 =?utf-8?B?azJUQkp2dFNBZGp3MFkxRWx0ekxaY2dBMDZkclRUMVJrcjJhWVFyd0hpeTRl?=
 =?utf-8?B?UVJ0bktTdDVaYXFmUW9oWVF3VE1Zcmo3RjlyQ2dsNlhaWlMzSnZhWldCeGs0?=
 =?utf-8?B?MFVxN3dHL244YXRIcG8vNjVCdnUwR1E0RDdKams2WkhSUG50UkJ6T2NaeUF6?=
 =?utf-8?B?Nk1tWFBJTlBzN1lVQ3VsRmJ1N2J2Qktjd01oejF5R2ZmK05tSllxZFNtbUZl?=
 =?utf-8?B?dXI0ZHdsaWY1YzU1eUtJNXJQMDAwL3RydmNhQlYvUlZnOWZTNXJUeEFHR1Ew?=
 =?utf-8?B?dWtNRXR0N20ySXdwTC9ObWRpaHFuOW1UMEMvTFVselZoaTdLVGFkSHhONEIy?=
 =?utf-8?B?emNVcytXZW9JRlA0UTNPMUltdU4xayt3WS9pdFYxWlhaNHZrYkRSalRWaFl6?=
 =?utf-8?B?T2tnYWpxSHdJNWlzNStDM3BHc3BVd3U5SDVLU25EZTVsUXNmS3NBR2dCdEhK?=
 =?utf-8?B?dHgrZHJNc0FKQmh2dWc3SGd3MytxYjBYaFNiV01Ra2k0ZDlIS0M4ZEgxWGU0?=
 =?utf-8?B?YTZRdU9paXorR3lmWFFybThHVE55Ky8yNGpSZkxyM3NNS2JuejFoL2tQWnRR?=
 =?utf-8?B?eS9vVEw5V0xaek9QMVdnWEo1RjhESENCZExjL1NPRWpucVlTV1RXMGc5dDEz?=
 =?utf-8?B?VlVMVXhVcGEzbmJaS1FsQmR0QS9xRWZ1UHVHSU1oV1VIVzhEVzE3Y2xlTW9Z?=
 =?utf-8?B?TmhXMS9EY0IySWZ1blMxUDlaSjRmOThVVFJsTVNKdFpkUk5Zcnlaam4xLzEr?=
 =?utf-8?B?QUZKWTdnbHE2UldzWWZjZklmbGc1MWhkWllNWVhKNjdJRjBQL0RBanp6TUtn?=
 =?utf-8?B?cEtLQXUzWk13eWIxL3FrU2ZQNlIzOTBJZWFtcEdzK09KaklabFRIbHdwd1BF?=
 =?utf-8?B?Mnc0cFZmK3BhWnlFMUV2TzdOODRBWUgzWDliNlozZWNRWllVcytibzk5TmJQ?=
 =?utf-8?B?SmJMV2l4N0E5MFhpTUl0ckFSTnl4dERuek96cEVIa1pyY3JHd0kwZmxITjEw?=
 =?utf-8?B?ZUhLczdjZ2RWR3grQkdhYnFFSnJ0d3UwcTQydU5mYUQ2WTlnK0pLRzVvOHEy?=
 =?utf-8?B?cmMwWHVub2VJR0M4WExlRVNpaTFKb1VOR1Npa3VGRXBHUTE3bEIyUHhpRlRN?=
 =?utf-8?B?MGlLaE5EYzVLVlRQTlJHNkJpRG9Fd2hoSFgydExGVUFFYmtldUhlOUpGTks2?=
 =?utf-8?B?RXdtL0JITTFrZ2NJc0F6aUp5Yk81N2VmSTIwS1kxNTFuSjFEQVYyWHJvcTBW?=
 =?utf-8?B?VFkyU2pUdHBVTFJUSGMyZzA4UDRxNVhoclVmNlFpdm4vVHZmTlF5dGdValBC?=
 =?utf-8?Q?Oklwb9xB7TJly1R+B4YHlBD81?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cc1143-5943-439e-126c-08ddba3975a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 13:56:50.7859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DnAMN7P/GSk6SwJSGK1f4a5fTzyQjTuziRBcbrPk3sWIT/Y+zaVfJYNi4lIiyrn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9329
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

On 03.07.25 15:54, Thomas Zimmermann wrote:
> Hi
>=20
> Am 03.07.25 um 15:45 schrieb Christian K=C3=B6nig:
>> On 03.07.25 15:37, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 03.07.25 um 13:59 schrieb Bert Karwatzki:
>>>> When booting next-20250703 on my Msi Alpha 15 Laptop running debian si=
d (last
>>>> updated 20250703) I get a several warnings of the following kind:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.702999] [=C2=A0=
=C2=A0 T1628] ------------[ cut here ]------------
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703001] [=C2=A0=
=C2=A0 T1628] WARNING: drivers/gpu/drm/drm_gem.c:287 at drm_gem_object_hand=
le_put_unlocked+0xaa/0xe0, CPU#14: Xorg/1628
>>> Well, that didn't take long to blow up. Thanks for reporting the bug.
>>>
>>> I have an idea how to fix this, but it would likely just trigger the ne=
xt issue.
>>>
>>> Christian, can we revert this patch, and also the other patches that sw=
itch from import_attach->dmabuf to ->dma_buf that cased the problem?
>> Sure we can, but I would rather vote for fixing this at least for now. T=
hose patches are not just cleanup, but are fixing rare occurring real world=
 problems.
>>
>> If we can't get it working in the next week or so we can still revert ba=
ck to a working state.
>>
>> What exactly is the issue? That cursors don't necessarily have GEM handl=
es? If yes how we grab/drop handle refs when we have a DMA-buf?
>=20
> A dozen drivers apparently use drm_gem_fb_destroy() but not drm_gem_fb_in=
it_with_funcs(). So they don't take the ref on the handle. That's what we'r=
e seeing here. Fixing this would mean to go through all affected drivers an=
d take the handle refs an needed. The shortcut would be to take the handle =
refs in drm_framebuffer_init() and put them in drm_framebuffer_cleanup(). T=
hose are the minimal calls for all implementations. But there's the fbdev c=
ode of some drivers that does magic hackery on framebuffer and object alloc=
ation. so whatever we do, it's likely not a quick fixup. Best regards Thoma=
s

Ok that sounds worse than I thought it would be. Feel free to add my Acked-=
by to a revert for now.

Thanks,
Christian.

>>
>> Regards,
>> Christian.
>>
>>> Best regards
>>> Thomas
>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703007] [=C2=A0=
=C2=A0 T1628] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq_midi snd=
_seq_midi_event snd_rawmidi snd_seq snd_seq_device rfcomm bnep nls_ascii nl=
s_cp437 vfat fat snd_ctl_led snd_hda_codec_realtek snd_hda_codec_generic sn=
d_hda_scodec_component snd_hda_codec_hdmi snd_hda_intel btusb snd_intel_dsp=
cfg btrtl btintel snd_hda_codec uvcvideo snd_soc_dmic snd_acp3x_pdm_dma btb=
cm snd_acp3x_rn btmtk snd_hwdep videobuf2_vmalloc snd_soc_core snd_hda_core=
 videobuf2_memops snd_pcm_oss uvc videobuf2_v4l2 bluetooth snd_mixer_oss vi=
deodev snd_pcm snd_rn_pci_acp3x videobuf2_common snd_acp_config snd_timer m=
si_wmi ecdh_generic snd_soc_acpi ecc mc sparse_keymap snd wmi_bmof edac_mce=
_amd k10temp soundcore snd_pci_acp3x ccp ac battery button joydev hid_senso=
r_accel_3d hid_sensor_prox hid_sensor_als hid_sensor_magn_3d hid_sensor_gyr=
o_3d hid_sensor_trigger industrialio_triggered_buffer kfifo_buf industriali=
o hid_sensor_iio_common amd_pmc evdev mt7921e mt7921_common mt792x_lib
>>>> mt76_connac_lib mt76 mac80211 libarc4 cfg80211 rfkill msr fuse
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703056] [=C2=A0=
=C2=A0 T1628]=C2=A0 nvme_fabrics efi_pstore configfs efivarfs autofs4 ext4 =
mbcache jbd2 usbhid amdgpu drm_client_lib i2c_algo_bit drm_ttm_helper ttm d=
rm_panel_backlight_quirks drm_exec drm_suballoc_helper amdxcp drm_buddy xhc=
i_pci gpu_sched xhci_hcd drm_display_helper hid_sensor_hub hid_multitouch m=
fd_core hid_generic drm_kms_helper psmouse i2c_hid_acpi nvme usbcore amd_sf=
h i2c_hid hid cec serio_raw nvme_core r8169 crc16 i2c_piix4 usb_common i2c_=
smbus i2c_designware_platform i2c_designware_core
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703082] [=C2=A0=
=C2=A0 T1628] CPU: 14 UID: 1000 PID: 1628 Comm: Xorg Not tainted 6.16.0-rc4=
-next-20250703-master #127 PREEMPT_{RT,(full)}
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703085] [=C2=A0=
=C2=A0 T1628] Hardware name: Micro-Star International Co., Ltd. Alpha 15 B5=
EEK/MS-158L, BIOS E158LAMS.10F 11/11/2024
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703086] [=C2=A0=
=C2=A0 T1628] RIP: 0010:drm_gem_object_handle_put_unlocked+0xaa/0xe0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703088] [=C2=A0=
=C2=A0 T1628] Code: c7 f6 8a ff 48 89 ef e8 94 d4 2e 00 eb d8 48 8b 43 08 4=
8 8d b8 d8 06 00 00 e8 52 78 2b 00 c7 83 08 01 00 00 00 00 00 00 eb 98 <0f>=
 0b 5b 5d e9 98 f6 8a ff 48 8b 83 68 01 00 00 48 8b 00 48 85 c0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703089] [=C2=A0=
=C2=A0 T1628] RSP: 0018:ffffb8e8c7fbfb00 EFLAGS: 00010246
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703091] [=C2=A0=
=C2=A0 T1628] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 000000000000=
0000
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703092] [=C2=A0=
=C2=A0 T1628] RDX: 0000000000000000 RSI: ffff94cdc062b478 RDI: ffff94ce7139=
0448
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703093] [=C2=A0=
=C2=A0 T1628] RBP: ffff94ce14780010 R08: ffff94cdc062b618 R09: ffff94ce1478=
0278
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703094] [=C2=A0=
=C2=A0 T1628] R10: 0000000000000001 R11: ffff94cdc062b478 R12: ffff94ce1478=
0010
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703095] [=C2=A0=
=C2=A0 T1628] R13: 0000000000000007 R14: 0000000000000004 R15: ffff94ce1478=
0010
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703096] [=C2=A0=
=C2=A0 T1628] FS:=C2=A0 00007fc164276b00(0000) GS:ffff94dcb49cf000(0000) kn=
lGS:0000000000000000
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703097] [=C2=A0=
=C2=A0 T1628] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703098] [=C2=A0=
=C2=A0 T1628] CR2: 00005647ccd53008 CR3: 000000012533f000 CR4: 000000000075=
0ef0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703099] [=C2=A0=
=C2=A0 T1628] PKRU: 55555554
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703100] [=C2=A0=
=C2=A0 T1628] Call Trace:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703101] [=C2=A0=
=C2=A0 T1628]=C2=A0 <TASK>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703104] [=C2=A0=
=C2=A0 T1628]=C2=A0 drm_gem_fb_destroy+0x27/0x50 [drm_kms_helper]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703113] [=C2=A0=
=C2=A0 T1628]=C2=A0 __drm_atomic_helper_plane_destroy_state+0x1a/0xa0 [drm_=
kms_helper]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703119] [=C2=A0=
=C2=A0 T1628]=C2=A0 drm_atomic_helper_plane_destroy_state+0x10/0x20 [drm_km=
s_helper]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703124] [=C2=A0=
=C2=A0 T1628]=C2=A0 drm_atomic_state_default_clear+0x1c0/0x2e0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703127] [=C2=A0=
=C2=A0 T1628]=C2=A0 __drm_atomic_state_free+0x6c/0xb0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703129] [=C2=A0=
=C2=A0 T1628]=C2=A0 drm_atomic_helper_disable_plane+0x92/0xe0 [drm_kms_help=
er]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703135] [=C2=A0=
=C2=A0 T1628]=C2=A0 drm_mode_cursor_universal+0xf2/0x2a0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703140] [=C2=A0=
=C2=A0 T1628]=C2=A0 drm_mode_cursor_common.part.0+0x9c/0x1e0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703144] [=C2=A0=
=C2=A0 T1628]=C2=A0 ? drm_mode_setplane+0x320/0x320
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703146] [=C2=A0=
=C2=A0 T1628]=C2=A0 drm_mode_cursor_ioctl+0x8a/0xa0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703148] [=C2=A0=
=C2=A0 T1628]=C2=A0 drm_ioctl_kernel+0xa1/0xf0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703151] [=C2=A0=
=C2=A0 T1628]=C2=A0 drm_ioctl+0x26a/0x510
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703153] [=C2=A0=
=C2=A0 T1628]=C2=A0 ? drm_mode_setplane+0x320/0x320
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703155] [=C2=A0=
=C2=A0 T1628]=C2=A0 ? srso_alias_return_thunk+0x5/0xfbef5
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703157] [=C2=A0=
=C2=A0 T1628]=C2=A0 ? rt_spin_unlock+0x12/0x40
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703159] [=C2=A0=
=C2=A0 T1628]=C2=A0 ? do_setitimer+0x185/0x1d0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703161] [=C2=A0=
=C2=A0 T1628]=C2=A0 ? srso_alias_return_thunk+0x5/0xfbef5
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703164] [=C2=A0=
=C2=A0 T1628]=C2=A0 amdgpu_drm_ioctl+0x46/0x90 [amdgpu]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703283] [=C2=A0=
=C2=A0 T1628]=C2=A0 __x64_sys_ioctl+0x91/0xe0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703286] [=C2=A0=
=C2=A0 T1628]=C2=A0 do_syscall_64+0x65/0xfc0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703289] [=C2=A0=
=C2=A0 T1628]=C2=A0 entry_SYSCALL_64_after_hwframe+0x55/0x5d
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703291] [=C2=A0=
=C2=A0 T1628] RIP: 0033:0x7fc1645f78db
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703292] [=C2=A0=
=C2=A0 T1628] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 0=
0 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89>=
 c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703294] [=C2=A0=
=C2=A0 T1628] RSP: 002b:00007ffd75bce430 EFLAGS: 00000246 ORIG_RAX: 0000000=
000000010
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703295] [=C2=A0=
=C2=A0 T1628] RAX: ffffffffffffffda RBX: 000056224e896ea0 RCX: 00007fc1645f=
78db
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703296] [=C2=A0=
=C2=A0 T1628] RDX: 00007ffd75bce4c0 RSI: 00000000c01c64a3 RDI: 000000000000=
000f
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703297] [=C2=A0=
=C2=A0 T1628] RBP: 00007ffd75bce4c0 R08: 0000000000000100 R09: 000056221054=
7ab0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703298] [=C2=A0=
=C2=A0 T1628] R10: 000000000000004c R11: 0000000000000246 R12: 00000000c01c=
64a3
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703298] [=C2=A0=
=C2=A0 T1628] R13: 000000000000000f R14: 0000000000000000 R15: 000056224e5c=
1cd0
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703302] [=C2=A0=
=C2=A0 T1628]=C2=A0 </TASK>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703303] [=C2=A0=
=C2=A0 T1628] ---[ end trace 0000000000000000 ]---
>>>>
>>>> As the warnings do not occur in next-20250702, I looked at the commits=
 given by
>>>> $ git log --oneline next-20250702..next-20250703 drivers/gpu/drm
>>>> to search for a culprit. So I reverted the most likely candidate,
>>>> commit 582111e630f5 ("drm/gem: Acquire references on GEM handles for f=
ramebuffers"),
>>>> in next-20250703 and the warnings disappeared.
>>>> This is the hardware I used:
>>>> $ lspci
>>>> 00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne=
 Root Complex
>>>> 00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne IOMMU
>>>> 00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Du=
mmy Host Bridge
>>>> 00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP=
 Bridge
>>>> 00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Du=
mmy Host Bridge
>>>> 00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne =
PCIe GPP Bridge
>>>> 00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne =
PCIe GPP Bridge
>>>> 00:02.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne =
PCIe GPP Bridge
>>>> 00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne =
PCIe GPP Bridge
>>>> 00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Du=
mmy Host Bridge
>>>> 00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal=
 PCIe GPP Bridge to Bus
>>>> 00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller=
 (rev 51)
>>>> 00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge =
(rev 51)
>>>> 00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data F=
abric; Function 0
>>>> 00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data F=
abric; Function 1
>>>> 00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data F=
abric; Function 2
>>>> 00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data F=
abric; Function 3
>>>> 00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data F=
abric; Function 4
>>>> 00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data F=
abric; Function 5
>>>> 00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data F=
abric; Function 6
>>>> 00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data F=
abric; Function 7
>>>> 01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL =
Upstream Port of PCI Express Switch (rev c3)
>>>> 02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL =
Downstream Port of PCI Express Switch
>>>> 03:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Nav=
i 23 [Radeon RX 6600/6600 XT/6600M] (rev c3)
>>>> 03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/2=
3 HDMI/DP Audio Controller
>>>> 04:00.0 Network controller: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E 80=
MHz
>>>> 05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8=
168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 15)
>>>> 06:00.0 Non-Volatile memory controller: Kingston Technology Company, I=
nc. KC3000/FURY Renegade NVMe SSD [E18] (rev 01)
>>>> 07:00.0 Non-Volatile memory controller: Micron/Crucial Technology P1 N=
VMe PCIe SSD[Frampton] (rev 03)
>>>> 08:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/A=
TI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] (rev c5)
>>>> 08:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir Ra=
deon High Definition Audio Controller
>>>> 08:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Fami=
ly 17h (Models 10h-1fh) Platform Security Processor
>>>> 08:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Ceza=
nne USB 3.1
>>>> 08:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Ceza=
nne USB 3.1
>>>> 08:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] Audi=
o Coprocessor (rev 01)
>>>> 08:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19=
h/1ah HD Audio Controller
>>>> 08:00.7 Signal processing controller: Advanced Micro Devices, Inc. [AM=
D] Sensor Fusion Hub
>>>>
>>>>
>>>> Bert Karwatzki
>=20

