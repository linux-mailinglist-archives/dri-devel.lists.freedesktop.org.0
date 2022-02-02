Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FD84A758E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 17:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2E910E319;
	Wed,  2 Feb 2022 16:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FE010E310;
 Wed,  2 Feb 2022 16:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpI3qeZOmlOy7zHniOechIhTpheoyaOzw7nJG9YhFTJhoho8iMxmymsw7Vr4cOuCJw0eIizj/Ol893qcldQp1GKkOAvTe7/rb3FzGKdWON+gmZ1bYBzE2SfylWoTIm39a8Aa1w6pXekctOYZjOOM6UrKlPh1NMrYHbSOqYl67Wl3KtvjNsbszfp59NuAmBcRhT9TnYmZRTLElvUHkamftBTdk5S8EYb2Y2ae5gAnfVjME/B2nq8xmG8wg0tUxCgyikyxAt3TxkVs+0LwyEl5kH2Y7JwxRtcnL1M2LqAEwjCV5QRAUJKT3rvz3Spa1cvSYocoz1ZosAWdxol5l7jNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gecLrZvhcuDqIbCAOijwW/DjWrOv8c775JbAdvLO3h8=;
 b=KpIOx0iAzm1ZJgCYyYZyl7HoHTzg+UQXBcZv6ZhQg6Z6XIGmWa1DpgCDhLPODOCrIF+pM5DSxFSRkX9GW0h2z9NeHhCS64Ke5EQUJzDahp6LMPxooVadJ6oWX0qHgQelOad8NQQipf+LQXAUXXnNmixFFpap/NRN8+tqOZD1oobEh/rpIQOn1JzTsI5I1x+T3O403Ciswhsfz8KbAimgt6xeujDLUDlXS6cKuAZg5EUj+QzzLJfLOQZsgg18JkxKDcEPQm2mynXSMofdjrUZAqRvbtt4bAE+GQtxDaqv9bJ4i5p/XQMJ5Q36jFgxIomQWmArOe2PAg+GltlYIe6LIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gecLrZvhcuDqIbCAOijwW/DjWrOv8c775JbAdvLO3h8=;
 b=1j8hsyG1Ql7+rG3apHmbYrstbp8V2X/gg7MUL0JWs5EEe4FwOz1ejIKvJc0ywxWoWohkPgXoerIc+yRKw3f+13JrcXCFXQE+h9Dx0KhAE5JNxv5wG94u5v9hkN50x3mQbKaN82YlSM0G2N3zf9o1ZcFidGdNkro4CpB/tsYgpB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB2860.namprd12.prod.outlook.com (2603:10b6:5:186::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Wed, 2 Feb
 2022 16:12:09 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 16:12:09 +0000
Message-ID: <63313e45-e900-f9ac-6fcd-ae2b4de7c53e@amd.com>
Date: Wed, 2 Feb 2022 11:11:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RFC v2 00/22] Add Support for Plane Color Lut and CSC features
Content-Language: en-US
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210906213904.27918-1-uma.shankar@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0187.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::30) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bdbc84f-95ef-4dee-4e21-08d9e666c35b
X-MS-TrafficTypeDiagnostic: DM6PR12MB2860:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2860D97A169C456A0AE113318C279@DM6PR12MB2860.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d/8+LT/398AOP/0ltuZgzVeznbCQ1S/fIBClif94Lv9WZXCZ0hLr7WxHv1VmZNSZfokxDEzOX/enCbcI/KXTbLy6qSHQm5Kl+xs9hqX0UUbvWYkYx6Uk/PEmcpOwvpv83iVjGpoVMPCZhbvsojaY7bNRcN2xx2AZ85AfGyohbwG1Tn26n6Bm/zcLUZpbBFZMQcjpPNc4i100oRTbCpDh12CiB/7qyUf8+60FabUbhx9U9oR+CjTdCTBXzQ8pLzr/41sDb9CahAgWesTM4N5fGVQjbvNwVDOsSakGKzI1KuZdHaNrqKIDfy7GPVkptxKCsnOV5C0V46CCongQTxEtU+Z5xoIv241kAguOyr/M1fjKLyFvD6ymIoPiZ5GSVK99dEoMdQDdMiWGGJhdd6W4biLZA/MmUsFz9tWhasrlgtFpCkYTMS9JMAxfEX0kDXTmRjyLC+ISmqjJdPSRYZcfN/fBwOd7jMJFcUizOlhmOEabSmYYpvuMvNCo8zfOpZVZlrH7TflMYp0znEe0l+3svbUscbdK1MxUMjpko5t9et/u5Os9JzHQUg6e3yQEE80clkuqEjUpNn7VTmJ9OfroAlGV/kNb5szg7jc521BAuCd8vzhU9GV9PTqhxwfxd5fekfQiChnfeeyordg5BY0Ul+eirTELIRpx6YFEGpo8eQrdc9dZyImn/2IXIOq/FmrmillDYkDPdrJX0w39y8qbTpWRF12W3eVkOLStXMEDGr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(38100700002)(8936002)(66556008)(31696002)(6666004)(66476007)(8676002)(66946007)(53546011)(4326008)(6512007)(5660300002)(6506007)(508600001)(83380400001)(26005)(966005)(316002)(6486002)(2616005)(2906002)(44832011)(31686004)(186003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzB4dlNibHZHS1llYVM5UTdGM2lRYy9WWlVUK3ZaVkV1Rlk4SkRUcHNrZnNh?=
 =?utf-8?B?WFN1bWErTE8veVNpaFFvVzJzVHN1SEdNTEkzZlQyci9qOGFmcklaYmdLOURL?=
 =?utf-8?B?THY3bTVHSW5xbmVCMXNFR2hsZDNiRlFSS3lMQisvQnU5RThVVjIyZzZDeFNP?=
 =?utf-8?B?MHEwczBKZDFDdit0b2thZjMrREVRVlQyOG5sWTY0dldodTBvZW5JV0lCdVNm?=
 =?utf-8?B?RlRmUXV5T2tvRWMzTWs1WngyQWhsTVhKeUozeUdIbVBNSUVZS2hNZHlCcm85?=
 =?utf-8?B?OGt2SC94TTl3TEVwR2FIVmhjR1plOEJMN2VWTWwyRmxSbE9uV1JzSnB4Z1F0?=
 =?utf-8?B?ZUNQb3E2OGpMc21FNEtNdEhnbEcra2hIcDR6amR4SCt1T0NwRy9MME8wNEE1?=
 =?utf-8?B?Rm9EWFNpOEFrWUZhM1pZaWZac0xhQnQzTDZSTVFnTWJmRUtFZjFLeGVKOHdH?=
 =?utf-8?B?UXgwaEFvQmZ3N0lUbWlGS0FLZFNhSFl1by80emJzTnNlTWFaOUltNHNzTFU4?=
 =?utf-8?B?a3dNaytSMXd4QUkxWTd4elRmRmo5dDhBbkptOVcrYUZrdnBQTE9xa1hnWXFs?=
 =?utf-8?B?dDR1b2M4SXFYNE9YOHJxSEpHcVZORDFaczVoNmtlTGV0cXg5cm5nY1dEbHBw?=
 =?utf-8?B?SC9TQ2xWU01meCt3R2xPZUtXZ0M1SkY5UmlPK25ZRFNrL2tHOXpZVXZRUXZx?=
 =?utf-8?B?Qms3S2d1Z0Y3N1gzTitjZGZEUllKaitxeE9iSkZCSzBYUTJyb05yRy9OZ0M5?=
 =?utf-8?B?RjRKQ0JFbXduMEg2N21kU0Y2emwvVlM1NmpiMUdURzN6L3g1V2pYUURxMUhH?=
 =?utf-8?B?T0xHMW9BUlFWNDVRcnJRU083M0EzTWNDakhHRW42bVlKMDdac09QWW1LU25F?=
 =?utf-8?B?V2E2NXJFWEFyMkxCT09qVk1ZaDBsai9YZEdqb2hEeWpaZzZnaFU1aGtNTXlm?=
 =?utf-8?B?VEtJOU9JTmpSdEUvOFpUZlZldm50cmtxR0VLWlN4ZnVNTXRFaGxCY0pBMVRq?=
 =?utf-8?B?Y0ROc0w4Q2xPUzhjT1hSeXMrWW5Fc3JSUnp2WVo4L3FwU2JJem12N1drWmhy?=
 =?utf-8?B?bzRzVlFpenNsN0M5YjZrYjMwNW1ZT2RrSnNHN2dzcnduOFpibi8vcE9rMG4r?=
 =?utf-8?B?QVlCWGpFSlZsNlpTemZOYnFxQytuZlpIVWZwcUVvcFpoaUZ1eTZ2ZVpoMDNp?=
 =?utf-8?B?REllZEFYMWpEM2R4KzZLbHR2L3ZHbDRmZzdxbm1TOXRDRk44akhTN2FiTG1S?=
 =?utf-8?B?QXVqYXJkaktkak9lTUg2MkNzUitoaEJoWDQ3czBibldRUDU0VkNEa2RrYllm?=
 =?utf-8?B?K2p5ait3UTVVNHZrdU5NNWtpdXBEclRWV1Q0SGdqbTBHNmFGM3lBa0pLb1BK?=
 =?utf-8?B?VFpFeWtHa2doWDNBcWVQbHQ1Tzkvc2xqYm1qQnlRaVRzUng3bzRUakJiWDdJ?=
 =?utf-8?B?YTQ1THVtRkRNYmwyUTd1Vk4vNGRJWmZheWhXYTBlVG9DZlNFQmVaVDhMVm9Q?=
 =?utf-8?B?dEVVYktSZzJ2YXRnS2hka24vYjQvZXBPdlA3amxKU2lCdDdlUUttS2VvZHJO?=
 =?utf-8?B?Tk8yTUlHOTNiZWlQZzN1NDlwbWhHSjd4VHZXV1E4TFFuN0hzczVwVVRIYlg5?=
 =?utf-8?B?bHhBLytvSDB4Ujk3blFXb2xQdjh1Ri9uRG0xbzR4U2tWTkpWL2I1MmdFRzBX?=
 =?utf-8?B?QjdjaGpHbGg1QmVENi9ONnAyYVVpL1FCMG1hZFZaTWU3TzVJOTU5azBYQlRV?=
 =?utf-8?B?cG95QXdjaGo4VERvRnFlY0NYL2o4LzdFMjNXSTRucnVBcitxSHl1OUo1bE4z?=
 =?utf-8?B?eENyN1VCVzhnb1VPMGpKNGU0ZTk5dk02a2RsYklFeWdpMktBMTBmWmRqN2Fv?=
 =?utf-8?B?TG9ZQTRwN2hXaEJRSXlSM0o5akNyYStnVEVKWVZValpVcHNtSXk3eTBuSzFx?=
 =?utf-8?B?bDlLaFFyV0JhMWZ3dHJhYmxXdTN5YW5ja2NSdGlIbUpnVWpEeHoxYjNGVnZE?=
 =?utf-8?B?bW41VE51a0wzSjZIWm5xVlVIRUtKTHBQaG41MHp6eHZtOFhVSkMvRVNmRk52?=
 =?utf-8?B?MTZWMENGNW5ST3NNTlVCYndzN1ozT2hwUGd4TkJvQWo5SXNEQmhIR1FKd3gv?=
 =?utf-8?B?QU9YK3hpeVl3Z2tIc3FGSkx2WnFQdTJaeUpyQ3prM1pUaDFaQThES1hQejc5?=
 =?utf-8?Q?HjP73Pe2XeZAqE+7lkGoIbo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdbc84f-95ef-4dee-4e21-08d9e666c35b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 16:12:09.1054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w999LrO/ybQMkUM6AwstQaq3vTcS58rPIwV06q+Ejlu7Mo11i1hHNVU5K7nvDlaLrDIfiBrOS510Wwvk84yi4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2860
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
> This is how a typical display color hardware pipeline looks like:
>  +-------------------------------------------+
>  |                RAM                        |
>  |  +------+    +---------+    +---------+   |
>  |  | FB 1 |    |  FB 2   |    | FB N    |   |
>  |  +------+    +---------+    +---------+   |
>  +-------------------------------------------+
>        |  Plane Color Hardware Block |
>  +--------------------------------------------+
>  | +---v-----+   +---v-------+   +---v------+ |
>  | | Plane A |   | Plane B   |   | Plane N  | |
>  | | DeGamma |   | Degamma   |   | Degamma  | |
>  | +---+-----+   +---+-------+   +---+------+ |
>  |     |             |               |        |
>  | +---v-----+   +---v-------+   +---v------+ |
>  | |Plane A  |   | Plane B   |   | Plane N  | |
>  | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
>  | +---+-----+   +----+------+   +----+-----+ |
>  |     |              |               |       |
>  | +---v-----+   +----v------+   +----v-----+ |
>  | | Plane A |   | Plane B   |   | Plane N  | |
>  | | Gamma   |   | Gamma     |   | Gamma    | |
>  | +---+-----+   +----+------+   +----+-----+ |

We've had a number of discussions on naming for these properties but I
don't think we've arrived at a consensus. It has come up repeatedly,
though, that gamma/degamma might be misleading terms.

I've opened a ticket on gitlab to help track this item and would like
it if we could discuss the merits of different naming schemes over
there:

https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/7

Uma, I tried to tag you but don't see you on gitlab.freedesktop.org.

Harry

>  |     |              |               |       |
>  +--------------------------------------------+
> +------v--------------v---------------v-------|
> ||                                           ||
> ||           Pipe Blender                    ||
> +--------------------+------------------------+
> |                    |                        |
> |        +-----------v----------+             |
> |        |  Pipe DeGamma        |             |
> |        |                      |             |
> |        +-----------+----------+             |
> |                    |            Pipe Color  |
> |        +-----------v----------+ Hardware    |
> |        |  Pipe CSC/CTM        |             |
> |        |                      |             |
> |        +-----------+----------+             |
> |                    |                        |
> |        +-----------v----------+             |
> |        |  Pipe Gamma          |             |
> |        |                      |             |
> |        +-----------+----------+             |
> |                    |                        |
> +---------------------------------------------+
>                      |
>                      v
>                Pipe Output
> 
> This patch series adds properties for plane color features. It adds
> properties for degamma used to linearize data and CSC used for gamut
> conversion. It also includes Gamma support used to again non-linearize
> data as per panel supported color space. These can be utilize by user
> space to convert planes from one format to another, one color space to
> another etc.
> 
> Userspace can take smart blending decisions and utilize these hardware
> supported plane color features to get accurate color profile. The same
> can help in consistent color quality from source to panel taking
> advantage of advanced color features in hardware.
> 
> These patches add the property interfaces and enable helper functions.
> This series adds Intel's XE_LPD hw specific plane gamma feature. We
> can build up and add other platform/hardware specific implementation
> on top of this series.
> 
> Credits: Special mention and credits to Ville Syrjala for coming up
> with a design for this feature and inputs. This series is based on
> his original design and idea.
> 
> Note: Userspace support for this new UAPI will be done on Chrome in
> alignment with weston and general opensource community.
> Discussion ongoing with Harry Wentland, Pekka and community on color
> pipeline and UAPI design. Harry's RFC below:
> https://patchwork.freedesktop.org/series/89506/
> We need to converge on a common UAPI interface which caters to
> all the modern color hardware pipelines. 
> 
> ToDo: State readout for this feature will be added next.
> 
> v2: Added UAPI description and added change in the rfc section of
> kernel Documentation folder
> 
> Uma Shankar (22):
>   drm: RFC for Plane Color Hardware Pipeline
>   drm: Add Enhanced Gamma and color lut range attributes
>   drm: Add Plane Degamma Mode property
>   drm: Add Plane Degamma Lut property
>   drm/i915/xelpd: Define Degamma Lut range struct for HDR planes
>   drm/i915/xelpd: Add register definitions for Plane Degamma
>   drm/i915/xelpd: Enable plane color features
>   drm/i915/xelpd: Add color capabilities of SDR planes
>   drm/i915/xelpd: Program Plane Degamma Registers
>   drm/i915/xelpd: Add plane color check to glk_plane_color_ctl
>   drm/i915/xelpd: Initialize plane color features
>   drm/i915/xelpd: Load plane color luts from atomic flip
>   drm: Add Plane CTM property
>   drm: Add helper to attach Plane ctm property
>   drm/i915/xelpd: Define Plane CSC Registers
>   drm/i915/xelpd: Enable Plane CSC
>   drm: Add Plane Gamma Mode property
>   drm: Add Plane Gamma Lut property
>   drm/i915/xelpd: Define and Initialize Plane Gamma Lut range
>   drm/i915/xelpd: Add register definitions for Plane Gamma
>   drm/i915/xelpd: Program Plane Gamma Registers
>   drm/i915/xelpd: Enable plane gamma
> 
>  Documentation/gpu/drm-kms.rst                 |  90 +++
>  Documentation/gpu/rfc/drm_color_pipeline.rst  | 167 ++++++
>  drivers/gpu/drm/drm_atomic.c                  |   1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |  12 +
>  drivers/gpu/drm/drm_atomic_uapi.c             |  38 ++
>  drivers/gpu/drm/drm_color_mgmt.c              | 177 +++++-
>  .../gpu/drm/i915/display/intel_atomic_plane.c |   6 +
>  .../gpu/drm/i915/display/intel_atomic_plane.h |   2 +
>  drivers/gpu/drm/i915/display/intel_color.c    | 513 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_color.h    |   2 +
>  .../drm/i915/display/skl_universal_plane.c    |  15 +-
>  drivers/gpu/drm/i915/i915_drv.h               |   3 +
>  drivers/gpu/drm/i915/i915_reg.h               | 176 +++++-
>  include/drm/drm_mode_object.h                 |   2 +-
>  include/drm/drm_plane.h                       |  81 +++
>  include/uapi/drm/drm_mode.h                   |  58 ++
>  16 files changed, 1337 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/drm_color_pipeline.rst
> 

