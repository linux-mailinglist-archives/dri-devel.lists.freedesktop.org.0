Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BFB9D8A1F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF9310E69C;
	Mon, 25 Nov 2024 16:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a87fzTuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5631810E69C;
 Mon, 25 Nov 2024 16:20:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqhpyzU9i/8VgpzHP94rZmwAAzljackevoRxEinwhVugmNdKm/C1ZebJpcJZfQn0uRJDZjF9JWepVoiRVfm96RHf00HwlhzhfITsrh8TnNCZ5p/HAxtAqZP//DElkVD9DhG1Ijhuq5xecIgksgmUb9BTD87fZzgFTVXKKixuxXGLjshwAka0DoKd8wke9+TZz0/H8b8Qfj2zP3G7EzweUPiwqm8EuETKpS6JTO4IpJdy/EhMIoJfYjmFQPCrAq06DBbJRKmWr59l5ee+2DDM5m05DJoOB4hemZUuTN82w0eIpyPMz/wxGDsmzXzDUtHVvyVIOMeQSSQjGtA1JU/OSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I++k4xDS4F6+xPWvGejqckEAa+FPNW0Nu2/uMlD3Cpw=;
 b=Il4HVqDZlklwagb7adqWCrygeBt5Tro5FrHmVeR9wAUm7u9LTWerHL+nSptJ4rHW1tqEj2F1QkpY6RsNUOa03j+zAvSKWTkHfViV3lhHclb/PtNSG9mgCB0ADrFCKpB7PN3ReEamTaTkFgahBOeSXxKJsXCwT4SebDF13JuIoaGg29p1M7fk0w6zNZ6MZJEN55et5klrg8xO32jHFp9rwHel3FidMuu6KiI/u5xnRBZz8WaGUGOuuVVbOhvMJjSQzdvf1tyKzv7FUjyrA90OtlXwPnLwnWSje4BiRQ8p1lQxHJyDnP/PNpiUhh/r/afdyIqQYE6pf82A0/PnS3K4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I++k4xDS4F6+xPWvGejqckEAa+FPNW0Nu2/uMlD3Cpw=;
 b=a87fzTuHJWNMIw178+4TPJJ2Fc3dMxePouPTHJ6SGWDtTZXohIv7htT8QZy3Q7kgIULcYX/TWoz9RG/iuHykj6M740uAf7p8plAkO48o/uzHmFeJQIrAw9QGDK4nITW35BPs/4q8QwUAR/KDFTlDbdAS+IrYYsLlfMPqfdEc7N0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 16:20:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 16:20:01 +0000
Content-Type: multipart/alternative;
 boundary="------------4aakPOGI7JV9HfUqgWW6Gr42"
