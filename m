Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235C02A237C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 04:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9E66E29D;
	Mon,  2 Nov 2020 03:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310123.outbound.protection.outlook.com [40.107.131.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DA36E29D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 03:36:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNMr+fhKQA3RXv8OxgP9Ya1TcUj7b/I2CNeXKg+p6t1exC4HyDVk6Fb7GF/AX53w3Ts/hmX0VZPW4mfVnB3bI0Tp/cCFGSR8WEIrFSTrE/hzKqS1Zlylw8I0hcG1ilu3WxPY5xtxuCMPmSvzAcPtcCQ60nI0cHKB8gM3Un2gsKyncDsmCynmu8sj6LLCHOtqUp8L6v9dqhjuYa3R8/c0j7OS+D1oLOMcDpkSmnbcH8D9almN/OIIU7dAJEl7z/FrwKUGxaT+Yr3JBEXDlDnPI8O/ZnAfEsUam5qxqFC+iaYpIYefL9WQrMCwpEFct/sI5HtSQq2V2KZ4pjVMbr0Vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF1PD97f2204AXUE9+F+YZaDUvSHL5Lk27TtwmPpew8=;
 b=d1fQrMyOKWSKWOgAIKJlOGGVqAhPzloPjD8UKv8IfJV9hOyIfagA5MsgKzD1n8ObZfd3JKju6CNKB78qcsnzcjFA+nIOmA9y7wjT3B8G3/T9hgcJtf0y3avUAqBNudZ7yhtXa3hHGEXaasMW2Ehuyzp337u35uKiGegE4NmyuVw1/XfQIYC2Ue/AktmfKzy2JEcF6+JXhXtAaAW4zJklwrlhleSEJ46FfUcsoz/YEpb4LyXoNK0vib2JeY8ClHySSomnJ8+bVgC0bg35KQ3zSN8sHPV5JQhZmw0gtzr90mTELMHlHvaCdjv1O9RPtffdPpNYURkKgfljqD66bRDjMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK0PR06MB2228.apcprd06.prod.outlook.com (2603:1096:203:4c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 03:36:36 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::9cad:b9a:3e32:d1f1]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::9cad:b9a:3e32:d1f1%5]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 03:36:36 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: RE: [PATCH] drm/ast: Support 1600x900 with 108MHz PCLK
Thread-Topic: [PATCH] drm/ast: Support 1600x900 with 108MHz PCLK
Thread-Index: AQHWrpA6yNnPEioaU0WRvjwcdGRPAqmzAwSAgAExPDA=
Date: Mon, 2 Nov 2020 03:36:36 +0000
Message-ID: <HK2PR06MB33006CA537426211FC853EE48C100@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <20201030074212.22401-1-kuohsiang_chou@aspeedtech.com>
 <20201101091917.GA1166694@ravnborg.org>
