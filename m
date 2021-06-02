Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B9C398D61
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF81E6ECC7;
	Wed,  2 Jun 2021 14:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52586E08A;
 Wed,  2 Jun 2021 14:46:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhrbHEusELjc5eua7DuWVGyKeLKwAl++ypCpXada9OquYZUUH/cCh+nqDGU/u9R8X3Z75OoqLTaNOf1hfgrmP7Q3TylIk5FQfMjkVWlmZI1RomLtoXjMGpCuGsiMwlibAeqPn9rZg22T1FJJX/Dr/TdT50ycqQXp0SMLTXvnD/iWGz4dMrCDAzYvGKfnIAa6bO+LhSiK/0rE9LWLBynRGwD8LJ8chkKmD8Xw9oTScuwQRU+5f32lRlvhOyI9bVS8O3+5BcYl0Ot56br6UISzv0vKTnCRF3uOWy6SBHbIq/ren4JHVq+L9H05SNrNlfcv5vjcrkN66+3+EZgLzSf0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkVjyZycQAzy3DcttIDxhi0b4z3JKNqMY3HJLE8BMgc=;
 b=e7DBVQepsONIIIn6jt/NfUabRQBOWrcqppB+qSIogZCx8AaZPaqTWMcnfh/ayoj44gtXYzkyD65BmsIYJngun74IcuDAUjiUfSoODvaxtfVxHbEIN3w+fZSyL+XeqLbZA+xPSeg1Uh6lcMMyXMmkZmYwICqJ9mTt2D447ICeWq9U2FQ9Io0J9zoMCg9zLUUUFqoI9njY/lI4XFK7LvJBO7CZe9mig1EbMfXpYj+7uI3RmucI9F+uoh6FX88o3D8OueaI7yGmlnrrXfMjAwJU4rDw9TAWbJ1Tp6jnJpx1kzWOi+F9Zlyja7Rb4LMkPZyld2V693Yw7zv738cMdIyLcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkVjyZycQAzy3DcttIDxhi0b4z3JKNqMY3HJLE8BMgc=;
 b=ZaRmiYZQwFWUk1jdyUov6aKtspVii4mfVKcDQ0ANUCmM74yrmY3bCT3OvEZy8zIfDSUMCm3U6opCNTDFK266FcBPpv063rMVjn/U77pn5TOJpaukFlx0wqtktswciVrJRJjL8VJpx+EEdJ3KZC/4X1fkWMxsiCpWU8kMusyrvOQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5426.namprd12.prod.outlook.com (2603:10b6:5:35d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Wed, 2 Jun
 2021 14:46:40 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753%3]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 14:46:40 +0000
Subject: Re: [RESEND 16/26] drm/amd/display/dc/dce/dce_transform: Remove
 superfluous re-initialisation of DCFE_MEM_LIGHT_SLEEP_CNTL,
To: Lee Jones <lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-17-lee.jones@linaro.org>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <38291a94-4f21-d725-282f-5faabdc31cef@amd.com>
Date: Wed, 2 Jun 2021 10:46:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210602143300.2330146-17-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQBPR0101CA0168.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR0101CA0168.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27 via Frontend
 Transport; Wed, 2 Jun 2021 14:46:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c265e05a-379b-4a61-5262-08d925d53b1e
