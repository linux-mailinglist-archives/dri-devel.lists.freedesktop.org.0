Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B45B1DEC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 15:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E225510E9CF;
	Thu,  8 Sep 2022 13:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8B110E9CF;
 Thu,  8 Sep 2022 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662642407; x=1694178407;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SbeQdKRPAow4LvDTaglIm03l/pR/uxwHfELR3e1Us3k=;
 b=P0BdZzLLDqB5uQJiy0iLLULYee0MX1TJXxK8h4sDTu7La4OQ8ujTohpW
 ObK4LTFLmRe3ZRoIgCFuK7Wmncbqtj7Hyljvftf283WjOwS8NC2F+nOg+
 hESta1DSjQeMNKdD998PHQ2DaRi/1qMyte/NWf7vN6AKV9D/G56RQlc29
 PwAAUF5QQ+9LaVpOpBld1vntj7WuUzk0jKD1r3ASA9LJnWlRGQmZ8T+W+
 g02bIxr4WahxKlHmNiLSdqNPsqy8+VYEZLx62Az2iOFGMk0hTXpujwqMn
 fYlkz8XZBLHuOFHEJYENGVs0PdwHi01z8pUX1WQKLPeH93flHiBMwnjZa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="297160565"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="297160565"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 06:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="683223930"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 08 Sep 2022 06:06:34 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 06:06:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 06:06:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 06:06:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 06:05:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ca2Iczgku1tpGr3QjbVSPLhL5OnmxTSLr5YPMXI1DdZg4oqugrW+T05DwKgEe1HP5GDVZAHOKgu0CUPr97pI3DKLLHDxeoEWGM/hMulSmout53tTytsXKlDkXo1iGBdBvv3259TFLttA3VFlq7Q6WYilBgyO632toG856cTGrxPICepZo6Gib5+CF1YWa5yHOIiS1IqQKRpd6RER2HHo7HNhD0+UGY2tCT/lEQfIfC+tiD4KDdK+9hEzfP8eYRx0FAb8Zf8I/NGkeK5W583alF+npX+eSC298vkbzBNny6RzGkpPk9QbxNG7if9JLcZXSCFD0o53OiW1NUZ6hL7MDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8w9e9HTk2DE9u6HMCjJ3kCmzPmEY0o5x0WGg81ZQL0=;
 b=nC3n/4GspgGCoLKglM/BvmrsijCTph33gmlOCX/4I30mC+KC4NxFaCPS/QsmGnWyXuHwT5A2mIGOJSYrXxyiyml5GUDgQLvigBsuzZBaIzQRxf2hrrS5lCw2f3uKra1GokAmkEIyTQ8lNtKbK4hfL16sDZEVj2w6kKZOWQ+WK2Nr22TU8yyz0A5Jx5MBkwdc3UWe95SD73BSPJTpHLf+C/1VVETDi3anAG/GbRl6EuzyrxZ0WG00lmZ47jb6FJoJIKTkneZzKoHLzaKnLWloKN9N8FZdUF7ldIuUzxQOn0STR3KgCb5CrkCd+kXG/yzgtT26pto7yeN+b1hM5k8dYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM8PR11MB5656.namprd11.prod.outlook.com (2603:10b6:8:38::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.12; Thu, 8 Sep 2022 13:05:35 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e%6]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 13:05:35 +0000
Date: Thu, 8 Sep 2022 18:35:24 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v4 05/11] drm/i915/mtl: Add gmbus and gpio
 support
