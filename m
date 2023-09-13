Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4035B79F549
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 01:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0709010E1CD;
	Wed, 13 Sep 2023 23:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815B010E1C5;
 Wed, 13 Sep 2023 23:02:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pzxx7kX/lD6V8zUEJ+Rd+dsJ5URh3Ntm3FvvXomtTariDYBMVACkMSr3+Xylll0+LqC9ZtETQYkjuv1o0ma+UBnGbisKyinoAzAJl7M+iRzzolv2aNFTMONqa5hKJvydluSR3+uT2S/qos2gosPWvghdfFy+zmd8aIWJizG9ubFQHAiNApXxPJCDsBMuaQjoUG460neweB0+yK4+1tCmRYoMY2Aj1Dprpg/+ugqtNwG5Re8G4CZA9TuBlwu1kEGSkF8CSs0kDegvpwM5psyLFsOMql3tfohLIBYnoVIktb8hopxVbTuj1494T8Eic/1q2rqphPt/U7fzg2fuOFejuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2JcnuA06G+wfkTK1cmcSP77dgXhQG2EYK74g25mVCk=;
 b=de0tuFsYaefZNYyZ6ldY0t705VavkB9CK2DbIzv7vBfhO6rtE3frgM/EHYWqZRtymbI23GN7IZsg1pTwDFE+++Us/PNbYXsQ4/1BqNq4oAq94037xp8PX4plDfPHIATDMaLHUw9L/rJpE9aTT6EVmTLjYs1nNaaP9cbbIo5aCi09t8vNfIliSKE333VaAcu2pDcC5rnwf24GXEjFtijajV18b+31C09hHNznr3iVgWIW6cNhvh7dCfkj8lTTrY6CwjBfFc9UuwwUJlaWFVhyPQuysfYBSAfZJUPMkqCnvWHFBF/uUbNfLUbLJL/J2kemrf9zjyt0+smd3zGmKL0v8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2JcnuA06G+wfkTK1cmcSP77dgXhQG2EYK74g25mVCk=;
 b=EMcVJACUK4Gv6uIJZ+fadZE3v6R7cZuukyfswy8dcOr72XEVRma3i7MnZhtrlg7yJpLA0U0gB6EZFQqdRCmfvYDnaqFZGZLl8ZS0zqIwSEvMQ0pzi7EGtvmy0RK8KWBMy7RIcGEncx3vL/i9BkL+c8HAGenR4xd/iuiLJCqEJl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BL1PR12MB5208.namprd12.prod.outlook.com (2603:10b6:208:311::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 23:02:11 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::30b2:5369:3468:696a]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::30b2:5369:3468:696a%4]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 23:02:11 +0000
