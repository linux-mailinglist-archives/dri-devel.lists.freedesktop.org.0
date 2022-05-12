Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646B5244A2
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 07:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB88110E687;
	Thu, 12 May 2022 05:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44B310E687;
 Thu, 12 May 2022 05:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652331739; x=1683867739;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NoRBS2MgdP9agE0fSYtTdNHTxxLqHgPq65C447HioKw=;
 b=DKpajf5SXyMhK5NDt5N1uSvsnyFfK0ye+4g/S8SNHzty+/XvO79YC0S+
 UGtTB6GewiEjGtCy4ppcYDRwNDN41zp9wP5zG7IojD63VvYxZ93JVFC1l
 3NA3mVfYUws8Rw2sujgVTvMlXvqaYy3T64ODYkHntuiSGmBDqja+7ppT0
 iqjVtAXzhDQwmB/24nueepiJgawUkc+wJUI9Qg71L/aywMRzGgjVYctmi
 I2RRQ0KbBk9XDf8VBBXex7BcBPKiE1MrOC4cJO6JYNJZG2UyHvDXFk4Xs
 imTGVfmKeDL5XsC07zjCCRH7qt5smWtSaFjttRUTzelBaQDgnepLZUI3c Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="295136932"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="295136932"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 22:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="624242073"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2022 22:02:19 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 11 May 2022 22:02:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 11 May 2022 22:02:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 11 May 2022 22:02:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9BWZk8ob9nWARtYrgyuYTDb9V939S4HSN/C49iS+7WuXOoodu2wueYC+JOiKUg49S7myW+k9KgRxBJPTONhMDNhFenk7JoHkmVyyKhh9YFMiP38jBlbKDxUjd0SEVgPCHYyJOYG7bJuenAJlQCI+BglZQlQq5gQOxRiuOiacN6MCvgaGDx6i/27Ro+pugWpPJbTCshAYTjG/nr8e+ejuADztX9FsUQkxdq4xKjroF4PYAB0YIFZdtspN2aA7JW2/uTo9piKjvgUU8UllECw7WPZRPzdF83Ux52Nrv64ItlClV5O6U75QuuqzavLkPX6CbiUlUETAfTWhfyhj0yVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHg5bVWn10BPipmcwY2/9LK7utmfnHsbhMfdF9zY0MQ=;
 b=QwPhqDE7VWxKvbmdDntqlacLeh+uqHmLM0YHExgyVdGPtIm01kBpYA7/Ig606se8sSNqnIN4IkCI7wNJjw8A60292mCigI4JR5inTHRNkUGu+Uoe04U7oPbSpPkj2F+QZo/d5xCEeMmBI9l/oI+Ja75y8qy/tbRXvHGYT7WbAkOKVoO2zVfhMGBy435KuPdTEVlLqkXd22Fow7Fvz6q5kvVaaE3Bo8tAG/7kJ5B8VZSvqqiMxKtHyZQLS+ppqMjI2VspumDMaUarhD2jdlqXKMsrIxRpoe3GZEj6NmwM/e4RSQl9qoJVM0AEBM1yLbifQ+TKDwK3J+YpX3k4uS0tTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM8PR11MB5718.namprd11.prod.outlook.com (2603:10b6:8:31::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.21; Thu, 12 May 2022 05:02:17 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 05:02:17 +0000
Message-ID: <b2561dfb-3fc0-e3ae-7b38-62b4bd0a3102@intel.com>
Date: Thu, 12 May 2022 10:32:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] drm/i915/hdmi: Prune unsupported modes as per HDMI2.1
 spec
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220509093130.3511032-1-ankit.k.nautiyal@intel.com>
 <20220509093130.3511032-3-ankit.k.nautiyal@intel.com>
 <YnoNwZU0QtPMj51B@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <YnoNwZU0QtPMj51B@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f9191bd-ebef-464c-07d7-08da33d4960b
