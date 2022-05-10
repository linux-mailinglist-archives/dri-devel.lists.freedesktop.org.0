Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A85521022
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 10:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C653410E475;
	Tue, 10 May 2022 08:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D219310E475;
 Tue, 10 May 2022 08:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652173045; x=1683709045;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QX9PxFvQllGotcJT+X1Pc6dMa0MwvJcQI15cfcpnMxA=;
 b=L8jsLOfxGbeQDuiPkQfV7buP28fZ2ZQQf07ZKr22O7T3FTbgX1Cy/8Lp
 MlhmQMRZGcQbgUbjNJOsMFCTVq90xHmRumWq/JcXNlbO5rb4PzxabZi6S
 Xao3vVUj2505CiH9xehG5zhWIS1Wr3+kKTrqZm/uyFDfGPoGEI+b/us2f
 ahgc16B/8EMAMjw/3qFd89nsqTQlicCtsA5OQyiYsoimmv8JvgDSh1e49
 weDaCUOx84sxZcTZYOSMW+QGjLlYphDAJsY5p96ptzFTpgvpdEgjnajg+
 FduHgaDgipkhiXnFDevoAsumJtEJiX/3zrdSUlyE2FTY/KqdMcBjMrlFy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249212948"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="249212948"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 01:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="593396916"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 10 May 2022 01:57:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 01:57:23 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 01:57:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 01:57:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 01:57:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuR94yFurOraq8i7B6JYQAqbvKsNuDKaZxPNKi/nUXeA4NL/2ySv7O7G5gZzg3kL+NGTzDLgu0eUjv0ByKd7CwEAlRKx8Qn6tj7Q6CN4ITVsygXxUsy9nYK1Eeuzr8JVUNLtzhrP11DyOcrErG8xI2Xt65TvmPy2DOhpv/j4rbRUz6swM84w2VREEeSxufYgKoWVa34SWp6BNBvMjLS3hvJE7YQt7fMdgUaRyHiRlMupKxbtjc57n2JWYjAt8P1T9boOgxqhO5qX44u2W5H8FoMeNP2zSywrAYWBIvgnQLIcIhB7oz7FsWBhPEVUJfTWja/oShUoYaL5ZSWNzhrRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEwQ65fgaxXmV0MbCo/JLlTcejF3khYnjEPUCYgBKgI=;
 b=UTukHvrtwv7Oz0BlRYQrIIE9DgepU1FNw4SruSS+hi85/eDAwIfwJLRcfPfVm7IVqptQ/BZPZxNK+7lstqUtK7QHQ1qr4GnHi3u0YGLw+2hVvYfNM84ZZ2sKwUzASQNGRcZ/JF/ZptthR+Wbz0p+5wsfNxHeGL5k/5ii38YNGme4Z23/QXbxhGYsitTr9fGHie1/SGVCv+E2AQniMBjxDso7LTcN3rkC4cg10GU9NvGFqGRbckOPz4AcFG68C5Gmlz18mT49GiuyJVs0WjPCpgoxNYDXK/Tx9ig/2IKomJIMLVSNJCy6jokZLJ1swVB/UP7tF20AVjyScVtYLEK/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 08:57:20 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 08:57:20 +0000
Message-ID: <64950931-aa57-bfed-dd8d-2c956b83029b@intel.com>
Date: Tue, 10 May 2022 14:27:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 09/25] drm/edid: convert
 drm_mode_detailed() to drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <6e4625d529ee4bfb2f6ebbfef5fb707d65a0554d.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <6e4625d529ee4bfb2f6ebbfef5fb707d65a0554d.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92cf8e13-bb0a-4099-6d5e-08da32631734
