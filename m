Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC6D95B1A9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 11:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD8810E81E;
	Thu, 22 Aug 2024 09:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ybvwp7gE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E13110E81E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 09:29:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8lWr3KfUSWeqn8iWXc+bElYQHmGR7QNE7yJv7oroH5okBGCdSiwCxvAWBhDZlhkxpqneBKiKznc6Z8pngXECBDL7b47I16QOxO2Tvgx+igQRzatUFIL5g697pgIRJL83t8ztZsVzWxJrdESwgEpntiU6mOeoj4sXAH8bxvqaGqphcJOvwM1pLz5+pW5G66oJu2t9Cvbm9N1kQstKYQq/F37bbJGv9GclVxOKjprP0TSQNVEu0zqrrEZBbUI1yh+qCtMLrkAHRYvTO++b29nMAYH+R4DUuxRsEPmvnmdeq2npdxXuKwaPcsOS5CIUEZ4l5ecMCssB+9E3A+zB9TR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JH9leOARdFSrTnp0GBWKF4dFVYNYI6b11dNM3Xshfak=;
 b=VWA6Va3oDE6rIM6a2x7QWuhSWGX5Rt0J0UfLxInPq8HcBi3AdgUniTN8rX8UV9naKyg4MtqmO0jQdS0Kdl9mCErRgWlxWF+VOS6MrSuDL+f9QBjW96NQA3aM7AizTY1Ut44gklThPhMZCP1j/73JtJgUkwY/wowYSuRF+ByQ/8nP5UdvuF4oUYZU763MGjCgCj4Dkr6yDH+FZ77OEKAeOo3pIWH18vWgDgrl6Bn9GIexCCWmZdmMYvO+J+abpIskalU6JDWRfF9BeGVEeZhjW6Y4FcCDXS2aL05LqioboJ7N+PTcB53dm2B0Ily0jLBnBRw0M4xuJKyqeWEvO7zCwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JH9leOARdFSrTnp0GBWKF4dFVYNYI6b11dNM3Xshfak=;
 b=Ybvwp7gEYecKbnhKSgq0SszliE18TICnkDx7wKtJHbil4ZaSvFxkK+oCHdWcoJ/o+YhjLnaRKV5wVGCMapjxx45c72BOTvii5b8WJdO22v3sj5xfCrJ1POktM1D2/SMP0O0j879iz7ZuY8XGt7UH8rrvDswKjuZonobmrTB0PxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6683.namprd12.prod.outlook.com (2603:10b6:303:1e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 09:29:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 09:29:28 +0000
Content-Type: multipart/alternative;
 boundary="------------F7ICEMGURm6KeW3HTzm4hWma"
Message-ID: <fbb4a84e-aff6-4ac1-8eb8-5b9740b297d8@amd.com>
Date: Thu, 22 Aug 2024 11:29:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@linux.ie>
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com>
 <006ba26a-48ed-43e7-8213-72ca0ae553e1@amd.com>
 <fe3a72942e558af26f1b2794f946920a33d316ab.camel@linux.intel.com>
 <e3716526ae9b530adddc815ca12c402b4cf7678b.camel@linux.intel.com>
 <8b479754-ea3f-4eb9-a739-26ee38530a23@amd.com>
 <75bce0097d86896fa70d6dba4c8ddb429a5bc1bc.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <75bce0097d86896fa70d6dba4c8ddb429a5bc1bc.camel@linux.intel.com>
X-ClientProxiedBy: FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: a2480d34-069d-47ca-f3c2-08dcc28ceb7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2JEOGNKRHpNSmE3cWZPbVJqVUhnRGVJNVFBS1FtUW0yVFB3SGlkRTh2aDVV?=
 =?utf-8?B?Q0RRNi9yMmcrNHNzcVl4dUFNemFXVTcxS3pNOHNqUXhTeTRRWGdLejRnODl5?=
 =?utf-8?B?em81VUNzZmI2UnRWTzRaWUZQSkVQcVV5a0NIOWhpMmlWVk5WSGY2a2JsK1Nx?=
 =?utf-8?B?ZW42NFlvaVh0S3hyU01Jai96VXgzc0xQbi83NFc4NE1iTTZqOHVkdWdsZEJR?=
 =?utf-8?B?TzZ6YWs4eXMxb1RkNWx4Mzc4dnY1QnoyRFdZeTdzb2h1WHcxSndtdDdXZEJn?=
 =?utf-8?B?aFFQS0d2eW93d2ZUVkFYeTlvTEYvRVNTMzJacllSRitGQmM2c05WMXFyeHBG?=
 =?utf-8?B?bDhKN0NhWGt3NWNDUTRudDdtUlQxRVhqVk1pVU5EL2lyZFI0cExiT2E3Vmpw?=
 =?utf-8?B?eVc0QTNHbnUremdoUVdmQnVMTDZUTFFWWVZXbXA3dE93QlJtcEdJT1VZVGRH?=
 =?utf-8?B?VDhvakN5K1V6ZlRoeWRCWUNBV0NXaEM5aGJlNE56Qk96TUlJckdyZHNxNDdD?=
 =?utf-8?B?UGFabmVJTUhvTVJXMGE5ako3RUx3NjdDK1lCY3dWYzhlVXBKMEVrYWFrVkVt?=
 =?utf-8?B?NUZvVWZqT1M1WEFvcVVkbmN3UmVSK0hnTW5YUHFTOGR0Q01SaXhOcUNjdDNy?=
 =?utf-8?B?enk3UlNHdmpZU09sMSt2T2R5dmdkYTFvNEo3REhyOG0vbjJtT05OTGdSWXgy?=
 =?utf-8?B?QStheTlQUHZ1VmlPZWtGM3VYTUpQbnAzSGV5OXdQbjdwd2RFb1JTVEZFZXdR?=
 =?utf-8?B?MGNTL05TZU9TdVhKNDgwQTJQc2svZW13NlRvYmppclBMdm9Eb08zUFA0NkQ0?=
 =?utf-8?B?UmVOUEx5bmM1UU5PSFhpOUpWQldsbG5CclZaYUxlR2lrcDNXVTB6aWhPWXo3?=
 =?utf-8?B?dW5sQzNpUlNnN2VOcWw3bFM4dmdvZFc3Vlk1MVl2TmUzc3d2MW1iUnRuTFFn?=
 =?utf-8?B?bnp0R1ZQK2VyZjA4MWVQUXdaejNoMXEvMmNRa0xyajkvVGQyRm1pUmlNNHNQ?=
 =?utf-8?B?dUNKbWFQYUVkQlBqemJISkhnbEpJTlZIMmdBby9DL2JNeEtpd1A0d0ZjQ3ha?=
 =?utf-8?B?TEtCRDhJa0pZR0xmOWh2QXNiNnlpbHhBcXBaR2JXVk9SWmNwcSsvVTlmRUdZ?=
 =?utf-8?B?SEpROHFxQitOdmwveUw2RkNqQjVxRFZ2Yml0Lzk4RnpLYkpMUGRSa1czRW1F?=
 =?utf-8?B?MElzeWdiUGpBSTE2QXl1WkJvdWphVmRxSTRrVldrSWhiYUJCVGlkUlhoU3NW?=
 =?utf-8?B?aFBjNmNKM3cvbmYzMjBtdlV2NVJHZHVBOUdiMVFPQ2tKb1hNUDBMOUZNOTZL?=
 =?utf-8?B?ZGdObXAzV3pwOE1mMUpXZWZMZzN4TDNGSEZaWUkyLzNpZUpWOXQxTXBZd0RG?=
 =?utf-8?B?bS9ZNDY5THZSVlVJK2dkZ05rQkV2Y2RuSFF6eE1vTUpXS3FrMGd1QjFuemhj?=
 =?utf-8?B?elkwN3lXZXZKUWFrQWdxY2dvU3lNMWkra2NkdUZ2blo0SnZ0djlZbzliV0gv?=
 =?utf-8?B?SWFEU21LZzhlbTZWcWY4TnZLS3BzTTdydWMxNitndDFDY1RhTlhlQVdtQ3oy?=
 =?utf-8?B?UWovZ0p6ei8zMy9xOXBPYUJPcWppUnpLNGJjTDdZZzNyeUxGRHc4Z0ZmeVFx?=
 =?utf-8?B?UUpnckNxWTZuc1ZqQStuSEMwQTZHTHp0K3BwVGkyQXNJNnE4VE9WMng0UENr?=
 =?utf-8?B?cU5tcEF1L2tmVWZaaEduaG9FLzhOdkp6NldwVWszMDh0bzkyaDdHbUp1QTJh?=
 =?utf-8?Q?lFavZ09Xxak3vd2tOnpkqaHlv1PhP3dwZu+hg0Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVFTR2h3Rm9xT0diZFlmc0llazk4NWZiQU1nQ0tvNUFEZTIybEpVZHQydjVW?=
 =?utf-8?B?N1lEV2JHelNkY0k5ZUdHYU0rYld5ZXA5V2d5S2FPRUdrUGQ2dHp3M1RZZkpZ?=
 =?utf-8?B?SFpuVHF2dXFwaS8yZGNNbW14UTdqYkhmc1lxTjlHUWo4THpTS1hrVmw3MS9Z?=
 =?utf-8?B?bjFGV3RjcnFXcUR2dDBCVXlzYVlYUStNeTBCdmZPdjRFcmtnWXBUT3hRMng2?=
 =?utf-8?B?TU13eFBqYTFBY09IRzV1Wk5CTnVhR1VGQnZ0T2hpb0k2Z2hSU3V1eWVGeG5M?=
 =?utf-8?B?dlhqNDdQV1MyZTBpOHFvWGtTRDNiSnR6WDNlVVBwR1hOMzRLNUhOVEJjeEJJ?=
 =?utf-8?B?NituNUpJUGFaMDdmL0tkTHJuMGxLelJ3L0NzMFFVU3N1Q2l1VUFqcFUxc1Rj?=
 =?utf-8?B?RXNwWmw5YkwzR292NUlmOURsRVhRQmNGb1VyRTJTdDlXei8zSERvTVcxSmQ2?=
 =?utf-8?B?ajdHRmM2b3krR0RoWmJHMXZMSlRROGtoTHU5b0NFT04wSmFYZmlmcVg5SkYr?=
 =?utf-8?B?b1NZbWhINHA2Y25FbkJ3WUdoMG0wekJXUWxkNWNxZlRmcmpzelNTVDlNMGVV?=
 =?utf-8?B?YllsNGJUckd6VXU5eUYyYVpmL3l1enNIUUk3Y045dEdja0ZydnRBZWd4Slcv?=
 =?utf-8?B?MDVLazRFVmlsdkM4WkUwRXJjY2kvRzR6OVJ3Q3hLTlVySkticEhib1VFL2FH?=
 =?utf-8?B?ZmJLTW9jbldlOHJOTS9ueExOdzA3RmUyZUdJVXdua25rdWNYYlpsTFB6ZVo4?=
 =?utf-8?B?YUtJMWI3OUJGc3Y3eVVySFZvOGhYVGc4bUxTSnMwbk5ld0VqMVM2Tk4zQTRG?=
 =?utf-8?B?L1pkME5WUDZCTDcvQ25GcVRwZXRjKzB1N3BaUjBnSVk1U1ZUQUhpM292YlRX?=
 =?utf-8?B?bjRsNnBwb2ZIU214ZTdicEhNQWdmYjg2OTBIV29xamlxMHZXTmR1T0poMzdF?=
 =?utf-8?B?d1hjNmwwSU9NK0V4aUMyK1NDRisyVDBBMnUraGM4QzJZTi9DdnhiWnlGY0wy?=
 =?utf-8?B?Zm5CZDFzdTNyQXZiL3JOQlJ3SGVOdk45UkExbk5aMU5Ra1FuM0NIaUthZ1Q2?=
 =?utf-8?B?U2JUS0pWR0tOMlZ6YlFnNkk1enNSbHZDbEs1VitDMjZkV3hrMTI4cWlheFc1?=
 =?utf-8?B?czdnMUVDL2NiSEJlVVpRMUM5S2plVk1nYTcrcnArQ2ZOUUp0NlNVOERhM2ln?=
 =?utf-8?B?S0ZLenJRNklJYm5Tdk5teGJyREovcGFHNXRuNUJBbzlmaitZdXVGNVVoYVNQ?=
 =?utf-8?B?QzdLVFY3dTVIM0V6Sk5kSnZteXFuVldjbVNxajV2Y1ZJRlRubUJpcHN6ZFFU?=
 =?utf-8?B?K1BLcnFQZFB1YmFVN3ZmZzlTaTBoQmtVQ3dXa0k5UWI3NmY2UXNqNi9SSlFS?=
 =?utf-8?B?Y3EwZWhFRnJYdVpqUUt1MDZVSmtjaE5oN2dpdm5xSmo3RG53VS9abktrMlhZ?=
 =?utf-8?B?WHYzYWdFYXVzNnNnL1pXT2VHUzd5V2plRE5xYmRFbGlqb3ptOGJFV3BzdGpL?=
 =?utf-8?B?UzFvWUFxbHVCb0ppeXZqQnRGYll2dHlZZ0t4eUFoNDA5QlZCSk00NzJ6S2pX?=
 =?utf-8?B?UW90Y2ZPNk9YQ1U5Z01raC8wUjhrOSs2V1ZGN2xwa1lucVVzVjBvK0Jyc1FK?=
 =?utf-8?B?VWxqRys0MFpCdGF2eDhWVTBCZmdFcnhmOUNBVk9zdThDN25hYVpoMDZGby8r?=
 =?utf-8?B?VFU0T3p3ZGxwN3VmSkxDU0dHd0p3UnFkdUNDbW5jdWFyQml4Nk5wejJSQVUv?=
 =?utf-8?B?S3pEQklwTGhxRGpUemVkQ3V3RUNtSkg3dnhPaWlnTk83OUVTbFArWFdtRHAy?=
 =?utf-8?B?VmJPRUxOU3ZPOW9qRjRnSzJ6TlVxemtndmpSd0psTUhHTXBCNmR1bWxlVjdo?=
 =?utf-8?B?RTVwdEY5VE92M3FqcVk5eWJvWU04YWxzQmw5aGxBQXM4N3Z5eUE1M213OUd0?=
 =?utf-8?B?RFQ3dTkrR2I4bFlETDZXU1dGOGF2QXp5ck5ZeUxId2E1cm1pM1VTc3lYT3Bp?=
 =?utf-8?B?NFlPUWVrdGV3SWFZRVYzei9XZGUxcjhFT2M1emVHSXpGSTkwZ0Faczk5WjFR?=
 =?utf-8?B?RWJqeDdXZERtTkdySWkxSHZtaFRwYkVLZnF2OHdOSkZXa2FzcldiaG5GalFO?=
 =?utf-8?Q?LueU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2480d34-069d-47ca-f3c2-08dcc28ceb7b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:29:28.4103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7x8daA39A1VFlZDXmEOIHRKWtSucbvakiiJoQdb8GVZ5ZextCuT8NXuhaju9YbUh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6683
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

--------------F7ICEMGURm6KeW3HTzm4hWma
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 22.08.24 um 10:21 schrieb Thomas Hellström:
> On Thu, 2024-08-22 at 09:55 +0200, Christian König wrote:
>> Am 22.08.24 um 08:47 schrieb Thomas Hellström:
>>>>>> As Sima said, this is complicated but not beyond
>>>>>> comprehension:
>>>>>> i915
>>>>>> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317
>>>>> As far as I can tell what i915 does here is extremely
>>>>> questionable.
>>>>>
>>>>>        if (sc->nr_scanned < sc->nr_to_scan &&
>>>>> current_is_kswapd()) {
>>>>> ....
>>>>>            with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>>>>
>>>>> with_intel_runtime_pm() then calls pm_runtime_get_sync().
>>>>>
>>>>> So basically the i915 shrinker assumes that when called from
>>>>> kswapd()
>>>>> that it can synchronously wait for runtime PM to power up the
>>>>> device
>>>>> again.
>>>>>
>>>>> As far as I can tell that means that a device driver makes
>>>>> strong
>>>>> and
>>>>> completely undocumented assumptions how kswapd works
>>>>> internally.
>>>> Admittedly that looks weird
>>>>
>>>> But I'd really expect a reclaim lockdep splat to happen there if
>>>> the
>>>> i915 pm did something not-allowed. IIRC, the design direction the
>>>> i915
>>>> people got from mm people regarding the shrinkers was to avoid
>>>> any
>>>> sleeps in direct reclaim and punt it to kswapd. Need to ask i915
>>>> people
>>>> how they can get away with that.
>>>>
>>>>
>>> So it turns out that Xe integrated pm resume is reclaim-safe, and
>>> I'd
>>> expect i915's to be as well. Xe discrete pm resume isn't.
>>>
>>> So that means that, at least for integrated, the i915 shrinker
>>> should
>>> be ok from that POW, and punting certain bos to kswapd is not
>>> AFAICT
>>> abusing any undocumented features of kswapd but rather a way to
>>> avoid
>>> resuming the device during direct reclaim, like documented.
>> The more I think about this the more I disagree to this driver
>> design.
>> In my opinion device drivers should *never* resume runtime PM in a
>> shrinker callback in the first place.
> Runtime PM resume is allowed even from irq context if carefully
> implemented by the driver and flagged as such to the core.
>
> https://docs.kernel.org/power/runtime_pm.html
>
> Resuming runtime PM from reclaim therefore shouldn't be an issue IMO,
> and really up to the driver.

Mhm when it's up to the driver on which level to use runtime PM then 
that at least explains why the framework doesn't have lockdep annotations.

Ok, that is at least convincing the what i915 does here should work somehow.

>> When the device is turned off it means that all of it's operations
>> are
>> stopped and eventually power to caches etc turned off as well. So I
>> don't see any ongoing writeback operations or similar either.
>>
>> So the question is why do we need to power on the device in a
>> shrinker
>> in the first place?
>>
>> What could be is that the device needs to flush GART TLBs or similar
>> when it is turned on, e.g. that you grab a PM reference to make sure
>> that during your HW operation the device doesn't suspend.
> Exactly why the i915 needs to flush the GART I'm not sure of but I
> suspect the gart TLB might be forgotten while suspended.

Well that is unproblematic. Amdgpu and I think nouveau does something 
similar.

But you don't need to resume the hardware for this, just grabbing the 
reference to make sure that it doesn't suspend is sufficient.

The assumption I make here is that you don't need to do anything when 
the hardware is power down anyway. That seems to be true for at least 
the hardware designs I'm aware of.

>> But that doesn't mean that you should resume the device. In other
>> words
>> when the device is powered down you shouldn't power it up again.
>>
>> And for GART we already have the necessary move callback implemented
>> in
>> TTM. This is done by radeon, amdgpu and nouveu in a common way as far
>> as
>> I can see.
>>
>> So why should Xe be special and follow the very questionable approach
>> of
>> i915 here?
> For Xe, Lunar Lake (integrated) has the interesting design that each bo
> carries compression metadata that needs to be blitted to system pages
> during shrinking. The alternative is to resolve all buffer objects at
> device runtime suspend...

That's the same for amdgpu as well, but when the device is powered down 
those compression data needs to be evacuated anyway.



> But runtime PM aside, with a one-bo only approach we still have the
> drawbacks that it
>
> * eliminates possibility for driver deadlock avoidance
> * Requires TTM knowledge of "purgeable" bos
> * Requires an additional LRU to avoid O(n2) traversal of already
> shrunken objects
> * Drivers with legitimate shrinker designs that don't fit in the TTM-
> enforced model will have frustrated maintainers.

I still find that only halve-convincing. The real question is if it's a 
good idea to give drivers the power to decide what to shrink and what 
not to shrink.

And at least with the arguments and experience at hand I would vote for 
not doing that. We have added the eviction_valuable callback for amdgpu 
and ended up in quite a mess with that.

Background is that some eviction decision done by the driver where not 
as optimal as we hoped it to be.

On the other hand keeping track of all the swapped out objects should be 
TTMs job anyway, e.g. having a TTM_PL_SWAPPED domain.

So in my mind the ideal solution still looks like this:

driver_specific_shrinker_scan(...)
{
     driver_specific_preparations(...);
     bo = ttm_reserve_next_bo_to_shrink(...);
     ttm_bo_validate(bo, TTM_PL_SWAPPED);
     ttm_bo_unreserver(bo);
     driver_specific_cleanups(...);
}

When there is a potential deadlock because the shrinker might be called 
from driver code which holds locks the driver needs to it's specific 
preparation or cleanup then those would apply to all BOs and not just 
the one returned from TTM.

The only use case I can see were the driver would need to filter out the 
BOs to shrink would be if TTM doesn't know about all the information to 
make a decision what to shrink and exactly that is what I try to avoid.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>
>> Regards,
>> Christian.
>>
>>
>>> /Thomas
>>>
>>>
>>>

--------------F7ICEMGURm6KeW3HTzm4hWma
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 22.08.24 um 10:21 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:75bce0097d86896fa70d6dba4c8ddb429a5bc1bc.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">On Thu, 2024-08-22 at 09:55 +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 22.08.24 um 08:47 schrieb Thomas Hellström:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">As Sima said, this is complicated but not beyond
comprehension:
i915
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317">https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317</a>
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">As far as I can tell what i915 does here is extremely
questionable.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (sc-&gt;nr_scanned &lt; sc-&gt;nr_to_scan &amp;&amp;
current_is_kswapd()) {
....
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; with_intel_runtime_pm(&amp;i915-&gt;runtime_pm, wakeref) {

with_intel_runtime_pm() then calls pm_runtime_get_sync().

So basically the i915 shrinker assumes that when called from
kswapd()
that it can synchronously wait for runtime PM to power up the
device
again.

As far as I can tell that means that a device driver makes
strong
and
completely undocumented assumptions how kswapd works
internally.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Admittedly that looks weird

But I'd really expect a reclaim lockdep splat to happen there if
the
i915 pm did something not-allowed. IIRC, the design direction the
i915
people got from mm people regarding the shrinkers was to avoid
any
sleeps in direct reclaim and punt it to kswapd. Need to ask i915
people
how they can get away with that.


</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">So it turns out that Xe integrated pm resume is reclaim-safe, and
I'd
expect i915's to be as well. Xe discrete pm resume isn't.

So that means that, at least for integrated, the i915 shrinker
should
be ok from that POW, and punting certain bos to kswapd is not
AFAICT
abusing any undocumented features of kswapd but rather a way to
avoid
resuming the device during direct reclaim, like documented.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The more I think about this the more I disagree to this driver
design. 
In my opinion device drivers should *never* resume runtime PM in a 
shrinker callback in the first place.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Runtime PM resume is allowed even from irq context if carefully
implemented by the driver and flagged as such to the core. 

<a class="moz-txt-link-freetext" href="https://docs.kernel.org/power/runtime_pm.html">https://docs.kernel.org/power/runtime_pm.html</a>

Resuming runtime PM from reclaim therefore shouldn't be an issue IMO,
and really up to the driver.</pre>
    </blockquote>
    <br>
    Mhm when it's up to the driver on which level to use runtime PM then
    that at least explains why the framework doesn't have lockdep
    annotations. <br>
    <br>
    Ok, that is at least convincing the what i915 does here should work
    somehow.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:75bce0097d86896fa70d6dba4c8ddb429a5bc1bc.camel@linux.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
When the device is turned off it means that all of it's operations
are 
stopped and eventually power to caches etc turned off as well. So I 
don't see any ongoing writeback operations or similar either.

So the question is why do we need to power on the device in a
shrinker 
in the first place?

What could be is that the device needs to flush GART TLBs or similar 
when it is turned on, e.g. that you grab a PM reference to make sure 
that during your HW operation the device doesn't suspend.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Exactly why the i915 needs to flush the GART I'm not sure of but I
suspect the gart TLB might be forgotten while suspended.</pre>
    </blockquote>
    <br>
    Well that is unproblematic. Amdgpu and I think nouveau does
    something similar.<br>
    <br>
    But you don't need to resume the hardware for this, just grabbing
    the reference to make sure that it doesn't suspend is sufficient.<br>
    <br>
    The assumption I make here is that you don't need to do anything
    when the hardware is power down anyway. That seems to be true for at
    least the hardware designs I'm aware of.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:75bce0097d86896fa70d6dba4c8ddb429a5bc1bc.camel@linux.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
But that doesn't mean that you should resume the device. In other
words 
when the device is powered down you shouldn't power it up again.

And for GART we already have the necessary move callback implemented
in 
TTM. This is done by radeon, amdgpu and nouveu in a common way as far
as 
I can see.

So why should Xe be special and follow the very questionable approach
of 
i915 here?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
For Xe, Lunar Lake (integrated) has the interesting design that each bo
carries compression metadata that needs to be blitted to system pages
during shrinking. The alternative is to resolve all buffer objects at
device runtime suspend...</pre>
    </blockquote>
    <br>
    That's the same for amdgpu as well, but when the device is powered
    down those compression data needs to be evacuated anyway.<br>
    <br>
    <br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:75bce0097d86896fa70d6dba4c8ddb429a5bc1bc.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">But runtime PM aside, with a one-bo only approach we still have the
drawbacks that it 

* eliminates possibility for driver deadlock avoidance
* Requires TTM knowledge of &quot;purgeable&quot; bos
* Requires an additional LRU to avoid O(n2) traversal of already
shrunken objects
* Drivers with legitimate shrinker designs that don't fit in the TTM-
enforced model will have frustrated maintainers.</pre>
    </blockquote>
    <br>
    I still find that only halve-convincing. The real question is if
    it's a good idea to give drivers the power to decide what to shrink
    and what not to shrink.<br>
    <br>
    And at least with the arguments and experience at hand I would vote
    for not doing that. We have added the eviction_valuable callback for
    amdgpu and ended up in quite a mess with that.<br>
    <br>
    Background is that some eviction decision done by the driver where
    not as optimal as we hoped it to be.<br>
    <br>
    On the other hand keeping track of all the swapped out objects
    should be TTMs job anyway, e.g. having a TTM_PL_SWAPPED domain.<br>
    <br>
    So in my mind the ideal solution still looks like this:<br>
    <br>
    driver_specific_shrinker_scan(...)<br>
    {<br>
    &nbsp;&nbsp;&nbsp; driver_specific_preparations(...);<br>
    &nbsp;&nbsp;&nbsp; bo = ttm_reserve_next_bo_to_shrink(...);<br>
    &nbsp;&nbsp;&nbsp; ttm_bo_validate(bo, TTM_PL_SWAPPED);<br>
    &nbsp;&nbsp;&nbsp; ttm_bo_unreserver(bo);<br>
    &nbsp;&nbsp;&nbsp; driver_specific_cleanups(...);<br>
    }<br>
    <br>
    When there is a potential deadlock because the shrinker might be
    called from driver code which holds locks the driver needs to it's
    specific preparation or cleanup then those would apply to all BOs
    and not just the one returned from TTM.<br>
    <br>
    The only use case I can see were the driver would need to filter out
    the BOs to shrink would be if TTM doesn't know about all the
    information to make a decision what to shrink and exactly that is
    what I try to avoid.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:75bce0097d86896fa70d6dba4c8ddb429a5bc1bc.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Thomas


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
/Thomas



</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------F7ICEMGURm6KeW3HTzm4hWma--
