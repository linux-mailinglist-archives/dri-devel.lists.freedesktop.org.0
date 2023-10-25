Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D127D6FAF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC1E10E687;
	Wed, 25 Oct 2023 14:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DE710E687
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:50:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6MRSS5j5P2exEoq9JAIG6gWqpVaDQ+lLtphLejNSUqYSrgkYdaDRX8sL8Qax7Hfzm1HMLETyOzpp+XFguNlyiBRYVEF5HN+x0+xwGlvdZScyQ1BUo2u36FVN8R6x6N0hUTE08hX9j0WHtx2XKk73HRVJC704FlCl8oYiDWlG7kSaYZuagBrOVxQD6ZTW+1PjPdqsZcjjsTGm+LD+5r9FgyVmIBa2trv9veTq7JJ6ru/Pj4+lsbP09qOdMFU2VNpotVX3I37c4VMvoZBlyzPh3fRnUe/gH2+RIsCYEHvksKl6n4+a44JNTpACi47gPDhUqG0Rh1UjQ78sdEMzc1Z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRiJzmhT4IJklyDw6Ayq/LdYxtTuiZj3Ve1URv8TQaI=;
 b=R99xOswjU1Akle0dzDZTfKVn0vOx+VaRkeUqZSgtsgqEFmQKzZEkyKnUsUc5Rrp0BAcMaw6QA3K1fuq/nT0nqseFdr1tmMwONLPlCfCEmhMupnKtrXmvCRB4643IYYkxQpuUf/P6LawxjHSD1A+iiBokruNLDuJxEDrN4X9sPKzC+lxi55y4DChs3KVUH+M3H3Xe/h0Z1jt5PTJEDMemEu2SHhIjXbdrFNPmh/vdUHWQq3gNKEAiWx3LgTDSEyAJv8nMHbTTjY8DoH/WoMTMzClqHZYzxmbDIiPDv6dXOe42XptdE0bM5/DetKZqFI+ex+mnVxDnYj3llG3fcuMrhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRiJzmhT4IJklyDw6Ayq/LdYxtTuiZj3Ve1URv8TQaI=;
 b=IwW4N0HoaqqqlNVBOcJNzlkuiSdYK9CO8r/QxqxTfC2oCU+5hcGajC/FRHYqBjQTp5mt3sfPXg/ydU9t780jHd/NHJYYzKSRGifmlJoHtYR+FnOWvqr9/p4E+PLoZJIPA2X/MGAoMJ3CO3S9V/WUh1AK9piug2v+HaSakeUvjgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 IA0PR12MB7556.namprd12.prod.outlook.com (2603:10b6:208:43c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 14:50:24 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%6]) with mapi id 15.20.6907.028; Wed, 25 Oct 2023
 14:50:24 +0000
