Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2FFB1343E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 07:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AA810E0F7;
	Mon, 28 Jul 2025 05:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LLv5LYxA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E0510E0F7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 05:39:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=us3gs9q4N+4ipzXZdSy/ZWrzYRuJYWRQq0xwR8x8YWbCZcdEepMQrmMpE7DkgQG0G3p0yu4xGGKYZ35KL3TI9aREAmVP6QHgwwTmJbh0xTsq23bYMl2M221XuTNc7LhVKyFbkD9JMmtLzclUMVa4TO5C0eI47lf/oTPmTSjWYlXspP6vi+B/YWq5Vnry7903N0D/Yzgjju0kVkul5tJp9IS0M6IMPsdGTLyktXlq/LCcJigtM48U8UjXM3Q+HCsW1TaREfhLSUfnDSt/J1oZa6B/UUQGj1FGMvrpHDQ1x52pGLPYpMF44Y182WU+MiD5UsvRl0hjgNJYDj3rXmq2+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn1bDUv00nJHaHQlrIkOP7PQvt8mWixzysq4A116Q8A=;
 b=ysR2EyTiJny/4JBGC52Si/TLxU2pZhDr7/J0iNbId+HeYKt8b3krIiGQ+O2TCAgin1uQhn/k3Wau1S+jkRJRjymxNQTDovSAm9QBmIbMdrb+H8ySeOrCxWYIV+j61tDVqLM4YzkCawa23xQZUhc0iIdQLag9Y8ZnCTE8V6FGOPoxGW+Q/S20Mn65GvNJjVTUg8eeHHuDhhb9MDX+jjaSwTzhCn9+Euj3hoRZjP/6bS+BWvUxHqP2E9eYg6C1pVa9dCGPKLar7i+/0pcsOe5/Be839pdQZtbUdm5fZ1Ozm9oB7AAfVLCgtIQO0P71cVHoLoKOgvf7b/0UFkMqS+QsKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn1bDUv00nJHaHQlrIkOP7PQvt8mWixzysq4A116Q8A=;
 b=LLv5LYxAxyR2xuZqkUZYrDHOcuj/P7DgkOCBHrDwCL24TK4PicCwpQ+gUGvjDgprQxCoQEG4aaci2exIjZL88hbbsH/dKI52PtCU7V8DijWQCIeXek+zSOPYrt6+rXiOe76z7CgUgE14/K6GZpqpUQ0uMXzdNPvkK17QnsHHUzeqFvVQ5LnzNaSYxdYT5xDWvJ3iJT/EgLQ0+4NMllDmmqFoKuIqzHIpwUwSvla+eeuM1YDRVdtHyuHfZGpWX5CQosYq1gDPlt069on5K2s8BTBmzI4weE/NV8Vq/V3PdnxMVvfUMhOmPYb9dGbx+ic9XWHo4Ued6OgAow2fVpKl6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7230.eurprd04.prod.outlook.com (2603:10a6:800:1ab::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 05:39:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 05:39:45 +0000
Message-ID: <4f248bb0-db03-4c2a-84b8-17b80c27f38a@nxp.com>
Date: Mon, 28 Jul 2025 13:41:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vblank: Fix vbl time for IRQ fired at the end of
 display active region
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250618055603.2644430-1-victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250618055603.2644430-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4d4c35-7f6b-4ce9-0e3c-08ddcd992889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|19092799006|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGhQZ3NhTkl2d20yc1phZVhhVFprS0kra3drSU9KQzBvUkVlcFF2cDVxUitS?=
 =?utf-8?B?eWpOWnRhSTBZczlNK0Z2SWpFNm80cDR0L0UyVHhZb202UVFsNHNmK3Q1b1FT?=
 =?utf-8?B?R3lsd3o4RnNsSUNSVEt4U3BCMk5kVHJ1bTZkS25mY3lVU2JVUU9DT2RIVzJm?=
 =?utf-8?B?TnNqQ3VGckI3S00xNTdNZUhrb1JUWDN4R0Q5bTAya3RKbHRWeENodVBCMmF0?=
 =?utf-8?B?VHA5UU1ZUGVzNm0vbldTNlJTUEZ0azBiZitITys5T1o2eTZML2Z6NDVpbENS?=
 =?utf-8?B?YlZEWndxWGNWMVVlT1lGb25lajl1WjdiTTNMdmFEY3lLVXIrK3FISFFJcjEy?=
 =?utf-8?B?UnlrSUhKMVZISzg4Y0FOMTJFTjdUVHlpVHNsbkpablhvdzkyVUtSbk5qem91?=
 =?utf-8?B?SXpnejhQemlNdzJXOUhkaW1FM2JqWkJmUWw4S2kvc2wzZW5FZHNNY2FRS1VD?=
 =?utf-8?B?bnl6bXhiRHlrTW1QdUxuVmRETS9VMEI1UUM3cGo5bkdVODJFWTRhTDg5NEpm?=
 =?utf-8?B?azl6a1B4K1hDK1RsWDN2cUFBcUJIQ1J0ZE1uNmloQmlyYTAya3hmOVNwUXNF?=
 =?utf-8?B?Zm95dUhrMG5WeG5Hbk9meGlleUNQME0vcEJEN2VkR0RCVEd0ejd3bU14TytN?=
 =?utf-8?B?TXl1azVyRE5PbDRxTU4rbVAzdzBJTERVWTUwTDdEdVJiNHhSSUM0U1B1NjJV?=
 =?utf-8?B?TEMzY002a3YrS2dXL2FmUkl4dWsrUldNSm5yOEttL1hwak1TengzelRqL0Ew?=
 =?utf-8?B?N3pLNHVIUm5hbFVuVFZEeVBLcS9vUDFNTGF1eGgrOTV1SFNXZm5RS3NoZGpQ?=
 =?utf-8?B?MUMwMWQ3a2t6dk05emxLV1liZCtWOGlvN25kSisvUkorTWRDNVNxRC9zQndV?=
 =?utf-8?B?V25pZlpiTEdqc1l1NHYyOVQ5VndFOTRWY29rMDZ3SUhuamVKTkdGbFBJeW56?=
 =?utf-8?B?MDNJb3I1UlNTN2dacVJ5YW51dy9OTzFDT1MvM2dpaDA5ZWNTQTFnck9rWWdB?=
 =?utf-8?B?VXdhZXFRN3BtZFRWZzlpNUhrNDBlY2VIUy8rck1PdC9CVG1XWm9IUWFHYysr?=
 =?utf-8?B?Mlh0aGE2dTU5MlQwQmhDL2lIbFpjdHRpSzB3WjM3aXJrdGpxS1NRdmtYSHZo?=
 =?utf-8?B?WGdBMmtHRVR3Q05yYytDSVpMd08wZjhrY0F4NDR0VWxaSHJEQVJnSmNneEMv?=
 =?utf-8?B?dHVMcFNOcW8wNyticEp2amQrcDhGV2VhcWtjMWluNno3NTdPRi9XSXdmVEwv?=
 =?utf-8?B?dU1iY0JObnVCallKOHFYMkNOdkFJbGpuVlpyNFNWdWsrc2RoNTZVR2NkNVVx?=
 =?utf-8?B?dkRWbVhBRXVuaTV3VUV2OXZCWkpIZUttNGFkaEI4ai9kTDNhQzZUMlNhMGhh?=
 =?utf-8?B?aE9WWUpEdDlLRGJ4S055QUI1MlhLdDhudnBNZ3NnRHRPcWxZdGJxY1hnV21N?=
 =?utf-8?B?SlJ5V2ZLRHBqSElNbDdkL0l2R3JuNGx0L1ZJOHZSbWdRRXdZN3lyN01WdWQz?=
 =?utf-8?B?TTlQZFJyc2UwUCt0UC9ZWTFmUHN4a1l3OWNBMGd0V29UbW5mNDhWMWhMYWJy?=
 =?utf-8?B?YW5SVFVESEZlczFBRFNHcDI3VEdsL2NucWk0TUY4T3dpbWIzRHF5VmlKVUtZ?=
 =?utf-8?B?NnVmQ05RRmxOcnNlWDJyN0hzbGdCMnJKSURKUXYrbXNhS1BBL2VuZGsyUW5t?=
 =?utf-8?B?bFVDWFBHTUN2aDNJcUZZSm0vaHpINlJWamtvNjU5bmQ3d2c0dE93YUhNcEsy?=
 =?utf-8?B?ZmNCL0xiY1VXY1N4UDJ3Q09wTHYzWjhiNER2elluRWo2K1YybjErNFNZYXBi?=
 =?utf-8?B?MFIwd09MZC9yMGxwdWUwNHJMN0doNGpIcWNnSk1uemEvY1N2UjQ2by9walhk?=
 =?utf-8?B?S0hjbTJ1c0VGcE80NnRsUzBHNWVoMHhycGZ0RkladmhaQzB4L29NWDJ3OEwr?=
 =?utf-8?Q?f/QGZh8thV4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(19092799006)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnAvRk94Wk5PNE1JRXducXh0WWptcjVwZjljSHJZTEVReGNtRzJaMHhxbitl?=
 =?utf-8?B?Q3JuNFVVRWR6bXVaY3FmdlRMTkoyVTJQTVdTMzlVUVk4RUlWTSt6M2duVWE1?=
 =?utf-8?B?TUdWODBCUVpvREFGTWhlc0pvakdVV3Y0NEFWR1BFYktEM0p6bnUxaGtpdXh6?=
 =?utf-8?B?RFpJTEJFTFRLSzgwSWFsTkJPN2NJelFNNE54NnlxbHBtOGhrbWlwd3NqcjI4?=
 =?utf-8?B?RFJ1TXU4VVF4aHFWTmRORE1BRDRlMmlycWxxcEkxYUE0M2dkY01UekhIN2JO?=
 =?utf-8?B?Z1dCRmI1RXI1K3B0MlVmTnlpd3FPWDRrWnJjMm1ib2ZtRE1Eb000bnpRMXZN?=
 =?utf-8?B?eFgwWXNHMG9xb3Nrci9vbDhmM1JhMm5CY2FHYjVpY21Vai9TWXBzZVJBVTlq?=
 =?utf-8?B?RDBBSFJiLzg4TEJPUmRCWWM1Y3dTZU1DanV6ODM4TVh3MnF6WGh4UFpOVmJo?=
 =?utf-8?B?aFl0czEvQlp2Q1F6cEhmZkNSRXd0WWtkZzNSVGt0ZnM2YU9HQzRqZ2V1RWpT?=
 =?utf-8?B?MTRYS0p3b0dMT3E4Rkg0NjR6TEh1aENjTXBhdWQ2Yms2dEVoZlJhV0xIUzZQ?=
 =?utf-8?B?RmlIVWk3c3dRR3B0em5YaWVtY1ZxYXJTcGU1U0M1UkYwNDNieUtIK1lZdzF3?=
 =?utf-8?B?dFk4VXp3Q25BNFNvaFZyeGJtNUlFQkVBNnRBaTZ6RVVaODM1SFJCanJQaXRl?=
 =?utf-8?B?ejgrcjFwK0NJTC80SEF0SlZTY1lGYzBnd29TWEJJeHEwYUd6ek1pRkNYa25l?=
 =?utf-8?B?cWhpL0NYaGlwRk9ja1h6aXkreTdjS1JsMC9MSTJ3ZmNIcnExVnZyQ1E0ZEhq?=
 =?utf-8?B?Y0xpNUduRXcvVE1Qa3luZkwxVnFkS09MbWJ0SUZFMXRZUU0zZUtaZkRoZjZC?=
 =?utf-8?B?K3dmazh5emlpTlQ2cFpvcmEyN2VlaVd5Y2dMQzJlZVErRGt1dG1pT2dEVDky?=
 =?utf-8?B?RmdWbG1QL2ppMXVZTkVHaUx4WGhYWW9HandOa21nWGVvbkVYUVR4bmpKNjN6?=
 =?utf-8?B?amFmK2xUYU1ZKzl6UDNZalA1S3M0VkVxNzNUMGZYRW96bHBYM2FEK0V2b1BI?=
 =?utf-8?B?SUpMTWpQNEw0NUMxUWhTZnovblUrNEZYMGd1ZXhXb0JoTDd0a3dweGZHQlo3?=
 =?utf-8?B?VnBodUJpdzAzRXVnY0RzSmJybXIzd29rd1YrOE8yajNiRkNrZUhwS2RiQTBy?=
 =?utf-8?B?b0JsVDRnRzk4UkN0QzlaWng3SEdGNGpINC80akwwQW9TY1pubVUxMEp0czcr?=
 =?utf-8?B?R1ZKY2tTdlNEamJCRVhFbnJOL1h2U1JOaWliY1UrcWxabTFGcnN0dUovTHlh?=
 =?utf-8?B?Y3BtNllQM1huV3Bpb3hNeGxHZlI4TUtxbU1rQmZXWFVpVFpjNGQ1dXpTVGVO?=
 =?utf-8?B?QUZDTjZ6TWhSc0Y2VmI0V0ZEZjQybUtwMTRQUGQ0cExwdjZPbzR0WEZvSUhn?=
 =?utf-8?B?bzkyWldkOERTdndHMXNYUkx3ODI0RFVyUS9vM1ljMmUxN25JL1h5RWRJMnhN?=
 =?utf-8?B?Uk8vUzRpUGpDSDBKZlljSEpaaVpiRFl3V2tVQmFxeERENEYrVTZ0R3YwZVdK?=
 =?utf-8?B?cUE0U0tRYkQ1aStqM3J6c3RaeGxtQ0tRQzd6b096RHVGckNia1dBOUU1bUdW?=
 =?utf-8?B?SVlTS2ZDSjhnei9VdTlMYWZKZmFhY2JqMlBpOVp3eTZ6NG9Pc1doclN4QTho?=
 =?utf-8?B?Y3RYVUduYXdLR0U4Y3ZVNWdjenhrb1RUT1ljNTZMK2d4ZEkyenB6QlgwU0hI?=
 =?utf-8?B?YmN6S2dpYXJSc1V0K0RlT2UzQi9lR04rVzhmc2JySHBsT1c4ZzRPZDJWOHNJ?=
 =?utf-8?B?TG4zQzRwLyttZktKdlBYMmlBU3E3Y1lKSHY3UTVZaUE2V0E1aTJEbW1EMXZW?=
 =?utf-8?B?U1ZWdExKa0NZdFhERmtONEt5Y3ZSNDBRYU4vK0NJOVJ1bzUzVnZQV3VXQXB3?=
 =?utf-8?B?Q1ZMOUxKbGhFWUhhZDZncVQwNmhyZUVCZjRUeDdXajNrUTlBVmFCaGZOYnpX?=
 =?utf-8?B?WUk3RExIYXlWUUQzTTUzTWFFRURjb1NoSmsrVTlnZFJMSzdqYXU3Mno5Wkpz?=
 =?utf-8?B?NlpqdVNMSUt2dnZxTHBRMmZ6QWhDMUhxMHRjeGxxQ2tqdW03eDErVE5lb2I1?=
 =?utf-8?Q?cMOfUW2B4khFBc/69c8rEUXhf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4d4c35-7f6b-4ce9-0e3c-08ddcd992889
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 05:39:45.2593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+ITf0gtJrFuZL2IZM9AHPNDEo+a3aIM92/StKb5k749pe+pEfrofgWQZ2h8WdMYTbU0pNDTZX7nmzCGh/WtcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7230
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

On 06/18/2025, Liu Ying wrote:
> Helper drm_crtc_vblank_helper_get_vblank_timestamp_internal() aims to
> return the timestamp for end of vblank from the vblank_time pointer.
> For vblank interrupt fired at the end of vblank, it's fine to subtract
> time delta(as a positive value) according to scanout position from
> etime to get the timestamp.  However, for vblank interrupt fired at
> the end of display active region, the read-out scanout position could
> be at the horizontal blank region of the last display active line,
> which causes the calculated timestamp to be one frame eariler.  To fix
> this, subtract the time duration of an entire frame from the time delta
> for the problematic case so that the final timestamp moves forward for
> one frame.
> 
> This fixes weston assertion on backward timestamp when comparing
> timestamps for consecutive frames.  The issue can be seen with a display
> controller which fires off vblank interrupt at the end of display active
> region.  The display controller driver is not yet upstreamed though.

Gentle ping.

There are about a dozen of drivers that set the get_scanout_position callback.
If their backing display controllers fire off vblank interrupt at the end
of display active region, this patch should fix vblank time for them too.
Land this?

> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 46f59883183d..c228d327bf17 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -782,6 +782,15 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>  	delta_ns = div_s64(1000000LL * (vpos * mode->crtc_htotal + hpos),
>  			   mode->crtc_clock);
>  
> +	/*
> +	 * For vblank interrupt fired off at the end of display active region,
> +	 * subtract time duration of an entire frame if vpos happens to be the
> +	 * display active lines(hpos is in the horizontal blank region).
> +	 */
> +	if (in_vblank_irq && vpos == mode->crtc_vdisplay)
> +		delta_ns -= div_u64(1000000LL * mode->crtc_htotal * mode->crtc_vtotal,
> +				    mode->crtc_clock);
> +
>  	/* Subtract time delta from raw timestamp to get final
>  	 * vblank_time timestamp for end of vblank.
>  	 */

-- 
Regards,
Liu Ying
