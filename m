Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A011B2923
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 16:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E656E062;
	Tue, 21 Apr 2020 14:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F000F6E062;
 Tue, 21 Apr 2020 14:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNWClvSo1YgWexuI5VqggvB52bMw591lZpJlk9BtX7dYUEem8FLxt7JnhTQ5D6hnyxcml3Dfc7UaHMf8r/+OGmcyu1v6nBp7dTfYLK3aq2eG9rOsv9mQ7+YarE6RkwNfflOeSIV1lEtE2wsSLmws+YLNc7Vpc/U0fs1Ywt0aEs5IZEWajQYESLuuv5ErU/ePQTzCC6WlO6VUI2biuUtmkZMWeIfJAQ275+Hq4r3cgEg8gc7dvqE+HOjNDL6xNwiPk6FsoM05Oa7WAXJCidjeperLfYeZuptgIf7+V9UbuFG804aVuPIf2MtT2RX8J3tr0PF5AmEwyDXvQoMzRim4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkQXj9ndoJW9vv0hh4Rw5QbWkey+1e0BNV7hyR+TEHk=;
 b=ablPE7rIirKSVpbsML374D6Ryzp7ERxWBht8NyGz8SU8onHbQeWGsW/cZRkCdM1JIELk5Ps4zqlvVidaop0VpkddQF49nJeeT9R11Nqq3VPKL2sg7jseCdXtYcjkm416dqLpI5bsP9FvsERrMjjTYbYx7M3b/4bRRfMK4nvlAMmjtwpVRo8vQQZqLI3o4vIV54Dy+ltdFi619PGevAz5QAmBwJqp2KQAaQTWRPBR0bajQRHDotLr2q/Yf3kHv8Si0YqwPuQ3vlrhlhhKSR70GRO+NFYgC20E5UL2/HFdwuuYs+5XH5gKvVSUNprHcbZNeg9Gbg1vHFpWzIXBFn9zCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkQXj9ndoJW9vv0hh4Rw5QbWkey+1e0BNV7hyR+TEHk=;
 b=mpdq20DTVbPBcJXKvzv5uL9fLGp8f/GNwE4pXR5VbwkDtW0/6bLOhiyfqBZBEpAYrN/02bFwR/yZl75lCdHC2xM6j7tC+THs4sUSE2xdNMdBG59e5lbqHJnVP3j+WlF7GZxvQJ9yHh030C6pZo4UmhAILiecrbkhm9ZMt7+/AMo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4537.namprd12.prod.outlook.com (2603:10b6:303:5b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 14:13:02 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97%6]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 14:13:00 +0000
Subject: Re: [PATCH] drm: amd: display: fix kernel-doc struct warning
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
References: <20200420015015.27991-1-rdunlap@infradead.org>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <dd6889d6-b27b-e4a8-4d5a-9a65b46d7f7a@amd.com>
Date: Tue, 21 Apr 2020 10:12:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200420015015.27991-1-rdunlap@infradead.org>
Content-Language: en-US
X-ClientProxiedBy: BN3PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:400:4::23) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:9240:c66::6] (2607:fea8:9240:c66::6) by
 BN3PR03CA0105.namprd03.prod.outlook.com (2603:10b6:400:4::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Tue, 21 Apr 2020 14:12:58 +0000
X-Originating-IP: [2607:fea8:9240:c66::6]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2a5f16e4-907a-4a9d-8b1c-08d7e5fe18ff
X-MS-TrafficTypeDiagnostic: MW3PR12MB4537:|MW3PR12MB4537:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB45379726744F72AE06CCBB358CD50@MW3PR12MB4537.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(36756003)(8936002)(2906002)(66946007)(66476007)(66556008)(316002)(6486002)(31696002)(53546011)(5660300002)(478600001)(4326008)(2616005)(8676002)(81156014)(52116002)(186003)(54906003)(16526019)(31686004);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: trjkC6R2tVKVxMQcmdSIw6AZd7eUhRwb9QfykNtVeJ0f6n491ORVT1PpdCaRpTtGxvu6ulJR0IODP+Rx/d3z7NIdhOnFx81r7AwLETe137Cm7l0qNi88MK6eldms6e5lQxRgLYaTmvcmO8mjcxRDoTolkooLruDGPNDeef5sJtGLfLy97JMiTBMoDpVdJwr/my8Eu4FzTrOxqErbGMSBF/+i+4JmZ218lEdbAD8oFIk1NhwQQto0A0Q6rW3pUunZPkHurPgvUE+/vS5UkKh6B42Iah8o3yEBka0XCvrKaJmLqqbo2Djwtdd6fG0i7J4RJ1IUDSY6DeXeA7BGX1Y8gljWqbeChZn3fDuybvMaFiqGsltV3tl4d+pf6JCdCD+PE/iN01/9cXjIuFwBOXQDsIBPsNQ1B6AlOYP2k1mxLn4BCuxyAgVw5U27PahPFr5R
X-MS-Exchange-AntiSpam-MessageData: 62bGAypomIy9iKWm8dBOGo/Jf0mFcKpnSYZSWj1zHi0hkHxrYGLc4wSWvMmNnc3j/5b/vM1jpqZN2Cwuq28rFuPhtwfsQqPgCXzMGuhbbH8INFP7GkX4YUPXqktDAuDmqeQGCba102KmSh10A6DpH7Wvl8pNsbnjngKzIlJwlhI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5f16e4-907a-4a9d-8b1c-08d7e5fe18ff
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 14:13:00.7575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+TAQ3VXg40M9hl0vAag3EoU4SlHRE6lig4G6dzwswA5+sik9Opdf6QxKcT4gGChakkPO4p7kQTYsVjzjfSXtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4537
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-04-19 9:50 p.m., Randy Dunlap wrote:
> Fix a kernel-doc warning of missing struct field desription:
> 
> ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:331: warning: Function parameter or member 'hdcp_workqueue' not described in 'amdgpu_display_manager'
> 
> Fixes: 52704fcaf74b ("drm/amd/display: Initialize HDCP work queue")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: amd-gfx@lists.freedesktop.org

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- lnx-57-rc2.orig/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ lnx-57-rc2/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -139,6 +139,7 @@ struct amdgpu_dm_backlight_caps {
>   * @backlight_link: Link on which to control backlight
>   * @backlight_caps: Capabilities of the backlight device
>   * @freesync_module: Module handling freesync calculations
> + * @hdcp_workqueue: workqueue for display manager interaction with HDCP module
>   * @fw_dmcu: Reference to DMCU firmware
>   * @dmcu_fw_version: Version of the DMCU firmware
>   * @soc_bounding_box: SOC bounding box values provided by gpu_info FW
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
