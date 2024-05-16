Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725528C7578
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 13:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C3610EC81;
	Thu, 16 May 2024 11:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i346/T0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE8F10EC81
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 11:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/4K8mpo2HOezJfL4UkO157211zDv1mjQ5+PFcdIUSGsZ4ULYdVGvQ+uKlS0ooj2UXN+n4zuXSlKOtD5aCzCuaARf2f2vh+6KCnHya1/QkBVKkn8qZgvL5ErEtM6OYHncMDQHkCx6mvlJ6CMoxXOFA+vU3ahkk9aJUJgUbrtqHOeT+MwgdddwZJS9Yql5cTH+9qV9W6+2Mw512ehBSBVMJYvub1Sg7Ca+wRA5/hy8MN/0Pe31Y0CUwx9lMOGRS4qJkJjD9EOX0zY7t8F98nu/O9Lo2Ffv7tWE7g6v/wmKORkgrXIwdG+QTnKk5aXw+OtCWMHt0QvCUfeAbHpWryU5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbTQzfucT91ea1qvbQJ8vtb7zlBV072lHwlO5tFs4kg=;
 b=DOeF0Jy8v3qi++cx4xdA4kdutDbZPul6oTEi3vCnKj48okPu8l/xzmkE/DbVr63wlMgucs0sW5+JsrqjclqH8A3yAF8zZ5qZMRf1aCe2UiD7UVqm14rfwU3el+cvmh26yFwLFTnDjdL1C4FVJ40GZiD+ePB1521AyG0Bcj4qV0hxFPmQEm3bAXPNloV9pj5I00y10fIsr3kZpPxKncXpoMhpSfSXCREZjusFVFOhlCmZIw2VcOdvECJWvEEImwkiZDgqXuBqFy46j7Q8HdWpE138Fn9Dy4ED8L3/fFlIcrhm7EwT/mMFKgxskqFd8r5NDvF4X+d5w6tJGfxfwljVjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbTQzfucT91ea1qvbQJ8vtb7zlBV072lHwlO5tFs4kg=;
 b=i346/T0e3p/9GZ/4W/4K7S7RK0kaBogWH8xkauIvRIlD6xwJUVHl3luTU0VwzZeSfbcneIpr17RTHQbk4QwwTrnwKfZWmfjqvNVbL+AOwp2QC72+E9jKEIR0Nip6INVgXLD9N/EGdy5y2SOFTHRT1FEiZ3xIBdxZnqwordP1OSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6292.namprd12.prod.outlook.com (2603:10b6:a03:455::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Thu, 16 May
 2024 11:49:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.025; Thu, 16 May 2024
 11:49:56 +0000
Content-Type: multipart/alternative;
 boundary="------------OoID9kdSa8WULbN9zk5KBfFF"
Message-ID: <160ba8db-12a7-47c7-9869-247f5ff66bc9@amd.com>
Date: Thu, 16 May 2024 13:49:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Simon Ser <contact@emersion.fr>, Daniel Stone <daniel@fooishbar.org>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
 <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
 <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
 <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
 <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
 <Zjue98r4ZgGbMN5K@phenom.ffwll.local>
 <IXDM2ci-eGvU9RQkT6a52vcV66vr8d0ywbDRFY8gBjjNuMyv8RDgdJS0PvvfnKuPR1fXINPUjOBkKx4vIcshSb2Y11xd3DjfDQ-Np8VIFgQ=@emersion.fr>
 <ZkXcVVt_G3TEh2iP@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZkXcVVt_G3TEh2iP@phenom.ffwll.local>
X-ClientProxiedBy: FR5P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e6be23-a1be-457d-5860-08dc759e4e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|366007|7416005|376005|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXMwUUQzUFo4QjNXZk1WQjFTMTBnelVQTW5pWHpncjFWM21lbmxGRTNHYzMx?=
 =?utf-8?B?TXBWdi90NWZJdko2b2YyU2hKNXBXeXdSSDRkQk9sK0RXKzI2dTlqdnhTa1c1?=
 =?utf-8?B?a2JhSW5PNzErU0pIMU9ud2FoVHh1ZCtFTjF4Vmp2YTlQcEhoMmthVXd0RHNs?=
 =?utf-8?B?dlNUTSswRFkwY2U1Snk5b1d5S1pRM2NzRDc2S1FuQlFjSkFTeE5oWFJ2YXl3?=
 =?utf-8?B?OThDaTJVSkxueWdtbWdVWElNWFVuZHA4Uk1DU09rdTA2aWRvQ082Q0I4QkV0?=
 =?utf-8?B?cjRlMnlQYkhQL0N3Y3dBY0c1T2QzZHlOZTB4RU13ODZzWExYUjVBSnV0eDQy?=
 =?utf-8?B?blJycGk1ZUtrOHMyWnVzWmVWTDViMlVBaUhrbmxsWVpmdzZITGpyR2JuV01U?=
 =?utf-8?B?WDhCM1hkUDZSclFRL1o5cTR6aHRON1M5cE5saVlVcGswMlk0SW40T254b1Bn?=
 =?utf-8?B?dnpURGgwSHQ4R0FPR044L1FWSHNCSlI2L3VTSkZUYnNlclFxdFBNbWIxaHpJ?=
 =?utf-8?B?cGU5UlJnaWFNV0VtSGdqUi9BdC9kdE5xcHAzcVdLMXhQZUJsRDJnTmR1NWtF?=
 =?utf-8?B?WEd6U01wNi8xMmRBdENOSGczMm5tV1BDQklMMStYQjEwdVZIZHhQTmlvOUlj?=
 =?utf-8?B?RktkSmQ4UHBmSC8yMjJUQUcyMFN0M0paSjJaamluZ1RIU2tTblI2MU9kK0lN?=
 =?utf-8?B?YzhSSXJMWEJEMW8wcjgwRVhxVTZjUUtTdnpCS0Q5ejJPa2ZsVXZHbjduM25s?=
 =?utf-8?B?ZXBLTnFEVHczUGQwdnZSVDBsVW5kRXNlRHZ0TlpmblBXRU1JbnJSMExnMHZs?=
 =?utf-8?B?M0l6dG5Db05mZ2phbkM1cXZuM3Z2L2NJTGU3U0Nzd0hqV1M0bXQ0eG40dHdJ?=
 =?utf-8?B?ZFRqaElaN3BQQlhNNmxSU1MzZFlSRHNzRnY5QXJuRm1haUJGSG16V2o0QmNT?=
 =?utf-8?B?bm5ZbkpqdDN1eFNKKzRpOTBneVRBcS9uMVJjbWNNelJPUkdhS0lrNk5KUlFt?=
 =?utf-8?B?ZGl2UXB5dFg0YWQzbHZRc0ZOK08vLzd3L1pzVW5HNEdHdXZ2WC9iTU1qc0kx?=
 =?utf-8?B?cDk4REVpdHFvZTdyNXpKWnRNdnQyZi95ek5seWhMLzdVUW1lK1lFN0Yvc3Zi?=
 =?utf-8?B?WVhIR0QxQmtUTDZMazUrM1RCelJvVDhSZDRHNmI0K0d3UHZNZmlYd0ZSNTYw?=
 =?utf-8?B?Y3hhOHQ4THRXVFYyL1NwUEFrNDdKbTlGUEVQakQydGNEQlFHZGNSMmN1MjdW?=
 =?utf-8?B?Y2JVaEJrcXVVYWZ4dHpucEZxOWhMcGgzU2liT290YmdCQk12ZWJCQWgxNWR3?=
 =?utf-8?B?WkdGS1d1N043RmRacGJLMkp5TWJuSXV0WWxWUXV0L05qVUNoeDRqVmVGbDgy?=
 =?utf-8?B?dWNHR1VMdG91UVZhbytEY29vcTBDMVhoR1dYTjJpektwb0I4ZFpzcGduQXdB?=
 =?utf-8?B?Qm95dEVpTDA0Y0Jub2NDdFFvQ0lnOXdBMWVDNThBR2s0OGN5a0NZeXNJTHpN?=
 =?utf-8?B?WUdObVU1OGg1b0hJMnlpK3N0Rm5NNkphZ2M3R0pXUG9XcTY4N28wa0tQeGNh?=
 =?utf-8?B?ODBrbWgxSDQyTzdKVlBmM3JEbjRyNTFmWW4zL0RDcmw3dXZITmlPZGZqUy9P?=
 =?utf-8?B?YmNHdWc0eDA5amU1WXltV2loaXJ1L1B4SUN1MHFJTGVUMm9lSU50c050aEJ0?=
 =?utf-8?B?ZWtFeHEzZ1dGZXRRQjNIUVFtTklRcnQ5N3oyd3B0SDFjc1FDSXlETlJKYy9L?=
 =?utf-8?Q?ni5nbg3gyuwbHA4HT5U81Zgv24sFkQT8RX3oTFn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(7416005)(376005)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0dXVGEzaTBYVjFTMC9uQVN2a1drbm9Mc1dwbFFuVGdYdVVSdFRZUms5WVh5?=
 =?utf-8?B?amlpNVBsR1F3TmZvTy9lb3pZL0JEZUJUUzFTSys3K0NWT2ZvWThPRzlaby9E?=
 =?utf-8?B?eE1DdUZ3UjBGNHNUZDcxUlBXeVdVenNId0ZjUTd3Y2M2dlcvV1pEU1VDUlVN?=
 =?utf-8?B?OFg2NGZkRHpjWDR0SUpiSGxBYjJvTWxzeGRLRzR0SjlsaEtGcmVPM1AzQlN0?=
 =?utf-8?B?Nm9CS29iYlhMRGJqaDVqNFhkVzBYeUtRa2JVZTljR1pYb1pxODRUTkI0Mjg1?=
 =?utf-8?B?MnZVOU9KRUk2Q0pZZ1ZzZnVzemlZQ2piMndaSFFqcnhsY2o3WmR6ZUlYN1lY?=
 =?utf-8?B?akdQVnQ1UzJJeldvdFh2aUZaNkdOQXhjVjhmeEZnQlAwenc1NlB5ZUQwbWdD?=
 =?utf-8?B?UEZXdEIrd1FUTFBUTVR3WmRaNHFzeVJEVllGWlRVd3l1Tmp6dXlvT1hVdVNu?=
 =?utf-8?B?SExhMFd6czVJeG1lN05vNzNoZGpEZHRJNDQ2VkwraWRBR0VrWHFoVXphRGtT?=
 =?utf-8?B?WlY4TkV0ZUJDN2V5L1FmUktITVVscHFvUkt4WjBFekp6d0lMY0ZEdkZKakd3?=
 =?utf-8?B?alM1YzF6M3A1eXZOK3hCK3ZXT0pGWXpWNEhlMVE0UDVaU3JuTnlmckx3SmRB?=
 =?utf-8?B?dGJHQldNa3Uvbm9uVjJGbmJ3YXFMUVl1ZTBHaXQvL1BCMDhnRHdJU0pKMXdT?=
 =?utf-8?B?TnU1TGRmY1FUNmFXdW04bmx6dEZwbjl2RWdvWW1sdTA4bkxDQVh2d1cyZTdU?=
 =?utf-8?B?ZE9LK1FQNzB0UUNqVHdEMkNFMHVzWEFZNXlKQTd0UjhDWjNYU1dLMTN4eENG?=
 =?utf-8?B?QTBnQ1R1aDlVQ0sxTDgwUjFNMkIwaVhDRlU0Ty9qT3VaSkVGb0VWbDhiVWds?=
 =?utf-8?B?WE9nSWxnZkFEVGJlNkZYRXBxV2dqV2R0N05LeW5Ybkl5TVRUR2dyWHQvV1M4?=
 =?utf-8?B?OHFwQnZmWDFkTGNSL0VMRXJRbDJKRDRPTXR4VUw3OFFCeDF4N2QzcnZtaC9l?=
 =?utf-8?B?bHladmpxS1U5RUFKb2hDa1FFcThXOEszR0ZKMDdWU3lpMzVoWnc4L2UvUldB?=
 =?utf-8?B?clZCTWt1cTdwdklHU0hqdGR6U3BPNlQ4ZjcvMmxXMzhCTm5Oc2MyS2Y0dEpI?=
 =?utf-8?B?UGI3bklIRzAzb3JEMExnbjNZV0Y1Mk0vbDBRcnRYd1N6K0VscDdvQWhZdmJp?=
 =?utf-8?B?MGVnd3FjK3R6a3hnenRCb0Z4V1lLbDNSVDhOMS9IcnJ5clgxMVIwSE5jNGV4?=
 =?utf-8?B?RnRQU3kyZkJKT2hoeTRPWm4zQ050Y3h1dUtyUFZBSTNjTXAvY3hJWlJtcVpj?=
 =?utf-8?B?Q2lBT09xTjdrNTFaTERZWkdUL25QN2gyd3BXYTFLM2lkRFVYMk9TcGtOcWJr?=
 =?utf-8?B?MnRvMHBKdTZFZ1VjVDdxVk1ZTHBwOFYxc2JjQnNYSW1aZEVWaVpNSTlDbFl4?=
 =?utf-8?B?R3QrWS9LN1lzMjFhM092UU95RXc0dnY4MG1jUkQ5QXJGNVQ2MEVCQmk1WGZH?=
 =?utf-8?B?RjBYWnVtVFE3VEpDWFQ3VGtpOWwwdGpJeUx5bklUeFRjK2szU29GMmFxMmhH?=
 =?utf-8?B?V1lqN1F3UE8yV0RlK3hxUFZBRDI3RitDdkl1WTg2cmpTYWNabFNNUGlTKytJ?=
 =?utf-8?B?QmVpRjFVVENmdExhZFBmTmsyZmVzT0dIUTNMRWJlRWsrQlBnSzVOaTEzZzg3?=
 =?utf-8?B?QXgzbFBrUTRRSmliNjMvRVIraXNEVDlWMDkveklZUU1GSWVXd09ObHcrMEx6?=
 =?utf-8?B?anM4KzNRYW51UW9ZRGN3SEpCTmY0OXNIZHFRWkVSbENZV0xrZndCMXBDT01z?=
 =?utf-8?B?VTZOME9DRHNZN2pqdjB5dzlVbDFFRk1yOHhsZkFyRDFZQ2NYMEVDSDkzR3hU?=
 =?utf-8?B?d3NEZnV1Q0oxQzVKMlBSdTRFZDJ3blhqV2pQZEMvZjlvazBUVW4zV3ZBRmlw?=
 =?utf-8?B?S2dMZExsOFc3VCtEamE1dXAzTEpvaklqNlBwSG5RUlVKS1czTVRLSWhhdE5T?=
 =?utf-8?B?TEVMemg3Ym1IcGtTM1RCM0dUT3luQUlOTk05RkRrMFJ0dnBBUCs1NmxjZlRV?=
 =?utf-8?B?WEl6d3JJQXpYeDc2bXlsdk9xbHZ2R1hmQ2tsQmpaNnd1KzRSS2h5bFkxdmpq?=
 =?utf-8?Q?4B2dRu+yG17mEI9vHkZ0jdApl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e6be23-a1be-457d-5860-08dc759e4e4a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 11:49:56.1957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OVTBKWGl3KPvCFhEsMVx6o3MUlhRCbPRu3DvPKVN4/vPBfdoBLO4MJnSLD3ZI++
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6292
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

--------------OoID9kdSa8WULbN9zk5KBfFF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 16.05.24 um 12:13 schrieb Daniel Vetter:
> (Long w/en and I caught a cold)

Handing over a coup of tea.

I'm fighting with a cold since last week and I think it's one of the 
worst I've ever had.

(On the other hand every cold feels like the worst you ever had).

Christian.
--------------OoID9kdSa8WULbN9zk5KBfFF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 16.05.24 um 12:13 schrieb Daniel Vetter:<br>
    <blockquote type="cite" cite="mid:ZkXcVVt_G3TEh2iP@phenom.ffwll.local"><span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">(Long w/en and I caught a cold)
</pre>
    </blockquote>
    <br>
    Handing over a coup of tea.<br>
    <br>
    I'm fighting with a cold since last week and I think it's one of the
    worst I've ever had.<br>
    <br>
    (On the other hand every cold feels like the worst you ever had).<br>
    <br>
    Christian.<br>
  </body>
</html>

--------------OoID9kdSa8WULbN9zk5KBfFF--
