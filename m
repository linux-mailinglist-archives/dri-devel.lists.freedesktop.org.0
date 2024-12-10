Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD399EAD63
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 11:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DDE10E230;
	Tue, 10 Dec 2024 10:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Da2roYpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0F010E230;
 Tue, 10 Dec 2024 10:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkrWKM0Tg30984S7YMbKDSQUL/LkXvwUyT/QBE38aRXZRhtvOUbdyam6k5kTnOpbG39SGbWxBp0M+FcvQuPIy1nH4ZJuq6OeahzvYzH6Fu13VM8KogPvNFwuZe1K2WOCvrFcIQaTOQBKFDc3pAPygboEJ8vCzY9/ItBBc/6O9vCQmAvAbKhXUcKpRjx7X6qTNGThIIFYhlxuEcA4FRSFAk/4e0J+Y42B2l5DneNLmTzTEKvTpOU1wIGeWcjWL7HCJk/3OVcISu8RYtPHC5q2bOZ4LUiKsFOQU2eSkc+icw7aH+J6K520KlIxzA0/jnecfU6mP/9tN1P3abucroNJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEMtVO6w1P5fVKBu3wfV5KkvX1QQQczU88F7QodiOCk=;
 b=HnKa6+RXvW7PNjsR2C8Y56+oiJS04JrH/xP1UKxGEfgNaAVP5wAAtMoghbmALl41CuUhIIMWl4xWpei9/yEbX1iAlt62kCfMFIMcTcfhVj87DAuu1rQEEAgaDB5T/rXGNqR8FvBRlmQGWhDpGF9UvTl3CGoZhqT8QjpnpdKPdfIV5Rr8ci26jiF25mFoBa/3QtCguIX/GQIjPNqCsjZW33iy7tBG49M4GQM8qPsDVDyW8XneuC7hKz6q/oKJgQmd95hDVrx3RoRUuy/SvGmoPBAbI08Z8JkBdO0ZZrF0VOi/baYpknpyaeP4L/CLfusXixIm4C+dAxNmw4+v3VQfUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEMtVO6w1P5fVKBu3wfV5KkvX1QQQczU88F7QodiOCk=;
 b=Da2roYpy7yz3mm3N603ulPksqlMF0xQGG+UcJhCGIkmGJgg+gpyfQfIdR/rIkbAUTQbC3UUN8ocbcTSZSonYUXMo7bRovU+iEtzxu3XLznB+AladgT70d2oEgOvMowJTpk/6TVXpcLL6mJsCN2Ta+C2+mJfXbb2bDzlHgbJQ3rw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5841.namprd12.prod.outlook.com (2603:10b6:8:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Tue, 10 Dec
 2024 10:00:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 10:00:54 +0000
Content-Type: multipart/alternative;
 boundary="------------QBgftXVexm00VajbpqrckyjO"
Message-ID: <d2141daa-b556-4487-a310-69a7fea4eae8@amd.com>
Date: Tue, 10 Dec 2024 11:00:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, Linux MM <linux-mm@kvack.org>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
 <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
 <173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com>
X-ClientProxiedBy: FR4P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5841:EE_
X-MS-Office365-Filtering-Correlation-Id: f3169a07-3547-4f92-af34-08dd190188e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|8096899003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEpxdy9CWnR2aTRCRVRqOUpHcVhoTkFteFhkWW5DQWlnTHQzYWhiak5Ub3d2?=
 =?utf-8?B?SkdKNHhGSWJ3SVo5M0VBR2diRkNqSEhXQkhENUhpMlMrS0FSL0N3N3gxRTNZ?=
 =?utf-8?B?VDNxelJVcWlFVjVHbVVPVktESGhoNjBkdjRscWhUZmprRWZLa0ZvaWdPYjFu?=
 =?utf-8?B?ZEFSVWRudVFUeEErOFlUTGg4akYwc1RpUlBESGp1Z0hTK3N0bERLRTBRZ2dW?=
 =?utf-8?B?YjdLdUZxdVhmQmoxQVRPWU4rOUx2TU1RNFBYMVlOdFZGczlZVlFVYVRwMHU1?=
 =?utf-8?B?M3RzVG5kUTMyMk9XNGIwdXdMNlhVOVRjWkxFQVdyOGIxQXUyYXNRdG5SRklk?=
 =?utf-8?B?Wjk1Ky9Leks2RVlNbFF1eCtCT3JZS3AyZklIeDdFdDVtbHZMZHlzSllXRHJK?=
 =?utf-8?B?ZHhkcmhlMU9QY2lvT1l1eG9Wc3ZHc1MyNHM3VHFSZFl1N2hJYW9qcldGVXZ3?=
 =?utf-8?B?RHoxS0U4R1VxZnphbE9tU05CZXM1a0FNR1Y3QTlpdTUwVmNUbmc1WlB4MUFi?=
 =?utf-8?B?UmVsaVQ3ZGtTOEQ5VzFkSjJDWXI0SlNjQXVQbVB6ZDFJWVBDQU9VaTQ3bmF2?=
 =?utf-8?B?R3ZHM3VlSzF5OCszVUI3VVEydlZhSXNrb283MFk2Z1drZFprU2VOTW9kSlZi?=
 =?utf-8?B?bEI2am9uaUpIV2QyaEFtK0JuZ3VUMDQ2MS9ZOTJVandnRlZnQXJGU296Nm1m?=
 =?utf-8?B?eU1yUzRYeW1WOHpJWGNKVW5NL3BIRGRFNEEyVHBUQWVkS0E0dGhMZy9VanNZ?=
 =?utf-8?B?dGw0YmNDNWg4MXdBWEE0WjlpanFJUjZaNUxoRFF0V1c3ZW1Nc3pJK28rWUIw?=
 =?utf-8?B?VGZ2SktPblRFS3paYTBYajBtTXRHQ2tWc21hdkMwRWJad2FYcHFrKzVUM1U5?=
 =?utf-8?B?Q1RRTmFrcURhVXhjSlZNdnprcVZhM3NTR081Vnk4d0ZoUW9nVTI3eWg5L2dn?=
 =?utf-8?B?T0loNjdrdjQ0c3RQVTVLWUs4NDBITkM3Tk9HYSsweXBYNWdQN3V3bkJBVmh5?=
 =?utf-8?B?VGRFMjRCMFZpSksxa3ZyVnQxS1ZKcUppSFc4KzdXTlIwYjl2UHkwYWdUUFNt?=
 =?utf-8?B?WU9WZk9rV1c5YWxnaC9Vekc3TkFKT0duUnljdGxiOS8xUjdvMFJHN1dIR1g4?=
 =?utf-8?B?NmpPanlkVFJ0bGZkeFBneTZwbDJhTDBFcSs2V0JYWit2YnArMGltU01WR0xS?=
 =?utf-8?B?S011VEVNU09pZ2JjODlPZ2dDcXBHOUx4ZHQ5S2xadk5SZmx2YXdZL1pITWEv?=
 =?utf-8?B?TW9Rak9qR3R4NjdVRklQNjJrNTA4NndPck9pRXdQN1l5U0FBUmZPdldyZ0Fh?=
 =?utf-8?B?TEZEQVBrMmVPS1FsVFFJU0xHdkZLTVo0MzV3UjJCMGhFcWJrOXVCOWgvTURl?=
 =?utf-8?B?Sk1hV3JaYUlsamRrclV0MVJ0Tm1Fay9hclZKT1Zoa3Nua0YyZEhsZFplSXBZ?=
 =?utf-8?B?MmtVUDlyTS9yTHV4Nk13S1BvR2FUMW9mcGpkdEc2WDZiZTd0SldHQmRsQ0lZ?=
 =?utf-8?B?bGZiNE1ueEFiZ1BIeVZOQ0RoSlFkS2srV1RqaVVuSFlpKzBvekVLUFVrMms2?=
 =?utf-8?B?UUkwODhZMTNNeUpGanpXTEwxL2IraWdPQnNFcDAwV3hhQ2FkcnNKY2phb3Fn?=
 =?utf-8?B?bkRNL2g1Nmt5dXJ0WUNIVjM3RWJ5L1VVWWlGaWJsMlJuK0ppNE9ZS0w4WHVB?=
 =?utf-8?B?SWRQd3NvT2p3TVRvYVk4amFkUXdmWGJjKzNqK1REeTA0d2NUNWlFWDZyZjJ5?=
 =?utf-8?B?TUQ2em5YbDJwTUMvL09pU1gyOWZaQ3Y5MzVSNFFOSUc3NUlxZzYwNnJTYjNp?=
 =?utf-8?B?c0M1Qk9oaVl0eTM5RGxqbUpNclgxbFZpZWxKd3BQT0swelhwWkJyUytlYWx5?=
 =?utf-8?B?MDEvbUtZQXRLUW5MdFNDVUVIbS9xUmw5T05WdGd3VDRLMnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(8096899003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWJ6eUZxZ0gzejMzUDdRdU8vZlRSUUZzZ2ZKOVFnSkRPRFVzWUI0NlVkVEtY?=
 =?utf-8?B?akxFR2tBZ3lQTWVHWmo2aEJDR29Nbi9iWkg4VzdYb0Q4MnJMU01hYk8vSWhT?=
 =?utf-8?B?S2NlZTFYNGlZOGUySlp0dGczcVZLd2d3WVJCZUZRRXBKRTFDa296cWZMZWQx?=
 =?utf-8?B?cWEvZS9kOExTMXlzQnF3T1ROQ3k5MmNwaVFaOFA3dkUwdXRnb0E3b0FsSS8x?=
 =?utf-8?B?MHBFdlR2QS94bEs5RkZsQnVTT0NRTE15N0lIWlNJZGZjWW81TzhLSUdFSllj?=
 =?utf-8?B?bnJnYytkdk14Sm40cWdjdGtqajI1UVhJYXFXbEt1WkxaNFllM1hRUTBMV2JU?=
 =?utf-8?B?UkNuU2xvdmV5TjBHL2tySnZ3MXFKUTM0RnNEUC9rR0djdWR2UWJiVml6WUxs?=
 =?utf-8?B?QmlHRWRWT3Yra3VYcG1JWUdNdi94bFJPN1FjNTVLRWNCeGYwYytiMVY5VFlP?=
 =?utf-8?B?clhNNGxGTm11L2dqd251TTlHOHQra210OXNnY1Q4QnFPN1Z6QW1rK1lEakpS?=
 =?utf-8?B?elMrdkZGN285NjJ5NjZCQk9xRkFRZjAvaEdmRmFmMTloL3hrM2cyRUJVRzdu?=
 =?utf-8?B?M2drM1FZeUlBUmFPbytJeUN0Wm1vbzJIN2VRd2dmemNCUTBGaDl1R0doNDd0?=
 =?utf-8?B?ajl6c1R1aHRyejZ6M0UyOGp2M0tTYktZc2llcmxJdGZSK05FWmdRaVlVQlVx?=
 =?utf-8?B?bWVrRzZyNVR5NkZoRDlaU3BURUZPQ3JtOVV2MFYrSTJVdXV2YUtWWGpGK3J1?=
 =?utf-8?B?UU1Ud1J4YWpvT0lLWWt1YTUrRWM4RStydmlIOTFoSnRqRytaOW9UcUZxRDVq?=
 =?utf-8?B?bndzN3p1U1o5NCttMTNhUWF5UUFaeDlNQTl6TklTWGRLWFgvNzNzZzNJN013?=
 =?utf-8?B?TEhEZkVXM1U1THJabzZYeGxTdk80NzhRbmx2L0wxRWpCUWhtVDFFODAyWGtV?=
 =?utf-8?B?Z2pXR1RrMUFCZFVLVkdGRnpYM1lHV2xuTFNPSVhnb1ZkSllOZmpna2VscUdY?=
 =?utf-8?B?bGxwOTc3ejdueEh3RUd4dXJyWHFLWWdlaVRES2xHb2htMTcrb2JUYk84SUU5?=
 =?utf-8?B?cGdoSUlWY0NXY01VZ1ZKemJrbDZnVGhBTWg2aUdBa2VINFNMcHdtRDdEZ0xi?=
 =?utf-8?B?NGkxaDlhdWd0RmF2U0svYWwwclVKUHhOcU1aRFVXMnV2cnNPNU1sZFhJWFd6?=
 =?utf-8?B?THZ3U0c1dGMvZDFSZmg5clBtNHh5eTdieEljUk15bDdOLzBiL3VjUVVnKy9U?=
 =?utf-8?B?Nml2YVlyaThLRVc5ZnR5MVJSY3I3d3o4MXptTElJd2l5bnZEclRkSmdnUDBx?=
 =?utf-8?B?Y2l1bmRBZ0pSbXRhWGFaN2trbmxROHZOV1Q3cUZFK2NMQXI3RXNHOWdBTEh4?=
 =?utf-8?B?L0c0Vy9pSC9XQmR3S1NLMHJWSERhcHpCZW02VUpJVTV3cTJqNEU0V05NT2hr?=
 =?utf-8?B?SklMZVEySzZUUE9iN2tIYm4zZGFSZTJvM3AyK1QvNVhUcHNRL3g5ekZ4Qmwr?=
 =?utf-8?B?MXp1dGFQckRFNHcxNXAvWC9xcThsVDlOSUo0bkcxUHpVWVRacnhLZWFseUk4?=
 =?utf-8?B?RHYvUkF3UDVxUXIyYkJySXhhYWJaeGs2YUs0M3IyNHNKeG5FbXQzRWl6dnF2?=
 =?utf-8?B?cDV3UDExdFpnWS9tNGIyaFJmSnlGam40SkVGdGQ1TlVTb0xFVnJFTnFhTElY?=
 =?utf-8?B?NE9DRGJUa2FES2NxRmZhcUFsNVlxUk9VUkkySGlhM1JMTGhid1NnQlhaOWVh?=
 =?utf-8?B?WmI5SHlWanFtNzJ0MFFpY1RXKysxaHhtU01mZVNmWmNFazVqTXBLcFEvekhw?=
 =?utf-8?B?UEtkYWdSWnU2bE0zQ0FMdjJNYUpGNWpyL2s5a1RrbWt5RmJoMlJKbnFTVkky?=
 =?utf-8?B?S3V2ZGowWGRyWXR5ZUFHT0QvREtndWhWNEJIbGQ3cGRhRmN3WTV0cDhvd1hF?=
 =?utf-8?B?ZHVxMGlHSWUwbjJDOHZUS1YrdG1aNXIxMUVneDduZUFqSFplVGJwWUJtYVdt?=
 =?utf-8?B?dWFlR1psOHlpaDhDN29LUGh4VXpvVDIrNDRndzFjRXhIOVdwNm9tRFgwOXFn?=
 =?utf-8?B?UmdpM1dmTUo5dE9FRnJUT2VWOU9ncDZxMm1IcVZvTndKT1I4dTVwNUZmQ2xp?=
 =?utf-8?Q?yEOoJvRSETcj0jq+8hZPrVrNc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3169a07-3547-4f92-af34-08dd190188e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 10:00:53.9816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: na+3mNL3oiP2wrRxue8ItcosqKIQ92LXX3c0XWMsdUnOh/KCSx58OaeBhYPIIU/N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5841
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

--------------QBgftXVexm00VajbpqrckyjO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 10.12.24 um 10:33 schrieb Joonas Lahtinen:
> Quoting Christian König (2024-12-09 17:42:32)
>> Am 09.12.24 um 16:31 schrieb Simona Vetter:
>>> On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian König wrote:
>>>> Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
>>>>> From: Andrzej Hajda<andrzej.hajda@intel.com>
>>>>>
>>>>> Debugger needs to read/write program's vmas including userptr_vma.
>>>>> Since hmm_range_fault is used to pin userptr vmas, it is possible
>>>>> to map those vmas from debugger context.
>>>> Oh, this implementation is extremely questionable as well. Adding the LKML
>>>> and the MM list as well.
>>>>
>>>> First of all hmm_range_fault() does *not* pin anything!
>>>>
>>>> In other words you don't have a page reference when the function returns,
>>>> but rather just a sequence number you can check for modifications.
>>> I think it's all there, holds the invalidation lock during the critical
>>> access/section, drops it when reacquiring pages, retries until it works.
>>>
>>> I think the issue is more that everyone hand-rolls userptr.
>> Well that is part of the issue.
>>
>> The general problem here is that the eudebug interface tries to simulate
>> the memory accesses as they would have happened by the hardware.
> Could you elaborate, what is that a problem in that, exactly?
>
> It's pretty much the equivalent of ptrace() poke/peek but for GPU memory.

Exactly that here. You try to debug the GPU without taking control of 
the CPU process.

This means that you have to re-implement all debug functionalities which 
where previously invested for the CPU process for the GPU once more.

And that in turn creates a massive attack surface for security related 
problems, especially when you start messing with things like userptrs 
which have a very low level interaction with core memory management.

> And it is exactly the kind of interface that makes sense for debugger as
> GPU memory != CPU memory, and they don't need to align at all.

And that is what I strongly disagree on. When you debug the GPU it is 
mandatory to gain control of the CPU process as well.

The CPU process is basically the overseer of the GPU activity, so it 
should know everything about the GPU operation, for example what a 
mapping actually means.

The kernel driver and the hardware only have the information necessary 
to execute the work prepared by the CPU process. So the information 
available is limited to begin with.

>> What the debugger should probably do is to cleanly attach to the
>> application, get the information which CPU address is mapped to which
>> GPU address and then use the standard ptrace interfaces.
> I don't quite agree here -- at all. "Which CPU address is mapped to
> which GPU address" makes no sense when the GPU address space and CPU
> address space is completely controlled by the userspace driver/application.

Yeah, that's the reason why you should ask the userspace 
driver/application for the necessary information and not go over the 
kernel to debug things.

> Please try to consider things outside of the ROCm architecture.

Well I consider a good part of the ROCm architecture rather broken 
exactly because we haven't pushed back hard enough on bad ideas.

> Something like a register scratch region or EU instructions should not
> even be mapped to CPU address space as CPU has no business accessing it
> during normal operation. And backing of such region will vary per
> context/LRC on the same virtual address per EU thread.
>
> You seem to be suggesting to rewrite even our userspace driver to behave
> the same way as ROCm driver does just so that we could implement debug memory
> accesses via ptrace() to the CPU address space.

Oh, well certainly not. That ROCm has an 1 to 1 mapping between CPU and 
GPU is one thing I've pushed back massively on and has now proven to be 
problematic.

> That seems bit of a radical suggestion, especially given the drawbacks
> pointed out in your suggested design.
>
>> The whole interface re-invents a lot of functionality which is already
>> there
> I'm not really sure I would call adding a single interface for memory
> reading and writing to be "re-inventing a lot of functionality".
>
> All the functionality behind this interface will be needed by GPU core
> dumping, anyway. Just like for the other patch series.

As far as I can see exactly that's an absolutely no-go. Device core 
dumping should *never ever* touch memory imported by userptrs.

That's what process core dumping is good for.

>> just because you don't like the idea to attach to the debugged
>> application in userspace.
> A few points that have been brought up as drawback to the
> GPU debug through ptrace(), but to recap a few relevant ones for this
> discussion:
>
> - You can only really support GDB stop-all mode or at least have to
>    stop all the CPU threads while you control the GPU threads to
>    avoid interference. Elaborated on this on the other threads more.
> - Controlling the GPU threads will always interfere with CPU threads.
>    Doesn't seem feasible to single-step an EU thread while CPU threads
>    continue to run freely?

I would say no.

> - You are very much restricted by the CPU VA ~ GPU VA alignment
>    requirement, which is not true for OpenGL or Vulkan etc. Seems
>    like one of the reasons why ROCm debugging is not easily extendable
>    outside compute?

Well as long as you can't take debugged threads from the hardware you 
can pretty much forget any OpenGL or Vulkan debugging with this 
interface since it violates the dma_fence restrictions in the kernel.

> - You have to expose extra memory to CPU process just for GPU
>    debugger access and keep track of GPU VA for each. Makes the GPU more
>    prone to OOB writes from CPU. Exactly what not mapping the memory
>    to CPU tried to protect the GPU from to begin with.
>
>> As far as I can see this whole idea is extremely questionable. This
>> looks like re-inventing the wheel in a different color.
> I see it like reinventing a round wheel compared to octagonal wheel.
>
> Could you elaborate with facts much more on your position why the ROCm
> debugger design is an absolute must for others to adopt?

Well I'm trying to prevent some of the mistakes we did with the ROCm design.

And trying to re-invent well proven kernel interfaces is one of the big 
mistakes made in the ROCm design.

If you really want to expose an interface to userspace which walks the 
process page table, installs an MMU notifier, kmaps the resulting page 
and then memcpy to/from it then you absolutely *must* run that by guys 
like Christoph Hellwig, Andrew and even Linus.

I'm pretty sure that those guys will note that a device driver should 
absolutely not mess with such stuff.

Regards,
Christian.

> Otherwise it just looks like you are trying to prevent others from
> implementing a more flexible debugging interface through vague comments about
> "questionable design" without going into details. Not listing much concrete
> benefits nor addressing the very concretely expressed drawbacks of your
> suggested design, makes it seem like a very biased non-technical discussion.
>
> So while review interest and any comments are very much appreciated, please
> also work on providing bit more reasoning and facts instead of just claiming
> things. That'll help make the discussion much more fruitful.
>
> Regards, Joonas

--------------QBgftXVexm00VajbpqrckyjO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 10.12.24 um 10:33 schrieb Joonas Lahtinen:<br>
    <blockquote type="cite" cite="mid:173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Quoting Christian König (2024-12-09 17:42:32)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 09.12.24 um 16:31 schrieb Simona Vetter:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian König wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">From: Andrzej Hajda <a class="moz-txt-link-rfc2396E" href="mailto:andrzej.hajda@intel.com">&lt;andrzej.hajda@intel.com&gt;</a>

Debugger needs to read/write program's vmas including userptr_vma.
Since hmm_range_fault is used to pin userptr vmas, it is possible
to map those vmas from debugger context.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Oh, this implementation is extremely questionable as well. Adding the LKML
and the MM list as well.

First of all hmm_range_fault() does *not* pin anything!

In other words you don't have a page reference when the function returns,
but rather just a sequence number you can check for modifications.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I think it's all there, holds the invalidation lock during the critical
access/section, drops it when reacquiring pages, retries until it works.

I think the issue is more that everyone hand-rolls userptr.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well that is part of the issue.

The general problem here is that the eudebug interface tries to simulate 
the memory accesses as they would have happened by the hardware.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Could you elaborate, what is that a problem in that, exactly?

It's pretty much the equivalent of ptrace() poke/peek but for GPU memory.</pre>
    </blockquote>
    <br>
    Exactly that here. You try to debug the GPU without taking control
    of the CPU process.<br>
    <br>
    This means that you have to re-implement all debug functionalities
    which where previously invested for the CPU process for the GPU once
    more.<br>
    <br>
    And that in turn creates a massive attack surface for security
    related problems, especially when you start messing with things like
    userptrs which have a very low level interaction with core memory
    management.<br>
    <br>
    <blockquote type="cite" cite="mid:173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">And it is exactly the kind of interface that makes sense for debugger as
GPU memory != CPU memory, and they don't need to align at all.</pre>
    </blockquote>
    <br>
    And that is what I strongly disagree on. When you debug the GPU it
    is mandatory to gain control of the CPU process as well.<br>
    <br>
    The CPU process is basically the overseer of the GPU activity, so it
    should know everything about the GPU operation, for example what a
    mapping actually means.<br>
    <br>
    The kernel driver and the hardware only have the information
    necessary to execute the work prepared by the CPU process. So the
    information available is limited to begin with.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">What the debugger should probably do is to cleanly attach to the 
application, get the information which CPU address is mapped to which 
GPU address and then use the standard ptrace interfaces.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't quite agree here -- at all. &quot;Which CPU address is mapped to
which GPU address&quot; makes no sense when the GPU address space and CPU
address space is completely controlled by the userspace driver/application.</pre>
    </blockquote>
    <br>
    Yeah, that's the reason why you should ask the userspace
    driver/application for the necessary information and not go over the
    kernel to debug things.<br>
    <br>
    <blockquote type="cite" cite="mid:173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Please try to consider things outside of the ROCm architecture.</pre>
    </blockquote>
    <br>
    Well I consider a good part of the ROCm architecture rather broken
    exactly because we haven't pushed back hard enough on bad ideas.<br>
    <br>
    <blockquote type="cite" cite="mid:173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Something like a register scratch region or EU instructions should not
even be mapped to CPU address space as CPU has no business accessing it
during normal operation. And backing of such region will vary per
context/LRC on the same virtual address per EU thread.

You seem to be suggesting to rewrite even our userspace driver to behave
the same way as ROCm driver does just so that we could implement debug memory
accesses via ptrace() to the CPU address space.</pre>
    </blockquote>
    <br>
    Oh, well certainly not. That ROCm has an 1 to 1 mapping between CPU
    and GPU is one thing I've pushed back massively on and has now
    proven to be problematic.<br>
    <br>
    <blockquote type="cite" cite="mid:173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">That seems bit of a radical suggestion, especially given the drawbacks
pointed out in your suggested design.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The whole interface re-invents a lot of functionality which is already 
there 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not really sure I would call adding a single interface for memory
reading and writing to be &quot;re-inventing a lot of functionality&quot;.

All the functionality behind this interface will be needed by GPU core
dumping, anyway. Just like for the other patch series.</pre>
    </blockquote>
    <br>
    As far as I can see exactly that's an absolutely no-go. Device core
    dumping should *never ever* touch memory imported by userptrs.<br>
    <br>
    That's what process core dumping is good for.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">just because you don't like the idea to attach to the debugged 
application in userspace.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
A few points that have been brought up as drawback to the
GPU debug through ptrace(), but to recap a few relevant ones for this
discussion:

- You can only really support GDB stop-all mode or at least have to
  stop all the CPU threads while you control the GPU threads to
  avoid interference. Elaborated on this on the other threads more.
- Controlling the GPU threads will always interfere with CPU threads.
  Doesn't seem feasible to single-step an EU thread while CPU threads
  continue to run freely?</pre>
    </blockquote>
    <br>
    I would say no.<br>
    <br>
    <blockquote type="cite" cite="mid:173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">- You are very much restricted by the CPU VA ~ GPU VA alignment
  requirement, which is not true for OpenGL or Vulkan etc. Seems
  like one of the reasons why ROCm debugging is not easily extendable
  outside compute?</pre>
    </blockquote>
    <br>
    Well as long as you can't take debugged threads from the hardware
    you can pretty much forget any OpenGL or Vulkan debugging with this
    interface since it violates the dma_fence restrictions in the
    kernel.<br>
    <br>
    <blockquote type="cite" cite="mid:173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">- You have to expose extra memory to CPU process just for GPU
  debugger access and keep track of GPU VA for each. Makes the GPU more
  prone to OOB writes from CPU. Exactly what not mapping the memory
  to CPU tried to protect the GPU from to begin with.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">As far as I can see this whole idea is extremely questionable. This 
looks like re-inventing the wheel in a different color.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I see it like reinventing a round wheel compared to octagonal wheel.

Could you elaborate with facts much more on your position why the ROCm
debugger design is an absolute must for others to adopt?</pre>
    </blockquote>
    <br>
    Well I'm trying to prevent some of the mistakes we did with the ROCm
    design.<br>
    <br>
    And trying to re-invent well proven kernel interfaces is one of the
    big mistakes made in the ROCm design.<br>
    <br>
    If you really want to expose an interface to userspace which walks
    the process page table, installs an MMU notifier, kmaps the
    resulting page and then memcpy to/from it then you absolutely *must*
    run that by guys like Christoph Hellwig, Andrew and even Linus.<br>
    <br>
    I'm pretty sure that those guys will note that a device driver
    should absolutely not mess with such stuff.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">
Otherwise it just looks like you are trying to prevent others from
implementing a more flexible debugging interface through vague comments about
&quot;questionable design&quot; without going into details. Not listing much concrete
benefits nor addressing the very concretely expressed drawbacks of your
suggested design, makes it seem like a very biased non-technical discussion.

So while review interest and any comments are very much appreciated, please
also work on providing bit more reasoning and facts instead of just claiming
things. That'll help make the discussion much more fruitful.

Regards, Joonas
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------QBgftXVexm00VajbpqrckyjO--
