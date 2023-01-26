Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0540167D742
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 22:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BBA10E37C;
	Thu, 26 Jan 2023 21:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3379810E37C;
 Thu, 26 Jan 2023 21:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFRrnx4LCDY1GD06P5WsQ9CvPvNpj3PISn22RJrX6zNPEcXCl/605jjtX3bv571La/jI9Rr87X6ajg5U2CPzq7mlgrUdsl8iBz2dh3R5aRrH775Z9/Jy6YnmmJhZlyrSbHbB+uhMfMdPleLIx8fHB1+Yu6HMerV4GY02LAJwzprJvZk5vkemzmZ7IoRKyopv1b7Fq6wfPCqwvktHMYcIHHLbkxcoGQ4ufuhClrAGVAHnWavnAyz1NMnUVEk/YnyzlDnF5CcXrhUfARt9wvMxVp5o4sVmXpsrKA2bA/3hp+4egtl6wvY8vRM9WWstQIluUtpUgxtcnG3fLZVHTmsQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzqhERa5efbN4IvC07pQuK5qTA45433Kx3cs/ajS5ks=;
 b=RGRcrysRm1nJrr1E7kgj21fl0YsdW3Pafn/FHu1OZsQ3J9JknyI//gf8n+CG1j+52bWWxNUDbOt2s5kCQ/nBGKBVN5jif6Kp8s11IimS/N/kYDNgpD69KAlJFaeDr2JIEur4wW3c0DE8VsV/xgl535/622tp+2sp7KrxQo4HsHjypG51wqJrfsK80DjAQ22XcUncvA63kxpuGV8nv1mazOPKVD5KXkuyU28LCIcv9Y/1Z/hglIohu2AfQAYyRHS1QLkZKtWVgOshp+XdwnRDbMlpXtMmxOhAMsYkbozeaR88kmnCdVM1PIhrbMX6PKd04umaGDVj3xkT10tpvLdrxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzqhERa5efbN4IvC07pQuK5qTA45433Kx3cs/ajS5ks=;
 b=qSJz/Nmnx+MQo+oh+hZk2NLcknhthFhdo7QbmVd+JG0ld6dUk7bCwh7jGWc9itma7PVMRq2sT+NY1ACCYs5ZnPpQ8Nys2B34e3LMjuTHK9GH5BqK/6GjRy4QP9xOo2VJaGTDtMQJ5984N+jchzvBcpIBu/Li8n5GbFFtxv16Rwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Thu, 26 Jan 2023 21:06:23 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5935:7d8d:e955:6298]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5935:7d8d:e955:6298%9]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 21:06:23 +0000
