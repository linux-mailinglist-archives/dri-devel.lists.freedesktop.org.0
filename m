Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BCE45A635
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 16:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7A96E0F6;
	Tue, 23 Nov 2021 15:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB736E0F5;
 Tue, 23 Nov 2021 15:05:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFva0cTqAIvpm4oXntduDl4kEhwaedrKSn7u5DYT/3mMJDmbwSyjagd3wCbv+RdLoQpcFZ8UzrFV6t1ORt0UQqld+OYZapraY6Q1CN/ujjYDz5WhK/4wwQfg6pRqu51kQJfMtPT7MI64Yhfr7sTIsADOnWZPtsdqdaOIGcLrHXWiDe2ivbfDoQQhWwKmbCDghrzNiUKPJhfsc0eSlssdbrwZBMHXXyoR1ujpF5gWfAkcXnNWwE3JJLsGqk3G/TEFVkX5WdgToywHUzTQq537anspgRzn28Usz1W4xLSYTEqzYZ4tBe8GKQImAs/P52MyU6wBz7t7lwzRZlrY2o5W0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODESbxx9rH9Wy4axBg7KBmYJwXTLpb8pFkCf24qwP54=;
 b=HgQDDfHvtqfvzt0eqIkljXd2VRutnEKaoQAD3+O30ytKGs+x7tIFTekO+dR7+zVeJqyOomuIEBu6nBtd+hM3va+fmiePoka2t3sfrOOJq98NRMFlN3Cz+lq5PjPt1ZaCkAoii8GB7uX+PRL7wWYkpnGHW/gbGhHVuTLcMYrd/eZUjVSLtkbRnySL5LGLBwacPquYKmenYoUwoRl6LeWn2vB3hybRkxBveUiIAAiHTPe+enL4F23Zp16SHHhRPSF688sDUra8kXkIOHpe7hl/p/0AM6M0CmGm64G1FNL4PGSlsrU7/NYoQroiSzvAe53fp9LtdvtVNzrTwJsYN21OTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODESbxx9rH9Wy4axBg7KBmYJwXTLpb8pFkCf24qwP54=;
 b=slTuYxs9mrBLTviaj3Y3JFsLsCNjsx3EQrcpZACHcn50D2gsfCm82EYKkYGpBh8XaT/tfJcdemCkmxUECWmk0hxnkqlTz3oXWeopw6/qem65bNGi3iF7VNIZ4Wu+VR1baxXePxZ4U5oVPNT0hByaNA8T8GnI7zVk8xPbe8Xcito=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5428.namprd12.prod.outlook.com (2603:10b6:5:35c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 15:05:08 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%5]) with mapi id 15.20.4713.025; Tue, 23 Nov 2021
 15:05:08 +0000