X-MS-TrafficTypeDiagnostic: DM8PR11MB5718:EE_
X-Microsoft-Antispam-PRVS: <DM8PR11MB5718552EAABAB8030BEF85D6CECB9@DM8PR11MB5718.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 83KS8nvL71/nDNOZw/6cYTSVJORI7Y7wf8ouMvuokRPDvRGin9LyZyXddVmX4kqw0MCIp9J7WiL8qXdKQQq784KNKpAA8WvkFhpap/02SFSf7QDrDlmwagjnGsWdcL/P2LuUIHlwjYQs1saE5XEdtOsWW/jPpY6lM5SvyYGs+VoxJqj8eorGVMMcgG34CcdXSh9D3LnWQVvSF4vEDUBpvqBRefCPHNYHSRL9K8we7MxwOv3QqAuWe4KPeuB+MtIKH2p7ZIpowe8A9k/pO+05656vnb/xlpAwjYM50aYXwKReGL+2EwOJ8vzQWM0e86Ytt0sW/wBy2u4wdKh6QvcDJ47xpdzhWn+UP7HBDQetIlc/Q059wUeXipiZMlb4RtHITffxQHpjRx82uVLBQwv3+uhzl7IPcCh0ybgOGL48j/dXkLl6jNXm9v0z22C4QIWpFRFyCiQkIV6w5mNdhlzDA9w9zsqlMBDV62lYWuQybI0so3vCwzmTKRFLSPq8vB1cCpLaVnZfbpH9k6mLQ6TlMP8HmMOE/fu0ukM3Y6lHEvuAf0b4ZS7jfWaSYPksAO6tIG37eTmZ4QFBRJ3x0IOYu779frWHv/Eyj2NBfk0D50AloVCAQG9H1ZdX3l9BH+8vjVyybRiuVABKFYgGSOKAVUHqmXlvIKWGRjzBFvpA0j85N1bOQw3i4GlbnPbhE44FyGGPdofgZX86TlSCfc7659gqkvRy3jkpPQ78krEy4ROwGWnSiDSrbOqSlIJVyV4hisDAE5GtP17D4kHQ1XoQoh57mJPA2HcpatN+7Psg1b1+zKkTPjOqdIX7tzw5BITR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(26005)(6512007)(55236004)(53546011)(6506007)(6666004)(6486002)(6916009)(8676002)(38100700002)(186003)(82960400001)(966005)(86362001)(31696002)(83380400001)(2616005)(5660300002)(31686004)(36756003)(8936002)(66946007)(66476007)(2906002)(316002)(66556008)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW92RlVnZ0kybkRwY0hWKytmSFo1SXZPNmVuc3JicHVXZE42aGxRWHBDZFZy?=
 =?utf-8?B?emJTdmJIYkY4ejltWUc3OHI1cGw3R0Z3WEhtbnhFa2dkckZ0d0Zmd09BNTZC?=
 =?utf-8?B?cjZzN0lFRldadE9Rb3N3RExzRWIrV1gveVRTRVc0ZGF4a1lSRnpNaDZ4VTJi?=
 =?utf-8?B?YVA4dmhiTUFBUEhZN1h0SlY1M001K3RQb1UyY3RibWJWTjYvSDh2RmdMTFF1?=
 =?utf-8?B?Q3ZMVnVBMDdtcStVMHlYUnpxSDR0Ri9pM0dtcXU3K3JYQ3h4WWxQaGdqSnRQ?=
 =?utf-8?B?cVNwRGFPb2NYUkdkaDNLNEd0SUh0ZnQrMzU0cU0ybmdybUdncFh6QUgzcU8x?=
 =?utf-8?B?S0kxMXc5OFU5c2poMHpaWVVsNEtMR0wwbDBacmIyZ1ozK3VDeXdTM2RaRFJs?=
 =?utf-8?B?R2ZXTitiZ2xaZWxYSTJzWkdEUEtxQ09NaVVaQXBubGE2VitsVTRXcmZHNnQw?=
 =?utf-8?B?V1FLODhRNTdselU1azlLd3czZ3ZvTWFLVGRqc2c5dHpKa3FCTkt4VGFWSDNz?=
 =?utf-8?B?dzFhSFF3dDBlQ2Q0U1B3ZGo3emhrN2d3bHgxRHQrZmdZbGJxMk0wTDV4eVJQ?=
 =?utf-8?B?R2txVG1lVFdLM3dYL0JlMzVpY0ZlZzNpR2x4RFlkSk9QMmxQbW5GSVh6a1hy?=
 =?utf-8?B?Y1ArMldkcGhSWFFpNFRJUC93RHpwb2VKY2t1L1lpOHZQeTFBOFlMTDNMdTVC?=
 =?utf-8?B?QndQRWJ2bWExU1RrVnhUQjNwcWhEZ3hTdndlWUNKUmRQaG11YUw3UUJwWFJ1?=
 =?utf-8?B?ZzhlU2ZBOVFjRzJTR3F4c3pNTG1nejhpOUVqYTZ1Vm95cUNZNDJhd0M5aUVI?=
 =?utf-8?B?M1pUalRBdTB0SUF6TS9FbFlQZkpwbGtCdkxMc25tMEI3N2hiWXMvdGh5ZGE0?=
 =?utf-8?B?R1BjbXBjY0ZjWStta3ozcXZTaVYyL2xHcGxXY2JsTXFNQWszWkRWSG56M1Y5?=
 =?utf-8?B?Vkh1bVFzYzJRVXhkaWJjcVQzQXVMUTJrNTBZWEpGZDUwOE81WDlCLzdlUzVI?=
 =?utf-8?B?WTZJdHAyS2RlVHFRaW4vYVJZeERWakR5VDlMSU82TldjdVRlMXJRcnJ2NHpu?=
 =?utf-8?B?bHdvZlMraVlWcDZoSDFjUXk3cW5JM01jMkhiL1VGMHU2bGNLQnJ6UDhTUVMx?=
 =?utf-8?B?K1V2SG50R3B3S2liU3o0RDdkOCtFOGkwQVhKT3MvUW5sajhRaXhvZjkxYmZX?=
 =?utf-8?B?VlUxRFlXcVZCOEhVZU0rWWZwSHBGRlF4MjhSMFROdlYrS1JCdVFiNFJpOXIz?=
 =?utf-8?B?WG5lRFJKVklTK05yTU4zVHVzTS9ZR2UwRlY1RHZTSlJrVmR6NWtFeXVGWVpJ?=
 =?utf-8?B?RnZHaUlyWWw1WE1EZXNmS0ZWeGpGbTdLK0JHRCtLSDB1RFhhTkswWGNBNW9I?=
 =?utf-8?B?S3pKcUNMV1l2VDdidjc2dGVJbkt5QUJUNndBRnVHdHlWWk03dVZnbDZTVnF3?=
 =?utf-8?B?eHJRNFlFaGV3S1Q1OE50RnNCNExZKzRTVnlhMWIyMndUZ3ZiU0xqSGNISDNq?=
 =?utf-8?B?c1RmUTZObnZMNTJaWjVQVDZhTHMrb0hLT1NRNXRWQVZDSlQ4d0J1R2grU3ox?=
 =?utf-8?B?OEhPQnJVRzE1M2RldEFsZU5ZL2I0a3RQK3R5QUp1V2dTVDVBeUF0Y3R5a2x0?=
 =?utf-8?B?eG5GOW9LalA2bTFrUXdsa0VwRmdhMW1nVkZ1NEhHMHJ0bnJPY3VqdmduTkFX?=
 =?utf-8?B?L09HeXlVajN0Y29XSjh2RXpQN1pnT1Y4Y01VaEtNYTloZ0pDTGhMOGY5VVlq?=
 =?utf-8?B?dFRZeCtHMlFMb3FjMUpPdnNkam1HQUpqVG43TUt1amZSOVFOQ2hYcXlITTVt?=
 =?utf-8?B?T3BHeHIxcWg4TllQQWdybFpBUWwxL2lGdW1LZUk3MDVQdE1MakdzZEVCYTYy?=
 =?utf-8?B?Sm5mWXdmdmt6R080NDdhOHQ3QUk3cVVQVC90K2d6M1Qwb1ZaUEZTUTVXRWZy?=
 =?utf-8?B?SnVGbzNPNEtsOHdoYU9FUTgzZXg0RC9WaDdrWk1EVHo1MWRGajhIMjhwb2Zk?=
 =?utf-8?B?aWkxcjcvdzlsOEZRaUxVZTJ3dWNWS0sxbENZVEhZaVdXSTRCMzIrL3lIWmYz?=
 =?utf-8?B?WlFMVFhlbU1CL1J1VXZlR1hNd25Nc0R2TFRGQklFNUYwL2N6Z1RtREswYUtX?=
 =?utf-8?B?K0dyRkxsdk5GRi9abGZwUHRFRkJHNXZCTHFXL1VYWEVCSVN5WlVSVk4rTm1D?=
 =?utf-8?B?aG1tMlUrT2dTdXZvNUFwMkhZa0ZBekh5Wm9wL2NLZExtY2V6UGM3M0JXL2Nq?=
 =?utf-8?B?K1NKR2F5a2dOVjc5MXpVT2FDb3pQTVJaNC9YOGpTc2dVMXUreGc0V0xqRUF6?=
 =?utf-8?B?aGdLdjIrdjBFUmVNdkxQR2tWV2NKOHRYWjZQY004aDh4OFhWbllsUTdKY1Uy?=
 =?utf-8?Q?3qdpdzgkSlckRa8I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9191bd-ebef-464c-07d7-08da33d4960b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 05:02:17.3328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0+KLVgOfiH1+6VNbOld68jarOOuFJiaclmAcgCcjOa4V9PDWVDyMZo9YaVARQNDh18ZVknaAiuqs28npR6coZo/XahSm08ZipoT971H99U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5718