Message-ID: <5ad53f8f-155a-d1e8-68e3-c82577816c76@amd.com>
Date: Thu, 26 Jan 2023 16:07:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/amdgpu/display/mst: fix an unused-variable warning
To: Arnd Bergmann <arnd@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20230126163605.3524630-1-arnd@kernel.org>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230126163605.3524630-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0181.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::24) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS7PR12MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae28571-004d-4ab8-78cf-08daffe12dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2tyzLmZqBb0pcCPRDq+U7Fk9mDi67gHnSR6oPKlkFybz+9op65FLSOcKkHOq4SYCTSzn2FahXho+EP59kxlLVoALwkW9bu3FreuctYeJOOubwhZRqN9dfU+W5CVMOVBhrpVs4OxN5OP5EXCiNY141oagYfbjeim44hLTDugQ16tYsKjSgrxQ0Bo4nD3ox4a4vdMkcI2zPPw5NJm1fkV4JKWBQLDSUwKfiTPTacv8Dmed+Gc0Ak4A9rQpAeq0ovpfYBRTl12OrkN/x2beV22qmKHKgi5YFD6pNqpTJXz84+y1cISmXWgQzP5V9SjuRhArjeCE3EVqNXPjBl3AgTGUgamabszJtxC1q0L0/Q8bcTyyafnUrz3j2bx7os+UEfhBiyd3F6q0TgVyatxan6V5wKA8cZWVq69r7pbfQidFijN7zkvzslGadwJuBzrWhhRacbdMdc901FiC15zx0RVLuFJtajySys07aHCQlS0EHvJMArMCR/qY+tbkVuWKPU3ciMkeXCFngWIblgC8TfrMDDV7qcYQBb+Ym5afTJUcb3b3UWI8/kC8XYIxUKLXAmkqtPi+c+TR93qlrwBodSEwq/ctu0rwBniUsQlMM2hgznhHCCyuWNUPXP5bR+yJN7h8ixhj+moC+i6fVznEQNK78I+jsOkFSuIxFFfIFSwq3uTd1wRtdVo9B2LBe594oiIZnL119q2qhZ1Wiw9N6StKQonsSKjEIfBS9XBoyv0pqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199018)(66946007)(8676002)(316002)(86362001)(36756003)(8936002)(54906003)(44832011)(5660300002)(31686004)(38100700002)(31696002)(2906002)(6512007)(66556008)(4326008)(41300700001)(53546011)(26005)(186003)(6506007)(6636002)(2616005)(478600001)(66476007)(110136005)(6486002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXlTY3hqdlhLU3p6RTBidUM4ajk3RDRJN3Q2dFZ0clkwa0pkTlNyT1FObmhm?=
 =?utf-8?B?bXNQTjd3RlMxY1RWV0RKbUdlSVZ4bkVHMXVzY2lNTm5Rc21oRWZnL3lMUEpu?=
 =?utf-8?B?OWU3Z2xKZ3h5MlFTUHdQWkE0dVE0amh3RmFDMEZjaHZPYno0WG5HakpZZWtR?=
 =?utf-8?B?WVBLWWVQMUh3cE85KzNBY09ac3R5R2lDRkd3eVZHcXZvUVU1VmFmWEU4SDRh?=
 =?utf-8?B?L3NpZ00vVXk4S25ZcGZKOWM3d0RnNE1Kb3ZNSHMxRUVDVUdvc0pnWmdPT2Fl?=
 =?utf-8?B?cC9sN3lXRWkrUlRMV0pwL2dNWW9XMkxPSmdMVEc5SmpuakFXT1lkc0VmMlNi?=
 =?utf-8?B?bUF1dzY5c1FJUlVJRTV1Sno5ZnB1WE5FTmVnWVFtLzl0U2pDWFE5WHEwcnhJ?=
 =?utf-8?B?MVk4NnFGcXFadUEvN3lyTWhEN2ZiT2tPajNEcEFDVXd0VUhPcmUvMkVodXBI?=
 =?utf-8?B?UHFzS0psT0IzQi9LU0VlRlk3VTVLSldnaGZDenBwMHhTZ2JzSnJCWVV4VkhY?=
 =?utf-8?B?WTZvY2MxYUY1RVJHZXBqZ0JVWXovZmJBbEpzN0dZQ092elhVNGp4M1Y1bmdV?=
 =?utf-8?B?UU9ES0xtQXQwUzJLVFpqUEhsV3pFNVdjaDdMVnpiQUQzdlRRNStISDYvM0pV?=
 =?utf-8?B?MDJuU0dxTjVBQ3lLdXJSWTZxZkQ3U3dkcDdIU3h0RUNEUDJ6NGY0NGFwNWsx?=
 =?utf-8?B?Uzg5aTF3bHMwZThDUk01VTZpSzV0bVRIc056R2lwbitXV0J0T016Z3BJc056?=
 =?utf-8?B?M0liQWhaVS82cEpXajZqd2VnaVlQRXFWenZlWWVtNi95S3FZSkM0aWJDUTVu?=
 =?utf-8?B?cmg3TUF4VDVWSnBaYTA3THZUYnpqOVVrN1dwMXpuZ1pSUFVWOW9vVUJZYVJ1?=
 =?utf-8?B?V2I3dVZPeEx6WldJbWZJMGhacis4V1JiRVN2ZWs5SnpKZ2k5WmpLZ2xDREtN?=
 =?utf-8?B?Tys2dXFsQThWN2drSmdhQkdyWW1RczdrK3RzNHVLSElGWXF6RVlwM1ZUMSsy?=
 =?utf-8?B?MldrY21DQTlNSkpCdVovK2FUb2xiUXl5Umg1bXFlODFQWWYva3BzY2lPYzNL?=
 =?utf-8?B?NmNodkJHWDk4RTB2emxsK0toMGJWd3dKVjc4N2Jualhud3VSL3hvTHB6azNT?=
 =?utf-8?B?T3dRRk9sTWtCQm1IbEI5QjhVc09INS8xTXdVMWNVOU55Yjd4OWoyZTFWNXEw?=
 =?utf-8?B?UmtMZVBZR2VmakFjNW0rM05xM054bFQ4M0d4Tk0yZng5M0ZKTnBHYVBGbG9Q?=
 =?utf-8?B?MFVCNzZkOFZhY29KY3dsK1NBbi9SOE10Zklod2NWV1pzaGhnRlVCQnh0b09k?=
 =?utf-8?B?U3laU3E4Zm5xUG1pYi9TOVZaWENjcW5TUm1rK2N4MVB5bGVrWUpCaHJ3Zmgz?=
 =?utf-8?B?UGM5b3ZTTzJCNHYrWno2MkVpc2dOUm9wZitrdGV5TENIT05aQUZaQ3B5RGlP?=
 =?utf-8?B?b1lOUThwcUtQVEp0aGczSG95SitVMk9nZHZOak9YdGdpdjhCUzJ6UnBzR3Yz?=
 =?utf-8?B?cFVvS2VIWE50bzM3V045NlpzYVZnc0JINFprTTVaajN3UUJIbGxSRzZ2dDJ5?=
 =?utf-8?B?dzJ1RUwxTDNHL09GZm9IbzdoTFpETC91TG43c09uL21HamtKdUJ1ZzZoV0x6?=
 =?utf-8?B?bG0wUS9wcXk5U2JtUDF4N045VlMvYWFVTGhDOXNTNisyOEd4MHltRzBOTW9G?=
 =?utf-8?B?M0lHdUszSGVleG14NHorclBiOERJT1VVNk9wV0lkMkhSd21EYkorT0YwUjY1?=
 =?utf-8?B?SWUyY3ZHV0p5aC9mMGJRVkd2WHFaTGYzODRleXRCMmF6YTJ6RnNiZjgzZ0p6?=
 =?utf-8?B?U0FKakdMMTU3NlU0Q0UycmVKNGgybnJsdlNsT3JsWTZwaDVwekVwN0tiOCsw?=
 =?utf-8?B?cVJSWVhKUGVCbGw0b1pTd05QZE03V3VCbnVmY3hjV1ZHdFpKVDVNV3JZaUsw?=
 =?utf-8?B?SUFHT2JHMlY1c0xJZ0FCaktweXNvWGlHVGhKcGdVcG9qNVVGbVlCUVJrTURl?=
 =?utf-8?B?ZjV3RmsyM1UxSmhjRmZIdWEwOHJzeFcxTGtNWTNtZGJNaFhyckJzWkhpMzhh?=
 =?utf-8?B?ZGtOeE1CbnIzbS8yVkIyRmpVTmhRL2FlYWptSTJzaXlmMlc2QWxSU1BSTHdh?=
 =?utf-8?Q?owBXFekAeXqaFNPKWUGaog4cT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae28571-004d-4ab8-78cf-08daffe12dbd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 21:06:22.9431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZF36l8gZNcGrxO4NB9O6XJ/cIOtcI3NNUdSG2knM2BYxiQZEIT0pLqqreGyxVBx7HzuyAUUNn84Tl2rwu3gxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286
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
Cc: Stylon Wang <stylon.wang@amd.com>, Arnd Bergmann <arnd@arndb.de>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/23 11:35, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added code is in an #ifdef, so the variables that
> are only used in there cause a warning if CONFIG_DRM_AMD_DC_DCN
> is disabled:
> 
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_atomic_check':
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9698:43: error: unused variable 'mst_state' [-Werror=unused-variable]
>   9698 |         struct drm_dp_mst_topology_state *mst_state;
>        |                                           ^~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9697:41: error: unused variable 'mgr' [-Werror=unused-variable]
>   9697 |         struct drm_dp_mst_topology_mgr *mgr;
>        |                                         ^~~
> 
> Fixes: c689e1e362ea ("drm/amdgpu/display/mst: Fix mst_state->pbn_div and slot count assignments")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index be1232356f9e..c966bb05f6c7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9694,8 +9694,10 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>   	struct drm_connector_state *old_con_state, *new_con_state;
>   	struct drm_crtc *crtc;
>   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>   	struct drm_dp_mst_topology_mgr *mgr;
>   	struct drm_dp_mst_topology_state *mst_state;
> +#endif
>   	struct drm_plane *plane;
>   	struct drm_plane_state *old_plane_state, *new_plane_state;
>   	enum dc_status status;

-- 
Hamza

