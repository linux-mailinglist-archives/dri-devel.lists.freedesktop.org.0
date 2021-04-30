Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C473703CE
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 00:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8312E6F609;
	Fri, 30 Apr 2021 22:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1B26F606;
 Fri, 30 Apr 2021 22:55:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7upQxREFEVW6nZ3APwV0+nsAxcHjG9oMDvnHfEJc3g5ocOJNbLCW13u5nQzuNNkHcjXzO9zw58tOAlxOnnS6NnRwytiVCVAKoY1BtxY0DXxbHm1pOdgRQbBIsCR9TKJCxTkJAkO7BX1IPGCM/j2fg6LuvgXbzbbnFj/SxN5mdwtRT4PtEDl6PqV4T02ZUxNgT58DaLjpw2ewHTRxt5+PJy2ur9NTJ3xacpZ7MgNr7v3qWXPQ64zizonrgyAiHgO1RsBYgnpQ3xOzZm121/kaWCSORGIbc1pQDZgibSqeFbHzF/Cy0z0dK/l810ajyl7pa+DrFiovAEQULFEG4AqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeeUkk1/a+3ur5c9nj+V2msO+HkQfNhbI+ZoeMagncM=;
 b=e6oQ2M0shJZe11PBFtYcvEu+xqGJxC/9eqDMsHLEE7WFRfC/QHHmHUHSjh+LmYi8N1kX7KgICPQLFCnQCgf5/Chhi/qCLX68GT67Stvk0fT3y01Ksu/97Ddw8Px91merC70ZHUSGkLbKOm8JZGVvu3MBzr+wolyLyYZDnHctmbXTjE9xXUncbwF7gLzUMCht3VQiOWQ2tndJoW55myaqghUTPBT6jZQW23AG+upPHqw5bfu4+8BiKeomuvLH1clS4PCZebgN71xcyt0gLad7TDF5j1FXLKTIPjqVz97J7hMkaZKIG932AxT8eWX2wl7Uo1QluBOrXSLF2HMVQb7Saw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeeUkk1/a+3ur5c9nj+V2msO+HkQfNhbI+ZoeMagncM=;
 b=3jxTEPhVMrXr/vvbstsIiIIxZSmLqOL+gPz0ahopxLQmQHQJjzmh5dqwaE9UHTVkF06jlHoMGyW8Jx8ib/ets7T4YHnS/q+68VoYTAaywaUmA6yvx0r/JLHFq5yjr4ibaXT/7Gx7nVfFgOrozI9PxLAmsWK9q7OwTgC9f5659wg=
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM6PR12MB4957.namprd12.prod.outlook.com (2603:10b6:5:20d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.26; Fri, 30 Apr 2021 22:55:19 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.034; Fri, 30 Apr 2021
 22:55:19 +0000
From: "Cornij, Nikola" <Nikola.Cornij@amd.com>
To: "lyude@redhat.com" <lyude@redhat.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/1] drm/i915: Use the correct max source link rate for
 MST
Thread-Topic: [PATCH v2 1/1] drm/i915: Use the correct max source link rate
 for MST
Thread-Index: AQHXPgouEXNvhABJtkGtcROJrTaaCKrNp8SAgAACNtA=
Date: Fri, 30 Apr 2021 22:55:19 +0000
Message-ID: <DM5PR12MB4679215F5490F2D38E2A6C51EE5E9@DM5PR12MB4679.namprd12.prod.outlook.com>
References: <20210430214531.24565-1-nikola.cornij@amd.com>
 <20210430214531.24565-2-nikola.cornij@amd.com>
 <20bfb456d1f05856ffdc4cd330e1155b99367a01.camel@redhat.com>
