Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB176AD01
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6091210E1CB;
	Tue,  1 Aug 2023 09:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DBD10E1CB;
 Tue,  1 Aug 2023 09:25:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMu957MLDC47oa9jXKSNrh2G/mtpU+/xHTqE8YBnWa98h5im944S74lMv8aonZs/uE3EtUhWhlxvRbXiqq9eS1WB0gzmBcpvw6aO/etgvxM/jM4uWsEWjrZSU+mTvSLnWBAxfOuBjCZcsU/X7D8cmlxzVy76+mP87vlpRlsmum748DWYJ6xyc1qH6Cgi3ToSSz/lu9skj0EwOT4LSghwwPol0kbpo6Xp7RshBcGQOQ0RYNpc4Chnv8JW1I24wwDFOmhzSoog9N3ZMrOfqs8Fa2xRmmKT2cWKDFNduF6uvNhaeN2yTYAjHr/dxKFc4LUeBIklbXt5EozJWxs3UorpDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGHtsdXSUDwh/VnpzPdssHdE5macEUaYKEPzuGqR7DU=;
 b=SmjNAACVNyD6iAx5pqzVqmbroWYz4no26Bx1qWGmZPhbp4Y5eQa7p35yPb/NtK0JGtVDYfvk70wHqDx870+tdrA3dAQxDm5zY4VIzD89x69V7F1kQ63Ws7h/mB/qzBOts1ImHgAlWGIv738xN2WSck6zocOmi+x2IK6txHJAvUZnwStx9/O393e7Ibo3WkqOdKMKAaOzuYkOvi3yJUAXgTA7OgsNED/GKu7QzwVhAzjZ24a+f6xEp08P2MJFmQSxQy31b6muSQOBhZotlefu1oYt+ZQV0KlZssgR9mLpssmbXf6KzeJv6M7qgHiOt67Epm4HBfRNTHkdhNSJPoeoGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGHtsdXSUDwh/VnpzPdssHdE5macEUaYKEPzuGqR7DU=;
 b=rk5j/Asa+R2Macp9XCLJIwKZYo8R0Jvdm+3ILs4n4ExdJ6wuk8EL84bKbFfFf0Tv/7xd5C8meZ20JLfKtB0M24IffDy2kauewzmPl6aTA7m9Kr5CuYcuVBW/Xm0ZNVm8SOBeQoACflah12tvKh+WqzZww7HDa+NqPVxo1xVnVk0=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 BY5PR12MB4292.namprd12.prod.outlook.com (2603:10b6:a03:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 09:25:19 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f%5]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 09:25:19 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Ran Sun <sunran001@208suo.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/amd/pm: Clean up errors in vega20_hwmgr.h
