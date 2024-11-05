Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19069BC719
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 08:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419FA10E28F;
	Tue,  5 Nov 2024 07:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VLtjAOTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C9910E28F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 07:32:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4YuX/g+DwpLVW1hO7DcADmHkCYZavUDRYRIOyg/1TNcvGazXCOLJcYtZxgXROurYlOnSBBEa1WXAAzF8FN/eOQh/DvefQzstZww/HzHt1i4TxoODic9iR0cjd136pgBdoCbNX2AuKTLAnUwSCJbjcTWcdCq75USv8IY77IqG7LVnLnMZE9dmxhFWSVTcNKI5S/7Zvvjls6D+H76SvbGaHOdEG49r9PtN5mjMSUQopVXRua8yM5+Z0A1+Z7GmEYBOtkwQLLO/djXRXTh1c7FhMWfM4NsS4J8YPtMsKh/O39UCRxsO4bJ8zR/49+O35MgXM45jokBNeByR/OrJIOo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJmVvOwkvVO5+gvcWeL3A6Z0ztFJyITJbRJjH8OBUVw=;
 b=f46SpF8N/yBVJGO4RupxB2tc2z21pRrkFgCddWeApjEJVbeV5EvQpuXAnd4tWJW0ZDA1vZdqC01mOoiEP98mr4zBZ4fzKZzERNggN9lO5mUv5DVq2Iieedzwr6tb4JsGfpuloP6pxNUIZDteFkH4ldhK/T/yMTlaK/IMDSG4HlOK2PMlE//7q2BsQhRJlC1Ov2/3Xv5TTAuS9hjhMg6j/pAFJfxiCVYcjQ5ER6BzkPLtDjcgrSeOhlWkZUQPczA3C68GRyowCVzj/x1fWEnIi+288cQKusMUYwYBuCigfoYsVvNBlm+2/zP0bpb+lgUiCbCFTB5YLPqGwKKBGxUJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJmVvOwkvVO5+gvcWeL3A6Z0ztFJyITJbRJjH8OBUVw=;
 b=VLtjAOTB2Vn5dV15h1llSHi7BD8uf3Y5bXgntFgo96cU6uix9K8rTWXKLn/QIifGYTkILuI1RnvbA+3umgaeBcROBvYbqOyMSBdTi7FvoC5SHxQX1u6iX9tDnqKsLnUIe12Q6AdCV9fV9JOaRNLxHqTomJ2RwrxoWKXJ9EOCTow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6814.namprd12.prod.outlook.com (2603:10b6:806:266::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 07:32:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 07:32:26 +0000
Content-Type: multipart/alternative;
 boundary="------------lXHe1ecFNCLrywzQNJljPjPz"
Message-ID: <301110a2-c004-4385-9231-b9354904b5e0@amd.com>
Date: Tue, 5 Nov 2024 08:32:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/syncobj: ensure progress for syncobj queries
To: Chia-I Wu <olvaffe@gmail.com>
Cc: boris.brezillon@collabora.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Chunming Zhou <david1.zhou@amd.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 faith.ekstrand@collabora.com, simona@ffwll.ch
References: <20241022161825.228278-1-olvaffe@gmail.com>
 <900f8658-726c-4034-90ff-398e6c57ec47@amd.com>
 <CAPaKu7QwSq7a-ipSOdETFEBGMu4J4ud1SqxDfPp8bNMjCMM5RQ@mail.gmail.com>
 <CAPaKu7TB30wvDvMW2FcYNcxjfDkOje358JNnRr2jJf=99-h-rg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPaKu7TB30wvDvMW2FcYNcxjfDkOje358JNnRr2jJf=99-h-rg@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af48de7-b47c-46ec-6323-08dcfd6bff5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHd4MWFOenhGWHdSMDg4dEVrOVp6akFMZFc3ODR2NjllZm45WjFDeng2akVS?=
 =?utf-8?B?MjRDbXE0V250czI4NUF6N3dMQ2djVWRpT3puaXJKWHpsSnJURDVHeCsxVkkx?=
 =?utf-8?B?LytXaUt1aHRjOXZ0MUZ3YXJUVHErMFY1alZHWHlITjd1UkhJTlRnTm1PeHZU?=
 =?utf-8?B?Nlh1cGZaZGNsemwzMm1ITEJRU0RWc1R6b1dUV1BCdm5YSU1TdjVKWm1TeVZ1?=
 =?utf-8?B?WFZzZzFmUG8vOU51T3N2YkJLZThpOG9yN3Bad3d6Sk9TS0hJQ1pBWnhLVW5r?=
 =?utf-8?B?RUZrQ1NheVlOMHBiOFNvMmxTUE04alhWa0w3WDRPQ0JXelEzV21WTkJ5aFAw?=
 =?utf-8?B?cklFcUVSV3lRd0p0SEVZR3lpQk83QnRhWHlRdHRCZmlnY3lPL0F4aDFEa21P?=
 =?utf-8?B?TkRDY2w2T01HZkhHRjlVTmt1L2N3UmlEcVd4c2tQNVNJY2dQVTRoSDNFVFRM?=
 =?utf-8?B?S0xCeDY3dlMwdkszY2R6QUhVbWl6WExyQU5aVytTNHVMaW5ZZ3RIN1FlZ0pa?=
 =?utf-8?B?citUc0tmYkQrME1vMWZWaW9BcS9uV2taYWFTSDVtSVhQQlloOHptdWVqVmM5?=
 =?utf-8?B?TDhpeStWMEZWUG5TOTcyT2UvQVN5WmpVYjE5VEpnMXU0WHI4QUl2UUVIYm0z?=
 =?utf-8?B?MGVkeXVyQjNOQld1MEJYWFI1aWs5ck1jUSt6SENQSUpiRGRQYzFTYkkyRkpo?=
 =?utf-8?B?TmFldGU4M0ZTZ2ZZbE45Y1F5Rkd5a1N4dERIOGpRd2l4WlFGQ3UySGw1UjB5?=
 =?utf-8?B?ZHVVMzhCaUtOWi9YeVliYjJjYzFMdlV5UFhBcWhjOTJ5aDllVVVIcHMvVDky?=
 =?utf-8?B?RkFCZDNpaDN2NVRMWHptUkJrTXV5TExiMmNZR0ptKzFJbmxPZ2ozSEtVUnFF?=
 =?utf-8?B?YXQySHZmMTNRUHVGak5TRDlJa0ZLTWk4Y0lPaDZTa29aOENOdEhvazEyclpV?=
 =?utf-8?B?anVIMklYZlZlZ2M0YVRReE4rdTYvY2x1NU9TNXdoQU9xbHRReDVkdkw1Unpa?=
 =?utf-8?B?MS9uM1A1WG9CNmtQUitOWVNJRG9WbVFSQW05R1RQNTc0VmY0UHJvUmhJQktY?=
 =?utf-8?B?TGpVZzR4M3JQM09FUGVqendVc01CMTU3MjF1SFVoWS9BYk15VVRSbTRrUGxT?=
 =?utf-8?B?WnRidGU4VmFIRm5CdWJ0Vys1dWFadHVMaVgwWWV4ZXBob21Pdm5nUUxPaDNL?=
 =?utf-8?B?Tkl2a1N4YUNsbWtTRWVuSzE3Wk5DN1BLYUUxeGNCMVZPVXBIZG1rZmVpbUc3?=
 =?utf-8?B?b2pyWUJZaTBtRHR1MW1LNmgrYlNEVmxOcHVvUzlVaHlhN0EvcjZFMmNVdGRD?=
 =?utf-8?B?MTZpclRzZXJ4bWtYSThCMlZ2WVE2TFhDMXRaajJJdm9VNCt1aFdXOTByZ1h3?=
 =?utf-8?B?UmRqcnZNNkNwbUc5V0RuK096Qjd1Y0htdUx4RStSdjdoVGRoaUxwc3Uvejdj?=
 =?utf-8?B?cjFybkRWc3BBc3R2RHFCa1E5U1RjK3RuYmU3RTY4b2UvV25YZytNM25kU1p6?=
 =?utf-8?B?TGtra0k2SFY4VXRtM29yWVhIaGJVRkpWT2hJLzlDRDZCczFycGhBL3pnMWZm?=
 =?utf-8?B?Vjc2QUVRU0k5TzhvUlZVZU5yUDIvalhpNEhubWFMeHBIM0VHVnpOWHpGQnl2?=
 =?utf-8?B?Mnk5VW14QVFPN0dxdXdDOVZtNFJYNFVJSmE5TCtVZkREdDJlL0pJMXE0TVBK?=
 =?utf-8?Q?GeV02j+82YbR478GKyzN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUV1c0RIMzNici8zMU1TU1pHQ29ENkNUWk1SNWtQZzN2VlVpUXI5L2ZwbE5J?=
 =?utf-8?B?ODVQWUVBbWpUbkZDKzB4SkE4L0ZLSzY3UzhjSXg1ODlIWnVweE51aUNVY1Z5?=
 =?utf-8?B?NlRmanFxNEZxWlNpSXNkVUloRFRubHlHN0dwWjJLVjMvOVlEelhIdXRaRzdW?=
 =?utf-8?B?U1QvM1lybXA3Z2FvQS9YT29HSHptc2JXbGFZNHBmNU00ZUh6bFhsUFpnaEN6?=
 =?utf-8?B?MnhOMi9qVnBBN09yTEJzMkNPQUVRbVFWUlUzQ25BNSs4RlRNazgrVFhzRFlN?=
 =?utf-8?B?VEp5UHVCbWlrV04rT2V0Nno5WTRkdGM3bHBvQk1EaGh2UWcxMTU0U3N2ZWZ3?=
 =?utf-8?B?Y2JVMFl0Zm5KQ1JIRGVtb1FiWmxJa2hsaXFlcU1MT1l4NUNEV1UzUkVRYjNY?=
 =?utf-8?B?WnF4emkwZDZZNnNuS0hZS2MyTk50alJlQTZOUGxKemZuOWhQYUJ4MlNtUDJD?=
 =?utf-8?B?Y0Z6VUErbjFvL1FVT2NKczk4UHFxVGo1ZGJvNndROExUTzBhZ093RklwaHhx?=
 =?utf-8?B?T0ZYUnlTMzJqSDdrUy92YzJycHZNS2YrV0djNFlLZGg1YXNieU5oZ2dXa2d3?=
 =?utf-8?B?RXlhcUwreExqNkZDZWU4UlRMRC9tTml6ajdOdWt4bkFsa3FURklpTGFmeDB1?=
 =?utf-8?B?NHhVVVpZTjhjQ095ajRSR0NlMG5EcDNsM09jdGpzNVhSajBzQ085MDc5WFBp?=
 =?utf-8?B?REI4QUtCK0RyandjWmF6aExRR0pDSDJIdDZ6N3F2SXdQMGwxWnF3VHFyV1JO?=
 =?utf-8?B?TXZNYmZhRXczWWJiSkxGOWk3TnF2VEYzSW5yMDB1MGs2VFNjamNwVHAzKzNL?=
 =?utf-8?B?RmZJelY1bG82N0U2OFZBOUdHeUdkTzVmdWo1cjR1RURxVEUvOXdiTDA0dzVo?=
 =?utf-8?B?azhVWVh2OFFzMGlrWnNMa2p2cjlUSmY1YjlsL2tFanZlV2lycEZSSEN3ZjBm?=
 =?utf-8?B?VFZiL0JmSFBESHBmN3JNUnNXaGZURnczMzN1TXZxWjh3QzdiK01xeEhPTzFZ?=
 =?utf-8?B?ZzFQV1BLWUh5ViszODl5enY0c2pRYkpDOWczOHI3UTB2SjN4MU90MnUxVThv?=
 =?utf-8?B?OEVTeXluMzhSRlAxN3RJN2E3UEhYaFRHS0VIZHpLRUV4NlV0amRQdUZvc3pU?=
 =?utf-8?B?bGhHaGNyV0dNT1V5VklJSWV4SFZYQ2craCtFUjVZRjBTOTJ5S05IRlFMV01F?=
 =?utf-8?B?ZFRFNm5vK0YrSVdUQkxJdkp1NExqWUNYMFpNRWgwdUQyQkxmRnRiTm9hMERZ?=
 =?utf-8?B?WkF2MlBDaytEellNVGgrQUVPb0RhYVVhaDVZMW1wb3FlY1J2a1lBTXljbWs5?=
 =?utf-8?B?akJFekNLTU5kTkMwZEZwckQwUjN2TEpsMVZyZWIzalY4RnhjN0xpUjdZRjQv?=
 =?utf-8?B?RGM1OXh4ejl4QmFhRjhGMzNjMEJ6L2VZd1dMOHRXbS95YWZNbnM0Y1lDYkpn?=
 =?utf-8?B?WFFOcmY1blVHTGx0d1RiUFRGd3ZtN2R5VGpYMlJzM1RzZ1I4b25KRDlseFNP?=
 =?utf-8?B?Q011Y0JGVHFpQXJjZW01Ryt5QmtveDRqTHNqTnhlNWdpaStIbGpyZm92NGI3?=
 =?utf-8?B?YmFCN055cm11dGdYWmpmODNRejN6OWpOWjlhYythWDNyUStHWVBRdDFGcGNK?=
 =?utf-8?B?bFluTXpJTURRa0ZjaitoWnhkbkQ4Sitpbnh5U29JemlBaHFJeGVTZzZJR1Ns?=
 =?utf-8?B?QXU4Vnczakx4c2traUxDMVdQVkZZcHdGNk1ibEhLVDkzK0dSK1dFaWJ6NlBQ?=
 =?utf-8?B?VjU4M2ttaUkrVlhYa3c5VEd0ZVMxbUM1YzFPc1hueWFBVHJXRjNNK1gya0ov?=
 =?utf-8?B?dkc1OEpQRXhTWnlUM2VlTW1Za3FlUWpvL3pkRDlBNStlOVJPdHdOR0pQemZt?=
 =?utf-8?B?eE5qdTFDODBaMzhLSUVXWWY3alFqUWZzMk1GSERXSEVBT0RpUnNBMDBTcHR5?=
 =?utf-8?B?WjhNV0xycDU4dk9ZMmhHVno5R3VSMTcyZUZ3bTFYN1Nua1NlekZVWGtkOWw1?=
 =?utf-8?B?bWJMOHhtWSsvUjNUU2RFQ3loVUtNQks4NmlzbDhoWm5IR0FzcEZMMXA4eTdu?=
 =?utf-8?B?SGgwQlBMNEVUVlJFaFMvOENTWjM1MzI3eVlPL2Nra3hIaVRsWXNWYy8wQmYw?=
 =?utf-8?Q?v/VeFvpovpRhjgV6gHNsboOpt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af48de7-b47c-46ec-6323-08dcfd6bff5a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 07:32:26.8304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RANYRsBUlhnOC7tLMunsWlAmcO5yoUmqs5U9smkWxomC15Mfmw4cx+RYkATnK07A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6814
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

--------------lXHe1ecFNCLrywzQNJljPjPz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 04.11.24 um 22:32 schrieb Chia-I Wu:
> On Tue, Oct 22, 2024 at 10:24 AM Chia-I Wu<olvaffe@gmail.com>  wrote:
>> On Tue, Oct 22, 2024 at 9:53 AM Christian König
>> <christian.koenig@amd.com>  wrote:
>>> Am 22.10.24 um 18:18 schrieb Chia-I Wu:
>>>> Userspace might poll a syncobj with the query ioctl.  Call
>>>> dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
>>>> true in finite time.
>>> Wait a second, just querying the fence status is absolutely not
>>> guaranteed to return true in finite time. That is well documented on the
>>> dma_fence() object.
>>>
>>> When you want to poll on signaling from userspace you really need to
>>> call poll or the wait IOCTL with a zero timeout. That will also return
>>> immediately but should enable signaling while doing that.
>>>
>>> So just querying the status should absolutely *not* enable signaling.
>>> That's an intentional separation.
>> I think it depends on what semantics DRM_IOCTL_SYNCOBJ_QUERY should have.

Well that's what I pointed out. The behavior of the QUERY IOCTL is based 
on the behavior of the dma_fence and the later is documented to do 
exactly what it currently does.

>> If DRM_IOCTL_SYNCOBJ_QUERY is mainly for vulkan timeline semaphores,
>> it is a bit heavy if userspace has to do a
>> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT before a query.

Maybe you misunderstood me, you *only* have to call 
DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT and *not* _QUERY.

The underlying dma_fence_wait_timeout() function is extra optimized so 
that zero timeout has only minimal overhead.

This overhead is actually lower than _QUERY because that one actually 
queries the driver for the current status while _WAIT just assumes that 
the driver will signal the fence when ready from an interrupt.

> I filed a Mesa issue,
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094, and Faith
> suggested a kernel-side fix as well.  Should we reconsider this?

Wait a second, you might have an even bigger misconception here. The 
difference between waiting and querying is usually intentional!

This is done so that for example on mobile devices you don't need to 
enable device interrupts, but rather query in defined intervals.

This is a very common design pattern and while I don't know the wording 
of the Vulkan timeline extension it's quite likely that this is the 
intended use case.

Regards,
Christian.
--------------lXHe1ecFNCLrywzQNJljPjPz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 04.11.24 um 22:32 schrieb Chia-I Wu:<br>
    <blockquote type="cite" cite="mid:CAPaKu7TB30wvDvMW2FcYNcxjfDkOje358JNnRr2jJf=99-h-rg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Oct 22, 2024 at 10:24 AM Chia-I Wu <a class="moz-txt-link-rfc2396E" href="mailto:olvaffe@gmail.com">&lt;olvaffe@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, Oct 22, 2024 at 9:53 AM Christian König
<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Am 22.10.24 um 18:18 schrieb Chia-I Wu:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Userspace might poll a syncobj with the query ioctl.  Call
dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
true in finite time.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Wait a second, just querying the fence status is absolutely not
guaranteed to return true in finite time. That is well documented on the
dma_fence() object.

When you want to poll on signaling from userspace you really need to
call poll or the wait IOCTL with a zero timeout. That will also return
immediately but should enable signaling while doing that.

So just querying the status should absolutely *not* enable signaling.
That's an intentional separation.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I think it depends on what semantics DRM_IOCTL_SYNCOBJ_QUERY should have.</pre>
      </blockquote>
    </blockquote>
    <br>
    Well that's what I pointed out. The behavior of the QUERY IOCTL is
    based on the behavior of the dma_fence and the later is documented
    to do exactly what it currently does.<br>
    <br>
    <blockquote type="cite" cite="mid:CAPaKu7TB30wvDvMW2FcYNcxjfDkOje358JNnRr2jJf=99-h-rg@mail.gmail.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">If DRM_IOCTL_SYNCOBJ_QUERY is mainly for vulkan timeline semaphores,
it is a bit heavy if userspace has to do a
DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT before a query.</pre>
      </blockquote>
    </blockquote>
    <br>
    Maybe you misunderstood me, you *only* have to call
    DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT and *not* _QUERY.<br>
    <br>
    The underlying dma_fence_wait_timeout() function is extra optimized
    so that zero timeout has only minimal overhead.<br>
    <br>
    This overhead is actually lower than _QUERY because that one
    actually queries the driver for the current status while _WAIT just
    assumes that the driver will signal the fence when ready from an
    interrupt.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:CAPaKu7TB30wvDvMW2FcYNcxjfDkOje358JNnRr2jJf=99-h-rg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
I filed a Mesa issue,
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094">https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094</a>, and Faith
suggested a kernel-side fix as well.  Should we reconsider this?
</pre>
    </blockquote>
    <br>
    Wait a second, you might have an even bigger misconception here. The
    difference between waiting and querying is usually intentional!<br>
    <br>
    This is done so that for example on mobile devices you don't need to
    enable device interrupts, but rather query in defined intervals.<br>
    <br>
    This is a very common design pattern and while I don't know the
    wording of the Vulkan timeline extension it's quite likely that this
    is the intended use case.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------lXHe1ecFNCLrywzQNJljPjPz--