Message-ID: <bd04f984-9eae-4fcb-9c03-c2758aea02d6@amd.com>
Date: Wed, 13 Sep 2023 17:02:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/5] drm/amd/display: improve DTN color state log
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 sunpeng.li@amd.com, alexander.deucher@amd.com
References: <20230913164329.123687-1-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230913164329.123687-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0575.namprd03.prod.outlook.com
 (2603:10b6:408:10d::10) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|BL1PR12MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d12308-96f6-42b7-52c4-08dbb4ad763e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ox1ic3ul5bW/MurY4MLSyREUFqi2MQBLD1N67VahIDWgbWSMATbcpK8LumxlLes4uKoYPlHJK/yEbG5MvZ1dXlwGhSSQEIX1paOYHbuVqxN9eZci/675kdgbz6qfsgWbyKf6UbS90OM05MTjfbuZRnGsqF3wABq2WZHyZ8s6JlulbzAUQvEX8d3Ctoc5+jMXqVaye/c9WofynGkdB/L+VQZjRWFkNs9eD84sHkPhTjKNCv9PBP1BTP2HX8OQhW7wMRSe+VvgrM0Eyvb4n8uTwoPWrG/HXzJlcjbeF/CpzMxfHbd+csPgZ8sIkHiF8b13uSUmFhpJHm40rsBfo6j8Jfwp49cT+cwQmX9VrxUmm3p+Fr1FMJrMPLVzTx50ivGKZj4W3APDYK/Eooq4mdf0s4/OVwESz6N6o13Cta8Xj1SyDZSfMO8V29XE7dWzKxUqWZjcsn5CPjwcRQrIx69Shqr1t2nHXHGhAO45QhKFU3/SdJFvXzLhs6018Rk4MmRj/U5Y6QH4ohl5AKtqeAji+hDft/1P/2SQgR8eazIMGQghefguWv2I64wOTzaZsohwPMSLSCXwfWDgzozUWp6k4raLMm2IjiTvL0Xnd5+iNXzS7KHyDOABQ39ncDR1ammycosblzLmf5Zo9bqwtx7C/15ELot0CcmrCFEklH4tcyNV/2/a3XZ1/LaM6D0J6/Uh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199024)(1800799009)(186009)(31696002)(8676002)(86362001)(8936002)(4326008)(5660300002)(2906002)(36756003)(6666004)(38100700002)(83380400001)(53546011)(6506007)(6512007)(6486002)(26005)(966005)(478600001)(66946007)(2616005)(110136005)(66476007)(6636002)(66556008)(54906003)(316002)(31686004)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2VJYUlpNW9Ccm95em1jTUtBNmc0UFNxYm1Qc2JHTk5DNEJRRStaZDN5M2NH?=
 =?utf-8?B?bmVnVTNXMVBMSWFCaThCdXdKTUJZbW1NSmwwK1VUVTU2V3ZXdGJpdkV6MG96?=
 =?utf-8?B?cTM4WERlR1g4MEV5aE10QTdORmgvVG5aa3FZR01XQW1KWmllbDZrUHlZRzZF?=
 =?utf-8?B?NW1OVVhTMUJ3MmtjN2R2dHJrWjI4YmFQR3ZBcWVrRzFCS2l6WWVkSTY3SUpP?=
 =?utf-8?B?c3RDaU4wNU1rejl0dWJESVR0Wk5tWGpDOFJZVXo1U3ptOGc5a1hsR3lJdVU1?=
 =?utf-8?B?MW5aMWJ2NzI2SnlYZWhLcUZCWW5JOVJUdEY4Z1Vrcjh3eEVtb2lhNzhLdDNC?=
 =?utf-8?B?eVhrR2Zxd296L29rUUwwbjd4azRFek5EWGFqY04zSWpraWpLQ3RteUNuajBh?=
 =?utf-8?B?dnE0RFROdW9wWWl3d05ZNS9SeXFRcFdRNzYyWGJZOFMyWDNhaHp6bDhhdlpz?=
 =?utf-8?B?QnlMUFNmNVFJalQ3SncrcVZKSWhCVXROTXdkRVU5b2JBTjJGQld2VnVVZ2N0?=
 =?utf-8?B?T3FKQTRVWlRNcGh1S05CRExJWEJOeG4vR2w4QURYcFNNL2Q0ei9UOGIrcFdC?=
 =?utf-8?B?YmhFUGdyOEFycGd0bGlrTDB2UEF1eVFwWGJESGQ3RU1MR29lZXNmUmQySkUz?=
 =?utf-8?B?UUF4UWU5YkRZdE9hQ3NhdWZEOFI2U0JtbjlEV3RCeENGMExpZ0ZkQ254aGUx?=
 =?utf-8?B?bjFrN0FwM3NtYnVjTUprUHRLWExKdG5kT2hUQW9ESnQ0anRlQmg2bUIyUzRR?=
 =?utf-8?B?a08zcmlOcFphNGV1QmJDY09SeHpWN0Y3RS9peGI1cjZ3RUQ4TVQ3Z0lzNkhH?=
 =?utf-8?B?UDNKUldxa1FHMUJyb1pjSmdHbUVsaWV1bHlDYlpsb3BnK01IK0FIMlBxSzVo?=
 =?utf-8?B?RUVMdWlzaklhRkE2eSt0OTJYRTZPd1hTYUJTYWQ1bEx4SXZxOW9iZHJIRmZJ?=
 =?utf-8?B?NUR2UnJUS0lYdHVSdW5ycFgzakNWenpUUitxd1J5UFJoZHVJQ2ZrRzJmNDNM?=
 =?utf-8?B?a1NJTkU1eFlhVldoalgyelQ0cVZVMkhJUDM3SGQ2SGMzY2hPWlhZWHltSk1K?=
 =?utf-8?B?M3BtdGVLY2pnZGkrcjFDSVVSekpLc01EeGtmcGFrREFlYWhQSWFreDhsUS90?=
 =?utf-8?B?bUowOTNmK0ZPMnBndHV3bGtMK3NEZHRtQlFSN2lUcUZPNjdBQzFIRUlHVEtX?=
 =?utf-8?B?Wnc2S3RMUDdtOG1ZMTR1RjQrTENqTW5zcjJpK1A3b1FEcFBwenhWUVdXQlR0?=
 =?utf-8?B?MXlaNnNHMlAwVEg2d2p5U1F4M0w0ZGk0TnV2cXhkUU9OTGsvdEJWQmcwS1Br?=
 =?utf-8?B?K1V2cG9wZllteWk0ZnNvUHRabDNLVGIyQWlmdFNtVU81Yzc2akZNWlpXbi9x?=
 =?utf-8?B?dGtqdk9NcFFhbWozeHRRc1luNGVLLytKb0VVY1h4dERqYTZhWUdjUTNKclFq?=
 =?utf-8?B?aGdRZjk1ZUhKN0pkUkJVMU5OaElCNmtGSkhuSnM3YzFybk1QY0xRdEI0ODIx?=
 =?utf-8?B?TVk2czBkSVJmTHZQR2FNZlhJeVBhRDgxandsbDVwSGJMbVpXRzZqY2srenhK?=
 =?utf-8?B?aHgrc05XT1dyRkh6THBtQ1gyRzIvQ3dGK1ljUU44T2VzTmIwOWNiYlU1bmhJ?=
 =?utf-8?B?R21qdEtUSlJVSGI3ellUWmJUbVdpOUJSa2ZYS3pFZjI0V1gyZ3YxdHczcFgw?=
 =?utf-8?B?NFA0WU1uVkpyRTR4R09BZ3BBUzRkK0RqcnRjb3VKY3BSZXFhM3ZweS9zZUtr?=
 =?utf-8?B?c1FUekFJdEpseFZzbnhsd2F2QzMzK2ZPdTU2VG1ONTZDWW13bHVyRndSZ2JU?=
 =?utf-8?B?TWhBWmVDWWhHb0xJMHFVeGhJNTdtQzViOGZERFJDWHJPTEg0R0FDY0l3ZEdT?=
 =?utf-8?B?SjJHSjhXTWcyVTk0Tm5SRUVKaE5oSnBQckw1NG03ckZSc1VhajMweThQU2RO?=
 =?utf-8?B?cmZRaEQ3VEl0UUs2RGt4Ri96QVlpbzVNMW5QWm1SZk80T1FONnV2UTVMeXBI?=
 =?utf-8?B?bGU2NVJoTWlhR3kxMUJ0Tzd4eUdLZ2cwRFp2N1BWYnEvbGJVREtLRkpGMGxn?=
 =?utf-8?B?NzZaTGRhaCtUMUpuQ2lpekp1Q2xnWEZyUXlkc1RxVHE2TGxrcm12bzJubmR2?=
 =?utf-8?Q?TDxvt+i//bCgH1vrYCaXTM63t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d12308-96f6-42b7-52c4-08dbb4ad763e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 23:02:11.0676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hT0XkBpQAKkBv3Wm7L/5nh31py3mePTgVpiypWfr95TOKuDhSCHSoovjAX09bBFA6nUFayxD7gKGI1a/OroPOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5208
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/13/23 10:43, Melissa Wen wrote:
> Hi,
> 
> This is an update of previous RFC [0] improving the data collection of
> Gamma Correction and Blend Gamma color blocks.
> 
> As I mentioned in the last version, I'm updating the color state part of
> DTN log to match DCN3.0 HW better. Currently, the DTN log considers the
> DCN10 color pipeline, which is useless for DCN3.0 because of all the
> differences in color caps between DCN versions. In addition to new color
> blocks and caps, some semantic differences made the DCN10 output not fit
> DCN30.
> 
> In this RFC, the first patch adds new color state elements to DPP and
> implements the reading of registers according to HW blocks. Similarly to
> MPC, the second patch also creates a DCN3-specific function to read the
> MPC state and add the MPC color state logging to it. With DPP and MPC
> color-register reading, I detach DCN10 color state logging from the HW
> log and create a `.log_color_state` hook for logging color state
> according to HW color blocks with DCN30 as the first use case. Finally,
> the last patch adds DPP and MPC color caps output to facilitate
> understanding of the color state log.
> 
> This version works well with the driver-specific color properties[1] and
> steamdeck/gamescope[2] together, where we can see color state changing
> from default values.
> 
> Here is a before vs. after example:
> 
> Without this series:
> ===================
> DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
> [ 0]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 3]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> 
> MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE
> [ 0]:   0h   0h       3h     3           2        0             0     0
> [ 3]:   0h   3h       fh     2           2        0             0     0
> 
> With this series (Steamdeck/Gamescope):
> ======================================
> 
> DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
> [ 0]:        1           sRGB    Bypass        RAM A       RAM B           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 1]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 2]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 3]:        1           sRGB    Bypass        RAM A       RAM B           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> 
> DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0
> 
> MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT_mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT mode  C11 C12   C33 C34
> [ 0]:   0h   0h       2h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A           0 00000000h 00000000h
> [ 1]:   0h   1h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> [ 2]:   0h   2h       3h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> [ 3]:   0h   3h       1h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> 
> MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1

