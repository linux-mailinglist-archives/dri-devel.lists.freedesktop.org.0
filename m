Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BAF517189
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2ED10EDB2;
	Mon,  2 May 2022 14:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75DC10EDB2;
 Mon,  2 May 2022 14:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651501639; x=1683037639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ze62bX/13SCX7+bPkXpG87Gmi9yzBZ3851xC3RJVAGw=;
 b=QaTxjESuweBqdhJ4L/NQTwF08qFQ+fjBk+sbFWBGErraulI7nB+PR5u3
 SirVVJlks1biQ9CwC6y3ODkNm5nQSzntHv/wfl0aRNV60cPMoF/NikU8D
 IdPjpnMAo+TKsg1nr2dEs2YBX6dfUuq0H5ZNsMuS+EZH1u2MfjyUWBVgW
 X7jJWVBF4YEo1evKOS8cXfKK3A6BkTYFcPR/87VSPL73PUIm9H/bhCYkr
 BE2K1vh5JzQD8Q/m+zxsoBdwYbVVF1fH71gMvQaSiJzB3vPs/U3ELrDqG
 4d0Ceyh5rk1xBQTI0bT7T0qNVJ5RdLkEjMjnvIWHPnNGxCAsSymmFw5Il A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="254677091"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="254677091"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:27:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="516111853"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 02 May 2022 07:27:19 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 07:27:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 2 May 2022 07:27:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 2 May 2022 07:27:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 2 May 2022 07:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dxzyst911n1iIBKGrE7nya1L4/lyqU2ZYzxaxnd/ndrTf6jcEn0OziGEa89GA5Gv2qihOenhSNr3bOCc+7HBApzzhFzmV+Gd+Ihwd9l/hTvgRIGYZPIvjEWEAzvLCTKHL3NnnQqknJ7oXf+ih7eLBF7HPc9ggP1tZeheXDjnWCGo3ekfle+LsQehTkWaNul4XQDCoimhTN8irqbpvJBA2Ze7ylALNiElwCBaGe/dTdAt9BN5sjUfUTB8DtRZyqU/HrSBEVMvGJt9YJAUPmHMcmPOtTuxlEYqv3Cw1ms+HjbQs6T95u7/6IeMFtLJrkp77+s50/XxU35nWOqrr0wZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyLatQf/ylf1PcZQrfUeukgF0Q0n2ZPIBKok0EaJDMo=;
 b=kuDBj/+5B/Hs3/5s4GgVW5p6BV/NrA2BE8yB7odKP1lwCLBrfBpc9BZ/W+/NQ2kI9CIImztLh07A8A5zkZDThZx49kU7kLJHvpdI7R+DjoQZjJ9s0iWri+1y3qdQtZ36NIyDfdj8JFrP+Z1gFmcIV60Ui1uxzMdMLqjQjdCoWrPRB89kp3EfSFWfIBgSlC7FIAqGIipxdwNAnegJa4dBlfbkAODFO0MscIvvCIzjvFR2U9bIus7S9Y1Qd0ojbmmcL+JGXr+Ag0CF3U4qkdTgCg7MLggMJ9KZS/HJ4/58O9MM3moVpy5+rZ1UYojK5ZIU8zb08Aq5h+pqyWHrnlZrJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 MWHPR11MB2014.namprd11.prod.outlook.com (2603:10b6:300:25::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Mon, 2 May 2022 14:27:15 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9%8]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 14:27:15 +0000
Message-ID: <576d5993-8108-218e-45a0-bab1ae4ca84b@intel.com>
Date: Mon, 2 May 2022 19:57:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
 drm
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
 <DM6PR11MB31778321FCA58010AE44D867BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
 <29f40e83-a9a8-c0ac-1702-f9d0bf0f8861@intel.com>
 <8a9ba046-5e2c-442f-aec2-f1683097d100@amd.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <8a9ba046-5e2c-442f-aec2-f1683097d100@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::16) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 342d99d5-5db1-43c3-d9a3-08da2c47daef
