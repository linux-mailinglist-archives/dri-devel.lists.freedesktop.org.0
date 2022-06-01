Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F0253A29A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 12:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAC410EEAB;
	Wed,  1 Jun 2022 10:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B21A10EE8F;
 Wed,  1 Jun 2022 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654079524; x=1685615524;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=50NYPI54zfwQwq+fEnaANdVXRCaf3G84HVvUK7RKGNE=;
 b=MPc7BejUC0KDDWRErJCAd3dKZw9fQpZUWhqyTymO9dkYH7RWU9BhQT1Y
 GNs1ydQ1MMTqUE1mafTq128x4WgPanbz1SVmctsaddDQFQ2MGqaSOS8w+
 BwbDhnWm2yjnxx/MotuJq9AEPIcmua2/cfkzFA0ASq1xJOBhO1Ht+d0y5
 h9iYMKUImYdzMZXM3GKLlf58g0bLLdLSOsvlf4Tqr8DC2WOFvOXFeW6jU
 xvibttiRQ8QtZuGTOIuN0lrWEtWeiKtyYoEEoC1mAgalCnJo1lYdu6Uhi
 0MFokqxaVwgkYpH6wudyiG+kHp4JEvU8NPPtPi88A0petm2KJK0KrMCWW Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="361917814"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="361917814"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 03:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="606193811"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2022 03:32:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 03:32:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 03:32:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 1 Jun 2022 03:32:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 1 Jun 2022 03:32:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOPjwIXiaEp5USCm9YpHVW/FCTs41LahurUSVEMvFl4Fg2PeyH2qeFxttBZCdgKtPTz2GdJW7Zt5/RpWQLD35KQwjxwOPw2lgk6IFCJCku84I/LXrPpPC2d6Bgt4Dd+4NQkf7zBA7Ar9ZgsCQFE9bOUMX1koXU4nV5YQr62k0nKICzetC+9Uz3qxY/FuoCAgsK5B0jckDkMmSvOQ4IVqhZ2eojfTcy7a+IHn/ugvLJ3WqAr2+ppbf08SrHetOD7NirolPqYQfDSTeS9DvPiUDEKejljMi+776ySUZlfmDbdIcNc8AYxMLLEi6DWOIRoMWRK4rDE/0BmSKa9aSmQ+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Per9EizS6LxaexmQB0T2LchuYQCfTZ69EuNrfDa3Tpw=;
 b=R6AHYIzlpNhSRUCcgDE0k6VOh71JK6dg5iyLS/5pRGyd9d/YbwW9F8TZUkJF8K5ng9Xw1GOlEYY5Rso/Kqo+bfslHkT7vD1DNGhakb+ZVRqkuooNF2GgCq36eqpgF/xvjfYh0FbLq0taZ4AikUMNreuyErf4FKJ3Q9aciHFGyfQJQMwmswIElARo9qbKKEpvr5LlD2kl7OQtc40JTSK6VdDhAgI5SiiNP+gTWJY3dQP8c11DXZkZg4PK8e+2uZj+LqvLFEk+0a19UkWonWYblLkFwtsi4Y2KsQ3ARk0k7a51/NKARc1Y0bjVgIUQI2jSgqUcpGC6z5RERjQXNEFBxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CH2PR11MB4487.namprd11.prod.outlook.com (2603:10b6:610:44::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Wed, 1 Jun 2022 10:32:01 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4165:e33d:ade7:9ba4]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4165:e33d:ade7:9ba4%6]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 10:32:01 +0000
Message-ID: <1bab5399-af4d-0e49-987b-b13073486830@intel.com>
Date: Wed, 1 Jun 2022 16:01:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC V3 1/2] drm/vrr: Attach vrr_enabled property to the drm crtc
Content-Language: en-US
To: "Navare, Manasi" <manasi.d.navare@intel.com>, Harry Wentland
 <harry.wentland@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
 <20220517072636.3516381-2-bhanuprakash.modem@intel.com>
 <20220531171223.GA257110@mdnavare-mobl1.jf.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <20220531171223.GA257110@mdnavare-mobl1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::31) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ec3654e-5eb6-47e7-ac58-08da43b9f67a
