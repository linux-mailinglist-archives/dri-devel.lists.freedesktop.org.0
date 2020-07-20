Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411FB226C7A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 18:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC9189C6E;
	Mon, 20 Jul 2020 16:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B2589C6E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 16:55:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eu5AZXhy8CiOuGHY5CXUAj4hQto3FxHz0KZQYHkExg8Xha6GnZQv22FuAP+kai5U6xFto/P6hakYZK8TViYUbBLFyhCrq7O2zgFTcsYWm/E+Z6cAgCh9SAmnkdnbTzev+oADnm2q3XNyQvIiczfboAGCgo4OH+zLTM0MKbTUrgsCOjYyD3jD5C5CRTtatMhO28SwPd25LRhYuCfrj0hsZO/iImW/dlDNvfO98GLnIXyUvhv+CimCAZd2iJu0DZmSa1S6y+Ks/4e99cDa/gZHm+mzTE5QdVzOu3z6VczIsJQeXcQbmtSMlsjhz6fPwmwaK3C3iiQPnsBP7M5g6jEahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DelM3/pjuO4Si8rqX3dy5uh5+5XXUCQdbUflbvJ+07A=;
 b=TGbrGADzI9O6HqMJ84ks5mp/qxdBdJjhuiUhpgBJKM+st6Ruh1CR5AYlQIoFkU+dGLkuKxEkVgAp0sJX25mm0i6KjOhOOTmMLZvQI+qA1+g/9bL1MnvCnhS7P2+j0GJMPQvzTeUKfzRTHV+/eUct3WRmGu6dw3FoV7JYBEYXOS+8SLx/fOxLTtKDQR2+VDvYP11VxD8NC2hfuLlanDp7cOWkbf7gtj8j/FfQWOOSzeB06ROKBlDUh8oduZ0l7Gm20i91eJG1Cn+4Ii712HDmCZDO9Oi41RA1zBNZWNjg9DrGICntsilZq7yyCHlVCU81czAK4zt0MGCaEPWGGoEuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DelM3/pjuO4Si8rqX3dy5uh5+5XXUCQdbUflbvJ+07A=;
 b=A0z6xpUwxI/O30fZV06MWrUW/gA1TdNVQdkvAXoMzIysR9elPYjcZE1e4DQmegyaDhqEZXMTrbjcnxJ5Dwtk8f13EmwgeTNI6LveJGVM0aVTwQosD6ApPy4LRRiJvBjHRL3Ih6qOVYrPIz0rMKLOcfe14VyNQquPQpjNhPk1Bnk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR0402MB2736.eurprd04.prod.outlook.com
 (2603:10a6:800:b1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24; Mon, 20 Jul
 2020 16:55:41 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3195.024; Mon, 20 Jul 2020
 16:55:41 +0000
Date: Mon, 20 Jul 2020 19:55:37 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 4/4] dt-bindings: display: imx: add bindings for DCSS
Message-ID: <20200720165537.kwlxwrtlmlijhuoh@fsr-ub1864-141>
References: <20200717144132.2206-1-laurentiu.palcu@oss.nxp.com>
 <20200717144132.2206-5-laurentiu.palcu@oss.nxp.com>
 <20200720164927.GA2650420@bogus>
Content-Disposition: inline
In-Reply-To: <20200720164927.GA2650420@bogus>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM3PR05CA0089.eurprd05.prod.outlook.com
 (2603:10a6:207:1::15) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM3PR05CA0089.eurprd05.prod.outlook.com (2603:10a6:207:1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.19 via Frontend Transport; Mon, 20 Jul 2020 16:55:39 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 31f90c2d-f735-460c-b71f-08d82ccdbc16
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2736:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB273677C3461D01EB1B85C7F3BE7B0@VI1PR0402MB2736.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ms6qWBxE5AiqsENu+F64WyJdJdV1bzMv3LnjER0uC21jBjNP7yRg0w6sR46GMVK0EhUZnj9CoHbu2f2at7d+cu6XS3dlAmP5UK4yW9TXtm/jD0ibliv0EKOjOk+wAVKwFEaTMMYZo8myB5b1fhxBztnfD9hrbGZqyT2zOPfQBuI0UFAaMk2mvGVy24raivJ2u8nlatzMGwTYw6/0QnjvVNzvXdhu26tB9rQ1NqMF1UmrfnEhPu3t+B2tnhsaP+UF31kpaxY/k68qPMc6ZN0JhtfehdB+qfsq64ARGPObG/NB9gxpCURN7bhHhgei9vyqjEIU4Q4bGT+damIkZ9tU5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(66476007)(66556008)(8676002)(44832011)(2906002)(6496006)(478600001)(9686003)(4326008)(186003)(8936002)(16526019)(26005)(66946007)(52116002)(55016002)(6916009)(5660300002)(4744005)(1076003)(33716001)(3716004)(7416002)(316002)(956004)(86362001)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gvfsB/lIxavmnB19EYLxajQqutyxGE1Aa+egv3RmqnlDd9GQEQ2jkQmaioqr3zfz8Te0UocIf2ghGva06XdiHjVU0SKItmz9WIkYEErg/P/EaDRlo6c0biXgJy+SlSGG7fINzot+FpdSD2qHuKAmv0ubFQmFsvAdwh39NwDQjHjbYKkd73VAfZ5eybowATsz0YeS42CKcIn2RUizcrulrhmMP/6Q1sNKHwdGXKdnSQLNycQcPXxMllPeH1fK8dRA6E2EsSWy/s+dwhinKWGydExXb1JuqaDcSj7b+XnK8NMTHJ9dNd2G0AdasrS/a2BCFU/NKxprJlLHBaPLQNR1q4C746YBOaonwO/73m5nePrcgOMdX1rvhbp/kV+o8hXuC8FFX10qyap3YRzjEXSWeBpFzCmmmqEYBh4yMfE3FNwM47Yxl+7vtcyzN2PdMATueeGDy80kx8RJty8ByTtpUG9Zf+8/vnVIaUThmkmpQk0=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f90c2d-f735-460c-b71f-08d82ccdbc16
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 16:55:41.0866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgoDyZJYNbodAx6FUmy2gKlK++2PEZTRFiwZdhE5I9WiughmWxId32xMdtf+Q1h1QLTqguiHssGHzJsGf0ctnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2736
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 lukas@mntmn.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Mon, Jul 20, 2020 at 10:49:27AM -0600, Rob Herring wrote:
> On Fri, 17 Jul 2020 17:41:29 +0300, Laurentiu Palcu wrote:
> > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > 
> > Add bindings for iMX8MQ Display Controller Subsystem.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > ---
> >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 104 ++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> > 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

Well, I kind of did exactly that... in the cover letter. I stated
clearly why this patch needs another look... :/

Thanks,
laurentiu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
