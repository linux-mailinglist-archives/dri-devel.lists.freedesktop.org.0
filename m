Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949F458A35C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 00:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67D0A94A8;
	Thu,  4 Aug 2022 22:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A236A940E;
 Thu,  4 Aug 2022 22:44:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mp1/W5LGqDqxFpqf2Dcucc30JkIo8E7Wem2al+RZCXuxD3PNSFucj92T2lPbSIQNMX5WDA3eNQE+BUbKL3hWU5UrxVG+AlwIE2LdZKb6cuwI7ib2UjDPnKDL5cCUhG7TvNKq6JLXQ7eBobf7B2sJthlMNiYswcUODb3U87VrzXOM4jfK4M1mtPTrh3slK+O0dFxwwJsHXkIFB1dWHMF2t0tsXsjVM26R0QRtrQqHZnCosdLR2kEVhIQvvvP0YisEOKQfHJ4+YyPhwZvKNY13VTkZmWVEnvtdm15W4iBMvkNzh1V7L4Oau941WKQYrNJUQGVl4D7xZqtddSy28Ld6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsLbq7Mle39QKF1ohFLZWNoERijSlMaMiW5ROjJtxSk=;
 b=EoX1NRa49p8yRdD68D/WN5EsHtV85KV2zgQrVKwQzicEk/cjH+wrFw82hh2PLcXZXVUr+ZInWHpgIOVv77fCCD2YgV2eGset11doqHY+VEkHcpHWW2LVn3I1LItUqyk5JyysHNxkEhBmIQk6BGJ1RdLdKdD2+jI+hVdk4JtTsiujGWaCvp6YLIqGYKDFJJNi9R9gdPoF+i2ropHzIBGoGe41cj3xlIALAyive8revVVjovRFoaGE+sc240AaZn6qVLVOOAUIQbZ7LbCg3NGwxRfbTM/aoblLKBPbEe1TJa5tIc+O4DR+ez7d9wLaxv/c2bks8C7KFYI9m0rI2O9nng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsLbq7Mle39QKF1ohFLZWNoERijSlMaMiW5ROjJtxSk=;
 b=IqJhSptUl+shDND95HCKUzy543Ju2hBmCuNlHm/yfjiqdPpCYaTzfqHjmNjUk5vvxWxI4T+OmfzM/zAM1/o1m6fC81fxfM2FWGRoiOHIVjH736/oqsxwx1QOz56ygeZSgWsdFaaJMY1yAzEgSoQ7jJK6UyTSqWI+OmgKEsVYrkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BY5PR12MB4804.namprd12.prod.outlook.com (2603:10b6:a03:1b6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 22:44:50 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5482.016; Thu, 4 Aug 2022
 22:44:50 +0000
Message-ID: <a6653817-61ea-31f3-cdb1-f9646903f2b7@amd.com>
Date: Thu, 4 Aug 2022 18:44:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/4] Documentation/gpu/amdgpu/amdgpu_dm: add DM docs
 for pixel blend mode
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, sungjoon.kim@amd.com,
 nicholas.kazlauskas@amd.com
References: <20220804150107.3435964-1-mwen@igalia.com>
 <20220804150107.3435964-5-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220804150107.3435964-5-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:610:b2::29) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0da135e0-0444-4074-153c-08da766af0b5
