Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105172BA14F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 04:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3556E85B;
	Fri, 20 Nov 2020 03:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30057.outbound.protection.outlook.com [40.107.3.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FC46E85B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 03:42:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlBuv7RxIkJu2KtD8BzcN6ZlDLLHpQ9vqzS8b9woUvd3cvKOyOujkx0i2HFXa76F0TJqaZ74Nd8slDuyg4ddNs+G777XLEQFOczn6ta10e0IIhm+YrCj1jZu6xip2dVG23FDmmPn+h0RmTx+cijST3GIc88IQYRI8MeRc7W/tmkjoUmkZNHdL9tpshz8lKEKdUr0ep5pEOPH+CJZ/gtUOLb6zDelInf/g0SE4SFn9EMAQ7yooEH9mpSglwsDxP5I4188B2vF9AMb8rUHz2NVW+yL3KBQh++T4OMnGILoV13LYwOqGPo60t3VjyI1pBobXhB79qkpweCjD1m2Sl9JNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa3AJ6sB8l1jyiRSWwHJ8TG0ajsRYt0TdQX1CkuKw2k=;
 b=g9+wkhwvLiwoRLMAxS9hJ3Kg6kZ7JfYPmeCfI0D4HaXuAuO9eSxjOT7ebq9FtAOFA79K3slrfAPaX9ic7vR6E2BfGXl1qW94v4Ig5LpFm5AUrByQT53fsw+PboBd/RoUTs8uRqXRFHrtpc0OXzLWJv5ZKkIrBas2O+WXhwh+zhhjzuNhlZ3CnDl1YtVAAC80xWzv/ZS309xjbINi1V7wvoXu+6SPqdZf/KnBX1aEBQnWZjrV0lFN0cSabohhoRMNRPdSaNRjmM4HZzXoqQn+UxhtRgRXPVNRHhhTx0GMWjDiHuogSKdEUbSDI+DOdxeaksKG81ZaJNm/kkKYbJ6gPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa3AJ6sB8l1jyiRSWwHJ8TG0ajsRYt0TdQX1CkuKw2k=;
 b=TZ8tQoMP2jaAiGmhlPGP5nef7fhDJ0gTc/++NtBqzMAjD+2eA9FN1vT/lYRS0WArH+eUvpDPNN0gJWDHFX8jCLvxoKDBC9Qrr8jU0U70W8HprNdCYCgP4FqQ93YYIHGT9U8ypnfP6mMXXxI5+rYPbFVUXVy1fEZ9yxgzfwsHGL0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4717.eurprd04.prod.outlook.com (2603:10a6:803:5c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 03:42:45 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 03:42:45 +0000
Message-ID: <29bfc28e7116cb4eadca861e1cb43451a4f2ae70.camel@nxp.com>
Subject: Re: [PATCH 1/8] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
From: Liu Ying <victor.liu@nxp.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 20 Nov 2020 11:40:52 +0800
In-Reply-To: <20201119154659.GA3306242@bogus>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
 <1605777745-23625-2-git-send-email-victor.liu@nxp.com>
 <20201119154659.GA3306242@bogus>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR01CA0173.apcprd01.prod.exchangelabs.com (2603:1096:4:28::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 03:42:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cd8ee6b5-eabc-4d5a-8d13-08d88d0657b4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4717DB6D36571156E4603A1A98FF0@VI1PR04MB4717.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FRz0cBz8RaQlRoDTvWvIx9+FI9HE/Qc0xMT8lrT3QqLnAd0sQia2NQIXzzkG1+0Cpy5ty1Zt36ZVVeV+0oj9AB7X9ivrSwrcCBHyrklAmlaVDzYnUIyByb5VbwPKpCUGiNSlcpuKnFS9Aapgbbuuin/3APi7bR4VbDbyJGwUjKSLV/Jppz0XYcfRCGbP1L8GQt+7S4Lex3CSotyVd9bYA+gxw9bwiCePlW71/bDsartWWaflEi1t7psHjgxG1c6HBfrwOYVMpSMOiXX7/CrtHlttJ6NNdCEJ1kwBxIKB6JueBi6y8AItNsBkLQDITrIl33PqXL7ulLVzCKxPKV5sJJPUmdcfyuop64qbRy0O7bSZPJ+6+SIVw56IBVjnPxz9OONd26xd9eH+nsCjnQwg9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(83380400001)(316002)(45080400002)(186003)(2616005)(6512007)(26005)(16526019)(478600001)(6486002)(956004)(966005)(66476007)(5660300002)(4001150100001)(7416002)(66946007)(66556008)(6916009)(8936002)(4326008)(8676002)(86362001)(36756003)(52116002)(2906002)(6506007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: KSCO7DeHRl904fvIIGdtnMY6TJqqZvhXa1n47DZVlfLwkKqoqU/HUCCYYDwuHJzWkQGJK2WWHEqS/eO+0r8QjIVX5gi6y4wwvDUxtcbXJInVn/WIUenZuRXZ/tAcNBqBOcXS5/IPRgOzLVpAxKF4FooPzcTvJPrQ/IXMmAsj+5j4Mde7n23xNDcWLLErkVijI+s+V8XdVEaHx4qCK8ARnr6NlNZRLDalQD3WdxScP+qGr9CtpIKEz0Hxwz/vjXDdhMqJBB96hJB9u6fLrwdLq80KphqN4XbfUN9XEI5Ky8qGNT+gwDoMA8Rpz4ujXjIIy/TGkccR76sEUEVXmGkvAUCkM8a2N30SePo3IEilPmSlg1wZT7vOIyOgnPin6M5wvFSr5q/G+zZbQrgUlL0/6LRdaeu0PUV1jyLeEmYgV+SxRbb6rklJIMlRb7qqBhW6KzkrM7ze1L1MUz+M2QauMgRqVDLi7CWu7hsw7dFCyLXeO9pTV6Sut//dtNViobz/xyvlsPRrRca5N8iPbP9fbTE4l7Jf12IkeaR3Mt6QaXzLPDw13ZORi+ERmBnUsapPMdGxF/BaNq/25EauZW8ZzC+2SHer6V86sYlGndCgy8QkUvRuQ/Mr5JZLBnwDe8Fl9eyXGh8urv9RsLzlcUePEw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8ee6b5-eabc-4d5a-8d13-08d88d0657b4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 03:42:45.7363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4U/qOS8PyskusHIorQkwWnZEdJPO5BRUk+pI1V38ZW7+2lv3F843iz8oJqYedaxiVBgwLHqxTYCpGyjNOfJ1Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4717
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
Cc: devicetree@vger.kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-11-19 at 09:46 -0600, Rob Herring wrote:
> On Thu, 19 Nov 2020 17:22:18 +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qxp/qm Display Processing Unit.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 358 +++++++++++++++++++++
> >  1 file changed, 358 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:29:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
> ./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:69:111: [warning] line too long (111 > 110 characters) (line-length)
> ./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:70:111: [warning] line too long (111 > 110 characters) (line-length)
> ./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:71:111: [warning] line too long (112 > 110 characters) (line-length)
> ./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:72:111: [warning] line too long (112 > 110 characters) (line-length)
> ./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:73:111: [warning] line too long (111 > 110 characters) (line-length)
> ./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:74:111: [warning] line too long (111 > 110 characters) (line-length)
> ./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:75:111: [warning] line too long (112 > 110 characters) (line-length)
> ./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:76:111: [warning] line too long (112 > 110 characters) (line-length)

I'll fix the yamllint warnings in v2. Sorry.

> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.example.dts:85.33-34 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1364: dt_binding_check] Error 2

The dtschema/dtc errors in patch 1/8, 2/8 and 3/8 are caused by LPCG
clock patch dependence(the patch 2/5 in the below series) which I
should have noted:

https://www.spinics.net/lists/arm-kernel/msg856137.html

Regards,
Liu Ying

> 
> 
> See https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fpatch%2F1402850&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Ca608f971d3f746496dfd08d88ca25bd4%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637413976240971666%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=mj24M4wUVSa5vQmBaU5k6jHdmzL5R0JRNJ3tAqRiBLM%3D&amp;reserved=0
> 
> The base for the patch is generally the last rc1. Any dependencies
> should be noted.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
