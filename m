Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B037E4F9D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 05:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D06810E375;
	Wed,  8 Nov 2023 04:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAA010E375;
 Wed,  8 Nov 2023 04:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neyhdcWQe4waLab/G4sIU5ZDwvQYdwJuOyyZOQnNyHp/cH+9sYqrvvLSRJQVRG6/E3OCWCs95RRdy+bnZeoHM1DCAEWlxoTsZEI8fbX2lddb1m7Xqt7fekM0s3B/m/R/c3g3H8ZKSfDCtJF/7rICEu3IC1RzKO2b113n9Y0DQ5vpgNghodDPP+AHlbpME4UD/bDSW67I+ge7f3LsTMhN4w6tPWplesVZUiAom/TjYnmdNheE+/clCb7uU8X+Nmnuzh6U1pm3lv83ev2pRI9/L4iRQSOH+qbROgu8ETGFwPvn74klVlAWYA03fmDXb1yj2woORhBTJXNLxqFzhsdyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzXBUWkaRKrybs/a1L6ShWowUektlt1gg7GCMQM5IqA=;
 b=YkUS+2y43MSnS2d8tcIVsr0wwK4RWz/h6igaRqPWo0Wqq2g9cQCI+hPiFDfxIqFahJSal86kF/LClNUTc6bLOnfQrKzqKu8UaSlSuvrQ1j4Ip+p3VZHvFAhn9otCkS18CpvzZbUm6BEtWSk5Qo5l8ij8vJYic0dQLNJRg2CWFnzrcXgigQhDkoo5jmAQmPl+j9daq3wMCa5IBIGilDRcgAR0lQGO7siztUcJ4FOEDqjxqtA8DRxp9afWj26pi+tCycQJ49muODcXOd0FexWrJ31Kf14aRpKbf6oKQTiN1Crc0Awywajpq+qztGVw63R88zZePRehBTDagHsKUTFe0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzXBUWkaRKrybs/a1L6ShWowUektlt1gg7GCMQM5IqA=;
 b=UgUqtGK8WPcB8uYnZR7Pn63w4ztbtT+3eU5/Wn06fguEegVTXjvI4eqRPtVodciE53ukGt5Yn1PqEFsQblLtcGUZUDvlPbu3ULwo4M18pe+RoJj4LNvzYPAublOn/d48pktCWRnm6XHQJiISHJzFVoKl7HQHZSpvpPpS5/cHE2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by BL1PR12MB5946.namprd12.prod.outlook.com (2603:10b6:208:399::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 04:08:00 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::ce36:81fc:9c50:c892]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::ce36:81fc:9c50:c892%6]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 04:07:59 +0000