X-OriginatorOrg: intel.com
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/10/2022 12:31 PM, Ville Syrjälä wrote:
> On Mon, May 09, 2022 at 03:01:30PM +0530, Ankit Nautiyal wrote:
>> As per Sec 7.8.1 of HDMI2.1 spec, sources that support modes:
>> 4K100, 4K120, 8K50, 8K60 must support these modes in at least one of
>> the below formats:
>> i) uncompressed FRL, 420 format and min of 10 bpc, or
>> ii) compressed FRL, 444 format and min of 10 bpc.
>>
>> Since FRL and DSC are not supported natively with HDMI, the above
>> modes must be pruned as per the spec, and is a requirement for the
>> HDMI2.1 compliance test.
>>
>> This patch adds a condition to check for the modes with clock
>> requirement more than 2376 MHz (1188 MHz with 420 format),
>> and prune them if none of the above two formats are supported.
> Wy are we trying to pass HDMI-2.1 tests on a device that
> doesn't even support HDMI-2.1?

Hi Ville,

As I understand, the HDMI2.1a supersedes HDMI2.0b [1], and so these 
platforms must pass the HDMI2.1 CTS.
The HDMI2.1a spec introduces Marketing Feature names for 4K100, 4K120, 
8k@50, 8k@60 with suffix A, and B.
Suffix A meaning mode supported without compression, and B meaning, mode 
supported with compression.
e.g 4K@120AB marketing feature name means the device supports 4k@120 
both with and without compression.
But as per the spec, both variants of Marketing names require FRL to be 
supported along with other requirements.
There are tests that expect these modes not to be enumerated, if the 
source does support the given requirements.

