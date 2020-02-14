Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9FB15DDB2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C183F6FA15;
	Fri, 14 Feb 2020 16:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183F46FA14;
 Fri, 14 Feb 2020 16:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqxPY6eTeSGI/N/1Gh4F7aLmbhABKSSXWTlAnGBWkM9zJ7wKTG0ZAxgFvyc1fxdwXDZik7lxR81TDTxqUoxctNt20kuxT28vrqMyipH49B2NYsKZIrnvziS0lbvLZkJ6R1x42TF4Y2qvGaSls/KDKKF0JmGJZ9C+huEFCeNpLRMEvayNmBDHG2wTQ9PsLEx7qFlpPTb3Idl+hwOmcn6EdpMfjtlEET/BuuflUpflrlotQUcQqkvzwM24yOxLE1EFeB+0Oh08FsDzPWgplCOPC8j+QYVrr/ZW4fo4cwZAn50mGr5RjUBEMlBgMAoFJO+6/too94McPXUWoWgy8h6d2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1NmVgVHJPBjz5DDw59G4emVWseGWn1aWJozqn0khA0=;
 b=MDrYQnvaK4KiUXHm+jje0bbb8jTu98IxEXgvEAg/ZE61el0g34iqbgVGluaklHz7pgyG+aBqwXKziHMkZTBVSgW9XYBGargpBUuPmLbETOEBOeTgNS8xJ3JF/u2HSgW60deBCPTKfva56ZBUo83ub41QHHXDep0Q1flN0QGgZsExTcSuEhLnrfvRLEttqAHWhJXqgFu7/z6fxCm0asaNzsdNJRSCW8SrIMD1nAmsjoXiNJIBWBhZBPTUYUU1iKrA7tjpYjuLjMWW53+C9rC5l7EruhHRD91qsUPCIz4+0lqNc7fDqZrEGFb/2ENKdOuEpmDyFnCMan1xW91u+tCr7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1NmVgVHJPBjz5DDw59G4emVWseGWn1aWJozqn0khA0=;
 b=L4ToET564guG3PHNnfS0P/jjByUSSqvrPx7Dz2NhoH5hI1tla+W3YCklxeRz6CfAh5fG6E4wk2/r4qavRc4IGOXlmADKR1nPAQboVAjewu2oKOn6aweagDte9KRDMRs7Vhg6uTU7yhC7ctAyXzecCfKjIgWDBs4urRaZvTX+7u8=
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com (10.172.92.14) by
 DM5PR1201MB0012.namprd12.prod.outlook.com (10.172.89.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Fri, 14 Feb 2020 16:01:02 +0000
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51]) by DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51%5]) with mapi id 15.20.2729.025; Fri, 14 Feb 2020
 16:01:02 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: Nathan Chancellor <natechancellor@gmail.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
Subject: RE: [PATCH] drm/amd/display: Don't take the address of
 skip_scdc_overwrite in dc_link_detect_helper
Thread-Topic: [PATCH] drm/amd/display: Don't take the address of
 skip_scdc_overwrite in dc_link_detect_helper