X-MS-TrafficTypeDiagnostic: CO6PR12MB5426:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB542617FB2002D074037542108C3D9@CO6PR12MB5426.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:177;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 743lbOXrFOmXwlvNb72s165N1zyDA9hj6r+8xlumuP4nkLiaTrXT94TUNvTKfrLnNNPyqP7AcPaaffpP7i6s/1JvyWeViXIoMjHCtM/8OUjC1EpC7vi2zAQo39gvFBLEFkOLS3/zC2qwnwzJaRKdGgj0df64wLdJcerR+dRKvrWJFAIVTk935j/raOBV7Hlq5PXMDkzvbA9C2rByerb80C62gwmJxTI6RucYLxJ1t8ph/Xv6BJZcDCQEDI93W1PgNXKfpEAH0FnFZZPfJaWt3t7CLz75tLOMryIEhgc+AniVDnvlRis7umnXVdEZlSaPMlPlbXkHYVkKyd98JMXRl4mK2GHad8mwvugRGOwAamtRAJ201471MkgvU7Jser+cMzZqoMsixpzreAAn5qj1QaEkA/9YuQovlwwNFiaBNz2JHGNNi+nBGv+Yx11TijuSe20CVY2ckD2WeJUWXrfqAnnCTqZLVJ4P9ADM5vC09JXiL1krjVm2casp4rkke8dFZ2zv2S8OfcEjVsiFsEqaq0XHfV4QbYeCHl3Nvhuh1BVS6T3xmd62NT4lQcGia5exdsWiL1rhmXCUXy8GjqZFee7EIZD4jb5RNLtiG91RQbHLY33zxLsb47m1Il1MYWKZun8f/k3yNM9pvXT3uc8AcuvNr0pnAWzKegrDbLeZ6/eIn/bq+1XNKHO3t70W5Pxh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(186003)(6916009)(16526019)(31686004)(4326008)(86362001)(53546011)(26005)(6486002)(66574015)(316002)(2616005)(36756003)(8676002)(956004)(8936002)(16576012)(54906003)(83380400001)(478600001)(31696002)(5660300002)(38100700002)(66946007)(66476007)(2906002)(66556008)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0pCNWQvUUkybktYWDUrUTdFc3lSSS9KVUR3RDFMSFNWcUdZbkowNXVCaFpt?=
 =?utf-8?B?d2sxT0ttV3I2NitSTHZjNlNoVnJGRzNMbFcrajdBdmlxNnhqOXlObXF4c3JO?=
 =?utf-8?B?Z0V0aFhpdm1GL2lTbmdpTnV4emFBYzIrYWFYUWZOV05qdnhrRG5YR2kzU2F5?=
 =?utf-8?B?a0pKNGR4L05uSDRvL2RFQVNESWRiV2F0S1BvQVRYdWxNZS9YZ3RoQ1lVQTU1?=
 =?utf-8?B?dkl6TmQ5YmhtcUpJUEdXUVpyRDVEM1ZpL1N0dy9ZN2JmS2F6WDVhdDE0dzBG?=
 =?utf-8?B?WUNyVUdjNnk5blRhVkhVMU5KaUNvTnQwRDJjS0EzbjBTVEVNMkd2ZkR6a3Jn?=
 =?utf-8?B?TTcyczVZVmN4R0dHUHFnTysxazhQR3Jkai9UL0ZaYmZVV2hqRi8xY0xVNjNq?=
 =?utf-8?B?TU9sb3NRMVZzYzA4S0FVTWMrV1FiZ1hVNW9XaVJIclpjSTJyY1lhVm8yRUF1?=
 =?utf-8?B?dXhvL2E0WjB1cFIvUFBlZkpKZTFHdmxmZDVFT3ZmSVNrSFRMNFRBdXJTVHZD?=
 =?utf-8?B?eWliWk02dnFDN3k2UjdpaWlURU9YLzVZR0dGWWdoUlFlaE5JNkJxb051MTlP?=
 =?utf-8?B?ekdkSG1VMFpqSklxWnVBYUV5Mnl5bkpHVXVJcThLVmpWcE5TcGQ3VjRFdDZD?=
 =?utf-8?B?MVd2VUlyMGx1anl5Si8zRlVwNFFvNmd0QzdDcXJRaUVJR3A3Wmx1V2x2djdx?=
 =?utf-8?B?YkZQbEc1eU9kL1JqT2Q1TUVhdi96KzNhTmsxYllmOEkwUjVrZytUV0hpMGhC?=
 =?utf-8?B?aVFuejJEY1FhT0czQzA0MWRVSUM4MzNST2hoMit0U1YvTUc2c1kzUzZSemhp?=
 =?utf-8?B?UXYxbHRFcFhMNGNhR1Y0cm0yVWJodUJiamo2STZTeHpxd0ZmMzNZay9sS3VE?=
 =?utf-8?B?cUVNR3AzbW1JeHJTNDlwSFRzSXVIUmZPQU5oQVZmTEVIWDR3a0FsZ1IzYmly?=
 =?utf-8?B?cUI2ZWhSdjJWVGZWMnJZZ2tOdW1nRFBCSWxKZVpqcXd3bkdRU1JTWVoxbWpn?=
 =?utf-8?B?TjhHZzB4V2JNbzhOdWVxYW54QmtSYXU2S1dCeFFaRkx6eENNNXVKd3dJMExX?=
 =?utf-8?B?Q3g5cTIrZXNKV1hha1Z1U3BkOXF6cFBpdzBUZjFzUVpYVEZBK2FUWHRhcjVh?=
 =?utf-8?B?L2tRWWszK24xSGJTekt5R0dYbWg5cWFTYmdxZnFEVmt5K0VtWFFGekhwYXdR?=
 =?utf-8?B?ZmNoTzFMU1FER2oxb1RHMm1lRVVlTU1vQjl6QlJMOVV3OVRRTG1CbGVvN2Fn?=
 =?utf-8?B?Z09iSjUzTHNDQjEzSjVwVjhJcXNqcW1XYnRKYXJkaTRqQ3U2L1RraTJTYnow?=
 =?utf-8?B?cmlMOVc0aGJMOUt1ZHY3MWtlZkVod1grWjJoSTVka29LWTNmQ3BVSTU5Ui9a?=
 =?utf-8?B?amlqSmIwZkpQRVF1K0NORThzY3dMWWpNZ25OaEdqTks3TEhROExDb21rcXk2?=
 =?utf-8?B?cTVJVVM1NEJPWGNiUHRqZG9VTVloT29wenhCYmFBSDhuRE9XZ1o0OHZmNERK?=
 =?utf-8?B?NUllOWdKMklkbzJhU2grdHoweVd6V3ZHbWU3aXRtVG1GamlpMGZHTnRJcGVL?=
 =?utf-8?B?dXRTWS9mQjlHSzBEdUVuUzNkWUo5Y1RjYXFSOGc1NVJhOGE4OC8rRFNORXpZ?=
 =?utf-8?B?cFkwWEI2TktyM3JlSGVDMGtxbUFHZUc0eUF0M3g1S1YzbjFhN2oxaUlGd28x?=
 =?utf-8?B?Z2lRQTB0T3JvWDN5V0Z1YlZiMCtQS1JmazRuenduVzVSMklFQlROVXNNZW5G?=
 =?utf-8?Q?6vdo9prhU9PfJjWdLAu6OzooeowoiwZ/c+htn0Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c265e05a-379b-4a61-5262-08d925d53b1e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 14:46:40.1184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YKqC2H7GacR8yeJi5BFLOwbdSjoOBNnipE6qIgKrvWc1MZRz7Y1eLus4LOggVV5PtWjLjmSeLREMQbZdRQqJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5426
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-02 10:32 a.m., Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.c:374:22: warning: no previous prototype for ‘mod_hdcp_hdcp1_get_link_encryption_status’
>  In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:28:
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:568:43: warning: initialized field overwritten [-Woverride-init]
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:14: note: in expansion of macro ‘mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL’
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:2: note: in expansion of macro ‘SRI’
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:3: note: in expansion of macro ‘XFM_COMMON_REG_LIST_DCE60’
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: note: in expansion of macro ‘transform_regs’
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:568:43: note: (near initialization for ‘xfm_regs[0].DCFE_MEM_LIGHT_SLEEP_CNTL’)
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:14: note: in expansion of macro ‘mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL’
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:2: note: in expansion of macro ‘SRI’
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:3: note: in expansion of macro ‘XFM_COMMON_REG_LIST_DCE60’
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: note: in expansion of macro ‘transform_regs’
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:645:43: warning: initialized field overwritten [-Woverride-init]
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Mauro Rossi <issor.oruam@gmail.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Thanks for the fix.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_transform.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
> index cbce194ec7b82..e98b5d4141739 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
> @@ -166,8 +166,7 @@
>  	SRI(SCL_F_SHARP_CONTROL, SCL, id)
>  
>  #define XFM_COMMON_REG_LIST_DCE60(id) \
> -	XFM_COMMON_REG_LIST_DCE60_BASE(id), \
> -	SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
> +	XFM_COMMON_REG_LIST_DCE60_BASE(id)
>  #endif
>  
>  #define XFM_SF(reg_name, field_name, post_fix)\
> 

