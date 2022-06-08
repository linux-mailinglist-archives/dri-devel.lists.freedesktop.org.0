Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB285428F1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 10:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231EB10E299;
	Wed,  8 Jun 2022 08:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2124.outbound.protection.outlook.com [40.107.117.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868D510E299
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 08:09:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRmNjZ98lL+5ESG/TqvzDgJsHa7PduelF3ET+WvUa0eVOj4Gnu/x6YIH1JtoleSYl4WkfE3b7QfTFqKEFCHdL5OFL89toTWS0ETymc7PHRK74gKqe4rjeHXMzWtdBImCqWCz55Tsfw7KtA0y5KXJE3wy78ywe4ujMIamEP8+FQF/01xlFW0LPnCaY16R076tOiDc83FqoRZzg1XWJhnWVnhJczo/SIgXXl3hPXUmJqCDuE3yGiLFACTYIwh21RCTpIJwyFoupIifun3L8DP/gDbrlsjiQsvSd+Y2vl4b+FN4ssFM8YJZPReWSY4OnYNgrKAeJy4f+OgWG+cjCs/B6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+yR5YtygDZBZAHq+EAM0RFpwNwwhH6iEkKA4dNu6CQ=;
 b=lZZ1WHhng+tYiJzFA93gp8ELbAh336vGfuWKmFcL6mbJhwO5ANoJ8n0KzmoBBi6V4JwyBEGlBgrk1EEgOX9g9eujL+jNw8w8zKvtA3I/zAVRceIvDMrVU2kENBd6GqTp7iRuRmbioCd1rRVN5p0hZibO6QwfQeR1wLo8UUMJZXjJtwio1gg8sSH8I17cF41JlcALnX8aw/WHl+Yx4ztptIZ997iAPpCNnpZYMy+pXUISRsjkTnzBorekjRf2wn4K1TxIiR9beuyk6dDgKf+vBvrnGuZyTURCWDEs0/MZZtwx0l7pWbar8S+yCwvX68F6dAOEhEmlgJRwPpX8W/BN/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+yR5YtygDZBZAHq+EAM0RFpwNwwhH6iEkKA4dNu6CQ=;
 b=umTVw+0cI056ZmXWTH3CkfkTJU4TFC7w5iaSr+rnFBnwrgtOxecY7zwDJcFsjSBZaa4IkKBW4VZu0z+xtNSIC0tD26hVznnSefbVUVLm4U2Zb1nwt6fYmhr6iqu6rxsabE8gZ++2W0hAK7/u3RZuhilJvpJMWmxLuvfuikChWWU3tXzY689pRw8/jAtqtO/mdCffc+GaVEWaEq6O5sh2Iyxpz7pxWzVKLfiCfmcB1y7S/A08yHxBPWQMxzw7zJvRWr+lD6RFCJLGhTXWPTamrLtklkJzWAjNiXKWlXG1DnyHUClU94iLd+we+4PQagRcc9H/4d3MH9IUD+kKDVviwg==
Received: from PSAPR06MB4805.apcprd06.prod.outlook.com (2603:1096:301:9a::13)
 by HK0PR06MB3809.apcprd06.prod.outlook.com (2603:1096:203:b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 8 Jun
 2022 08:09:43 +0000
Received: from PSAPR06MB4805.apcprd06.prod.outlook.com
 ([fe80::a05e:baab:fb12:c6fa]) by PSAPR06MB4805.apcprd06.prod.outlook.com
 ([fe80::a05e:baab:fb12:c6fa%6]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 08:09:43 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@redhat.com"
 <airlied@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>, "regressions@leemhuis.info"
 <regressions@leemhuis.info>
Subject: RE: [PATCH] drm/ast: Treat AST2600 like AST2500 in most places
Thread-Topic: [PATCH] drm/ast: Treat AST2600 like AST2500 in most places
Thread-Index: AQHYemaHfJa2yEMfXkmDImVEyBPZjq1E3VTw
Date: Wed, 8 Jun 2022 08:09:43 +0000
Message-ID: <PSAPR06MB4805B23B053F80C0F23A8C6C8CA49@PSAPR06MB4805.apcprd06.prod.outlook.com>
References: <20220607120248.31716-1-tzimmermann@suse.de>
In-Reply-To: <20220607120248.31716-1-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 272b1530-a91b-4e2d-18a2-08da49263e9b
x-ms-traffictypediagnostic: HK0PR06MB3809:EE_
x-microsoft-antispam-prvs: <HK0PR06MB3809AB121EE62737BC4897ED8CA49@HK0PR06MB3809.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gP9sU2CZknCx2FHqLAX3vXw2I/osr1OkeyOJ6CAB8IJmIw3513bpWukSEAn5nbxpiXebggzqE9wUomBECtNFRtr8WRMkZH9uKFsHzkQ8qC2fDn0VB0ZY/VOTqOmse+cVRFjynxpuXFNY/Eal6jGA/eNpH2xadJHbT4zL1awRwmdoA3dUcw1xfivo4i9NuUJQjuwp7VgEhdOrrbLYT/GdYiVj0trayQHDbLKi7Io9bkzCT/lzxTudjL5Ll70PrhZRL+uznbSfI5tYDspIKftaezXbmdWTCUOnAFjsWSxdXjFb9cRDtFcbLcMtA5wSAtwRk3CyjrufAfFFgfPS0ShgyIaaFEBu89VGPdeDbRjJ8Or2OcW+BjGIDRt7EhHg4tOhfcECNkqPJBmcK5mQScEfQuwn+RuqarpuFpvvaO9HAZLZf9rsLXV5my+9rQC4SiqMJDiNVt/RnKpbSmbE2AfHxUsjvH4Xvjiv7GlhjJ3Hf+1yp1AfopsdwB8Zey3AmhqKKcHe9I8g2uuelYurg10MlycuTWSuStzvn4X2gFuhtgKmDKo+Jd7eD87RXmIrodTYa8I5AJesXx7yo5QjQ6bXw1GylRqTyUH0cN/LFg7wZSuQ1qn2+inxB62E5AdPidLrIwyFBNhKrUre/U0xiWYwrnJ4bP+GjlZ7XFDn7WneTiLeB/qJVd3z2mRB9FKMjg/3+I66pqjoLwdmTWYqZ/SEdA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4805.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(110136005)(107886003)(9686003)(26005)(53546011)(7696005)(2906002)(6506007)(5660300002)(54906003)(8936002)(52536014)(33656002)(38100700002)(316002)(166002)(508600001)(55016003)(38070700005)(122000001)(186003)(86362001)(66476007)(66446008)(76116006)(66556008)(8676002)(71200400001)(64756008)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6uA7F0k/ay3uoq1ClGokj+xUy+qitE5LiiMVoFysL/x/lLHd2e0OnlHzeQUq?=
 =?us-ascii?Q?1XuS18INu02L0V6645M0VKOXcligZZHWT9Q7FIdLfwOkNU2EcQMsm/LXQ58Z?=
 =?us-ascii?Q?qspBZxuy0FYZ2uUZsXadi/XFs7tGtBpKEkOYNY+31snDZme/fbp9w/We+cxg?=
 =?us-ascii?Q?sBdC6xt7//u4CvnTGRx4pj5hlUayrqyv5Ko0aZh9CbOZD5k5jq129EtRvM4J?=
 =?us-ascii?Q?AmpYamocbGlP52b0gPUi7hDnwOBMM26d+j0cbxfohG6yklrZQGrvy1XJ7Mrx?=
 =?us-ascii?Q?h2IB3IM+SCoVbx40vbcGT9hYFiQdFIfp7eUX48gbacsrBpbZgrvokVT/cvTr?=
 =?us-ascii?Q?uRjxl+icdwHTD6K+UF48Px+HN9rDhB1VbSaGdL3JAlU4rO33SaVlKkptwac/?=
 =?us-ascii?Q?5dG65L/qpevD1GHuGsqdnCk3z9l10K04YA2+fZhbiD1z8QZIgnsRK/1FEdYr?=
 =?us-ascii?Q?mmfMIo4ooQM0h/PajUS0yN5tcLPxZ0XjiA2vPHgcT9H8j1nadeantCLUaHV7?=
 =?us-ascii?Q?gVTDvDXMbTnJQ7r5fcTEQpt1sk0FhI3TCRL8e85DElKUmY27UL4tGiuCbRoj?=
 =?us-ascii?Q?xp9P81ozufmv0DHo0s9P5qGS3TaVOJ8lZdfzZL3k3V/KnDYJ1mPo1/z9cuej?=
 =?us-ascii?Q?7tkSZu0WMynB5bj7u/HeX1tKHgYvw9IOF+ExPTFSpZktaTgVW8ASI4wsyUOK?=
 =?us-ascii?Q?EOKI+jET3mla8i+803OEqV9+hr2MfXMCkt8IZ7rhyWGADgy8nHv0ZGsEUS2M?=
 =?us-ascii?Q?8+ROSFBAizBAtDHUX6pjAZpo7/cWPWATSmFlPRjgAI4TpbOZB0ylpXzaYEU1?=
 =?us-ascii?Q?d5Tz4oGuS7FFcJL9BbZKN5FIaGNhHlGZ+WNATxzVK6nBFHjiOuzvQ7ZdKClm?=
 =?us-ascii?Q?1zmQSQFZJaT2sZn2OCt/pMKEadciJjHqfrWMEFZGyjJWwPlHeOe7EWycoUaM?=
 =?us-ascii?Q?fhAUbkre/3z/F5tLYFtUQ0ba4B/oaVXsMMwnjqEgxOEfXAiDbrGrUjJmjnnc?=
 =?us-ascii?Q?JIYPyRACl+ZIJaHXOopBMxNIphIUDsYYG/6dPqLFH2NmnAbmBT6h1z4HWUYV?=
 =?us-ascii?Q?BfdnL2aPDxzH0l8uAdkmmhtdjV0ADK0ExiWopEjL3usOT68fkHSt4XJsarmP?=
 =?us-ascii?Q?TBh4sLjwAQAbkZzWILH4xI091UYpTiJhl+XS3yCwdLt4/Q/YctmoelVxWGCu?=
 =?us-ascii?Q?8Puy+rrvWudfYPlwEBvPd4R0EmQV2WGyhCaMH1npw156bDVaiWV34e2/Ztwb?=
 =?us-ascii?Q?tlAG3dyEgCe9gbKULCBSywcpwD7+BE5UJNN8f4PdmN/FnPl/hD8KwXg+PuxD?=
 =?us-ascii?Q?81UZwiLx7955QICy6JXd8jNwSRGsTilxvEUJ4D/nyc6eC8XsmeFkifjBGu90?=
 =?us-ascii?Q?vrcDpEIfqukJrd3DPp8ngYF2eGEfjxyk9fAaaVKQ6T91giJ+aVC5bmalFzII?=
 =?us-ascii?Q?jd+ZmaOqUBFr0gqdukcugbZDKKduuU6XVrJbIsTsirZ3uaW38JbbIjvK/moh?=
 =?us-ascii?Q?ANCMxU6F2TfXWsok4oOpbJoXArVikh2zRHkhkjogQfa7bMXKZL3nN8YlfRf5?=
 =?us-ascii?Q?qtNx1Ls5vvw0YHL02YyOFcNZxBA9wMkKBuCuthfKPyboG2dV8kmD0X8+RuWX?=
 =?us-ascii?Q?5Te5Tdj6f5Nj1C/LeEKT5690iyVwwlH/v814SjgSNnNovP+sy95wTKFrosSo?=
 =?us-ascii?Q?NnM/DflwybKo6hcErzSTltm0ztIKfvtD07tPrftduO/D2//87hPsGmZjCjZk?=
 =?us-ascii?Q?xD+CRdbW24CPvPtU91fMT6cRcgulb8g=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PSAPR06MB4805B23B053F80C0F23A8C6C8CA49PSAPR06MB4805apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4805.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272b1530-a91b-4e2d-18a2-08da49263e9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 08:09:43.4127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IHCADv34Kgm8MnRFGkEifNklNKPJxdh3vxvy5nYuu/W43qjlGpoPMDq8lOXcmMlEGjzcTaMZTgRJcPQTtQEJEdKo8tLD19Hebkqq7yTLXjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3809
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
Cc: Charles Kuan <charles_kuan@aspeedtech.com>,
 Hungju Huang <hungju_huang@aspeedtech.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Luke Chen <luke_chen@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_PSAPR06MB4805B23B053F80C0F23A8C6C8CA49PSAPR06MB4805apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Thomas



Thanks for your suggestions!

I answer each revision inline that followed by [KH]:.



Regards,

        Kuo-Hsiang Chou



-----Original Message-----

From: Thomas Zimmermann [mailto:tzimmermann@suse.de]

Sent: Tuesday, June 07, 2022 8:03 PM

To: airlied@redhat.com; airlied@linux.ie; daniel@ffwll.ch; jfalempe@redhat.=
com; regressions@leemhuis.info; Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.=
com>

Subject: [PATCH] drm/ast: Treat AST2600 like AST2500 in most places



Include AST2600 in most of the branches for AST2500. Thereby revert most ef=
fects of commit f9bd00e0ea9d ("drm/ast: Create chip AST2600").



The AST2600 used to be treated like an AST2500, which at least gave usable =
display output. After introducing AST2600 in the driver without further upd=
ates, lots of functions take the wrong branches.



Handling AST2600 in the AST2500 branches reverts back to the original setti=
ngs. The exception are cases where AST2600 meanwhile got its own branch.



[KH]: Based on CVE_2019_6260 item3, P2A is disallowed anymore.

P2A (PCIe to AMBA) is a bridge that is able to revise any BMC registers.

Yes, P2A is dangerous on security issue, because Host open a backdoor and s=
omeone malicious SW/APP will be easy to take control of BMC.

Therefore, P2A is disabled forever.



Now, return to this patch, there is no need to add AST2600 condition on the=
 P2A flow.



Reported-by: Jocelyn Falempe <jfalempe@redhat.com>

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>

Fixes: f9bd00e0ea9d ("drm/ast: Create chip AST2600")

Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>

Cc: Dave Airlie <airlied@redhat.com>

Cc: dri-devel@lists.freedesktop.org

Cc: <stable@vger.kernel.org> # v5.11+

---

drivers/gpu/drm/ast/ast_main.c | 4 ++--  drivers/gpu/drm/ast/ast_mode.c | 6=
 +++---  drivers/gpu/drm/ast/ast_post.c | 6 +++---

3 files changed, 8 insertions(+), 8 deletions(-)



diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.=
c index d770d5a23c1a..56b2ac138375 100644

--- a/drivers/gpu/drm/ast/ast_main.c

+++ b/drivers/gpu/drm/ast/ast_main.c

@@ -307,7 +307,7 @@ static int ast_get_dram_info(struct drm_device *dev)

      default:

              ast->dram_bus_width =3D 16;

              ast->dram_type =3D AST_DRAM_1Gx16;

-               if (ast->chip =3D=3D AST2500)

+              if ((ast->chip =3D=3D AST2500) || (ast->chip =3D=3D AST2600)=
)

                      ast->mclk =3D 800;

              else

                      ast->mclk =3D 396;

@@ -319,7 +319,7 @@ static int ast_get_dram_info(struct drm_device *dev)

      else

              ast->dram_bus_width =3D 32;

-       if (ast->chip =3D=3D AST2500) {

+      if ((ast->chip =3D=3D AST2600) || (ast->chip =3D=3D AST2500)) {

              switch (mcr_cfg & 0x03) {

              case 0:

                      ast->dram_type =3D AST_DRAM_1Gx16;

[KH]: P2A is disabled, there is no need to take care of BMC DRAM setting.



diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.=
c index 323af2746aa9..1dde30b98317 100644

--- a/drivers/gpu/drm/ast/ast_mode.c

+++ b/drivers/gpu/drm/ast/ast_mode.c

@@ -310,7 +310,7 @@ static void ast_set_crtc_reg(struct ast_private *ast,

      u8 jreg05 =3D 0, jreg07 =3D 0, jreg09 =3D 0, jregAC =3D 0, jregAD =3D=
 0, jregAE =3D 0;

      u16 temp, precache =3D 0;

-       if ((ast->chip =3D=3D AST2500) &&

+      if (((ast->chip =3D=3D AST2600) || (ast->chip =3D=3D AST2500)) &&

          (vbios_mode->enh_table->flags & AST2500PreCatchCRT))

              precache =3D 40;

[KH]: after checking on register value, AST2600 doesn't run this.



@@ -428,7 +428,7 @@ static void ast_set_dclk_reg(struct ast_private *ast,  =
{

      const struct ast_vbios_dclk_info *clk_info;

-       if (ast->chip =3D=3D AST2500)

+      if ((ast->chip =3D=3D AST2600) || (ast->chip =3D=3D AST2500))

              clk_info =3D &dclk_table_ast2500[vbios_mode->enh_table->dclk_=
index];

      else

              clk_info =3D &dclk_table[vbios_mode->enh_table->dclk_index];

[KH]: after checking on register value, AST2600 doesn't run this.

        The difference between 2 table of " dclk_table_ast2500" and " dclk_=
table" are the setting of Reduce Blanking.



@@ -476,7 +476,7 @@ static void ast_set_crtthd_reg(struct ast_private *ast)

              ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa7, 0xe0);

              ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa6, 0xa0);

      } else if (ast->chip =3D=3D AST2300 || ast->chip =3D=3D AST2400 ||

-           ast->chip =3D=3D AST2500) {

+                 ast->chip =3D=3D AST2500 || ast->chip =3D=3D AST2600) {

              ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa7, 0x78);

              ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa6, 0x60);

      } else if (ast->chip =3D=3D AST2100 ||

[KH]: Yes, the patch is "drm/ast: Create threshold values for AST2600" that=
 is the root cause of whites lines on AST2600
commit
bcc77411e8a65929655cef7b63a36000724cdc4b<https://cgit.freedesktop.org/drm/d=
rm/commit/?id=3Dbcc77411e8a65929655cef7b63a36000724cdc4b> (patch<https://cg=
it.freedesktop.org/drm/drm/patch/?id=3Dbcc77411e8a65929655cef7b63a36000724c=
dc4b>)





diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.=
c index 0aa9cf0fb5c3..eb1ff9084034 100644

--- a/drivers/gpu/drm/ast/ast_post.c

+++ b/drivers/gpu/drm/ast/ast_post.c

@@ -80,7 +80,7 @@ ast_set_def_ext_reg(struct drm_device *dev)

              ast_set_index_reg(ast, AST_IO_CRTC_PORT, i, 0x00);

       if (ast->chip =3D=3D AST2300 || ast->chip =3D=3D AST2400 ||

-           ast->chip =3D=3D AST2500) {

+          ast->chip =3D=3D AST2500 || ast->chip =3D=3D AST2600) {

              if (pdev->revision >=3D 0x20)

                      ext_reg_info =3D extreginfo_ast2300;

              else

[KH]: after checking on register value, AST2600 doesn't run this.



@@ -105,7 +105,7 @@ ast_set_def_ext_reg(struct drm_device *dev)

      /* Enable RAMDAC for A1 */

      reg =3D 0x04;

      if (ast->chip =3D=3D AST2300 || ast->chip =3D=3D AST2400 ||

-           ast->chip =3D=3D AST2500)

+          ast->chip =3D=3D AST2500 || ast->chip =3D=3D AST2600)

              reg |=3D 0x20;

      ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xff, reg);  }

[KH]: Yes, it should be a patch, because the value is set by GOP/VBIOS duri=
ng booting.

ALTHOUGH, after checking on register value, AST2600 doesn't run this.



@@ -382,7 +382,7 @@ void ast_post_gpu(struct drm_device *dev)

      if (ast->chip =3D=3D AST2600) {

              ast_dp_launch(dev, 1);

      } else if (ast->config_mode =3D=3D ast_use_p2a) {

-               if (ast->chip =3D=3D AST2500)

+              if (ast->chip =3D=3D AST2500 || ast->chip =3D=3D AST2600)

                      ast_post_chip_2500(dev);

              else if (ast->chip =3D=3D AST2300 || ast->chip =3D=3D AST2400=
)

                      ast_post_chip_2300(dev);

[KH]: NO, AST2600 has its flow that is ast_dp_lauch()

        And "ast_use_p2a" means using P2A bridge that is no longer allowed.





Again, Thanks all who works on drm/ast. Thank you!

Regards,

        Kuo-Hsiang Chou



--

2.36.1



--_000_PSAPR06MB4805B23B053F80C0F23A8C6C8CA49PSAPR06MB4805apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"\7D14\6587\5B57 \5B57\5143";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.a
	{mso-style-name:"\7D14\6587\5B57 \5B57\5143";
	mso-style-priority:99;
	mso-style-link:\7D14\6587\5B57;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi Thomas <o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Thanks for your suggestions!=
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I answer each revision inlin=
e that followed by [KH]:.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Regards,<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; Kuo-Hsiang Chou<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-----Original Message-----<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">From: Thomas Zimmermann [mai=
lto:tzimmermann@suse.de]
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Sent: Tuesday, June 07, 2022=
 8:03 PM<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">To: airlied@redhat.com; airl=
ied@linux.ie; daniel@ffwll.ch; jfalempe@redhat.com; regressions@leemhuis.in=
fo; Kuo-Hsiang Chou &lt;kuohsiang_chou@aspeedtech.com&gt;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Subject: [PATCH] drm/ast: Tr=
eat AST2600 like AST2500 in most places<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Include AST2600 in most of t=
he branches for AST2500. Thereby revert most effects of commit f9bd00e0ea9d=
 (&quot;drm/ast: Create chip AST2600&quot;).<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">The AST2600 used to be treat=
ed like an AST2500, which at least gave usable display output. After introd=
ucing AST2600 in the driver without further updates, lots of functions take=
 the wrong branches.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Handling AST2600 in the AST2=
500 branches reverts back to the original settings. The exception are cases=
 where AST2600 meanwhile got its own branch.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[KH]: Based on CVE_2019_6260=
 item3, P2A is disallowed anymore.
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">P2A (PCIe to AMBA) is a brid=
ge that is able to revise any BMC registers.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Yes, P2A is dangerous on sec=
urity issue, because Host open a backdoor and someone malicious SW/APP will=
 be easy to take control of BMC.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Therefore, P2A is disabled f=
orever.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Now, return to this patch, t=
here is no need to add AST2600 condition on the P2A flow.<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Reported-by: Jocelyn Falempe=
 &lt;jfalempe@redhat.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Signed-off-by: Thomas Zimmer=
mann &lt;tzimmermann@suse.de&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Suggested-by: Jocelyn Falemp=
e &lt;jfalempe@redhat.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Fixes: f9bd00e0ea9d (&quot;d=
rm/ast: Create chip AST2600&quot;)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Cc: KuoHsiang Chou &lt;kuohs=
iang_chou@aspeedtech.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Cc: Dave Airlie &lt;airlied@=
redhat.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Cc: dri-devel@lists.freedesk=
top.org<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Cc: &lt;stable@vger.kernel.o=
rg&gt; # v5.11+<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">---<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">drivers/gpu/drm/ast/ast_main=
.c | 4 ++--&nbsp; drivers/gpu/drm/ast/ast_mode.c | 6 +++---&nbsp; drivers/g=
pu/drm/ast/ast_post.c | 6 +++---<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">3 files changed, 8 insertion=
s(+), 8 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">diff --git a/drivers/gpu/drm=
/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c index d770d5a23c1a..56b2ac=
138375 100644<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">--- a/drivers/gpu/drm/ast/as=
t_main.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">+++ b/drivers/gpu/drm/ast/as=
t_main.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -307,7 +307,7 @@ static i=
nt ast_get_dram_info(struct drm_device *dev)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; default:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast-&gt;dram_bus_width =
=3D 16;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast-&gt;dram_type =3D AS=
T_DRAM_1Gx16;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ast-&gt;chip =
=3D=3D AST2500)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((ast-&gt;chip =3D=
=3D AST2500) || (ast-&gt;chip =3D=3D AST2600))<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ast-&gt;mclk =3D 800;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ast-&gt;mclk =3D 396;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -319,7 +319,7 @@ static i=
nt ast_get_dram_info(struct drm_device *dev)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; else<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast-&gt;dram_bus_width =
=3D 32;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if (ast-&gt;chip =3D=3D AST2500) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if ((ast-&gt;chip =3D=3D AST2600) || (ast-&gt;chip =3D=3D AST2500)) {<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (mcr_cfg &amp; 0x=
03) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0:<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ast-&gt;dram_type =3D AST_DRAM_1Gx16;<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[KH]: P2A is disabled, there=
 is no need to take care of BMC DRAM setting.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">diff --git a/drivers/gpu/drm=
/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c index 323af2746aa9..1dde30=
b98317 100644<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">--- a/drivers/gpu/drm/ast/as=
t_mode.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">+++ b/drivers/gpu/drm/ast/as=
t_mode.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -310,7 +310,7 @@ static v=
oid ast_set_crtc_reg(struct ast_private *ast,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; u8 jreg05 =3D 0, jreg07 =3D 0, jreg09 =3D 0, jregAC =3D 0, jregAD =3D 0,=
 jregAE =3D 0;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; u16 temp, precache =3D 0;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if ((ast-&gt;chip =3D=3D AST2500) &amp;&amp;<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (((ast-&gt;chip =3D=3D AST2600) || (ast-&gt;chip =3D=3D AST2500)) &a=
mp;&amp;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp;&nbsp;(vbios_mode-&gt;enh_table-&gt;flags &amp; AST250=
0PreCatchCRT))<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; precache =3D 40;<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[KH]: after checking on regi=
ster value, AST2600 doesn't run this.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -428,7 +428,7 @@ static v=
oid ast_set_dclk_reg(struct ast_private *ast,&nbsp; {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; const struct ast_vbios_dclk_info *clk_info;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if (ast-&gt;chip =3D=3D AST2500)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if ((ast-&gt;chip =3D=3D AST2600) || (ast-&gt;chip =3D=3D AST2500))<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clk_info =3D &amp;dclk_t=
able_ast2500[vbios_mode-&gt;enh_table-&gt;dclk_index];<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; else<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clk_info =3D &amp;dclk_t=
able[vbios_mode-&gt;enh_table-&gt;dclk_index];<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[KH]: after checking on regi=
ster value, AST2600 doesn't run this.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; The difference between 2 table of &quot; dclk_table_ast2500&=
quot; and &quot; dclk_table&quot; are the setting of Reduce Blanking.<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -476,7 +476,7 @@ static v=
oid ast_set_crtthd_reg(struct ast_private *ast)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast_set_index_reg(ast, A=
ST_IO_CRTC_PORT, 0xa7, 0xe0);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast_set_index_reg(ast, A=
ST_IO_CRTC_PORT, 0xa6, 0xa0);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; } else if (ast-&gt;chip =3D=3D AST2300 || ast-&gt;chip =3D=3D AST2400 ||=
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; ast-&gt;chip =3D=3D AST2500) {<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; ast-&gt;ch=
ip =3D=3D AST2500 || ast-&gt;chip =3D=3D AST2600) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast_set_index_reg(ast, A=
ST_IO_CRTC_PORT, 0xa7, 0x78);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast_set_index_reg(ast, A=
ST_IO_CRTC_PORT, 0xa6, 0x60);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; } else if (ast-&gt;chip =3D=3D AST2100 ||<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[KH]: Yes, the patch is &quo=
t;drm/ast: Create threshold values for AST2600&quot; that is the
<span style=3D"background:yellow;mso-highlight:yellow">root cause of whites=
 lines on AST2600</span><o:p></o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" summary=3D"commit info" style=3D"background:white;border-collapse:co=
llapse">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:1.2pt 12.0pt 1.2pt 1.2pt">
<p class=3D"MsoNormal" style=3D"margin-top:18.0pt"><span lang=3D"EN-US" sty=
le=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#3333=
33">commit<o:p></o:p></span></p>
</td>
<td style=3D"padding:1.2pt 12.0pt 1.2pt 1.2pt">
<p class=3D"MsoNormal" style=3D"margin-top:18.0pt"><span lang=3D"EN-US" sty=
le=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333"><a=
 href=3D"https://cgit.freedesktop.org/drm/drm/commit/?id=3Dbcc77411e8a65929=
655cef7b63a36000724cdc4b"><span style=3D"text-decoration:none">bcc77411e8a6=
5929655cef7b63a36000724cdc4b</span></a>&nbsp;(<a href=3D"https://cgit.freed=
esktop.org/drm/drm/patch/?id=3Dbcc77411e8a65929655cef7b63a36000724cdc4b"><s=
pan style=3D"text-decoration:none">patch</span></a>)<o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoPlainText" style=3D"text-indent:6.0pt"><span lang=3D"EN-US">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">diff --git a/drivers/gpu/drm=
/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c index 0aa9cf0fb5c3..eb1ff9=
084034 100644<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">--- a/drivers/gpu/drm/ast/as=
t_post.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">+++ b/drivers/gpu/drm/ast/as=
t_post.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -80,7 +80,7 @@ ast_set_de=
f_ext_reg(struct drm_device *dev)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast_set_index_reg(ast, A=
ST_IO_CRTC_PORT, i, 0x00);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; if (ast-&gt;chip =3D=3D AST2300 || ast-&gt;chip =3D=3D AST2400 ||<=
o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; ast-&gt;chip =3D=3D AST2500) {<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; ast-&gt;chip =3D=3D AST2500 || ast-&gt;chip =3D=3D A=
ST2600) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pdev-&gt;revision &g=
t;=3D 0x20)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ext_reg_info =3D extreginfo_ast2300;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[KH]: after checking on regi=
ster value, AST2600 doesn't run this.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -105,7 +105,7 @@ ast_set_=
def_ext_reg(struct drm_device *dev)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; /* Enable RAMDAC for A1 */<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; reg =3D 0x04;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; if (ast-&gt;chip =3D=3D AST2300 || ast-&gt;chip =3D=3D AST2400 ||<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; ast-&gt;chip =3D=3D AST2500)<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; ast-&gt;chip =3D=3D AST2500 || ast-&gt;chip =3D=3D A=
ST2600)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg |=3D 0x20;<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xff, reg);&nbsp; }<=
o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[KH]: Yes, it should be a pa=
tch, because the value is set by GOP/VBIOS during booting.<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText" style=3D"text-indent:24.0pt"><span lang=3D"EN-US"=
>ALTHOUGH, after checking on register value, AST2600 doesn't run this.<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -382,7 +382,7 @@ void ast=
_post_gpu(struct drm_device *dev)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; if (ast-&gt;chip =3D=3D AST2600) {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ast_dp_launch(dev, 1);<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; } else if (ast-&gt;config_mode =3D=3D ast_use_p2a) {<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ast-&gt;chip =
=3D=3D AST2500)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ast-&gt;chip =3D=3D=
 AST2500 || ast-&gt;chip =3D=3D AST2600)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ast_post_chip_2500(dev);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (ast-&gt;chip =
=3D=3D AST2300 || ast-&gt;chip =3D=3D AST2400)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ast_post_chip_2300(dev);<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[KH]: NO, AST2600 has its fl=
ow that is ast_dp_lauch()<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; And </span><span lang=3D"EN-US" style=3D"font-family:&quot;C=
ourier New&quot;">&#8220;</span><span lang=3D"EN-US">ast_use_p2a</span><spa=
n lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">&#8221;</spa=
n><span lang=3D"EN-US"> means using P2A
 bridge that is no longer allowed. <o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Again, Thanks all who works =
on drm/ast. Thank you!<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Regards,<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; Kuo-Hsiang Chou<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">--<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">2.36.1<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_PSAPR06MB4805B23B053F80C0F23A8C6C8CA49PSAPR06MB4805apcp_--
