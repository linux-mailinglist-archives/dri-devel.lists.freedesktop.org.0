Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4EA55B9D6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 15:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2E2113691;
	Mon, 27 Jun 2022 13:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2070.outbound.protection.outlook.com [40.107.95.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98646112B4E;
 Mon, 27 Jun 2022 13:20:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQdZtu95xCR63E9HtWjbisY6VEi8hgF1icU1vpRZC4bDL1gyfY8TMfua9UjLP/6lAh8kLr3F7WJNnf6Z2aJKfXQ6u9pLpfOh/VcPRTOyST78R+Fhr+4S0vMJskW4L/qp/QXMRedx4Hq20RiA1WdjdUBGaacbAenk/FH8B2vvc5V13LdRg3hITp/EARGg15SZmjT5JY4N4ZNCP+slIlSJzb4FozmCVCtOKz4zhUlukpqf0PeXKAVuQ9K6nNwJzzbT2qfBacimj6OVV6FiySPHd09ioCdMaNfoIYPhVpkLUqLQZnrWpv3MEDIBlwsIWh11PrHeraeawKgNUF14AF8jfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTW9807fSmek61EFVObBtCP6nMcSF9w9GZ1UHfALeKQ=;
 b=Kk/VtUqAq68QIK16zyoCelC6kcS/ik/f5vWrTV9kc+G866PxvGr2F5JnAW3bnXBB2F6KaxWvzmZlM7TziXaoEGuw7jAKmk8X8MrONa0r5HzSmuURq8rFuLPJTKTSevnO2m5m1Wk8Vp10HCNk8UDc/y+s5AHLvVBwV20AA0ASzLBnlCZ+3Teew2hHqw2ODnOpHGZItWPnrW9AqS764POk2aWkuQmaaVWtmvwfgjPyf7PBE7N1cFOkyaAwhvEGSCO8LZSJjcx1MD1U/Q5M8HLBypECUay40aw/6Hhw6BkzKlG9BmAuYBCxx/0SKj4c2o/H9V0NzyQv6rEvLR5GhOl+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTW9807fSmek61EFVObBtCP6nMcSF9w9GZ1UHfALeKQ=;
 b=1ECM0HuaaUzpDBkfCNLCNdg9zcXcto3NU6v/YCtM/1BLslA4Us0fChRydyOwFtdlodOaB2J2mA8MFV+osIZZmpcZvX+jeeOxcPFsGu+OjGf08b2ZOEX7VdT5iTo3Ewk3Jasn/TbgdqiFl6cxkbHCJvIqf1iLppEaZAV4n6j4Lmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by BN6PR12MB1634.namprd12.prod.outlook.com (2603:10b6:405:4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 13:20:03 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::1563:b9e5:78e3:5c15]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::1563:b9e5:78e3:5c15%5]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:20:03 +0000
Message-ID: <f55999ae-4ff3-2616-fda1-a97e5aa11524@amd.com>
Date: Mon, 27 Jun 2022 09:20:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/amd/display: Remove unused globals FORCE_RATE and
 FORCE_LANE_COUNT
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, wenjing.liu@amd.com, Jun.Lei@amd.com, George.Shen@amd.com,
 Jimmy.Kizito@amd.com, Jerry.Zuo@amd.com, michael.strauss@amd.com