[1] https://www.hdmi.org/spec/hdmi2_1

Regards,

Ankit

>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_hdmi.c | 48 +++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index 1ae09431f53a..2ee1262f6427 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -1940,6 +1940,44 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *connector,
>>   	}
>>   }
>>   
>> +/*
>> + * HDMI2.1 Sec7.8.1
>> + * Support requirement for 4K100, 4K120, 8K50, and 8K60.
>> + *
>> + * The modes with timings same as above modes are supported only with min of 10 bpc
>> + * along with:
>> + *
>> + * i) 444 format only with FRL mode support with DSC
>> + * ii) 420 format only with FRL mode without DSC.
>> + */
>> +static bool
>> +intel_hdmi21_bpc_possible(struct drm_connector *connector,
>> +			  int clock, int bpc, bool ycbcr420_output,
>> +			  bool frl, bool dsc)
>> +{
>> +	const struct drm_display_info *info = &connector->display_info;
>> +	const struct drm_hdmi_info *hdmi = &info->hdmi;
>> +
>> +	int pixel_clock = ycbcr420_output ? clock * 2 : clock;
>> +
>> +	if (pixel_clock < 2376000)
>> +		return true;
>> +
>> +	if (!frl)
>> +		return false;
>> +
>> +	if (dsc && bpc > hdmi->dsc_cap.bpc_supported)
>> +		return false;
>> +
>> +	if (!ycbcr420_output && !dsc)
>> +		return false;
>> +
>> +	if (bpc < 10)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>>   static enum drm_mode_status
>>   intel_hdmi_mode_clock_valid(struct drm_connector *connector, int clock,
>>   			    bool has_hdmi_sink, bool ycbcr420_output)
>> @@ -1948,6 +1986,13 @@ intel_hdmi_mode_clock_valid(struct drm_connector *connector, int clock,
>>   	struct intel_hdmi *hdmi = intel_attached_hdmi(to_intel_connector(connector));
>>   	enum drm_mode_status status = MODE_OK;
>>   	int bpc;
>> +	bool frl, dsc;
>> +
>> +	/*
>> +	 * FRL and DSC not supported for HDMI from source as of now.
>> +	 */
>> +	frl = false;
>> +	dsc = false;
>>   
>>   	/*
>>   	 * Try all color depths since valid port clock range
>> @@ -1963,6 +2008,9 @@ intel_hdmi_mode_clock_valid(struct drm_connector *connector, int clock,
>>   		if (!intel_hdmi_sink_bpc_possible(connector, bpc, has_hdmi_sink, ycbcr420_output))
>>   			continue;
>>   
>> +		if (!intel_hdmi21_bpc_possible(connector, clock, bpc, ycbcr420_output, frl, dsc))
>> +			continue;
>> +
>>   		status = hdmi_port_clock_valid(hdmi, tmds_clock, true, has_hdmi_sink);
>>   		if (status == MODE_OK)
>>   			return MODE_OK;
>> -- 
>> 2.25.1
