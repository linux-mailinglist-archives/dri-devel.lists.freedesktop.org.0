Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BFD15F4FB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 19:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D7A6FB7D;
	Fri, 14 Feb 2020 18:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5326FB7C;
 Fri, 14 Feb 2020 18:29:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZIStkgm7+NSeZD1UbJ8Ks/Ylg1v+yxAa9m5171s/A19vwzxZUM0gOsdPgQO5mAdHAZLCgAdCOEHdTwIMZtltRHFmTudY4A31NNr+QXuY/5H62VyA+HcCu1Lj33mFFHN4ueLzhR2NFBWAVpYcUz0sTpouHpkojvg19nKWRmhIq146R3Fu+QFSaHAAmClmOm7lxWDfCoju1vueHNYWcGaxXa0ASTmz0edO/g+qdGq5EaMczSMDT1VQkeFL22rV+dhUcPlJ0ICdSF2BJcT0xQNTI3Qb4ZKZT0tL7fVRUWM6sn5b82YK8/ChvmHYfpOkm3EV2FjXu7Yb8n+x1titQN31A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Orn0aJH5F+MQm92Avsdy56sOSPhcSt+laqHLN6njMk4=;
 b=og0tHHzi/94+9Q2n+6LUvCGaMRseJfHzc2DxTAQVEg24H/CxBzTSYRszSVdNXmv9vpscwZdzVQD6y4RP1ybjg3zmdphPPTpwV4oBdKgyQVowml6puNaeXnYCQwzj4m+WO3MoKvDNCqFU+1lXs8saHsNC0h24vqMgL8ttTM8TuYK0+h0/+tGF/pNIsNOHLZg/PgH40KkMFXvJLQNITCsBEjuWP6pWD4zchK+jOa/UV9kvdyh1Qz3oZY+sYEXWZYaHdUmkbM1Zy/NgJpCh70MskuhNOfkUh/+Hri9FvqdKIJEKdcFbLIhd6jIu0Jc35WfXL21ylqveN38jeZk7AotEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Orn0aJH5F+MQm92Avsdy56sOSPhcSt+laqHLN6njMk4=;
 b=diFxGgnVmnsLEhi3r9Mw4ggMV8rCONur8Pczs/3hRfkEmtbC7lYf5tK0pupVlAAp/1NBsb5ALUXaymiwk+4GN8Ab5aog+XhosN9ilBatdxXoAy7RSuhK2RPsLw3Vc9D9zJWQlSnrt6LE/rj+rWZGDoyiSkQv8OVcqt1vpSFEp6A=
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com (10.172.92.14) by
 DM5PR1201MB0201.namprd12.prod.outlook.com (10.174.109.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Fri, 14 Feb 2020 18:29:44 +0000
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51]) by DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::c4c:bafd:5833:2b51%5]) with mapi id 15.20.2729.025; Fri, 14 Feb 2020
 18:29:44 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: 'Nathan Chancellor' <natechancellor@gmail.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
Subject: RE: [PATCH] drm/amd/display: Don't take the address of
 skip_scdc_overwrite in dc_link_detect_helper
Thread-Topic: [PATCH] drm/amd/display: Don't take the address of
 skip_scdc_overwrite in dc_link_detect_helper
Thread-Index: AQHV4w3nrdEjDXoM7k+tBRh46kQ/F6ga2T+AgAAp02A=
Date: Fri, 14 Feb 2020 18:29:44 +0000
Message-ID: <DM5PR1201MB255472E9CD12B906CD5BAD9F9E150@DM5PR1201MB2554.namprd12.prod.outlook.com>
References: <20200214062950.14151-1-natechancellor@gmail.com>
 <DM5PR1201MB2554F94D7E206B7690C208109E150@DM5PR1201MB2554.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR1201MB2554F94D7E206B7690C208109E150@DM5PR1201MB2554.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bd2e77cf-6706-4148-79cd-08d7b17bdd35