References: <20220626142053.3373970-1-trix@redhat.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20220626142053.3373970-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:208:32b::8) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24aca21d-a20e-40e4-54b9-08da583fbe92
X-MS-TrafficTypeDiagnostic: BN6PR12MB1634:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eBydMWiUG+3jBtcY20nkZ2SfxeQIPtI139pBbmOyuCYBbNLhu/DgkavSQqB0cxnDu3nmpO3mJtInISClrjYIYbTowWdbYTu0BlaePiWEUGGUj6fzX8thu8WfFPLvAUFRc570bJodfqmQUslAI87Bj26v0jPzLwAMg+R5PB0MmVXEXQI/E4a4dDuOZcq2rPyBpi4Icdwp2NE80IIWJSfJ/3yYyh8ZWRUv9MrSijlPSuPFsE/EpiirH1Ute+9qvK5Xawxfr7Ik7eWWvcqHnjk38E54aFn8F4JpdIeI8AiWc+/JkIX7LzIcwiFIKtFw1kUMBF9Ofl5wE0u4BkZ7HTZX1chpJCwVO9ehC/gA+U5zgOIcj0SuQC/ecms5qDx0BpC8EApdlwy486vveAvecBEjuMmGtqQD2QOE+GJnGusE9NNa6h+uZVfumiJyHcRMtUoOGoYp0FIKGw7mrt56DrfSj3uUyvP31Jt/aD3PHi+TEI6wkn4iLXCbSZ94IxUZX+EgROoCNN/3OmsIx3dFIRMNQzj09sYv/6FelSBLZuptyqlcYuprYvgBxiJwcTHQxblDECbq6L0FbjAe0H0iYUKWnfqN66GI3RXwwpi7AQ0Npci1nUjhmFb8rcNS7d8COLe3wNaEFy5Ol501UbBSqX9uQ0sUIH9DfSk7C7bScxvMHDGcA7yxHReb/NFzHTqBD4Rj5o2LFjW3ZxS7jWLtIrLHlpff1l16S2bB6675bNsdYqG/pFQ9Wkb654PufnPUZ46f1lWAR2mH8m+C6Bbq9jnrAla7ys9BQCLp7NtvGaxQkcoTZIc8bimdwULhTH+VsrIUqVwUjWHHyBavstgXms4uSIjYxSck5ERh5bs441J2h3U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(478600001)(83380400001)(2616005)(6636002)(4326008)(6512007)(53546011)(186003)(31696002)(31686004)(38100700002)(316002)(41300700001)(6486002)(5660300002)(26005)(36756003)(86362001)(8676002)(66946007)(921005)(8936002)(2906002)(6506007)(66556008)(66476007)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NytoMldkZGt6UDNTN1dVQ0FtMGZQdzQxN1RCUlA3dzRhRFJka1l6N0xsb25j?=
 =?utf-8?B?TzFPOEl6aTBzUTRFWVFDOWNHbDA2eHRpeGdvd0o0Myt4MVVBTDVoNzMwY3BI?=
 =?utf-8?B?dFlVU3Z2SzJNbWJCUExhUXhTaTFzZkdiZTlFUDh6R0dnSDJESVMrZmRiMDRC?=
 =?utf-8?B?VnZBTkU3TjNqbFBRSnZ6SytTUVNrUVpLUFgzU0tFT0xPZVZ6S3lBdHNiOW1i?=
 =?utf-8?B?UlVadlNUazZHWGtwMWxkUFo0aVlDK3NNREFKQy9FZ0x1aHdMQmVtRWV6bzRx?=
 =?utf-8?B?dld6QTd5ZStTdVE4V1YrWTZxZzgya3o2L1lCZUIzckpGYTNmT2FEN21SN2JZ?=
 =?utf-8?B?TTNpekoxZSt4MC9RQndncVpKK3VNemdVQm9aYUxSNFBUbEo2bThUSXVVQmQw?=
 =?utf-8?B?NlVUZ3R0cjdvQ1FXWklUT3RSTXNHQSt0V281V2puQlE5K2M5dkI4MTQzblVE?=
 =?utf-8?B?WFVsRzJiQnY4Ulc0eHU1ZlNZTGREMHE2cklZOEFwbC9JQWdLUVpnQ2RSaEJG?=
 =?utf-8?B?OFE0WnRwa1FSVVJieE5BdVk4Vjh1d3dHNUJ3eFd5Zk4rN2JhWURiMUFOMHg3?=
 =?utf-8?B?MTlyOHMvb3ZTRDFlRW9vWXBUV0tSdEdSYnhPd1VoWWdFNVpLYnBNVUdwNm90?=
 =?utf-8?B?bVd2Z2dTS2c4RU42VWhWUHNIVnd0YXBMemtSZUovd2NNdUYwdnRPRDh6aEs1?=
 =?utf-8?B?NFdDOUV1ZmZPdWdEVVRSaGJlNTc3SmJkL04za3ptM1hHMVE1ekZGbkkxTngr?=
 =?utf-8?B?a1BDWjdBcjhodHkzQVN3Zkcyd3NlYzI2TklCV2ZDMDJoNDduRkR4VTBKekhw?=
 =?utf-8?B?K2Z3SGZUTGVsRndLRzZad1pwTk8vYXhMdVhpNk1udEd0UXdjYkNuSGFwelo3?=
 =?utf-8?B?NHlDdURxemovdi9keTdRSUt5YUZ5WVJ0NFo2RlE5TXNDRXlrditBNjZEaSt4?=
 =?utf-8?B?NlZIcGxyTWlLZnBzUXg5WkZQSXg2Nld2L0dqcmVLSWJXNDAvcU1ja3J4UHZw?=
 =?utf-8?B?YTNSWGs5Sk0rdzJiMEwyVk5NcGdLMFpXblNpaEV4Tng4anY1Rm52YTVmU3BG?=
 =?utf-8?B?RTAwRnZJbUpibGNzYUZnMHVKazkwSzVmQ0tpTjdNUkxOYmI1Mzd1bmJXM0pM?=
 =?utf-8?B?eFNaSHlPQVQrY1dScjhTR3ZmYU9pN0RXRjBLWjhIdk1hOUo2SkwyT0pub0dH?=
 =?utf-8?B?OWxxQnhUV3JSZnJEQnJJZG5weEdtdW1ZTDJuWDU5NkQyeEZTZ3J6ekkrQTZo?=
 =?utf-8?B?QWk4MHhEMzZzYklrSWJ3NDFmYktsdDVpdzkzM1YxK1lTeVVNZ1A1UkpCRVVL?=
 =?utf-8?B?K3VPdHJIeURuQ1NZTTU3U0Vmc1M3elFuMkhFZFpkTDVhTjlTaFAvU0x6Q3ZT?=
 =?utf-8?B?NDVuTHAvNUtCTzJ1OGZtUnh4YTBLUGh3QkdTd2ZiZ1QxZXFWUlEvR3ZtNFh6?=
 =?utf-8?B?Q2NIV2wvUXR5RGI0K2pHNFdLK0txRnpoRHlxNENZdTZiVllWNDBBaWlRQ2pG?=
 =?utf-8?B?K0RqdDBKNGZiRHBkdThkditMYmw2MC9KNnJWOWl6cVV5M0ppTmVYY3ZjOVBB?=
 =?utf-8?B?VVVOcVg2VWVtNmFWSmRWN2VMMGpLclZ0ZFRTbXNjNVE1N0lhT0pLZnpreFFu?=
 =?utf-8?B?Z2xwV3MxZCt0TnIzTmZNUkhBN1hRZnBhRGFHUjR2TzYyU2hJRVNTbTlpVXVS?=
 =?utf-8?B?UUxjM3RIWEFneTltejNDZ0YrUnBRQVJrMlNVTmxMZXA0U0d6RHVtdVlwZS9a?=
 =?utf-8?B?MkpyQUFVY1h2RVE2WEJSSG52cEdYOGplQjlCTnp4TFp3K0U5YldMNW1tZ2pM?=
 =?utf-8?B?SGhHTm1rR3Jza3hQTVNWWjJ5Vk9VamFjUnRORi9FckRDeE5QZlF0T0Nwdkt1?=
 =?utf-8?B?UU5iKzk3NUNtdEJ6bjFqbW9kWnRHdjBjeXhoZFBFRlQ5KzNZd05RVUlhelI5?=
 =?utf-8?B?VUM5VDF2YWRNZGFhYXRpenBZU1pZOC9kZnkrdXdXK2hta002eFk4TU1qMDJy?=
 =?utf-8?B?ZC9kTXhRR01NbmprMllBcWk1MkZibCtDSFdUbG1YQUIxNVNHcUhWYitIZmhP?=
 =?utf-8?B?dTlKWVI2NVkvODdWM0RKMnJaN2QyN3Y3c2F2anJtWmZtQTZMY1BuUlk2RzUz?=
 =?utf-8?Q?A13HxEyDj1HROjwlaOiq+WiKg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24aca21d-a20e-40e4-54b9-08da583fbe92
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:20:03.3228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Wfz/1VBOsnxCtRAh0Q7AgtJCR/H3JueGkIBpqkwdKP4FviWd5mAJMKYzOlqHh0XVBhVys9RaePnMXbsdk3Jpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1634
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-06-26 10:20, Tom Rix wrote:
> sparse reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3885:6: warning: symbol 'FORCE_RATE' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:3886:10: warning: symbol 'FORCE_LANE_COUNT' was not declared. Should it be static?
> 
> Neither of thse variables is used in dc_link_dp.c.  Reviewing the commit listed in
> the fixes tag shows neither was used in the original patch.  So remove them.
> 
> Fixes: 265280b99822 ("drm/amd/display: add CLKMGR changes for DCN32/321")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index be1dcb0a2a06..f3421f2bd52e 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -3882,9 +3882,6 @@ static bool decide_mst_link_settings(const struct dc_link *link, struct dc_link_
>   	return true;
>   }
>   
> -bool FORCE_RATE = false;
> -uint32_t FORCE_LANE_COUNT = 0;
> -
>   void decide_link_settings(struct dc_stream_state *stream,
>   	struct dc_link_settings *link_setting)
>   {


Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