I liked this new visualization. At some point, we need to document this 
information as a kernel-doc to make it easy to understand this DTN LOG.

> With this series (Steamdeck/KDE):
> ================================
> 
> DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
> [ 0]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> [ 3]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> 
> DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0
> 
> MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT_mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT mode  C11 C12   C33 C34
> [ 0]:   0h   0h       3h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A           1 00002000h 00002000h
> [ 3]:   0h   3h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> 
> MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1
> 
> Before extending it to other DCN families, I have some doubts.
> - Does this approach of the `.log_color_state` hook make sense for you?

It does; it follows the code organization. Additionally, this might be 
different between ASICs.

> - Is there any conflict between logging color state by HW version and
>    DTN log usage?
> - Is there a template/style for DTN log output that I should follow or
>    information that I should include?

afaik, we don't have any template or style.

Anyway, this series looks really nice, and I pass through all the 
patches. Aside from code style changes, I have nothing else to add.

Thanks
Siqueira

> Let me know your thoughts.
> 
> Thanks,
> 
> Melissa
> 
> [0] https://lore.kernel.org/amd-gfx/20230905142545.451153-1-mwen@igalia.com/
> [1] https://lore.kernel.org/amd-gfx/20230810160314.48225-1-mwen@igalia.com/
> [2] https://github.com/ValveSoftware/gamescope
> 
> Melissa Wen (5):
>    drm/amd/display: detach color state from hw state logging
>    drm/amd/display: fill up DCN3 DPP color state
>    drm/amd/display: create DCN3-specific log for MPC state
>    drm/amd/display: hook DCN30 color state logging to DTN log
>    drm/amd/display: add DPP and MPC color caps to DTN log
> 
>   .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  53 +++++++--
>   .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |  45 ++++++-
>   .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 111 ++++++++++++++++++
>   .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |   3 +
>   .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |   1 +
>   .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  |  55 ++++++++-
>   .../drm/amd/display/dc/dcn301/dcn301_init.c   |   1 +
>   drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |   8 ++
>   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |  13 ++
>   .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |   2 +
>   10 files changed, 280 insertions(+), 12 deletions(-)
> 

