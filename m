Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD35F5889
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 18:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B2510E2E8;
	Wed,  5 Oct 2022 16:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977A910E2E8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 16:45:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZuA84DIl7dk6WIMkJeoBLgf/Buy/Ee9P+MIYPs56IoLeFG9fp92ctT92iR+rEwBadh5wXlmM6HDMrQWqm7qlqlWMl39dO1uT8Yv7fTR2nUee3V8W3le9IIPTX7fqwgvh9RWSks9RhK8BSY99OGVZXTXEFQktcTQ8hjeRuR1qgWBeGgCn1Qqn/xGwuKs0+H0cH7HurbEai11kPJ8OTARTN0wugBQevQslqw7AIxvTz9d82X+D8mwRhGGnUmixpd2vkjhtXwtVUGFSli/tNHCVCf0Yi/dIoUXmRxrt3NuPYqBzIHBe0qFGv8q6mcIhaWHZtcjETQAfcGb4PHUBMPQsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ll2LfZ+5YJWAwGZPtgpKq9Abl+//nhuwOXGf52ew9MY=;
 b=eRUZF+wDqRFow2ajsj4HL4GyFbMeIGycibArvp7ziWQ4a6ccUT/y2+lII/ebYv0tMOaHMeP0RbU3vscK57k13hA3dYYOlZTxdouq4PUlP04JFajuXIsh8j8Th+r1EqnEJxAz+4NXG9jJ2Zkt7PBvpIM4dts36btFPolgSyK3h2f7eHId5raOdR4jJmBYNWLOmeF0ZRsSWZyWCHZ+z08ScyYTcjEXTYr2nQRknuu47eTzTv6gy1XVYb73v6AwlTidPycIjvViLd0YGJhyzQnC257xpxgJuNqf+BCClvTS1y6N532zRPfeLEWBrYSokllXIGCWdmmApxCL4wdnKO4DEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ll2LfZ+5YJWAwGZPtgpKq9Abl+//nhuwOXGf52ew9MY=;
 b=dbi740zO9oYPChQcesex285VzhFOy/vT9l+vhEhLagmXu85pl1aB1Gj57v94uW5JJdog1UONzhQIcduD9m9ORlQ1uMAOThFO7fdRfYXrCki1dhGXoUOZ4ZH3RsJYQh6g7tiHG661YMlUz4m1IIoFeWsXoRBjIc/cLgn/Sheuz+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 16:45:08 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8d54:65c4:c1e5:8f02]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::8d54:65c4:c1e5:8f02%4]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 16:45:07 +0000