Thread-Index: AQHV4w3nrdEjDXoM7k+tBRh46kQ/F6ga2T+A
Date: Fri, 14 Feb 2020 16:01:01 +0000
Message-ID: <DM5PR1201MB2554F94D7E206B7690C208109E150@DM5PR1201MB2554.namprd12.prod.outlook.com>
References: <20200214062950.14151-1-natechancellor@gmail.com>
In-Reply-To: <20200214062950.14151-1-natechancellor@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ffdb09a-7ea3-4819-cc1f-08d7b16716e7
x-ms-traffictypediagnostic: DM5PR1201MB0012:|DM5PR1201MB0012:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB0012E5CB2FC3BA1759E6B0A79E150@DM5PR1201MB0012.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 03137AC81E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(189003)(199004)(26005)(186003)(33656002)(4326008)(2906002)(52536014)(5660300002)(66476007)(9686003)(8936002)(316002)(81156014)(86362001)(81166006)(66556008)(7696005)(54906003)(110136005)(64756008)(76116006)(45080400002)(55016002)(6636002)(966005)(66446008)(53546011)(66946007)(8676002)(6506007)(71200400001)(478600001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0012;
 H:DM5PR1201MB2554.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BawvpbGpghwUyTJwki8NC9In2ZKQuSMjrRh1hGnQAn+ehswAwnP3bidg7Jy8EuabQiLWrBDv1LmCcfZzNUq7UWno0APNlGd0CkGqyZ9rRgGccjYnMAvWZdtMupt25EmeZ2Pflm2hSPPcZ9N/V9Af2e7v6/4Ctwd+EPM+PSlq5nZcdJNRH+PAqk/Ao0LuXZQG5ajMKECEY2XXSUen8q8SBiizdPCISNxdpK8+LCvWJisLZD6c1tcVHkwxW9+RyaLbhsU8vAqX/n4EJRKD0DnFSOF5rhw1rtAtiUjYOaxTjYg3UdF+bGL0vJDsxWnoYgSAfQ1AR00lePKu/J4iXuJmjUosztMq//Y44Oz+EsR8d/BKEHrnzjhjpR0xJ0XLdp+Yj5cS0utw0rguIXcS3Uxj1bAfAvnmTuxNln9hfYpYn+yDd6m2IqZlVS9iijfjAE5zH7XD+QYdD8jH8VYR9xxYtfmcoBmwUnbhBZ1zgflIiQa/paZFaxOpE5D3dwvoibL7qaT6i0GEGuln8uQsdJoHm7DBo7w8LdhCMYSDfo9AK9BodqgYvylIyRAKqg5BJBKbZdeKoO39jGV23ruc7g1Z5dj/qm0Ym7eUO3wqh2L/BQ5tB7qrVQZOoHnVMG6AVdHYE/CHSC5QobuLTOY3u3n9aqS8Rc9mDpn0MLkrRlqKM8uIXnL7XqgPR4J3O+aMrgaa
x-ms-exchange-antispam-messagedata: +NKeL3LmO+gO5ICcSbVdEER6hv0xG4uGHk9/PD/1idLzkm+hGZZTj/vA9jmE/DyZqAnO5Gdx4I4tAgKrSvQvpBvgbQX2CqXfOuw4OJ+zvJlGynL9W7IAwK5B1E4uIkcgAQXpSDn6dlYeIWHmbKP8/A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffdb09a-7ea3-4819-cc1f-08d7b16716e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2020 16:01:01.9322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cF2EsSxkd+6UbYflf8L0J5ouH4wmgWLWJfKs+OM+11vYp3rBQc/4Ito1P8SS26Rt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0012
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
Cc: "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Nathan Chancellor
> Sent: 2020/February/14, Friday 1:30 AM
> To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Zhou, David(ChunMing)
> <David1.Zhou@amd.com>
> Cc: clang-built-linux@googlegroups.com; Nathan Chancellor
> <natechancellor@gmail.com>; dri-devel@lists.freedesktop.org; amd-
> gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] drm/amd/display: Don't take the address of
> skip_scdc_overwrite in dc_link_detect_helper
> 
> Clang warns:
> 
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:980:36:
> warning: address of 'sink->edid_caps.panel_patch.skip_scdc_overwrite'
> will always evaluate to 'true' [-Wpointer-bool-conversion]
>                 if (&sink->edid_caps.panel_patch.skip_scdc_overwrite)
>                 ~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
> 1 warning generated.
> 
> This is probably not what was intended so remove the address of operator,
> which matches how skip_scdc_overwrite is handled in the rest of the driver.
> 
> While we're here, drop an extra newline after this if block.
> 
> Fixes: a760fc1bff03 ("drm/amd/display: add monitor patch to disable SCDC
> read/write")
> Link:
> https://github.com/ClangBuiltLinux/linux/issues/879
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thank you!
Reviewed-by: Zhan Liu <zhan.liu@amd.com>

> ---
> 
> As an aside, I don't see skip_scdc_overwrite assigned a value anywhere, is
> this working as intended?
> 
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index 24d99849be5e..a3bfa05c545e 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -977,10 +977,9 @@ static bool dc_link_detect_helper(struct dc_link
> *link,
>  		if ((prev_sink != NULL) && ((edid_status == EDID_THE_SAME)
> || (edid_status == EDID_OK)))
>  			same_edid = is_same_edid(&prev_sink->dc_edid,
> &sink->dc_edid);
> 
> -		if (&sink->edid_caps.panel_patch.skip_scdc_overwrite)
> +		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
>  			link->ctx->dc->debug.hdmi20_disable = true;
> 
> -
>  		if (link->connector_signal == SIGNAL_TYPE_DISPLAY_PORT
> &&
>  			sink_caps.transaction_type ==
> DDC_TRANSACTION_TYPE_I2C_OVER_AUX) {
>  			/*
> --
> 2.25.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.
> freedesktop.org%2Fmailman%2Flistinfo%2Fdri-
> devel&amp;data=02%7C01%7Czhan.liu%40amd.com%7Cb0b05e8e1c944b85
> 0cc108d7b12508b4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7
> C637172644928182374&amp;sdata=OfX%2BPBPCkFt8Elo12VfVBg6Ecnui7Vh
> hZwQFaKy5eyM%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
