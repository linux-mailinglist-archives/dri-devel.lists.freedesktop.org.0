Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFE517BB3D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 12:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA2B89D42;
	Fri,  6 Mar 2020 11:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50042.outbound.protection.outlook.com [40.107.5.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5691489D42
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 11:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YovSpe4EFfOj8RV/1eWsYDGAm6HOUtAL4zS9XlbmOyAfSm+uc0Tc07N9uWGa9KQYwMLzdjvTByj55WE9n5bWSQybeeXvloT42efSmGBOlHrmWmdU6fr5OwnxSV1/ngcsJbB8yfTME+UEn+xlIkUOCfmP5ErvHSmWBzNnGnPvDsDAcLRzi8tH3V1RxgWYoFGNfg/MomR/BuY/uBcxTC7ruSrG8FbCrNz0a5m/F6La+OMYYbIUwSZ9+kw8+jwKsw5PVx6nTfKvpJpUdhijy3n8f8Otpg6xdzPM2JMPHpWkFAJp/pCgHxlF+X3CwopdztVYO3IsW2CEIahaeEH4ckDN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hwjz+JxwPUJhmJSAaZkZECaVjiCTFHzNNwzbEVHIo4=;
 b=aXFsVJ5WBwbjoU4Fhzq1aU/x//UCCY1YlWfcFiQVwREnHNqpkdlf0jRfcMFzpJJCiZUuNgB/ovYe2oS49ilBUdDRJahRBE9YVb5YkseuCxCP60wMTg8rZQpiLdrSyfpYB9CGNE1yR+xVh+fkTQ48qiYDHAFcTi9eKJxdrxPdPu3ApafgMNJqTJpWVSAkUntGTiLBGuWWAYIJwLuUa5AuX1GEqWkasGP2BB0wpfiMqOS16ML+IaP1jfTckt5CGkuSRIgVUKII3mM3C5sGDmdP5OXvJA9LNIAZbvMWHnwRY3s0iELjVjNLB3xoVqeFjQ4iv9PX+rjaKWqvkoK+7FvWcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hwjz+JxwPUJhmJSAaZkZECaVjiCTFHzNNwzbEVHIo4=;
 b=DUZ5o+melXqOOCJJPqk12VQSU370Wvdx8L4riXR91Kz0BimH/kNzh4sYo7fY6/oLkb9dKYAouIfZgCDwUBgmLfAcDbtffLGK7AFD4Z23NtG+c/W3PNxuPRNSJ1N6PmgoayaDLrBE+C1lcppd6kiF75tDiLmz0mzNvWzIfUeAQYI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.palcu@oss.nxp.com; 
Received: from VI1PR04MB5775.eurprd04.prod.outlook.com (20.178.126.145) by
 VI1PR04MB4048.eurprd04.prod.outlook.com (52.133.14.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15; Fri, 6 Mar 2020 11:12:14 +0000
Received: from VI1PR04MB5775.eurprd04.prod.outlook.com
 ([fe80::8542:a5b7:a83:6ff1]) by VI1PR04MB5775.eurprd04.prod.outlook.com
 ([fe80::8542:a5b7:a83:6ff1%3]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 11:12:14 +0000
Date: Fri, 6 Mar 2020 13:12:10 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 2/4] drm/imx: Add initial support for DCSS on iMX8MQ
Message-ID: <20200306111210.q7fceoahqw3mlxog@fsr-ub1864-141>
References: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
 <1575625964-27102-3-git-send-email-laurentiu.palcu@nxp.com>
 <03b551925d079fcc151239afa735562332cfd557.camel@pengutronix.de>
 <20200306095830.sa5eig67phngr3fa@fsr-ub1864-141>
 <69903c69a95902c0ddc8fb9e7a6762abf28aa034.camel@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <69903c69a95902c0ddc8fb9e7a6762abf28aa034.camel@pengutronix.de>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM3PR07CA0107.eurprd07.prod.outlook.com
 (2603:10a6:207:7::17) To VI1PR04MB5775.eurprd04.prod.outlook.com
 (2603:10a6:803:e2::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (89.37.124.34) by
 AM3PR07CA0107.eurprd07.prod.outlook.com (2603:10a6:207:7::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.9 via Frontend Transport; Fri, 6 Mar 2020 11:12:12 +0000
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: daab01e8-e2dc-4474-b08a-08d7c1bf391e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4048:|VI1PR04MB4048:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB40487928479A71FBBCE98D41BEE30@VI1PR04MB4048.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(189003)(199004)(6496006)(2906002)(26005)(52116002)(81156014)(8676002)(9686003)(81166006)(186003)(66476007)(66946007)(5660300002)(66556008)(6916009)(86362001)(1076003)(8936002)(55016002)(16526019)(316002)(7416002)(478600001)(4326008)(33716001)(54906003)(44832011)(956004)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4048;
 H:VI1PR04MB5775.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uHhxRW8OFh/p1Ky+n7oHcm3BuCPsZ/bJfkrhpZz+P1SLrpeJ1y5Uhj+3gUEaq+4lgUA4oaeDN/Ig1POJSXhQA3l5CJyEDnb51eVidNbjeNKVy9Ahb81zAdXXCnSgSCFG/K+ES1CfCiLTBejwWPkWLdLsFYadmBwEgQ760VK4hFMx46rhthgqX2huZiSYAJ5sytdsZiKa+SjqE9E9N12DIJUj2sMvD6I2ya7B4ln2VFZBiQ0jhnmgQQd1rzbDWBlSNpNY1G+FsknJcDdUzh0TWWjsPFm9GGYI6SxNKt3DjfEGzdGddknFHMTR/o7vsSc1ATTqKCSb01U33alK8xlhZvlb1YlGE1vt229vb52OV4Pf47ZBuKp2tC7lQycy3YhS8Vp+fG3z4qzhIFqWjFnelqJ0Uo52QOJNPSPcIJ1RA0rEcLbZbF6tifji7BL1xKMa/Yr4Nt0Dd7RwqzbRMfL5fhHvbV8BgtH2AjkxKCWygCvO3rPm/Vn29q4lJZw4rw3/
X-MS-Exchange-AntiSpam-MessageData: sqE0XNL5N/ExwJb3T8PEeY9CkkvVa8g2TcrjVhqygFQclbdc9zFStiyy+LdCTYgjoRgP78s4kAVVLLHVc8zRy/0jpX0S3OayDvObJqpmYLodKE3PsF/rQGIHAHrpJGOM3N8ezZqGgppl6OSQ8/7/QA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daab01e8-e2dc-4474-b08a-08d7c1bf391e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 11:12:14.0039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06oszKkFTX0zQhDtWj2RpRMDytfD8Xvfo51YtJL+atzYqqif9JxvgYCk7imWNpd5KS3N5wAEQP5fq7KJEGJZqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4048
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

On Fri, Mar 06, 2020 at 11:20:51AM +0100, Philipp Zabel wrote:
> Hi Laurentiu,
> 
> On Fri, 2020-03-06 at 11:58 +0200, Laurentiu Palcu wrote:
> > On Wed, Feb 26, 2020 at 02:19:11PM +0100, Lucas Stach wrote:
> [...]
> > > > +/* This function will be called from interrupt context. */
> > > > +void dcss_scaler_write_sclctrl(struct dcss_scaler *scl)
> > > > +{
> > > > +	int chnum;
> > > > +
> > > > +	for (chnum = 0; chnum < 3; chnum++) {
> > > > +		struct dcss_scaler_ch *ch = &scl->ch[chnum];
> > > > +
> > > > +		if (ch->scaler_ctrl_chgd) {
> > > > +			dcss_ctxld_write_irqsafe(scl->ctxld, scl->ctx_id,
> > > > +						 ch->scaler_ctrl,
> > > > +						 ch->base_ofs +
> > > > +						 DCSS_SCALER_CTRL);
> > > 
> > > Why is this using the _irqsafe variant without any locking? Won't this
> > > lead to potential internal state corruption? dcss_ctxld_write is using
> > > the _irqsave locking variants, so it fine with being called from IRQ
> > > context.
> > 
> > This is only called from __dcss_ctxld_enable() which is already protected
> > by lock/unlock in dcss_ctxld_kick().
> 
> You could add a lockdep_assert_held() line to the top of this function
> to make it clear this depends on the lock being held.

Thanks for the suggestion. Will add a check.

Thanks,
laurentiu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
