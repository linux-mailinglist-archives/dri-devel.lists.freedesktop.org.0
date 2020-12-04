Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7D82CE7F4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 07:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB50E6E12C;
	Fri,  4 Dec 2020 06:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40FB6E12C;
 Fri,  4 Dec 2020 06:17:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrzwcPUfc4xWh3e/Mc2XIFQ4eCtw4MS55BWlEUByN1G6MfuePuy5/WmImJrjJGeJ6Owx6Le1LE7/qBbWKtcK+wqewiJxO/rgRa45JrqjoCTXNClqDPiyYaeIR6+iuSMduo8GGCuVTesAz4IAcYSQWMpnAjhovsWloEY4DGd3PZE8DN+WkJI7/3UGVDTE+alHDK5l6Gks/KHAPdJ3phXrKr0o0ONQp5EKBKCRCjPF1YKoKQgcqZUtPx2ghP5sW0sjHhkBMJa3GezbUV/jW9OfGJObPoEPBcq831T2gaGgJf27m/rdvdJ124xocx1QhxKIlUJMTSmxbyQZ7QVy0uaJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E20uR1wbl5xnwQ6NdqW+efuPkeyTSMT06lx65eendwo=;
 b=d+e7CtPKyQgvRWouStTO6VwOBt73K4eOGKpf5BI8hJFrViFUkzs6h1YAf35PHpmHn0yYYJXwKosR5g7Jn/+NsQ/AxdnllZltfsX4+fqKpXfEELQtUcny7v5PormaJ2M8qzHB9fS4l1IkETiYoPsdSxOjeZQAzyq3tQtoCHnWvqZNTEmA3kundPWHrRKIPMIlnVzQeRydR14vL7WEXeYYlncA/OwUy7O0aZywSlKpkP/1jJ0bw4+Vjc72zHVAbshkXgTArl3uz9qSNIPotKkzrnwCP6EGWWPys69oJvC8gNKp9PSwX4RB0U/wHkQEYCAsh/KUr9ZkvjQtHJPHpV8MDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E20uR1wbl5xnwQ6NdqW+efuPkeyTSMT06lx65eendwo=;
 b=MGMjppuDNZkGHhFWmdB1twaaiK3j0hmIwxk++lfbroltir8mIRBrjrtw73GWBvYTqFpmocZUZh50pKMNX/ywdTQn95Es1UaRd9aDnR3S5kFb+7uodAsq3FWW/17t/DlNZUAU3EcVxwIU1QNF/Y8u8BhU2qUglOuf8JXZfNVQFlc=