Thread-Topic: [PATCH] drm/amd/pm: Clean up errors in vega20_hwmgr.h
Thread-Index: AQHZxFIXMl3F1fA2WE6Cb5E5XHEy+q/VK32g
Date: Tue, 1 Aug 2023 09:25:18 +0000
Message-ID: <DM6PR12MB261918C00FCDF3E4BBBC1C57E40AA@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230801023915.4756-1-sunran001@208suo.com>
In-Reply-To: <20230801023915.4756-1-sunran001@208suo.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=49c0850c-70ba-44c1-b096-6576ac169982;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-01T09:25:09Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|BY5PR12MB4292:EE_
x-ms-office365-filtering-correlation-id: f5caa6b8-ae7c-4afd-0b6b-08db92713908
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V5Ej6dNqWtG/C7OilVPo40hWhnTerk8kr/thLpkUKxMuJMhXpEAkJwW9m+3teWSjNBYD9tRIW/wIOQNrLG4RylIN9/F+0oqHapI7A66olrZe3CeZl3anMQjnCvU1o9kiY+/17sdcTk7X2GS+d5RXEWxy647Vxjq7St202L/gZ87TIvyy/7pYkovJQ17WEWTplbhqJL13kCdKni8Y1yIGQn8xBjE4xvNc41eEYO1T/bmxMamZkWZsuvvJDfVncul2sPvTDphbCvzaUaS+wkB4MTbeKT45/4uTYABXvYaCxIIW35hE8FXQAaIVkZSAL7AnRgROe7XL/DEfxMmRS1wUIGCMwp8Abj3m9HJk3VKTcGE8kjAFdHkuvB5cEiDBbEuyFDg6Nq0WN/jw/SwpZJDu1l7c7bgoIydUNIoPclPe2kwPdAnJkKkOmHRZvknNVL3nu/Ds+6dPAFBes3dLs5Erg8knLuLwyB1GQy4IiW5Jxx7OW7KkZ/YZCOKcFpxRFor4zkLdnYSUeyGWqOAn0FUbNmKYrnAhmLMbjTi30E5cH2aPkSEl6K7KXCarAUrRjjpaCoQyLHRCqaxGzn/rGjeC/zc6HK2AuIV3WtJ/9Ev0EhhvEWIXvV5Dh+LMeI8wS6rL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(7696005)(38070700005)(9686003)(86362001)(71200400001)(55016003)(186003)(83380400001)(6506007)(53546011)(26005)(38100700002)(33656002)(122000001)(52536014)(5660300002)(8676002)(66556008)(64756008)(41300700001)(8936002)(66946007)(76116006)(66476007)(2906002)(316002)(478600001)(66446008)(110136005)(54906003)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MnIsjaNY1KtEsLhL0SfSCcfB/sMI33gRm4JbElg9WGucfjB7hyp381v6ovMs?=
 =?us-ascii?Q?gDOPWnNBpDjleJfvwZbS5eMsGHBd39/+5UUgHGnzKqFpFfmAaXWvaU1EPmgq?=
 =?us-ascii?Q?RKsQMXZUQbLnQdyQMh9lwVBAXPvICUwoko2mni2gFSJC1Lls9N2TAXPFSHVo?=
 =?us-ascii?Q?fi1DHQx2y9+4aDKzpTrk8RhaT3nc8/HCXwM1C5G8oWPa3fcA7W1Ld3MHWmxF?=
 =?us-ascii?Q?WhKK+y4ABOMOgo/wUQjnwR0II0R8BfTaFyjJtNQ3irTVGqH7CrxDSciNivfb?=
 =?us-ascii?Q?kDqMTL619dqTY4iZQ6FFHWRm3NtFU5XG7NleRPoPMBUe9KYi533WZVMKKQO9?=
 =?us-ascii?Q?p4UlD9slAHv0lODcvQRPba0oWNNkpS+w6TYghKSnXLXHqPilkq2H6XlLMvxi?=
 =?us-ascii?Q?NYwS8aVTtUAXq6iDFS2mpfRxeDEdwMdGV66hGS/kuibRRIdT6wzDUYpuVIeO?=
 =?us-ascii?Q?1fyXQY9v+8mOJObCSnn/2LwdyBpgsaZzKH5X06j+jY84CDALGQVde+DLHduc?=
 =?us-ascii?Q?FaMykmpNQVumaY6rdVpMAwQTG+ZQP+nKLBkmatdF0rX9ffu31f1Cz9Jh9ckY?=
 =?us-ascii?Q?/QoxEri3x+7Jysr0skpZ6qfvgysgwNxP820cYOGkoi/kJ2S2qJQyzh55wSka?=
 =?us-ascii?Q?fLDeZRJ9CtG1Wff2fFa5hcj7jGYQLtbIXGxLYE14WMRgQ8FnFHXwfOESflxf?=
 =?us-ascii?Q?ROGOdO8kkQJ5vgmw8gmqJVL5RocI1AtSfR6w3pCA2mNAAt2IDJRuYv1kutqH?=
 =?us-ascii?Q?bNoXdXGIbeT56VD+kfw3W0PkhRxf6MtPRUXEsDKEAoFw4SNoNtaLlbZP1yJ6?=
 =?us-ascii?Q?Gyxbs0FMLq6YqAitNgTNnvzPODlybMVmoPTixbznu//fxbZu2wB5kdwQzSZS?=
 =?us-ascii?Q?bxOFuB7uSe8PmTYetdfj3zBOnBNGNuJDU3XHj2r2QTYjf+4Tj6fEmWZJW+ZW?=
 =?us-ascii?Q?47OJZLaOgqbjGKGr8JqUANbSVTeXLDo9RkEev9mc1A3BXYnhqMSjlE8OlmJQ?=
 =?us-ascii?Q?n7zaBtk8qraAe1dYFQWgq7ntVJxKwrSxCbbhnDXTx6CedrWA0OqDhtGXB3bh?=
 =?us-ascii?Q?S9VkjhuvYYtCD0ldqRgFGODTfrYzUFnRaNjnJutKTigt0l2FK8BO5MedJAmc?=
 =?us-ascii?Q?rmtSNRaknKtX56YY3gyPTnNN1TzovSJ+12EGkuiE1AYvuAPqtMht3nxI6hta?=
 =?us-ascii?Q?Woc0xtYW47x3AQ/ND6lPdyKBvQoypVeqXAOr6WiYrpywHpyRaesd3+3WVrFY?=
 =?us-ascii?Q?cjLWvYAJ+Yqgw6JOAWzD4my4h9IdyoVol+KtSi52Zr0noTVX4/1KzWJn7jJi?=
 =?us-ascii?Q?0aDccfDlTdmV1+YqeCiKSJ79IwWjN3BAH5BdO9XQEtsTuUOG1OZ5KhJkIXxQ?=
 =?us-ascii?Q?wPr/uj+/Cst+LvQtLW2OXRvZtIaSehLg8M6lzgwCNYCGPXBs48kyzmI2wGp6?=
 =?us-ascii?Q?KeT0+CS6OEMbXdCOHE7AzSj6ZQQ6s33796DTRAvR1LEnBtfkz1/3UyGT7zFa?=
 =?us-ascii?Q?5wfH2qnSRvWYDZgzoeC037dz4rsBLevbDKekli/0AbYyzFXxw009scksRSBU?=
 =?us-ascii?Q?GSAtTQXB+toqTP8Vy/U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5caa6b8-ae7c-4afd-0b6b-08db92713908
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 09:25:18.8392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y0E3wnRegaXfXdMO0ZrJm3cNzSLsMGWJ9E1Wdbj6iyt5pViIimGLJJLb1dNPqvJo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4292
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Ran
> Sun
> Sent: Tuesday, August 1, 2023 10:39 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; airlied@gmail.com;
> daniel@ffwll.ch
> Cc: Ran Sun <sunran001@208suo.com>; dri-devel@lists.freedesktop.org;
> amd-gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] drm/amd/pm: Clean up errors in vega20_hwmgr.h
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following enum go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h
> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h
> index 075c0094da9c..1ba9b5fe2a5d 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h
> @@ -385,8 +385,7 @@ struct vega20_odn_data {
>       struct vega20_odn_temp_table    odn_temp_table;
>  };
>
> -enum OD8_FEATURE_ID
> -{
> +enum OD8_FEATURE_ID {
>       OD8_GFXCLK_LIMITS               =3D 1 << 0,
>       OD8_GFXCLK_CURVE                =3D 1 << 1,
>       OD8_UCLK_MAX                    =3D 1 << 2,
> @@ -399,8 +398,7 @@ enum OD8_FEATURE_ID
>       OD8_FAN_ZERO_RPM_CONTROL        =3D 1 << 9
>  };
>
> -enum OD8_SETTING_ID
> -{
> +enum OD8_SETTING_ID {
>       OD8_SETTING_GFXCLK_FMIN =3D 0,
>       OD8_SETTING_GFXCLK_FMAX,
>       OD8_SETTING_GFXCLK_FREQ1,
> --
> 2.17.1