x-ms-traffictypediagnostic: DM5PR1201MB0201:|DM5PR1201MB0201:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB0201A933AA28C5C6FBFC85859E150@DM5PR1201MB0201.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 03137AC81E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(199004)(189003)(8676002)(8936002)(55016002)(2940100002)(64756008)(966005)(4326008)(9686003)(478600001)(66946007)(66556008)(66446008)(66476007)(316002)(6506007)(53546011)(54906003)(110136005)(76116006)(186003)(2906002)(33656002)(71200400001)(81166006)(81156014)(86362001)(52536014)(6636002)(26005)(7696005)(5660300002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0201;
 H:DM5PR1201MB2554.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7sDVZ02PuuwGX7aDgZlZ6B3poXoAnL2A14wCY7T+dSIzNw4Df4O63+f0Rrkml7jtB+8pOjMZMUQ1McwwinUyEljytviiUwZQrqWxPxXhhTOGuFb50Y8ef9nTZ4O3KGyeGglw8lSg2/aTfMBo0aPnDovS7U7XxxiTxZ1F15HJ2396q8Brz1eZRST2YCtb5sRNcrfaMkTTnMdOFiC5n/2GY3Rkx2gmsZFEtkcJr62Z4yOUC2k7J8mXoIjMxc5GzFmJ0hTWoveiYA4skdRA95pHfe88wfseirFzULJrCDdzKi8DXwgyhPRWH9FuoyGZvcH0izPj0BqAhdPdcdsa2OUYUf9eqfjO7lzgUxDBT2KZ2sIIxxVZLRVstahlXwcRqvZGfJb7gmz45RvYGCIlgnb539Zkgh8UE/ClXzHJ2sbwe9ZZH3w2yK+gq5MVa0Uu3AflhBW/72UXYW/MIhIgVU43JuodRRWXvMx+OpvUDaRRQKQnnQQ3UvRRxXO4CNcDbX63t5GbQOBfHsJmQtf4MBoUo/F4H2HbzfKm9E8WojyI+H1i37ZJrUTWNPn5x5XfP8cg8MTdo2CZPJSQw4FKctecsw==
x-ms-exchange-antispam-messagedata: xjn0WItcHzZnTMEHH+KN4VkzSZBflH0PcBTm36VFQo0/lY9s3ql+MZtVEGNAuTJR7bUNxX9nPkfZZPi5wKFO+f3vwyoQmtkrVOCyZeRFQ95SdxEwtc+ugjp5frMZsUb6qbitgijyIROz0JY/e6WLQw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2e77cf-6706-4148-79cd-08d7b17bdd35
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2020 18:29:44.5518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4AHzmMHNeUNwGeuPi6MIDpnW4J9PRsX4FpGoGvpQHu628TPj+hfd+c5UZoEyi5YU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0201
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
Cc: "'clang-built-linux@googlegroups.com'"
 <clang-built-linux@googlegroups.com>,
 "'amd-gfx@lists.freedesktop.org'" <amd-gfx@lists.freedesktop.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: Liu, Zhan
> Sent: 2020/February/14, Friday 11:01 AM
> To: Nathan Chancellor <natechancellor@gmail.com>; Wentland, Harry
> <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Zhou, David(ChunMing)
> <David1.Zhou@amd.com>
> Cc: clang-built-linux@googlegroups.com; dri-devel@lists.freedesktop.org;
> amd-gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH] drm/amd/display: Don't take the address of
> skip_scdc_overwrite in dc_link_detect_helper
> 
> 
> 
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > Nathan Chancellor
> > Sent: 2020/February/14, Friday 1:30 AM
> > To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> > <Sunpeng.Li@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>;
> > Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing)
> > <David1.Zhou@amd.com>
> > Cc: clang-built-linux@googlegroups.com; Nathan Chancellor
> > <natechancellor@gmail.com>; dri-devel@lists.freedesktop.org; amd-
> > gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH] drm/amd/display: Don't take the address of
> > skip_scdc_overwrite in dc_link_detect_helper
> >
> > Clang warns:
> >
> > ../drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:980:36:
> > warning: address of 'sink->edid_caps.panel_patch.skip_scdc_overwrite'
> > will always evaluate to 'true' [-Wpointer-bool-conversion]
> >                 if (&sink->edid_caps.panel_patch.skip_scdc_overwrite)
> >                 ~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
> > 1 warning generated.
> >
> > This is probably not what was intended so remove the address of
> > operator, which matches how skip_scdc_overwrite is handled in the rest of
> the driver.
> >
> > While we're here, drop an extra newline after this if block.
> >
> > Fixes: a760fc1bff03 ("drm/amd/display: add monitor patch to disable
> > SCDC
> > read/write")
> > Link:
> > https://github.com/ClangBuiltLinux/linux/issues/879
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Thank you!
> Reviewed-by: Zhan Liu <zhan.liu@amd.com>

Also applied, thanks!

Zhan

> 
> > ---
> >
> > As an aside, I don't see skip_scdc_overwrite assigned a value
> > anywhere, is this working as intended?
> >
> >  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > index 24d99849be5e..a3bfa05c545e 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > @@ -977,10 +977,9 @@ static bool dc_link_detect_helper(struct dc_link
> > *link,
> >  		if ((prev_sink != NULL) && ((edid_status == EDID_THE_SAME)
> > || (edid_status == EDID_OK)))
> >  			same_edid = is_same_edid(&prev_sink->dc_edid,
> &sink->dc_edid);
> >
> > -		if (&sink->edid_caps.panel_patch.skip_scdc_overwrite)
> > +		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
> >  			link->ctx->dc->debug.hdmi20_disable = true;
> >
> > -
> >  		if (link->connector_signal == SIGNAL_TYPE_DISPLAY_PORT
> &&
> >  			sink_caps.transaction_type ==
> > DDC_TRANSACTION_TYPE_I2C_OVER_AUX) {
> >  			/*
> > --
> > 2.25.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