X-MS-TrafficTypeDiagnostic: CH2PR11MB4487:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR11MB44870167C94BDAEAA62C35578DDF9@CH2PR11MB4487.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MPG26lDWqUwZVTOHxfvXW4BjME3u/ZuscSXp1t+2mbRNZS58TGwftpTHShxCZhG0lAXSggDPNlcApLGteVT2gkIMYWwEj1tFBvm7TIJvdOct4OPbzm1G4VjdWfU3LtXDzRpEkuPkbDXDfV29Y/XQbe+fNR0ubXIs0sFmsW0SwQEEs0TH16ej0JY6qq1Lp0QR0wUwfi0zjME+hCiQJ646hSmEEb1dcRcAirKrYqZFyxR8exMf6xdbnCjM3FfABVdt31L/dZtTid2Wswwk72qIGWFEKaFuQlAzowMAkJUf/hmJq9Eq+jebCyCyO4zy8e2Ifyp2ZUX31LJFDSmFajwkkFBdz9PqmJxNhdX2xQIyq/ib3dQy8DbpRaSnSdSjF8EeHZYQ8+YaCuwV1Fqem3tkAqK9G35jFPHDTcgrHEHoLzuZF04mYLM+xV1+jFwcW808k16+3qFC8+m3/YSexUfz40Wc460/Z1pnkkJxHRAcARvVBH6Mv/bURHn62/ZaQoT2cufMLhQPTGBfAof1+NW7FnzoOFPx575qlIeMiv7F7BCEzc3PQZdBmjVYVp0KRXoHZdtclG5xcz+eI7AvY10SY0gghGSLAB666GpATzNmCnbof8MdM1nP7gEPCSZ0NoFrd90Rz4I59FtgydxsZnx8evjEcTMvjVNtmkHLwhQx0jSt/0aB2mNPBZaU83m/Cz4wJrSxvMYR7peVB8e2Ssu7F28gCl+3QWhSrLFHK/ve3wE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(966005)(6486002)(66476007)(316002)(26005)(82960400001)(8676002)(6666004)(36916002)(4326008)(31696002)(110136005)(6506007)(83380400001)(86362001)(66574015)(186003)(66946007)(66556008)(2616005)(508600001)(2906002)(8936002)(5660300002)(31686004)(38100700002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmVuRlh1TEkwSGFYOGNQVlV5Zk1yWGM3ekU5dGNweGt0b1pqckkzQWhYeVRS?=
 =?utf-8?B?QVcyenBqRHMvUzhHL2ZLQkwrdkE1V1NydVNjMjB3L0tCS0xDM2FNRHAzOWNY?=
 =?utf-8?B?cUR4V2w1WXJMVTJqZUlxc09VNUkxeURadW1pcjlHcGI4bU4wWGtWeDZRb3FU?=
 =?utf-8?B?WjlmZ1ZIT25GOVlqN1RLWitvcTJYSHRqeUFMS3V6dHdpaU9lOU55YVI5L0gr?=
 =?utf-8?B?eEh0Q3RNZFlEQVhLOHpqOUsxY0lxSmpEcnAxSlJBdUV3WW9mcUFhNStZYThQ?=
 =?utf-8?B?a3owd24rdzlncnFDbHpSYVZra1hJc1d1WlVibzJDZTlIck51MVBUNHpXN2Qw?=
 =?utf-8?B?Z3MyUm9PSTZPaVRGc3dEc1VWRUp2NWlxSlU3L3dtNzU1ZUhHaUpyNVo4U2Zk?=
 =?utf-8?B?WWhnNm9XaXlIamc3eU04V3VmK21TYlhQZEJBV2JBaVQ5WUtnMDRqOWd5aUZM?=
 =?utf-8?B?THkwYXFGR0d1TzcxQ3ZuY1R1MDFxVGZxU2xqdDZKc1FkUktTaUJ6aXA5eDEv?=
 =?utf-8?B?dXVsQUxsNVNEVjh0ZkxPRWp1UXlpQ0xFNUFyUENSbWIrZDV1VVBEWDkxczll?=
 =?utf-8?B?YUIwZUpMejFsakVvYzRMMlU5ZGM1Y0hQWUc0NVlJT3hPeFZaZXN2UnlseDRz?=
 =?utf-8?B?TTEwOE9pWld0ak8wcVpIaTMySUlpbGR0VVZVc2E1bmNWZFU4cWRBSGNIVDU5?=
 =?utf-8?B?QXRuMk9DemJHYVYzZzB6NVE2bVBxYzIwd0I2Y05xVksxM0xRbEtrYlRaRHdn?=
 =?utf-8?B?clBhY3pzM29QRW9VekxTK2F6OVZjclZxWHlScHNPb3VkUExKeUhQcTF3QytH?=
 =?utf-8?B?YmhxdWU5cnliZlJmVFFHNVBVOVNqcWpSaWsvQnJYOUFabWs2WjMzYUZ3MWJ4?=
 =?utf-8?B?eG1pekdJUlhsaElVd3UwNzVPcURRVDdYYXgyTFF1UE9qbms2dHc4VUdPOE9L?=
 =?utf-8?B?S0ZZcUFBVW54TFhWQ0dpUnFLc0xoQmE2ckh6elF6bytnQ3VLZjM5UW1KTS80?=
 =?utf-8?B?TGpNcEkzTzFPQ1RybkxKM0NNS1BNWXQzSTFXUm5zZjRZaVBsbXphTmpRY0hr?=
 =?utf-8?B?blJ5dHM2d2tXLzZvRHRTdGVpU1Z0RTZTenlvL2hraEw3Qmo0ZS8xSmtVM0VF?=
 =?utf-8?B?UGdFS2pUU01hcXFZRWc2SmxmNEZiRXd3WmVXSzV0VDJkSUhucGhsSzAxb01Y?=
 =?utf-8?B?NzNvd2M3YjZSUDNZM1ZCcnFZN2s2Q01XYjg0VWpscGpVbm1PZVdvTm9oTHBN?=
 =?utf-8?B?K0labWJCQU1GdHFzUE1YZGtuR0dHbTdFdWxIR3BaYjJqSzVQKy9IMWxFajJi?=
 =?utf-8?B?cHhsL1NTM09DeHdRaVJpSDNNQjdGMkh1ZHczaVpxOFVDejE2dWpQVTRVTlNC?=
 =?utf-8?B?UExIWksvSHNZYWV1MnJnVGpER2ZYdlpjK3JaSHdJai80MWRpSW1PS0tGSE5E?=
 =?utf-8?B?VnVUYzIwSzR6UlhBaWRjMkFMT1Axa254MXl5bmhDL2MxTU5nYlo4SG1QN3ZY?=
 =?utf-8?B?MXFjQmlWeTFhVENUUmE0MEdhN1dMaDJ4NmRnZCtYQzBEcGNWcWFwMzJZMmk5?=
 =?utf-8?B?bUZsQmw0Uis4ckJjS241SlFmc3FWZktLVWd1OW9YQ3k1TGpzZFN4N0RTVUFp?=
 =?utf-8?B?cVVXZzZtQVVjSmR2QlYraHd4czlIMlRUdjVwRzRSSXdzcXpJcUJwWHhMTUM4?=
 =?utf-8?B?RjltWmF3ckZPZ1hXaThmR0VhU2MvV1Blamk2dTZuK0ZSL3cvOVc2cmYybHI0?=
 =?utf-8?B?NFVYekZORFlkWXhXcHJNYTJjdUFHZHMydEVaREZFT2YySWFqSnVIazBta1c1?=
 =?utf-8?B?UEVxcjJlekFZY2RyanE3RSthRDBCU0I5SXo0NEp2cURlNm1IWG5sRVJydzFh?=
 =?utf-8?B?K0FERTRURmNyRXFnK3RxMVNLeENobXBsMXhqb2xHc2tEZCtjMG50WnJjT2Qr?=
 =?utf-8?B?OURiVmlid2RFamhUTGRZSktTSzZZV1MyRnNKRGtUMXlxaGhmb3h3TXQ5R2Jw?=
 =?utf-8?B?RkVxUllxWTRmYmRVNTF6WTlVWTJkTmdrRFc2dXloOGVhZjdUZ2dCcDBXcjJy?=
 =?utf-8?B?QURMd2hUSkg2T0hvQnVaK1NXL3c0RGQ3aFg2WjhVcmdGRGVvNndZbzNCWndq?=
 =?utf-8?B?ajJzRFRlRHBoVVR5dW9mM3lRd3ZOUUNMYVQrblhzTnhUSkR0OVd1cWtmUFh4?=
 =?utf-8?B?MmN1dXkxZE5wSENMNXNzNG5nUExWMHYyTmZQaE96Q2lGejBGanBKTmU0cURR?=
 =?utf-8?B?N3dtRFRZems3S0pYblpjWDZJNFhuNExoOThBdmd0b3RtV3M3Z2ZLbnJyM1Fh?=
 =?utf-8?B?cWRNNTBCWkxFR2VOMzBBQ1NlR1JKc21ZMmt6V3RXREFtQzhwZS9sSE1CSlVy?=
 =?utf-8?Q?SDoCB/9fIH6a0mJQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec3654e-5eb6-47e7-ac58-08da43b9f67a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 10:32:01.0373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YgHpYdvvWgJIejzcFWb+9Ca/VPr0DjGEu9tAJ9MbFE71AMqwsG1QKXppnx8/7UmcQSXCCdqqfSs3OTX8dsS3H5OYEV+weDRRc36SLbrjfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4487
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

On Tue-31-05-2022 10:42 pm, Navare, Manasi wrote:
> On Tue, May 17, 2022 at 12:56:35PM +0530, Bhanuprakash Modem wrote:
>> Modern display hardware is capable of supporting variable refresh rates.
>> This patch introduces helpers to attach and set "vrr_enabled" property
>> on the crtc to allow userspace to query VRR enabled status on that crtc.
>>
>> Atomic drivers should attach this property to crtcs those are capable of
>> driving variable refresh rates using
>> drm_mode_crtc_attach_vrr_enabled_property().
> 
> We are not attaching the prop anymore, please remove this from the
> commit message.

Thanks for the reply,

I'll update this in next rev.

> 
>>
>> The value should be updated based on driver and hardware capability
>> by using drm_mode_crtc_set_vrr_enabled_property().
>>
>> V2: Use property flag as atomic
>> V3: Drop helper to attach vrr_enabled prop, since it is already
>> attached (Manasi)
>>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>> Cc: Manasi Navare <manasi.d.navare@intel.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   drivers/gpu/drm/drm_crtc.c        | 26 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_mode_config.c |  2 +-
>>   include/drm/drm_crtc.h            |  3 +++
>>   3 files changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
>> index 26a77a735905..8bb8b4bf4199 100644
>> --- a/drivers/gpu/drm/drm_crtc.c
>> +++ b/drivers/gpu/drm/drm_crtc.c
>> @@ -239,6 +239,9 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
>>    * 		Driver's default scaling filter
>>    * 	Nearest Neighbor:
>>    * 		Nearest Neighbor scaling filter
>> + * VRR_ENABLED:
>> + *	Atomic property for setting the VRR state of the CRTC.
>> + *	To enable the VRR on CRTC, user-space must set this property to 1.
> 
> This prop was primarily a userspace Write only and driver read only
> property which would be used only by the userspace to request VRR on
> that CRTC,
> 
> Are we now modifying this to be used as a bidirectional property to also
> indicate the status of VRR on that CRTC which will be updated by the
> driver?

Precisely YES.

> 
> We need to add this accordingly and update the DRM documentation and
> also get acks from other vendors since AMD and other folks mght be using
> this as a write only prop.

Sure, I'll update the documentation.

@Harry/@Nicholas, can you please comment on this approach?

I would like to modify "vrr_enabled" prop to be used as a bidirectional 
property. So, that userspace can request to enable the VRR and also to 
get the status of VRR on that CRTC.

IGT to validate the same:
https://patchwork.freedesktop.org/series/100539/

Example:
* If userspace has accidentally set the "vrr_enabled" prop to true 
without checking connector's "vrr_capable" prop, driver should reset 
this "vrr_enabled" property to false.

* Userspace can read "vrr_enabled" prop anytime to get the current 
status of VRR on that crtc.

- Bhanu

> 
> Manasi
> 
>>    */
>>   
>>   __printf(6, 0)
>> @@ -883,3 +886,26 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
>> +
>> +/**
>> + * drm_mode_crtc_set_vrr_enabled_property - sets the vrr enabled property for
>> + * a crtc.
>> + * @crtc: drm CRTC
>> + * @vrr_enabled: True to enable the VRR on CRTC
>> + *
>> + * Should be used by atomic drivers to update the VRR enabled status on a CRTC
>> + */
>> +void drm_mode_crtc_set_vrr_enabled_property(struct drm_crtc *crtc,
>> +					    bool vrr_enabled)
>> +{
>> +	struct drm_device *dev = crtc->dev;
>> +	struct drm_mode_config *config = &dev->mode_config;
>> +
>> +	if (!config->prop_vrr_enabled)
>> +		return;
>> +
>> +	drm_object_property_set_value(&crtc->base,
>> +				      config->prop_vrr_enabled,
>> +				      vrr_enabled);
>> +}
>> +EXPORT_SYMBOL(drm_mode_crtc_set_vrr_enabled_property);
>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>> index 37b4b9f0e468..b7cde73d5586 100644
>> --- a/drivers/gpu/drm/drm_mode_config.c
>> +++ b/drivers/gpu/drm/drm_mode_config.c
>> @@ -323,7 +323,7 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>>   		return -ENOMEM;
>>   	dev->mode_config.prop_mode_id = prop;
>>   
>> -	prop = drm_property_create_bool(dev, 0,
>> +	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
>>   			"VRR_ENABLED");
>>   	if (!prop)
>>   		return -ENOMEM;
>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>> index a70baea0636c..906787398f40 100644
>> --- a/include/drm/drm_crtc.h
>> +++ b/include/drm/drm_crtc.h
>> @@ -1333,4 +1333,7 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
>>   int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>>   					    unsigned int supported_filters);
>>   
>> +void drm_mode_crtc_set_vrr_enabled_property(struct drm_crtc *crtc,
>> +					    bool vrr_enabled);
>> +
>>   #endif /* __DRM_CRTC_H__ */
>> -- 
>> 2.35.1
>>