Message-ID: <YxnolNemF1OQZeqN@bala-ubuntu>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-6-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220902060342.151824-6-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BM1P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::34) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b907267d-c5ad-4f1a-9795-08da919ad1ae
X-MS-TrafficTypeDiagnostic: DM8PR11MB5656:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bRZcYPKDRIr1q9l7ofMQhULbmtkqw/qegvJ3Bvu1XgrTOlQQ1ergZbS/68TlccWcVjeAtQz+zXt8QcvJNuMt/dhW9y9J8lsdpiOonYVw7aFHxKTLBlfvWzO9W3zvpX7dMHxFbROLr/BHp52jYWdHydeVS4eem/MUarSqkFuZJLAtONaLQmBBW2hmPoMLTESD9bW7kdY/DraVs9ggdqvarXn5V/PXQ5m2ajgSBZ9bwMW/miFrjZ4O9NxQzpL9RPfoN2tDWR3YaNzSKlFbIIwPZQtrGNTFk8r2ak5TVR0qGT8hIQbSKKTBlq/7QS3hW4CJc0fvZJLGMvrt99SWiyacThvEhMju19F3wVp7XbjssvMq/T9WfkwZrZK6jWN0TgIi+lLOTaJ5NlHxf/FOl5xW14ov/X9iTcmwGgAUyht9S9dTQCYAR5uIIfVBeWQ3s8wF851fSRz5TNqijLBKlJcRe03gJtm77b7GiFfa+uYUurI+7RTYuKfiz3Kn7XQHWOq+MqN7lafN8/is3FelYphcZ+soy1pr0ggVYRmdMNtEUnOnlzxRqM1kLVMYQ68LJanrYRHd6GOWxUW2axZKIPJ7LWiBWNt4aZHtGMzArZfoOVwT14yL9iExdpQi8PXbicClxHXqnSEO8y+pE/e62jUo6H+/8ipCFJCa/LSe8emUR5ltbbIVy4OK14ZTV0Ks/yYag3AZhjJ9FltlrciLINXojw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(136003)(396003)(376002)(366004)(346002)(186003)(26005)(8676002)(450100002)(4326008)(86362001)(66946007)(66476007)(82960400001)(66556008)(316002)(33716001)(6506007)(53546011)(6666004)(9686003)(6512007)(44832011)(38100700002)(41300700001)(6486002)(478600001)(2906002)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUVqMzByRUE3THBFLzJuYkk4QXJkZklPNGY0NXNDZWwzUkdxQTl3SWMwRHhj?=
 =?utf-8?B?NHlCc0FZRGlXVVVrbmNVQUtNN2F5ZWFFTk5vTlA4WXFZOXZZOSttcW91TFI3?=
 =?utf-8?B?V2Iwb1AwbGRheDhWR3BxQzg2NEJIL3dWWkw4VUwyV28wV2tOamt2d0dwYXdp?=
 =?utf-8?B?Z0FYYTJuank4d2haa0VyYXdCVWZ1a3VvSVNTdmFacEFGc2VmZjZ6RmlFd3lu?=
 =?utf-8?B?V1pMTWdObGVaYjY3cjNNbS82ZjBTWTdYV29LMEx3NE9YQUhRZUlQOFM5d1ZT?=
 =?utf-8?B?WDFyODN4d3FkWXEzOHg3eU82aG9Cb0E4ZzFnb0gyQXNLb1hIdjUwOEM0ZnUz?=
 =?utf-8?B?SnhwVk9PTkNGRFBmdmFYelQ3VW1VWGgrcFdpeCszRWc0VlFHdW5JeU8zUThy?=
 =?utf-8?B?VVpsNWw2c3ZHZ0Z5OEYvaGhySVI5MlJmaDE2VHIwZytaNEhwSUE3ZTZ0VVlT?=
 =?utf-8?B?NzdhK3Z4Ky9kWXhrSkk2WVpjNC9yWkJ0UGJzKzc1Q05KeFpkWk9tOVZFbTJM?=
 =?utf-8?B?T21FQTJaYmZYZExFVGNqajRjY0xiQUt2bENBUEVaV05laWtqTm10KzEzTmg5?=
 =?utf-8?B?bkVLVmlJQ0pOTU1OK3JFSy9tWDVLd1V0b3V0T3M2RVhrWGxyc0hVWmFLbXgv?=
 =?utf-8?B?YzdGczNVWDRNSUhvcnhGYllLcGJTUG9FSTRNRFNnNW5vWE50bVFnSWZhS1hy?=
 =?utf-8?B?b0ttOW5wdHN4dFB1NlpUdGxBS3dQenQwZU9uMjg4Z1hmNEZFYUJDb0UzaTVu?=
 =?utf-8?B?Y2hxanNYL0ZLbGQ5Y1QxQnNVREgxVGJXVlhEVGJ2bGxKWWJMM21YNHBJYnpu?=
 =?utf-8?B?MDNlK2wrSzFtUUpmR3hUMGEyakRWN0ZjQU9YcXpMbDEvbzNZMFgzMS9oRjNa?=
 =?utf-8?B?Z3Q4RjJNc0N1SjRWWGtEZWQrZkptNUtHNis2VHJjZUJjK0Znc3FPaUhDUTBi?=
 =?utf-8?B?WEVWbVJsTHRCRlRxRDBkVDdEMXR3K01tZDlEdEFMcVRGVTRkTWxLcGlIWWl2?=
 =?utf-8?B?aExuMGlhamVBMEFUeUVDUGJEaDRja2lta0Q5SEF1SnZiZFFZaEFvd29wM1Jj?=
 =?utf-8?B?OEtQcXNkbHRDTVBwK0JCMm5hcVlvWEhQRE92QkNRaGFZQ0dOUzJMNkJCd21F?=
 =?utf-8?B?TFZuKys1SnlCQmlqOVd3VUY5Zk1JdTljUDBOMWVQcWYvaDArMzdnUHB2aUxm?=
 =?utf-8?B?YlgzS0hsdmIxeXozbDNvUkxyQ211MmI3TVl0WmpUWVNadDNRYTFJQjUzWEFQ?=
 =?utf-8?B?Y0JnNkxuYmdMYXNIYVVVUGp4dkg2dzR3L3hRdk5IRERpQlg4UEJlUEtxa3dG?=
 =?utf-8?B?WmdNamtqUkVXUThkY29xKytaV3JFMS9mbjhmQXRxZTFjdWUvWis2c25GYXdQ?=
 =?utf-8?B?b3V6NG5OTy9mNjlpalBXa2t2cnRXRDFkTFZhYnB6WEFOMVd3clkvczRBT0k4?=
 =?utf-8?B?OG93WGVQNHArS1U0MUJoUFVwUEhPMzF3eHd1VmNmR0FRMEwzd3d5eHN4REVl?=
 =?utf-8?B?ZURzZFdYcjBYTi9kdEk5MTAzd0JSdGRqVE1UdHdBOFBaL2xycEgzMk5tWi81?=
 =?utf-8?B?WHZ2M0tMOGZrSEtLdUFYTTFuZHJoTWpSN2R6U01SN1JGK1d0S0syK0RJTXVv?=
 =?utf-8?B?VHYyVmR5ZTJIcnZZaHJNbmdueEovWjlkNWxNY1BmcERZbVZLb3BVYVR3Rmts?=
 =?utf-8?B?OHZDcXBwZGNHV2Z2Y1Z4QStab09abXk2NDlQdVRXR3FoMGFFeXJIMjlmSXFj?=
 =?utf-8?B?RlNtS2tZSEdYUmhxZENsclkvalpyRHpYUlZXaWVXRFhNTkNFdkZDZ1hTUGNy?=
 =?utf-8?B?bXR2QmcvaTBEbXEyQTZLNDdvQ2NsajJQVlhKV1hlNWN1Tm1wcWNBYWlxTy8w?=
 =?utf-8?B?SnRWZ0R2bEhKeXFrd3Q0aTNsbWhUYkdQNy84V1gwOUFFQU1McHJMTHVpbnc5?=
 =?utf-8?B?dzV1bmZXcTB1OTVDZ0wreUp0dElKNjQ1VmJDRjkvb0NxT3NHYVcyNHJYbTNB?=
 =?utf-8?B?UGhHaVpZVDFzUzEwMm8xUzFkdjRHa28xVEpXOWlJYnlsMXVaYjk5VGpQRUF6?=
 =?utf-8?B?T3YxdWZrRE9MaS9SdXBaVXR0SUFrYXg4TkZ1OXY0di83WDNvbUFhWkZraFpG?=
 =?utf-8?B?anpvUjJMLytRVW9xRUs4MjA1SVhHY1BBM1cyU09RU1ZmVlprZFUvM3JHNWpo?=
 =?utf-8?Q?IupRi/DMoWl9he/r6aTK81A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b907267d-c5ad-4f1a-9795-08da919ad1ae
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:05:35.7405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JzEidQqSfKpoZH+CpT/TRsxRDgKFCgZfWk3lun14JVlPpGrMiDWGmeFQOexJkjjotAfEoCVHxtYTfYRcr1T444KW5AGvgoUwdZXdpVB2Eu0iTvpr5WiKLUfPC6vJZSQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5656
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01.09.2022 23:03, Radhakrishna Sripada wrote:
> Add tables to map the GMBUS pin pairs to GPIO registers and port to DDC.
> From spec we have registers GPIO_CTL[1-5] mapped to native display phys and
> GPIO_CTL[9-12] are mapped to TC ports.
> 
> v2:
>  - Drop unused GPIO pins(MattR)
> 
> BSpec: 49306
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Original Author: Brian J Lovin
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_gmbus.c | 15 +++++++++++++++
>  drivers/gpu/drm/i915/display/intel_gmbus.h |  1 +
>  2 files changed, 16 insertions(+)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 6f6cfccad477..74443f57f62d 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -117,6 +117,18 @@ static const struct gmbus_pin gmbus_pins_dg2[] = {
>  	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
>  };
>  