X-MS-TrafficTypeDiagnostic: PH0PR11MB4824:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB48244FFD02FBB1ADBFC1432FCEC99@PH0PR11MB4824.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: THHzbJwhQGZBbW0MROFQAlhVfWdBjbsJqo8M2QEKyVMt2YdXtBg7kZEv3FhOmlLRHzFIMFB8N1lUhP3s71C4QWhIzfzSaVR3bq9mnhDnDU1gfcNV3xcn7cE2/soh8WItoHu3W5Fu2sTHX/gEAcTSuRxdSMPsGPrZqUhzRlpW547VPSinudni65mphROdzR/KBKF3uVKikieZ+LdgpEuEikzPCiIPPiAPUlhR3uQSGyqZONAAH4xWwaKyQ4cMsLFZHQqKavPFOrbPpULhEQiMs4aWXuvbjT6Ls12AbMN7BlP0AjFjMcJqVO7ThQ/7faT0Irs0T8RpaVNQl2/t7EDfJb4JER7+/FICGeLVRkkD2IT5GlWVwuKDAC+VLt1+0384XfGDSYV9VL7Z07DACjZgDAwooOe4c+BBQxje88XO/c50JXxH0fisAh8ynMlSMd3agweSPm+h7wBFSwRD5Y9tzbtIFWv1rGDE+JNb4zg1cN8zgS3Ghn/dS1bHHDgahp3+44aYvb1Gpwhqou6KA6jT8SEmkwPxB4hn5wfO5M+D9pyZK8zeOua7eS0MJZd1QXdl6o2BFzAoufJU1qXRWO4BtwqfGUVdWQkYcWP3d7snt12Lr61DJvM71+hi150YE+wJig3BNut7w+6giiuZgs8H11lwm9+veOTmlouVTKyCIbKaoXzvGhhZ+V25TK+KR1fhGo+KFY3n6WtBJiczeuG31f5fyh+bnIj+rIIh+gqTL70=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(4326008)(450100002)(66946007)(2616005)(66556008)(66476007)(8676002)(508600001)(83380400001)(6666004)(86362001)(6486002)(26005)(6512007)(316002)(6506007)(55236004)(53546011)(31696002)(82960400001)(31686004)(36756003)(2906002)(8936002)(5660300002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGo3VzBqVk5QYkJKdk9wejVOUU9qK3BCbk9SSEdlREpRQ0FpK3pxNzJuSlFp?=
 =?utf-8?B?MnQwMmp3Y1A0V05Hcm9IczRyYW92empPT2ZZRlZpY2o5QlNRajZWaHdZcGk3?=
 =?utf-8?B?WExGVXdWSXc1MEdRUUFHSFhOZkR0RzNSbDFoWXFzTFNzZnNqUG1yY1Vka2tz?=
 =?utf-8?B?MEhZT250Nm9QdSs3K0Jrd0FLbGZSOUd6R3MxTFZxYkVJa3l5US84RFBRM2ty?=
 =?utf-8?B?Y25Rb3p5SzBBb2J4WURyVEQrL2RkRHhmczFVZGdEMzJNQ2NFQktrM3V3L0E3?=
 =?utf-8?B?Z2NWSXN0M0JxcmVYUFpwSWdmTU9pSVlzbkJUcjBsV3djTWpHbVEwYmJTUXJ1?=
 =?utf-8?B?bXFZYUIyTFh6R2ZTeHRkQlZ4NDROdGd1LzY2ZDhzbW1OUHEybHRtaWFlZ3M2?=
 =?utf-8?B?OGhYNkNheFh2dEN3NTFmUHNZRlZJK1BIblNrLzdnQ2hvY2c0QUwzZi9CRHFr?=
 =?utf-8?B?YnRVSytYRlBkT2RLUFd0M2pyeTZ0YjhmMjgxZ0dYSXo3UmJXcEV2TEErSHlI?=
 =?utf-8?B?TkNKdXBITlN0VG4yV3VRTFRnYW8zMjBvd2lpTWk3NHpaODYyUW90ODRhVlB2?=
 =?utf-8?B?U0ViRXlraHNGQjNBekN3OS9YbURMT2ZKNUluQmZ5QkIwVGJMTTJLL0VFMCtM?=
 =?utf-8?B?ejF5UzZxNFlFQldRa3FzUEs3R3ovYmtQd1Nka21xcGVSc3B4dTcxS2g0bTY4?=
 =?utf-8?B?TU1udlJUWmJQUDZaMGJpV3B1bjh2M1pIUkI5R2xVeFRDcDBIdlNqUmkzakZl?=
 =?utf-8?B?WjFUa0ovUkwzZTE5Vm5RUjNXeHpjQWdlR2ZCaUR2TUJZTzRxVHhPaTd1eEJ2?=
 =?utf-8?B?SmJaTFhBMzJkOVRiVnVUNUNVcitBNXNxaHZ1YnVtZkZQM3JCS2syWXdBSzND?=
 =?utf-8?B?NnZNaDNGbDkyNklrckJKTnB2RlpDY1Nlekh4WXF2Z2RubklxcmdlRzVrRXUw?=
 =?utf-8?B?Q0tPRkdQMlBGdDZIMFVhK3dzdHRNeGdsWTh1SzZWT0pVL0xTNWVSMGc1YkM5?=
 =?utf-8?B?NGFjKzdjZlhiOFM0T2ZRK0xVYVhUZVJ6b29wUjdhOEpWL0dJNWtPNVJJVkFy?=
 =?utf-8?B?ckhBOHBkYVZvTXV4OTd1MkdQQmRocWxoZnVCczNDZmVrTXk3RUUyU1FOSEsx?=
 =?utf-8?B?bUp1Z3NMaHluaFM3WjJ3b1JYTW1zSEJDWFEwYmpOUkJrQVJQcCtycG16Y0tB?=
 =?utf-8?B?N3BNMkQwUFpTNENzQjJBYnR2eEtSTzcvc3hLd3N0eW1IRFlPelVydjBlVUh4?=
 =?utf-8?B?OVdBZi8yR214VXpzM1BFQVA2WHd0MDh3RVFZb0NhdDBWS0llbXB3MEdhbUI3?=
 =?utf-8?B?cHV1RGxkRkgwY0FFY1YzeVhjdHpFOG83b040SFA2ejJhcWxLTVBZN0hvMHh1?=
 =?utf-8?B?bW5ZdjN5TlFMa0hWYisrbENmRDZiSnVDeE9GRXZNUStPOUIwcThiU0VFbysr?=
 =?utf-8?B?U0FBWXFka2Mvb3VDVVZVT2I4bWZ3c3hzSFpGQjJ3MXBKc0Z6c1QvbFV0bE1x?=
 =?utf-8?B?UnBqRVQvMXk4WjlxR2YyUXN6MVdndDBQRjVLckpmMWRVRmM3RFRNNHU1VDN2?=
 =?utf-8?B?K09CUmtTeDhLWVhYRGVxZ0dBUXdSNjE2RnBWUkxHUUtWZlFDeXZNWDhFUEV4?=
 =?utf-8?B?WDRMSW9jWE5LbDROQnE1VTdCc2Rqb0YxVnV6blIxUitVZ0xmd1llOXhBcmpa?=
 =?utf-8?B?QnJ3dk9lRVNZZFhOa05JYVhRUmcvc3BuWlpLRmpaaXNlZnc2YjRRK1IwR09W?=
 =?utf-8?B?UUEwMWx2cytMaTZ2TFpJWVFzUVhpaTdqcDlaektQbHYreUZocEZMdEpiaURr?=
 =?utf-8?B?bzlRM01EMVJpcTY3eTNqKzJOWmF2a0FFY09xb3ZmVjY0U3ZIREc4TDZwb2RO?=
 =?utf-8?B?U0xqdjhjRW5BeFlWaHlkWEFkM2RmNCtzWlNvdUJHYmE3MDJORGd3NFpoanhW?=
 =?utf-8?B?amVlZjNPSWwrTTVVVEpRQWU2R2k2VHBnRTRSQzJSSnpYSElyaGxZUVFiVEp3?=
 =?utf-8?B?bWxnc0c2eHBBQytpRzhHZURlcHdZK1Z6TEhYd1lGVFpJYjdWVjRvaFBnWjdP?=
 =?utf-8?B?WHQzTm8yRDNkRW9PMkRrcWpnQkQzalROL1drYllJWTZ0dFJiVU1idDU1UFN0?=
 =?utf-8?B?RWxEYUJsUml3cGVyZ1NEdFlCM1VWbmlsMnkzTnR0c0dTTVh4VXl1eEFxeFRD?=
 =?utf-8?B?RXgvSTgvdjd0RnlKbEVKbVZrY1JtUUlnd2dFUTJRaUliTC8vTUdGbnlsV2FN?=
 =?utf-8?B?NG4xeE9EeEx4VDNzQlBmdytiYlcvazJ2Wi9qaHMwcHh2ekpoUDA3emRwNjhu?=
 =?utf-8?B?Yzg3ditMU25HQmZqOTFWV0RlQ2RNNU9lRmNXWWYyRGZRellpUHBONTVmSzc0?=
 =?utf-8?Q?Bujj/GnOGui3q1ls=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92cf8e13-bb0a-4099-6d5e-08da32631734
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 08:57:20.2402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPpXHNecnji6E8/wXyS17G5QuA1HwUChYiSeXyN2Nx1q+j29J7BGqp1l1GzdQxgx6/1b5zCYA6lgD5UQgVE6GbLZPIs9Ip4InjvcvZvTuWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index c2887012add0..8acdb08a8571 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2928,7 +2928,7 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
>    * drm_display_mode.
>    */
>   static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
> -						  const struct edid *edid,
> +						  const struct drm_edid *drm_edid,
>   						  const struct detailed_timing *timing,
>   						  u32 quirks)
>   {
> @@ -3016,8 +3016,8 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
>   	}
>   
>   	if (quirks & EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE) {
> -		mode->width_mm = edid->width_cm * 10;
> -		mode->height_mm = edid->height_cm * 10;
> +		mode->width_mm = drm_edid->edid->width_cm * 10;
> +		mode->height_mm = drm_edid->edid->height_cm * 10;
>   	}
>   
>   	mode->type = DRM_MODE_TYPE_DRIVER;
> @@ -3493,7 +3493,7 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
>   		return;
>   
>   	newmode = drm_mode_detailed(closure->connector->dev,
> -				    closure->drm_edid->edid, timing,
> +				    closure->drm_edid, timing,
>   				    closure->quirks);
>   	if (!newmode)
>   		return;