Received: from BYAPR12MB2888.namprd12.prod.outlook.com (2603:10b6:a03:137::24)
 by BYAPR12MB2934.namprd12.prod.outlook.com (2603:10b6:a03:13b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Fri, 4 Dec
 2020 06:17:39 +0000
Received: from BYAPR12MB2888.namprd12.prod.outlook.com
 ([fe80::617c:f1eb:fd73:b236]) by BYAPR12MB2888.namprd12.prod.outlook.com
 ([fe80::617c:f1eb:fd73:b236%7]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 06:17:39 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: Arnd Bergmann <arnd@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: RE: [PATCH] drm/amdgpu: fix debugfs creation/removal, again
Thread-Topic: [PATCH] drm/amdgpu: fix debugfs creation/removal, again
Thread-Index: AQHWyckDxF27K8RzxUiQifotMDhJranmdf+g
Date: Fri, 4 Dec 2020 06:17:39 +0000
Message-ID: <BYAPR12MB2888D809724EADE2AAB77B74B0F10@BYAPR12MB2888.namprd12.prod.outlook.com>
References: <20201203230652.1480863-1-arnd@kernel.org>
In-Reply-To: <20201203230652.1480863-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-12-04T06:17:31Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=46bf28b1-2c73-40d6-a8f1-0000f4fa3487;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-12-04T06:17:26Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 12ba8f53-d2c9-446a-9853-00007d5e8201
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-12-04T06:17:35Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 0115a11e-a00c-47e7-a259-0000b0a9f0fe
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.169.125.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1d1c05f2-b0cf-4b8d-07d5-08d8981c4d32
x-ms-traffictypediagnostic: BYAPR12MB2934:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB29343F0F21348DB00983C50AB0F10@BYAPR12MB2934.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tzv9Wp+p06N987ahb1+IG+1sFiXjVDt0bMPvm6s1UKxvhrs/PqZxCbxO96CSJ+yJjEpuL9/rV3t3SzcsDjyUOZJrDmsDyyeqk7aqBflg90npWMBpHtC/NNXn5u6bHbYDKZut8a0Wi0/3JsSWlq397aUx6TlSLIldHZKjDc25Yn2BEymdua3TPBrpkQUlixwLqL0tCcu5twVWuyb27anxyfiN3QEX6zr7pl1BedhbdFvjla8Z4fhkB1R9VZ/JuMfvdk86U59LyqlDJdTsEO3CTBqtiVNQ1ylwNRUc8wrtNt40B1mqhwnF9CNzOZFC3NfT2iCo2sWwM1VEmUUI4TaFHyRjUqK0/qJCDShNxm2M3JfsGWfqSUKn3TV0RcrW/5XT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2888.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(921005)(55016002)(186003)(6506007)(53546011)(52536014)(71200400001)(86362001)(83380400001)(26005)(8936002)(316002)(4326008)(33656002)(9686003)(6636002)(7696005)(2906002)(66446008)(8676002)(76116006)(110136005)(66556008)(5660300002)(66476007)(64756008)(478600001)(54906003)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8cWDjnSgjdLztahLP0DYToV2j+D7s4S73ZeaYaIMt2Bhgb+JKrGDLH/097Gf?=
 =?us-ascii?Q?XUSafzzBvUD0WswPlJb1xRSpNWDKnXEFE/eAqBO/zYY8mr7+F1qpDA93Rjfw?=
 =?us-ascii?Q?Zdx5WQiSpqg6YZhzC65Uj8gxriauHOIA8aN53gCbB4SZYYmAixFsPVNzwt6C?=
 =?us-ascii?Q?HTROAHNsStW5X7I+3xNXYmVwiFhSDAGV/ct1n758brGAMjD/B/VvG4MsCWbJ?=
 =?us-ascii?Q?YhuIYDSw+gOda6JQ+3XqpzFB2oISMDq5FV9Wbf0mgK/HcbwuyK0SFWUTIssf?=
 =?us-ascii?Q?96M0l99U9UupLrAa3+m5AW3T+ccyr0l7l+pj/jd26qCWe3ZJFY8fWraIdBNV?=
 =?us-ascii?Q?+MQno0k0JNtnRiSLScRDuHPFE18xZZv/bzAnNyTojrZDEum7TAPIEzleXMfs?=
 =?us-ascii?Q?AQQgmCGlETnxLwU3j5ixuN/mqytbBEuQIEqxrliq8P2OL4kXp8gOPWUVq7TW?=
 =?us-ascii?Q?CFI4wLv8535rU6I6LMDOQcXXGbx6gpGGEhBXSKCeyCoc6MimmHqr4J+LKG6t?=
 =?us-ascii?Q?s9gEVK9rK6iej9QBnhupkbqmpXjc9bRB863EU6g+PK0ljJPzC/TAnFbm9seY?=
 =?us-ascii?Q?QN/NmvtpmICAIfM38NFkEr1NRRSZUEdf98K92l6X30bNV25k2F8C4+rTTjrk?=
 =?us-ascii?Q?LuGgUrYsCkZi8+Jx0iBdGa9Fqu44eJ+zxZhkPbmqZaznUiZ3ZgzDJpZvGSA7?=
 =?us-ascii?Q?hbHV5rBt1Qf9pzsXSPTMhU5h46WzG0I6E0WjKCdoAZPNgG2N8EemsP/H7nwZ?=
 =?us-ascii?Q?12Xet42ceM65tlZsGZMYxylNCYPeCZwypptsUsu6Si4S7boiLAT4YnO2nH3o?=
 =?us-ascii?Q?2Xv22f6HTo4m/kMoby68W5GeDmpk5bGOE2tCWV0DX2BGuXNL778cwRj8fiUO?=
 =?us-ascii?Q?sf5sRgluQPlx13o2R9gTrZhGSVgjWM0V0utw/ExOypkzjb0ypeh2aSs5UVdF?=
 =?us-ascii?Q?m9rg2tdjArd6V17TF/x6MjyBCqIeEMds/hHLpV/BGl8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2888.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1c05f2-b0cf-4b8d-07d5-08d8981c4d32
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2020 06:17:39.2267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mTfHrAFkxSx6BnayTNbGE0Wffu8LWQPXyFeWyPBSgKQlNpELYvZGwXIjYdy9u8AH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2934
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Ma,
 Le" <Le.Ma@amd.com>, "Yang, Stanley" <Stanley.Yang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Clements,
 John" <John.Clements@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Reviewed-by: Tao Zhou <tao.zhou1@amd.com>

> -----Original Message-----
> From: Arnd Bergmann <arnd@kernel.org>
> Sent: Friday, December 4, 2020 7:07 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; Li, Dennis <Dennis.Li@amd.com>; Zhou1, Tao
> <Tao.Zhou1@amd.com>; Chen, Guchun <Guchun.Chen@amd.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Zhang, Hawking
> <Hawking.Zhang@amd.com>; Clements, John <John.Clements@amd.com>;
> Yang, Stanley <Stanley.Yang@amd.com>; Ma, Le <Le.Ma@amd.com>; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] drm/amdgpu: fix debugfs creation/removal, again
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There is still a warning when CONFIG_DEBUG_FS is disabled:
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1145:13: error:
> 'amdgpu_ras_debugfs_create_ctrl_node' defined but not used [-
> Werror=unused-function]
>  1145 | static void amdgpu_ras_debugfs_create_ctrl_node(struct
> amdgpu_device *adev)
> 
> Change the code again to make the compiler actually drop this code but not
> warn about it.
> 
> Fixes: ae2bf61ff39e ("drm/amdgpu: guard ras debugfs creation/removal based
> on CONFIG_DEBUG_FS")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 13 +++++--------
> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h |  6 ------
>  2 files changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index 9d11b847e6ef..c136bd449744 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -1167,7 +1167,7 @@ static void
> amdgpu_ras_debugfs_create_ctrl_node(struct amdgpu_device *adev)
>  			con->dir, &con->disable_ras_err_cnt_harvest);
>  }
> 
> -void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
> +static void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
>  		struct ras_fs_if *head)
>  {
>  	struct amdgpu_ras *con = amdgpu_ras_get_context(adev); @@ -1189,7
> +1189,6 @@ void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
> 
>  void amdgpu_ras_debugfs_create_all(struct amdgpu_device *adev)  { -#if
> defined(CONFIG_DEBUG_FS)
>  	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
>  	struct ras_manager *obj;
>  	struct ras_fs_if fs_info;
> @@ -1198,7 +1197,7 @@ void amdgpu_ras_debugfs_create_all(struct
> amdgpu_device *adev)
>  	 * it won't be called in resume path, no need to check
>  	 * suspend and gpu reset status
>  	 */
> -	if (!con)
> +	if (!IS_ENABLED(CONFIG_DEBUG_FS) || !con)
>  		return;
> 
>  	amdgpu_ras_debugfs_create_ctrl_node(adev);
> @@ -1212,10 +1211,9 @@ void amdgpu_ras_debugfs_create_all(struct
> amdgpu_device *adev)
>  			amdgpu_ras_debugfs_create(adev, &fs_info);
>  		}
>  	}
> -#endif
>  }
> 
> -void amdgpu_ras_debugfs_remove(struct amdgpu_device *adev,
> +static void amdgpu_ras_debugfs_remove(struct amdgpu_device *adev,
>  		struct ras_common_if *head)
>  {
>  	struct ras_manager *obj = amdgpu_ras_find_obj(adev, head); @@ -
> 1229,7 +1227,6 @@ void amdgpu_ras_debugfs_remove(struct amdgpu_device
> *adev,
> 
>  static void amdgpu_ras_debugfs_remove_all(struct amdgpu_device *adev)  { -
> #if defined(CONFIG_DEBUG_FS)
>  	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
>  	struct ras_manager *obj, *tmp;
> 
> @@ -1238,7 +1235,6 @@ static void amdgpu_ras_debugfs_remove_all(struct
> amdgpu_device *adev)
>  	}
> 
>  	con->dir = NULL;
> -#endif
>  }
>  /* debugfs end */
> 
> @@ -1286,7 +1282,8 @@ static int amdgpu_ras_fs_init(struct amdgpu_device
> *adev)
> 
>  static int amdgpu_ras_fs_fini(struct amdgpu_device *adev)  {
> -	amdgpu_ras_debugfs_remove_all(adev);
> +	if (IS_ENABLED(CONFIG_DEBUG_FS))
> +		amdgpu_ras_debugfs_remove_all(adev);
>  	amdgpu_ras_sysfs_remove_all(adev);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
> index 4667cce38582..762f5e46c007 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
> @@ -592,14 +592,8 @@ int amdgpu_ras_sysfs_create(struct amdgpu_device
> *adev,  int amdgpu_ras_sysfs_remove(struct amdgpu_device *adev,
>  		struct ras_common_if *head);
> 
> -void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
> -		struct ras_fs_if *head);
> -
>  void amdgpu_ras_debugfs_create_all(struct amdgpu_device *adev);
> 
> -void amdgpu_ras_debugfs_remove(struct amdgpu_device *adev,
> -		struct ras_common_if *head);
> -
>  int amdgpu_ras_error_query(struct amdgpu_device *adev,
>  		struct ras_query_if *info);
> 
> --
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