Message-ID: <09cd11c5-2a15-3653-957c-88c751fa9029@amd.com>
Date: Wed, 5 Oct 2022 12:45:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: linux-next: build failure after merge of the drm tree
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20220930105434.111407-1-broonie@kernel.org>
 <20221004132047.435d42db@canb.auug.org.au>
 <CAMwc25oshRcJBoCT70B+b42bh5sPqgyoHuBx6K6ZLrwBMHnJzw@mail.gmail.com>
 <20221004140558.64f59f2c@canb.auug.org.au> <YzwbW4YQwQPsRPYw@sirena.org.uk>
 <CADnq5_PbPQPui1tOdUMB+OYbz6UBMKCgtwvE95oA+SfcN0RzNg@mail.gmail.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CADnq5_PbPQPui1tOdUMB+OYbz6UBMKCgtwvE95oA+SfcN0RzNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:610:4e::40) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|MN2PR12MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: 107da295-96eb-49a1-33d6-08daa6f0f5e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RrfKiTEC8NvYwY2qrFfR2tJA8zVyfBwYDYWKdl3fQF/+HsVUA2fx9hh0Eqrd7KsqEt7/rvxbLQuCFV2On+E2CIVRqXsZiYX4a027PuEW0dUGerCxcEIdfTSO49VCZvTzqIq5RAyoqLwOIWd9K30cynWNiSAMBIAAjCBQEM35qDU9aBfP6qNt6K4ZjOqVM8x5aX7hQXiLNzXQ0vXKB/n6YkJeWHI5i5TGPQeK401Mcp+ltmIBZDy7zXFMq2XtWL6gxdfFc5Jhk8kgcLrDxpwSwnY/U8AvFR7i4sKQbkNlCeAZykwwbgvJQE+hb/7cdR2RyxMOj6eToKcgTMuCHhJG1nkImoQuJRXLJl6HXfpHCArQLZrnbKK8COFGff0CfieUN8lOy+nLKlZXjWtGftbr2Gqh/9/m9gwdz675T17BzhGZrooQ6GwL4GqD14HwjnO5ulJwvT3g4NVdi+BSB1jrFk7SEYiWbOCcPNGKIAUlAfWRywKXT6RikCv5M+wSg4TzuqU7ykCBXMQDlA3oNE4Zswa+5GNGex+xUO1LkQgwwmulJdkHYf2qIyIAzJrK590PTZGC/9qP0bUvhprVH8rF0rK7R5iGJy1rOoIqFwKjpKsERe3T3ru9X4Z7T4t+Xr886QM9gfgYraHGHujqPxQpn1shq3Vk9JxA6bYCAsZH0elO5knh7anpBMPiWl4+DRvCmha34WXtlsWA1C+v02dtQ9rkp3iAFi2XlS1fkURxL9Wd33T2HRMq+lxxaw2mwzWuS8HCcjACMKuzBWzxMwe/pvRvuO2xPhe39AVnnelSmhs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199015)(2906002)(186003)(83380400001)(38100700002)(66946007)(66476007)(66556008)(4326008)(8676002)(316002)(54906003)(44832011)(41300700001)(8936002)(5660300002)(110136005)(53546011)(6666004)(6506007)(6512007)(26005)(6486002)(478600001)(2616005)(31686004)(31696002)(36756003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFNGOHNFa1pVN2VPOTBvNHUzbExiNnpPUE1YVGQzRFh3bC9mcFl3RmFVVWZh?=
 =?utf-8?B?dG5rcElPN0lBajdMMGFKSERHOFNBSjhxV0pRcGFERDdLV3pRYkVOcWw2UzBk?=
 =?utf-8?B?eWYzRFE2WUtLZXMvSitucXVyM0JLTEFiaVU4ZzI3bElqVXN4MkZrV1NQRzhD?=
 =?utf-8?B?L3VVTjZwbkR3RkRldFpya1p3RDAwRlI1UjVCcGdyOFlOSFNVVW1rVE5vV3Zr?=
 =?utf-8?B?UndVNmY1ckd1d3NaakZKdTRTWTdsMFZ4allBT1BHRFFjNDFTeHNpU04zNE00?=
 =?utf-8?B?VnRmRms0cW8yTVJzU3JhYWhWNjRkZFhDYWYyczhPZUZxR0NnaFpiZ3VSY2JY?=
 =?utf-8?B?QVNnSzlId0ZDU2ZHNU5UUWJBc3YyT0pFMzdKQkFjZVM5OWhMZmpvNVhaWTVK?=
 =?utf-8?B?WmlRVk00N0tMSDhURTZFQ1p5eVNTZjIvV0c5b2JrTklSOENXeU5ud0hONUc3?=
 =?utf-8?B?bVV2UHRPN09LZS8xTytIVFBZckpkQnZXMjZLQzNtVjB6SUp6VXphUnE4bisr?=
 =?utf-8?B?VE80MHZXVE53T1NEclF1cWQ4aUtHbTVMdXU4TlZnNnhhYVM2VVJDZ2lIQ3hG?=
 =?utf-8?B?TjNmb2ExZTBJcGdFelcvc3NhbStnTEZCditaNGhLWFpITDV2bFdpREhUMVlk?=
 =?utf-8?B?ci9nVzlEY3YyUWlSblVlOFNvOUR1RklTZGZGeDQvalNlMVVCdnNHaGwwNTA4?=
 =?utf-8?B?ZTg5d2V6UGJCOE1MRURIT3NHRDNIQUp6dGxneXM4TVFwc2QrZTdKNzJGcS9Y?=
 =?utf-8?B?REJyOWFYVTA3RmtHWVhrTm81SC9pOVhMOVdWenJ2cWJjZ2JBVmRhVVRvbkdh?=
 =?utf-8?B?SWVmSWtXQTJ6aHRId0FaVllJSWZMUnJkYU9qWTlubVY1N2tqRkxsbGRCMjdD?=
 =?utf-8?B?MXp6dkZCSGJUZVpuVUxMWDhzQmxKQS9NbUUxdFhDbG1yR3g3VHYrSHpyeGVK?=
 =?utf-8?B?RUI1RHpMelA1RFNDVmd2b1JBRm1pdUJ3clRvNm1Od2Q2eEF4NkFxUUpzNCtp?=
 =?utf-8?B?SzRNNkVJR0dRT3g4bzRvZHQyZjQ3TTVMZ2JpUWQwN2c2V1J4WGRTeWdwaitL?=
 =?utf-8?B?RVkxa3FLZlIvOS9OUzEvRHhPVVpieWNybzBYNzh3ODRUR1BpS0FVak1aSzBi?=
 =?utf-8?B?NDNnRit4ODB3MU5kVzR4eXdyTjZkeHlCWTdVb1FJV1dqVWxvbWJMMENmL2tx?=
 =?utf-8?B?RFVZeUNkNGNrS3crRlZjS1owOHl4ZWp6WVVtS1ZGVmsreUUxcGZLTis5TGI5?=
 =?utf-8?B?WXBFT3N2VzVIKzJQY1FMbnhqOExlMHZkN0ZzelpSTTBPZisreGM3QlRJM0o5?=
 =?utf-8?B?dk5Xa240aHArNzJoSXpPcjFhYmxKVW10U2FmRTZkaXdvUTBLOVFzOEh5YTRG?=
 =?utf-8?B?bUhVWWFRV0IxNDlmcTNSVFh4SGE2YVBVSFIzazlIaDB2TnNpdjBOWVJhbWZG?=
 =?utf-8?B?WkJhclYxZXk3bVpPdlNsZ0NTN2FzZzFaN2ZPSnB2QWIrdGlhM1hTQzNqZGw3?=
 =?utf-8?B?RWFHMjBDUDg5SWV5aEtvSi9lQnExK1JPZzRPZXQycHg1VHgzZnNiS3oxd2tz?=
 =?utf-8?B?WTU2MnNZa2ZQY2FjQjlOK0VWTmJYRlgxaTdiVmQxS1JyR3dkUEZWdU1Cb25F?=
 =?utf-8?B?aU1mcFgrK01NOEtGYUN5MTlSaUNPd282bTA1Z2JQOE81cVhkSWxvdzlZZk1I?=
 =?utf-8?B?YmNXVlRWaDdmbGNIS2VXdHhoWkxmUWwzY0lwbFo4WHBwRW90VVE3cHZqejVF?=
 =?utf-8?B?UFVKK1MvWUo5cG1mZWNhV0daY1FWZG1Relp0TC9zWkRyUE5NVHFnU3g4WDM4?=
 =?utf-8?B?TkdGUHhmYnJsQ0MrMExNRWtKdDhzbXVqelRBYXptamkycmVGdGFiZ0pqU1I3?=
 =?utf-8?B?TTk4bTNYWE9UbzVvNTRmOVpzdjRQcysxR0hpT0xuVmlhMStROUZoN0QvVDVX?=
 =?utf-8?B?VHFSREhRRzVVWUlkNk52N1ZGcnVqd1dUOHE4dDhFeUZTN2RUdjZtTHk2a0ZX?=
 =?utf-8?B?Z1drNjdHaTJRRTZ1ZHcrTEtBZjlBRVdMaGtaTUJwRk1RNllYUmYvZ3lOL3Vi?=
 =?utf-8?B?LzlYVjV6NGY2N1BJQWJ1ZHhrdkZDUjBtWnpiakVLQVY1Q0pTNzVoVWg0VTAy?=
 =?utf-8?Q?scYJHPLRD4XBI6kj6d2eDJ0FM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107da295-96eb-49a1-33d6-08daa6f0f5e4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 16:45:07.8455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUNlm4yh3qJjsnMNifwxKkt1iLNDGKJFCZwxet3T5aA/etPb1Kla8x6L6NAoHgPZ3x/9j2LuN7LRQku25u2P4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-05 11:30, Alex Deucher wrote:
> @Mahfooz, Hamza
> @Aurabindo Pillai can you get this fixed up?
> 

Seems like this is a false positive for GCC versions pre-12, because I'm 
not seeing this warning on GCC 12.2.
However, we can fix this for older GCC versions with the following:

diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h 
b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 9e6025c98db9..67fede4bf248 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -238,7 +238,7 @@ struct dc_stream_state {

  	/* writeback */
  	unsigned int num_wb_info;
-	struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
+	struct dc_writeback_info writeback_info[MAX_DWB_PIPES + 1];
  	const struct dc_transfer_func *func_shaper;
  	const struct dc_3dlut *lut3d_func;
  	/* Computed state bits */


> Thanks,
> 
> Alex
> 
> On Tue, Oct 4, 2022 at 7:39 AM Mark Brown <broonie@kernel.org> wrote:
>>
>> On Tue, Oct 04, 2022 at 02:05:58PM +1100, Stephen Rothwell wrote:
>>> On Tue, 4 Oct 2022 12:24:37 +1000 David Airlie <airlied@redhat.com> wrote:
>>>> On Tue, Oct 4, 2022 at 12:21 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>>>> I'm not seeing it here, what gcc is this with?
>>
>>> I am using an x86_64 cross compiler hosted on ppc64le - gcc v11.2.0 (on
>>> Debian).
>>
>> I was seeing this with an x86_64 cross compiler hosted on arm64 -
>> Ubuntu 11.2.0-17ubuntu1 from the looks of it.

-- 
Hamza