Message-ID: <d4ebae36-265b-4537-ac1b-ae878d236151@amd.com>
Date: Wed, 25 Oct 2023 10:50:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: Spelling fix in comments
To: Kunwu Chan <chentao@kylinos.cn>, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20231025082634.34038-1-chentao@kylinos.cn>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231025082634.34038-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0327.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::7) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|IA0PR12MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: d26831c1-a068-4999-3002-08dbd569b7ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CCRXo6xtJegfdxekAp+rcIltfQ/eT3YA+4MXcLUF8KpfpG08/ZiuEPJExGFnWuhNqTGCckqwN4f2vY+OQyjVLEtPHlYhVnEkO4kX5JYVqSShZ+p1t0+akDFCgpBR7jGXPfio222GXkq5PwYdePjBlARWcTP7vG/aSc8PqWeZdLy46msgmfD7xAYLyATQWmS8+oaHMtnKiBFpymmzEDChrIeJnGxS9ayEglLYljJ+QyG3GsPJMXqXw6ID811KRqql229KxeHWsb84ZEUpJk3v9N0WgYnXbXIoTcFbyJQHikU6kSF84J+T0BklGGz+9zhERrrANexUs/zLddrZnJJC/hXxJoT8UOG1A0sdMumtA/H4v8j9DpN7kAVU9HrBh52Aew7TfuEjtvaNVQRICWSaYO7OXFdEI3tR5pBD+zanEEMffclCBCpUYvO/OztzZKNC+uZXs9Z90tENw2wkx57jlCjdohQlTWX7c4rsn3FDRZJNb5xwcAYgjKFltBF6E71Udssxo+YpsNXSayK13di6knyDLsMUc+cz8SCbZ8b8+cvgZiCGkpO5lPLzB8TwbpKeaLeV6080EiXn9UBc2sTS9yz7cxv7b3Hd+1rfniU5LtOSOzdaZG4HjN+ugyo8O6zFA15RBZetGQ3GbyTnsgK5lQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(31686004)(5660300002)(41300700001)(44832011)(83380400001)(26005)(38100700002)(4326008)(8676002)(8936002)(2616005)(6512007)(66556008)(66476007)(36756003)(316002)(66946007)(6506007)(6666004)(53546011)(478600001)(86362001)(31696002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlBSQ1FIOUJ0bitNNTZMeHhWMUhSTXpka25DM2FWZ0kvSkM1dWp3NURaUHBu?=
 =?utf-8?B?bHYrTXcrMEFZVnNtQkJ3cisrWXBrM05tcGw0MGJvYWxsQ2VPZ1N6Mm9kMXll?=
 =?utf-8?B?WlovVDRaalJPMllRMlNnSXpKYU9tK0JDZ2NSdncrMEdMNVc2alFCWlhtdGRo?=
 =?utf-8?B?bzE2WDlqTHkrQnJIeTFyZjIyb2NlQ0dLc3lyUFV3VWNEMGtJM1BKRDNKQXBa?=
 =?utf-8?B?U2NYSTRISlBzaDR0cjNlWHYzSzd1aHhzSkwzV1ZHVTI4R1lvWVM5cGZUM3JY?=
 =?utf-8?B?c29CUCt5UTNHTW91ekgvdXBYYTNuUDhnVm1iUjcybUFjRHFvRTBYWXl5cy8r?=
 =?utf-8?B?OVpJMW1qRHhxYmt4ZUhPeWZWdEE3SmpYS3k1aEVwRzNLc1dlTHkzYlBMUWg3?=
 =?utf-8?B?aU1JTDFUcTM2aWRqZkJVT2toZ2FoWU9IbTRPQ3Q2Z1NPcVM0TnI4VGwwTGw3?=
 =?utf-8?B?dGRKK0tQdjdxVnJRWlB5K1g3bk9oR2U2STJNRUxMbXo3WmVDeFRmaHc1WXIr?=
 =?utf-8?B?azVOazRqWUxveGRHanNtVDhSeURDNUhmK3llU0JzbnZpOWgxNFJqZ0IzU09G?=
 =?utf-8?B?b043ckxyckJJYk5BcDlPMGNtS3ZwVEp6ZFBBaFNPMEppU24yK0VzRGJzVmYw?=
 =?utf-8?B?SCtpZHdpT2t0R1NTSFhyLzJGcXhmbzNMRVB3S2k2OWtKdHIzeGN6THlRZkdq?=
 =?utf-8?B?K244MGxPZnU3bVpwa1RyTWw4T2dZV3ZhMzBlcmRNSWQwRTNSekZHeWJYRnJJ?=
 =?utf-8?B?bm1OZENoYmlhZG9EVmxWTWNDMHFyQ2lZTVVrUnp3RUdmRnNTb0grRERWcFc0?=
 =?utf-8?B?Y1BMOEk5c2pTMkxFN0xYWndsL2taM25wTDdKQ2d4b0cyRUxpK0N3QVlOcmQr?=
 =?utf-8?B?anJHYmoyR3kvbEZJZFF3TklKR29kRUwyQ0oxNjBzNXptazB1bzdXUWNuUG5N?=
 =?utf-8?B?WTE5SzN3bkdyQU5PdmV1cFBXazBxc0pmbUc2aUNDRmx2WHZSWmliekZpVFBo?=
 =?utf-8?B?Y3J1NlRQdDdxdjZ3N1lJdlZZOGU4WkVOVFlhNmtoWDZoY1pMZkFMQWtGQXdC?=
 =?utf-8?B?b2Y5S20wRkJrdE5TdEw1bVVVMVVhTGhBRG9qcmRFd2ovVVlGbjdoTHRCc1l0?=
 =?utf-8?B?R0pFQTY2dXluOHk2Y2ZiNHg5eDZzNDQ4cmc4SlR1alFFeTRTa2FidEZ2T2Ns?=
 =?utf-8?B?RmdPVjdYTnBsVWE5L0NYZW9TZzRGamxPR3BHcHluNUo0TWN2TUZ2NEhaU1lG?=
 =?utf-8?B?QmgvSjd2eEU1ek1NcENZYmhXR1VWSWhBaVlwNmFUWGhvTVI1ZVJlVjd3Wk5I?=
 =?utf-8?B?Z3hXakxJNnptMWJFMjRRaDZLSlFMd05jTm5IV3hNNURiamh2ZDFSS1UzaFVX?=
 =?utf-8?B?dXUzQklidmxvRHVWeHd1SS84L1dTTGdCVzBTK1NKS0hsbzg4THBTVWhhTkhS?=
 =?utf-8?B?bVM3SUJOSG5lMjFjV3d6cGxwZWFxOWdTMksxaGdNMEtaelRJUHlTT2tsRGw3?=
 =?utf-8?B?K0VRazVzSXJ0VFFGd3VpTjFrcWVQbkZuNnhNZTBhckxPSk11RWZLeEdhQ09z?=
 =?utf-8?B?SnRHYmtaYXl4ekxHT2tnN3hjMHZPVjVTdnJocUZxdGtkR1h2Wi9teGVJbU8v?=
 =?utf-8?B?TkFYL3owQmZQelZYWG1haVl3OGlsSllRRmZ4U1RvUTFlZUlrOFMwaUZPWWJU?=
 =?utf-8?B?N1RiQjc0TFk4TktwNE4zNWRnbmE2Q09qemtlREJrWkpBOWVBMTdMNzdUKzJz?=
 =?utf-8?B?OTFycm93bCtCSk1ZUUkwc2hxUHFrTDBJemxGaXJVMnFNTE5oekF2NTJoVkE3?=
 =?utf-8?B?czhQMzlVNnJmd2lrVmtjZjUrL2pzL21laG5MclIzaEtGaGwxUUZGeTg3RzhD?=
 =?utf-8?B?dC9aMTNXZE1tU2VzSi9sWVRNeTdVSjdyTG80c3Fzd1NEVkFuc0dkVlNFYkJt?=
 =?utf-8?B?Ny9BVEhRRzdNM1NhNUN6U1hHVUl3UFg1MzQ4ZmwzbjBwMUh0ZUFodE1FTTlO?=
 =?utf-8?B?T1dSaE1aNGNRY2xwYWRuaCtNdDg0Y2YvL0dSTFJFWFVXTjQrOUZnY2liMno1?=
 =?utf-8?B?akd2R3hZNUtnMFZFRWJ3YnpPZi9TelBEdzZHQ3V5d3dWZzA5b2VSZ2l2bWxE?=
 =?utf-8?Q?Zb21q1wPz3nhDsRoNHI/VmpWk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26831c1-a068-4999-3002-08dbd569b7ef
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 14:50:23.8972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fo/YD/pG9l2/WNU19s+O4sMOeRTA2TtYe+jqCukA/u3xOGxfcukSuv2E6QJDX4JQHepHQNweF6KCJh3e4qUXvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7556
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunwu.chan@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kunwu,

Can you make the tagline something along the lines of `drm/atomic
helper: fix spelling mistake "preceeding" -> "preceding"`, in general to
determine an appropriate prefix, you can see what previous commits used
when making changes to files in your particular patch, e.g. using the
following:

$ git log drivers/gpu/drm/drm_atomic_helper.c
On 10/25/23 04:26, Kunwu Chan wrote:
> fix a typo in a comments.

For patch descriptions you should try to more descriptive.

So, something like "There is a spelling mistake in 

drm_atomic_helper_wait_for_dependencies()'s kernel doc. Fix it." would
be better.

> 
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 2444fc33dd7c..c3f677130def 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2382,10 +2382,10 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
>   EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
>   
>   /**
> - * drm_atomic_helper_wait_for_dependencies - wait for required preceeding commits
> + * drm_atomic_helper_wait_for_dependencies - wait for required preceding commits
>    * @old_state: atomic state object with old state structures
>    *
> - * This function waits for all preceeding commits that touch the same CRTC as
> + * This function waits for all preceding commits that touch the same CRTC as
>    * @old_state to both be committed to the hardware (as signalled by
>    * drm_atomic_helper_commit_hw_done()) and executed by the hardware (as signalled
>    * by calling drm_crtc_send_vblank_event() on the &drm_crtc_state.event).
-- 
Hamza

