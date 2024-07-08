Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF616929CA2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 09:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F74A10E048;
	Mon,  8 Jul 2024 07:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="c4ohIXcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F6B10E048
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 07:00:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6qg81nsRCSD+UoK8NpMBE/UPq4HsfgXxvOKWWUwnMoa6KTdsc0L34RRvfmnaXNcm2KSWH4lfnhSDypVIxn1IB6xLAeLuOIeSxeMYgDWyiDMQ9+ISAMIrK15MhN1MOT6rc5lQnYiZbDF3Tfdgnbxfa3gBHVX5i7m7pELn91ClO1C50zXZCawcP4AaWdsUrcoZyIqWzVtQMOF+43y1OEAuhuVrW/XKwMMz3tChepSgmWrYxpOBMcQgLdUQSyWvA7OWRNGOu8d/6fuWzBeWtxGxOXrwa6YE85p3sOsiwVl+qjrTu0vJ6YGhLm0dse/zDq2YCz/Zgm4lYEI1jfxUqewEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ujfMXvevWHSC/7dJbQQjhsWKGdPnRON/f12g6fqhcY=;
 b=hNqKdYRYmSamOCMYM4w5HCxafg4OeH/lS266DvATClz4xi4vh5KIHCC9zeGO0PNaG/wHJail73Cyuy+Rf3Y/Q0LUL7eWj18ZU53+p6foTSHkXWQU6zitccVQ+vxdSA8/vzKOujnsT68XL1FjQ8dh/j4kODfe8vp4SCUcwh9vbH04x00XEXg8ka4mCrYHyNTu4ZgMexqOmKCX6LMmcNl5N/ISlfOyg1Ep+0XgV8Rt9BUkxktMsC57zdIjmuwHJzzrt7ROEka7/zkMac+3COJKx/UFKnu1IimRrwz9TZmWZag9TYeyGAjiDgjXpvaOs2OIgT3HMIWKbz1cF9JMyUodBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ujfMXvevWHSC/7dJbQQjhsWKGdPnRON/f12g6fqhcY=;
 b=c4ohIXcEjapLiwNs56Ei3c8cwUEGjNTL7Du3HpkAPQrZJcJMuRIq9dnx4mHuMxcKSH7wYeH0JpoANFZQCPa+wsTK5A7OuhPRDtc3iTHucKNIPDxPr8imxuc43inJRlmYv2E4lXJn8q9hw7/GQ1gJmtl8PNVDc+sCDn22dnT2nWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7559.eurprd04.prod.outlook.com (2603:10a6:20b:295::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 07:00:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 07:00:51 +0000
Message-ID: <a5515f50-38fd-4578-ae92-f8fc3e5fb4e0@nxp.com>
Date: Mon, 8 Jul 2024 15:01:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
References: <20240705090932.1880496-1-victor.liu@nxp.com>
 <20240705090932.1880496-6-victor.liu@nxp.com>
 <e2454904-c70e-49f9-b7b6-05ef348c35fb@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <e2454904-c70e-49f9-b7b6-05ef348c35fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcf0100-8ec7-4b6f-4fc6-08dc9f1bb3bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0RXZlFFcitSZURwYVMwZFFWaXgvZ1dOZHZweUxhQmovK3h6cExyUExCTGMx?=
 =?utf-8?B?RENwMCt2RDEyR3h2ejdBL1FwSm5mMTR1MTFTRVFqdGQzMkFtdDNibnBuK1Mz?=
 =?utf-8?B?T0kzUTUzN0x6RjhVMmM0UE1yQUt4WllvZWtiM0FFeHpVcjFvT3FPK3hPaklW?=
 =?utf-8?B?UnpDNjFhSGM2MTBkSFJ0MGVNT1U3cWZvNU54anl1bGRuL0grbEhhVC9PeVFq?=
 =?utf-8?B?WldhOXFDV3AxVjlOd25WY1lSNjZYdjN2MGdzN2c5VWFZT2NwdDZUd2JWZmgr?=
 =?utf-8?B?NGg3WW40czN1alh4MUdUTDVBd3Vua3VKUFdiZDEvR0gxMXdzMjFZd2FFNGZn?=
 =?utf-8?B?WGZsb0JJeGlYQjIzdFdGeHI3d3dJWG9tTzl1N2U0ekw1UWZJTFlDa01WLzE0?=
 =?utf-8?B?WkNPaVlmQmVzM1J0ZWZqMllJbHRQNU1WaThrdFB0UE9qZmpPaytCR2g5c1FG?=
 =?utf-8?B?cm5tMktkeXdZMk5ZbFhtNHVUeTFnUjlzci93b0JoKzFmVUtzYUNka3hrZ1A5?=
 =?utf-8?B?UjBYM1M4SENUN21jeStkZmJpZ05hL0Zxb1Bya0RyWE1hemhFeXM5U3ZNa1FK?=
 =?utf-8?B?T1Z6UTQ0OW9UVEhsa1hVVTM2SG5UbXI5UjN4dHZ4TUJHVWlJWVBXUENSRlBi?=
 =?utf-8?B?RERzQW5GVUJBaVZqdkUweFJKRFZLTkE3Q0ZBQzhUT2NFY0EyWHE3SDhXQ0lq?=
 =?utf-8?B?R2lFUVlKa1htRG1DcTdLUENqeUlDdGYrMDQ2OHlibWlvTFlqeW9kVnBZelZw?=
 =?utf-8?B?OW1hcjFrM3BTNzVJbkVIWjN4eDBrVDVxc0F2Y2xIZlpwcnFjM3BBTG80RHdj?=
 =?utf-8?B?NmRRTngrbG5MVDBrelg4OTJmdUlFdUdZNjFsem8rU0J0azZ1aFlZQk5FTXBw?=
 =?utf-8?B?ZzRkYnh5bGUzSWZOM2xvRkZuRzltT0NhU3RsWmlNZGJvR2ZMbWV3YURNazFO?=
 =?utf-8?B?blJBc1JsclNrU2FvZ1ZEZ1NONTEwdlNiSHJjTytRbEVxMXoyZTRGdXhtdngy?=
 =?utf-8?B?VmlMRmIxOW9aeFpjQ1pkMzU5dTArRWJMVUlBdzJZTS9nLzlCVWwwUjl0ZENu?=
 =?utf-8?B?QzVXR2l5bEFIbGpENitmaXVLZDNvUFNteDcxTC9BQ1FTa0c2MEYzZ3FrVU5q?=
 =?utf-8?B?dFhwazBqVmVrQmRLNTdCSzhwRXZ6VXdBK0poNkZ1Qi9qaXVwWHpsS1J2MXBV?=
 =?utf-8?B?ZFVyeWMzak40RTNNMWtuZStzcmdadURJc2c3bHU1dWR5bnFWMTdLc2ptbk85?=
 =?utf-8?B?aTV5NFZ6cnlxYnBLUVpzU0ZOYVZ3YVJnSm1RTDFaK2gyaEFtNDVyS2xhM0wx?=
 =?utf-8?B?eHR1R1ZIOGVpSlNqU3ZHckY1WjZiWGxkblJkTk5rS0UvS3RkYXkvRXZxRmNW?=
 =?utf-8?B?MWxtT3dmbkxXWGJRVmFJT0gwTTFXME1aV3RYTWhYTVNDNEt5VG5aekNEK2N6?=
 =?utf-8?B?SXFxVGVYZjNmYnpWNlFIcTU5MjlwVmFIazR2cE5taCs2cGlQMUtDSDkrb0Jh?=
 =?utf-8?B?YWk4VlhKNkFpalFvY3FHRDM0RWd5UXY5RVRtaU5QK2ZNWFZmZXk1TFZoUUtm?=
 =?utf-8?B?WG1hMkg0M1FsN1BrZTdtOHM1OXdpVnE3RlRiSU1aUmhNOFJFMVlJc2xBa3Q0?=
 =?utf-8?B?UzhGaW5UTTB1c1N2Tjd5MHEwa2FlS1VKOWxvdVJrRy9ieEczUWg1OVZkL05Q?=
 =?utf-8?B?dXZqZ0I5QWFRMktCaURsOHNKUjhRQnJvQmpsd3UyMzZLNDhrOEtmZjJNeEJW?=
 =?utf-8?Q?MOYr81/paz9yikLux4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm45TmNlZEtkc2FYZ1FwQi8vSnBqcU80TTNWeVFIcVFOVnNpVDF6VDM4NzlY?=
 =?utf-8?B?VE15QTFRek1UZDZEWkdBalAvVEl4S3ZHTlV2S3IzN3M2VlJvMEgzZTE1VU9L?=
 =?utf-8?B?dmhzeWlOL3Y4ZldnUS9DK0dsSGFHaGVlem0rNFNrUUp1V0pITDdNUGp0Qytq?=
 =?utf-8?B?OGpOdUtyVURkQUg2L0QrczBlNlBDRHNUOEdnR21GZHhRaUhDdUFNWXhwL3FE?=
 =?utf-8?B?OG96aHNBdnJiZk4zSmkzVUlqdWZneHgrdzlSYkRRaXljaFN2U3F4ZWR0dW9h?=
 =?utf-8?B?dlpsTTN2aFlLL3M3dWtMTVRiTEZ4aWNTVkVlZmtOTFp6QUh1L3pqSGo1NFpC?=
 =?utf-8?B?NFZNZzFSOTZZVWQ5d0g5cG1KTWZmeWxKTzRiREtuNFhyMmtrYkZOTFFKWGFR?=
 =?utf-8?B?MDJScGRjM24vY1BPZS9lRk5qN3JOME0rM0p2Q3ZVZUZFbDl0UTgvWTZERzZR?=
 =?utf-8?B?L1FCdlNsTGV1eExxUGNnZmJ6QnI1bm00Zmh2U255L2k2MlNDM0FYVEpMOHRW?=
 =?utf-8?B?ZW5ibnVDaDRzOXhVMmI3eVVHa2xlRTh0dkVXR1FwTVhsbzV1d3dYZDREMit0?=
 =?utf-8?B?QVdNTjBEeFVScGRVZnYwMzgwQVl4VDl4dVVNdTBjUE00aGt2VXVnRkZ3Vmdk?=
 =?utf-8?B?MGlmZDZ1TVJqdEo0VFA1cnVlblBDZ0JJa2hNOVgrQjZldWtMNktBUEN1Skk5?=
 =?utf-8?B?a2Z5Rm16RzhuYVJpeHk5VXl5aHE1NlFQeEVWZVBsMUY1RllkVGtMaTYrMEV1?=
 =?utf-8?B?dlZNY05INFJiMHY3WHdwOXhVOW5Ec0ovQXJ2cjljblZuZDAvUEQwR3p3UHd5?=
 =?utf-8?B?VEZjOEFTRG5OcEhXK3l2TjA0YTdmN2VXYzc5OUYwaVlpL1hMTlJ5aE5KM1hh?=
 =?utf-8?B?REFhSGZCZnl3dmdVclJZS0QveC9mMHpBa2MwTUZjNUovUE8weDBmb3FSOVlI?=
 =?utf-8?B?L0REUWFlMk1aS0daZFpzcDRQcHBnOFpPbkFCMkpDbFhMN1pmWFFLNm0vaXVJ?=
 =?utf-8?B?cmh0YnVVVUtuaDFOQXMyQWI0UHlYanBKalMwNUxOTmtCdW1qS3JIYjNjTFM4?=
 =?utf-8?B?dnpPeFByamFodU1oYUJDUDFSSGZOc1YvWmpMTEYrcFRaQ1JQSFJUNERUOXlY?=
 =?utf-8?B?YTBtWU5wRThPZHhLWnA1TGVLUDNrdDVwSEZOVXRJalJmVVU0d08zZEt2Z1pv?=
 =?utf-8?B?OE1wL1BNUGNvRmcxRVc2UndvelhxM3Z3S3BvUitwZ1BXZEJmY3JoUVNNKzcx?=
 =?utf-8?B?WjZIUGxRa0FyN3lhbzhXVkJpOG5FUW9NV1lrK0ZibW1FUmdPUnFnNnNjK1Bv?=
 =?utf-8?B?aGNqdi9DZFJVMFk0T1B1ZjI4TURBbXNPYkJlUklhbXd2bVlRSmRCTHdTQUkz?=
 =?utf-8?B?YVVpY0RCSXJZcCtBa0ZuTVpLOFFaTHN0YU9hK0x1R3hzMTF1dVV1dzJhbzZ0?=
 =?utf-8?B?cm1Xc0tZUk4wNHFobWxGSjVXZVgwV2FkcTZnRUlybG1YVFRmaWN1OFdvc2Jn?=
 =?utf-8?B?RXlMb1ZETTcxbTZ5QmlTUW5TQW0vc3hzM0RLZzY0ckRBZlNSOW15d0ltOEZj?=
 =?utf-8?B?MTRqVThwdVpRdlJqWjk4enY0N3RBYy9VNjhzamhPdC93bm5aU0hwVllIMkR5?=
 =?utf-8?B?RldGYXJ1TlhQVFlGNldwVFA1WXFpTVR0UXZXcUJoTE92VU4yaFh2ZWNiVHNt?=
 =?utf-8?B?Tkg3ckRlUFovRW5OZDZ6T0ZZV3hXbzF4V1dDOGpYODU5L2RkSU5hUytzYm1j?=
 =?utf-8?B?UXM3MnVFOEk0N3NqeUE3RWpDVk1RaXo1azJJM2QzTXlvV2ZjUlBvQkl6TVJF?=
 =?utf-8?B?ZXR4Y0JiZkNKU2dMdFVnYTNnaWZCMDZmbXI2NGVzK1NxUFdVRkFUR0dka3dW?=
 =?utf-8?B?ZWNuajJ0YVkvaGVza1hDSUNETWV4cWxIaTFaT2VuSUthWDlyUVUvZHZCVlNL?=
 =?utf-8?B?ckVBMkw2akdiUUEwRlJSZnpuMFhDS203NWZndzJERHNpMzF0bStwM09UMVZE?=
 =?utf-8?B?ZWpDeTRKelhKMTYxZTNOanBMN3RlRVBFYmloRXo5OXFVUjljU25PUVpFS0Fl?=
 =?utf-8?B?YlovQlNCY21rdHVTbXFEVjNsODl6SGxsL2ZGeTIyWmY4NnQzRzFZNXlUUHJL?=
 =?utf-8?Q?m8NFcpAq8oNrBkTJmHFu8M6Jr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcf0100-8ec7-4b6f-4fc6-08dc9f1bb3bc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 07:00:51.1070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2IzK6EDlmGWfK1TcZ8oMvgoqb/xEjoM/6oRagxkhMHGShoUpSY/OYUvLzHLGqD2xmpyEJ/TaZ6DSlgDHtAHsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7559
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

On 07/07/2024, Krzysztof Kozlowski wrote:
> On 05/07/2024 11:09, Liu Ying wrote:
>> i.MX8qxp Display Controller(DC) is comprised of three main components that
>> include a blit engine for 2D graphics accelerations, display controller for
>> display output processing, as well as a command sequencer.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 243 ++++++++++++++++++
>>  1 file changed, 243 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
>> new file mode 100644
>> index 000000000000..a2ad280d2839
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
>> @@ -0,0 +1,243 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX8qxp Display Controller
>> +
>> +description: |
>> +  The Freescale i.MX8qxp Display Controller(DC) is comprised of three main
>> +  components that include a blit engine for 2D graphics accelerations, display
>> +  controller for display output processing, as well as a command sequencer.
>> +
>> +                                  Display buffers              Source buffers
>> +                                 (AXI read master)            (AXI read master)
>> +                                  | .......... |                  | | |
>> +      +---------------------------+------------+------------------+-+-+------+
>> +      | Display Controller (DC)   | .......... |                  | | |      |
>> +      |                           |            |                  | | |      |
>> +      |   @@@@@@@@@@@  +----------+------------+------------+     | | |      |
>> +  A   |  | Command   | |          V            V            |     | | |      |
>> +  X <-+->| Sequencer | |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |     V V V      |
>> +  I   |  | (AXI CLK) | |   |                            |   |   @@@@@@@@@@   |
>> +      |   @@@@@@@@@@@  |   |       Pixel Engine         |   |  |          |  |
>> +      |       |        |   |         (AXI CLK)          |   |  |          |  |
>> +      |       V        |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |  |          |  |
>> +  A   |   ***********  |       |   |            |   |       |  |   Blit   |  |
>> +  H <-+->| Configure | |       V   V            V   V       |  |  Engine  |  |
>> +  B   |  | (CFG CLK) | |    00000000000      11111111111    |  | (AXI CLK)|  |
>> +      |   ***********  |   |  Display  |    |  Display  |   |  |          |  |
>> +      |                |   |  Engine   |    |  Engine   |   |  |          |  |
>> +      |                |   | (Disp CLK)|    | (Disp CLK)|   |  |          |  |
>> +      |   @@@@@@@@@@@  |    00000000000      11111111111    |   @@@@@@@@@@   |
>> +  I   |  |  Common   | |         |                |         |       |        |
>> +  R <-+--|  Control  | |         |    Display     |         |       |        |
>> +  Q   |  | (AXI CLK) | |         |   Controller   |         |       |        |
>> +      |   @@@@@@@@@@@  +------------------------------------+       |        |
>> +      |                          |                |       ^         |        |
>> +      +--------------------------+----------------+-------+---------+--------+
>> +              ^                  |                |       |         |
>> +              |                  V                V       |         V
>> +       Clocks & Resets        Display          Display  Panic   Destination
>> +                              Output0          Output1 Control    buffer
>> +                                                              (AXI write master)
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8qxp-dc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 2
>> +
>> +  reset-names:
>> +    items:
>> +      - const: axi
>> +      - const: cfg
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^axi-performance-counter@[0-9a-f]+$":
> 
> Node names should be generic. See also an explanation and list of

Ok.

> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
> Is this a PMU?

Will use "^pmu@[0-9a-f]+$".  Thanks.

> 
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        const: fsl,imx8qxp-dc-axi-performance-counter
>> +
> 
> 
>> +        pixel-engine@56180800 {
>> +            compatible = "fsl,imx8qxp-dc-pixel-engine";
>> +            reg = <0x56180800 0xac00>;
>> +            clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +            ranges;
>> +        };
>> +
>> +        display-engine@5618b400 {
>> +            compatible = "fsl,imx8qxp-dc-display-engine";
>> +            reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
>> +            reg-names = "top", "cfg";
>> +            interrupt-parent = <&dc0_intc>;
> 
> Where is this node?

It's the interrupt controller documented in patch 4/10 in this series.
It's a child node in the main display controller node.

> 
> I think this proves that interrupt controller is part of the display
> controller.

Yes.  But, per Maxime, the interrupt controller is a separate device.

> 
> Best regards,
> Krzysztof
> 
> 

-- 
Regards,
Liu Ying

