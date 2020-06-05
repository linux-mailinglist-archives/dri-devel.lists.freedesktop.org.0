Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD71EF1EE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444CE6E866;
	Fri,  5 Jun 2020 07:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2094.outbound.protection.outlook.com [40.107.92.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550416E4B5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 02:36:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TB4lky3j1XqavK9fuP+xixYNIgoDDL+XPV02i12d9oRILfkc6X1pjlIKkJFRJ1czkwDdUrFYPOW5fL8v8AAX6SNPh2eCjwSjuvs+rbenrOg7BJdDIuDmaj/qQlw9cuc+8e2MnNxUjJcqDL+/R5mOCbsKLPoNV5zNg+zcyVJyPZ0gGsm4yMBSMMuxZ/P518hZPClhMc3kPGzVRhyiMK0VBMHrixnRsEllXcXpSWMP9xPotNFSTok1male55v0MRKEULJUFe4pioD1P9zNnjZd8OFw2wjc8DCoMUQWvwdj7/yA4XrFbEXRiZSRCPq1o5xRbUrwZnyfXKjAPtCEA/i9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inDzhN1/lkRJ3pvoLaRxYejowHX5F8i56ZZ5uIhGhtg=;
 b=BZHH2ud8A7T6xa/FztdhptZbO5prIgg0ALA3TvJ3dmelIU30zBzoWZSm1G4Jih/l26Lx+wVrzMsxMJPzbhZ4ddkKC+66LlMjtXAmBlmRT8GWxoPhhV33bo5gSt13P64ooLVuGxHf7efo1vnNdSwU5Z9QaP8Vx3Tgz3LmWG4yYxTFR55HJrQzZI8hG0XyiAL2R8n5tCcGazVw5CNEmxY34IY26XGzZL3dJOsGx9SUYGv2EyIMpyecsyfvS868qhc4EoySczrihsCzQOJPPQCOD+sthNNRIHZkp/rvYXlqf/VYIcIHRSABJm1AQ8IqyjD1GK39+qITP6S8j5uzzuKtwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inDzhN1/lkRJ3pvoLaRxYejowHX5F8i56ZZ5uIhGhtg=;
 b=dhDeTDU/F6FhZsunGgbH53Bh5p0cWh/5K+QV1Caq4pcSIYLfkUcNEJ/UtWpffsa6Ub17EVTosmRmU/5qwVVUJywasyvV9UTMn9Vw1WQ5Wi5vS+ScTPN/1pLmw4p/fBV6ihErcbb749CUTUM5LDUfocvDSECN1HeJ7U6cbg5rm20=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB7091.namprd04.prod.outlook.com (2603:10b6:a03:227::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 5 Jun
 2020 02:36:09 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b%7]) with mapi id 15.20.3066.018; Fri, 5 Jun 2020
 02:36:09 +0000
Date: Fri, 5 Jun 2020 10:36:01 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v12 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter DT schema
Message-ID: <20200605023601.GB5626@xin-VirtualBox>
References: <cover.1591253353.git.xji@analogixsemi.com>
 <eb82c52574bf41b5edad488e14c27cabad39b922.1591253353.git.xji@analogixsemi.com>
 <20200604222402.GA4153046@bogus>
Content-Disposition: inline
In-Reply-To: <20200604222402.GA4153046@bogus>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR04CA0067.apcprd04.prod.outlook.com
 (2603:1096:202:15::11) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR04CA0067.apcprd04.prod.outlook.com (2603:1096:202:15::11) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 02:36:08 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4703dd5-b970-4acf-e027-08d808f9347e
X-MS-TrafficTypeDiagnostic: BY5PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB7091F7053943814118071062C7860@BY5PR04MB7091.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vJozTt+g3JRn/UGIcPDakFkZsvDPjcjkXam9YKcZV0ZgjFg0rLLivQOtf0yYZDBx6pAupU/EcSh4BokuBnkq/NNxDxLwC/QJDmNzVrUpAeg7qjBPQySPropO648TYy2aERjq2o2Wy0Jo74AvcVoj4IPgRAF4DN/5MdjYMBTyHOcmzCQkTlFztSiXMyJLwZjbKJiMZZTiDgJIvI1d504C68gjtgMk03jIKz+pHmcykAsjuQCpH5OSE56mroEEy9Dg//xS+C4faOLYxTvTiW0uIhvTWnGF/vtnayCVhYp5s+dgCARjDHH6JTLTx1Ik5rgZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(396003)(346002)(39840400004)(366004)(1076003)(5660300002)(86362001)(7416002)(6916009)(316002)(2906002)(4326008)(55016002)(107886003)(66476007)(9686003)(66556008)(26005)(956004)(54906003)(186003)(6666004)(16526019)(52116002)(478600001)(33716001)(8676002)(8936002)(6496006)(33656002)(4744005)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: wZ5HRx1/sqajLeypY6RIonzXV6zRSqOiQHcg5sSGQ8+jDgiSLAJIuNVIawJHrLXOy017VFhwQleMVz9lo7/HD9P5daEiFctvC/gnx6HqUUP9HQoPG8o3oJXjM+Ko8Jsp1P9eFtjpfRv9t2LNrfPmUIFg2gzdBle/c3zEQFbtGpqjTjMHk/XNb4QYL2HShGqJuP2l5rxivIPd81dKTQd/CWKsipjc3pzXD4ofMl1jlQYif+5BbsclKwv7VUoeT1jx4s1hoVC28Cq+FAHzDN/w5+tnmnJwwtLhxhdvKijWE9iJTmkmtLGB8M8IRLxNwKBYzAfvFxWs1G/+UeTwYfAl58d5lWIH/8j381uuiV9IFpG+6XNs9jq/Thj2F/pgTiI0F6mTXpUHdVlLL1U1IjOx4I3xN9TRu6n2j5KLFEM5CsjdSIrHgQ7eaH4BvIvfbpz26b2WTK2SW4vkJxU/Or96L8R1NcK26CHta2uEqR5XphM53cz3MIwgioLrGRuMKCxM
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4703dd5-b970-4acf-e027-08d808f9347e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 02:36:09.5246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sl1GSCOwKjNjc0OcU2kYL+VIbiyLZFj77ynmYF2/YM2igwSl0ZBQgIF3vcu1dQThgNf6BmcbK/0Ud/ieDLlOCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7091
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:18:56 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 04, 2020 at 04:24:02PM -0600, Rob Herring wrote:
> On Thu, 04 Jun 2020 15:56:36 +0800, Xin Ji wrote:
> > anx7625: MIPI to DP transmitter DT schema
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../bindings/display/bridge/analogix,anx7625.yaml  | 95 ++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

Hi Rob Herring, thanks for your comment. I'll add tags in the next
versions.

Thanks,
Xin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