In-Reply-To: <20bfb456d1f05856ffdc4cd330e1155b99367a01.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=490a8118-17af-43eb-90e1-412dcaa85da8;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-04-30T22:49:08Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08d225e6-f59f-4b8b-8243-08d90c2b076b
x-ms-traffictypediagnostic: DM6PR12MB4957:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB49575C377AB862CBEC91C13EEE5E9@DM6PR12MB4957.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KbY6enlEEcOxk863rlBWXZUfkWflg/AdOCg935SoY4zUPPkAGbkIjUqruZA/r8LZE10Y5CLzZl3j3ZFY6GLOTOO/2hG4ozqhoFLPrxzh+K/jUWG7boMltY1S1SXsccfjOjLV0l6rCOQ4H8P0aTOjnp32Z7z0I1Ibnv3/+lFM5Zxn6ReM3doOvJjpwUEKv9g5g4H89JZjD+L8V8hRisjLOhjjy8tdjT7jskm6cMqWN+o93Qrly6sJQu6QwMDLchBEZxwuHNWOYbACMJZoIobHbNB+nsqYoULt9Stv88WDJ/3olP0xQ0zGl3J47FCP2b1zTnahoND4LaHMxazK2zQhm6Ke5ELYH7ntRcAwCPnPzcANTzdvLAMNamQ+GOMDFhJN6kFOjt+5qgK+Ht7ifY91MSyRTbMXIHN+qwWv1pA+ogklbmb0xO50udUR5ixeokdXKb6YI+WcH5jdzcoODwmde2GBZcH+KpNTPZUNKtrAD1Nsu8/e1EmznByYlL1bS9wP92P6Uofkfv74rhpXg8nOqTWGCTKgfQI8fiaVOnJS9wbx41l+OvGWHXnKniRF2AR9PffBOQI2TTmmkPQabQpNfY94UoyGQhPVArwpL3V3lbo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(66446008)(7696005)(6506007)(71200400001)(4326008)(478600001)(5660300002)(2906002)(53546011)(54906003)(33656002)(110136005)(316002)(8676002)(86362001)(66946007)(83380400001)(66476007)(8936002)(52536014)(186003)(26005)(55016002)(9686003)(38100700002)(76116006)(122000001)(66556008)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TWtieWQzZllEMFBHcjBvY2M1bkRTR09MU3ZzYS9RZEp1ejJVMWpUYUpMcjlC?=
 =?utf-8?B?aUVJZUZvaEdvY1lqZ0VYellaeTJLODlhT2xENXZCWmJGb2h0OUdYRExENGlx?=
 =?utf-8?B?b242aWdIQ1BPNWRndThERllOdThHOGUvM3VQcHlhb3RpTGx2V2JWRE1FTG9p?=
 =?utf-8?B?bU5NMFFhRk9yTkZEYkhYd2hlcytyOXlhTGdZbmR3aFFpbHIvVDFwcjJOV0tZ?=
 =?utf-8?B?a2hiU3Z2REZoMjcydHBsQ2lvM1FsS0VtNG9kTGw5UlFaZnB0R09JbDM0a2xT?=
 =?utf-8?B?eTJIY2RhbnU2Vjl1YjMwZWs4ajhHblRnVzVHai94WXJzSXczVGFQVlBLR1Bt?=
 =?utf-8?B?YnRxVWlwN0wzYTY1NmsyL0UybkkxaXg2Z0NiTlhuM2gyVzZWQnE3aUw5YXN2?=
 =?utf-8?B?OGN3MUtPRU51dFZEd242Z08vUmlzcnFuMkNQZjhHMVg5Yy9NdDhlLzRSeGZy?=
 =?utf-8?B?M29tcVlJLzgvYW9BU0VJUEpTZFl3RHRHZ05iWTl0c1NucFV1dGxEVzQ5UHlQ?=
 =?utf-8?B?clhCa0hqOFMxUXYvdFN3U2graVkyRXdBQ0hlUEk3UkNiTDZNWDVGb0lvaEl1?=
 =?utf-8?B?c3JCc1laczJUY0xLRWZzRkpuZmN6eG5lT0FjKzc5Z3lVd2lTWDl2cG9UYk16?=
 =?utf-8?B?T3lGMDU2MC9GMFAxNHJpcW1IRUgwcFdUZEFER1FYVFdoZDU1QzJLWnRkd2Fy?=
 =?utf-8?B?VXA2dHdld2QvaW94M0ZLRzNvaFJsMTNtZmY5RFBuL09BL3JGdlp5UDE2QjE0?=
 =?utf-8?B?YWhkdEJkUWh1ODErV3JUcGFybmxQNitOVUs2MTkwSXE1RjVyTFdjZmRVQnpa?=
 =?utf-8?B?UkZnUDdXVUt4QUM1TUl1SUE1TVptbkFwZ1Q5blIrQnFuRW1iQWcwZXBwd2Yy?=
 =?utf-8?B?OUpXZHNnYVdFdzJSSFRVNUJTbWw5RFJOQVU5cXNmQ0ZabnpaZ0MrcmJlR3hK?=
 =?utf-8?B?WTdqZ0RSaktUMVcxeWVVZHJlN0pPVzhFQVU1YTZWV1VMUFZ6cEFlYmdoVHh5?=
 =?utf-8?B?U3JKdjVWNWRSdVpxZW9XcGZyNDhkZUY4Zlo3aVV5QmJTNHFRNlkzTnNzeDQx?=
 =?utf-8?B?ZWFsbEJUWEtTWWE3ZWRGYWttZjNTNTRkandxOFhveWRSd09lZ3pMa2VmTkZt?=
 =?utf-8?B?dWF1Y29KNTlMMnFzNi9vWHRsSDVnZWpLYnZTZi9NVUg4ak5MTmZSRVNKMERG?=
 =?utf-8?B?L25PZXBIMkNpN0lPN0tRdzcvbmJBSTROeUo3NisxMVJMZkRHYlN2WkdFNW1O?=
 =?utf-8?B?T21Sd2ZXQm1uMSs1UFBDSjd2bjRnSHJtc1pMK3gzNUxDWjUra0RQTittOHNj?=
 =?utf-8?B?ckRSNk1tTWhpQzJadDh5M2QyZHNucStJRnFkbXVaRGhlanhlR3dTejhPR2FE?=
 =?utf-8?B?OXFNajNnY2h1UjZoc1JreGc4WkdWalZDZmJGbkl0Slo4bWJ2M0JlVy9Wbzhp?=
 =?utf-8?B?ODdOYjRFVGswbVZTZ1c0emdLUS9OVXdvdmVOUDhVOHJWdGwzclRGR3FEUHVL?=
 =?utf-8?B?TjJQK2dNVmNYTjhYelFiMWFxUVJ3eGhsNzYvWldTVmRFekd4QUtPU3Fha2xI?=
 =?utf-8?B?UkpQeGtSOFJIWUM4c0tCZk8xYVloQzVmaitzandpQzBSSXFpczRBL1pSM3o5?=
 =?utf-8?B?L1dnUG9TZmFiZmhlYXJaNVkvM1BvNmlxclVFbkJJQjRLQWw0b1pFVnYrRERj?=
 =?utf-8?B?dlQxTXYvMHo3QmNnVFQ3Nms3TEVrSytRVlBPU0hMNW9DWnFFTnRzWEdxU2Yv?=
 =?utf-8?Q?C0PXYV9gxZ9L2oCvDW7v+FwygfkBbtILvEYLUfK?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d225e6-f59f-4b8b-8243-08d90c2b076b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 22:55:19.5669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BbdXdf2LElWD3JyoJrw/pzDFiv8bHEkirDhvFzzmRce9RkQ3yBWWdN4QIz0WK6QWEnC1zOYoz9yO0SPdQT39LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4957
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "koba.ko@canonical.com" <koba.ko@canonical.com>, "Pillai,
 Aurabindo" <Aurabindo.Pillai@amd.com>, "Lipski,
 Mikita" <Mikita.Lipski@amd.com>, "bskeggs@redhat.com" <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