Message-ID: <2a2684e6-f5d6-c917-6f0c-8dc3704ddaf6@amd.com>
Date: Tue, 23 Nov 2021 10:05:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Content-Language: en-US
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20210906213904.27918-2-uma.shankar@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0124.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Tue, 23 Nov 2021 15:05:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f20dcc29-492f-4406-0cf2-08d9ae92a3b9
X-MS-TrafficTypeDiagnostic: CO6PR12MB5428:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5428C71E44F0697D08B0C1F68C609@CO6PR12MB5428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RNwiaEvYiQkOQjma4QEzWhaORD8Jpv7r3COzD7XqMq3HKCN0U+kkichyAZfufBcf8xN5VG1dzpRuMMrFkKZqQ4fzi0eitdjrFGPNd/j7/17dIOLW2owKAd/w/Wu051B3NH9h6q1iOj2M/ofv8BWqQJAAxKkbs6ikpWvSD1JKxP4tW8DtMYyzJOhRhHJRKBKp5THHw4RAZstorfCfhNN+iirHMe13pzZkDdenVI2ZQd1L4OSlzJKfYFZvwjaRKySPNndET6gVZ3AMOGrsKSj0nJzdbr3ZaHX/5+JQ9KA0p2IdU2HTpWyEBw3t2WTA8M82MwZZuhvcb4rmpqfbr1+jMMYoYZSqEbGW7D/efVjLBZMPBBgGUkeWbCFAkG6nn2hzqSxWN+R5/fhFpjGEPBs++9dOW8OXLzhBGbTYQ6iAVaLCFBpvy8T3Pq8DI3wGpWKjoos6mtlvULclADILnz1MLbhnFz08ruWNLuNT5AJqPqcy8cyvmr1ZTO6uvolTTaEz0675lzcLTujQiCPN6UPiUA6rLx0y74doUgAZ5xwPyKIexxDOiTloCvgKqkavCTHVYRO5KrdFrJTLLGsjL3Tw0z7eqZZIJ2k03RIfSVM7khrF+w7UHW5P5C/mkmklwsmFdZqXEGi9uArKgxlgpSnghD9DyKuz9lUeWmmjM6sllw5gmCl6gjLHYXAGpWIFlSTP/r9colDHHThT+9QXMa/Z1MrrL9q8XerxLgl79yQs3yQkujGqKyhqsR+eEZoec2Nx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(2616005)(66946007)(5660300002)(31686004)(4326008)(8936002)(16576012)(6486002)(86362001)(186003)(2906002)(26005)(44832011)(316002)(31696002)(38100700002)(36756003)(66574015)(53546011)(508600001)(83380400001)(66556008)(8676002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qkd5UGhTM3BFTlg3YzZqc3pGd2RwVXN4R2k0RnlPTHdkRUFYWVJUYTJZVTMv?=
 =?utf-8?B?dWc4cFNrdnRlaWo4VHNHWFU5Z0RQRW42UjZmZjNKd2F6WjBhQ1c2ejZ1czNY?=
 =?utf-8?B?d05RSjZndFpIY0NqVFpQNWM4aVRFSkhKS016Rkx3WmkzcENHZ0FtZSt0bzZD?=
 =?utf-8?B?VG9HSS9TTTRuRjVaelBXZ2lVc1VmSHR4MmZXa3JpUmpyZldxZFRYbFkxaCtR?=
 =?utf-8?B?V09BUm1LZEwrVHhYdHlwa2lzMlJUSjIrQ2dXL29oYlh2Y1JYVHZHNndzZjJw?=
 =?utf-8?B?S2t3TkY0VmRGUmNwVlMrQ1dWdEJlK1hOWUtWc1J2RTdQVzV2NW5YZnJyQkRx?=
 =?utf-8?B?MjdmZmNycWVRdjRNeHpWTUFIbnZoVGp3aDZOZmlZRFY3QUhUUVZneld6WlFT?=
 =?utf-8?B?cUJYYWt6aGJTR2hac2lsNWx3QXZXU3dUQVdPTVVaQ2NUL0RWanFpMUdjNGVT?=
 =?utf-8?B?WTlKSEFRdE0zQ0NyRnp4TTVSUW9jM3puUzBIRFdUbm1tTmRyVk9KWDAzV0RJ?=
 =?utf-8?B?UUg1WGZHZXBrUUI0NEFKUEd3enNQdUF3cVkxZDdxYmJjNVBFZmZROW02aFZN?=
 =?utf-8?B?YmRwSi9WS0pGTU1FS3d1QTFjUUUvZWJZakQ0ZjFPU3F1eGVSUW5vQ2lFaklv?=
 =?utf-8?B?NjBzbWpVODdmcU4zelBvaEJoR1EzT3RMcnAzZThKRXNpZGdWalRCc3pjMWIw?=
 =?utf-8?B?NHk2VVB4WmI2bCtYR1lDbTRzSWRuMEUwMFBDeXg5WllWVTRjWHg0UHVvcnJB?=
 =?utf-8?B?L0x0YkZBNmdjMlpEQ290YkVXUlBTYTFxUjFQakFIU1VjZ1dSbXkzK3F6M3ll?=
 =?utf-8?B?MkxVcHQydHlRU0UvMVR1aFlNSXJiTkMrUkJRSzdZbUU2Ukgwa0ZyODM3aHli?=
 =?utf-8?B?UDhKL3U0N0gyRWhRM3cwZ09JcW9MNVBGSWNPc0IydngvTkpZSlZHeHdMaVNF?=
 =?utf-8?B?aHRDdFd1Z0NDY1JXWFo3ZlFUR2FiWXlhZ29oZUZHT2FhaXJUK1Vnb2RLMHlJ?=
 =?utf-8?B?Q0pNMjgyUE0yK01ZOHFzbGtJaHR4ZWY5WFVyQjlYSzZyT2UxM3JpeHF6d25L?=
 =?utf-8?B?NmpBKzNOaVcxMmV3M1U0d0E2NUpyTEhoQmRXQ1BxTTIxVGxacXFZWUVwOGNG?=
 =?utf-8?B?QWxOV20vc2RUSllnZUhwQVN2TlEyUDFwblFHYUtCN1VSdDlxTDhqMWJOdzZq?=
 =?utf-8?B?Vmk1S1Y5dXdGTzl3UXFKZzJqUWZ0Y011M3dhRkNYWG5PRllTQ2g4dXRpYUVG?=
 =?utf-8?B?VDdPYnQwSy9TOVpNb1c2YStyaDNia3o1c0tsOVZ3MHdXYTlFT2Qydlg4OG9l?=
 =?utf-8?B?cHA5cCtFUVBNS0FYeVJzRXYvc2R3ZklpSmJqaDQ3YlVtQVNIWTU3WmVzbHhB?=
 =?utf-8?B?NXIvdXEvcnBDczFFVjkxNG1RVVdnaHRGUWJsZ1JTVFpUd3JKV21VZFVra1JC?=
 =?utf-8?B?M2ZIcHp0c2lhUXJic0IremhCbEtDSXBhZ1hldlYwRTFycW5zbEE2aG9KdWdP?=
 =?utf-8?B?V2lQL3FyL2cray83VzNhcGs3RFlnS3ZHem1tWFVPT0hvTTd6YVdPOVFJdTBO?=
 =?utf-8?B?aFRGck1ad1RBc1JJbDVEbm84WlU3Z1pJWWR3WmhCQy9kTnVteTE2OEY3Zzd0?=
 =?utf-8?B?aW95TlVWMW1NNEZSMzhBdHFmRjl3RWZkQXhvdzdTclpsS3Jnd2N1QUFyYnZC?=
 =?utf-8?B?ZjZCbTUyTy9PRUtTWHppRGhET2pZV2hsaWVvbGdzSHA2RGZMUVFsREpFOFJE?=
 =?utf-8?B?aytHQnBmYTNaYU0vNCtQQXd5KzJTY2wzZWNLWXFDM3RrcUlGbVFsdUxUVVp0?=
 =?utf-8?B?aHN3dkgxM0gwcmNoRnBtQ21IYU4vWTc2N1p1c1d1d1VXK05wSUN5SzFXT2ZT?=
 =?utf-8?B?enJ0K0NlTWp0TzdlWTlzTkQ4NTlmdFVtYVJ1aEU2eGNlZnZzdVNPOTQwMGl2?=
 =?utf-8?B?WDNyTEUvaUkzS0l4bHhyWkMrN3hSZkhiRmRSSDM2NUdSd29zenZ5VTZpcExN?=
 =?utf-8?B?TmVnN2tYbG5xL0dFTjl4dlErVGU4OE0zUXYxd2JHbkEzZ3R4emdkUlFqUklL?=
 =?utf-8?B?SkRGdXlSQzczY3hWUlJKazN1Y3NlK1JFVVYxVXRHWG5pYUhNTGlQT1RwVVNr?=
 =?utf-8?B?NThuZWZrWjBIejYrSFVxYmdMZ3J4Rm8wUmFvcHVKeWgyaXY2ZGpDNUZmMkll?=
 =?utf-8?Q?LG2ce+Mb4s8mOTzmAECecfI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20dcc29-492f-4406-0cf2-08d9ae92a3b9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 15:05:08.6729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zcXvw2u3XPwvFhZl2asFoCnLtpS0YLiKg0ik1MZpg28L6yJOT5yfXIAAIvO561ETUzNOUbQYEiwiBsP4fUrSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5428
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
Cc: sebastian@sebastianwick.net, Shashank.Sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-09-06 17:38, Uma Shankar wrote:
> This is a RFC proposal for plane color hardware blocks.
> It exposes the property interface to userspace and calls
> out the details or interfaces created and the intended
> purpose.
> 
> Credits: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  Documentation/gpu/rfc/drm_color_pipeline.rst | 167 +++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/drm_color_pipeline.rst
> 
> diff --git a/Documentation/gpu/rfc/drm_color_pipeline.rst b/Documentation/gpu/rfc/drm_color_pipeline.rst
> new file mode 100644
> index 000000000000..0d1ca858783b
> --- /dev/null
> +++ b/Documentation/gpu/rfc/drm_color_pipeline.rst
> @@ -0,0 +1,167 @@
> +==================================================
> +Display Color Pipeline: Proposed DRM Properties
> +==================================================
> +
> +This is how a typical display color hardware pipeline looks like:
> + +-------------------------------------------+
> + |                RAM                        |
> + |  +------+    +---------+    +---------+   |
> + |  | FB 1 |    |  FB 2   |    | FB N    |   |
> + |  +------+    +---------+    +---------+   |
> + +-------------------------------------------+
> +       |  Plane Color Hardware Block |
> + +--------------------------------------------+
> + | +---v-----+   +---v-------+   +---v------+ |
> + | | Plane A |   | Plane B   |   | Plane N  | |
> + | | DeGamma |   | Degamma   |   | Degamma  | |
> + | +---+-----+   +---+-------+   +---+------+ |
> + |     |             |               |        |
> + | +---v-----+   +---v-------+   +---v------+ |
> + | |Plane A  |   | Plane B   |   | Plane N  | |
> + | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
> + | +---+-----+   +----+------+   +----+-----+ |
> + |     |              |               |       |
> + | +---v-----+   +----v------+   +----v-----+ |
> + | | Plane A |   | Plane B   |   | Plane N  | |
> + | | Gamma   |   | Gamma     |   | Gamma    | |
> + | +---+-----+   +----+------+   +----+-----+ |
> + |     |              |               |       |
> + +--------------------------------------------+
> ++------v--------------v---------------v-------|
> +||                                           ||
> +||           Pipe Blender                    ||
> ++--------------------+------------------------+
> +|                    |                        |
> +|        +-----------v----------+             |
> +|        |  Pipe DeGamma        |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |            Pipe Color  |
> +|        +-----------v----------+ Hardware    |
> +|        |  Pipe CSC/CTM        |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |                        |
> +|        +-----------v----------+             |
> +|        |  Pipe Gamma          |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |                        |
> ++---------------------------------------------+
> +                     |
> +                     v
> +               Pipe Output
> +

This diagram defines what happens before and after the blending
space but did where does scaling fit into it? Scaling can look
different when performed in linear or non-linear space so I think
it is important to define where in the pipeline it sits.

In my view scaling would happen between plane degamma and plane CSC.

Harry

> +Proposal is to have below properties for a plane:
> +
> +* Plane Degamma or Pre-Curve:
> +	* This will be used to linearize the input framebuffer data.
> +	* It will apply the reverse of the color transfer function.
> +	* It can be a degamma curve or OETF for HDR.
> +	* This linear data can be further acted on by the following
> +	* color hardware blocks in the display hardware pipeline
> +
> +UAPI Name: PLANE_DEGAMMA_MODE
> +Description: Enum property with values as blob_id's which advertizes the
> +	    possible degamma modes and lut ranges supported by the platform.
> +	    This  allows userspace to query and get the plane degamma color
> +	    caps and choose the appropriate degamma mode and create lut values
> +	    accordingly.
> +
> +UAPI Name: PLANE_DEGAMMA_LUT
> +Description: Blob property which allows a userspace to provide LUT values
> +	     to apply degamma curve using the h/w plane degamma processing
> +	     engine, thereby making the content as linear for further color
> +	     processing. Userspace gets the size of LUT and precision etc
> +	     from PLANE_DEGAMA_MODE_PROPERTY
> +	
> +* Plane CTM
> +	* This is a Property to program the color transformation matrix.
> +	* This can be used to perform a color space conversion like
> +	* BT2020 to BT709 or BT601 etc.
> +	* This block is generally kept after the degamma unit so that
> +	* linear data can be fed to it for conversion.
> +
> +UAPI Name: PLANE_CTM
> +Description: Blob property which allows a userspace to provide CTM coefficients
> +	     to do color space conversion or any other enhancement by doing a
> +	     matrix multiplication using the h/w CTM processing engine
> +
> +* Plane Gamma or Post-Curve
> +	* This can be used to perform 2 operations:
> +		* non-lineralize the framebuffer data. Can be used for
> +		* non linear blending. It can be a gamma curve or EOTF
> +		* for HDR.
> +		* Perform Tone Mapping operation. This is an operation
> +		* done when blending is done with HDR and SDR content.
> +
> +UAPI Name: PLANE_GAMMA_MODE
> +Description: Enum property with values as blob_id's which advertizes the
> +	    possible gamma modes and lut ranges supported by the platform.
> +	    This  allows userspace to query and get the plane gamma color
> +	    caps and choose the appropriate gamma mode and create lut values
> +	    accordingly.
> +
> +UAPI Name: PLANE_GAMMA_LUT
> +Description: Blob property which allows a userspace to provide LUT values
> +	     to apply gamma curve or perform tone mapping using the h/w plane
> +	     gamma processing engine, thereby making the content as linear
> +	     for further color processing. Userspace gets the size of LUT and
> +	     precision etc from PLANE_GAMA_MODE_PROPERTY
> +	
> +This is part of one plane engine. Data from multiple planes will be
> +then fed to pipe where it will get blended. There is a similar set of
> +properties available at crtc level which acts on this blended data.
> +
> +Below is a sample usecase:
> +
> +  ┌────────────┐      ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
> +  │FB1         │      │Degamma Block│     │ CTM Matrix  │     │ Gamma Block │
> +  │            ├─────►│Linearize-   ├────►│ BT709 to    ├────►│ SDR to HDR  │
> +  │BT709 SDR   │      │BT709 inverse│     │ BT2020      │     │ Tone Mapping├────────┐
> +  └────────────┘      └─────────────┘     └─────────────┘     └─────────────┘        │
> +                                                                                     │
> +  ┌────────────┐      ┌─────────────┐     ┌─────────────┐     ┌─────────────┐        │
> +  │FB2         │      │Degamma Block│     │ CTM Matrix  │     │ Gamma Block │        │
> +  │            ├─────►│Linearize-   ├────►│ BT601 to    ├────►│ SDR to HDR  ├─────┐  │
> +  │BT601 SDR   │      │BT601 inverse│     │ BT2020      │     │ Tone Mapping│     │  │
> +  └────────────┘      └─────────────┘     └─────────────┘     └─────────────┘     │  │
> +                                                                                  │  │
> +  ┌────────────┐      ┌─────────────┐     ┌─────────────┐     ┌─────────────┐     │  │
> +  │FB3         │      │Degamma Block│     │ CTM Matrix  │     │ Gamma Block │     │  │
> +  │            ├─────►│Linearize-   ├────►│ NOP (Data in├────►│ NOP (Data in├───┐ │  │
> +  │BT2020 HDR  │      │HDR OETF     │     │ BT2020)     │     │ HDR)        │   │ │  │
> +  └────────────┘      └─────────────┘     └─────────────┘     └─────────────┘   │ │  │
> +                                                                                │ │  │
> +                                                                                │ │  │
> +                                                                                │ │  │
> +┌───────────────────────────────────────────────────────────────────────────────┴─┴──┘
> +│
> +│ ┌─────────────┐      ┌─────────────┐      ┌───────────────┐
> +│ │ CRTC Degamma│      │ CRTC CTM    │      │ CRTC Gamma    │
> +└─┤ Use to make ├─────►│ Use for any ├─────►│ Use for Tone  ├─────► TO Port
> +  │ data linear │      │ Color Space │      │ Mapping/apply │
> +  │ after blend │      │ Conversion  │      │ transfer func │
> +  └─────────────┘      └─────────────┘      └───────────────┘
> +
> +
> +This patch series adds properties for plane color features. It adds
> +properties for degamma used to linearize data and CSC used for gamut
> +conversion. It also includes Gamma support used to again non-linearize
> +data as per panel supported color space. These can be utilize by user
> +space to convert planes from one format to another, one color space to
> +another etc.
> +
> +Userspace can take smart blending decisions and utilize these hardware
> +supported plane color features to get accurate color profile. The same
> +can help in consistent color quality from source to panel taking
> +advantage of advanced color features in hardware.
> +
> +These patches add the property interfaces and enable helper functions.
> +This series adds Intel's XE_LPD hw specific plane gamma feature. We
> +can build up and add other platform/hardware specific implementation
> +on top of this series.
> +
> +Credits: Special mention and credits to Ville Syrjala for coming up
> +with a design for this feature and inputs. This series is based on
> +his original design and idea.
> 