In-Reply-To: <20201101091917.GA1166694@ravnborg.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afb45876-91b5-4f4f-d90e-08d87ee0803e
x-ms-traffictypediagnostic: HK0PR06MB2228:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2228872951E07DEED7EA16188C100@HK0PR06MB2228.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9c8fEc06dIcZZfVEOHcSy9+H2CdvKwlPg2YQ9O+nuDZlrEI8XNY5ItLW4LVD+K5slBRSpt/UCI4t5c0rkvVaYyNSGh8E0sPLPIS7sv/c8Q7vV+mb3VleJh1zPp2RFqMkFkTtPLSI8fv8o0W4BEpokTnDBvB8yrLxLu+B59vhQdAqx15LGlP+qPB4Zt9K1P/hKTyHFfKmjtaSW2I9LhLklUA8HfPOPJETiGV+QIWGyFUH8dcPdlkn7odeKXNtbM4eeKKn8uaZkkNEEu1JgN/OiIpPOlPeJvCaHYgqiItZdPTSWdyg9Gvktnq50bBeCRd8tRdyaPzg3KM6mnUX5G8dULCDbs3dWtqSEYsShPQfagU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(396003)(366004)(39840400004)(71200400001)(83380400001)(33656002)(186003)(53546011)(26005)(6506007)(55236004)(8676002)(5660300002)(7696005)(4326008)(86362001)(8936002)(107886003)(54906003)(110136005)(66476007)(966005)(66946007)(9686003)(2906002)(316002)(66446008)(64756008)(66556008)(76116006)(55016002)(478600001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: F1ncBWPlo9iNK3E9lIQLx8Ta+V7Ryq0mhPD2s9bg/dtlAS8x5gTf1qrxb64uVUqshVsi9NXHD7OHCXBGkAG6Hib1xALroOfFJHaG6SlQoJVgrrwkb9arPgsVezm0vLIdk93hUMC8coeRrC+JmSY9s+NMyizo4LRzUi3hPtSXQdioJcwsTeqCsNTOCJ9JiQHmqOdYdNnlpRqoxIbl3aTGHhDXYxIoTFnbFDChQYKaF6QlZiwIrNt2hYon30IHgCJR0YVAwvO08a0H3zjpA2hOCwSfwDhaKaAf5SFmrekbLsM5DuPSlgCT48acECnDTPm78pDHkq4ovWEJ7zYU2GkHpY3pyr58iaX7grCYl7duzeQcYAp1GoS6vYdRVtNXnQCY4tivc2/SVCdyAfuRbMfFhIr+6tcen10IlawpYktEeJ1Fmtx1ZIf9F9E0uY6sHonn5HorRvUQfyjIxAgNNIlhsrDE9rRYZjpBaJ9AN9dCa/ogYMh3etbfihEnwvv3lxnQqyolRjdSoIfsTez8SpGgFR5WIOaJLuJyJX1ArVBuM+COuEygMDZsWWRyCbtux2HZJVOXPqX4nQbN74iAxq1rlDnO1rJgeYF7H4owwvBW+KTnKPZit6q5a1uKXPsUYB4XrjrqSNpn9WABbwZqUb5dAA==
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb45876-91b5-4f4f-d90e-08d87ee0803e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 03:36:36.0712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qfwdOg5NWTuXEBXQSPNt5d4qOGkYcZHOLEkA+s3887ZNhx8XGdKA4XtJXIJB3rPsn3FGQs1KFzW67UnL5SK8U6GxvvZewFjcHWhKsDomBxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2228
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
Cc: "eich@suse.com" <eich@suse.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tommy Huang <tommy_huang@aspeedtech.com>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>, Arc Sung <arc_sung@aspeedtech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Sam

Thanks for your teaching and the information got from v5.10-rc2 likes as

DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
M:	Dave Airlie <airlied@redhat.com>
R:	Thomas Zimmermann <tzimmermann@suse.de>
L:	dri-devel@lists.freedesktop.org
S:	Supported
T:	git git://anongit.freedesktop.org/drm/drm-misc
F:	drivers/gpu/drm/ast/

Regards,
	Kuo-Hsiang Chou

-----Original Message-----
From: Sam Ravnborg [mailto:sam@ravnborg.org] 
Sent: Sunday, November 01, 2020 5:19 PM
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>; Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org; eich@suse.com; Tommy Huang <tommy_huang@aspeedtech.com>; Jenmin Yuan <jenmin_yuan@aspeedtech.com>; airlied@redhat.com; Arc Sung <arc_sung@aspeedtech.com>
Subject: Re: [PATCH] drm/ast: Support 1600x900 with 108MHz PCLK

Hi KuoHsiang

On Fri, Oct 30, 2020 at 03:42:12PM +0800, KuoHsiang Chou wrote:
> [New] Create the setting for 1600x900 @60Hz refresh rate
>       by 108MHz pixel-clock.
> 
> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>

Thomas Zimmermann <tzimmermann@suse.de> is listed as reviewer in MAINTAINERS, so included him in the list of receiver.
get_maintainer.pl should have told you that.

	Sam

> ---
>  drivers/gpu/drm/ast/ast_tables.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_tables.h 
> b/drivers/gpu/drm/ast/ast_tables.h
> index d665dd5af5dd..8414e543f260 100644
> --- a/drivers/gpu/drm/ast/ast_tables.h
> +++ b/drivers/gpu/drm/ast/ast_tables.h
> @@ -282,6 +282,8 @@ static const struct ast_vbios_enhtable 
> res_1360x768[] = {  };
> 
>  static const struct ast_vbios_enhtable res_1600x900[] = {
> +	{1800, 1600, 24, 80,1000,  900, 1, 3, VCLK108,		/* 60Hz */
> +	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | 
> +NewModeInfo), 60, 3, 0x3A },
>  	{1760, 1600, 48, 32, 926, 900, 3, 5, VCLK97_75,		/* 60Hz CVT RB */
>  	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
>  	  AST2500PreCatchCRT), 60, 1, 0x3A },
> --
> 2.18.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