Message-ID: <2853fe7e-7d39-9b32-87b2-93845f16ae51@amd.com>
Date: Wed, 8 Nov 2023 09:37:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3] drm: amd: Resolve Sphinx unexpected indentation warning
Content-Language: en-US
To: Hunter Chasens <hunter.chasens18@ncf.edu>, linux-kernel@vger.kernel.org
References: <20231107162830.36856-1-hunter.chasens18@ncf.edu>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20231107162830.36856-1-hunter.chasens18@ncf.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::34) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|BL1PR12MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f157c9-b9d3-4abe-63e2-08dbe0104a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +jTS520tdq4G03LBhseTLU+Ped6Z0ogoQIwR0gnQw8jtEWOxM5EOOOz7PIV7ESnb5o604SVl13d317mcDqSB+G4ivaEA43ADCwTB0Zi4oUvNEBXMGsRAh+O2zXVCeAxtTVl9kgM3otDVKuhnNA5Wq7fYPwTr1LuegQb1fed4UPrVRJjZl8zuHi2e0BbXVaA+nMsIL73xkRdxyS5wXrIu+T/JInzg46GgzJbEPX8BQEPnXg+OXGftUUcMwzyhV11oxKWN6wRt6cDZO36POk7ZTKq6j5WHZ40lw1lwqICJLewJLj/6q9wS8j8ggwcWtNxZxq3zLD5/3kj4ILuP/nhwcw7NnIuY6k97bYFoqnEdkBdiWBDqPnzkzqj2GLtIZqFoDVuK+lxYOznWLrDwEoNDDd8ub8mDlChuCEegmjfyTa8q/AhkZB+8xHR6/EY+8EfnR8GXWIql0IP1Q4ssj+M2DGWgBxJFQWHKWCpjFKDOnyu6tDJ0digWP+N4YzFwbYMQZLS9uFoXk3uMokgP7vQ7+NBv+Wl3bAWo/jD+FShkoygmHQpJUABdCJKbf9He+G0gjtM9ieI55Lgnp8SkzTn775qNHX7Ei+AXm2KiAWocMYiVibv0QLNoILeJkp8d/Z6fymCUgUzaPirNERd7JbPCZrLq+lt8Pf2mxZvOFG3B/HQbr5hPxN3yRoBjd1pIOkcF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(396003)(366004)(376002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799009)(2616005)(6666004)(53546011)(6486002)(6512007)(478600001)(6506007)(83380400001)(26005)(66556008)(5660300002)(41300700001)(2906002)(66476007)(4326008)(8936002)(66946007)(316002)(8676002)(36756003)(38100700002)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2NCVERiNTFFSkZ5ODNINzA4Q2FuVWpIbHNmb09kb2JkcXhDelEyclBWSXMz?=
 =?utf-8?B?SmRYWE9RWWVnSEJNbmRmaHVSanZFSVBZQm13eVBQQ1cyOEw2MGx4TXpySWhv?=
 =?utf-8?B?ZW5BQkFNa3hMVkhNUnF0b1l4Z0hBT0RjNS9OMjNnUWZEMVMreFhOWFNiUkh6?=
 =?utf-8?B?RHpMWGVXd0h4YlR1QVRMNEt5dEJzMGI5M2VabVpteFVGNjY5Z2pSNW92MFFS?=
 =?utf-8?B?bVNaa2VsNlZZY3hSMVVNbjQxMFpreUZoSEJwR2haSllKUFF2cm9tRzE1Qm5L?=
 =?utf-8?B?QmhRZDU5LytaL0dmd3ExYmU0c0JGRGg1WGJJT0ZvVnZTNzBrL0VFTUd4RHQ5?=
 =?utf-8?B?cFkwemg0RFJvbzh1bkFZb05RYVIzZEVqWUlNS2FTS1BwSWRCM2ZxbEpyVStN?=
 =?utf-8?B?RHdSOXppeGRZMnZxNkgvaGZ6OXFzN0Nxdk4zWGFZcjNUN09qNnUyQ3pnZFA2?=
 =?utf-8?B?WngvTmFWVnVMa1hOd1dYVEpCZVNIZ0V3MVFDa0ZSRG9SV2o1Wi9GeGFnNXBq?=
 =?utf-8?B?YW03SGV5Vnp4Uk8wcWk3emg0ZmhRdlBmR3ltcGtLc1liNWlVYmpHYUJMaFRy?=
 =?utf-8?B?S3RwektQdHlIRlhmUEhWdzdxS2xXOW5xb00zQlhjcmNzdUU4YmJ2TGszdGR2?=
 =?utf-8?B?RWZTRkd2SzlBelpJbzA3azV6TDRJdUtndVorRktneWFYSW1ySjB4NWlzYXl6?=
 =?utf-8?B?S01lMXpxZWZhUFgvL0ZDdUNNOVlXeWZONC82RXQvOGE0Z0dxSEhKWVZFdlNO?=
 =?utf-8?B?SG9UN0JkekJvZXgzZHFhWG9UVWt2K2w3cmlYdWFwS0ZSS0xDSkprc3JBRWky?=
 =?utf-8?B?bUoyOTdZTWNoMURpMVBVblhBK3IxMDNtbndhUkMrUDBoczN5NGZPL29kWHhQ?=
 =?utf-8?B?TXpoNStaVEo4eVptUStDRVNCUmZ3SWxRbGYwbkVZQnMvLytSaERrVHZmZ2tR?=
 =?utf-8?B?SGNqV0Z6bFRKeDd0aU5NeHRLNEZNcUNLTUY5UHlXZVp2WlZPZkhKb0lSNGRm?=
 =?utf-8?B?YVpPQWdYNW80VVBpWHd2cFcyMGFoMmo5cGZ0Mm1YaHloTU1jSitZZ1RSVTE3?=
 =?utf-8?B?NEdRU252eUZoaG1tWnYrMDVXNHY3WUc5Q3pJMjhBUDZuMlBjSTJkajh5bE1C?=
 =?utf-8?B?N0tzUUlvZjJzS0o3UGdYWEJXUHVVUnZTUkc4Uk14QjlTOUY3SUR5OTFDMzJC?=
 =?utf-8?B?TEJQd3dEWDhhN0taNm0xdER2RzJUOFNOSGVoRDFKK3FKYngwVDBmZ3g0OEtS?=
 =?utf-8?B?Z1A0SjVMVG9vUHk3b0RkT0JqMHd6TkwxYmtmbG1HSVhyRjFTSHR4V0tBYVZS?=
 =?utf-8?B?YTZSYnRScGlLdElJSU15SU9Uck5uL3ppdlBXWUNuTDgrS0pPWGhVcmwwSitx?=
 =?utf-8?B?cmp2dmc1bkhJdVptdFNIY2VudnB0a0dZNXprR2hERFZPaWdVMHl6ZXFVVU9l?=
 =?utf-8?B?TGxucEM2VDZDMG54Q0VjbVI5RW5HNFE5bVNZL2dKR1F4RHp2ZVNndm1hV0hv?=
 =?utf-8?B?VklkV0N3cUNMODVMZ3Z0V2h2VkJRYTRIM1A5N1B1WndxM1A2dmtpRlduUHl1?=
 =?utf-8?B?R0Rvd1RUL1lRWmhRUXlYUzlEU205YkViYzRjVy95b3VBRkVjdmdjRVdJR0RM?=
 =?utf-8?B?eHFNcHJJZ1h2U01leTRDNEtqRkNCMWRpTW9qcVBGcTd3YU1JQW9IS0o3UXVV?=
 =?utf-8?B?UXcyYW9HL1FaTXEvUFp6TlZORmJibmtnc1BGOEZWMlJBRTAwU1MrbjJZYm1U?=
 =?utf-8?B?MDlxN2JvcFNwblJtQ0lZOG1HNHNmQmhCaHVkcjFlTVVBYk5GamNKVHRoVEhq?=
 =?utf-8?B?aXFFR3lON2Q0ZFBmcWovWVhJUVYxYWk3UFhDSWNHWVA0QWhKQjEzNEdzbEFW?=
 =?utf-8?B?aW5mdkMzSG5mUWdJTXNGeXdPckdFWGF0ZFc4azRVSkpUa00xbDhQUXpyR0pZ?=
 =?utf-8?B?Ti9HV0h3TkF3cklnODlmenh3aFRNOGlyYyszNzVYYXVPMzloU1dua2ZEZHdY?=
 =?utf-8?B?VUJQY3FETTJuNGxKZzV0eWxhWTE1d015bzZTanVPNnRRcFR4U1NYU2Y5K2Fq?=
 =?utf-8?B?cklVNmpweVdjMldMN2o3L2drZXI1N0hEQk1hK0N3OE5nN0x2NGZwb0grdUVt?=
 =?utf-8?Q?+wrpxf99cdVP7r3Ze4j+DH19K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f157c9-b9d3-4abe-63e2-08dbe0104a76
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 04:07:59.0789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i77XvliEf0grcHJT6kWRMxKEqvv3pMY+aOczmLopHzD/orjjrNLoHztwvCSiRIsV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5946
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
Cc: linux-doc@vger.kernel.org, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/7/2023 9:58 PM, Hunter Chasens wrote:
> Resolves Sphinx unexpected indentation warning when compiling
> documentation (e.g. `make htmldocs`). Replaces tabs with spaces and adds
> a literal block to keep vertical formatting of the
> example power state list.
> 
> Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo

> ---
>   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index 517b9fb4624c..576202bf64f3 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -989,12 +989,13 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
>    * Reading back the files will show you the available power levels within
>    * the power state and the clock information for those levels. If deep sleep is
>    * applied to a clock, the level will be denoted by a special level 'S:'
> - * E.g.,
> - *	S: 19Mhz *
> - *	0: 615Mhz
> - *	1: 800Mhz
> - *	2: 888Mhz
> - *	3: 1000Mhz
> + * E.g., ::
> + *
> + *  S: 19Mhz *
> + *  0: 615Mhz
> + *  1: 800Mhz
> + *  2: 888Mhz
> + *  3: 1000Mhz
>    *
>    *
>    * To manually adjust these states, first select manual using