X-MS-TrafficTypeDiagnostic: MWHPR11MB2014:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB2014F30445060BD14E0852EA8DC19@MWHPR11MB2014.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dHPVAExMPwVuIxx4Mf5MohfANpOimTaxdxp8IkG6QbqbZnlodfSQcno2+qDmaVXX4YWEfF9hxUA7UdHUctFyvA7vudHovY8ifK3ih54nDpPn5bTtl0RGK33+0hRk4zCuXD0od6NJPce3yiS3pmrd/I+v9eCwdVND4M7j7uL3O/FTSxN43uBBD7GaI0AaSDPm9oGSFwjD7XdJUrEz18jhHP/fWPaDGYfcAhcSUNLi10w3i7t+Vpa79HrQEBFYUlK64DmmQjoCtHc1gLESTezR9QSGSymDiOKtCwY1tfO2UrDrGxqFQ14giZ0xfmoDPnIdUfwjTExEFpNGeU8nvnlXUKBoSPDa8f3f2DajOBd7f5PtS+0jmAA+CZUCXNPIboAHtEdJAFSxBe7l0yPT1ClJaiPOr8qYhyO5UXyT5E74Bxa977TuHmdXgLA25xfElgpG6r10wWHgiKaMMxBTsbfMyik6KrtV3h0kThnKJcyMO2YvJp0ycIYrcLLX17tzR6jcy4u8FX+EjZXcJ+J1xT0ouQac7yEbCMz37fQo4kg0edxagDtx+hdw++v/YGvtopN4kPo7+4exTmKEuV05BfmpScZ/WB8P7an3ZUjzQ3T2kf5cYBQ7N1tiKuVQ1I/0f1f6+Jgm1E7Ykwcs1R/B9OQ47YkwpzfRI/xlIPTHDJKG0qISntxoVY4NWTbIf3lTz5HAn8jd4MQCpdjEMym3bOf/nDlVtzVhFTIqRC5HQvPoX9sYBo8u+vJG4qTb+1iLV+9nr2TDoz7KEgfq1tEdtyGEvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36916002)(53546011)(186003)(2616005)(508600001)(82960400001)(66946007)(8676002)(66476007)(6506007)(4326008)(6666004)(38100700002)(6512007)(26005)(921005)(66556008)(6486002)(6636002)(966005)(316002)(110136005)(83380400001)(2906002)(86362001)(31686004)(31696002)(5660300002)(8936002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MExHT3BpaE81cm1PeHZkQmE3WjNPMW1SNW5ZOXZ3Uk9rUTlDT3VxTmg2bVNJ?=
 =?utf-8?B?aXM3WnlDajA5TkR6aGt1QlRSZ2R5NlZMeENaRklWK2V0TmZXYjdIVDJWWTVI?=
 =?utf-8?B?NFhuTG5GZE56M1hOT2QySEhWYzh6OElHR3RjeEFCbWdsQ1hqWVJ4MzBISllQ?=
 =?utf-8?B?NFdIeDVGSDdYOUpiWHBqbHVRcXhBdVJCNkI3ZUlTa1A4R1RBTElaaTRZU3lN?=
 =?utf-8?B?Z0w0MlBDZnFEQjRzMVBmYkFNSUxXYlVYUGZjWVZUWTg4Z0IyYjJlcHBjblBl?=
 =?utf-8?B?RWJPZzVBUndnMEtKNFFBRXcyRjNIOVBQUmZwNmxpZ0xOY3N1N0pjbEhSZ1Ar?=
 =?utf-8?B?Tmc2Q2NmaUdVajZ3N0ZSbmw2eWNlUUVIQVJ0WjZJUnNqeTZwUFYrMWVpUTE0?=
 =?utf-8?B?RG9uVEEvY2ZQNkIzN28zUEsrZFVXbXBkeGhuMUJGMUZzQmZuM09YVU5HczlP?=
 =?utf-8?B?bmdEbHM0ZDN2QTU2d2lGM2pWM0E3WEFuVDEvZm0xUXVLNGttYWd2ZWovMExU?=
 =?utf-8?B?Wm5YRFA5Ylg2aW0yb3ptY0hYaFBkbXB0L2lxNU9vSXc4MHZRSUtpRUplSFBH?=
 =?utf-8?B?b0g3L0NMWnJMVkdLUFExampNWDJ4TURUT2djTk5rUmxMZ3Z1RlN2MjZOT083?=
 =?utf-8?B?dTBFV21XbzR4VUxSajFJTUlSTHdBNlFtWHZ5RTlmMjFrcnk5NVkwL2srMmVI?=
 =?utf-8?B?SnEwODRGbXhibmhzbmFJa2VqZXcrN0VYY2pQSjljZ2ZzRTYraTVQUThhNTl1?=
 =?utf-8?B?QlZOSlQwOEcvRmpLOW1mY3NZOG8vSHVQZ1hvU3NJc0N2YUxlSkMzNW9zUHlH?=
 =?utf-8?B?QzQ4U1FYNFB2UldTNGJSM084a09nbER6YURMWEVadkkzeGZZcExuR0lJTUJJ?=
 =?utf-8?B?em9PWGJvYUxRZmZNeldIMjZuVEg1c3JaL0RuSGV3ZDJaZmRGVm5qQTRtSGJm?=
 =?utf-8?B?aHlWLzFFSUZiUTBFQ3I0ZmlPeW9aT0lYbDVPLys0blQ4NjYrMld1ZVRoWDlj?=
 =?utf-8?B?dnRsQ0N2Wk95T0RCYTBXQ1hvd05Ga0d6ZTBFZkhoaGxaMmZERHQrY0hOVWpr?=
 =?utf-8?B?blEweVd6TDhwaDdjZDBnSVlSNjVSNm43Z1hhbTFDd2FnR3lHQjNZVXAxNHNJ?=
 =?utf-8?B?cFY1R21tWXNRWTdjS0lMUkJKUFdGZnZpNmF5bDFSa1pRUzdWclF0U2lDaFE2?=
 =?utf-8?B?TkhPTm9RU1dGcGo3U2FhN2h6cHFpOXVRenNDQXpNalIvVG12ckdOUktCcW5x?=
 =?utf-8?B?N1hxNlpOM2lBc1crQUszaXl6SGN5dG9mTVI2VnJpM1U3bnlMV1p6dFFNM25l?=
 =?utf-8?B?MnIzL0VzWlJsQ1ZQb3hsM2YvU0VGUmk3a3VCZG5CWFNoMTBBTVZ4WUNDdDJ2?=
 =?utf-8?B?M1ZxbENKZG1zcG5CeC91Y3JwWThYT0tldFdRWlBVTFk0YXdBMEZ5V3pvZDVN?=
 =?utf-8?B?UnlZTHA5NGl2eURleW1ScHhPd3E3THdxSzNmQ3lMUkM0R0xSaWpMalRSVjZO?=
 =?utf-8?B?SnU2SGkvVHgxcGxqeDJyYUpxc1BxNEpoaVFNVTd5QkhZa1p3R2FKTlBibkpm?=
 =?utf-8?B?UWh6UG9pV0dIMXprSld3WStqMmkwZkp3OFc4Q3NWZEJIdjRvSThJM0JhaTRr?=
 =?utf-8?B?U0tUalBFZ0J2dzhmczR4Ymhid1FHTGR6ekNxcjNYWDA5dmgybDk5amlTTmF0?=
 =?utf-8?B?Z01GTUNqMXNZc2JaRy9TWFF5M1RGRllVOGlzdEluM2NOWm9JV0YvKzlIazRV?=
 =?utf-8?B?UUVzTVQ5dWFpZFZhZHgrNHNoV0gwSTJIYjY4TjJ4Y0lqaWVheEtGRmRpK3J2?=
 =?utf-8?B?M3VqV2c4bklqTjZ5R0ZUUG05eGdTQWwvU3Z5dlBjb2h6NU9mcjlsTEthUHlB?=
 =?utf-8?B?T0JiazAxSkorMWdnZUcrZThUQTBNd2FvNWw5UWdoeFk2YTRWU0pGaTl2MWY5?=
 =?utf-8?B?czN0SngxaXBWdFNrV3RPc3hEdldmekdFMERDVnZGd1NVT2VMdDYyRVk0V1dN?=
 =?utf-8?B?UkRUQk1HTmVnZ2FSa25GV3dkWGhRNGFOMzBxd2lGWmpxVlVjYzlpMnFsdFNN?=
 =?utf-8?B?a25xNkM2WVNlV2gvM09icm9NbVBiN0twTmZzemNiNCtCMENLT05IbHd4VUxv?=
 =?utf-8?B?bWxGWDFjNnA0R05pbW1KNVg3K09kbTlOdnJKYXZsU01Gc1pGZStVaTI4a3lT?=
 =?utf-8?B?SmZJdE40eXQ0QkRWdi9qTDBUbmpCYUpzeGt0ekdJdlZjS3hRbEk2L0UzOStK?=
 =?utf-8?B?L00yZ05ENTA4YThndWkxbDlJbmFZUjh5MGljUHFRZmtCSEZiUkhBRnVlVUVr?=
 =?utf-8?B?K3AwQ0NSSlB4aTdhNytrblRRZVQ2d2VwYU04NWdZYkZLNjlIS0dtajRkRjdG?=
 =?utf-8?Q?THYrm21YI81q16Oy1j69buztvrASScs3TsGrf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 342d99d5-5db1-43c3-d9a3-08da2c47daef
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 14:27:15.7391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krIbaUk0WUE+NJaTKQ7z9s/ZGCe74UyQWW1gHyE5a20WmD5XXt5rkHU/Sh3ykhbdTP9eYPjnDXL3rtinp/+cdaRDZBt/E0O0m1s5eBLJdQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2014
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon-02-05-2022 07:08 pm, Harry Wentland wrote:
> 
> 
> On 2022-05-02 09:28, Modem, Bhanuprakash wrote:
>> On Fri-29-04-2022 08:02 pm, Murthy, Arun R wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>>> Bhanuprakash Modem
>>>> Sent: Monday, April 11, 2022 3:21 PM
>>>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
>>>> amd-
>>>> gfx@lists.freedesktop.org; jani.nikula@linux.intel.com;
>>>> ville.syrjala@linux.intel.com; harry.wentland@amd.com; Sharma, Swati2
>>>> <swati2.sharma@intel.com>
>>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>> Subject: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
>>>> drm
>>>>
>>>> As drm_connector already have the display_info, instead of creating
>>>> "output_bpc" debugfs in vendor specific driver, move the logic to the
>>>> drm
>>>> layer.
>>>>
>>>> This patch will also move "Current" bpc to the crtc debugfs from
>>>> connector
>>>> debugfs, since we are getting this info from crtc_state.
>>>>
>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> ---
>>> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>>
>> Thanks Arun,
>>
>> @Harry/@Rodrigo, If this change sounds good to you, can you please help
>> to push it?
>>
> 
> This changes the output_bpc debugfs behavior on amdgpu and breaks
> the amd_max_bpc IGT test. I don't think we should merge this as-is.

Yeah, I have floated the IGT changes to support this series: 
https://patchwork.freedesktop.org/series/102387/

With this IGT change, we can merge this series as-is. I would like to 
request you to review IGT patches too.

> 
> This patch also seems dependent on patch 1 of the series. Shouldn't
> they be merged together (please don't merge them as-is, though)?

Yes, as other patches in this series are already reviewed, I think we 
need to plan to merge all patches in this series together (If above IGT 
& this patch looks good to you).

- Bhanu

> 
> Harry
> 
>> - Bhanu
>>
>>>
>>> Thanks and Regards,
>>> Arun R Murthy
>>> --------------------
>>