X-MS-TrafficTypeDiagnostic: BY5PR12MB4804:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cP4zNn7tN7KTNRqsA7YnUFE0k69hyCf/cvfXYQPi7tTos+odfAvOMvZXbny6HbQm2QZEVsX23jJe6X3W9Rk9cYxPmJvJkwzijYbIgO1CHnz8H8pMVD93byP42ebkuj8tSFOmI/xRDvhpuxo4nMq+QT2vT9rSmS7AD1FjPJwpBG7wB7+n1HiRRcLHjWu98dYdSYCXLXZ7ItrpteMAiNzuAYS6ksG30RQg4oA8rhfjTTLcithkXdpik8u4rqts0cIRNirCwF9Fzy5d1kjuzaVtXr8Q+GoETYsXRx+QZ9qsi2lST4w0BiPH70S4vGGu/uC0xMbJdLhAU+F9IZYV+N623uvaEc6lim2DRgI5jGEVTjk0jtdICO87EkEj/u0fctdHUPeap0nZkTrLQmtwAr/BznTkyWCWOIJOXY8jDVryRbdgAU5x0W3ajHV9RX7zHrrvCcnyWaaTlX49Fk0hyLMDZbTsullBMwSD7gi93VhFfZ54graAXrYCuqkA7TFrQ+Mqn1V3M2XBf3P9E4H3Pvh/hZolKkKzDDlPEkGc+3y9SWZZe+96A1iqQle15hydOrW2PJPm24FHlNYZawIMIyQJi+uHOvC5XrvBu6Nso2GUjXWO+TQLKHbxb6qnDj0cPH4Pn7zUL8T4Vu7LmLa3xfXupIvJiouI4LumKzTENKAqfd8ImxMk/lBBnTHpsSAmywm8/Q8OuswId19n+8W/JCZQibl0TLVVByHWy4zDX4iYyumd+QZnBzwi9Wt/4zGV83bVL25JXY47UIga5MhZG1hIzD3E8Njq3ZRkOobjxlgnPEnuyZrpA3V4NxMqHPoj0WD4SfjaHGND5LaNEN9GC5QadQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(316002)(110136005)(31686004)(36756003)(66476007)(8676002)(4326008)(66556008)(66946007)(6636002)(83380400001)(478600001)(6486002)(86362001)(8936002)(186003)(2616005)(2906002)(31696002)(5660300002)(41300700001)(38100700002)(26005)(6512007)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVc3WnlQVkI3dDVUc3hiWmF0dWNDK3p5cm1BQzloU2RzLytEblR6QnZvVlVn?=
 =?utf-8?B?RnZiVHo4ZFBicWFjbUVIK2RoNE9yYkJjUDEyRENHa1VnOVduOGhubVZ2VStD?=
 =?utf-8?B?Y3pJdnYwYlUyVmU0Z0NLZzVSTFpiTkd5ZVFOV0NiaGdPcXQrQTJtS1V3bGFv?=
 =?utf-8?B?WFUrUjZHMTJMMU9jUzZYRlhzMmRBL0RCNFhEbHRuL3FDTHNsdy80U2NJVGZ0?=
 =?utf-8?B?cVhTWWcrRmwwbmlzMTNXL2h3L0tnazA4dDlaUUJUSGRpUEI2QWlVKzladUQw?=
 =?utf-8?B?YURlclJhcWVyblA1ajh4Sy8wSWtUWk1xZ3c4V2Fpazl2SXZEQ2ZrZzdMSEdh?=
 =?utf-8?B?ZTFmcEIrRWlBU2JFU2VQamJKcThBcTB1b2psV3BMNWhaUTE5c3psV21QOGNU?=
 =?utf-8?B?dW9yYW01V3ZIeU5RL0ZpeHBudWVxQ01seDRGSFhmT0NCUWFTRWZPL2E4MEFC?=
 =?utf-8?B?a0p5TnEyQUdpenp3cWxyZjF3U1g2dWJsUEJObHJudnVzZmhldUlRMnVxQ0g1?=
 =?utf-8?B?Nk80YzA3ZE5WaVhxUnNSUEY2VVQxTll5L01rNytVeDdXZGIyVHZJYjJvVkht?=
 =?utf-8?B?MGNicWpURndtYklmVjBGZDFVSFZTZmRzb3pRWkE0TlliRVRmWjU2SkdNT3lV?=
 =?utf-8?B?cnEwRDlUcFc2RDJ0SnR1Z05GRktHZlk5UXVWMnRMODNmOVJSQjJ1QXpnZTJF?=
 =?utf-8?B?ZTVDWkhKVFhZL0VUak9maGtIWW0xT0lMUms2UHNSMGJJNEpUTTdoRHBOcjNu?=
 =?utf-8?B?YXRaOWkvYVczWlNIQXV0cFVCMkRZOHQ1OG1QcE5MK0NXRTZFY0xpeHdBUUdm?=
 =?utf-8?B?M3R5T2R6ejNVME1YMnh5MEVVZ0ZtNTJ6ZWh2YkFLbXBqRUhQdDY0QUF5NGFY?=
 =?utf-8?B?K3dkNVdKdFdjUWRnbUtVTk05YkJGWk13RUxWQk4vbTZncU50Z21oUHZOc3My?=
 =?utf-8?B?UVh1TkhobWFGOGdCOExSMFU3NDRsaVZtekxLUXZqenVWMWJuRm5UNi9HaEFi?=
 =?utf-8?B?V0JWeVlIbWpLZFd5Rzg3eGkrUS9DUDZaNWJMcSs2ZWpEdFp6RGIvcTYyMmpl?=
 =?utf-8?B?dlNkdHBRWFdLRGtCRU41WW9RSzU1YndrbGs1Ny9NRmVPVldqUUJnMTFtcFhk?=
 =?utf-8?B?MjJQRHJFRjhLcTZuMm1QUDFsZnNyK3ZrTmdvN0ptNHJTVXhDR205NUFrT28z?=
 =?utf-8?B?TlluRUdzdG5WRWFKeTV1WDcwSlFrdDQ1blI4MU9aeHlnaDZzVHJhbDFmM2c1?=
 =?utf-8?B?Q0JwZTRyTzE2WUx2K1JuWmpJc25NQ0hqQjhhemxDOVhpVzhDNTh4a2x3SE1Y?=
 =?utf-8?B?aUFNYWxURVR2M1BFMllpV25MQ2ZPazMwK25YRVY0UFB3dmlQUzIrS2cyeXN6?=
 =?utf-8?B?dE1JV1cwOGk2d0FKODdmUnBGVXlxY2VSdFB3bkgzSFpNSk10RS9tcTE2MUx6?=
 =?utf-8?B?LzEyVktsdy84ZkxrcWdCUFZzeXN2S1RqNHVNbnI3eE93TDQyZ0pBaUQrRnp6?=
 =?utf-8?B?dXNRd3JqOUNiS1pMcmdOM0RKRFNnUWp0NzJlc2VZVW9WeEgwMVQwRStsQ2hO?=
 =?utf-8?B?VSt0MERIZ2hDdkFJNnlkTTZRdHpVcTJpL250aHNydTM1TWxNdG8yNVo0WjFY?=
 =?utf-8?B?THQ2WDQyUnptK0JWMTdaU0lVZER5SmJDVU1aTHB6MlowbExUZUUvYVVUU2ZE?=
 =?utf-8?B?Q0RPTUpuUWJCcnU5cW9JWXFjK0c5WWdUeXkxMFlIZWRuRkZQNTNtR2JRYzds?=
 =?utf-8?B?dXgwS09iWFJQbFJJS20zOFM3VElXditoTlZRTlB5MVpqeHF2NUQya29NbjNR?=
 =?utf-8?B?c3FvVmRIN01OaGVnNzRZWXBERW5PSXFaalIyN2xQN3hlU1h5NzJiRHIzRDNQ?=
 =?utf-8?B?MjRGb0w3NFlJeVFpWGgwQitPSlVJUk9WblAyMjVzcXZSNEZXUTZ0SUdzV3Vq?=
 =?utf-8?B?enl3RG01VVVKWXdqUVJCZjN2dEdHZXR3WThzejExY1FBSUZic2NvWCtiT0VC?=
 =?utf-8?B?eFRsUWs0YWxqd0RjdWRFQnRLQW9lblF0YlU0N3p6MUtqTjM2d2FPYVl6WU9D?=
 =?utf-8?B?Wm5UYkNDTjRxSGNTNmUyQWtxZTdwZzN3Wk9sNFhkdDhRd3hlNnZ4WWxlM041?=
 =?utf-8?Q?Xj+gTaAD8I1YRHh1DzEsLe1W8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da135e0-0444-4074-153c-08da766af0b5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 22:44:50.5389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAzolhRgQv4lJBHqUN7cNRaJ4AQqVPuaosrc9MKdY2ivPMtX8AJ92fQI56ei5Ojw8MxYz2XhZo5I63RW8wMweQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4804
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-08-04 11:01, Melissa Wen wrote:
> AMD GPU display manager (DM) maps DRM pixel blend modes (None,
> Pre-multiplied, Coverage) to MPC hw blocks through blend configuration
> options. Describe relevant elements and how to set and test them to get
> the expected DRM blend mode on DCN hw.
> 
> v2:
> - add ref tag (Tales)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Reviewed-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---
>   .../gpu/amdgpu/display/display-manager.rst    | 98 +++++++++++++++++++
>   Documentation/gpu/drm-kms.rst                 |  2 +
>   2 files changed, 100 insertions(+)
> 
> diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
> index 88e2c08c7014..b7abb18cfc82 100644
> --- a/Documentation/gpu/amdgpu/display/display-manager.rst
> +++ b/Documentation/gpu/amdgpu/display/display-manager.rst
> @@ -83,3 +83,101 @@ schemas.
>   **DCN 3.0 family color caps and mapping**
>   
>   .. kernel-figure:: dcn3_cm_drm_current.svg
> +
> +Blend Mode Properties
> +=====================
> +
> +Pixel blend mode is a DRM plane composition property of :c:type:`drm_plane` used to
> +describes how pixels from a foreground plane (fg) are composited with the
> +background plane (bg). Here, we present main concepts of DRM blend mode to help
> +to understand how this property is mapped to AMD DC interface. See more about
> +this DRM property and the alpha blending equations in :ref:`DRM Plane
> +Composition Properties <plane_composition_properties>`.
> +
> +Basically, a blend mode sets the alpha blending equation for plane
> +composition that fits the mode in which the alpha channel affects the state of
> +pixel color values and, therefore, the resulted pixel color. For
> +example, consider the following elements of the alpha blending equation:
> +
> +- *fg.rgb*: Each of the RGB component values from the foreground's pixel.
> +- *fg.alpha*: Alpha component value from the foreground's pixel.
> +- *bg.rgb*: Each of the RGB component values from the background.
> +- *plane_alpha*: Plane alpha value set by the **plane "alpha" property**, see
> +  more in :ref:`DRM Plane Composition Properties <plane_composition_properties>`.
> +
> +in the basic alpha blending equation::
> +
> +   out.rgb = alpha * fg.rgb + (1 - alpha) * bg.rgb
> +
> +the alpha channel value of each pixel in a plane is ignored and only the plane
> +alpha affects the resulted pixel color values.
> +
> +DRM has three blend mode to define the blend formula in the plane composition:
> +
> +* **None**: Blend formula that ignores the pixel alpha.
> +
> +* **Pre-multiplied**: Blend formula that assumes the pixel color values in a
> +  plane was already pre-multiplied by its own alpha channel before storage.
> +
> +* **Coverage**: Blend formula that assumes the pixel color values were not
> +  pre-multiplied with the alpha channel values.
> +
> +and pre-multiplied is the default pixel blend mode, that means, when no blend
> +mode property is created or defined, DRM considers the plane's pixels has
> +pre-multiplied color values. On IGT GPU tools, the kms_plane_alpha_blend test
> +provides a set of subtests to verify plane alpha and blend mode properties.
> +
> +The DRM blend mode and its elements are then mapped by AMDGPU display manager
> +(DM) to program the blending configuration of the Multiple Pipe/Plane Combined
> +(MPC), as follows:
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +   :doc: mpc-overview
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +   :functions: mpcc_blnd_cfg
> +
> +Therefore, the blending configuration for a single MPCC instance on the MPC
> +tree is defined by :c:type:`mpcc_blnd_cfg`, where
> +:c:type:`pre_multiplied_alpha` is the alpha pre-multiplied mode flag used to
> +set :c:type:`MPCC_ALPHA_MULTIPLIED_MODE`. It controls whether alpha is
> +multiplied (true/false), being only true for DRM pre-multiplied blend mode.
> +:c:type:`mpcc_alpha_blend_mode` defines the alpha blend mode regarding pixel
> +alpha and plane alpha values. It sets one of the three modes for
> +:c:type:`MPCC_ALPHA_BLND_MODE`, as described below.
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +   :functions: mpcc_alpha_blend_mode
> +
> +DM then maps the elements of `enum mpcc_alpha_blend_mode` to those in the DRM
> +blend formula, as follows:
> +
> +* *MPC pixel alpha* matches *DRM fg.alpha* as the alpha component value
> +  from the plane's pixel
> +* *MPC global alpha* matches *DRM plane_alpha* when the pixel alpha should
> +  be ignored and, therefore, pixel values are not pre-multiplied
> +* *MPC global gain* assumes *MPC global alpha* value when both *DRM
> +  fg.alpha* and *DRM plane_alpha* participate in the blend equation
> +
> +In short, *fg.alpha* is ignored by selecting
> +:c:type:`MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA`. On the other hand, (plane_alpha *
> +fg.alpha) component becomes available by selecting
> +:c:type:`MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN`. And the
> +:c:type:`MPCC_ALPHA_MULTIPLIED_MODE` defines if the pixel color values are
> +pre-multiplied by alpha or not.
> +
> +Blend configuration flow
> +------------------------
> +
> +The alpha blending equation is configured from DRM to DC interface by the
> +following path:
> +
> +1. When updating a :c:type:`drm_plane_state <drm_plane_state>`, DM calls
> +   :c:type:`fill_blending_from_plane_state()` that maps
> +   :c:type:`drm_plane_state <drm_plane_state>` attributes to
> +   :c:type:`dc_plane_info <dc_plane_info>` struct to be handled in the
> +   OS-agnostic component (DC).
> +
> +2. On DC interface, :c:type:`struct mpcc_blnd_cfg <mpcc_blnd_cfg>` programs the
> +   MPCC blend configuration considering the :c:type:`dc_plane_info
> +   <dc_plane_info>` input from DPP.
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 6f9c064fd323..b4377a545425 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -532,6 +532,8 @@ Standard Plane Properties
>   .. kernel-doc:: drivers/gpu/drm/drm_plane.c
>      :doc: standard plane properties
>   
> +.. _plane_composition_properties:
> +
>   Plane Composition Properties
>   ----------------------------
>   

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