Message-ID: <634b07dd-aa5a-410e-8f62-0a96567c7932@amd.com>
Date: Mon, 25 Nov 2024 17:19:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com>
 <31b16d78-708d-4f19-9b33-891e31be5480@gmail.com>
 <173141886970.132411.13400253861916730373@jlahtine-mobl.ger.corp.intel.com>
 <27f8bd540ac1f04daf8a7786f4ae7828017d061b.camel@linux.intel.com>
 <c62e5298-1ca6-4cd0-a558-3d2a91175fa0@amd.com>
 <d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com>
 <6ab9e754-6f4a-48ec-b143-02585bc40291@amd.com>
 <5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com>
 <8d17a8a2-9a44-4f80-92b5-a8aa3efe6bf2@amd.com>
 <ZzeSr5ut6GVEwSJY@lstrano-desk.jf.intel.com>
 <Z0SX8WJCPADGLVE5@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z0SX8WJCPADGLVE5@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 4392b395-a7a8-4952-edc2-08dd0d6d0337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K25OYVBJTUFIZHQ0VVdpQldNMkZJcDRRMkxuTERjdlFmcFVDMi8xalBZbnN1?=
 =?utf-8?B?L05HMEI4elM0aXE2N29PRTZoVUoySjZYRWNTRENBQ25uUVQ0SU5KWWx3MTVv?=
 =?utf-8?B?aXNPWXVjeE9yMnYxVU5hbURIbi96U3lCUEp6YUxPbEEwRGxsVW44eExJcUVG?=
 =?utf-8?B?VVdHaG9Nd0NJUnl3R3VlaDQvc1JtZElieFY1OStoYzAxeWhYd1RlYTR4Uzd6?=
 =?utf-8?B?ZitabWRLSHZWQkM1L2pWbUJTZ3YxbWE0bmxmc1prcS96eVdtMGFXSWtoSUpG?=
 =?utf-8?B?aDhoRzVHbFBNenMzZllFREVhTG8vaTc5d2RnZVFUenlmSEJGZms3Rk9STlkx?=
 =?utf-8?B?ODdtSFYvdjZUMlJSeVc0K2o0ank4bjlrNVl5ZEhaYitaUzlIMk9ka1d3OEUr?=
 =?utf-8?B?RWVTT1NZN284SHBpekIzbmJGdmw4am9BTWpxWWZiRFo0ZGFVMWYxZmVaVU9O?=
 =?utf-8?B?b0Fpa0ZLWmNPR0JhbXI4STNWYXhnWUYweFB2c0tyNlBJdjhTQ3kzZEN4MmY3?=
 =?utf-8?B?b2tydUVYQTExS0RmenMySHRxWnF1NHI1azJvUEJsMjI0aUplQTZLTmU0U2pj?=
 =?utf-8?B?cVJTV2dsSXc3K01MallpV1NOd0xYTDdwMjAzZEZxYWkrNW1zRlVZZjRlVWtz?=
 =?utf-8?B?cXhMbTFTbkRDYVluM1hta1ZlSVMveGhDMXpiWXVZOVlReHA3RW1WU1BBWC9l?=
 =?utf-8?B?UElReWY3NUsrRlhUc040Zmdmb3Mxd1RFODNZT3RrYUR6MGJnUm9FRVlQWnZW?=
 =?utf-8?B?cGF3ZzNBM3lEdzhISDBidlNkTExVejVZb1VRQnZIcnJkcUdGL2Qwckw4Yk0v?=
 =?utf-8?B?VC9SdUd1NDhEaG1DL25pMHU5WHRwa1Qwc1hiaUtRUUJ2LzJlVnc1RUFXVEox?=
 =?utf-8?B?RWxsSlptbnFOY1lwMng4VFdGUGhxVjErM0dBeWN0TmhQanZrWkhDZXZ4ZDV5?=
 =?utf-8?B?eEZqL25tUnZ2ZEE0ZTJ5RnQzK2tuMjBtN3k5OThoNzBxNWNnM24vaEtJbjZu?=
 =?utf-8?B?QTZtUjdOTzhSdllYaUNUa01hdzZleURHQ2VkOC8zK2tCUkpCOE5Db2I2TWh2?=
 =?utf-8?B?YU0yK0xKUGs5U2ozTHZJRzNVVHJDNVYxblZjaVhzZ1JCZ2E4eFZrWTY5UVN2?=
 =?utf-8?B?UVNnQnNhVHIvZVdhU0VrcTdQL2ZzY3hMOFQzS1NTaGI4RkFJdkZPVXFxU292?=
 =?utf-8?B?aGR3L05TdDhEL2lFM29lMWlnYlFmZm1GdmlFUTRJVVZKekZRbDNvbTV3bHls?=
 =?utf-8?B?OHZ6UmE1M2szTzFaVE1qbVNFcnNUSXo0Y0tUMjlLalpMOWRrdVIxMlVoaTJZ?=
 =?utf-8?B?ZkJ6UCtPRGxVNW8vK0RYMTA3ZGY4Z05seFdJSVVLblNicFVqeDU0SExzTnUw?=
 =?utf-8?B?Z0w0K21INndOamYvNmc5Nk1laWhzamVmMTZRb1BPcS9SOWtlNk5zOC9ZeHdv?=
 =?utf-8?B?Uy8vdVZWcVk2Y056S1Q1bFhJYkVlVTMzYUEzTXNoOU4zTE1PY09KZ3IwM0ZW?=
 =?utf-8?B?dys5WE52ZHJHZzNHUnVmcmFGcmRRSUFacGhUWVdvbWlNRG1YK21tcG9wcGJR?=
 =?utf-8?B?K29hK2I2R0dQMlhZK3FIakY2UExZUHlQQ2JJbUh6cHdsbUFIQ1d4QzJzNmNX?=
 =?utf-8?B?Mm9uNTd2TjVZNVdRbTJnRG5YSEU5VzhhQ3F2NDNSSHRXcjUwcDQ0QXBpR3o5?=
 =?utf-8?B?eHcrY2Z5QzlENzZocjhsWWxHSWlld3dRblYzZksxbUhlRGVHbGJxVG05NS84?=
 =?utf-8?B?alZpY0V3eE9vSWFiZTMwYTFFRkZKZENhTlBJaWNFRnNKYzJ5QTNkKzdLUjBU?=
 =?utf-8?B?Mkl6S001ckI2SW5lY3ZPQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3BMTGdoeDZOUlptYkJ4VG1PVDdsM3pBU1RUdHdnS0tOWmFMeVkva2NKZGk4?=
 =?utf-8?B?UkIzKzNPMGkzTXQrbE1hMDhkc3kwaG1FcG9ySUc0bitxWXo0N0xMTGwrZmVF?=
 =?utf-8?B?WUdRcEdFWmRDUXVuMGFlNUd5TDdFSmVqeExDNFNGOEVLVDZpZEMrTXBqVGxq?=
 =?utf-8?B?VGFYbHpsUVQySXpsMTJLR3FDVXBlcU5jSElGRHdheHBINkZjL29rMEtNMkJ1?=
 =?utf-8?B?bW9SV3daRkN1T2hEWUp2NXNWemVoQjcweUdUU2pXLzQwK1lHcWQ4WmJuNEFz?=
 =?utf-8?B?TG13Yzd6YmhKZE5ZQ3pka2hsdWdyUWNoc3UwYnU3clB5SGxrYVI5UDkzTUtt?=
 =?utf-8?B?TElvRHRYTTl1R3NhbGQ2U0RBRTdIZFkzeDVranlXSFIxVUtQQXN1eXU3U01G?=
 =?utf-8?B?TnVuUUh1NytCcnlUdjEzaXJiN25MbmhsdWlMbUxNWS9UTkc5bXVERWZvaUVm?=
 =?utf-8?B?VDB6ZlBRcktWMU5IZWVaeDltMUlYZitkcTNIMXVlK1JocFZKL1psMCtpOGVO?=
 =?utf-8?B?d1BxWWdoUk1RUkhVeStKTVNNTlBMMFBpNW9sRmJUb3ZoTmFTK3N6VlZsUURY?=
 =?utf-8?B?R05nS2JCU3VqTmRsMVAvbjZtRVdxRzNob1MxVVYvWFZhbDNZcUFZcm1lMVo2?=
 =?utf-8?B?SUhGVEJNQSt4Y1BJYmEwOVh3M0djUGxaMSttLzZXL3VjQ0ZKMnBTNmZkNVJN?=
 =?utf-8?B?RzBXRHd1blRBVWhwOUlmMGZYUzhENUlocVR6OUlLUWJ1OEN3WjRMTTRVS1Zv?=
 =?utf-8?B?RXk4RlhYK1dIRzgwdnplYmdhWFJQeGg4cjRJOEx2MnpCRVo0dmtrT3RVQ2pn?=
 =?utf-8?B?ZmhWM2Iyb0Y2cTVIeDlNY012bU1Rb2llOHF3R3hUc2FCdXMySDg2QWtaT3Nl?=
 =?utf-8?B?bGY1QTdyb0NiRWQxQzlQVFVjcDFyd1ZUZUFlUUVmMnBnS2pENzMvN0N3VUlC?=
 =?utf-8?B?R1Z2R1JROG1mQkd1Si9HR0k1elVkZ1g4elZQWTZDaEVabGtFc1Y1eEhJRWhr?=
 =?utf-8?B?R1ZhRlliam5IWERhNzZGd1FuMDVzdTdrM0xJdEtVYTVjT2xHcTBUdVUzaThL?=
 =?utf-8?B?dXQwd2VycS9HUnZRQVhEYnpIRFI4NnNOSUZKd2c2bUJTZGVBTzdLS0M4RXFY?=
 =?utf-8?B?VVorK2hVc3Y1aVdicVhKdEJFaUZMeUZTQ0doNllBRnZrakl6cEtzdjVDWTBV?=
 =?utf-8?B?eUlmcGlCWmpVdWJ4UmE5ODVIZkRMYmV5cHNReWMyS2dmQjczc21hQ05BQWhD?=
 =?utf-8?B?YWxySmxxUEVkZzV0SVR5dk1ldkJoalE0MlZPTHY0TTc1cFA0QWliYnNmdERI?=
 =?utf-8?B?NzBhNFE4SlVHNU5xcEhPcnpaR3FYV2dPa1RobzVJVUsxcGFpZjJmRWp6eDUw?=
 =?utf-8?B?N0tCMlpNM2ZrWUNuaUJsYmdZbWdhUURoc3JpelkxNE5Bd0pKem1pLzNjWXYz?=
 =?utf-8?B?U2xVZWVnUm0wTVZWY3g2UFlMM2VUZHQzQ1dvTkdsUnVXMDBSaTlmdWo1OEEz?=
 =?utf-8?B?R24rRXNvZ2YvMVByL01ISnVUV1JtdnBLZkkvVWdHREJoZGNMZ3BrNXNydkNp?=
 =?utf-8?B?eWhpeitTUStJMFB4U2ozMUZlcTNkQm1ZV1lINmFZYXFNUjdHRkg0REthSlVn?=
 =?utf-8?B?bk5NUlV4a0lKeHJsUGR2NHpsVk8ydUZLemRkWGQvZWFWNytpU2xiK0F2c2Nj?=
 =?utf-8?B?OWY5TFFmaEt5QTNyTlNWdHlCRmVCZFdSOGVWcjdYMklTQ1l4cjNkWVc3Tmx0?=
 =?utf-8?B?Y3M2U1ZjYXlYZkRjYUs0M2RWMkEyem1wamxva2dDU0o4QzB4eCtYNml5Um5k?=
 =?utf-8?B?bGRUSjJKczlhcThIUHNpTU9rUi9GYzBCMlZhaytlRXhJQTZBeFlrK1I5WGdW?=
 =?utf-8?B?azZTMTBLOFY2WEpYemU2MU9NbWJFU0tPVnRXcFR5UjJ6Y3hVR2NkaFlZcXVL?=
 =?utf-8?B?endiQTNQOENVWisrMWs2V05vZlNPODd5Z3NranY4UVEzcklnTWZ2a0xlVmdD?=
 =?utf-8?B?MVYwSmlwZUxtNjl5dklud01jZHpaWFVOd3A4bkdEQUk2UzVKUDZGVldIc2Ny?=
 =?utf-8?B?dlJyaStlalRRdWZWK0IwUjJQZ0pHSkpqS0N1WXlud3FUdmsrVXEwZTlWQXNR?=
 =?utf-8?Q?1UuX6Z+MI3qeAVJ2ch9kwz3oL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4392b395-a7a8-4952-edc2-08dd0d6d0337
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 16:20:01.4695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RWINoQakjD92PLfcG84ONEDEEOPyO3Zuo4GqM74s9q0IDqQzA9rGSQhFmLKl80e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236
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