I'll fix the dpcd part to use kHz on Monday

My apologies as well, not only for coming up with the wrong patch in first place, but also for missing to CC all the maintainers.

-----Original Message-----
From: Lyude Paul <lyude@redhat.com>
Sent: Friday, April 30, 2021 6:41 PM
To: Cornij, Nikola <Nikola.Cornij@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Lipski, Mikita <Mikita.Lipski@amd.com>; ville.syrjala@linux.intel.com; koba.ko@canonical.com; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; jani.nikula@linux.intel.com; bskeggs@redhat.com
Subject: Re: [PATCH v2 1/1] drm/i915: Use the correct max source link rate for MST

Alright - I had Ville double check this and give their A-B on IRC (I just need to fix the open coded link_rate_to_bw() here). Since this got broken on drm- misc-next I'm going to go ahead and push the fix there, since I'm not going to be around next Monday or Tuesday and I don't want to leave i915 broken in the interim. Sorry about the noise with this Jani!

As well - I'll get to fixing the dpcd unit usage once I get back on Wednesday (unless Nikola's already gotten to it by then) so we use KHz instead. Although as ville has pointed out, I think we should teach the topology manager to allow passing for the current link rate/lane count during state computation in the long term.

On Fri, 2021-04-30 at 17:45 -0400, Nikola Cornij wrote:
> [why]
> Previously used value was not safe to provide the correct value, i.e.
> it could be 0 if not not configured, leading to no MST on this platform.
>
> [how]
> Do not use the value from BIOS, but from the structure populated at
> encoder initialization time.
>
> Fixes: 98025a62cb00 ("drm/dp_mst: Use Extended Base Receiver
> Capability DPCD
> space")
> Signed-off-by: Nikola Cornij <nikola.cornij@amd.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index bf7f8487945c..3642d7578658 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -942,7 +942,7 @@ intel_dp_mst_encoder_init(struct
> intel_digital_port *dig_port, int conn_base_id)
>         struct intel_dp *intel_dp = &dig_port->dp;
>         enum port port = dig_port->base.port;
>         int ret;
> -       int bios_max_link_rate;
> +       int max_source_rate = intel_dp->source_rates[intel_dp-
> >num_source_rates - 1];
>
>         if (!HAS_DP_MST(i915) || intel_dp_is_edp(intel_dp))
>                 return 0;
> @@ -957,11 +957,11 @@ intel_dp_mst_encoder_init(struct
> intel_digital_port *dig_port, int conn_base_id)
>
>         /* create encoders */
>         intel_dp_create_fake_mst_encoders(dig_port);
> -       bios_max_link_rate =
> intel_bios_dp_max_link_rate(&dig_port->base);
>         ret = drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr,
> &i915->drm,
>                                            &intel_dp->aux, 16, 3,
>                                            (u8)dig_port->max_lanes,
> -                                          (u8)(bios_max_link_rate /
> 27000), conn_base_id);
> +                                          (u8)(max_source_rate /
> +27000),
> +                                          conn_base_id);
>         if (ret)
>                 return ret;
>

--
Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat

Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've asked me a question, are waiting for a review/merge on a patch, etc. and I haven't responded in a while, please feel free to send me another email to check on my status. I don't bite!

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
