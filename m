Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944073026F3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 16:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54E86E203;
	Mon, 25 Jan 2021 15:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690064.outbound.protection.outlook.com [40.107.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21556E203;
 Mon, 25 Jan 2021 15:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOZvMjBkWs1ttbbRpjlIgld91hmGoXumGOCPSP+T7lM0vsdUN54QuAk1Vyna2xfVGLiH+OfOveI7DrieoRGEvTpVPbk2kR+ieList5ZueMsz7NUNEizW9YrkdDUpH3mHoYpXm/72p2hlR8uIgdfho7BCYAK8kO2n0MYoiE418Ob2m8sT40XOZHTP4fviFXK3dekwTkONbr4sJ+JGGF+3wo29Dax9idD4wSDJnLZDeIwOzvC/tBW6Ct2dyfLX4GT642qRLG2MsAhS9kKM80q3UGLC88de/MLLxkRqosAGzXkhuYn2xYF46xrSA6qxx3FwKdFEMfI/03M04VMogwcTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oc5lqEFq0neG+1G5WKmaP4pJAYKdtfc8B1gud6e5Bv4=;
 b=anRRhMd9gM2dEKp6nIkWa5TARmqu3s/s8EY8bvBFKeJSmwNqNVEEPgK1ufOIM+f51nvi5iIQ5m8CmTr9/4Xmb8EwZxi/vZcI2/8Rk0zPYCTrvS2TfGPpqfOxhp/NBGsRRXfgFh4N+Z6OICsKYmJ2rATrfJwiZ5kNajWkvrGLCn2vB/fEeseNAWtr8Kqbx+vOcXeeZCHoHItVCGH8OYQ4CqDR95Pkb7JsR4LxuZKNObOaWgXcIIBpB9MeKeq5iZDnFPqMETGnxlaK2H4tz7ye6mD2kHlgJCczcChLAjHm6agd7KKnyP4y2pVWVyjlALBF4XAOUDXbMSZau/M2S21Rpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oc5lqEFq0neG+1G5WKmaP4pJAYKdtfc8B1gud6e5Bv4=;
 b=I9WqTOGQr1rKLKhxLdg1n7GwQ0NIq7z2c2Q0eAJIAHJsJFhsswAJETYsrTvSIsu2A7gMZGwIMRB5CGCkbPxfu9iMyTuYQ9QAn3/yAJs6BxAouNhfNv2aG80IFamMsay/zR5vDd3P+vFQg+R6Hz3oV8I7cncu9xyCtrZp08sh0uc=
Authentication-Results: basnieuwenhuizen.nl; dkim=none (message not signed)
 header.d=none;basnieuwenhuizen.nl; dmarc=none action=none
 header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR12MB1230.namprd12.prod.outlook.com (2603:10b6:300:f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Mon, 25 Jan
 2021 15:39:39 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::172:235e:14a4:bdc6]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::172:235e:14a4:bdc6%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 15:39:39 +0000
Subject: Re: [PATCH] drm/amd/display: fix unused variable warning
To: Arnd Bergmann <arnd@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20210125124849.102037-1-arnd@kernel.org>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <39e1fcca-c2f4-2342-3f8c-76996024ebda@amd.com>
Date: Mon, 25 Jan 2021 10:39:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210125124849.102037-1-arnd@kernel.org>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::16) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Mon, 25 Jan 2021 15:39:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c3d47360-c85f-4e8f-12a9-08d8c1476d1e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1230:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB12305665B42FBFDED42EDBA58CBD9@MWHPR12MB1230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fM5dQqtQ8Cj7hJGuHIjR6+uhMkp7aasasNZPG6QNptdf3HYbOV0P8AcS56cEG7E8cmWMp3qKSAxDxONwf+Sdc/xanuRQMgNgsghxs4RqGfpA4jtfck1Rh5ycFTpqqsgqT+xJQk//1AvmJQ13rDIsGkepqzyMZ5aGQGlQlSYJTDMrB9cvLBslAoV9k+OsBHKbeHMicnx8efMEghYA2LSa00KPSVRShAFmwihhUJ8dqbnJ2QwwGjV01Ie58za4ODKQWvLEKsCvNVHmE1TYcjMSvGon2k1UiWp3KhQEoA35jMAVCl8mA8MvplDiVGThlwlQl62bTODkpqsHHkeiU0zSibmVJmd0zTPVP55TCfNf6Yfpt/Am03ucBqWYqa/x1WWIWTT5i8dWb3NpIDsrKDsojOiimCy2GIQA5Fi6d1Vy4TY/IuhSStdBqrpz0ZCBwtXe8R7TH8ztA+AfnQqCf7vf1mmqc4oMgpmgotYZZognCYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(8936002)(86362001)(31686004)(83380400001)(31696002)(66476007)(66556008)(66946007)(8676002)(52116002)(5660300002)(53546011)(4326008)(110136005)(44832011)(478600001)(316002)(956004)(16576012)(2616005)(6636002)(26005)(2906002)(16526019)(186003)(6486002)(36756003)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WldnRUNNUkJiODkybEFUeFZ1OUZjbmxKODlZRU9FQnFhZFBhNFJ3QXBqRE5E?=
 =?utf-8?B?TENWdWhpYzBWb0J0Y1JHN2hGcGZhMDNWU3dFa3lHVkhHeFQzWHl0NmdWK082?=
 =?utf-8?B?bFpQVzN0R3U0SENhWFo2WnptSVgva1cwTmprQWVoYVBoMEgwd2NnelExVUk1?=
 =?utf-8?B?eFpzeGtEWVlkS0Q4QmNlQUk1NmJEZ2diUXF2dG5nVFpXcU5XMzlwd0xDM01G?=
 =?utf-8?B?cnVQZmU4bnBoaEJlU2MvbjlCb1Y3cENvVzAxc2lVK0psQnZoWDl0V1JCaVQ4?=
 =?utf-8?B?dXA2eVpqVW5MdS9wcjB2V0RIdGlHVm0zaVRhNGlPYUtCNm93U1B2YmhZQ0lS?=
 =?utf-8?B?NS8rOUdSSU4vbTFrZlJGSXp2OTU2QjZ5bWdTRXJ2dTJBTHkvUmJaT2RkNzFi?=
 =?utf-8?B?YUV6WER6VzRJMk9kRlJQeHFJbDJsSTFpZjZCeHVVRVZhdlBxUUlEYmZBank1?=
 =?utf-8?B?eWN4R1hPR2dyVG11YXZGaTVIeXpYRW1sT0xSR3FMUjRmRWpiVE5vVDdsOFVG?=
 =?utf-8?B?d0x5TFhaRFJqcWtPVmVvR2I1TlJlZWdRRURwYysvNndjNjBFcnNYV0EybWR2?=
 =?utf-8?B?OWRwTHE4emhxSGJsb1Nya29JdS9WbWh2dkJGbG9ZejVibkFJQVRxMUxSdzFC?=
 =?utf-8?B?YXAxTlNZY3F4Wmw4NmFPZlFlR0wzcldHZmt0aXZ1djdCOUY5akZYMzZVb1Y1?=
 =?utf-8?B?S0JYS2NBdnlKeVVZUkJZdHI4Q3E3dnQxbWUzbjhxUC8xdk1mTzVkcmFVVUxs?=
 =?utf-8?B?MTh4NVZWUFVLRERPV2N5ZjdacnZTbHFGa0hteDJCNFdyTnNSSnZXNWRVUFE2?=
 =?utf-8?B?UGorL1piYVZWQ0JFWTZ5NjdiMHNUZ1J0UDlvRXBlZnNIVnhzMU1jWC9KREFq?=
 =?utf-8?B?MkZEMVVKMHJwRXRtbnFhakM3VmJFTE54RG1hMk5xczZKejdYY2RRK1RDTTFI?=
 =?utf-8?B?MEIxRmpOTU1VbFRlU2tqS3lOWHIxUnp1Q296R3I2QitOQ2JSQWxtdG5SLytm?=
 =?utf-8?B?VFRpeGVRSFlEOHR4N1pYaEd0VnhqbUtxdG0zSFppYzVBWE4zTDVvTkNxOEo4?=
 =?utf-8?B?eUVmVDU1Yng1N3ZEcGJTcmRNVyszczM0UFkyVkRyNzZSQXhEdURjWDlsdXg2?=
 =?utf-8?B?SllFRFA0UVI0N0xIN0JBNGtPaGdLZmlmbngvVWhPbGxwbWQyTGFZUWFJRVNt?=
 =?utf-8?B?ZENPZ1BnYjBpVlBxbVFveGVKcy9jSU90aG1IUFFud2JZOTNmNW53Y3VRL2tQ?=
 =?utf-8?B?OVluNisrMEtiUVd5TVAwUGkxeG9hZUlFRjNSV1ZyWUhraTJSSWNTS0VJVDN1?=
 =?utf-8?B?ZEtKWUVuUUhZNG0reXF6L0lTWG5USE9jOXNNNmQ5VDBqUFVwVjg3ZVAvZWpm?=
 =?utf-8?B?dGtDU1NPWURpREpiQ2ZxNDBlb1ExRllPOTJxdndmTUFyMUpnQ1BhZmVTcW1J?=
 =?utf-8?Q?6V3b+XI2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d47360-c85f-4e8f-12a9-08d8c1476d1e
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 15:39:39.2840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFsbOw4OB/kO7o90+5nRxgzVZtxklKIbTY4Qa9Lzit+6tVzrB/GyQaMTMw9gIjtp59Sicum33LqWHWdYC9zFtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1230
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
Cc: Stylon Wang <stylon.wang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-01-25 7:48 a.m., Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After all users of the 'dm' warnings got hidden in an #ifdef,
> the compiler started warning about it being unused:
> 
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5380:33: error: unused variable 'dm' [-Werror,-Wunused-variable]
> 
> Add another such #ifdef.
> 
> Fixes: 98ab5f3513f9 ("drm/amd/display: Fix deadlock during gpu reset v3")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a90dc4d31c32..37bf2dd87e1e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5377,7 +5377,9 @@ static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
>   	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
>   	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
>   	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc->state);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   	struct amdgpu_display_manager *dm = &adev->dm;
> +#endif
>   	int rc = 0;
>   
>   	if (enable) {
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