--------------4aakPOGI7JV9HfUqgWW6Gr42
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 25.11.24 um 16:29 schrieb Matthew Brost:
> On Fri, Nov 15, 2024 at 10:27:59AM -0800, Matthew Brost wrote:
>> [SNIP]
>> We use this interface to read a BO marked with a dumpable flag during a
>> GPU hang in our error capture code. This is an internal KMD feature, not
>> directly exposed to user space. Would adding this helper be acceptable
>> for this use case? I can add kernel indicating the current restrictions
>> of the helper (do not directly expose to user space) too if that would
>> help.
>>
> Christian - ping on above.

Sorry, I will try to give those mailing list tasks a bit more time in 
before the xmas holidays.

That is an acceptable use case, but the problem is that this helper 
won't work for that.

See during a GPU hang you can't lock BOs, so how do you want to look 
into their content with the peek helper?

The only thing you could potentially do is to trylock the BO and then 
dump, but that would most likely be a bit unreliable.

Regards,
Christian.

>> Matt
--------------4aakPOGI7JV9HfUqgWW6Gr42
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 25.11.24 um 16:29 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:Z0SX8WJCPADGLVE5@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Nov 15, 2024 at 10:27:59AM -0800, Matthew Brost wrote:
</pre>
      <blockquote type="cite">[SNIP]<span style="white-space: pre-wrap">
</span>
        <pre class="moz-quote-pre" wrap="">We use this interface to read a BO marked with a dumpable flag during a
GPU hang in our error capture code. This is an internal KMD feature, not
directly exposed to user space. Would adding this helper be acceptable
for this use case? I can add kernel indicating the current restrictions
of the helper (do not directly expose to user space) too if that would
help.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Christian - ping on above.</pre>
    </blockquote>
    <br>
    Sorry, I will try to give those mailing list tasks a bit more time
    in before the xmas holidays.<br>
    <br>
    That is an acceptable use case, but the problem is that this helper
    won't work for that.<br>
    <br>
    See during a GPU hang you can't lock BOs, so how do you want to look
    into their content with the peek helper?<br>
    <br>
    The only thing you could potentially do is to trylock the BO and
    then dump, but that would most likely be a bit unreliable.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Z0SX8WJCPADGLVE5@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Matt
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------4aakPOGI7JV9HfUqgWW6Gr42--
